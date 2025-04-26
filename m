Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1214C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 01:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZb1PBPcPQCoLdwgJJp25zYxjMfJLD54/d3w88JKoaY=; b=Id6Nb7g2sSezJ4lScrdCD6f2nx
	jC9m3tlw8a2qHvy7kfIWPPq+MRlJ+tHHIz7UI8D1Fgi2ZANnLAxsQH1YnYBvtVAEcX+nIjJP2Cynp
	L1/SLQy+mSF5XDubf1aU/4BqAe/AWmsfXfZI/MU++uzCC52q+ylbyUf9gOMmh5BusjyrkcBiIGG0W
	cVPrc4v/PtDcLiiqhEHyPwMUD+a5ESA+QHFiHowhU7nc4kBHJ7VWF8mGz95nRcpzkeC3XVFXGkbfO
	rA25rn2OR7cmxBs33Koz9Qir8KnuFIPc3UqWYRn3o7Hyqzr3+qppt2Jloh4Qt+/B6rqDr4U1cOgFs
	xP3aTMLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8UBv-00000001FN5-3bTE;
	Sat, 26 Apr 2025 01:18:51 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8UA3-00000001F5i-2V3U
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 01:16:57 +0000
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-86fbb48fc7fso1187697241.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 18:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745630214; x=1746235014; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:thread-index:mime-version:in-reply-to
         :references:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gZb1PBPcPQCoLdwgJJp25zYxjMfJLD54/d3w88JKoaY=;
        b=Hac5Z1yic/oA7LLilDqqa8XYekyUbF7lF23FbB1LFLVSWtNDtn1Wm8ioSEg2ARYhi7
         3zZpeNe0hHSh564daAAfVjP0c7ZL23qrUloao4Gz7Sh0REPwhoifa3EGP93JCbnD8ETH
         oemC0TSIPSQK5gcYNsgZ7HvgBmk7pqcjmACPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745630214; x=1746235014;
        h=cc:to:subject:message-id:date:thread-index:mime-version:in-reply-to
         :references:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZb1PBPcPQCoLdwgJJp25zYxjMfJLD54/d3w88JKoaY=;
        b=ZvzO7uxSHhmJru8b160u1xUjBOoAI0JvZQzGpWcmjcL2HDyDlRq6HD16bh4ZeRpQ3e
         1hAdz+4H6qF7GhPun+0rvvmtFqybzEqkhTTa9eQkIyjacuxOUs0KBvB9/lqZvMepRt4y
         5gIJBWEt02/OjgrY476SnkwfoOufILwvJv0e9HV9+HGHekVuTVOH01TS6UMi5HU40nb5
         EGjAXBu2/dhCojXGODE8pwJup6HwR3ADamMio3OQaqkyDHyaajeM/4YjB/k8BN6u8ZNn
         pNjlxK+HxuLxtTsUbhRvQxjzz9HH3WqFDWE3ml/OWyH9vBLnMNjx8lvRY/8u4Q/FI/PQ
         qM0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhlWsvaxH7+5sTVUEAFdDrj5+YnfDE1egnc59Vp9Q8hddpMUm8luQrNlnvvbkH2B+ax/LgkZM5NK2/u7gzSroD@lists.infradead.org
X-Gm-Message-State: AOJu0YxvOi2uvDGlFbgLU6K1k4kqNtXA40leX2mJOPM80MUifFHOgHE0
	O4K6+2BhMbr3RT9IZmrGF6wjprkwhdHbzJe2ZAmyz+6ZCwuJAewWAQPnFhnpgeF5wrNvrabqL+f
	pOYzmhNq8fAppFFUM53FkuYi4kt0fFvrFEP98
X-Gm-Gg: ASbGncvg++VISkTdmL/4d7h8DsiDZlWGGI+92TBuz0Rm/quGjFJvaj6xGHxAbP66EyQ
	gg1w1NZtgT/SPssxTtWqotrrXwlezFlMuL2bfKVcNrMk1p8U8AveinpMxikecarLIylYHhrbVwr
	f2iKpLfEa9CoL0tRTQpl/Ypk0=
X-Google-Smtp-Source: AGHT+IGil3LEh9eeoT1byzFdjlqDrvRdKwTJNb9NhVKefwH2V1GhNDCKV7Rb2lOaiogDHTiEw072YuMbm6XewD0w+LM=
X-Received: by 2002:a05:6102:801b:b0:4c1:9738:820d with SMTP id
 ada2fe7eead31-4d5437da8a0mr2717095137.6.1745630214405; Fri, 25 Apr 2025
 18:16:54 -0700 (PDT)
