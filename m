Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C5FCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 13:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iD4A2gYEHhEqDDI4pv93pPk9MPb3yUNXkPrSTp8pI48=; b=grUZA0q3xk2iAPS0WbLxlAIB9m
	5lC3/VINlGxynvnQoUUDlKjZb4zIra7S10hVnq21A4zDeeH3qvPxqGuGztLrgopISAFkic07umDs2
	Ej7vsHOdIONqZZJnzFyUgZeO0bJcwnM3e1ae+Sz13Fdve/2zTfl9X/g0dtBmlflGM9xg11DWdB/Tm
	R+sbbeaYQO5rpX0zHt83F86NX4WP47vhbqpZR1GYF6qFwt67BDm5ACWQEaHf5JNtsufjHZIAKmrNs
	tT76Uo9clVdcu/DudVCpStZTxTwnJ6qemcq8YSIlVqEsiGCnLJEQXtQQwF8jlhhKJ/Fn/TUkoGsH/
	pHxFIHig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWta-000000082nb-0awN;
	Mon, 25 Aug 2025 13:05:58 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWGx-00000007uha-3iOz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 12:26:07 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3c79f0a606eso950848f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 05:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756124762; x=1756729562; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iD4A2gYEHhEqDDI4pv93pPk9MPb3yUNXkPrSTp8pI48=;
        b=RjpyahNTPQEgj3dfHLJP5HQoE0Ux0Rn4FR0bhkG5IzhHQhjJv2Wn0t++5uijvxnmwn
         +itqBTWl7yOGFw+7cXN8Xp6ucGXc9xsxk4FuihcEzfWS9ZJKaV80+l3eZwhPyUgeo+xi
         WIEaEvlrsTUBzdx+T1P3fP9EzbZI7Syn8lwt32CNATeu0f73eNdXgih8h9daLveVFNxA
         PsQ1V4Y8R/BkLQRtaHaPFPMr0l8Bkm7C87l8IhECDneSzwxr7PFcp3fwT9SSC93G5cm9
         h8FWbT8qea/564jPNwMyXERE9TZeiGqJdAKUDqExhnfLTzGGcn7XjoeA2bLgdgz1OwlZ
         GIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756124762; x=1756729562;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iD4A2gYEHhEqDDI4pv93pPk9MPb3yUNXkPrSTp8pI48=;
        b=mVenzpfj/+n1gHM8eEiH3bMnXf3vHwzdWecYEXNUvIxmLLLwI0tO6YI4kHl7Gjv1qT
         BegFwhmj1AmB8OOf59Uu0tk8wCBPNWiaPFZa/DDQCd9sPrdp0sCYjp+T2hSnWRjuLxbz
         1qkFv2czeB6Uo9ax8LBIteA705D3vD5Y7qUz5+NBedEDFFnQDKVFzKVXpLKGJUnQrE+I
         SN6HRXb1WYUITdP3c22vlapt23gTlXRE6Wo5V1XyW3B6OXL7Oehvrc5iVyHmp74GfLgz
         KsrRFAaBdxfniMW6J8iXq2aM4aK9eSO2VCvdHOI6rrZOeXEQjV9wtpgMmJO/QfFSC+rr
         HZIA==
X-Forwarded-Encrypted: i=1; AJvYcCWKxQTPGik4FvGw2wIhhrRdcOg6nmWt3VDD0AFqu0VVOyUiE4B2gck3tlfC8ng02OldsI4s/EcKe1GFDSr6bChO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw85I8TV45rcwrpImdWjnD09dAlA9y4yk02kh8+Nforqt7uGA0m
	1zaCxH9JwKs3RGaWhrELRHBK4MMmdI3WPtT84GUZJJ7/Ny9B33Xsmx50m7qaXL+TUIw=
X-Gm-Gg: ASbGncu/NEF5qLWsKF4jGm9gfAQsS0d8QJyU5Z+bVhMqh0ZWmfQyWcYwvjmQRwI69Gv
	upmhogmfE+3sEcn3bIs6F6I7fBBX3wjKzyLdhAfgz3PzhU2xzEhx8jmrdq5FNToShmXe7jkV9S2
	rRWlw9fu0/2cLi5oVPrWLaWoBHO0D9DBRpurHrvvQ800a8DzapwoKqyFV6cKWDMyOMLaEcpbIMI
	l+o5jEqn2WF4jd18fK1/FHPRsFA+/s7pt7T/5IN4DnfGGNR+SOPMDV+h5hwDyuFyuvWlL42egvW
	Gf2IbxAOvg8Mugo2w4CXOK5xbVEvuEDI5fyYC4f+jrW+uHgLjoWKkpnAiqKsAnTwvux6AinUMTM
	DMTDLLrf1UfpDU5WiZhpGvdrcbQ==
