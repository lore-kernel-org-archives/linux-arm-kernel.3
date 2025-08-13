Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87C8C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 16:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KR4hoVadqu8aUTOVreHxSaRU8mKdTHXFpDokGXEFHMw=; b=nJnxsbmsBMX5Ycw04I1NgRsLLj
	VAOMb/HOhwXP6mvlPfP0oRhUeE9mi7SWcbsJ8R2l4tZOUv+Eyo0xLoke/dayGO/xJARoq0FeUHuad
	Cz5y/+HCXmZwbCtzGlDAg0oNN7vGDbFTFGsGQuvL+0XqrjWH7tK1AHljdOUfsWmxsRXWuPXNA39es
	9aMPjz1saNHewZq0Iux+gEFR1fjgm+wUgD3cplAXLBb+8PvRXA10D8mKI6y1YvVg3aCvR/8ZMZaDq
	UZvftnZX9ZhbGt+DZo77NDJr200JBEVbNvkKeRp5FcqqtkyJLnPS7aPuQYaNvupoURzh/KCuh4IwG
	2b27SNzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEIw-0000000ENp5-0VQl;
	Wed, 13 Aug 2025 16:26:22 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDOj-0000000EBb2-153K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 15:28:18 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3b7920354f9so5521021f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 08:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755098896; x=1755703696; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KR4hoVadqu8aUTOVreHxSaRU8mKdTHXFpDokGXEFHMw=;
        b=PpXDQ1s5h5EVS2jfQ/6MZi8MAkagvee7jDnanHHj3Ce2gLWnCh2z/WRt+r4qSm2EwJ
         9kyqPfkLFeZS13uQNgEfwDJShLB+FSYro9hGOe1jGjw3bcvRF2gbfnK/tX9Ztia6t2W5
         5yh3bQf9BtZpHuxIXt1ONSAdXnSVwuMjK34dQ6Qy434p957i7wf4GCiGvgl/JYoWY6vd
         4nzgDS3C9+OoB1GWGw2fyDAOMNN8KnjQ54gdCgfwQ3kSoM9x6SoFZpIf1+WJdTVosYWM
         nAkAMZvTXHqpGPhggzudK6MWwC259YFVEtiVbX3bvlBsix1fI2nt0fET3Fhgnb5VrGdJ
         8xXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755098896; x=1755703696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KR4hoVadqu8aUTOVreHxSaRU8mKdTHXFpDokGXEFHMw=;
        b=SZ8jpRmPOUzf7AunVe/GF/HEvBAoEHESyqRkP1FG5M0Q/le4bhROItd80h2A4CKoPv
         EsHWc4yHUqVrlZbSU4Ku/d2VN9fpBidaUx2LwA7mcBz6w3OYtNirex1P2582jRFGYvXy
         dH1/f5kxnZobIAbrDv5UF1KqIMD11aGdmCAYTMwls1b/vGoRZC2w7PCBZp2r7VJNF3Me
         0CVIAC/6oY5y7JEg2fI35ScwemmG4VAESpSKQUnZvsfah+PtPVSma7Jn21VG+O1AN+8g
         CYAE/4FPMIMcYjBgcdCXBCfDWeKQk7Tdkc8yb+VKnKvX+RibSdCgWtyP7SqeUMH5URVL
         uZLg==
X-Forwarded-Encrypted: i=1; AJvYcCXbWGOMMk8MHcTbvX6/TrpqDlYm+lwc98ZyWO1V13mAo6P4UcBjXy+OGKJ2rwQmSFsR5uDze6BI++VNj01LQoAp@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2ux29rAw1WrXoJZhgrctXYBF3KakMBws+L1QY61a3Tr+ue/MW
	Vy7N/Yh+GPui4lyCkZ06zQj9wILyQA6ujtkRc0yRctpAZyLnxMWhVCHP
