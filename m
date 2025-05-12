Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF96C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 19:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fvN87LJ7ooSzx23jsJ2GGZ7pMNK93Qo8QVIAVOPoivc=; b=i4DWqtDRYhPgFMa2jhN1uj+HBi
	sQzuKpGHdj22q+a8XP6O4K3R0xx/AhPSdkIQ6XbYCPSJKXzeLnTeK0ZPiVGPpMtsxhVfL7kefOUSl
	T5eyYC85P1wi/BFGeJvoDuFyPXxhQPx2E9r3IDocklIrQ8pM2Drb96uUhSZeGXcuoDNOY30aCrHqN
	Xe5iiGbpWpca5YZACwP7kKO7h+VlsJH/Obil0BzS4RBzkarEc8CdO0inND6FCKVBMt7inmuGKxAuz
	pG/F6ogpnFiASC9MTDmU32MzGk8GAmT5klrEsL9aEv48O5j4k1Bg4y8xnze8Nw8oLBTJRElg/f9du
	GtEnnVWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEZ92-0000000AZw3-0vv4;
	Mon, 12 May 2025 19:49:00 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEY30-0000000AQWu-2KpN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 18:38:44 +0000
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-879467794efso2782745241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 11:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747075121; x=1747679921; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:thread-index:mime-version:in-reply-to
         :references:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fvN87LJ7ooSzx23jsJ2GGZ7pMNK93Qo8QVIAVOPoivc=;
        b=AS+57U2WkI8Ul0B7O9mCTseCQ96w5Sj0llpI8B3gnY9Boxfi1dzJlMAAOunI6qFZeM
         2e05f1MAaQI0a22rk4/CPg8yZ3tf7BPSS56gwFvYrLZy28w+yL7gSZeDlqfBIXfcrA7G
         27O61xprhyYeK8iYgiUMupGx1kg0XsBS6G8iA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747075121; x=1747679921;
        h=cc:to:subject:message-id:date:thread-index:mime-version:in-reply-to
         :references:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvN87LJ7ooSzx23jsJ2GGZ7pMNK93Qo8QVIAVOPoivc=;
        b=Urj/2Wi5/yEejMNs1WtAOZuDllfnGKuidJ1G7p+VXhnk021bydGPz3ShrU42PpKQJl
         V0P/jaPOxuwNX4hYK/Ouo+d60UYWlqQ3LXMoYiPDEQuld2StJU2S0It0wRoyDyjTp+SC
         LMGU79MF3stnKGJUwdljJjKP7Co67qj4weZaSjDGVqsg446gCYGHf95UWzb920MSgMGd
         SsGnKDM5qnmMWEaGTKVnT5MRNvlfrNGbh18I0zfMFKVZhyj8hFY77l0do2mI6WvsR6+/
         8Zw5OOGzqFpsU7ybEFdsVqkT6jI+wBR0X4ebnYFtnp5wiSuMlq1V5HgS3ZPTOxB/wf/L
         oaJg==
X-Forwarded-Encrypted: i=1; AJvYcCXxvhMPnBTF4AKb3Blk20Nqik//c6E5I6q5dC7PNdQZhJiHJbqFgnseTjMJ39u+n6uGylsHPsbc702R2K1EpL6s@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5v1k6oHsw5/l8QRR4vLjeqxH3rkN7dlQZQbfjZpNtxa2QWK6b
	pIbgSNeXuupVKLsxjT5C1w+bCbH+1ulqqf8p6xXke7OFCm74XDBnAZfYn80BIqrxHIXZNUjMQzt
	tLBZBTojawQIC/hsmVno54dEvkcu1worq2J9Y
X-Gm-Gg: ASbGncvotCk4CRlqaovc3Y+Czg6SzwJMzV3ocx+P3Q7p9Bcxyl3CMWfzkARpcol0+7v
	mo5c3ta6TcSsQO8wQKRe4SpkgOrujWvJWskq66E2nMQDE4q3SxIi81mUSCkDelk8E4BxkAwI+Wm
	hF+RhcX3SC9Pq9U7LQ0dcAa6bhvvh+gTLc/w==
X-Google-Smtp-Source: AGHT+IE0Sz40urjMO7i4nV9R2obB2O17e57EmJAKpUqsj68Als4eFWOXQtoU17ost2yMu/O7uTb/SMPwYPB8BAi15OI=
X-Received: by 2002:a67:e7cc:0:b0:4dd:b037:d23d with SMTP id
 ada2fe7eead31-4deed36f9ddmr12172709137.12.1747075121287; Mon, 12 May 2025
 11:38:41 -0700 (PDT)
From: William Zhang <william.zhang@broadcom.com>
References: <20250512-bcmbca-peripherals-arm-v3-0-86f97ab4326f@linaro.org> <20250512-bcmbca-peripherals-arm-v3-7-86f97ab4326f@linaro.org>
In-Reply-To: <20250512-bcmbca-peripherals-arm-v3-7-86f97ab4326f@linaro.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHRV/QBxSS57P/922lUlscQxKMBIAIfIZl9s9MxM1A=
Date: Mon, 12 May 2025 11:38:44 -0700
X-Gm-Features: AX0GCFtrt6anK59bFO3dXjzGgv7stVWxNDp5UQdVoz1WEmUtARNAUYWP1wUcV2A
Message-ID: <f347ff42d406ce1d378ea0cd1c118ce8@mail.gmail.com>
Subject: RE: [PATCH v3 07/12] ARM: dts: bcm63148: Add BCMBCA peripherals
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
	boundary="0000000000000483cf0634f4a0ef"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_113842_602025_1D1360BA 
