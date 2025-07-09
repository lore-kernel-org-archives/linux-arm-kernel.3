Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8C4C83F18
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 21:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOEjp0rI68+oAu3N7tGiFdzG9GzJlC8rN3jpoD8NMRI=; b=VfGCNSNKqVrRKCTSlYFc37xD1G
	9UntWQxKTQsdAOgQKU7a4gXpy/ei/NJZSie8EJy6jennH8Qv0ZIzXgTkODnFcdk//D/HRqA9FqeVi
	ikulOM8wgtUjxrzkLC66fvM47Cvp9jnm+svfh8FsU6CjwjtQ5c1/WBWlUUXnONh/qhG4W2JcZ5eIq
	OR/EXL9KsPf/Sz8YT4qrj8oDnXNnYFX4AKU0smSCNjPdW1K9tT7WCojwHcuybRn1qziHL1cEiJDmn
	SfS63cPAEtfxfW6t9M7/lC9uzooM0PX9g9PjJTTXtmQB9TE9CdWJQGvAhn/aBzPZeKg94+bxbWOji
	cJ/vpzqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcoG-00000009xXs-2SHD;
	Wed, 09 Jul 2025 21:58:36 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZYPN-00000009Pby-1nrB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 17:16:38 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-711756ae8c9so1091597b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 10:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752081396; x=1752686196; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jOEjp0rI68+oAu3N7tGiFdzG9GzJlC8rN3jpoD8NMRI=;
        b=Zh87LzmpoZix8Vpog8uhAh4IhAl16L3OApHY7ACh6hbV/Xcg4lniZXGwqzy0Bq6AM2
         QYOodXwQ+eXzFZBO3tyVMHPAjZZ3fnZLVLXMFUvO2C6b5E/0vsdCKRxmXvA5liskEKxc
         cebCqHc2HBoMyCheGVMz7tVrliFVcswMM6jH3jbxx3kYumAFvPrb5+YV3ff+UVxn7335
         38fU1DywwCZRqzKtpQBoSgG5tAX98gw+NGnYj0cGAa/zegvVISCT0TGcKPImmFbcKQZx
         HUQ7alP1xRBKYIfdswabwnLjtePT2k3pIex9XFejst1fxvB7zjIPrQM8j770xImcwxta
         5jPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752081396; x=1752686196;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jOEjp0rI68+oAu3N7tGiFdzG9GzJlC8rN3jpoD8NMRI=;
        b=joP9nWYAhl6ckWh/Kz08xP6r4gBupNUB5O5pERKEaowtkIh1qEXq5Aav89zH7zpf7O
         Qlz7kcVUDAQrtL4FIsRngHQPAhzXuj2JmX+qQPldylDSulzrDa1jdutVDTbe/RY1CA7c
         AdBopJkrJ4oFrAxEM/m53Snq7XZtUSNixOlcPQ1/qYTjVjrNljdxaZ6Y+ol8sTDO0NOc
         g+BSb+/mNVbAYqnftzEAj8ynBVbJbCf6HhVs44sc8Wgvj4Ah0l1KxJaW+kzXTWyHAcV+
         UGpPyt+7qVlZW4ew0BuznmeIOOb00KJAJnmisBmChaH5DbxfwQFY7uFMySmenLti4Sbg
         qu2w==
X-Forwarded-Encrypted: i=1; AJvYcCXqOq75/eqfNK2iqrVhCaBpDu1rH4ollmdtMkKS2PkOovMRFOtnVJVYS5afBU8JY1oKiGsOnBTCMthoPpar2lHL@lists.infradead.org
X-Gm-Message-State: AOJu0Yw29WX1IKHSOOADWTqwDohfHCKxncUm2XFgFIBLg9hw0Bhzjk7N
	siGQa3tI3opItus088LfsAP9ABq5MskYvUv9hTYTSKGekF7x4vpGy/GvOUeyX0FuGDB1Su0K3gf
	Do33pp1ntN3nrUAEEMukr0PI0CP2XnGQ=