X-Google-Smtp-Source: AGHT+IGZKR4ycwSMzrqSf8EzPWzEYvLi9+vxNDQf6ku1dpyxkwx330HC9znsLRd8NyKKnUo4pxNj8g==
X-Received: by 2002:a05:6000:2705:b0:3c6:a970:1505 with SMTP id ffacd0b85a97d-3c6a9701ec9mr4679656f8f.43.1756124761743;
        Mon, 25 Aug 2025 05:26:01 -0700 (PDT)
Received: from [10.1.1.59] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c86a8ccd1bsm7068027f8f.27.2025.08.25.05.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 05:26:01 -0700 (PDT)
Message-ID: <2855688dcb6898af0d4b03913c6193da8b115760.camel@linaro.org>
Subject: Re: [PATCH v5 4/4] arm64: dts: exynos: google: add Maxim MAX77759
 Fuel-gauge
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: t.antoine@uclouvain.be, Sebastian Reichel <sre@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin
 Marinas	 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Peter
 Griffin	 <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Date: Mon, 25 Aug 2025 13:25:59 +0100
In-Reply-To: <20250804-b4-gs101_max77759_fg-v5-4-03a40e6c0e3d@uclouvain.be>
References: <20250804-b4-gs101_max77759_fg-v5-0-03a40e6c0e3d@uclouvain.be>
	 <20250804-b4-gs101_max77759_fg-v5-4-03a40e6c0e3d@uclouvain.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_052604_039208_6C3B11AE 
X-CRM114-Status: GOOD (  21.42  )
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

On Mon, 2025-08-04 at 16:26 +0200, Thomas Antoine via B4 Relay wrote:
> From: Thomas Antoine <t.antoine@uclouvain.be>
>=20
> Add the node for the Maxim MAX77759 fuel gauge as a slave of the i2c.
>=20
> The TODO is still applicable given there are other slaves on the
> bus (e.g. PCA9468, other MAX77759 functions and the MAX20339 OVP).
>=20
> For the device specific values (full design capacity and terminal
> current), the device should check an EEPROM at address 0x50 of the
> hsi2c_8 for a battery id stored in register 0x17. A set of parameters
> for the initialization of the fuel gauge should be chosen based on
> this id. Those sets are defined here:
>=20
> Link:
> https://android.googlesource.com/kernel/gs/+/refs/heads/android-gs-raviol=
e-5.10-android15/arch/arm64/boot/dts/google/gs101-oriole-battery-data.dtsi
> Link:
> https://android.googlesource.com/kernel/gs/+/refs/heads/android-gs-raviol=
e-5.10-android15/arch/arm64/boot/dts/google/gs101-raven-battery-data.dtsi
>=20
> This does not seem to be a standard pattern in the kernel currently
> so it is not implemented. Values observed on tested devices are
> instead used. The driver or the devicetree should be should be
> extended in the future to take versions into account.
>=20
> The pinctrl name follows the convention proposed in
> Link: https://lore.kernel.org/all/20250524-b4-max77759-mfd-dts-v2-2-b4795=
42eb97d@linaro.org/
>=20
> Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 10 ++++++++
> =C2=A0.../boot/dts/exynos/google/gs101-pixel-common.dtsi | 30 +++++++++++=
+++++++++++
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101-raven.dts=C2=A0 | 11 ++++++=
++
> =C2=A03 files changed, 51 insertions(+)

[...]

> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/=
arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
> index d6ddcc13f7b20c6dfbe92e86abafe965870d0c78..3362ad89ef6bacb7349259cf9=
e14452193ff7361 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
> @@ -10,6 +10,7 @@
> =C2=A0
> =C2=A0#include <dt-bindings/gpio/gpio.h>
> =C2=A0#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> =C2=A0#include <dt-bindings/usb/pd.h>
> =C2=A0#include "gs101-pinctrl.h"
> =C2=A0#include "gs101.dtsi"
> @@ -99,6 +100,16 @@ &hsi2c_8 {
> =C2=A0	eeprom: eeprom@50 {
> =C2=A0		compatible =3D "atmel,24c08";
> =C2=A0		reg =3D <0x50>;
> +
> +		nvmem-layout {
> +			compatible =3D "fixed-layout";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			fg_state: fgstate@42 {
> +				reg =3D <0x42 0x17>;
> +			};
> +		};
> =C2=A0	};
> =C2=A0};
> =C2=A0
> @@ -188,6 +199,18 @@ usbc0_role_sw: endpoint {
> =C2=A0			};
> =C2=A0		};
> =C2=A0	};
> +
> +	fuel_gauge: fuel-gauge@36 {
> +		compatible =3D "maxim,max77759-fg";
> +		reg =3D <0x36>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&if_pmic_fg_int>;
> +		interrupt-parent =3D <&gpa9>;
> +		interrupts =3D <3 IRQ_TYPE_LEVEL_LOW>;

small nit - for consistency with other interrupt specs in this file,
could you switch to using interrupts-extended please?

Cheers,
Andre'

