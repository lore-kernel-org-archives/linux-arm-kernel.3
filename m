Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61121C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 20:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+xKJPxoezPNnnND0yDX48KaYUre21NZBYNrLoOBNv4=; b=UdoszFvm/kaTw07b+LUJLDujS2
	HbnhzOobqoGPHEkNLIEQSv4CDLgyukVMF0LQUBAqC6EcYP1Psqtkqg9CYyiw/18KRhGQiO2XTBuEG
	q2OaWIbOlsue0flvqG5lYqqIUeNZN30gZ9izPjbuigyXMyScdJN5SHSFCAZ8z2jQAGJ7d6Rpzpvmk
	c97TiUvs4z8Vetv1Aku8Nqc8sDkAeN+kqwY2lhOlP7ROYmIuY8gLyxXWB08PlATdB6AlKM0iftel1
	0qkW6CRNcW/Oly8KWln1PiNs4XRRxIWlgcyu+maXtr9qIDQ+MIu1E1nSrE+y+oOUkxxfKLAbUJC+A
	93suwTMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEZNW-0000000AbOS-0x1v;
	Mon, 12 May 2025 20:03:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEY6Y-0000000AR4g-28AO
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 12 May 2025 18:42:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:MIME-Version:In-Reply-To:References:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=v+xKJPxoezPNnnND0yDX48KaYUre21NZBYNrLoOBNv4=; b=gWJ3ic9Xj0SXgI5hQ3PLL59x6I
	aVR2qXcdPihPeA2yaXTNV7lU37tr7eQRtGeu4vArGO6HdKKpn5iq7LbeC+dX3/qluWODQyApptpBQ
	wn0k6UYwbt0pQViFWloQTh8+FEbkDf225Wwaf3UWBzHr7V13FGJQWr72p0MOwgvH09kx1wICRK4tc
	tIQUHJhSQvonh7KmOBg1crgiTYbfzqpElH8dV650il8IuuA4SDrrJIKDUugGmfK7J438OISPERNR9
	X2bhlIFco3CBTFPFMq54HLKH11LRP4ythTo4k5nT2sloG2HSZnFIh5VaUDm5zKYFytErThKO7BX5F
	JO6cDNOw==;
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uEY6U-0000000GnrD-1wDB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 18:42:20 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-525b44b7720so1673943e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 11:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747075332; x=1747680132; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:thread-index:mime-version:in-reply-to
         :references:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v+xKJPxoezPNnnND0yDX48KaYUre21NZBYNrLoOBNv4=;
        b=AdYix0qOESPqJxU0MdesWzr3uiGIkb34GtarfNrHbOn3JmvHY3gpih3AZzPVdrhdS2
         ORcXifYRBntuMmbP6iHFerswhR0bap3+v7vv3bJcKYi+rKAbC5WJl6nEkGeuFz5eK3xk
         zkK4SS12WscodFhJVrwuJ954cWd/DCZ9pnBw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747075332; x=1747680132;
        h=cc:to:subject:message-id:date:thread-index:mime-version:in-reply-to
         :references:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+xKJPxoezPNnnND0yDX48KaYUre21NZBYNrLoOBNv4=;
        b=qJYNEMzWSjr5tsAJkJclbF3AX6BPn8tQqkuoeh/NvL2hiyofVxtMp5nBbLCWIxwXC6
         6VP1/sDESWRsz6MSV6Wpsg3/+/UHG+kLkNu0OaIA26JZqdhEd2qVTnEqV/69fOLV7nVs
         +Wpet7QEqeQpv+jvnrgZgmsGPUhehN9x1ESpt6oIJAbHXFAo9IzUy6CvDAGuqAWjE3Nm
         iR3xVBcKw6T4Xa62csGLT+OxtpDGPNLvbHYYB66EqSzSUoOJnSGK9RJEMlWX/t+0CtUc
         gjXL7lXtw6CCPKOx5URwdn/ymNBdoxJLo8Zt7cgenA1Bi9KfvT0qSnxDGaDLnOKZumd1
         NGAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfRiLeT8j6Pinngjnq7/TzV2+loOvzICv8aEtt1jUcJCVzZxmHW6ytaRJ5ggnBW3MJNZ7kDoRJibgpwT7wWNbf@lists.infradead.org
