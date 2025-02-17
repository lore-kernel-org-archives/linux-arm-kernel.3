Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF84C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 06:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKNrAXFMRF1ydsmaXbtU5o3X4WRvqMlFPYNBXI8d+nE=; b=TpSOsL0JhhzSOrUIp03Qqh7p7M
	3As1ponJ5l1APORNNW3gmQxSen0CVI01tI5IZKeEJfifaFLLrucmQ92l69qWU8fXrTy1LXib2kucQ
	IrSqYSUhnIxW87J3ftPfTbpqc/oMYXM3DI8npDFtQEVubiQcz++qeAYi+Q2sCzckidrb3e6j9bvXq
	8tEmRXkZ9AP7rL2CMv0EdrFIwnfzkvaUhdfUYANavZEKSaCUenVusas8XNPzvjNmnrNsaV6AUlPg2
	luye1xQYXl8TPDvsrR9xnioxV959WMe8M1c7OZ3OLjxJ76jxgDf6tz5+jeURmg+2i4XhgoQSO7D7W
	s63JHjKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjuC7-00000003PyN-2YMJ;
	Mon, 17 Feb 2025 06:01:27 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjuAd-00000003PeH-2j21
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 05:59:57 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43963935585so38788115e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 21:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739771993; x=1740376793; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SKNrAXFMRF1ydsmaXbtU5o3X4WRvqMlFPYNBXI8d+nE=;
        b=QWmh7v6J54Eu58/aCvu7uukwSlwXPU3KqBA8LoF3k/YenB31JlsmiQdn533BPRY0iW
         SR1BQdXzfQN1SnLCnbdxPb6zpWGP7QCvTbKwPIEVExrAb6J3tkF9avdD3wqGeISARk8C
         EJ98nzDJ0t00Wa5z4Xnq22HL8YWtG3xSKA51GaEgW936NSt0IZ3Y2RHGgBcI9BlnJ+PH
         GQT0iQqpNp3aNNfGWSZWN76keA0b5IsogX1h/4bKOyhU8JfjrQrE9hpLxs5yAWYKGHt7
         dK2PsqaunsFjKvNTI902yPnOW2PuCmxIx+Y7RzfyTb7ixqLECS+0zcT5pIIBRDEG9o3b
         zqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739771993; x=1740376793;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SKNrAXFMRF1ydsmaXbtU5o3X4WRvqMlFPYNBXI8d+nE=;
        b=rxpx0On6XmjlVDnCO3bIahvjnXrRpK2437U2iPURzAuWJRoCYUpeEKmUctSWE4NiiQ
         zz4wwpTBNEX6OTxD7afn+BeI+WOe8yLd8wPLQwTKuuwSgss2haEBw/xJs0lTdJ7r9kyF
         27T668zvMYY/al9N18AtmhVgiBn2CxJleYdTpp4RBeY1laBgMCQErp7bpqoy8dkVd9mQ
         xs+jrw6TVxMG8+PiIj35xqFXqhzpxkrJApIA8DeaK7SV/axK/EzGC/bORnw28gUdR+Gu
         jVv0iDOHDTV+ESBOQO7Q45XUj4VPsJEB18AJyNZ4WtQf/3EVdMwjiHUAcp8R3qztepfr
         9O/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfBSnE7DoHOyIhu6GtKgLiQTn1/DwSIihkb2U5/mBuXKATv8kTOiMDRa/ZDi07CoyqKNU6YE8qWV7UXPfqDATY@lists.infradead.org
X-Gm-Message-State: AOJu0YwsyFhr7Fsr17uNfyljFxyVvzrhVVz6BRIGgUKM87soob7mqbYk
	Fu4et1iqytVFVl10dg06gQFCOw18b9/hn2TDC5QdMfRxpJ8qs7KFS217utxs5aI=
X-Gm-Gg: ASbGncts+4WqvGvBJQOMotMbANw+bS1mX5ixqNDHqKn5U48KI97B0M0I1BFopv28eZQ
	AVsW7Wmp/VwB5/sz4mrnbbrbyXB4AIkV7B9IUM5/WRPjTFqm5gMBfgSXroi3nIghMQd6iso0OdK
	KpoJ775JnnglWzHi0wRG1rGGLyODKk/qoUrITuzJrZBoXG0S/6OTpvLCnIGcl9EZHm2gW/71iyT
	y1jzvOCRLxyl4EN3/gVc2l2tCimqGS3/r0Fq5qZqlGxyJol9veZjqb5IwOqdbrsKA07o5AW8wfQ
	hsHtdGOY4EsM6X7sNFk=
