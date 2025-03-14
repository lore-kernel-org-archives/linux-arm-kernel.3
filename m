Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56303C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 02:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3EDLto5Fj+QyO1rc5OeVTSwga/F1rC5M7RFzWcpsACU=; b=jiyA+qUbEUluCCITt9EgBMybZR
	emq4e0hBQCNLtka0bVD94Rii6Xn+nqzpXHXdFhpl6EZHWnH9FWrTCpRjjdk5o9wUYc+9zA1DQ4KXx
	I1UH3u3tvDr+EUXij3VsILy94i4qTGpvnBSWUPmx35zvmzuECh3IAvgTct4emQFsH3V8SGcq33GWt
	hUqYXpdJJqGnpETpWFDeJDMri1AC06Cqb70ifT/u97DkHGiO4X6RnaU2h72DqQ9kr/Pq3GrUyRE9h
	8d1+IvHNWSbH0IpQw3NuwwYVCqWX1BfwhUgMJcj57lHoG4AFClnDiOqFbLGQHRiLpS7jEhd0vu+4g
	HTJMYgPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsuo1-0000000Cww0-3pJu;
	Fri, 14 Mar 2025 02:29:49 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsumM-0000000Cwj8-2Nmy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 02:28:07 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-549b116321aso1867433e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 19:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741919282; x=1742524082; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EDLto5Fj+QyO1rc5OeVTSwga/F1rC5M7RFzWcpsACU=;
        b=i9uPYlC0EX9Yg3mfSwOMVpX0G4yLOmHXOHi0qSE0bhOQuUMgn2ik3h/E2MhFmK9S/Q
         utV5w4v5E0YFdhWkFxdCmcqnA/YCI/+Je4DGKHqs4KJ4SsCzZUIig90l5l6SiiB4z8dS
         WHUxeHs64gEoujtJVd7q+OyJRANDpw5O/jhKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741919282; x=1742524082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3EDLto5Fj+QyO1rc5OeVTSwga/F1rC5M7RFzWcpsACU=;
        b=c1tftb5RTw5q1ilUY0Rge30RU/q3jQkl9ZfgZzExAIFp+EuVExisGehwFSUB7WfWI6
         VOqlQ2uELLzOKn47iTCRGiFTHm9thwEHx0MUmVSI1I+MHxINpR/Ve1QZmau9UyFY9ujl
         P/pSRbKScNroMxzQzcfbvaP2dI7iSBOjtswq3MyTEKWlNoVqqmTOqENs9lmfKc7ZpOIH
         v6/YTUkS6yqu53e/gkoU2Qonx6nBailVLnpLlWEmOavnftZ6JRKoLnTMru+hBuYj9MO7
         SjF37LkfS28dLe5uCXRl0fGQq57FnqO7oFoV2ah7s0CVaBwFnYFVZd54ZOGWsniud9hp
         RW0A==
X-Forwarded-Encrypted: i=1; AJvYcCUeIxgZslk0qJvUG7kVIn37CYSQr0nwNx2IEMETjvcdIxGtWJg2d9xYZkNSKlFbbCv8lDAip9x7AUFUBppQdHMu@lists.infradead.org
X-Gm-Message-State: AOJu0YyaXICVLtTsDHBIrwFmVHfEOHJp5IMiERQh+DwlBywiokpU1knC
	rQBgJH7howgLCYleEz/oVu5KXWps0NAEFDGmtTIQ9y0AZg06ea7xK3JKptbw7ji/xL7ZDD50KC5
	puA==
X-Gm-Gg: ASbGncsQBJG/RbcvXTSioljRAgnE/2YaiBiLOVXETN9ReG4MuqLl8wkIuqtRFV15q5V
	XxxTC/K4GaZo2DvdUKRv3KBXyl+ihBVP1UFjigg2I+9UwJMMxSDr/basamLJxcVVdCCIkZEHJrr
	jla7+2HdA58B/sz6I6EUuO6NHjkvJ/mt6QIZwAXN0VEDjcFB7UmaotOfulEw0MIoelzfBx9TtP/
	KnPRxwzGNm8FitE0yW4/K++KvSqAqKg1Ywtn/Gbsl5Odw+2kYEu5kYNucwD0f1YUP4uQjR/3AeU
	L7brI7Viut0/5NKzdioyXnSB6gget3Lqa/BgRkXCnIrRELc0t1FZnaoGdCBOAdZ2XQer41JLx2k
	+ciarvAr0MqD0TVs+uEkLNL8=
