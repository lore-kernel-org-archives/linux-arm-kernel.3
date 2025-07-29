Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28C4C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 03:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QeyQgL4zAM9urQ/V2LLVC5jrotO1A696xW4MrH9cKZw=; b=KottQ/mLCcD8WMIEZ16huX7Gh9
	tbmt3JWtB+9sY/gFFdP71zleoSOkYq4EVDEMDaaL/xyYTWz2yJiAJmheMUKy9vHiApWYMguhF4+bQ
	DzCZf1+Yc+tT3eeMSlyvjW0GY9dsH9IJ0TtJ/gTMxop0bkoZ84fHSogZfz+lFRulmmpZcytJ+rJ2k
	VGfDrSV8XGV3BcGFRJ+IScwUQ6kTdt48d/0l1EZVM9li4mbqRqPhxzyr4Ad6yg4paP8JalHsOSW7Q
	OXcuf09aza5vG+KvsLGvazy55Cqpdd7QjXnRh+zQU5k/SjsxSyFGg4MF+u3GcO+0nmyh9FmwK6SAD
	Yye/gfeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugbTu-0000000Fs1s-1na3;
	Tue, 29 Jul 2025 03:58:26 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugbRQ-0000000Frvh-2jiC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 03:55:53 +0000
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-88bbcf89e71so352136241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 20:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753761351; x=1754366151; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeyQgL4zAM9urQ/V2LLVC5jrotO1A696xW4MrH9cKZw=;
        b=NyRDqBVd4k8hKh2jlLcpNc2YPm5B+nmF1B+xEuxQMt5pucw3mHCujpD2z8TJmhvi+k
         yy31NGBEXDnWDtD/3xPEWeh5WtvSwj8uOOVSVVeotQ5MJXRPrmyp3jGTevkJg9Z+Kxma
         xgdH/8Ub2UgES8XyKznPubhhrP/RYARRuYpfJJzSLGTrmC+rvltMdByR/0xzEqKY831Q
         4JYU9viC8+jAVbZUr/wWAXSlWKhpjjo5teeNrwk/9P2motV1SqjANnmgJzq5yGQZuyWT
         HZagTngUmGXWGQ+g0m5U07Er33C8Ln4mbDV59LoNj10p8AffbJvvuLUimwMbKhClQW+P
         sXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753761351; x=1754366151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QeyQgL4zAM9urQ/V2LLVC5jrotO1A696xW4MrH9cKZw=;
        b=UJ4R9xJNGZDFyguR+XkUSJpv1ghYrpBl8PoEkv+sX9eHViDjuvxZ9HZ+u9HyOYTj6q
         vHpZZwOhs2z2QUH/D1RhqfWMZTvMEz3c07QceZ0dyzRR/06kA4h5twAQqoSN7S0lHKXD
         TfPA0NRs9EtEe4jRLvyGnoe8lzzP3iG1eCvsbZX1LKqgW27SJYOP7jMzoklJDXe6Hyrr
         wf76D2944ZS48ZE6giPfdWx2Jy14V9JLACkocGLbdBbCiknvlMBtmnQOg0eku14w3L1/
         K6OzYcXMxI8W9Vbr3JVjqpQ11d+rI/UbVWjPdpf77puyGDcOy2S21F1inv0KZzaJK4RJ
         ZVnA==
X-Forwarded-Encrypted: i=1; AJvYcCUuxtTw8MaKvW6bYCuvjh+C8BSntJD4ThiiQhyO2kkcluXizmSeGd3ELKcLCTdYBzVeSr/BqUldG1i7DMDSXcFF@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+RxUZLShAr2BVzCQ3+zV5CVenDP+yquLo3RFLRUvcu2ol1fgZ
	fQukTg7CknU5K40e7f0rXwHmvpgUQigv9mTaNfaqINnZOC7CBho0YfmuhMoqPhNo2nG4JVTj8jT
	SSwbuV0h3TwlwEjEhq+FfVrd+BZdAFKk=
