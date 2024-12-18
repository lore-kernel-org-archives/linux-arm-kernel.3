Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7A1E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 10:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SvpieJCHhkISUTUlgye5lssHWrIBSVqqrABKwtDyEdQ=; b=YS7ltEifAmBcZDCDaRelabjLb2
	ttDWtJ4NXp3IRfuUyqBQf++6Vc/zEqbtX2MeDrMJDpYJ9yv5GKlAv6LdtvNGSHBfnYC+7H2sZKclR
	w06/+WseNBhH3RTLnn+0os9BjfHI+d80U7rQuRIhyBFpMoyxG6vweLtfPcnzSVFXEE03dpBbFjFcC
	akSLZWuGdncJbHukzXaWNo9LawGfVd6V5h4j2/Qe0D8pmNuKHP4KLTHxy8GHsyh8DzaAF7J65fKHn
	AVY/KSJzNHftgc2G2G6Q3RDVc9ejTCwRvZKlDdNGErq0+A6YnevOLsxM9ReEKurCmK/SnlBjN+JO/
	VEm8Avfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqtH-0000000GC9d-0kh2;
	Wed, 18 Dec 2024 10:02:51 +0000
Received: from mail-ua1-f46.google.com ([209.85.222.46])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqs5-0000000GBxB-05wh;
	Wed, 18 Dec 2024 10:01:38 +0000
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-85c48f5e2c1so1172250241.3;
        Wed, 18 Dec 2024 02:01:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734516093; x=1735120893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SvpieJCHhkISUTUlgye5lssHWrIBSVqqrABKwtDyEdQ=;
        b=PB2nycAHCQkIbX4LiI/FLu+s0/yqUB3sdGZZptmvlILOI3w7gXSxtoIAE5LdnUbGwu
         u1oX1swB0LxE4tDEGzkMQMYiOEsYgh/PKTCvJBP1Tb+vvE+wrom7LouwQtr3xhbXDZtE
         GtC+6P7JiDTFPLa5YqJ//yeR6itqNyEikOuHpTNvUv5TpoDuTB56tgQpUI4FuUvctqyU
         pj6bSlgS80iajMCy5jkUGAxZv0MV57RqujC1IEV0QOce8GgiRrsKY/oknaDe8qL/0mpL
         jKc7YFEgP36PZj/V10zYHBsA5NfDLfQJwAU8Vhhx6309lU2cov4ZQc1avFjEXPP3UV/U
         Mvvw==
X-Forwarded-Encrypted: i=1; AJvYcCW7iDc3UgbvZ9QF0/ezyDnAMDCj4FogxQZ+z6OEa2jeFdpgD4pYSe5Az0jJtNjSX0w0aeXsZdtLy/39Ugqp1czS@lists.infradead.org, AJvYcCXjOzB0AAbXGoLkNP9kVvHe4DzT6fiy1xPzA6QIKW5YneJBCoqgeL/MkKyYwrgVZCN7+yunFn9wlm35ZZddno0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yya5t+3VtD3ewEnxsAm8Znw/5b0EHvvFmX2dcMQGfcWei7BzJLg
	UqdGLpeV3jivLvsLpMlUuG5OPZhXGoeBf9b8Mn7x3EhvNVKxCQtnAUa21D6U
X-Gm-Gg: ASbGncsq4rnkJJtd2tW6g5PDraN4hwLdVhKCIKzz5Nq5qRLcmo/5Vf7XojtVJDaW0l0
	xZmCyeMWoRowZ5Vt+31SP9QW+Q7wal60CenB/be8gHEgchl9q27XIwTkeRu2O7b2bYCa2j19NTK
	HsjhrUWsKcMbklMq15z5z40duX4XW+lJg8SmbM8Yth3Ni0lKe05KpVUHhWODwqMRsbuSIzV11T1
	SIrNiPD94f2jOIuottteskQH14v2Svg0VWDXOcxilX4rh3iVYsWeuiNc/qtDLuGmHpqiCBIlrhh
	O9BQ88G+YG5H5cNrAKt2E9Q=
