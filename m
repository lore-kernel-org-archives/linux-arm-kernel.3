Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCD7CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 10:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3OPza13UxQG3vaIXj292M6st2XTaYne/dlf9fQOIh4A=; b=lWT6lwTqiv/HbIbmrmdrfiSDo1
	2oaTC2fQ4l2NPERoWcdma7vzKSPCxs3B/T3fqa6Orp0gzlduEvzjU4/fmkQWuzoChZ7D+XfFBHAiR
	mDQaqttdRHZdUzYPLZ1d2qDoedCJWLIYtUX8HMvKbA4ITke7VDN/BNDJhO86r7k6pPGgiUHtOhUBe
	8ursXamIRWiEasP7IkPghSe1jcRe2eyG4OE/zNO/tzeEConCj9CyEN8lK431QFVTBcVoAGZE4I9PE
	PWh7EN1zEXsHTxm7GH14g1aNBkSlgPglQTUtgZEEYx2b5uT1DFJVlvxfW7faPz2QouqKsfeAjWZSy
	+Lm22lqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1JX-00000008frH-3dUV;
	Fri, 12 Sep 2025 10:47:35 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1JV-00000008fqW-2QO2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 10:47:34 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-751415c488cso1482458a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 03:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757674052; x=1758278852; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3OPza13UxQG3vaIXj292M6st2XTaYne/dlf9fQOIh4A=;
        b=cANQUtbolM40qSTR5+P1MdWWq2Qot/1IiOJRHQWTi856n7WECUe2NVBwiZkBjT+ca2
         1JDluPRVN6EHVPuoQRMzsAASO58psr3fzdCxY/e+aduK+6qVsaZ27rpMeDYtx3nlwQuz
         av9QfnfpwGF4WZSotyKLHg1uHFdY+WkBF0COdf/cONFmn0K49zqjzVumtURMAkD0+oK2
         HhALgmZqb/rIYadZ4jgFgX+sr3HIAiHrqn3TQa8vf8bw56+EThjsbJBxvm7Z6JLkniVJ
         zMqusyIWvHE+uhq1Zuvb7K8IPmJk27SBZryVQqDy1If9KzTLCuZECzPOzuMWBlnSt2ET
         zT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757674052; x=1758278852;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3OPza13UxQG3vaIXj292M6st2XTaYne/dlf9fQOIh4A=;
        b=Ibq4gFsuoPYVig1/TEpJPlVUMizNw4vh1Oheh7CNbTmUmcneIoHL6AYCbxA0+8JzqB
         YsYa38V7nOQdqRJNWkHcLDUn2FXutO85hFbV+tt8xKHSFH52SvYkM+HoS9YoJCijr33B
         sg26Zlm8yQyY+lJbA4T4sGOv666+YFd31glu0rvGqa4QeX+K88K0of79Ewhhza+2Egyz
         S+6CjXOzHK2RCBcbwWjhpOThyYh7Fff5L6dKvXXwDJLuYJ7GzIjxnGgYayc8Pibr0sah
         J752hNeEEgbGXLvKiJwN7Axp1N39bt0e8xvyFhD3xychhhn+miMJ0jE1GnQjoh5U26jk
         2S7A==
X-Forwarded-Encrypted: i=1; AJvYcCX32+5Vekx0IJrdB0fDd2Y7zX/AO0OheIlBtHtl6QGF8U2z484M2UhDbuaUnakHr7LrzbkKMYsd0ueUyacoc1Ws@lists.infradead.org
X-Gm-Message-State: AOJu0YwsStErFR9VxRb/CPhkbLsTJxsWS7HAyg2T1WNWs7J0QQ0gD19Q
	2qHn4IU07G+gaQdI37Mm7MBNEwWK1/gbMJHKLjge9Xxl6mY/95STepVVg6IeT7e4+jsiHXAZeBE
	prqf7VyySHFcS/aXaE5vuv6+6AWarjW+CeMl2TuF/Sw==
X-Gm-Gg: ASbGnctBVsmPPOpegyubi6vsvVqJDRqzFVzJ5N6dwHzqjYjA1AXMuKrXsNpavLdn4fR
	YDgBvGzbMrOyxaZwGxAy1G/4YlWRWB/leT8fLqocTzuAagAInmbI77Wun91Aj6U4WhYyX1Dnf0f
	tgGDHDivWNnhUff2MQX+F6kKmUCLLdj/jkn4ZEAbqVX20eC/o4SjLxGraMA5MzMHdMmwCzwSOCy
	WZY3Ms=
X-Google-Smtp-Source: AGHT+IEwK6PAnW60amX/KFZUitg+3IWCKUF6YtBbEuqSyk7vuHndUimzJs3aHNTIWVsqYWSuZljSYmdD0ujXlXGOsTc=
X-Received: by 2002:a05:6830:25c3:b0:741:924c:3f60 with SMTP id
 46e09a7af769-753550e1f31mr1194594a34.20.1757674052466; Fri, 12 Sep 2025
 03:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250804-b4-gs101_max77759_fg-v5-0-03a40e6c0e3d@uclouvain.be> <20250804-b4-gs101_max77759_fg-v5-4-03a40e6c0e3d@uclouvain.be>
In-Reply-To: <20250804-b4-gs101_max77759_fg-v5-4-03a40e6c0e3d@uclouvain.be>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 12 Sep 2025 11:47:21 +0100
X-Gm-Features: Ac12FXyNpSAUYBZClLOkGpS7sVjhUkL1QiaqAQuJpPSEayd4ohKDjbLy5QhjEPs
Message-ID: <CADrjBPqT8GORaMReQwMGUV+Lrh-njhk_giD2gQUPJRRuSz4XNw@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] arm64: dts: exynos: google: add Maxim MAX77759 Fuel-gauge
To: t.antoine@uclouvain.be
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_034733_627889_6B396BD6 
X-CRM114-Status: GOOD (  26.06  )
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

