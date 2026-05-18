Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C72CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 13:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=komgnNDlnLmJ/J1MdSAHqHWZaLQI8RsIwYhp36n6zQ4=; b=o3+1vYcxswoLHB3Dq5XKdWFzfk
	yK1nnwtlK/OEJjGQm9t6aFIGNyLX77ZU45KRd9fhfe1BBCUQeFJabV3rn6q0niy/bBR4xCJ9TQ5/+
	x4CmwsPFg3AgCetZOlaJOwhQqyxVfji0HKTuR6zI9AbfWeiEmtVSg6Tvl336Cny9Z23KOY0f6aw0f
	L4McdHx2rS8QJOpTtQTWtPSwcmcwPpWCvJWXzlnIZ847yNuL1e+gZPddIgGVb4nDv4lRPfVSsmJ3/
	7gmwRvpMJHNn3t4vgH6X+XziWcH5wozNWR8DB6K2bWK+Znck8qshkih2k4jjFbGawbXXTpBSSjX+5
	mkPh2XbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxlF-0000000Flee-1MvK;
	Mon, 18 May 2026 13:11:57 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxlC-0000000Fldx-0W4u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 13:11:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CsYLP3Ind84rQrOGm/1CsLXUi67s/TJHUP54BERlimXaViagk/uBym8U2gkqBaRQvT4RfjjKnZgxpO91axnwBcxJr3fZ9kZ4fM3nxvGGPp09lQqiuA+DEotR22/fEZXyw1lCK54+HtZJjMzT7eSPNwlw1Vmvc0Jeuwo/O6uhharBsqcitlpdOtklG90EjnoZq7k9dSVG+ohg7QRdI7pBEBa0MnN0q0wws654jsbvXsLJ+J4xfprqHOwzf0qoUmLJHZXv1unF1JAHUL/6EglPN1L9ILDY2zuu58rh88mqIRI7UsUT1UJBj4+dJOiLIOCszgxst7S1IVfmxcT+jUJKEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=komgnNDlnLmJ/J1MdSAHqHWZaLQI8RsIwYhp36n6zQ4=;
 b=iElSRVECkmSwHcI1VmX9BThn1jKGe0bWO1KsDuQKCfceh5VlbFD4cTR80pdPzkQ/ZrN7EX1bGWUc0m/XjISTnx82XF24aNMuRIDjf+3PnepguSdfHOdTn/xCGyOaGBMO/WYgIHK40C+ayUZaygziBFbe5wZuZo9eJeU7iRswjM2hZUe89oi6DkYpLg0yIYVPxnyD9jguBvPX0z4WniQwHW3acDFGicsb3b2/dF3gSLX+35OBaXCOc+feAVCk5cH8syRiSl5acDjgHrgggRduS3Pec3Gw4thsnxMN2P2+wWgV2ko2+G4t1p9PZUxGBJDz0Xhhx9nRd3UPonudQ6f2OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=komgnNDlnLmJ/J1MdSAHqHWZaLQI8RsIwYhp36n6zQ4=;
 b=gyX1mNe3HiGkhuxQq0zlknQy/uka0Q0URVqmy+iRvU4BQHinaqzmRxjyYF7nQIBwA0+92de6VucM5Q58yDB4QluOhzN0pIAN+UCCo9NDkKhNDE9ySz1hLGbs7L0AJ0QoP509FF+RdnfyN12D2A4btGQRuXTAyDVrUXWr1m+QNQc=
