Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66739C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 16:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNyoNFfqH0PsydSjFbFoobKDexjUlMZLc47JqJwFJrk=; b=psqH6aWxInyIhML/mBHnH4Om+h
	TfHP9eGaLXbgXrA77ZAV2Au8/5PoCR7d6b2LRAwhmqzRABo5y50UYspKQ9eHFkosV0nSjAviJAaVq
	AeMXFGjgdRqQncr0I+LKdyT4X7MCJcjuEfi4SOothEYqL9nb2SY+bQ5uNL5d8Vc/SUNl8ibF3rEh8
	lwWmHiNUEsCgkKI4s/aPCwJ7C1G9i2GwmBC/dE6Fh0lJU97iwsNX785QmiCIfZP7RAS05DqA6EbBi
	PCOfOn5AmPZKUVFvfLwLfcHsvYBjdLHn66Tp6UBlnSauDVtli6S9zWFTFhDiV5Bd/bkAVnU0eh6Z8
	5B/rWH6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjKvO-00000000Od3-28pB;
	Sat, 15 Feb 2025 16:21:50 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjKtw-00000000OSB-0Zug
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 16:20:22 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43962f7b0e4so18069165e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 08:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739636418; x=1740241218; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dNyoNFfqH0PsydSjFbFoobKDexjUlMZLc47JqJwFJrk=;
        b=jB0ZmarO65mImNvpVV1xhCy35YM0NvNlpKY3wSndwVxIrCXvyUCNAB/s94et1K1lnK
         +cATWJ63sDHEwOcQ4M9FlVnvTKNTAh9KBlDw5MONIMIUPpHGHW5Mj97pgWwLAsPaBJlq
         TUox/JVGYN/J3aa8CMkLNVVg7UlSdAUlcPPFJLjeeEfboS4jGF2W3jDIYC1aEpYjNRRZ
         K5rIx+9Xz2NWoP9BAWMVKrMstI4veanG9Y6bBSTzi5MAP5+PAdIaKB3BbNhbQt/zDZR4
         rXXgfoII69qel3EVjyjumR7TOh4a7F0IFzrIAhKW8bbbBKNWL8y62BuQGaAYN+dOvDdp
         ZtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739636418; x=1740241218;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dNyoNFfqH0PsydSjFbFoobKDexjUlMZLc47JqJwFJrk=;
        b=FwLQjq3Q3UIetOX+DgWnxjGfMTn3wQu83RouoPBx5u0Py+mmAGX5a0DNjnRP4uxN2B
         L55jUfhKbi5QWIPhEBKFZQn0q/2/i1EykLnSqak1xzqZUGqPj6FCTa1tFQhR8d4SZymV
         v+3O0irkmC0Nh0XLXBpG1jEAinHFEKklIha+jxPS+KdLZmMO3KbNdk0FRu9ESvj/NKgs
         tlTjkJxfB+dLMcNMnYhESlcG9ZgRhDMqEVZI2kdyR1c7xbB6Of5MFfpygaLVRUVvDU7G
         KXVzXnl7UVQHtDDvKpe74zHg/W9LhDvV7Lg+dxSigRmmBGHgEycowdap94+uetRlPv7I
         Q56w==
X-Forwarded-Encrypted: i=1; AJvYcCWwzJ/1Vvayau5QWcwcKDF4Sk53D0o+kgSCukyvrSQwadgd8HM7kZqF57yE5llRIUv5HAx2kBR8BVy6D7UbYLdV@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7EMcH5ZgT4RU/lmMFLQyhA0Cuh9Tgm77dm+HGRoHW87GfGgAl
	IRjEDieE4mdxjaM15mRXbUGZ+mCMmaAKy3i3B9MiVKv9fay68MEbw3e3cMOR2pk=
X-Gm-Gg: ASbGncszVxAMP8QGOG9yvqpyE1RlKYYyyxaXehL8kG18mjgRezC+GeQLD34qjFdtKVV
	t0L1qSyaCaTVlLraE9RH+b+cYcQi4+18qUfvZsXimN+f/Rg9AcGkv++wCGxxQOCFGsTM24X2QN+
	u99T0RpDfPvxEbW2feV4RcOJuTMx/3aqIITANjKiU2IA9OQYbdxtj3/Sb4KZ9v409bNp47mk9Kp
	Vv1SIdPuggPP46/sG9US7maVfOVrnRzBRq7gsUZ9lSQTMh/cA1L/fSpqDTJJXEBik+8tZ045Zkw
	klY/3URwjK5Ft0Pf6hw=
