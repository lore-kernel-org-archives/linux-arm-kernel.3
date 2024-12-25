Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFEDE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 15:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CAXthhD4Ona907S+mo9EE0Tb/fUDMWSUWZZZT3wo1ow=; b=0ZtjqznHwH1cLSHmezcmHv/HpZ
	rEtHGQmdfEFYTJ+FYBwde+xiXWoGOohMo5GOGQOG3oyKlF/6lNzzYWaSxVNHvzNgXujGcyGQevA4T
	SbKAVpPZHswHBXuL8KRIcRyFcHg5/yuFLSNEnSeSt/cp13fM7lzTTha+c4zMhRDkYXTQqMTUxMwp0
	8X2Px+LinFPW7OCS6jN8r75Hg76mxYqZwXtA6Uj0auhQ5It0v6/7+rZg48CL/hr4YeD/QzUPAb/mO
	aPdWWR0I8dysDITt4UzABcXbL+Ew1eCsjO0/cb1ke0p8XzlG4t+ZPPv0RCiiFNYQVbQqa2ObffDXZ
	WHKVD+aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQTPY-0000000E0Ja-2bwO;
	Wed, 25 Dec 2024 15:35:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQTOM-0000000E043-1g4w;
	Wed, 25 Dec 2024 15:33:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 96BCAA405B8;
	Wed, 25 Dec 2024 15:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5518C4CED4;
	Wed, 25 Dec 2024 15:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735140824;
	bh=DEXHDPtwZYHuJkECKOVcbJ+WOxuKvQWBJq6RZjtHArY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZNkYjVBahTcR/Ots3eNyWI+0z6xXcF3IyQSIc6EKOHLVULoClbnQO6b+q34GHZphf
	 ok59spwujDQhxXO/msb40QprJiJf5hbNpN2sxWG2VI4inh1NjSa6dZX7twNnWX/LUo
	 B7s5eYu7uRe3KeMVhGOyrTfX/YUxy8Vg0rLBXdSx740T5sJorm3abTXt520Mwh1oX0
	 h6QF0NbOld75c1qe92HpdkzT50ES/XO4PEfBIyi/oiiZQd+Zacz/H/iPT1gJb1tzdG
	 cH2MLRhQMiYKqQyv072jW7XnGxWNkRL7mglg6a7wu13u5b2AdikxijsQPL7T3T++pm
	 rnOpyM60Fcnkw==
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2f441791e40so5503118a91.3;
        Wed, 25 Dec 2024 07:33:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUPn2Qzz2ispralXoilQQkSMgC+zFceCR5kmgF88O7pmn7tcdYj5hxP09rz+NsHzhO0Jkt8TH6OcYHYkFPn0XM=@lists.infradead.org, AJvYcCUQ1tzU4CjxLT8DnwKS+TYj6LT/DnXcloO2tqojoCssrroQXvUliL3BU7w5+8KwbZnvtsY5oX1qcLdiZwRGZlQH@lists.infradead.org
X-Gm-Message-State: AOJu0YwoZctK3nYC1Tpbuaxq0r82hBIxt7pNKN9v6v1Cz5EgKYOfsItW
	IYZ9khIHKPdKwzA+LoH7Mb/ZgWTh/5DjPsaSSsrFkMjqAQ8wkoaLtie6C/V2Y0A1TVsf2Mlsnt1
	yejZ7DQZu7aHET3YNt2dw6svAyw==
X-Google-Smtp-Source: AGHT+IFoWBbZz3onm4QqacyQR1qPHQxceMqC+47Tx4zhMS3hI6YrNtpJxB80R0rLXs8DfHCpZeRdsx34+8s2PsQp/PM=
X-Received: by 2002:a17:90b:2e4b:b0:2ea:a9ac:eee1 with SMTP id
 98e67ed59e1d1-2f452e1e268mr30653100a91.10.1735140824167; Wed, 25 Dec 2024
 07:33:44 -0800 (PST)
MIME-Version: 1.0
References: <20241218085837.2670434-1-arnd@kernel.org>
In-Reply-To: <20241218085837.2670434-1-arnd@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 25 Dec 2024 23:34:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY_89yotLq5BuU+EhEQJ9GBv_+jKMZ-kcTw2HxLGNPYWq+A@mail.gmail.com>
Message-ID: <CAAOTY_89yotLq5BuU+EhEQJ9GBv_+jKMZ-kcTw2HxLGNPYWq+A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241225_073346_578398_2D7ACDC3 
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

Hi, Arnd:

Arnd Bergmann <arnd@kernel.org> =E6=96=BC 2024=E5=B9=B412=E6=9C=8818=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=884:58=E5=AF=AB=E9=81=93=EF=BC=9A
>
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

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: a481bf2f0ca4 ("drm/mediatek: Separate mtk_hdmi_phy to an independe=
nt module")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/mediatek/Kconfig | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/=
Kconfig
> index 1c2f56b75716..1d4f20a4f265 100644
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
> --
> 2.39.5
>

