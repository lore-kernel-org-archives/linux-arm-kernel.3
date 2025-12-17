Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEF2D65C48
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 13:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HeFvcwPuMBzJwPtY2IZ75UX9BR5Ij/OppFp2JBnCGZk=; b=Rnob1qWF48K34NdpJFEgGOMXsI
	yF+IJZARa4MET2ax0PZNW7vlFZ8xJtanig4DhiuQlyzGWAED0Bcd3Q5itxtoup76yyDwxiFRri6BN
	ZHi74v1/U23NwGdAWeFsb69qxLCrDAR0dW5fNJ2aYWuCKLlPrLLmJ/5VrXnJ25RN2qB4Db3yP43Xr
	qsfSFOqd+YkwNWCqdOWgLWio3U5C4mn4IRCtacrQlXCWVkL+wEpT6uwHF+XNdQz7+UReYmYMJr0DH
	ROWzJ6scobVMIIMJyl7+L9YSEGQfv0NxqsQwo6uocXvD/UrPY1kU+nvwlT/3uWGwYcLuHYOEG90W6
	YkXMQxLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrqq-00000006sa1-0qzS;
	Wed, 17 Dec 2025 13:46:00 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrqo-00000006sYi-1GDH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 13:45:59 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5957db5bdedso7183913e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 05:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765979156; x=1766583956; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HeFvcwPuMBzJwPtY2IZ75UX9BR5Ij/OppFp2JBnCGZk=;
        b=Y9INxEV++u+/d1qYmD0fAHouvAShOtGbzsb4qbtxALyi7D8sfMD3CrNz80RsnsKm59
         FHbeNhiX21Ngk25ykJgNUdwx851CwQ7yuPE1xPquE9YsQxvzSJzTRBdt/QuIGcAlC7tR
         YMTR+c/K5jSLdxljgJ0pFT6Mr05eVCG84+/z+qH/e48Q2QReAhTdL9uTS+bkDjl13aYv
         uIc6AzSWnkjOL1N3PGCRRbvuQyg4t6bDqFUBoEYkJWpTa7Ww3Ju5R6FolRiA6osoX062
         +653HTdXryyY4vFjSCiAqQR7cAhJr9DMvAaEjnOMqr7UQ44yO9xTUlMdBsAoI1xaqw6v
         +PTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765979156; x=1766583956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeFvcwPuMBzJwPtY2IZ75UX9BR5Ij/OppFp2JBnCGZk=;
        b=t6P70Jb9tASNJYmVw3oMVA721zZne3D4JPsVoFdOXEPiG8PhVXt61XQwV5T0K7YpC5
         Ey3ip4fLxmEdEt0l5S92F3f7dmMkB+HRWimVNWd/LAsBXUYAYypj+mI/zYQT0kzWVtTY
         k9tZ28UQGD2qhpFetlijr5UEot1ZPSb/TVdiyvd1JfP2klz6UPVqM2Kiye7K5ON8cZCJ
         E3XicgyBiCgMMLdt5xirkmiz6lH9/MLwDGlGi9BNSu2rAiKTB74cp1IkriKiFzA7dHzN
         zEasdvS9We5nyr1rCaYjRqeoEdxpc6e34QMqGZLxOR9K86+UXawtbsnaHQ6EGNiV5XWw
         wJxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxAAzgAz/kU3fXdmIlbb0Dmoq7NXhyU8j/Ho4QvU0Dvz2wa6d22ytneubb8aCqunH4KBpxNTyFOIH4t8/7Odd6@lists.infradead.org
X-Gm-Message-State: AOJu0YyLVHUf9RksFBzJvEZWm5c5cLCVZ5l3TTd4fSA6gTaZbhGiIf66
	uS5e4x9Nm8LktZGhNTnPbXyh14UMx4hKWeKU5gvpjzw7bGzQuV9I2qspn2cy3FMargJeY1GYTtY
	cafkeURBkfoGDPnHocSdmBJwS0q8K7Tr48CydZGbu3w==