X-Google-Smtp-Source: AGHT+IHxRHOJb/pwn78LXaOPaZjvF8ZHirMxgXpzrCp62Pc9oDp9Pu6rSk/CQuGN8l17MFUyanPF0Q==
X-Received: by 2002:a05:6102:3e25:b0:4af:e4fb:2f0b with SMTP id ada2fe7eead31-4b2ae83e7e3mr1632659137.22.1734516093580;
        Wed, 18 Dec 2024 02:01:33 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-860ab587ee0sm1606685241.9.2024.12.18.02.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 02:01:32 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5174f9c0e63so1690144e0c.1;
        Wed, 18 Dec 2024 02:01:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV164v5ovci9+Z03/t2lZ/gcGpfQw2LnHGtWTU4JYFR+4oaacEinL2VlGN1G/77IiLsanYqFovomkUGTbcTE4yk@lists.infradead.org, AJvYcCWLnlsCE5ex4gJ9pU4dfxo7qOzexMjgjAxYSILirDvMHAL9L1IPPUQBzaiPqFVhORVY1kCa8ubPVjJx9LKTzfo=@lists.infradead.org
X-Received: by 2002:a05:6102:38c7:b0:4b1:2010:5cd7 with SMTP id
 ada2fe7eead31-4b2ae735822mr1363766137.8.1734516092461; Wed, 18 Dec 2024
 02:01:32 -0800 (PST)
MIME-Version: 1.0
References: <20241218085837.2670434-1-arnd@kernel.org>
In-Reply-To: <20241218085837.2670434-1-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Dec 2024 11:01:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW-PEnkRugFVw2=0Xozw6TQaAJN_FzNucPMTZazZ3--hw@mail.gmail.com>
Message-ID: <CAMuHMdW-PEnkRugFVw2=0Xozw6TQaAJN_FzNucPMTZazZ3--hw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: stop selecting foreign drivers
To: Arnd Bergmann <arnd@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>, Jani Nikula <jani.nikula@intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Chen-Yu Tsai <wenst@chromium.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_020137_057543_38CC98B8 
X-CRM114-Status: GOOD (  25.12  )
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

Hi Arnd,

On Wed, Dec 18, 2024 at 9:58=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The PHY portion of the mediatek hdmi driver was originally part of
> the driver it self and later split out into drivers/phy, which a
> 'select' to keep the prior behavior.
>
> However, this leads to build failures when the PHY driver cannot
> be built:
>
> WARNING: unmet direct dependencies detected for PHY_MTK_HDMI
>   Depends on [n]: (ARCH_MEDIATEK || COMPILE_TEST [=3Dy]) && COMMON_CLK [=
=3Dy] && OF [=3Dy] && REGULATOR [=3Dn]
>   Selected by [m]:
>   - DRM_MEDIATEK_HDMI [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && DRM_MED=
IATEK [=3Dm]
> ERROR: modpost: "devm_regulator_register" [drivers/phy/mediatek/phy-mtk-h=
dmi-drv.ko] undefined!
> ERROR: modpost: "rdev_get_drvdata" [drivers/phy/mediatek/phy-mtk-hdmi-drv=
.ko] undefined!
>
> The best option here is to just not select the phy driver and leave that
> up to the defconfig. Do the same for the other PHY and memory drivers
> selected here as well for consistency.
>
> Fixes: a481bf2f0ca4 ("drm/mediatek: Separate mtk_hdmi_phy to an independe=
nt module")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -15,9 +15,6 @@ config DRM_MEDIATEK
>         select DRM_BRIDGE_CONNECTOR
>         select DRM_MIPI_DSI
>         select DRM_PANEL
> -       select MEMORY
> -       select MTK_SMI
> -       select PHY_MTK_MIPI_DSI
>         select VIDEOMODE_HELPERS
>         help
>           Choose this option if you have a Mediatek SoCs.
> @@ -28,7 +25,6 @@ config DRM_MEDIATEK
>  config DRM_MEDIATEK_DP
>         tristate "DRM DPTX Support for MediaTek SoCs"
>         depends on DRM_MEDIATEK
> -       select PHY_MTK_DP
>         select DRM_DISPLAY_HELPER
>         select DRM_DISPLAY_DP_HELPER
>         select DRM_DISPLAY_DP_AUX_BUS
> @@ -39,6 +35,5 @@ config DRM_MEDIATEK_HDMI
>         tristate "DRM HDMI Support for Mediatek SoCs"
>         depends on DRM_MEDIATEK
>         select SND_SOC_HDMI_CODEC if SND_SOC
> -       select PHY_MTK_HDMI
>         help
>           DRM/KMS HDMI driver for Mediatek SoCs

What about replacing select by imply?

Alternatively, PHY_MTK_HDMI could default to DRM_MEDIATEK ||
DRM_MEDIATEK_DP || DRM_MEDIATEK_HDMI.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

