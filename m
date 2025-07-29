Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D90C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 07:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybx9ZEB7Knt4sq4h7VniyBzicrS5wNfctmysoMkVU7g=; b=mQiIndjJrCZNgGBMCfIDnHXzTS
	RIT/fnxqZsf+Qx2yBzzT1Tty4xQQI6LmVZLgGyNBlnUclmzL88D4Y/TeLNdHXIHWYJnQKC73aE621
	2wXYYyNKcXmIlw+/VeBgvV2m1TJgiHBWGMyR5H0NDPKcloQoYnI84h/YzjG0J/Nfmsbg5nE0zs/xw
	A21c+imuTeEGKg0stigd1rhUrn4MpjNS3b5XPQXkov8aiJnfCQzhmTQR7yUBVrX8DshvcXmZuBMi2
	e3qjZNoXxLBoW3juR2Mf5gpmToxYGT5LRBoxaCKnJjhp+6Pil13wEGbuKkyXOJBUX4QmVrGHTePKm
	6aW7QZdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugewy-0000000G92F-1Jak;
	Tue, 29 Jul 2025 07:40:40 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugesf-0000000G8aM-0TYC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 07:36:14 +0000
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-87f234ba1abso1103628241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 00:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753774572; x=1754379372; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybx9ZEB7Knt4sq4h7VniyBzicrS5wNfctmysoMkVU7g=;
        b=QhJD/7NDITDykIVB6w7Y4WGAp29IGOgxMN0+Lu484Y20Q0dQ86XNFX2r4Hau1K42aG
         V3HyrqMmvnhXr03COghNpSlMwcWYR3mR5+SZYu9qggaQ2QpJBBVp2HFBKzgufVlf1lJV
         UkK1ifaLjpE2GhQnahNkBgwBdmKzgFJsAK4dTE4/pcFtO7+zt7fzd7uPUS5rqr5OXlq3
         XhKf8ICsMZKHOPWQzjiDF33ujOlEsMbKNi//hJ2KJTtW4Jn5rSAWAWf08mUrn6P24w15
         7GmBEnQ+TbgZZtKecGvQP8HjZLsS1LuyW0VcjsdBm0PBLZUgmUkQASFVhKpHhEW0/OoW
         xXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753774572; x=1754379372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ybx9ZEB7Knt4sq4h7VniyBzicrS5wNfctmysoMkVU7g=;
        b=KFOnnNk9SMgrj++S10gJ3gJUc2wdQc7aeO21jLBi+geKhfZWyda8vkIo8K7wgI8wz1
         mlfD0s6CFj4gtOHcvGqSfiMqVEhVBvv5C5YT+RDaFGDxU4XyQzvEz0oRh2aXficN6syZ
         MPlLXtw4th3L2H651Ac/ftwdtPDoFIIweR2iOFjh/IWUmm8X/ctTBFSXuxVRI7k4iS9o
         OL02/KCOeAM8YemT5wW3ku/0Z1S5y2rg948Vx2e0G325PdjlVj+O2FrDsHex2mXoZySO
         ZvPni+f9nI8zAFv27ssqz/aSb6k/XKEbRBupV83ueb/dBvXgPtd+iD5trLmq2ZJ0RxrB
         X5Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXHM1qQ5dGYcc9+VCY9vYeDYj4dJmy3PNY2U6dXJD3PIqX6+4XEKEpweiljDWNjRcgdtS38YKWb/16NmkEzrqD/@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo7Gcq5HLSbUM8li+0FwOdXUAAVHdxivaWk50KRuFJzBwVO9L9
	NhW4l3bxkKGJfoIKYHe6W1RP/xJi31ZhrdvbzhMSFgBi3aP0D5izmeHPz7k/Jd/aNFnefVK0qLU
	MlNGUOCVGJ5pc1nvExG4xjpR351HC6EQ=
X-Gm-Gg: ASbGncsKpIY4+3xnlROh33RJ0CAbulls2go3CWuVVhtcRjfB7zVBpGSX+0a50ypU7cM
	mVRmHNPHSEAhIAUUPuGx161v7etjPccHBpWJfyYgfOQIkRtJxeMMNoKLxoGyxs+CvfQx+Xvo+T6
	JjmlveKCrlIIkZWkoA6wH9wfOGCxQXdpUhcdBNynmyO3bbANw+5vEbbqHFmgiR98MXfYBYlVTch
	l4Q3g==