X-Gm-Gg: ASbGncuSEEwm0/cQlXrkLJus5XLVpfFb89Bz36RGedGtUFOyIQkwLRxD/9gCBoNrcKe
	krjRdK3DyDTcxGwHkfWLiWuI09bHqrixejDquYVAXS8L9pdRcQw6qOjPQk2IYJF/vFUxBtFT/U5
	/XWRQJgr/hx5aZ7yKmcm7om5bOpMMGUcegtL7qcfAzbrK8dron5xLg
X-Google-Smtp-Source: AGHT+IG+AR194uVOXn9cJKdMqorA7Nt38ozun9vVht7g1aQ/Y5/WltzQmb4TmFCfzfv+s2fG57LMCLN/GK/DBbGpONQ=
X-Received: by 2002:a05:690c:d0d:b0:712:d70b:45eb with SMTP id
 00721157ae682-717b19cb385mr50098157b3.31.1752081396367; Wed, 09 Jul 2025
 10:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250708184841.72933-1-stefano.radaelli21@gmail.com>
 <20250708184841.72933-3-stefano.radaelli21@gmail.com> <0454b830-b9bf-4d04-8e91-d5c514ac4aae@kernel.org>
In-Reply-To: <0454b830-b9bf-4d04-8e91-d5c514ac4aae@kernel.org>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Wed, 9 Jul 2025 19:16:20 +0200
X-Gm-Features: Ac12FXwi3-PTorWyZPZXK4OAkGLyFPpogeHMEzObU5YvDrGXWl8TmNln6b1jYBg
Message-ID: <CAK+owoiL8613hEqDso7cCbqw9vT-TV0eRLvJPq81ZwVDHT7rHA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] arm64: dts: ti: Add support for Variscite VAR-SOM-AM62P
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_101637_473481_D234D8AE 
X-CRM114-Status: GOOD (  29.36  )
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

Hello Krzysztof,

thank you for your corrections, I completely forgot to compile with
the W=1 flag.

I'll take care of everything,

Best Regards,

Stefano

