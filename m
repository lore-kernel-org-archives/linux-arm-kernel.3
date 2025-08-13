Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993EEC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 16:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZIyAAVxGkCRQr9BUYAZ8nPgNM4Ndhfq5a5jE1scOa0=; b=Cy/q4jLw/eAO/f62qEWqEsDMwo
	Q76CyXySMpWvD2HQP1V6AVPIPJ9KLI2Vh7oBJP/SprwQdT2fk/bLYzn3PNxAxwICiMekNWb4HPKvw
	p5lt9n+3ySfDoEkjitfuMy/iYWjAzcwoSfHpwWPtIvL/ifqfMjOKpPYYrJyOlzVYlr5czcBc5Fjfa
	ct54AT6+pmPag/MGpBfuY/CKg8q4wE7EjBrV/NcUw1Z3ondhJaQPMsNxJlsAEnZgpVaooQPMpmsGs
	dHujLmr6kHm4MByikwjxnvD2mN2p3Wj1OX256gNmq6juOvsmoAYi0787srOT71yKfu/9WAS1ey2U6
	4tGzbbVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEBE-0000000EMBE-2p11;
	Wed, 13 Aug 2025 16:18:24 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDNe-0000000EBPn-3BG5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 15:27:11 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-459d40d16bdso43068035e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 08:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755098829; x=1755703629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZIyAAVxGkCRQr9BUYAZ8nPgNM4Ndhfq5a5jE1scOa0=;
        b=Lj2GUKnvZ1Hv9hCl+DcFDB4Vk1amc8bxD9BftuA4R7SyIOPkwcH10wTXALAQ3vBOZb
         HCTwptBtCkDEHZUWKK2EvMWeU/6SibPoApYTDzwX6coF/Ul7ChCHijQ5cE9oq3ZTb8JC
         Q7ZQEMbWoqt7rwNyozHiaCetExKlufGNUcgHalykWUQDhDTHpQmAmec5Ada5aXdePWnU
         QNxXQoYDtxiUtI0X8GWrb4ep2oBOy9vCYvldzu6uUMCtYQBGaPcJqOAqFAeO8qLYZ+Og
         UC9JgB6xJQpo1u/CbUo8eQGMYtRGhL0rHMi3D7HX1q7vI3G6IhlgYMcTEQt2S2/jbreW
         n6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755098829; x=1755703629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZIyAAVxGkCRQr9BUYAZ8nPgNM4Ndhfq5a5jE1scOa0=;
        b=KgoUGVVKYEc9mMbB14sxNT6KFYykJ6A3SZWFZr7YBYo/anoGxPmnR+EcMBpoxs+1T2
         b+5xz+KEGTglhELFmbyvLtLkdVJOvjLcWOks5ABYYXQQj8FfTWCu/yoVJxfXIF5ZvAcu
         PNXU5enMJ5WA/gasiuJmm7aMVMqjO+eaLYvzWsivITD3ZTM0sMTmk3iG9P2AsN/UT4YF
         eSDtUhJahPZ+iPXDMoee66XTnM2QG2s7UvaQ3NQRwS133FREDEKdRgswIKgYoAINMRmr
         g6qgE/kgLemhFsRiAwk4kz/piaUyQ5bVAq25/LXCLwjwbMTv03gJwcc1a4iz3UBXnYbT
         yJRg==
X-Forwarded-Encrypted: i=1; AJvYcCV1taAy/lCL0sfTB+FWXRTIZylSKCrd86iBJqszzLbBy99iwkHSP9tlxXqKHmYoY6zNsIZIlj1ISlwCdNEzS6VJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyjezeZ9dLvgDZqIA2vvdUnDjX65Wxgh6QgWX489zqZTt1vsYtC
	xJXkhhpmHYyDGOqgI36WS9SCT64tLyae/EVFbw10WuSoRO8l9UuuwPP9
X-Gm-Gg: ASbGnctUD64aYO776Wyq42fX8SBdDLaVqOtgdF7qbaris8bNm8Eq8B9XeUZnh1/jkxY
	ajnhmsbVCs0RZZk9HB3iqM337dWCary+ciYUoJvYrDjmh/7o90higU6WgWZBk2beQ7edXkvi4KE
	qM3gCS1EbqscEU9QMUn1WKFQwvQkCLggXl8x1SelxPl4qNgqJVixogq1k1D74VS/17fBR74q+Wx
	78uY16L45edNrhnHwdL7Z/RbzM4nXc2NG76e4ne+goN1bi77jik3so4JqLtW1OmKY7QM+4aFO/w
	iM4qrAmK/kSqjdzpsopo6w44hzUIKA/ka5XLAllkvJgt285Entyn4L5MmV7Y+/XuwET1kzMQKj1
	DcEr47ZZzk4PZpEjVbIV9l6AGQscTY1/GnZ20pEeQ8izb10P+rVUJYJbwckmlvoQQhWjTFYqnVx
	Id8cF+Frtx
