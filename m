Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1449FCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 16:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5TVB0JF51SZtYqzdiOCW6IylhkwcFhWMNKiMPXUv89E=; b=Q6305l/ZtyzIGrB46V6rzy4vyy
	cfu8/38sJgOM7N5SPuaeRr/KzKDxB2XQqmdbiD7e7rv/o/wQi77GxHxNDA0KrxQP01Fj9gMYEVz3n
	iL18/EgbRVC4BOoNO1sifWFnOJHc82MjH0wXVPbTXNRRoL/TSlpBICfD0RENEWDx/2CD2FFyqR5DG
	XsUTgytnW9ayjuC/BuNQVBLhoPfXcrhWQNIEVPF2JYuqRwNdDWVgeniWxnkVGcVWcily/qJI/1x+j
	O+Ac2l5/NhNhXt3Tjl0ElSlrlXLZIdLUUY1pYepm7VW8Hed3sIsphuJXxp+XaIWPr5gSfwR9RcEy2
	ToqO2w6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v94Rh-00000002IaL-3oWY;
	Wed, 15 Oct 2025 16:33:49 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v94Rf-00000002IYW-0McQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 16:33:49 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-8572d7b2457so233575385a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 09:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1760546025; x=1761150825; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TVB0JF51SZtYqzdiOCW6IylhkwcFhWMNKiMPXUv89E=;
        b=iYDGAwhkK1qT0eRh1RrGu5VrtcfA9aJ/IwDYm5QaA5O/dY9jrJ+DdXYQd7mLNS8MfK
         eJyW/98MBT7cVeiUI7khPUjQwr43r0Ik9EqPM6z10Wn/QNxgWDuOscPmgqWPUX4+8fN8
         vta8g35LgiksLjNdYYXDcR58nNAkpkteRtirRhdmZYVRxT95kZhR94Kj9qLHiwbO9GBf
         08+QM5WAObwN5KNjEVjiXkAofSIME07akWl30B6rLjL3O47mXnKEAPdgd8WnvNZrceL4
         zrkHJFAdHqzup51LvAz8kiLgj5BOPFln4pUadOw0AHZyUzENKVR7ud8xSxqJRp3QtGqQ
         XkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760546025; x=1761150825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TVB0JF51SZtYqzdiOCW6IylhkwcFhWMNKiMPXUv89E=;
        b=tvIbAcBP/XOAOaLeNobUma5+GBVQls6v1fYecqRoHMlOZ/+rTsXHRVH7EPGLr/53Ij
         +cz4YlpW0StNoHlDUs5sfX0QXLngzDKXYITHTca863YKg7bTk1/qt2vfFbhqCMF192Zm
         1ZImoOkZmoMdkHQI3GzMkgLYCPJaj2zRB6y4JjLFh72S47bP7F3rP/teWWOIaVzzjvjM
         UHcGkrgYno67y8loR1nm4grOTz5CTNJ5QupnIrYg0maJieyLFWEwX8wYquWEnsplrGwB
         uVvg6PuFmwuqXorhLFI0A0+9IKyA7+AxMevmMb09WQbbX4P6EMamkZxt2Efkf+OGO1VV
         kxTA==
X-Forwarded-Encrypted: i=1; AJvYcCWc2bUd6Tt1x9a4rlznhRT22/ZHMOvz+R0Dfi9wW9ZV0VdeM8vGaYcKYi+5UGva6j+rznX2v5EcX0vu2m5Psv5P@lists.infradead.org
X-Gm-Message-State: AOJu0YzbnS1WRSVvRkLvgjRkJXfyTCJKLEbW01lfUyq5lOppSKnFBTtY
	fMk7BppKtmS02Olqk3WtxjDOVnOZPku5NItAKo49WH9WiiJNMYdziaSYDt9FNjOpHspOo3+TKLN
	xlVh+oh2B89S7Ag26nvbjNvnmn2H86jKcL9QpbWTWrg==
X-Gm-Gg: ASbGncsjDstYrlptHUHtK2ktmqN7KECCqW+LQ9h90fprxce6dMcZ3sb3CGIcTs29MW+
	b7OfgkKqzOzkvbz1cffyPZPMj1+sQDo3OQ/p2gPd1M918hdktkg6ibc3dxgOs/n4Vr8JokpeHQc
	SkVWfHXdQs4qkcFvyWG0AD2qBnaPgQQ8oyCuLDvfLzQ58YQEiXUJ/5Z5CXVeS+uFevaoIpdXqmI
	QjtQ+JJ9eNPrWDrOKukN1o=
X-Google-Smtp-Source: AGHT+IEWLzmTAJuFvcRpHnhLL3oSxt5DVoapSEF3DOsu9jpTcS07RnjUwC01/MbeqWj+sQer43+GACQfNyCtsVTrhDM=
X-Received: by 2002:a05:620a:17a5:b0:827:937c:2c2e with SMTP id
 af79cd13be357-88f11537a62mr99337985a.30.1760546025481; Wed, 15 Oct 2025
 09:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
 <20250903-rk3588-hdmi-cec-v4-2-fa25163c4b08@collabora.com> <2753758.X9hSmTKtgW@diego>
In-Reply-To: <2753758.X9hSmTKtgW@diego>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 15 Oct 2025 17:33:34 +0100
X-Gm-Features: AS18NWCJkFE5KF2FTR_JnzlOKDLW2oUBf1S94gJ5rVRW2DgSbekEAuXHzCMSdZw
Message-ID: <CAPj87rPqNw8BH7FCEAQONZWxTY+eUAE9DeWVTyJoTbN7mv=RfA@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] drm/bridge: dw-hdmi-qp: Fixup timer base setup
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_093347_226528_FB3FA2CA 
X-CRM114-Status: GOOD (  15.46  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, 15 Oct 2025 at 16:44, Heiko St=C3=BCbner <heiko@sntech.de> wrote:
> Am Mittwoch, 3. September 2025, 20:51:00 Mitteleurop=C3=A4ische Sommerzei=
t schrieb Cristian Ciocaltea:
> > Currently the TIMER_BASE_CONFIG0 register gets initialized to a fixed
> > value as initially found in vendor driver code supporting the RK3588
> > SoC.  As a matter of fact the value matches the rate of the HDMI TX
> > reference clock, which is roughly 428.57 MHz.
> >
> > However, on RK3576 SoC that rate is slightly lower, i.e. 396.00 MHz, an=
d
> > the incorrect register configuration breaks CEC functionality.
> >
> > Set the timer base according to the actual reference clock rate that
> > shall be provided by the platform driver.  Otherwise fallback to the
> > vendor default.
> >
> > While at it, also drop the unnecessary empty lines in
> > dw_hdmi_qp_init_hw().
> >
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>
> This _does_ look ok to me, but as that touches the main bridge, could
> we get a 2nd set of eyes?

Sure can.

Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel

