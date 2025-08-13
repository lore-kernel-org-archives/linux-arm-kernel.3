Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E735BC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 16:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dCXGQ3wCen5hO/RhZ9y8kY2psIxwBZyCJWwI1Ahh5o=; b=T7dULecW7Tz40WvOAzLz+rL47A
	sXdNTKtMsi3vtb/7NBuT3p7000kpuqYP+hH++t0lkA6222g4J62X0H9quoOuFrrGLnojH3ZYiXaSv
	SwzjNS1ccflQfphGsH2owJAod+O7G/5U+MNZh0CpIvSgbZYNstlzO7nfPQSSHZx07pdErF0hTZ/6H
	tBnBmwZluYdcvJVdtJMycjr6a6vxl0TK52mvbQoFVbHVnlm9Y1igTCMaxvFRoKWfZ6Fro6VrCM+WS
	9AwQLjp/DkIk4WvDGWn//e/k/3K5EJS57X2J+vZPiNL2Ff0fejF/k5+CjlTc/I85TBEYEDkoz45J+
	OVScAHrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEGN-0000000ENMC-17gB;
	Wed, 13 Aug 2025 16:23:43 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDOU-0000000EBWJ-1lrX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 15:28:03 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-455fdfb5d04so34830835e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 08:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755098881; x=1755703681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dCXGQ3wCen5hO/RhZ9y8kY2psIxwBZyCJWwI1Ahh5o=;
        b=AQvsOeunxl6I88Obuw9BVdCTqucNEzXQCUb69LRfOQ3QctC5wy9suiatEXaJa6w+qg
         uyFqVpm+n8oOtey+NJwJizMVqub1Mes94e6vYFHN+LDBMtYiXFQJxvnqSfk1rljdejJd
         SEBU5sjxUye1os6jSBDLekRQQsnJ+8hzq/Ljd1L1BqI7f4HhLr101EMrtGTcXvtgqFa+
         uXtnZEioduGkpF3UIty5KhlucvY7eHtIzQyFzSKqg0L50qBzJG3mdo6Vu+saqAH1ZXTM
         CBWl9swQhm/TtyMz6clky2/BiM7DWFjtHIeIAAkTbH888+5DWIt5qnDin1HqsXo70GmD
         007w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755098881; x=1755703681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9dCXGQ3wCen5hO/RhZ9y8kY2psIxwBZyCJWwI1Ahh5o=;
        b=VVBLqK/asPi3O3pb70I8HPCFRad7GnBJs3f3qckC6KA1+dnYytaRRk9xpniO4bekRM
         pMuSz+JrNrgkNNBT3hJyhTf9LLVxQf4ITdSivBBb1pnnkE1b/XujeO3tPd7j7rgMU+Vo
         SUcb8HxyxB7am+qqAQpI+CeXBkqK9eNY70TsNFDhWpiB5NuWb5Vk2yEaNp5fPabY3UQ4
         72Hp52CPl4bp1t118Bq2k3tE/ECTn86/jWLGj6yr2SQWFKJ2vuLiuYLHJKIcRB6nMqvA
         rTPIUg3cPRWcAfVSKjBv9xF2+zuY1dFZmPcudNmYH9N8urChJlqM3vwxcmCky1wXMJLt
         rshw==
X-Forwarded-Encrypted: i=1; AJvYcCXI0x/xRmb9jqeQ7vcWNGCQs8n9ta1dVhtrVuNzvvjBuJrj8BJUwlpH3QQK6J0LowMjaOPOeSXhzSanYAkxZCcs@lists.infradead.org
X-Gm-Message-State: AOJu0YyuT6RnhObddlhFIF7txMoYGEahZpWYsC5vKFYw7+GkoEmDvEoB
	Dqp1PBei+scqqtA8KRUAnbk3sTOUpBpK71JzVGX1kqcIgnmkzikUJ3VC