X-Gm-Message-State: AOJu0YxJYqlOHL/8KuIn/iI7qcTTrbYXHRdz56kkFRQzxfSW20friKU+
	+tgbxdGGRMaaKQdorWOV1UKsDUaJ/8Iie/sRb1FmunCEhZ7v7dsVDBgiV/u9hPC0ew3ql4PDRVd
	hKdQQ5TWWeJ8/q32RnYEamU6L6ci4CTdi70UN
X-Gm-Gg: ASbGncv3KPYOORAlocGjpoCncS07UzO/9xI+L98B8ax6wP9KzJ5elN+PnHtefweZzAz
	pFXjC4wecsgLXrzwOFfGV1R/kLpJzfAx3yWP6hyhUQ7VTQ48dpKeYBATKig/IATP9pWi9Rjjadg
	AQvTZnidtjDQyGLOu05HjRRDTPoJWs01TlVQ==
X-Google-Smtp-Source: AGHT+IEkgA0exxXQ/5t20NXUTgqhhVKam0Bgs0VeW2PoCUjlDMR0IvycUMaOoXxZZF9cF6dNO1IU6OPm1D4Iaud2XTI=
X-Received: by 2002:a05:6122:17aa:b0:528:f40f:347f with SMTP id
 71dfb90a1353d-52c53b461e0mr11911235e0c.2.1747075331765; Mon, 12 May 2025
 11:42:11 -0700 (PDT)
From: William Zhang <william.zhang@broadcom.com>
References: <20250512-bcmbca-peripherals-arm-v3-0-86f97ab4326f@linaro.org> <20250512-bcmbca-peripherals-arm-v3-9-86f97ab4326f@linaro.org>
In-Reply-To: <20250512-bcmbca-peripherals-arm-v3-9-86f97ab4326f@linaro.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHRV/QBxSS57P/922lUlscQxKMBIAGOLJRWs9e51VA=
Date: Mon, 12 May 2025 11:42:14 -0700
X-Gm-Features: AX0GCFsRmW1EWpMIbhMXKkznpfsIbe3UdGbIV3Dgs4WSDxayeOvmTmobiWmQqvc
Message-ID: <8c2770047500fd6bcb51cbfe634cb182@mail.gmail.com>
Subject: RE: [PATCH v3 09/12] ARM64: dts: bcm4908: Add BCMBCA peripherals
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Olivia Mackall <olivia@selenic.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Florian Fainelli <f.fainelli@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000090e1c10634f4ac7d"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_194218_659589_BCB01B02 
X-CRM114-Status: GOOD (  21.43  )
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

