Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69063CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 11:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFT4S6YWGOqkBEGH8f7ZvRxrjPmCEGESiSX2o/TWj+Q=; b=j92/cCf1YkYYsSIue3HGJAMwOo
	w5qfnCzXC8Fy53SoZl2ZODkdJpPjPF+9r6uhcXK0ASM8C31UnbaKb7lWju6uPHyDX1U6hunBUNUpI
	GMAZT3lDaOqFzBUTl9ZHbw6C27T1Copx86/6/PKCvda+77lVDA5clXkbJmJ+p7l3Ea1tKhSoi3Uex
	2pZvi+7kR7z93enizRT8U+Qol57jv3fxTj2Jbk+QlfrmYibPJDrnbaURCjdXkEcBV9PEF+XBHoWTA
	/kmXX0/pR1/7TSvJcHIp39dKSUzVPSigb0kLtpTttO0t7tPzqhOlVzIDb5ZPLJd5Eo0H2edjMHSmk
	xEQutYqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYMfm-0000000CFP8-3LLw;
	Sat, 13 Jun 2026 11:37:10 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYMfk-0000000CFOg-2RcP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 11:37:09 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so19581535e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 04:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781350627; x=1781955427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFT4S6YWGOqkBEGH8f7ZvRxrjPmCEGESiSX2o/TWj+Q=;
        b=jIWDRxL5EVS++VTxnc4pU5yLrntzJstcx7od6g64bTDrSCQJ8iiCrUMW5MGfBWxJAB
         FWuniRE23U55AH1fBfNjwJpMkwNKCItDen2vmnBQYWyxlnRJkz7f4xBb27kToBNp9eHE
         TFVUcoi9afxAz03+8Nv+HcPpdw2ex6YMus7DeWvZGvrkL8pnXDFDSWwb+BAk9wSEAbDX
         QN/kx7iNhGOjCxgQcLzVgm7zFG4F5a8lCjGM9Nm0qK7854TrDE8C+e781UU01lVb6aga
         UIHmxbUGzMGQqsR04kxng0w+8zM7NvJUREsIpxKcGtc0p/+FEltcITyg5Bf1ImqqKMkT
         hnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781350627; x=1781955427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SFT4S6YWGOqkBEGH8f7ZvRxrjPmCEGESiSX2o/TWj+Q=;
        b=cMz6VZTLqR6FkE57AlzqU9fhFXTm0j017DXehR+YUEpO+pMyRRVj6U7l+60r72M6PY
         cN+rBhCJzDFvaGh2cvKj6rmwWAJocTZt7CTiLXmzzchm1YuPC6Qty8dUrdu/7eEpjTZQ
         /5XkkbzRKAoulptt2J0XTGrHAv3+A40n1OteARn8wCOO04gq4ef/142bt+TUIOIgWpbt
         vLfj9DBPf+DGFUEqp/d984XqKnMtAcLb14/KBwioYclWd9lRb8OOEawggjSsP49HxhBN
         s31/auVhjTTzNwfidkeKz4Iw3WalpvnizZEyVnhifyzsr6utozPWCW0JIlSn0MOA1+fH
         q3kw==
X-Forwarded-Encrypted: i=1; AFNElJ/9IX81S7cYCBowg+Cr7zXqWSURI6uu4akcb4VbHMAqy1j4FZSkjfklLS/JhChoyyG1JYlUf4xt5iOlRWNJgvHi@lists.infradead.org
X-Gm-Message-State: AOJu0YxSiS5kOMepCtVqJe1Tix86G747mIO7REU+ycyKRAqBwHg4Yo0M
	hUT+YhYN1KvCqBKKzu1Y8yUcmdKM9WEqa6f5xNh8+RRBBkL8h8gPFRCM