X-Google-Smtp-Source: AGHT+IG1iRvsBX6PLkvzMs5VpNDDf9z76BCIL+JAkXGVtBLduGXf6zEIP0vw/72qC+rgRgHoj9P1ew==
X-Received: by 2002:a05:6000:1561:b0:38a:888c:679c with SMTP id ffacd0b85a97d-38f33f52fd8mr4562539f8f.42.1739636418355;
        Sat, 15 Feb 2025 08:20:18 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25a0fa1esm7483252f8f.100.2025.02.15.08.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 08:20:18 -0800 (PST)
Message-ID: <bc292f121afaacb29fdc7d600c72cb3008b6b56a.camel@linaro.org>
Subject: Re: [PATCH] phy: exynos5-usbdrd: Fix broken USB on Exynos5422
 (TYPEC dependency)
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter
 Griffin <peter.griffin@linaro.org>, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Date: Sat, 15 Feb 2025 16:20:17 +0000
In-Reply-To: <20250215094122.60535-1-krzysztof.kozlowski@linaro.org>
References: <20250215094122.60535-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_082020_178431_CEB28040 
X-CRM114-Status: GOOD (  18.99  )
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

Hi Krzysztof,

On Sat, 2025-02-15 at 10:41 +0100, Krzysztof Kozlowski wrote:
> Older Exynos designs, like Exynos5422, do not have USB Type-C and the
> USB DRD PHY does not really depend on Type-C for these devices at all.
> Incorrectly added dependency on CONFIG_TYPEC caused this driver to be
> missing for exynos_defconfig and as result Exynos5422-based boards like
> Hardkernel Odroid HC1 failed to probe USB.
>=20
> Drop incorrect dependency and rely on module to be reachable by the
> compiler.
>=20
> Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
> Closes: https://krzk.eu/#/builders/21/builds/6139
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/3c0b77e6-357d-453e-8b63-4757c3231bde@=
samsung.com/
> Fixes: 09dc674295a3 ("phy: exynos5-usbdrd: subscribe to orientation notif=
ier if required")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---
>=20
> Patch for issue in linux-next
> ---
> =C2=A0drivers/phy/samsung/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 -
> =C2=A0drivers/phy/samsung/phy-exynos5-usbdrd.c | 2 +-
> =C2=A02 files changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
> index 7fba571c0e2b..e2330b0894d6 100644
> --- a/drivers/phy/samsung/Kconfig
> +++ b/drivers/phy/samsung/Kconfig
> @@ -81,7 +81,6 @@ config PHY_EXYNOS5_USBDRD
> =C2=A0	tristate "Exynos5 SoC series USB DRD PHY driver"
> =C2=A0	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
> =C2=A0	depends on HAS_IOMEM
> -	depends on TYPEC || (TYPEC=3Dn && COMPILE_TEST)

This line ensures that PHY_EXYNOS5_USBDRD changes to M if
TYPEC is M.

> =C2=A0	depends on USB_DWC3_EXYNOS
> =C2=A0	select GENERIC_PHY
> =C2=A0	select MFD_SYSCON
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsu=
ng/phy-exynos5-usbdrd.c
> index ff2436f11d68..e8a9fef22107 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -1456,7 +1456,7 @@ static int exynos5_usbdrd_setup_notifiers(struct ex=
ynos5_usbdrd_phy *phy_drd)
> =C2=A0{
> =C2=A0	int ret;
> =C2=A0
> -	if (!IS_ENABLED(CONFIG_TYPEC))
> +	if (!IS_REACHABLE(CONFIG_TYPEC))

On arm64, the defconfig has TYPEC as module (while PHY_EXYNOS5_USBDRD
defaults to y above), and therefore all following code is becomes
disabled with your change on arm64.

Can we find a different solution to unbreak arm32 and keep arm64
defconfig working as intended?

Cheers,
Andre'