--00000000000090e1c10634f4ac7d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Linus Walleij <linus.walleij@linaro.org>
> Sent: Monday, May 12, 2025 5:06 AM
> To: Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>;
> Conor Dooley <conor+dt@kernel.org>; William Zhang
> <william.zhang@broadcom.com>; Anand Gore <anand.gore@broadcom.com>;
> Kursad Oney <kursad.oney@broadcom.com>; Florian Fainelli
> <florian.fainelli@broadcom.com>; Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.p=
l>;
> Broadcom
> internal kernel review list <bcm-kernel-feedback-list@broadcom.com>;
> Olivia
> Mackall <olivia@selenic.com>; Ray Jui <rjui@broadcom.com>; Scott Branden
> <sbranden@broadcom.com>; Florian Fainelli <f.fainelli@gmail.com>
> Cc: devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-
> crypto@vger.kernel.org; Linus Walleij <linus.walleij@linaro.org>
> Subject: [PATCH v3 09/12] ARM64: dts: bcm4908: Add BCMBCA peripherals
>
> All the BCMBCA SoCs share a set of peripherals at 0xff800000,
> albeit at slightly varying memory locations on the bus and
> with varying IRQ assignments. ARM64 SoCs have additional
> peripherals at 0xff858000, we extend the peripheral bus
> range to 0x400000 to cover this area.
>
> Add the watchdog, remaining GPIO blocks, RNG, and DMA blocks
> for the BCM4908 based on the vendor files 4908_map_part.h
> and 4908_intr.h from the "bcmopen-consumer" code drop.
>
> This SoC has up to 320 possible GPIOs due to having 10
> registers with 32 GPIOs in each available.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi | 116
> ++++++++++++++++++++++-
>  1 file changed, 113 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi
> b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi
> index
> 613ba7ee43d6489ea0f1490d2fccaf90961b2694..3b7595fd4e81d150278816bbe
> 27e08286cde2ff8 100644
> --- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi
> @@ -323,11 +323,12 @@ pmb: power-controller@2800c0 {
>  		};
>  	};
>
> +	/* PERF Peripherals */
>  	bus@ff800000 {
>  		compatible =3D "simple-bus";
>  		#address-cells =3D <1>;
>  		#size-cells =3D <1>;
> -		ranges =3D <0x00 0x00 0xff800000 0x3000>;
> +		ranges =3D <0x00 0x00 0xff800000 0x400000>;
>
>  		twd: timer-mfd@400 {
>  			compatible =3D "brcm,bcm4908-twd", "simple-mfd",
> "syscon";
> @@ -348,13 +349,103 @@ watchdog@28 {
>  			};
>  		};
>
> -		gpio0: gpio-controller@500 {
> +		/* GPIOs 0 .. 31 */
> +		gpio0: gpio@500 {
>  			compatible =3D "brcm,bcm6345-gpio";
> +			reg =3D <0x500 0x04>, <0x528 0x04>;
>  			reg-names =3D "dirout", "dat";
> -			reg =3D <0x500 0x28>, <0x528 0x28>;
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +		};
> +
> +		/* GPIOs 32 .. 63 */
> +		gpio1: gpio@504 {
> +			compatible =3D "brcm,bcm6345-gpio";
> +			reg =3D <0x504 0x04>, <0x52c 0x04>;
> +			reg-names =3D "dirout", "dat";
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			status =3D "disabled";
> +		};
> +
> +		/* GPIOs 64 .. 95 */
> +		gpio2: gpio@508 {
> +			compatible =3D "brcm,bcm6345-gpio";
> +			reg =3D <0x508 0x04>, <0x530 0x04>;
> +			reg-names =3D "dirout", "dat";
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			status =3D "disabled";
> +		};
>
> +		/* GPIOs 96 .. 127 */
> +		gpio3: gpio@50c {
> +			compatible =3D "brcm,bcm6345-gpio";
> +			reg =3D <0x50c 0x04>, <0x534 0x04>;
> +			reg-names =3D "dirout", "dat";
> +			gpio-controller;
>  			#gpio-cells =3D <2>;
> +			status =3D "disabled";
> +		};
> +
> +		/* GPIOs 128 .. 159 */
> +		gpio4: gpio@510 {
> +			compatible =3D "brcm,bcm6345-gpio";
> +			reg =3D <0x510 0x04>, <0x538 0x04>;
> +			reg-names =3D "dirout", "dat";
>  			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			status =3D "disabled";
> +		};
> +
> +		/* GPIOs 160 .. 191 */
> +		gpio5: gpio@514 {
> +			compatible =3D "brcm,bcm6345-gpio";
> +			reg =3D <0x514 0x04>, <0x53c 0x04>;
> +			reg-names =3D "dirout", "dat";
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			status =3D "disabled";
> +		};
> +
> +		/* GPIOs 192 .. 223 */
> +		gpio6: gpio@518 {
> +			compatible =3D "brcm,bcm6345-gpio";
> +			reg =3D <0x518 0x04>, <0x540 0x04>;
> +			reg-names =3D "dirout", "dat";
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			status =3D "disabled";
> +		};
> +
> +		/* GPIOs 224 .. 255 */
> +		gpio7: gpio@51c {
> +			compatible =3D "brcm,bcm6345-gpio";
> +			reg =3D <0x51c 0x04>, <0x544 0x04>;
> +			reg-names =3D "dirout", "dat";
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			status =3D "disabled";
> +		};
> +
> +		/* GPIOs 256 .. 287 */
> +		gpio8: gpio@520 {
> +			compatible =3D "brcm,bcm6345-gpio";
> +			reg =3D <0x520 0x04>, <0x548 0x04>;
> +			reg-names =3D "dirout", "dat";
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			status =3D "disabled";
> +		};
> +
> +		/* GPIOs 288 .. 319 */
> +		gpio9: gpio@524 {
> +			compatible =3D "brcm,bcm6345-gpio";
> +			reg =3D <0x524 0x04>, <0x54c 0x04>;
> +			reg-names =3D "dirout", "dat";
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			status =3D "disabled";
>  		};
>
>  		pinctrl@560 {
> @@ -584,6 +675,12 @@ leds: leds@800 {
>  			#size-cells =3D <0>;
>  		};
>
> +		rng@b80 {
> +			compatible =3D "brcm,iproc-rng200";
> +			reg =3D <0xb80 0x28>;
> +			interrupts =3D <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
>  		hsspi: spi@1000 {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
> @@ -636,6 +733,19 @@ reset-controller@2644 {
>  				#reset-cells =3D <1>;
>  			};
>  		};
> +
> +		pl081_dma: dma-controller@59000 {
> +			compatible =3D "arm,pl081", "arm,primecell";
> +			// The magic B105F00D info is missing
> +			arm,primecell-periphid =3D <0x00041081>;
> +			reg =3D <0x59000 0x1000>;
> +			interrupts =3D <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> +			memcpy-burst-size =3D <256>;
> +			memcpy-bus-width =3D <32>;
> +			clocks =3D <&periph_clk>;
> +			clock-names =3D "apb_pclk";
> +			#dma-cells =3D <2>;
> +		};
>  	};
>
>  	reboot {
>
> --
> 2.49.0

Reviewed-by: William Zhang <william.zhang@broadcom.com>

--00000000000090e1c10634f4ac7d
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
YDZuuBJwnyCzevMoPtVYPharioL5H3BRnQi8YoTXH7/uRo33dewYFm474yFjwwnt82TFtveVZkVq
6h4WIQ4wTcwFfET8zMkELnGzS5SHCl8sPD+lNxxJ1JDZYwIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRp3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUq65GzwZxydFHjjYEU/9h
xHhPWlwwDQYJKoZIhvcNAQELBQADggEBAA2hGG3JPAdGPH0ZdohGUCIVjKz+U+EFuIDbS6A/5jqX
VhYAxZlzj7tSjUIM7G7IhyfqPC46GKJ/4x+Amz1Z6YxNGy71L68kYD6hIbBcA5AM42QBUufly6Oa
/ppSz3WoflVyFFQ5YXniZ+eU+2/cdnYZg4aVUnFjimOF5o3NfMLzOkhQNxbaDjFUfUYD8hKmU6v4
0vUBj8KZ9Gi1LIagLKUREn8jku0lcLsRbnJ5Ey5ScajC/FESPyYWasOW8j8/1EoJksmhbYGKNS6C
urb/KlmDGfVrIRYDbL0ckhGQIP5c6L+kSQZ2sHnQK0e0WgIaZYxaPYeY5u0GLCOze+3vyRMxggJg
MIICXAIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwxuh2XG3FXRL1W
JOEwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEICeagx9b39lM8akOh47uecI4wcee
Vvwah/QXwPyuYJRfMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1
MDUxMjE4NDIxMlowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3
DQEBAQUABIIBAIBcwUzms7YKj90T6xXkTCnWJL+NsGARhgAqau+/bUowkGggcYGcrYb3e82b4ETv
FmLqNjBhp8YFG8kzaYbyURz/waAzPqxjRp3NK14UbyZA5EKsMji6rn9xaZSTs6sDccbQHLL/jGDl
B+T3Ev+CbyqQUcmgMA+isLE9QddGmdzBOxoKRXE8Pp9Q2z+CCd6ItqHGCjj0rBhIvtsTUSmMVeJH
FpKYRmDc2HwrS5pCJS1wp8WtHtXiLEWUWrc95irotR7GQgzB/YoUxnPtVEgerTWT7QCbbaOYHfE2
b29ZjcOAvugVbn4k7shhzOB9QiHLTzA9vA4gRp8wjISIR7SPAhY=
--00000000000090e1c10634f4ac7d--

