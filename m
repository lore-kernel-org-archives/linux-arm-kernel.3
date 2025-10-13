Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98351CCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 15:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJ71KTvKAMUC1AACHaaj8OA3SEI5NusmyGpJc9+nnWQ=; b=E7nlENdI/vYUmaUAEnVUtv0ppP
	f4Et8XttzNDUqgrFoFtznoHUOq3k4CSOpftSbPnWt/5mjWY7tkBq6UC6qL766n1H98l7fEtrd+Loq
	EarqxghslvKWVsZZXf69l8BxsdiM+3hxXSConkk+bEmYKVzpPpvZsLgfTBU3knHFEV2RMrGarxvKV
	faCIDY2HRFape1w6t4CnItYlXiQRHRDG3ukUkGmJl0/MNH/WQMshPAFhRhCZjWYe0IvJkVbRCbzvJ
	nf4RU3WodY3Ocel6SQcquYpd32g88Ak8kugNLHcq+OwEcwck4ccX+UtSBJUh5agqv6b2ZdSx7vCnK
	sZ9mUVjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KiB-0000000Dk5T-1cMx;
	Mon, 13 Oct 2025 15:43:47 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Ki8-0000000Dk4d-3V1A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 15:43:46 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-62fa062a1abso8173813a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 08:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760370223; x=1760975023; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJ71KTvKAMUC1AACHaaj8OA3SEI5NusmyGpJc9+nnWQ=;
        b=WLo38Wex7lEYgNoy5Nz90Gm6Jq8FQgrgX823hI5Wiu95yX1qgWAtKpL0bEaWyTvJrt
         DcaZoH40jQDxGqqi/LsiptyScHyz1HPbZAoRv1x8fScCNpwO+eOFf+F6xa9NUTXaH5PA
         Av4Hk/0gkg8R7IOZfJXUGDJSMckjq6nR0GPjetviuXOPN20EyE5CTE0XcoAjB0cQWWOl
         B5+I0w9OrWQCZjAxhp+t31GUf3g48uiokYPdaqssm9VEgXXM8acAJSUOjnmBh2Mhwp0h
         53NWkOYw+UiSy11w7IvHY/GI/CKqD/uulpwKvy9LE/9+yD4lyW7zjPkMCOSfl17UCVpZ
         jWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760370223; x=1760975023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJ71KTvKAMUC1AACHaaj8OA3SEI5NusmyGpJc9+nnWQ=;
        b=b85fGHH0FVKPkpOme9v0zaE7NsS0hRMU3220W5U08Hr/Tj/9qUj19McRL4S81oZQlT
         j5WFo6lo8A3boZzArBYIylZKCcL3z0rRTZg31G82vkTGyQhNDxKLbm+Wplnakf9fML4f
         4ojwRmthScX+KQpmC1ypTgQ6v31qXEk95n4K2R/LxmlmJQIbND+mIZD9ckcFqc+inJnw
         U+PlBbMr1pw+zwUwg8Uer6CPsn0+7LQB/lp2CMXBRAIJuvufui8kc9+eqFiIoZIePnep
         KOVGJdtQ5Lt4PiIEVz4MPUvnpA9wxDWuh5NVA4A3YN17oUSPVl3cixVmDGoPubi9FmY0
         CiFA==
X-Forwarded-Encrypted: i=1; AJvYcCWUP6wAkomp1tFKwjbSAlsj+zGgadomD+EEUWdeLwu8YgozGOcVqs1aaxQXWuE+6f26qZjIsaVlV4TUcJAOYJQe@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4hSuIJz8C/9A9dKQ+XUhUbZVQZMlVTSm734+EQYrn9ystB5RH
	Lx4ynOnpvyuKh9Ts8sqOzmD9/0GBnJI0rhfKmuuqACR+RgAh0kxafFpYZzdwaJM4
X-Gm-Gg: ASbGnctBOe/NqDTbxQuJ5XDS0h4hHcdudJKzC2CGkFwi0SC6v3ITWuktMMC8nuEXk5c
	9Fcb8PTzT8xWVMMxxiliTXNP49DcliVcV/c01MG6e7ybjIDKltioR1yAzMmnIVnzgujvkSvrWPt
	AInDeDh31n7kG9VPSS8IkG9/UwTQ9XowZcdyyzOWUVnIq8NeZIa+PhjG2NSYFKogRxvdmUJPGtV
	bBwDC18d7ociB8WMBNztExgE+cABacyrbz1rUeQMNvZkru/C3qMZo4C7IHEAEgGYuFkX+2kvxpR
	jST8up4heNB8pporT2xHVhEOjRtQlyy4emX0FZSIm/SN/D3NY3PEMqPEN9YvQftoFqZd6Ed01fN
	DnnMfr90UNEftEO8PZmcqd9o88yq46Cklv847JtGfrT1yc9wX9twj4Y5PNSLNlFwIbRu0Kn9lwI
	dFGe4ipdMVFLpA7htOaNmP3P8=
