Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD65BC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 09:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41DdFtdJ+j4aD8vxL14dVna+R0FXEc06U5Wqw9eVGxY=; b=HqVR+d50x2htk+Z4dZKxgdJB5G
	LIvz521dNhGhzpyEi1rIp3RxzbIS9Ra1ihHV0QKlN1rjlpivzqCocb8YGDNa6LVYcpWuTYdpYzEfs
	LgBBBsk+inJcOOD+R5HpSXuZLr4uffctOTAzcpKDSNOb+wdfyMlc3s+N64iW1WrZNYcjSXlUg1uCC
	DxTns6mLG781M2IWfgIwdimvl+WHuDlAcp8ChpFkxtD7SaxF3TlOBAbKnQjKkRfIw9WnopbDw5JTt
	/CAR1ishke1Gxynr3ph5YlZUJ8ZNn1ucvyZvCUCJTXmQG9kdSTfABmKVp1NiAcgQd9GUF5+wuZhkH
	iIs5N/Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlm92-00000007lik-3uGY;
	Sat, 22 Feb 2025 09:50:00 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlm5X-00000007lNU-0gQg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 09:46:24 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-38f325ddbc2so2093741f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Feb 2025 01:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740217581; x=1740822381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41DdFtdJ+j4aD8vxL14dVna+R0FXEc06U5Wqw9eVGxY=;
        b=T15r96uNhkTt7TkQSR993UZJVHWWgo95bEOlmjiWpPFJUNP226RGt3N5ukL2PGIJw9
         VpTSHmkcKg2f4Ks2Kj8joLlf1bK8PF7jkYXDUh1VympgkWzIH8w1gSk8GG476vXIAVNo
         ANXP1EayJm+j/rJM/kAEs3whu5P58bjOYS6AceGQuN8YoXhQmWFA8/MPXdlO/OGNMDsG
         A/hJq2f7sxFfxNXDL1RpSft/FBv6mqNroUnIH71c0zc3px0fnFBkHb7157MUof3wOnrj
         VgkqBfWslkSa5fUbWLQmfRj4tZLiK84hhEOKHMTfnLZLC+ezw4aJNZIcAlXpopTyqy+V
         MaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740217581; x=1740822381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41DdFtdJ+j4aD8vxL14dVna+R0FXEc06U5Wqw9eVGxY=;
        b=wSAUa2fSuWoCrJutmpQd5gnQFNO4x1mYznmvQpuWLwpryZghTtAGiM9JYNJXvnqgCI
         hHueuhnHzhoIhTuiNVE/G8D1RYlkXhpjfKS+noDOLUxcxQaNPzHxxLsOFQzc8cCFTSOR
         HFlj2TmzzOnIAN98NV5RURQGjRNveSu0hwZoH7JvCbVfoEFHWC7LDOe61v4X1r1+m6Nl
         yJFSSAsHRrRCNlxdwnf3bu9xS1kOsFK+Tg7W5FobK/3vwpHZsPuL0hrceXUZaJXRRLz4
         KVgozwhHvG6r/IS3fU5TcPWzCg8wu5v/cWnGCq7ZnE+b5wUHS/bzy7c5dQV7MNXbnjdh
         HvMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU++imr9CmOhirQu1biTu5v/M8drRAWv0/WOsGHg5+8NV7ERcxPcsEDApx57ohf5PGFbyEY9N/PRZtDBrOhPj+t@lists.infradead.org
X-Gm-Message-State: AOJu0YwEWj+uXrvq+BSZ4D8txnvtoijfb2Dy/Sraxnm8qmAXvP5kUfA9
	oKTamdfMVqAwwUC90FlukQ2i53y5XayHJUamOnk9UGNzm8rCA0Ym
X-Gm-Gg: ASbGncuW4yy093MOZSMYEkza0isqz8f5JGchoboNPbKrk85JV4bBdyo2nZ7hQLI1REx
	T81YmV6hid4+BQkJ9gMFnrK/CetdfqxpqGuTlt+UElx7qWKmKbdZmTcW8ePPuF35LA122UHB2ui
	gUvDBcLb2YMDQesqbIF2IvmgH0k1G5igGABXSyuoQQcefOrjkiSVwwpY8UYAf1NkHR6ABjLq9q4
	NFIAA5kTcbQe+s3Vpda9Bg6+P6EAmKEHmkHcd3XkpFeImKiGyxmaI51Ndp/klXYBkkav1aoCX1D
	jWBpnuJ6kyjp9PPCD13UsqgJ2rnmzD7yzjPN0P/Q4jRsgFZS+uUvR/uxa3LAiFXFNWSRZXsiY/b
	Psw==