X-Gm-Gg: ASbGncu6o9OYiLo8wXRjK13p2P6v4mGc/Nxg6djs2vthP1SGFYIbWrGrSEAo9xLiXCn
	NK2R4TqvkiPlhijCrnpdMcKPZu7CSC87aIlFwrdsV4rbjHD+A2JiP+twtOvjK/zheq2ZK7vIqh4
	aPZqtwoHaZflXamlXYBO9ovqZoTTBVByfBiSDcCkBtkviC1oQRjyFN3q0Bp9Z+DddjRA1QDBvMA
	3dqCDCDKmu0Lno7QQoaAEEs1mAvfXXdt1RwQaBpyoBZgT8nrmNoSrYFdTQ+p/UygDdgC5QGZFEw
	6CwdPhLgCzgQCeJEtUSmUrkHw2EK7Qg0Q5GXx/SF3i78TpFqjbWQAkzYISe5GFft1mb20/MRo6y
	W4Kf2chNPgYoUpENw47STytoUGtbc/5IH4uN7PzkA8ISWX/5215zOMhR1czSWOZ7ALr/42lVLaY
	M+b1O2tdA=
X-Google-Smtp-Source: AGHT+IHE0fucbXsrHkFdPEfs8yK736j25+deb3oJqHtDVR3z1PaujgH3AAxRRrD0UXP0szDCxxOwTw==
X-Received: by 2002:a05:6000:22ca:b0:3b8:893f:a184 with SMTP id ffacd0b85a97d-3b917ecd302mr2496485f8f.52.1755098895560;
        Wed, 13 Aug 2025 08:28:15 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c466838sm50661600f8f.49.2025.08.13.08.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:28:15 -0700 (PDT)
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
Subject: Re: [PATCH net-next v2 10/10] arm64: dts: allwinner: t527: orangepi-4a:
 Enable Ethernet port
Date: Wed, 13 Aug 2025 17:28:13 +0200
Message-ID: <3363827.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20250813145540.2577789-11-wens@kernel.org>
References: <20250813145540.2577789-1-wens@kernel.org>
 <20250813145540.2577789-11-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_082817_304051_6B927B02 
X-CRM114-Status: GOOD (  14.85  )
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

Dne sreda, 13. avgust 2025 ob 16:55:40 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> On the Orangepi 4A board, the second Ethernet controller, aka the GMAC200,
> is connected to an external Motorcomm YT8531 PHY. The PHY uses an external
> 25MHz crystal, has the SoC's PI15 pin connected to its reset pin, and
> the PI16 pin for its interrupt pin.
>=20
> Enable it.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>=20
> Changes since v1:
> - Switch to generic (tx|rx)-internal-delay-ps properties
> ---
>  .../dts/allwinner/sun55i-t527-orangepi-4a.dts | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/=
arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> index d07bb9193b43..b604d961c4fd 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> @@ -15,6 +15,7 @@ / {
>  	compatible =3D "xunlong,orangepi-4a", "allwinner,sun55i-t527";
> =20
>  	aliases {
> +		ethernet0 =3D &gmac1;
>  		serial0 =3D &uart0;
>  	};
> =20
> @@ -95,11 +96,33 @@ &ehci1 {
>  	status =3D "okay";
>  };
> =20
> +&gmac1 {
> +	phy-mode =3D "rgmii-id";
> +	phy-handle =3D <&ext_rgmii_phy>;
> +	phy-supply =3D <&reg_cldo4>;
> +
> +	tx-internal-delay-ps =3D <0>;
> +	rx-internal-delay-ps =3D <300>;
> +
> +	status =3D "okay";
> +};
> +
>  &gpu {
>  	mali-supply =3D <&reg_dcdc2>;
>  	status =3D "okay";
>  };
> =20
> +&mdio1 {
> +	ext_rgmii_phy: ethernet-phy@1 {
> +		compatible =3D "ethernet-phy-ieee802.3-c22";
> +		reg =3D <1>;
> +		interrupts-extended =3D <&pio 8 16 IRQ_TYPE_LEVEL_LOW>; /* PI16 */
> +		reset-gpios =3D <&pio 8 15 GPIO_ACTIVE_LOW>; /* PI15 */
> +		reset-assert-us =3D <10000>;
> +		reset-deassert-us =3D <150000>;
> +	};
> +};
> +
>  &mmc0 {
>  	vmmc-supply =3D <&reg_cldo3>;
>  	cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
>=20