X-Google-Smtp-Source: AGHT+IENH2AW1ZXDnTlpVuHy58DEAA8L0hmQ3yc6dY3oxN1NrLrIl4BCIubHSKcHLtCqUNYVz4YtdWuKh0KtO3j5xGY=
X-Received: by 2002:a05:6102:3053:b0:4e9:add0:2816 with SMTP id
 ada2fe7eead31-4fa3fc4c5b4mr5102345137.5.1753774572016; Tue, 29 Jul 2025
 00:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
In-Reply-To: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 29 Jul 2025 16:35:29 +0900
X-Gm-Features: Ac12FXzR2-3ASwmrKN7QegXsTXtT3Y5L39TTtfej0LBVwYdqfV-4142nEMemsSM
Message-ID: <CAAQKjZP12LZPHcPo1ztvKq6Vts=Mp0o5NyJfdCZZoMB633wynQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/13] Support for Exynos7870 DSIM bridge
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_003613_217781_E36CBF84 
X-CRM114-Status: GOOD (  20.74  )
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

Hi Kaustabh Chakraborty,

2025=EB=85=84 7=EC=9B=94 7=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 3:26, Ka=
ustabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> This patch series introduces a lot of changes to the existing DSIM
> bridge driver, by introdcing new registers and making register offsets
> configurable for different SoCs. These preliminary changes are followed
> by the introduction of support for Exynos7870's DSIM IP block.
>
> Work is heavily inspired and only possible due to Samsung's vendor
> kernel sources. Testing has been done with Samsung Galaxy J7 Prime
> (samsung-on7xelte), Samsung Galaxy A2 Core (samsung-a2corelte), and
> Samsung Galaxy J6 (samsung-j6lte), all with DSI video mode panels.

Patches 1 through 12 have been merged into the exynos-drm-misc-next branch.
- Patch 9 was merged as-is. If you decide to accept my suggestion and
submit a revised version later, I will apply it on top of the existing
patch.
- Patch 10 was also merged without modification. Although it includes
a behavioral change (removal of the fallback to pll_clk), I don=E2=80=99t
foresee any issues. If any problems arise, I=E2=80=99ll revert it.

And patch 13 has been merged into the exynos-drm-next branch.

Thanks,
Inki Dae

>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> Changes in v3:
> - support both legacy STATUS and LINK_STATUS & DPHY_STATUS split (daeinki=
)
> - Link to v2: https://lore.kernel.org/r/20250627-exynos7870-dsim-v2-0-143=
3b67378d3@disroot.org
>
> Changes in v2:
> - added commit to isolate clock names for each variant
> - replaced clock names with generic ones (krzk)
> - added maxItems to clocks property in dtschema (krzk)
> - Link to v1: https://lore.kernel.org/r/20250612-exynos7870-dsim-v1-0-1a3=
30bca89df@disroot.org
>
> ---
> Kaustabh Chakraborty (13):
>       drm/bridge: samsung-dsim: support separate LINK and DPHY status reg=
isters
>       drm/bridge: samsung-dsim: add SFRCTRL register
>       drm/bridge: samsung-dsim: add flag to control header FIFO wait
>       drm/bridge: samsung-dsim: allow configuring bits and offsets of CLK=
CTRL register
>       drm/bridge: samsung-dsim: allow configuring the MAIN_VSA offset
>       drm/bridge: samsung-dsim: allow configuring the VIDEO_MODE bit
>       drm/bridge: samsung-dsim: allow configuring PLL_M and PLL_S offsets
>       drm/bridge: samsung-dsim: allow configuring the PLL_STABLE bit
>       drm/bridge: samsung-dsim: increase timeout value for PLL_STABLE
>       drm/bridge: samsung-dsim: add ability to define clock names for eve=
ry variant
>       dt-bindings: samsung,mipi-dsim: document exynos7870 DSIM compatible
>       drm/bridge: samsung-dsim: add driver support for exynos7870 DSIM br=
idge
>       drm/exynos: dsi: add support for exynos7870
>
>  .../bindings/display/bridge/samsung,mipi-dsim.yaml |  27 ++
>  drivers/gpu/drm/bridge/samsung-dsim.c              | 353 +++++++++++++++=
+-----
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c            |   9 +
>  include/drm/bridge/samsung-dsim.h                  |  16 +-
>  4 files changed, 317 insertions(+), 88 deletions(-)
> ---
> base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
> change-id: 20250523-exynos7870-dsim-f29d6eafca52
>
> Best regards,
> --
> Kaustabh Chakraborty <kauschluss@disroot.org>
>
>