X-Gm-Gg: Acq92OELjlByyEP1FfHU9aWY4yGahxFsead8UW+K/eRsevb78Z+BZxiTrRYSdp/VcKX
	FhXiLc/SqydpdO/XjhCkV++j04Brph4UeZhbuVIIh2rFvu0mjp133GvLwG7zoCJXTJ+jjqorXQf
	BYqUt/BkgnidxpKfRz+V9U0v6SZ2Zw93gSXG/ou5m0pNrrLRz7Khh7KQqVhx/slRpamd22poz7H
	UrWf8ZzSGjJ/jF256cSAvdaMWeoGdqtJTdgBFr3+m5cgiwIEVli56+EcwYNR8EdYQHcVlbpdPTL
	cnXkIBesPalXiKlBjJQqHoviyS9mxn0gtI4pGjWbvPh/YMv9vC+eVd1IV9Qbjm7n4TZYcwBj7kH
	D4D8hABhst9r6KBmEBD/1vF2nyfyS164imwrdUqHakTpbHoGRx63Lhi+28y69JmESWSJzAqtwhk
	FKAW9m2PgWDIcrzVqdvIlKtuiInikTB8Pqf/jttRrrs0Ra
X-Received: by 2002:a05:600c:83c8:b0:492:1e36:d16e with SMTP id 5b1f17b1804b1-4921e36d1a9mr50171305e9.36.1781350626544;
        Sat, 13 Jun 2026 04:37:06 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922033dd3esm67812295e9.8.2026.06.13.04.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 04:37:06 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Ulf Hansson <ulfh@kernel.org>, enzo.adriano.code@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: allwinner: add Radxa Cubie A7S
Date: Sat, 13 Jun 2026 13:37:04 +0200
Message-ID: <yDDIdJcZRCmL2YwI2Wv_ng@gmail.com>
In-Reply-To: <20260613-a733-dts-v1-public-ready-v1-4-7787c94681db@gmail.com>
References: <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com>
 <20260613-a733-dts-v1-public-ready-v1-4-7787c94681db@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_043708_637545_AB0688EE 
X-CRM114-Status: GOOD (  13.60  )
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

Dne sobota, 13. junij 2026 ob 11:42:16 Srednjeevropski poletni =C4=8Das je =
Enzo Adriano via B4 Relay napisal(a):
> From: Enzo Adriano <enzo.adriano.code@gmail.com>
>=20
> Add the Radxa Cubie A7S board description with serial console and SD card
> boot support.
>=20
> Ethernet remains disabled until the GMAC210 wrapper, clocks, resets,
> MDIO, PHY reset, PHY power, and link behavior are proven.
>=20
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/Makefile             |  1 +
>  .../boot/dts/allwinner/sun60i-a733-cubie-a7s.dts   | 48 ++++++++++++++++=
++++++
>  2 files changed, 49 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts=
/allwinner/Makefile
> index d116864b6c2b..824cc35152db 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -56,6 +56,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35=
xx-2024.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-h.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-plus.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-sp.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun60i-a733-cubie-a7s.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-a527-cubie-a5e.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-h728-x96qpro+.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-t527-avaota-a1.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts b/ar=
ch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> new file mode 100644
> index 000000000000..453761a96323
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +
> +/dts-v1/;
> +
> +#include "sun60i-a733.dtsi"
> +
> +/ {
> +	model =3D "Radxa Cubie A7S";
> +	compatible =3D "radxa,cubie-a7s", "allwinner,sun60i-a733";
> +
> +	aliases {
> +		serial0 =3D &uart0;
> +		mmc0 =3D &mmc0;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	reg_vcc3v3: vcc3v3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc-3v3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
> +	};
> +};
> +
> +&mmc0 {
> +	vmmc-supply =3D <&reg_vcc3v3>;
> +	bus-width =3D <4>;
> +	no-mmc;
> +	no-sdio;
> +	status =3D "okay";
> +};
> +
> +&pio {
> +	uart0_pb9_pb10_pins: uart0-pb9-pb10-pins {
> +		pins =3D "PB9", "PB10";
> +		function =3D "uart0";
> +	};

Besides sashiko bot comments, these pins should go to main A733 DTSI,
like it's done for other SoCs.

In any case, it's a bit early for DT. At least clocks should land before.

Best regards,
Jernej

> +};
> +
> +&uart0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart0_pb9_pb10_pins>;
> +	status =3D "okay";
> +};
>=20
>=20