Il giorno mer 9 lug 2025 alle ore 10:46 Krzysztof Kozlowski
<krzk@kernel.org> ha scritto:
>
> On 08/07/2025 20:48, Stefano Radaelli wrote:
> > Add device tree support for the Variscite VAR-SOM-AM62P system on module.
> > This SOM is designed to be used with various carrier boards.
> >
> > The module includes:
> > - AM62Px Sitara MPU processor
> > - Up to 8GB of DDR4-3733 memory
> > - eMMC storage memory
> > - PS6522430 chip as a Power Management Integrated circuit (PMIC)
> > - Integrated 10/100/1000 Mbps Ethernet Transceiver Analog Devices ADIN1300
> > - Resistive touch panel interface controller TI TSC2046
> > - I2C interfaces
> >
> > Only SOM-specific peripherals are enabled by default. Carrier board
> > specific interfaces are left disabled to be enabled in the respective
> > carrier board device trees.
> >
> > Link: https://www.variscite.it/product/system-on-module-som/cortex-a53-krait/var-som-am62p-ti-sitara-am62px/
> >
> > Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
> > ---
> >  arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 379 ++++++++++++++++++
> >  1 file changed, 379 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> > new file mode 100644
> > index 000000000000..1d4ebc484d55
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> > @@ -0,0 +1,379 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Common dtsi for Variscite VAR-SOM-AM62P
> > + *
> > + * Copyright (C) 2021-2022 Texas Instruments Incorporated - https://www.ti.com/
> > + * Copyright (C) 2025 Variscite Ltd. - https://www.variscite.com/
> > + *
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/leds/common.h>
> > +#include <dt-bindings/pwm/pwm.h>
> > +#include "k3-am62p5.dtsi"
> > +
> > +/ {
> > +     compatible = "variscite,am62p-var-som", "ti,am62p5";
> > +
> > +     iw612_pwrseq: iw612_pwrseq {
>
> Follow DTS coding style. This applies to multiple places.
>
> Also:
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>
>
> > +             compatible = "mmc-pwrseq-simple";
> > +             post-power-on-delay-ms = <100>;
> > +             power-off-delay-us = <10000>;
> > +             reset-gpios = <&main_gpio0 54 GPIO_ACTIVE_LOW>, /* WIFI_PWR_EN */
> > +                           <&main_gpio0 59 GPIO_ACTIVE_LOW>; /* WIFI_EN */
> > +             status = "okay";
>
> Why? Drop.
>
> > +     };
> > +
> > +     emmc_pwrseq: pwrseq@0 {
>
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
> Maybe you need to update your dtschema and yamllint. Don't rely on
> distro packages for dtschema and be sure you are using the latest
> released dtschema.
>
> > +             compatible = "mmc-pwrseq-emmc";
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&emmc_pwrseq_pins>;
> > +             reset-gpios = <&main_gpio0 49 GPIO_ACTIVE_LOW>;
> > +     };
> > +
> > +     memory@80000000 {
> > +             /* 8G RAM */
> > +             reg = <0x00000000 0x80000000 0x00000000 0x80000000>,
> > +                   <0x00000008 0x80000000 0x00000001 0x80000000>;
> > +             device_type = "memory";
> > +             bootph-pre-ram;
> > +     };
> > +
> > +     opp-table {
> > +             /* Add 1.4GHz OPP for am62p5-sk board. Requires VDD_CORE at 0v85 */
> > +             opp-1400000000 {
> > +                     opp-hz = /bits/ 64 <1400000000>;
> > +                     opp-supported-hw = <0x01 0x0004>;
> > +                     clock-latency-ns = <6000000>;
> > +             };
> > +     };
> > +
> > +     reserved_memory: reserved-memory {
> > +             #address-cells = <2>;
> > +             #size-cells = <2>;
> > +             ranges;
> > +
> > +             rtos_ipc_memory_region: rtos-ipc-memory@9b500000 {
> > +                     compatible = "shared-dma-pool";
> > +                     reg = <0x00 0x9b500000 0x00 0x00300000>;
> > +                     no-map;
> > +             };
> > +
> > +             mcu_r5fss0_core0_dma_memory_region: mcu-r5fss-dma-memory-region@9b800000 {
> > +                     compatible = "shared-dma-pool";
> > +                     reg = <0x00 0x9b800000 0x00 0x00100000>;
> > +                     no-map;
> > +             };
> > +
> > +             mcu_r5fss0_core0_memory_region: mcu-r5fss-memory-region@9b900000 {
> > +                     compatible = "shared-dma-pool";
> > +                     reg = <0x00 0x9b900000 0x00 0x00f00000>;
> > +                     no-map;
> > +             };
> > +
> > +             wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
> > +                     compatible = "shared-dma-pool";
> > +                     reg = <0x00 0x9c800000 0x00 0x00100000>;
> > +                     no-map;
> > +             };
> > +
> > +             wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
> > +                     compatible = "shared-dma-pool";
> > +                     reg = <0x00 0x9c900000 0x00 0x01e00000>;
> > +                     no-map;
> > +             };
> > +
> > +             secure_tfa_ddr: tfa@9e780000 {
> > +                     reg = <0x00 0x9e780000 0x00 0x80000>;
> > +                     no-map;
> > +             };
> > +
> > +             secure_ddr: optee@9e800000 {
> > +                     reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
> > +                     no-map;
> > +             };
> > +     };
> > +
> > +     vcc_3v3: vcc-3v3 {
>
> Please use name for all fixed regulators which matches current format
> recommendation: 'regulator-[0-9]v[0-9]'
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml?h=v6.11-rc1#n46
>
>
> Best regards,
> Krzysztof