X-CRM114-Status: GOOD (  19.41  )
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

--0000000000000483cf0634f4a0ef
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
> Subject: [PATCH v3 07/12] ARM: dts: bcm63148: Add BCMBCA peripherals
>
> All the BCMBCA SoCs share a set of peripherals at 0xff800000,
> albeit at slightly varying memory locations on the bus and
> with varying IRQ assignments.
>
> Add the GPIO, RNG and LED and DMA blocks for the
> BCM63148 based on the vendor files 63148_map_part.h and
> 63148_intr.h from the "bcmopen-consumer" code drop.
>
> This SoC has up to 160 possible GPIOs due to having 5
> registers with 32 GPIOs in each available.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/boot/dts/broadcom/bcm63148.dtsi | 64
> ++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm63148.dtsi
> b/arch/arm/boot/dts/broadcom/bcm63148.dtsi
> index
> 53703827ee3fe58ead1dbe70536d7293ad842d0c..e071cddb28fc2888b8f408b4b
> c275290dd135642 100644
> --- a/arch/arm/boot/dts/broadcom/bcm63148.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm63148.dtsi
> @@ -99,6 +99,62 @@ bus@ff800000 {
>  		#size-cells =3D <1>;
>  		ranges =3D <0 0xfffe8000 0x8000>;
>
> +		/* GPIOs 0 .. 31 */
> +		gpio0: gpio@100 {
> +			compatible =3D "brcm,bcm6345-gpio";
> +			reg =3D <0x100 0x04>, <0x114 0x04>;
> +			reg-names =3D "dirout", "dat";
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			status =3D "disabled";
> +		};
> +
> +		/* GPIOs 32 .. 63 */
> +		gpio1: gpio@104 {
> +			compatible =3D "brcm,bcm6345-gpio";
> +			reg =3D <0x104 0x04>, <0x118 0x04>;
> +			reg-names =3D "dirout", "dat";
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			status =3D "disabled";
> +		};
> +
> +		/* GPIOs 64 .. 95 */
> +		gpio2: gpio@108 {
> +			compatible =3D "brcm,bcm6345-gpio";
> +			reg =3D <0x108 0x04>, <0x11c 0x04>;
> +			reg-names =3D "dirout", "dat";
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			status =3D "disabled";
> +		};
> +
> +		/* GPIOs 96 .. 127 */
> +		gpio3: gpio@10c {
> +			compatible =3D "brcm,bcm6345-gpio";
> +			reg =3D <0x10c 0x04>, <0x120 0x04>;
> +			reg-names =3D "dirout", "dat";
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			status =3D "disabled";
> +		};
> +
> +		/* GPIOs 128 .. 159 */
> +		gpio4: gpio@110 {
> +			compatible =3D "brcm,bcm6345-gpio";
> +			reg =3D <0x110 0x04>, <0x124 0x04>;
> +			reg-names =3D "dirout", "dat";
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			status =3D "disabled";
> +		};
> +
> +		rng@300 {
> +			compatible =3D "brcm,iproc-rng200";
> +			reg =3D <0x300 0x28>;
> +			interrupts =3D <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
>  		uart0: serial@600 {
>  			compatible =3D "brcm,bcm6345-uart";
>  			reg =3D <0x600 0x20>;
> @@ -108,6 +164,14 @@ uart0: serial@600 {
>  			status =3D "disabled";
>  		};
>
> +		leds: led-controller@700 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			compatible =3D "brcm,bcm63138-leds";
> +			reg =3D <0x700 0xdc>;
> +			status =3D "disabled";
> +		};
> +
>  		hsspi: spi@1000 {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
>
> --
> 2.49.0

Reviewed-by: William Zhang <william.zhang@broadcom.com>

--0000000000000483cf0634f4a0ef
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
JOEwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIHdL9UBqa8aQYxU1ysNEiCxMd4vF
BiNRHSRmj23PQsAKMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1
MDUxMjE4Mzg0MVowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3
DQEBAQUABIIBAHzENBA825BfRnR7cooBbH6asml9ucsquz6rq08meISc4T9am7iD9TFk9K7r3rm3
lyQYXst48brWIXxgt5v8MsOgr1u2DC5/dO4jHtYdW873Aw1FrRzXfSd1R+7+ZJwPZ1Z8vD54fkYN
RR34aIQjPwKKjnmDJ16pGfGQiLhm198bfZhjnu8FTGUYHNeM/KcOef7zxZA0HHJvdlBzR4Vb8c8Y
nH6EgsjNg73/UMxLNXgYxF+NSSmQ/Ryxz5Sjt3BFqDIRdrEr/2+aGmgi9gnpT26x8ZDbEdn58u8j
z+ad3mdO4c43kXZT80OszKmk4M0+WZTRbiG/rlc5ypTmN/Okl7g=
--0000000000000483cf0634f4a0ef--

