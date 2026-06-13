Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2C3CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 08:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ud8CqUMs31Lbag+rPY0L/C65qKiCj6gLmHREZB+Ipfw=; b=tccjdiftmsuUQAPYsqyBb/dZOc
	KrQhFEP8VDA1Xd4TP2+UeVMBTLFRxUVr3pD0VQYXMzjOCArUNb4FdSJxzuG7P+sRmuIk84299NzmG
	1fMqJQtgPKV9sz3/K9hDzpQgwC1cJD7feKM1QqcS+wizFl/mIe2XCZBjTmKTHDkHr8J1RP+NriAkS
	YwQGcbCuk2FliCwgmNR98z5aSxfJJD+4esHvR9I2NsjobxMuyR4xH4H0EKdwGGcHqWWiSQQgGRdh5
	+z6/eg7bswtDDZnZq938wjRTqC/lfdgvqP6xrgOW+5O4QLLYqjvcXlS9/1gxR8aawkk1QKEzSqwZG
	icGCiSVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYJbd-0000000C5AH-34qI;
	Sat, 13 Jun 2026 08:20:41 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYJbb-0000000C59v-0piO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 08:20:40 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so17536855e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 01:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781338837; x=1781943637; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ud8CqUMs31Lbag+rPY0L/C65qKiCj6gLmHREZB+Ipfw=;
        b=iC8wmoYRJ1dXFx93fPJmOjbAikPSaOxYRzlKjEd/o2LXRKnr3+EXPduwx3y26tdudr
         t7EE7rBeAoBSwrqKHA4w5kGtojKZ7T/Eh7PNcdsHh1zeYaiaKT5yEh0SpvGHshK67Fq4
         rHhPLbdeyg+UEjdyQ0aluZIpo6DsvibNHiJRMvXv3c8sdbtW4jPcc8N/Usn0+ElXd9Mx
         v7+I13QRpdiAXzAtI5veAhAM46fkzBMDr186yayJNyG/ak01/dliXKcsTijV9zbV6Y6s
         SkF7fhO49uJncNzD35Vso+3Vp1X95P8lzgerjLeYn09q+H2UDADUHOmjHMnGCL3HCXQl
         njFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338837; x=1781943637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ud8CqUMs31Lbag+rPY0L/C65qKiCj6gLmHREZB+Ipfw=;
        b=JSg+lItjWSk3u3WrITVkRTAPvE0dQbrPZzzDGED9Lm5Av51f0bYn+qViJO/3ZDkKJM
         Ep/1j2UB8uwzT5ajJQZwkuE4Uc4mK49XiDBy8pKIX1QBJCCvAtmWglJ3vfjRAXIy1g1K
         uWTlndXvu8V+su6AOJAk/5f2Ag2n8M2kig0axkT1Ezz6TT4GVwA2+kkvH4df+qyjibrB
         qYrMM+fJdWqod1OW+Yh6aTmb+9zHpUNMZ8iEB1qFTj2HeAa9Cjz+LIi7r+7aV4iTqrIc
         pdfR8g52DUrJT7frhBuwfZ2yMqSLo6IcFsMRnEwZjyMSftzIxuAOTi4PUK1O5WpJKgEP
         y6qQ==
X-Gm-Message-State: AOJu0Yz8zWSUeCadhTaPejCpXDnW2LDGVrV5hCEyyCoyAUI88MrPh5AV
	jOFFUAtly2MZrA0NFhYhDKbUwUTTMqInC5xvJDCY4mYRS7oFi5mHZ+pTeh0Jsmev
X-Gm-Gg: Acq92OEmuBMYtfPtNTndg1bHFhhsvvDmV+LJFn8RIXZqY2+jjjnwS7TBvgs4VW9+2+3
	KN2o6AVEZnWgNtq0Il5Mew+1ojfzRNN0SQA3znqWNt78wo0kpBlOYwRo20udgb8GLbJSR5T/iVm
	TwPk77mC+8Pho0vCKsyIoAZNXi2CcnnGpQv4sukOAjCkdJBxpNXIJK8gUATM+z/MTKkihrh84Dg
	niL2z2jqUcpWOKPpe0pzlbIOhOOJn0FGn9zWG8bAwtlUCmq+7FomcKeW6LUYYtvpIvky+/+IAlu
	aeblf+uP7ehKhYOsrxPah+1Qr0y1BXU/bkQvmGnJk1WVlzC8iy6nMQIfRSpY1VWqFkSmSo0KDOR
	D4oGjfvJdVCGfHPWQ9y6ETKZpAJBHRcPP9zf+vQ3xIQsWJru/kzu9L0TK6x5Pl+v0edztYcsGlk
	hL7OhoQl7UmZfcCJ/2ObFa+Rnc9Xzuq9Com3hx4xm0rnTt
X-Received: by 2002:a05:600c:c3cd:20b0:490:d3ef:fa4a with SMTP id 5b1f17b1804b1-490ec4ea4f1mr58033045e9.14.1781338837061;
        Sat, 13 Jun 2026 01:20:37 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922032ae56sm54483765e9.7.2026.06.13.01.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:20:36 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>,
 Eric Biggers <ebiggers@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Luca Weiss <luca@lucaweiss.eu>, Sven Peter <sven@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v4 5/7] arm64: dts: allwinner: a100: Add LRADC node
Date: Sat, 13 Jun 2026 10:20:35 +0200
Message-ID: <5lITDd8mTsaQJaoJhGu1EA@gmail.com>
In-Reply-To: <20260605070923.3045073-6-alexander.sverdlin@gmail.com>
References: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
 <20260605070923.3045073-6-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_012039_276706_D6873F64 
X-CRM114-Status: GOOD (  14.34  )
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

Dne petek, 5. junij 2026 ob 09:09:19 Srednjeevropski poletni =C4=8Das je Al=
exander Sverdlin napisal(a):
> A100/A133 SoCs feature a Low Rate ADC (LRADC) for Key application.
>=20
> Specs:
> - Power supply voltage: 1.8 V
> - Reference voltage: 1.35 V
> - Interrupt support
> - Support Hold Key and General Key
> - Support normal, continue and single work mode
> - 6-bits resolution, sample rate up to 2 kHz
> - Voltage input range between 0 and 1.35 V
>=20
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
> Changelog:
> v4:
> - added allwinner,sun50i-a100-lradc compatible
> v3:
> - new patch
>=20
>  arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-a100.dtsi
> index b3fb1e0ee796..7cb06b19b5a5 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> @@ -466,6 +466,15 @@ ths: thermal-sensor@5070400 {
>  			#thermal-sensor-cells =3D <1>;
>  		};
> =20
> +		lradc: lradc@5070800 {
> +			compatible =3D "allwinner,sun50i-a100-lradc", "allwinner,sun50i-r329-=
lradc";

Break this into two lines, like usb_otg below. With that:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej Skrabec

> +			reg =3D <0x05070800 0x400>;
> +			interrupts =3D <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_LRADC>;
> +			resets =3D <&ccu RST_BUS_LRADC>;
> +			status =3D "disabled";
> +		};
> +
>  		usb_otg: usb@5100000 {
>  			compatible =3D "allwinner,sun50i-a100-musb",
>  				     "allwinner,sun8i-a33-musb";
>=20