X-Gm-Gg: ASbGncsA1ABUkk1Nk+JVGTwfWnFcaDzpnibJLKs9DQ5gjCd++U5J/58U/BbB/Tbblh8
	peg9bPHg7AkckqocNwoWWSm9JP91QY6Ua5DbDFeks0xwAlUj9NGZUVyhXNg5OT77OHwmRvL/nJm
	JgULdE5r2QUod8sU7IrO5EBtQuJlzXBA0W2oBsOKUQgGlnjYxFjhNHnYytKsQf90aiWC1zUIsWJ
	2P8umL7R6myNPAAGn6TWZCJUwe8A31ZIkZYL23711hiUOuc57gi3xGFKtCCfe/0TU32y6yBuMim
	m+efqo7C6CA9Jb64+Hl4B6UMWHY2dGplUHXrtU4XMy6ZsVPQg9OAvfgp6KnRqqPj7jyZkz4p7+w
	O+mC+BppQhW/idksGhEL1Ubh56eYmZSESlTejEkg5sG802rr3fv5VNhE3uUQWvIAxq/WcKa+yUf
	A48aF17X5s
X-Google-Smtp-Source: AGHT+IGvCYpe77xXC4O8RNzirUxA7cMzbuFpGjarjyQuF4h4e0X7kLLiXN7Oa7TmkKyvCs586LY0fA==
X-Received: by 2002:a05:6000:2dc8:b0:3b8:d955:c598 with SMTP id ffacd0b85a97d-3b917e90664mr2385608f8f.30.1755098880683;
        Wed, 13 Aug 2025 08:28:00 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a53905asm6336365e9.22.2025.08.13.08.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:28:00 -0700 (PDT)
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
Subject: Re: [PATCH net-next v2 09/10] arm64: dts: allwinner: t527: avaota-a1: enable
 second Ethernet port
Date: Wed, 13 Aug 2025 17:27:58 +0200
Message-ID: <13821245.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20250813145540.2577789-10-wens@kernel.org>
References: <20250813145540.2577789-1-wens@kernel.org>
 <20250813145540.2577789-10-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_082802_460953_B531E939 
X-CRM114-Status: GOOD (  16.17  )
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

Dne sreda, 13. avgust 2025 ob 16:55:39 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> On the Avaota A1 board, the second Ethernet controller, aka the GMAC200,
> is connected to a second external RTL8211F-CG PHY. The PHY uses an
> external 25MHz crystal, and has the SoC's PJ16 pin connected to its
> reset pin.
>=20
> Enable the second Ethernet port. Also fix up the label for the existing
> external PHY connected to the first Ethernet port.
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
>  .../dts/allwinner/sun55i-t527-avaota-a1.dts   | 26 +++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/ar=
ch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> index e7713678208d..f540965ffaa4 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> @@ -13,6 +13,7 @@ / {
> =20
>  	aliases {
>  		ethernet0 =3D &gmac0;
> +		ethernet1 =3D &gmac1;
>  		serial0 =3D &uart0;
>  	};
> =20
> @@ -67,7 +68,7 @@ &ehci1 {
> =20
>  &gmac0 {
>  	phy-mode =3D "rgmii-id";
> -	phy-handle =3D <&ext_rgmii_phy>;
> +	phy-handle =3D <&ext_rgmii0_phy>;
>  	phy-supply =3D <&reg_dcdc4>;
> =20
>  	allwinner,tx-delay-ps =3D <100>;
> @@ -76,13 +77,24 @@ &gmac0 {
>  	status =3D "okay";
>  };
> =20
> +&gmac1 {
> +	phy-mode =3D "rgmii-id";
> +	phy-handle =3D <&ext_rgmii1_phy>;
> +	phy-supply =3D <&reg_dcdc4>;
> +
> +	tx-internal-delay-ps =3D <100>;
> +	rx-internal-delay-ps =3D <100>;
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
> @@ -91,6 +103,16 @@ ext_rgmii_phy: ethernet-phy@1 {
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
>=20