X-Google-Smtp-Source: AGHT+IG3FRsw4wCBnmi9CngEI7WoVxEvQAt2WNJU3I/XEDcpUDTwP0J77KuXRMbbHoTA+pSwJQSXNw==
X-Received: by 2002:a05:6402:b28:b0:634:6d87:1d28 with SMTP id 4fb4d7f45d1cf-639d5c74a9fmr13775050a12.35.1760370222659;
        Mon, 13 Oct 2025 08:43:42 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c133f58sm9091983a12.30.2025.10.13.08.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 08:43:42 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH v2 15/15] arm64: dts: allwinner: h616: add NAND controller
Date: Mon, 13 Oct 2025 17:43:39 +0200
Message-ID: <2800174.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20251013152645.1119308-16-richard.genoud@bootlin.com>
References: <20251013152645.1119308-1-richard.genoud@bootlin.com>
 <20251013152645.1119308-16-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_084344_883961_2C0AC365 
X-CRM114-Status: GOOD (  15.61  )
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

Dne ponedeljek, 13. oktober 2025 ob 17:26:45 Srednjeevropski poletni =C4=8D=
as je Richard Genoud napisal(a):
> The H616 has a NAND controller quite similar to the A10/A23 ones, but
> with some register differences, more clocks (for ECC and MBUS), more ECC
> strengths, so this requires a new compatible string.
>=20
> Add the NAND controller node and pins in the device tree.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> ---
>  .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-h616.dtsi
> index ceedae9e399b..bb53c6c63836 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -304,6 +304,42 @@ mmc2_pins: mmc2-pins {
>  				bias-pull-up;
>  			};
> =20
> +			/omit-if-no-ref/
> +			nand_pins: nand-pins {
> +				pins =3D "PC0", "PC1", "PC2", "PC5", "PC8", "PC9",
> +				       "PC10", "PC11", "PC12", "PC13", "PC14",
> +				       "PC15", "PC16";
> +				function =3D "nand0";
> +			};
> +
> +			/omit-if-no-ref/
> +			nand_cs0_pin: nand-cs0-pin {
> +				pins =3D "PC4";
> +				function =3D "nand0";
> +				bias-pull-up;
> +			};
> +
> +			/omit-if-no-ref/
> +			nand_cs1_pin: nand-cs1-pin {
> +				pins =3D "PC3";
> +				function =3D "nand0";
> +				bias-pull-up;
> +			};
> +
> +			/omit-if-no-ref/
> +			nand_rb0_pin: nand-rb0-pin {
> +				pins =3D "PC6";
> +				function =3D "nand0";
> +				bias-pull-up;
> +			};
> +
> +			/omit-if-no-ref/
> +			nand_rb1_pin: nand-rb1-pin {
> +				pins =3D "PC7";
> +				function =3D "nand0";
> +				bias-pull-up;
> +			};
> +
>  			/omit-if-no-ref/
>  			spi0_pins: spi0-pins {
>  				pins =3D "PC0", "PC2", "PC4";
> @@ -377,6 +413,21 @@ iommu: iommu@30f0000 {
>  			#iommu-cells =3D <1>;
>  		};
> =20
> +		nfc: nand-controller@4011000 {
> +			compatible =3D "allwinner,sun50i-h616-nand-controller";
> +			reg =3D <0x04011000 0x1000>;
> +			interrupts =3D <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_NAND>, <&ccu CLK_NAND0>,
> +				<&ccu CLK_NAND1>, <&ccu CLK_MBUS_NAND>;
> +			clock-names =3D "ahb", "mod", "ecc", "mbus";
> +			resets =3D <&ccu RST_BUS_NAND>;
> +			reset-names =3D "ahb";
> +			dmas =3D <&dma 10>;
> +			dma-names =3D "rxtx";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};

Sorry, forgot to mention. This should be marked as disabled, as most of
the boards don't have NAND connected.

Best regards,
Jernej

> +
>  		mmc0: mmc@4020000 {
>  			compatible =3D "allwinner,sun50i-h616-mmc",
>  				     "allwinner,sun50i-a100-mmc";
>=20