X-Google-Smtp-Source: AGHT+IHXacwvM4hwCgbWYgWUY/7LPCli/NI7dw475tRtNjJvs0k+XD4odztNdHIEn2nleZzsjkFFbw==
X-Received: by 2002:a05:600c:35c9:b0:439:5590:6d2f with SMTP id 5b1f17b1804b1-4396e6ab197mr74259555e9.12.1739771993191;
        Sun, 16 Feb 2025 21:59:53 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43989087517sm8102405e9.8.2025.02.16.21.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 21:59:52 -0800 (PST)
Message-ID: <88b00cc53cd5cb3682a29d6a2ec491c7640129ce.camel@linaro.org>
Subject: Re: [PATCH v2] phy: exynos5-usbdrd: Fix broken USB on Exynos5422
 (TYPEC dependency)
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter
 Griffin <peter.griffin@linaro.org>, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Date: Mon, 17 Feb 2025 05:59:51 +0000
In-Reply-To: <20250216114136.245814-1-krzysztof.kozlowski@linaro.org>
References: <20250216114136.245814-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_215955_693493_C3041650 
X-CRM114-Status: GOOD (  23.78  )
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

On Sun, 2025-02-16 at 12:41 +0100, Krzysztof Kozlowski wrote:
> Older Exynos designs, like Exynos5422, do not have USB Type-C and the
> USB DRD PHY does not really depend on Type-C for these devices at all.
> Incorrectly added optional dependency on CONFIG_TYPEC caused this driver
> to be missing for exynos_defconfig and as result Exynos5422-based boards
> like Hardkernel Odroid HC1 failed to probe USB.
>=20
> However ARM64 boards should have CONFIG_TYPEC enabled and in proper
> state (e.g. =3Dy when PHY_EXYNOS5_USBDRD is =3Dy) for proper USB support =
on
> Google GS101 boards.
>=20
> Add itermediate CONFIG_PHY_EXYNOS5_USBDRD_TYPEC symbol to skip TYPEC on
> older boards, while still expressing optional dependency.
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
>=20
> Changes in v2:
> 1. Add PHY_EXYNOS5_USBDRD_TYPEC, so arm64 defconfig will have both
> =C2=A0=C2=A0 symbols in-sync
> ---
> =C2=A0drivers/phy/samsung/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 +++++++++++-
> =C2=A0drivers/phy/samsung/phy-exynos5-usbdrd.c |=C2=A0 1 +
> =C2=A02 files changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
> index 7fba571c0e2b..b20ac6b75993 100644
> --- a/drivers/phy/samsung/Kconfig
> +++ b/drivers/phy/samsung/Kconfig
> @@ -77,12 +77,22 @@ config PHY_S5PV210_USB2
> =C2=A0	=C2=A0 particular SoC is compiled in the driver. In case of S5PV21=
0 two phys
> =C2=A0	=C2=A0 are available - device and host.
> =C2=A0
> +# None of ARM32 Samsung boards use Type-C, however newer ARM64 do and
> +# PHY_EXYNOS5_USBDRD driver needs TYPEC to be in a matching state to avo=
id link
> +# failures (see optional dependencies in kconfig-language.rst).=C2=A0 In=
termediate
> +# PHY_EXYNOS5_USBDRD_TYPEC symbol allows to skip TYPEC on ARM32 boards.
> +config PHY_EXYNOS5_USBDRD_TYPEC
> +	tristate
> +	depends on ARCH_EXYNOS
> +	depends on ARM || TYPEC || !TYPEC
> +	default y
> +
> =C2=A0config PHY_EXYNOS5_USBDRD
> =C2=A0	tristate "Exynos5 SoC series USB DRD PHY driver"
> =C2=A0	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
> =C2=A0	depends on HAS_IOMEM
> -	depends on TYPEC || (TYPEC=3Dn && COMPILE_TEST)

Is it not possible to just drop the '&& COMPILE_TEST' part to make
it
  depends on TYPEC || TYPEC=3Dn
or
  depends on TYPEC || !TYPEC
(without any of the other changes)?

If not, why not, are there corner cases that doesn't catch? Some
minimal testing seems to suggest that that works, too.

Cheers,
Andre'

> =C2=A0	depends on USB_DWC3_EXYNOS
> +	depends on PHY_EXYNOS5_USBDRD_TYPEC
> =C2=A0	select GENERIC_PHY
> =C2=A0	select MFD_SYSCON
> =C2=A0	default y
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsu=
ng/phy-exynos5-usbdrd.c
> index ff2436f11d68..6d571dff2898 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -1456,6 +1456,7 @@ static int exynos5_usbdrd_setup_notifiers(struct ex=
ynos5_usbdrd_phy *phy_drd)
> =C2=A0{
> =C2=A0	int ret;
> =C2=A0
> +	/* See CONFIG_PHY_EXYNOS5_USBDRD_TYPEC */
> =C2=A0	if (!IS_ENABLED(CONFIG_TYPEC))
> =C2=A0		return 0;
> =C2=A0