X-Google-Smtp-Source: AGHT+IEX4BDNa5mzqwSGmhUw6KuEqvUFZNcO+D5WjOPXTrwn2jJiUF7/1VKfEyNQ34hedf4mE52tig==
X-Received: by 2002:a05:600c:5254:b0:459:ddad:a3bd with SMTP id 5b1f17b1804b1-45a165d4d2emr30205835e9.15.1755098829053;
        Wed, 13 Aug 2025 08:27:09 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a509b9bsm6560505e9.6.2025.08.13.08.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:27:08 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v2 07/10] arm64: dts: allwinner: a527: cubie-a5e: Enable
 second Ethernet port
Date: Wed, 13 Aug 2025 17:27:06 +0200
Message-ID: <2376533.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20250813145540.2577789-8-wens@kernel.org>
References: <20250813145540.2577789-1-wens@kernel.org>
 <20250813145540.2577789-8-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_082710_796927_A81C6FC8 
X-CRM114-Status: GOOD (  18.17  )
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

Dne sreda, 13. avgust 2025 ob 16:55:37 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> On the Radxa Cubie A5E board, the second Ethernet controller, aka the
> GMAC200, is connected to a second external Maxio MAE0621A PHY. The PHY
> uses an external 25MHz crystal, and has the SoC's PJ16 pin connected to
> its reset pin.
>=20
> Enable the second Ethernet port. Also fix up the label for the existing
> external PHY connected to the first Ethernet port. An enable delay for the
> PHY supply regulator is added to make sure the PHY's internal regulators
> are fully powered and the PHY is operational.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>=20
> Changes since v1:
> - Switch to generic (tx|rx)-internal-delay-ps properties
> - Add PHY regulator delay
> ---
>  .../dts/allwinner/sun55i-a527-cubie-a5e.dts   | 28 +++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/ar=
ch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> index d4cee2222104..e96a419faf21 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> @@ -14,6 +14,7 @@ / {
> =20
>  	aliases {
>  		ethernet0 =3D &gmac0;
> +		ethernet1 =3D &gmac1;
>  		serial0 =3D &uart0;
>  	};
> =20
> @@ -76,7 +77,7 @@ &ehci1 {
> =20
>  &gmac0 {
>  	phy-mode =3D "rgmii-id";
> -	phy-handle =3D <&ext_rgmii_phy>;
> +	phy-handle =3D <&ext_rgmii0_phy>;
>  	phy-supply =3D <&reg_cldo3>;
> =20
>  	allwinner,tx-delay-ps =3D <300>;
> @@ -85,13 +86,24 @@ &gmac0 {
>  	status =3D "okay";
>  };
> =20
> +&gmac1 {
> +	phy-mode =3D "rgmii-id";
> +	phy-handle =3D <&ext_rgmii1_phy>;
> +	phy-supply =3D <&reg_cldo4>;
> +
> +	tx-internal-delay-ps =3D <300>;
> +	rx-internal-delay-ps =3D <400>;
> +
> +	status =3D "okay";
> +};
> +
>  &gpu {
>  	mali-supply =3D <&reg_dcdc2>;
>  	status =3D "okay";
>  };
> =20
>  &mdio0 {
> -	ext_rgmii_phy: ethernet-phy@1 {
> +	ext_rgmii0_phy: ethernet-phy@1 {
>  		compatible =3D "ethernet-phy-ieee802.3-c22";
>  		reg =3D <1>;
>  		reset-gpios =3D <&pio 7 8 GPIO_ACTIVE_LOW>; /* PH8 */
> @@ -100,6 +112,16 @@ ext_rgmii_phy: ethernet-phy@1 {
>  	};
>  };
> =20
> +&mdio1 {
> +	ext_rgmii1_phy: ethernet-phy@1 {
> +		compatible =3D "ethernet-phy-ieee802.3-c22";
> +		reg =3D <1>;
> +		reset-gpios =3D <&pio 9 16 GPIO_ACTIVE_LOW>; /* PJ16 */
> +		reset-assert-us =3D <10000>;
> +		reset-deassert-us =3D <150000>;
> +	};
> +};
> +
>  &mmc0 {
>  	vmmc-supply =3D <&reg_cldo3>;
>  	cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
> @@ -240,6 +262,8 @@ reg_cldo4: cldo4 {
>  				regulator-min-microvolt =3D <3300000>;
>  				regulator-max-microvolt =3D <3300000>;
>  				regulator-name =3D "vcc-pj-phy";
> +				/* enough time for the PHY to fully power on */
> +				regulator-enable-ramp-delay =3D <150000>;
>  			};
> =20
>  			reg_cpusldo: cpusldo {
>=20