X-Google-Smtp-Source: AGHT+IH9kK+RjWwIPLtZlicr8RC/6yrn6sA09olVzUzJHXrQ6iKk6NZGgzzk5oOay6MNB/ZXKzOgpA==
X-Received: by 2002:a5d:64c4:0:b0:38f:6697:af91 with SMTP id ffacd0b85a97d-38f70825fe0mr5475428f8f.39.1740217581325;
        Sat, 22 Feb 2025 01:46:21 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f0597sm25364929f8f.42.2025.02.22.01.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 01:46:21 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ryan Walklin <ryan@testtoast.com>
Subject: Re: [PATCH 7/8] arm64: dts: allwinner: rg35xx: Enable LCD output
Date: Sat, 22 Feb 2025 10:46:19 +0100
Message-ID: <23840170.6Emhk5qWAg@jernej-laptop>
In-Reply-To: <20250216092827.15444-8-ryan@testtoast.com>
References: <20250216092827.15444-1-ryan@testtoast.com>
 <20250216092827.15444-8-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_014623_203683_D89D0D62 
X-CRM114-Status: GOOD (  15.76  )
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

Dne nedelja, 16. februar 2025 ob 10:27:14 Srednjeevropski standardni =C4=8D=
as je Ryan Walklin napisal(a):
> The RG35XX has a 640x480 RGB/SPI LCD panel, supported by the SoC display
> pipeline and an NV3052C controller. The H616 SOC's GPIO bank D contains
> the muxed display pins for RGB and LVDS output support.
>=20
> Enable the display engine and LCD timing controller, configure the
> panel, and add a fixed 3.3v GPIO-controlled regulator for the panel, and
> a VCC supply for the display pins as per the other GPIO banks.
>=20
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  .../sun50i-h700-anbernic-rg35xx-2024.dts      | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-20=
24.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> index a231abf1684ad..388487d4720e2 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> @@ -175,6 +175,49 @@ reg_vcc5v: regulator-vcc5v { /* USB-C power input */
>  		regulator-min-microvolt =3D <5000000>;
>  		regulator-max-microvolt =3D <5000000>;
>  	};
> +
> +	reg_lcd: regulator-gpio-lcd-vdd {
> +		compatible =3D "regulator-fixed";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-name =3D "vdd-lcd";
> +		gpio =3D <&pio 8 15 GPIO_ACTIVE_HIGH>; // PI15
> +		enable-active-high;
> +	};
> +
> +	spi_lcd: spi {
> +		compatible =3D "spi-gpio";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		sck-gpios =3D <&pio 8 9 GPIO_ACTIVE_HIGH>; // PI9
> +		mosi-gpios =3D <&pio 8 10 GPIO_ACTIVE_HIGH>; // PI10
> +		cs-gpios =3D <&pio 8 8 GPIO_ACTIVE_HIGH>; // PI8
> +		num-chipselects =3D <1>;
> +
> +		panel: panel@0 {
> +			compatible =3D "anbernic,rg35xx-plus-panel";
> +
> +			reg =3D <0>;
> +
> +			spi-max-frequency =3D <3125000>;
> +			spi-3wire;
> +
> +			reset-gpios =3D <&pio 8 14 GPIO_ACTIVE_LOW>; // PI14
> +
> +			backlight =3D <&backlight>;

There is no backlight node at this point. Reverse patches 7 and 8 or better=
 yet,
merge them and put patch 8 message into comment to backlight node.

Best regards,
Jernej

> +			power-supply =3D <&reg_lcd>;
> +
> +			pinctrl-0 =3D <&lcd0_rgb888_pins>;
> +			pinctrl-names =3D "default";
> +
> +			port {
> +				panel_in_rgb: endpoint {
> +					remote-endpoint =3D <&tcon_lcd0_out_lcd>;
> +				};
> +			};
> +		};
> +	};
>  };
> =20
>  &codec {
> @@ -187,6 +230,10 @@ &cpu0 {
>  	cpu-supply =3D <&reg_dcdc1>;
>  };
> =20
> +&de {
> +	status =3D "okay";
> +};
> +
>  &ehci0 {
>  	status =3D "okay";
>  };
> @@ -206,6 +253,7 @@ &ohci0 {
>  &pio {
>  	vcc-pa-supply =3D <&reg_cldo3>;
>  	vcc-pc-supply =3D <&reg_cldo3>;
> +	vcc-pd-supply =3D <&reg_cldo3>;
>  	vcc-pe-supply =3D <&reg_cldo3>;
>  	vcc-pf-supply =3D <&reg_cldo3>;
>  	vcc-pg-supply =3D <&reg_aldo4>;
> @@ -355,3 +403,13 @@ &usbotg {
>  &usbphy {
>  	status =3D "okay";
>  };
> +
> +&tcon_lcd0 {
> +	status =3D "okay";
> +};
> +
> +&tcon_lcd0_out {
> +	tcon_lcd0_out_lcd: endpoint@1 {
> +		remote-endpoint =3D <&panel_in_rgb>;
> +	};
> +};
>=20