Received: from MW4PR03CA0059.namprd03.prod.outlook.com (2603:10b6:303:8e::34)
 by PH7PR10MB7837.namprd10.prod.outlook.com (2603:10b6:510:304::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Mon, 18 May
 2026 13:11:40 +0000
Received: from MWH0EPF000C6185.namprd02.prod.outlook.com
 (2603:10b6:303:8e:cafe::60) by MW4PR03CA0059.outlook.office365.com
 (2603:10b6:303:8e::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Mon, 18
 May 2026 13:11:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000C6185.mail.protection.outlook.com (10.167.249.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 13:11:38 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 18 May
 2026 08:11:37 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 18 May
 2026 08:11:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 18 May 2026 08:11:37 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64IDBb8l1932694;
	Mon, 18 May 2026 08:11:37 -0500
Date: Mon, 18 May 2026 08:11:37 -0500
From: Nishanth Menon <nm@ti.com>
To: Judith Mendez <jm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>, Bryan Brattlof <bb@ti.com>, Jason Kridner <jkridner@gmail.com>,
	Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH v4 2/3] arm64: dts: ti: Add k3-am62l3-beaglebadge
Message-ID: <20260518131137.zazw4xf6n7ftil6l@predator>
References: <20260515153541.294698-1-jm@ti.com>
 <20260515153541.294698-3-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260515153541.294698-3-jm@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6185:EE_|PH7PR10MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: 19a9d457-09e3-4f67-9ed1-08deb4deff04
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|13003099007|56012099003|22082099003|18002099003|3023799003|4143699003;
X-Microsoft-Antispam-Message-Info: zuShLiGLask6VOb7uOAzu3E8hF83TgdnjEf9XaOIQBaZOW9QHnrv7l5b7XGGnyV7IcRGv3WhqjF2zxBZXToF0OL7ZCbPIlf3mBCpDVQ8Z2qMjKs9GY+2zlnsxgxoUFnn9H4I1cM55zZdq8hjAoNEnJxzOpgmJARyPFvC4Jl5SbGxLxeLbvqf8j+gGvibK3KS7KhmKd4mRTJ+LxTIXs1LL/AeEh0JNwshDwWwwgBYlSlkSTtcaE05NX0O7p9oreE1y0+ee8rTs8ElWBD6KGTZ9kklu8rXaEpfkZ3dqJ0a9F5FI0j7fPqZwfOzNL7y6TSq2Qhrqd3OlmFGR2b+wP7P8z6sbl+U0QujPELT03phc/GXk/x8f3r5SUKXHBpLR2IaG429pAAH7NdSE6grLtfx+H3uyeyNXBAak6vbzu66kFUpLkxVlLo5dVGD2wFF9jcnkMSzMYtThfBXTR9LJRYL1SE4X1rrqx7eC1/t6OOOs1/n6qhBNr0LzGIoGWbIZbRFvN51xJCeQSbUqmHwMmnYUG+jc3xgxjxofLUmnsc2sEZHbR5TWoZqPQSqZfw9Df12jihH/LsZcVI6TcHuVMOqM6DpIJiaWMIOLt9iiKbUjnibW5Ta3NPjt1SwO7juZ0q3K/RumizeJnjrzyrGH81AsiH/dgh0Bk9N9DcspDUR6anBs9ntDdb7wKndV/ok7iDz
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(13003099007)(56012099003)(22082099003)(18002099003)(3023799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: e+4nBDpaTJ1KNFRvJ1MhXwuaDRiCh4Jboo3bqs+KcYdpTQyaJkLaBLmv6ZPVEp2b9eZb49rWKfPcB8zDyqsaSVlOvXNfK0vV2pxWMLJDoaTcMJiE6LTr0uSnCGT83S1CsVM5YAkoOa2cioksnKC6WMyp/jQrRAx7Ck9qd6sDRxZmuRpvQf931a+Wz+FJfSE/TQPkQu27EtEp+pa2690mMjYEWVNHLp4MVduMWado2Wv1JgPehi+0FKhFy3NIlmv6MfG8hH1Vp+1H/SwctS570+9uAtz1eLDbiOpnYdi/cb6TV0fuiNA+FENoxdF+Oyoe1GrUwMBQXrdxqLFjq/WitBoJJxYwRk4emjMCyES8I9sqlwieU0YwnVNl1O1lj6uuB8tgfpbjUX/oXKMBGHXmI7qG8Tb7qlduXqJkNXiScGu76I+AWgkE4hEDfOpIJLBu
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 13:11:38.6082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a9d457-09e3-4f67-9ed1-08deb4deff04
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6185.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7837
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_061154_237629_59A18310 
X-CRM114-Status: GOOD (  22.93  )
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

On 10:35-20260515, Judith Mendez wrote:
> BeagleBoard.org BeagleBadge is a compact, affordable open source
> hardware single board computer based on the Texas Instruments AM62L3
> SoC designed for IoT and embedded applications with low power
> consumption. Expansion is provided over open standards based headers
> including QWIIC and GPIO interfaces.
> 
> https://github.com/beagleboard/BeagleBadge

Why not use https://www.beagleboard.org/boards/beaglebadge ?
> 
> Co-developed-by: Andrew Davis <afd@ti.com>
> Signed-off-by: Andrew Davis <afd@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
> Changelog since v3:
> - Add missing newline in commit message
> - Drop beagleboard URL
> - Drop uneeded header files
> - Add boothph flags in wkup_i2c0 & PMC nodes
> ---
>  arch/arm64/boot/dts/ti/Makefile               |   1 +
>  .../boot/dts/ti/k3-am62l3-beaglebadge.dts     | 700 ++++++++++++++++++
>  2 files changed, 701 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts
> 
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index 5269c9619b65c..4e377ca011cd8 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62d2-evm.dtb
>  
>  # Boards with AM62Lx SoCs
>  dtb-$(CONFIG_ARCH_K3) += k3-am62l3-evm.dtb
> +dtb-$(CONFIG_ARCH_K3) += k3-am62l3-beaglebadge.dtb
>  
>  # Boards with AM62Px SoC
>  dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts b/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts
> new file mode 100644
> index 0000000000000..30fc9c83b1f44
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts
> @@ -0,0 +1,700 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * https://www.beagleboard.org/boards/beaglebadge
> + *
> + * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/

Seeing the tags, I assume no BeagleBoard.org member contributions?

> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include "k3-am62l3.dtsi"
> +#include "k3-pinctrl.h"
> +
> +/ {
> +	compatible = "beagle,am62l3-beaglebadge", "ti,am62l3";
> +	model = "BeagleBoard.org BeagleBadge";
> +
> +	chosen {
> +		stdout-path = &uart0;
> +	};
> +
> +	aliases {
> +		gpio0 = &gpio0;
> +		gpio2 = &wkup_gpio0;
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		i2c2 = &i2c2;
> +		i2c4 = &wkup_i2c0;
> +		mmc1 = &sdhci1;
> +		mmc2 = &sdhci2;
> +		serial3 = &uart1;
> +		usb0 = &usb0;
> +		usb1 = &usb1;

is this valid?
git grep of_alias_ driver/usb/

am I missing something?

> +	};
> +
> +	memory@80000000 {
> +		/* 256MB */
> +		reg = <0x00000000 0x80000000 0x00000000 0x10000000>;
> +		device_type = "memory";
> +		bootph-all;
> +	};
> +
> +	thermal-zones {
> +		wkup0-thermal {
> +			polling-delay-passive = <250>;	/* milliSeconds */
> +			polling-delay = <500>;		/* milliSeconds */
> +			thermal-sensors = <&vtm0 0>;
> +
> +			trips {
> +				crit0 {
> +					temperature = <125000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +	};

This is better done by having something like
arch/arm64/boot/dts/ti/k3-am62l-industrial-thermal.dtsi

[..]

> +
> +	sensor_3v3: regulator-4 {
> +		/* TPS22918DBVR */
> +		compatible = "regulator-fixed";
> +		regulator-name = "Sensor_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vdd_3v3>;
> +		regulator-boot-on;
> +		regulator-always-on;

Why sensor supply is always on?

> +		enable-active-high;
> +		gpio = <&wkup_gpio0 1 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sensor_3v3_ena_pins_default>;
> +		bootph-all;
> +	};
> +
> +	wlan_en: regulator-5 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "wlan_en";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		enable-active-high;
> +		gpios = <&gpio0 51 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wlan_en_pins_default>;
> +	};
> +};
> +

[..]

> +
> +	usr_button_pins_default: usr-button-default-pins {
> +		pinctrl-single,pins = <
> +			AM62LX_IOPAD(0x00a4, PIN_INPUT, 7) /* (H18) GPMC0_AD11.GPIO0_26 */
> +			AM62LX_IOPAD(0x01e4, PIN_INPUT, 7) /* (D16) EXT_REFCLK1.GPIO0_104 */
> +			AM62LX_IOPAD(0x00c0, PIN_INPUT, 7) /* (N19) GPMC0_ADVn_ALE.GPIO0_32 */
> +			AM62LX_IOPAD(0x00e8, PIN_INPUT, 7) /* (L19) GPMC0_CSn1.GPIO0_42 */
> +			AM62LX_IOPAD(0x00b8, PIN_INPUT, 7) /* (L21) GPMC0_CLK.GPIO0_31 */
> +			AM62LX_IOPAD(0x01c0, PIN_INPUT, 7) /* (B13) UART0_RTSn.GPIO0_95 */
> +		>;
> +	};

no wakeup from usr buttons?

[...]

> +};
> +
> +&gpio0 {
> +	gpio-line-names ="","","","","","","","","","",									/* 0-9 */

space after that =

> +			 "","","","","","BOOST_5V_ENA","VDD_3V3_SD_ENA","","","",					/* 10-19 */
> +			 "","","","","","MCP23S18_RESET","BTN_SELECT","","","",						/* 20-29 */
> +			 "","BTN_LEFT","BTN_UP","","LORA_RESET","","","","","",						/* 30-39 */
> +			 "FUEL_GAUGE_BATLOW","LORA_RFSW","BTN_DOWN","USB_HUB_RST","MIKROBUS_INT","","","","","",	/* 40-49 */
> +			 "","WLAN_EN","","","","","","","","",								/* 50-59 */
> +			 "","","","","","","","","","",									/* 60-69 */
> +			 "","","","","","","","","","",									/* 70-79 */
> +			 "","","","","MIKROBUS_RST","","","","LORA_BUSY","",						/* 80-89 */
> +			 "","","","","LORA_DIO","BTN_RIGHT","","","","",						/* 90-99 */
> +			 "","","","","BTN_BACK","","","","","",								/* 100-109 */
> +			 "","","","","","","","","","",									/* 110-119 */
> +			 "","","SD_CD","","","";									/* 120-125 */

Could you keep these under 100 chars?

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gpio0_pins_default>, <&usr_button_pins_default>, <&lora_control_pins_default>;
> +	bootph-all;
> +	status = "okay";
> +};
> +
> +&wkup_gpio0 {
> +	gpio-line-names ="","SENSOR_3V3_ENA","","","","","","";								/* 0-7 */

same

> +	bootph-all;
> +	status = "okay";
> +};
> +
> +&sdhci1 {
> +	/* SD/MMC */
> +	vmmc-supply = <&vdd_3v3_sd>;
> +	disable-wp;
> +	cd-gpios = <&gpio0 122 GPIO_ACTIVE_LOW>;
> +	cd-debounce-delay-ms = <100>;
> +	ti,fails-without-test-cd;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc1_pins_default>;
> +	bootph-all;
> +	status = "okay";
> +};
> +
> +&sdhci2 {
> +	vmmc-supply = <&wlan_en>;
> +	bus-width = <4>;
> +	non-removable;
> +	cap-power-off-card;
> +	keep-power-in-suspend;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc2_pins_default>;
> +	ti,driver-strength-ohm = <50>;
> +	ti,fails-without-test-cd;
> +	status = "okay";
> +};

Why not introduce the sdhci2 and supplies once we get wlan driver in
upstream?

[...]

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