X-Gm-Gg: AY/fxX5eWHFz/7IF2gcsgk9yTnqvCAXfRLeWBVn0l8CITlZ1OXvJJ+P5+SydnUD6MX3
	IiwiNts/Ss4HcCai3WzZNI+Kykj2dj531InB5dzx1xdZlNmq59RsO7YKWGeg9SDW2CDzX5umKfK
	icw6ciOLm7ooMyUNmeED9mx2QO6hrC8Fa0+qE4aowQwEaF1RiXXWk2Y7WBkQtxjr3HGv+0XflMf
	t3ytL8sIrtcbL5BP8+ytjzIR2yA7HvEDSobqyIyfOI5XFbvWMxmoqJ6YShFiQuV9XeXats=
X-Google-Smtp-Source: AGHT+IF8DUR3iFEJEHIZVoppRZ2LJ1i16lHQ3Olhnesdn9YtIYVJQ/fNEdH4vIoS5b8Lw4dMFXsWFN+VTySF0wVdcVI=
X-Received: by 2002:a05:6512:3b86:b0:597:d7dc:b7ce with SMTP id
 2adb3069b0e04-598faa3bd8amr6408543e87.30.1765979156040; Wed, 17 Dec 2025
 05:45:56 -0800 (PST)
MIME-Version: 1.0
References: <20251212-s32g-sdhci-kconfig-v1-1-8e278c8d7f78@redhat.com>
In-Reply-To: <20251212-s32g-sdhci-kconfig-v1-1-8e278c8d7f78@redhat.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 17 Dec 2025 14:45:17 +0100
X-Gm-Features: AQt7F2p99M9efU4Kabtz6odZdNhny0sq2J-1crHyiipLb65xYIkOxCPnes_s36Q
Message-ID: <CAPDyKFp++OQFxkY_zqkZSJz2R0sqxBnd-6U+VLsyZYDQ4H9MeA@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-esdhc-imx: add alternate ARCH_S32 dependency
 to Kconfig
To: Jared Kangas <jkangas@redhat.com>
Cc: Haibo Chen <haibo.chen@nxp.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Chester Lin <chester62515@gmail.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, s32@nxp.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_054558_361135_3B0AFFFA 
X-CRM114-Status: GOOD (  19.22  )
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

On Fri, 12 Dec 2025 at 16:04, Jared Kangas <jkangas@redhat.com> wrote:
>
> MMC_SDHCI_ESDHC_IMX requires ARCH_MXC despite also being used on
> ARCH_S32, which results in unmet dependencies when compiling strictly
> for ARCH_S32. Resolve this by adding ARCH_S32 as an alternative to
> ARCH_MXC in the driver's dependencies.
>
> Fixes: 5c4f00627c9a ("mmc: sdhci-esdhc-imx: add NXP S32G2 support")
> Signed-off-by: Jared Kangas <jkangas@redhat.com>

Applied for fixes and by adding a stable-tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 10d0ef58ef493102d3586d7a31d755543297999a..c94ae4794545de1c818ad50be7f91331862b6acf 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -315,14 +315,14 @@ config MMC_SDHCI_ESDHC_MCF
>
>  config MMC_SDHCI_ESDHC_IMX
>         tristate "SDHCI support for the Freescale eSDHC/uSDHC i.MX controller"
> -       depends on ARCH_MXC || COMPILE_TEST
> +       depends on ARCH_MXC || ARCH_S32 || COMPILE_TEST
>         depends on MMC_SDHCI_PLTFM
>         depends on OF
>         select MMC_SDHCI_IO_ACCESSORS
>         select MMC_CQHCI
>         help
>           This selects the Freescale eSDHC/uSDHC controller support
> -         found on i.MX25, i.MX35 i.MX5x and i.MX6x.
> +         found on i.MX25, i.MX35, i.MX5x, i.MX6x, and S32G.
>
>           If you have a controller with this interface, say Y or M here.
>
>
> ---
> base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
> change-id: 20251211-s32g-sdhci-kconfig-585b6909f7b4
>
> Best regards,
> --
> Jared Kangas <jkangas@redhat.com>
>