X-Google-Smtp-Source: AGHT+IFwPszUkFJKjgCWMdZZuVf8OA/utQ6/t2QfIVq7qFg31lLkAJCH/UgEsAzpsHqo7paQiQXNQw==
X-Received: by 2002:a05:6512:159a:b0:546:2f7a:38c4 with SMTP id 2adb3069b0e04-549c38e2ecfmr188994e87.13.1741919282065;
        Thu, 13 Mar 2025 19:28:02 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7a86c1sm389295e87.21.2025.03.13.19.28.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 19:28:00 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30762598511so17022921fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 19:28:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUEX1lVBmNCiX8+kMqHgrC8lpAtMs6oWXkluFXQo2ooM2nSVSWm0M0cg5DVwnHBsVPekQKk6EFA8QWhUntM9tor@lists.infradead.org
X-Received: by 2002:a05:6512:3b90:b0:549:c1e6:cbb9 with SMTP id
 2adb3069b0e04-549c38d07bemr214129e87.9.1741919280219; Thu, 13 Mar 2025
 19:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250310104114.2608063-1-damon.ding@rock-chips.com> <20250310104114.2608063-7-damon.ding@rock-chips.com>
In-Reply-To: <20250310104114.2608063-7-damon.ding@rock-chips.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 13 Mar 2025 19:27:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V0Q5v6hcEFJqMfhCSQ80ki5SQRmrXvyeGCOQiFsXc28A@mail.gmail.com>
X-Gm-Features: AQ5f1Jpkp3eXwx7hKjmZ3N01Nrt914JFcQlKc2Ek2r-3Xhw1Wi6nZVzuUBUzhgE
Message-ID: <CAD=FV=V0Q5v6hcEFJqMfhCSQ80ki5SQRmrXvyeGCOQiFsXc28A@mail.gmail.com>
Subject: Re: [PATCH v8 06/13] drm/bridge: analogix_dp: Add support to get
 panel from the DP AUX bus
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, andy.yan@rock-chips.com, hjc@rock-chips.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, dmitry.baryshkov@linaro.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, 
	boris.brezillon@collabora.com, l.stach@pengutronix.de, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_192806_599751_E330DF55 
X-CRM114-Status: GOOD (  17.68  )
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

Hi,

On Mon, Mar 10, 2025 at 3:42=E2=80=AFAM Damon Ding <damon.ding@rock-chips.c=
om> wrote:
>
> The main modification is moving the DP AUX initialization from function
> analogix_dp_bind() to analogix_dp_probe(). In order to get the EDID of
> eDP panel during probing, it is also needed to advance PM operations to
> ensure that eDP controller and phy are prepared for AUX transmission.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>
> ---
>
> Changes in v4:
> - Use done_probing() to call drm_of_find_panel_or_bridge() and
>   component_add() when getting panel from the DP AUX bus
>
> Changes in v5:
> - Advance PM operations to make eDP AUX work well
>
> Changes in v6:
> - Use devm_pm_runtime_enable() instead of devm_add_action_or_reset()
> - Add a new function analogix_dp_remove() to ensure symmetry for PM
>   operations
>
> Changes in v7:
> - Fix the misspelling of word 'operations' in commit message
> - Remove the check related to CONFIG_PM
> - Remove the unnecessary call to pm_runtime_dont_use_autosuspend() if
>   devm_pm_runtime_enable() fails
> - Remove unnecessary function analogix_dp_remove()
> - Add new function analogix_dpaux_wait_hpd_asserted()
>
> Changes in v8:
> - Move the addition of the analogix_dpaux_wait_hpd_asserted() to the
>   other patch
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 20 ++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