From: William Zhang <william.zhang@broadcom.com>
References: <20250406-bcmbca-peripherals-arm-v2-0-22130836c2ed@linaro.org> <20250406-bcmbca-peripherals-arm-v2-11-22130836c2ed@linaro.org>
In-Reply-To: <20250406-bcmbca-peripherals-arm-v2-11-22130836c2ed@linaro.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKk0Iba5S5vFfMGFNn0Sizjy9mbxwJW/gRIshA4knA=
Date: Fri, 25 Apr 2025 18:16:51 -0700
X-Gm-Features: ATxdqUFQCFYeDJD3ZTzm3lnx7U3LqN9PhRrczZt6-7NaXRchs_hfTw7F_YO7yl8
Message-ID: <d79ea203c3be97602afa1bede073551f@mail.gmail.com>
Subject: RE: [PATCH v2 11/12] ARM64: dts: bcm6858: Add BCMBCA peripherals
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
	boundary="000000000000dbe0100633a43457"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_181655_647077_72E829E2 
X-CRM114-Status: GOOD (  24.73  )
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

--000000000000dbe0100633a43457
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Linus Walleij <linus.walleij@linaro.org>
> Sent: Sunday, April 6, 2025 8:33 AM
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
> Subject: [PATCH v2 11/12] ARM64: dts: bcm6858: Add BCMBCA peripherals
>
> All the BCMBCA SoCs share a set of peripherals at 0xff800000,
> albeit at slightly varying memory locations on the bus and
> with varying IRQ assignments. ARM64 SoCs have additional
> peripherals at 0xff858000. On BCM6858 the PERF window was
> too big so adjust it down to its real size (0x3000).
>
> Add the watchdog, GPIO blocks, RNG, LED, second UART and DMA
> blocks for the BCM6858 based on the vendor files 6858_map_part.h
> and 6858_intr.h from the "bcmopen-consumer" code drop.
>
> Curiously, on the BCM6858, the PL081 DMA block is separate
> from the two peripheral groups PERF and PERF1, so we put it
> in its own bus in the device tree to translate the fourcell
> addresses.
>
> This SoC has up to 256 possible GPIOs due to having 8
> registers with 32 GPIOs in each available.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi | 127
> ++++++++++++++++++++++-
>  1 file changed, 126 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi
> b/arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi
> index
> caeaf428dc15db3089bf4dc62c4a272782c22c3f..38331305e6da8eec39d02aeb0e
> 02f3b45e2f5c4d 100644
> --- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi
> @@ -111,11 +111,12 @@ gic: interrupt-controller@1000 {
>  		};
>  	};
>
> +	/* PERF Peripherals */
>  	bus@ff800000 {
>  		compatible =3D "simple-bus";
>  		#address-cells =3D <1>;
>  		#size-cells =3D <1>;
> -		ranges =3D <0x0 0x0 0xff800000 0x62000>;
> +		ranges =3D <0x0 0x0 0xff800000 0x3000>;
>
>  		twd: timer-mfd@400 {
>  			compatible =3D "brcm,bcm4908-twd", "simple-mfd",
> "syscon";
> @@ -136,6 +137,86 @@ watchdog@28 {
>  			};
>  		};
>
> +		/* GPIOs 0 .. 31 */
> +		gpio0: gpio@500 {
> +			compatible =3D "brcm,bcm6345-gpio";
> +			reg =3D <0x500 0x04>, <0x520 0x04>;
> +			reg-names =3D "dirout", "dat";
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			status =3D "disabled";
> +		};
> +
> +		/* GPIOs 32 .. 63 */
> +		gpio1: gpio@504 {
> +			compatible =3D "brcm,bcm6345-gpio";
> +			reg =3D <0x504 0x04>, <0x524 0x04>;
> +			reg-names =3D "dirout", "dat";
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			status =3D "disabled";
> +		};
> +
> +		/* GPIOs 64 .. 95 */
> +		gpio2: gpio@508 {
> +			compatible =3D "brcm,bcm6345-gpio";
> +			reg =3D <0x508 0x04>, <0x528 0x04>;
> +			reg-names =3D "dirout", "dat";
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			status =3D "disabled";
> +		};
> +
> +		/* GPIOs 96 .. 127 */
> +		gpio3: gpio@50c {
> +			compatible =3D "brcm,bcm6345-gpio";
> +			reg =3D <0x50c 0x04>, <0x52c 0x04>;
> +			reg-names =3D "dirout", "dat";
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			status =3D "disabled";
> +		};
> +
> +		/* GPIOs 128 .. 159 */
> +		gpio4: gpio@510 {
> +			compatible =3D "brcm,bcm6345-gpio";
> +			reg =3D <0x510 0x04>, <0x530 0x04>;
> +			reg-names =3D "dirout", "dat";
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			status =3D "disabled";
> +		};
> +
> +		/* GPIOs 160 .. 191 */
> +		gpio5: gpio@514 {
> +			compatible =3D "brcm,bcm6345-gpio";
> +			reg =3D <0x514 0x04>, <0x534 0x04>;
> +			reg-names =3D "dirout", "dat";
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			status =3D "disabled";
> +		};
> +
> +		/* GPIOs 192 .. 223 */
> +		gpio6: gpio@518 {
> +			compatible =3D "brcm,bcm6345-gpio";
> +			reg =3D <0x518 0x04>, <0x538 0x04>;
> +			reg-names =3D "dirout", "dat";
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			status =3D "disabled";
> +		};
> +
> +		/* GPIOs 224 .. 255 */
> +		gpio7: gpio@51c {
> +			compatible =3D "brcm,bcm6345-gpio";
> +			reg =3D <0x51c 0x04>, <0x53c 0x04>;
> +			reg-names =3D "dirout", "dat";
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			status =3D "disabled";
> +		};
> +
>  		uart0: serial@640 {
>  			compatible =3D "brcm,bcm6345-uart";
>  			reg =3D <0x640 0x18>;
> @@ -145,6 +226,29 @@ uart0: serial@640 {
>  			status =3D "disabled";
>  		};
>
> +		uart1: serial@660 {
> +			compatible =3D "brcm,bcm6345-uart";
> +			reg =3D <0x660 0x18>;
> +			interrupts =3D <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&periph_clk>;
> +			clock-names =3D "refclk";
> +			status =3D "disabled";
> +		};
> +
> +		leds: led-controller@800 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			compatible =3D "brcm,bcm63138-leds";
> +			reg =3D <0x800 0xdc>;
> +			status =3D "disabled";
> +		};
> +
> +		rng@b80 {
> +			compatible =3D "brcm,iproc-rng200";
> +			reg =3D <0xb80 0x28>;
> +			interrupts =3D <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
>  		hsspi: spi@1000 {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
> @@ -171,4 +275,25 @@ nandcs: nand@0 {
>  			};
>  		};
>  	};
> +
> +	/* This is NOT in the PERF1 Peripheral group on this SoC! */
> +	bus@ff859000 {
Ditto

> +		compatible =3D "simple-bus";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges =3D <0x0 0x0 0xff859000 0x1000>;
> +
> +		pl081_dma: dma-controller@0 {
> +			compatible =3D "arm,pl081", "arm,primecell";
> +			// The magic B105F00D info is missing
> +			arm,primecell-periphid =3D <0x00041081>;
> +			reg =3D <0x0 0x1000>;
> +			interrupts =3D <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> +			memcpy-burst-size =3D <256>;
> +			memcpy-bus-width =3D <32>;
> +			clocks =3D <&periph_clk>;
> +			clock-names =3D "apb_pclk";
> +			#dma-cells =3D <2>;
> +		};
> +	};
>  };
>
> --
> 2.49.0

--000000000000dbe0100633a43457
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
JOEwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIOb7anILVgzLVnAV5+2TcnJ9YyQ8
dYLSnXq1NkuSKQt+MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1
MDQyNjAxMTY1NFowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3
DQEBAQUABIIBAIvsKsEeRACZuxzKYBMHMVavW8zZADc1h6BQzY6v/VoY4Ipt+XzH85s2ZT8S0fcb
kbSS4kquJQ6nzcXTC7N5rGq+r7a4BQFG1+QmrYvltcc1Jqb/cmdtgbFQj5uNv7BUBgobGGoeQYE8
GraAmLSHhkplD+TMo5V0t6PSp1miYVmm08fTVvYdlQvjiLk3Epl3uqRCYV6Qx/NrJSgVDYEPzKFq
As6y7bevFxqdA6+vJu/lnViCPoitzPT8TQq0dHmZIRxnM9ZSKpLc/B5g7BcrQq/WTn/hlqPLqmE/
GAjIgKBUPKQN1YHhCVuWgtublrQEvQboKb4oIxJcjsaRzkLPsU4=
--000000000000dbe0100633a43457--