On Mon, 4 Aug 2025 at 15:25, Thomas Antoine via B4 Relay
<devnull+t.antoine.uclouvain.be@kernel.org> wrote:
>
> From: Thomas Antoine <t.antoine@uclouvain.be>
>
> Add the node for the Maxim MAX77759 fuel gauge as a slave of the i2c.
>
> The TODO is still applicable given there are other slaves on the
> bus (e.g. PCA9468, other MAX77759 functions and the MAX20339 OVP).
>
> For the device specific values (full design capacity and terminal
> current), the device should check an EEPROM at address 0x50 of the
> hsi2c_8 for a battery id stored in register 0x17. A set of parameters
> for the initialization of the fuel gauge should be chosen based on
> this id. Those sets are defined here:
>
> Link: https://android.googlesource.com/kernel/gs/+/refs/heads/android-gs-raviole-5.10-android15/arch/arm64/boot/dts/google/gs101-oriole-battery-data.dtsi
> Link: https://android.googlesource.com/kernel/gs/+/refs/heads/android-gs-raviole-5.10-android15/arch/arm64/boot/dts/google/gs101-raven-battery-data.dtsi
>
> This does not seem to be a standard pattern in the kernel currently
> so it is not implemented. Values observed on tested devices are
> instead used. The driver or the devicetree should be should be
> extended in the future to take versions into account.
>
> The pinctrl name follows the convention proposed in
> Link: https://lore.kernel.org/all/20250524-b4-max77759-mfd-dts-v2-2-b479542eb97d@linaro.org/
>
> Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
> ---

This needs rebasing now to apply. With Andre's feedback addressed

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>




>  arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 10 ++++++++
>  .../boot/dts/exynos/google/gs101-pixel-common.dtsi | 30 ++++++++++++++++++++++
>  arch/arm64/boot/dts/exynos/google/gs101-raven.dts  | 11 ++++++++
>  3 files changed, 51 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> index 8df42bedbc036b5e97f6238d64820370043ffef2..18d147f6ea4a1a76c375996557349c866b9dad72 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> @@ -13,6 +13,12 @@
>  / {
>         model = "Oriole";
>         compatible = "google,gs101-oriole", "google,gs101";
> +
> +       battery: battery {
> +               compatible = "simple-battery";
> +               charge-full-design-microamp-hours = <4524000>;
> +               charge-term-current-microamp = <45000>;
> +       };
>  };
>
>  &cont_splash_mem {
> @@ -27,3 +33,7 @@ &framebuffer0 {
>         format = "a8r8g8b8";
>         status = "okay";
>  };
> +
> +&fuel_gauge {
> +       monitored-battery = <&battery>;
> +};
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
> index d6ddcc13f7b20c6dfbe92e86abafe965870d0c78..3362ad89ef6bacb7349259cf9e14452193ff7361 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
> @@ -10,6 +10,7 @@
>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/usb/pd.h>
>  #include "gs101-pinctrl.h"
>  #include "gs101.dtsi"
> @@ -99,6 +100,16 @@ &hsi2c_8 {
>         eeprom: eeprom@50 {
>                 compatible = "atmel,24c08";
>                 reg = <0x50>;
> +
> +               nvmem-layout {
> +                       compatible = "fixed-layout";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +
> +                       fg_state: fgstate@42 {
> +                               reg = <0x42 0x17>;
> +                       };
> +               };
>         };
>  };
>
> @@ -188,6 +199,18 @@ usbc0_role_sw: endpoint {
>                         };
>                 };
>         };
> +
> +       fuel_gauge: fuel-gauge@36 {
> +               compatible = "maxim,max77759-fg";
> +               reg = <0x36>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&if_pmic_fg_int>;
> +               interrupt-parent = <&gpa9>;
> +               interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> +               shunt-resistor-micro-ohms = <5000>;
> +               nvmem-cell-names = "fg_state";
> +               nvmem-cells = <&fg_state>;
> +       };
>  };
>
>  &pinctrl_far_alive {
> @@ -214,6 +237,13 @@ typec_int: typec-int-pins {
>  };
>
>  &pinctrl_gpio_alive {
> +       if_pmic_fg_int: if-pmic-fg-int-pins {
> +               samsung,pins = "gpa9-3";
> +               samsung,pin-function = <GS101_PIN_FUNC_EINT>;
> +               samsung,pin-pud = <GS101_PIN_PULL_UP>;
> +               samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
>         key_power: key-power-pins {
>                 samsung,pins = "gpa10-1";
>                 samsung,pin-function = <GS101_PIN_FUNC_EINT>;
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
> index 1e7e6b34b8649bc700a745c579a0268f0f6a9524..f91800879ea94b8fb0008c5e1f828072cabc1ac7 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
> @@ -13,6 +13,13 @@
>  / {
>         model = "Raven";
>         compatible = "google,gs101-raven", "google,gs101";
> +
> +       battery: battery {
> +               compatible = "simple-battery";
> +
> +               charge-full-design-microamp-hours = <4904000>;
> +               charge-term-current-microamp = <49000>;
> +       };
>  };
>
>  &cont_splash_mem {
> @@ -27,3 +34,7 @@ &framebuffer0 {
>         format = "a8r8g8b8";
>         status = "okay";
>  };
> +
> +&fuel_gauge {
> +       monitored-battery = <&battery>;
> +};
>
> --
> 2.50.1
>
>

