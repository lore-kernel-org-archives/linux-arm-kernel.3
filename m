Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5FFC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 01:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEf0tfLlAZujjYkEpdZQSHgrURfpFjhewgBKT1ZDn88=; b=vOulkwSLFOgwqeI0ua9nqeUAOJ
	ZXxDhsoDPZllHhRPs7Z5qiJvsb8Mo8h6ZvUaonh36FamX9CUu6pL83pbzgVl5wYSx2KWUPpYigM2i
	hvfimvY6XHQm6xAz74kJoGeqQJiyvX7t+LPqC8az3uCMPosdyrRGcqez7o3C69jhJyvDY42XdK2L8
	8EElQOdXJY8xVSW6RjQxTU88YvUQ/LxwgomcfaOHgKucbPcjzXjbWU9Wnk2sQoPXmAnSU2+a0t5Bi
	PE5M/p7W05Z8W5dM1bG/NQKMNpODTLE3Ng6D9/szr289yl+Ck6x49Cvtc9uqfZxYgmzy5xOxzPWtU
	WFOmbTTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Tvv-00000001E48-0Yhn;
	Sat, 26 Apr 2025 01:02:19 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Tu2-00000001DxS-2mdZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 01:00:24 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-525b44ec88aso1339683e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 18:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745629221; x=1746234021; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:thread-index:mime-version:in-reply-to
         :references:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HEf0tfLlAZujjYkEpdZQSHgrURfpFjhewgBKT1ZDn88=;
        b=XLKLDZ6T2O0Ij58VpGHB2qAbdjqu609JqMvnOkqAxMwLm1uJjv9H29cTRJcf/LEZMZ
         r8GX+4BpK03nSdbQf7l+UF46LAsJC/xtsbCYa6Ed6hNuY7AlHnZYv4S+AiWwfMUllMXF
         oj8RZY/qbcr41OsboJSmD4JygxF1IZp4RzQR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745629221; x=1746234021;
        h=cc:to:subject:message-id:date:thread-index:mime-version:in-reply-to
         :references:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEf0tfLlAZujjYkEpdZQSHgrURfpFjhewgBKT1ZDn88=;
        b=vm1hFrDMk525+c5qQ7qglwR+s0e7xYdw+R542/CgA0op8HN8vXr13fmZD3xxZKloRp
         Fjzc1Ww8N9OphktSi+wayokO554PG8VTChbKyaGCZ/vtJjjBIOGsehgEav0rDZqkApqV
         z4gxxPvUWITbctm3yDxDJ6q3BVXWFZyq4SNXxZ3MPEbP0Z154psoct9baI5oNa2sncWi
         g6Xljr9n9M45weH11UEflMmuetm1Zibw1V7RWIFL4NMe/Hb1PTZsfZvOvyG1Yw1ed0Bl
         AUYnUouLDWzoL9MH9QG7b01B66qtG3wgR+UYtEdF48j7WyWw9ygcsGNo0qsCvcHAZjoW
         99XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlg1lxyeojnAy6omJ7xMjojAfA9KodJa/IWaOwtJZSkVsCcJ3X/HJkY0I1IplDyd4d2xGdw+RxxmDIekkXMNvN@lists.infradead.org
X-Gm-Message-State: AOJu0YxYmCinSKRB41ElCJ+nF1P+bO5i3BZNuRZOrOlL2EpCcE+KMt5G
	r/qUxhkdMYZq+tQq7I/3KmAgbj+379ii5DM2+j2FBE6yrcnu5pygwMqTDW5iG7p2ZMh5RKUV9BZ
	EoMkkBQeKr4mqFUtYSB45W0EkuuMO8jl1wIXQ
X-Gm-Gg: ASbGncuWYE05N9hDCCtS8yxLHWYx9UvfHWlYOPrW6H/D/WVVxt0ImxVDk3iUQQDoSZ8
	LMWgoZKai/vqHf6dtUUCMwy4GMDyC8zhTcKkaz0zmogfslFpFbhcsjTi+wMz0HojiBDYhOR9HDM
	Le5yCMJWXdWRa8lWxZBJyN/TU=