X-Gm-Gg: ASbGncvwzUMUQ0i6rTPtF3SMnlWvQfpJGdqtrZFRd5Yv5koYihffQzrudXyte/12u4r
	q5l01oeG6wEiuwnH+lweUt3AuGypC9/MZdu7A4TjIUZL8QDf7Vv7BWecpq61ioyw0dPFMKNWAvk
	txLs0Fe1p/6n1KLJTWfR1iTaEECgdPOI+pLKUMCrgXms0X/ufMwEiIrRGILwcxo6xJcXFvnjCx4
	to2mQ==
X-Google-Smtp-Source: AGHT+IG2mKzTaoyQhIzvXEq6IUJ/Cn1eY9r2poRKFBunLtB0fjLDRJGBG8ErMCT2vRGzzaUM0D1HViC2dX+iwTNt2js=
X-Received: by 2002:a05:6102:6885:b0:4e9:b793:1977 with SMTP id
 ada2fe7eead31-4fa3f6f2a22mr6292838137.0.1753761351455; Mon, 28 Jul 2025
 20:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org> <20250706-exynos7870-dsim-v3-3-9879fb9a644d@disroot.org>
In-Reply-To: <20250706-exynos7870-dsim-v3-3-9879fb9a644d@disroot.org>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 29 Jul 2025 12:55:09 +0900
X-Gm-Features: Ac12FXwWbP8lV4QH9kqWdIB3oIAGkUWrt4c9ZYSOynqYZlW4YQIBN8DquJzuVJI
Message-ID: <CAAQKjZPNh=r5xf7X_R58VhuKz61vVGO83Oe9KsA1m_nJ1OuMLA@mail.gmail.com>
Subject: Re: [PATCH v3 03/13] drm/bridge: samsung-dsim: add flag to control
 header FIFO wait
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
X-CRM114-CacheID: sfid-20250728_205552_754222_E035B123 
X-CRM114-Status: GOOD (  23.62  )
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

2025=EB=85=84 7=EC=9B=94 7=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 3:26, Ka=
ustabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> Exynos7870's DSIM device doesn't require waiting for the header FIFO
> during a MIPI DSI transfer. Add a flag in the driver data in order to
> control said behavior.

I will merge this patch as-is and just sharing the following comments
purely for reference (for other Exynos DRM contributors).

This patch likely needs follow-up improvements in conjunction with
Marek=E2=80=99s earlier patch (commit-id:
15f389da11257b806da75a070cfa41ca0cc15aae). I=E2=80=99m unable to verify thi=
s
at the moment because the SoC Technical Reference Manual (TRM)
documentation I have is incomplete.

Based on these two patches, we should plan for future code
improvements that account for two scenarios:

- The header FIFO must be waited for.
- The header FIFO does not need to be waited for.

Currently, this is handled via driver data using the
has_broken_fifoctrl_emptyhdr and wait_for_hdr_fifo flags. If the
handling of this behavior changes in newer Exynos SoCs, this approach
may become confusing or lead to inconsistencies.

Thanks,
Inki Dae

