Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA36CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 07:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vk4uw/k5t/ngjT55OkWyZFL8hHut4oedMZiTZnhFuY=; b=RjXLXGT5prdXfJ/F+QLsxho1dE
	vdv6xASojyPJ/sqCPlwX/0Rw951WJ2XxVsfpGipF+k9G4K9Bbpn39OL1rfDu9YMQA+u7ZVNfsHs1S
	tkF9WoND0r1pIaOqYVJ77AN3Z/JEeAd2Pe9YI1gQiZeuwzWr2mQfSeAJsnTzR6fu6+mHGTXaFhvLY
	Cty75O/e/le4IEnHEmAOI27eCuXvNqKr1u3y4kiyuledN9pS8IY8FHMi3PbESLadH6IO41a81lWBg
	lcNr6SWZKc8Jb3NaxXeejFBQv+QgMEpOjuomaA+O+5STTYVHU3+9atI1i/qo9/lB80TNNTQqOf+jd
	rrxn7tcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usG7y-00000007Y8B-11Xa;
	Sat, 30 Aug 2025 07:35:58 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usG2v-00000007XYx-3574
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 07:30:46 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4b31201d331so16598981cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 00:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1756539044; x=1757143844; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3vk4uw/k5t/ngjT55OkWyZFL8hHut4oedMZiTZnhFuY=;
        b=YddbWPtmVW5oAqwHlcZpV1koAbCGvnH1Iw9kndbj9toS5KQAcV9ArUeoqcMtZcCry/
         ONqUr42K8LFUEy0ISAULJ3RlMkznB8bynFxGhDPxyDYt2ByzFXo8ni+BWSNwM391jRkw
         9fGDwBBc2pOT6ddimFaQUAldysSAsM4dSmiZensZYsR8ju4GiGfTNNNlHLJVdrf88tca
         gpQzReXn8O7DSx2Pwtnws8riA/cRDpRfO+zPexVle1Cxn2zGY+6YDa1NSUQRjRRVu3px
         k4hYdOsKnCFzRXtgk/pqfKLi96HYUy71pycZw1FwMSoYhqxpmrjUbMO1x1Q9/WjZ4K76
         WnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756539044; x=1757143844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3vk4uw/k5t/ngjT55OkWyZFL8hHut4oedMZiTZnhFuY=;
        b=ZufvgXtp0SMt6o7JUlvZk19mvQQNb5DVFXN9VN/YWR7cSnfhWKqfsrbecIzKMALp6P
         cGEmc1v4HKAuc0b1tX3x2h8oTGdmIUosRIU5GPJSdqqXqakgWyvTmX1f9AuVJX932dSP
         r93ks7zEpVm8Bn7+d62rrgdoN/akum/aMwTxVnGte2B2Kdi90bjSqjPr1FFfXkfKFeq8
         oFzujEYSmFHRL0Zf9QEJ2cqWADMPJTsSNNl6oqboiu6+enhoL8o7HZdR+MWhkmbiLoL2
         1/CldgzmZYgj7iBvyy2wQpDvqDIwf90nHvqwQOyCVmEKowTfo5Ra3Q0vXJYHwM75b00I
         oi3A==
X-Forwarded-Encrypted: i=1; AJvYcCXwsnHVuJVf1rr6ia8ETePgyB3QdnPdyTLG9ETkIYl2m52+sS9bK3RXb2Ga5AXEcsQPgwBDrZTFrCEngsPRc9yU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7vF/gNwsSk3KZ/C+DdWww6DmaVunhkofWcqpbChaj/gjiYsEK
	SJmDmT+1CA3FHSPyEG+Z3gOkDzXN4FKq2C1gNQlAR3yhLH7cg3QPrbuKtR2wHrKJyhSDLuHFk0D
	6UPlgScCuY11pfYhT4HW6AuMErOSDdnaE2vbr5RxXYQ==
X-Gm-Gg: ASbGncuXO16mHtHO+oFELyuu+4xryyLAS3u0T5uKW6TwhOT3iGaIYN74J0T0GDY3Z5V
	28mZMctwl0EiFjwneYMghpjgqLL+dXpoqSa5x7OA5/+BwEHImKzDgWwtPXnSL8zRA9YOdxPcoVi
	pwPuVaNpTZvTEX8OICw7xflhdWP6YdB0KQENt+l+YkKO4rluCTra2/zZHknQ8oRI6aUVkzMpM6R
	akvTQ==
X-Google-Smtp-Source: AGHT+IGOnM65THr0nrJ2LPLTiMMlk+HvsXaVUyczPlRtZjJ7WLdbodWtVaS7JfPnD9Na2PcQiHxYrYNu+VnO9BqbaFo=
X-Received: by 2002:a05:622a:1448:b0:4b1:103b:b67a with SMTP id
 d75a77b69052e-4b31b9c3777mr22814681cf.32.1756539044617; Sat, 30 Aug 2025
 00:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com> <20250830-drm-limit-infoframes-v3-5-32fcbec4634e@oss.qualcomm.com>
In-Reply-To: <20250830-drm-limit-infoframes-v3-5-32fcbec4634e@oss.qualcomm.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 30 Aug 2025 09:30:33 +0200
X-Gm-Features: Ac12FXzpE91ILUTwZS_ZwZMq6UoPhvxeYv_akLo7dKmrA-yDSe19rsUZejc4hcM
Message-ID: <CAPj87rPSqJoJnUoP11qzWXuqvYPb_=vP-5-p7SEVA6JCfcYCuA@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] drm/bridge: synopsys/dw-hdmi-qp: declare
 supported infoframes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Liu Ying <victor.liu@nxp.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_003045_778334_86A94AC0 
X-CRM114-Status: UNSURE (   7.20  )
X-CRM114-Notice: Please train this message.
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

On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> Declare which infoframes are supported via the .hdmi_write_infoframe()
> interface.

Reviewed-by: Daniel Stone <daniels@collabora.com>