X-Google-Smtp-Source: AGHT+IGfuRIYRudtHShN7Qj32m0l4wF5E7B6kI9WmLd7OBkLUEHBqslac8Ueg1BcOn4Ps21vkwvsVqQpFaYbg/7Qq8s=
X-Received: by 2002:a05:6122:1826:b0:520:5185:1c31 with SMTP id
 71dfb90a1353d-52a89f317d0mr3621236e0c.9.1745629221431; Fri, 25 Apr 2025
 18:00:21 -0700 (PDT)
From: William Zhang <william.zhang@broadcom.com>
References: <20250406-bcmbca-peripherals-arm-v2-0-22130836c2ed@linaro.org> <20250406-bcmbca-peripherals-arm-v2-3-22130836c2ed@linaro.org>
In-Reply-To: <20250406-bcmbca-peripherals-arm-v2-3-22130836c2ed@linaro.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKk0Iba5S5vFfMGFNn0Sizjy9mbxwFEQLbcshjJjRA=
Date: Fri, 25 Apr 2025 18:00:18 -0700
X-Gm-Features: ATxdqUG_KlDtLoooLEr6zW1rmm5dD2pYD-sILOEus3QkcmYKaI-2PvPqO3FiMWk
Message-ID: <fcc2ee94c1ae4bf880b201cef082cc02@mail.gmail.com>
Subject: RE: [PATCH v2 03/12] ARM: dts: bcm6846: Add interrupt to RNG
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
	boundary="000000000000ace1030633a3f90a"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_180022_707617_C29659E9 
X-CRM114-Status: GOOD (  16.08  )
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

--000000000000ace1030633a3f90a
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
> Subject: [PATCH v2 03/12] ARM: dts: bcm6846: Add interrupt to RNG
>
> The r200 RNG has an interrupt so let's add it.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/boot/dts/broadcom/bcm6846.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm6846.dtsi
> b/arch/arm/boot/dts/broadcom/bcm6846.dtsi
> index
> e0e06af3fe891df3c3d8c2005cf1980d33a7762b..d36d0a791dbf4ca34427976919
> 57c3247c7187e7 100644
> --- a/arch/arm/boot/dts/broadcom/bcm6846.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm6846.dtsi
> @@ -196,6 +196,7 @@ uart0: serial@640 {
>  		rng@b80 {
>  			compatible =3D "brcm,iproc-rng200";
>  			reg =3D <0xb80 0x28>;
> +			interrupts =3D <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
If you are getting the value from 6846_intr.h,  the interrupt for dtsi is
actually
((SPI_TABLE_OFFSET2 + 21) - 32) =3D 85

>  		};
>
>  		leds: led-controller@800 {
>
> --
> 2.49.0

--000000000000ace1030633a3f90a
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
JOEwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIDpfgq8eZVddlT4szr0LKd2IcQs9
q6/Aesu73sioWl2HMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1
MDQyNjAxMDAyMVowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3
DQEBAQUABIIBADcmm1fkinFO8ZrJT4vAPdenS0n08JySH7wFuQ6sPBUwzWw/vlc6FC5fxsyVP8Hz
VVnqGxvHqb7cTwO0bTUPzsxqW6c6N08/ZR1VXEzimS1CRy0R9DEX1RL+dZ40TI4W0/jTxuSVCo/X
tBHal7+GzZC36w+SQ/RoRWIW8ccnhOnzDRSmUPSVLRtGmDoh+ao0EYg4YjJhVakzrqdw6C8WtdJQ
1pMY3Lot+YLcIc6CuEIDB0LiD2tAbj0wWO8HgwN9zBD/bZlWo/28/jGyAmkPwevqwxnQDkEoCNbq
xOcfgywNbGvbXpOY680fHNpQTl2iznK9g+0eiAcutwUkUs9aBnM=
--000000000000ace1030633a3f90a--