>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 15 ++++++++++++---
>  include/drm/bridge/samsung-dsim.h     |  1 +
>  2 files changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index dca3939dd99fa07aee309067b93e652bc9a9b78f..84af24171b6856cbcf95b9077=
b997ee587fc0409 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -418,6 +418,7 @@ static const struct samsung_dsim_driver_data exynos3_=
dsi_driver_data =3D {
>         .has_clklane_stop =3D 1,
>         .num_clks =3D 2,
>         .max_freq =3D 1000,
> +       .wait_for_hdr_fifo =3D 1,
>         .wait_for_reset =3D 1,
>         .num_bits_resol =3D 11,
>         .pll_p_offset =3D 13,
> @@ -438,6 +439,7 @@ static const struct samsung_dsim_driver_data exynos4_=
dsi_driver_data =3D {
>         .has_clklane_stop =3D 1,
>         .num_clks =3D 2,
>         .max_freq =3D 1000,
> +       .wait_for_hdr_fifo =3D 1,
>         .wait_for_reset =3D 1,
>         .num_bits_resol =3D 11,
>         .pll_p_offset =3D 13,
> @@ -456,6 +458,7 @@ static const struct samsung_dsim_driver_data exynos5_=
dsi_driver_data =3D {
>         .has_legacy_status_reg =3D 1,
>         .num_clks =3D 2,
>         .max_freq =3D 1000,
> +       .wait_for_hdr_fifo =3D 1,
>         .wait_for_reset =3D 1,
>         .num_bits_resol =3D 11,
>         .pll_p_offset =3D 13,
> @@ -474,6 +477,7 @@ static const struct samsung_dsim_driver_data exynos54=
33_dsi_driver_data =3D {
>         .has_clklane_stop =3D 1,
>         .num_clks =3D 5,
>         .max_freq =3D 1500,
> +       .wait_for_hdr_fifo =3D 1,
>         .wait_for_reset =3D 0,
>         .num_bits_resol =3D 12,
>         .pll_p_offset =3D 13,
> @@ -492,6 +496,7 @@ static const struct samsung_dsim_driver_data exynos54=
22_dsi_driver_data =3D {
>         .has_clklane_stop =3D 1,
>         .num_clks =3D 2,
>         .max_freq =3D 1500,
> +       .wait_for_hdr_fifo =3D 1,
>         .wait_for_reset =3D 1,
>         .num_bits_resol =3D 12,
>         .pll_p_offset =3D 13,
> @@ -510,6 +515,7 @@ static const struct samsung_dsim_driver_data imx8mm_d=
si_driver_data =3D {
>         .has_clklane_stop =3D 1,
>         .num_clks =3D 2,
>         .max_freq =3D 2100,
> +       .wait_for_hdr_fifo =3D 1,
>         .wait_for_reset =3D 0,
>         .num_bits_resol =3D 12,
>         /*
> @@ -1117,6 +1123,7 @@ static void samsung_dsim_send_to_fifo(struct samsun=
g_dsim *dsi,
>  {
>         struct device *dev =3D dsi->dev;
>         struct mipi_dsi_packet *pkt =3D &xfer->packet;
> +       const struct samsung_dsim_driver_data *driver_data =3D dsi->drive=
r_data;
>         const u8 *payload =3D pkt->payload + xfer->tx_done;
>         u16 length =3D pkt->payload_length - xfer->tx_done;
>         bool first =3D !xfer->tx_done;
> @@ -1157,9 +1164,11 @@ static void samsung_dsim_send_to_fifo(struct samsu=
ng_dsim *dsi,
>                 return;
>
>         reg =3D get_unaligned_le32(pkt->header);
> -       if (samsung_dsim_wait_for_hdr_fifo(dsi)) {
> -               dev_err(dev, "waiting for header FIFO timed out\n");
> -               return;
> +       if (driver_data->wait_for_hdr_fifo) {
> +               if (samsung_dsim_wait_for_hdr_fifo(dsi)) {
> +                       dev_err(dev, "waiting for header FIFO timed out\n=
");
> +                       return;
> +               }
>         }
>
>         if (NEQV(xfer->flags & MIPI_DSI_MSG_USE_LPM,
> diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsu=
ng-dsim.h
> index f0c1e5c5ed490afe0bcfd06830f52471710b29ea..62c07952bd00f9c2c287a6a99=
8f0e243dd4032a9 100644
> --- a/include/drm/bridge/samsung-dsim.h
> +++ b/include/drm/bridge/samsung-dsim.h
> @@ -61,6 +61,7 @@ struct samsung_dsim_driver_data {
>         unsigned int num_clks;
>         unsigned int min_freq;
>         unsigned int max_freq;
> +       unsigned int wait_for_hdr_fifo;
>         unsigned int wait_for_reset;
>         unsigned int num_bits_resol;
>         unsigned int pll_p_offset;
>
> --
> 2.49.0
>
>

