Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AA4CD6E74
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 07:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONt0+xv4q9nreWmNOldmDPow1Qe2VMIgXwFfXgu/2es=; b=SI+K4S3nuZiK264t0d5YJZjEmv
	3Msi8dZkp4miEqVdO/wWhVcF68J40NfeyeBC1Fs5FDiHUEuYsQ6TQGRsQkAgmjOqtPQXyqeMI76yo
	A3plZcRVarx5ZneA3jMia8O1hR35Sh1YUxnJeIhMigviGUd2Yn6yDr7Y1u4lw1JELTkxeuZahBcnd
	a781mlpPWE0aMgcsTk5wnQbjikyBMMgcWsVGes49Hsw/Mq1Vd/yJ8Z479qudriPFf0sy7yxjuZrhm
	onpnAv5pOCgKn7c/PjXHeyp+AzcnWCz7Vb49B5Mwr4XvEgcGZoOqksE1j0gQ8rBwgaOnkrLOBQE+u
	MoHHHp1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPPe-00000000GV0-3smV;
	Fri, 05 Jun 2026 07:56:18 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPPc-00000000GUI-0Clw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 07:56:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QK382C3hSdOX3ONgn3RxdaITG8oTIRWQ0gc07/5Ku0DfIXcmXV5UqhAvtQsTXGOKXSL5YtQ0uV2cHEEOBEDG2LstgX2plydWUe9/G++UFp7tCeDdqSYm4sxIskLIgnqiHj6jUz6OjWZd8sCyekt6+x0hvt70BH7umNR48hZ63zlrhxYqURkr47BvulPxe93SWjX3nFiv7h9Bj3tOSu5N2A5X7XzzXtbWvtY7zzEhpY41q+vK6vZAguRvbtD09kes8s7vN8urJs35/AaUsyWK/yIaVewW7iJq7cCnAOjAflL7IOzkT/J1TBeRl71vLc4+vnO41ILzM5Mm9JrtoACkwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONt0+xv4q9nreWmNOldmDPow1Qe2VMIgXwFfXgu/2es=;
 b=q5kCDF09S+Y+LctVpQgjhsgN8ozK2Mv+rkt5A0y1d+zQeSjHk8TMxdaeagb5mmDw7cuD3SBgaZtFxfSQPEEkoirwD+ZeSptp9CNxMbmd6cMv3vrLqOUZsALP/l036TOLpscyx15he9AQsM5g/FTUMJwzZpv+g4IbRnW0enGmSyermXR8IpAWj0CaeGUOFz4x8WblXNbMGnAz/bq+RTUUu3QF3r2Wx1Bt+cZRXXPfmuoNXVTd437N8y1dEOHssOwRAI+CNTVYbX1J7bnJEwkLVhz9LZxXDNEielQaPO96a81gQPyusK7eDLZb05fcKV9wH2azruQHhpVt41/9D1oTDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONt0+xv4q9nreWmNOldmDPow1Qe2VMIgXwFfXgu/2es=;
 b=WG4EZrAs3S+7dOKfwBE7BZXh4rl2V0L/xYluEtAXd6pkKG4oK+zyXe0R8lebBu20NohdumMGF95ItkxZKaxhZbOtwkfu58my5UHwAW9HijBKJlT74jiIDXxh9PtziyVNWlibMsHweENbKhEGIk/YFE7cVEJ/TlTu3P421gAaek/VmWcEoeSK5JkS/xmKbz6l/9mTzLIAd6uDcZHoYixWm0SqY094zfD6r9M/QTZL7MpZMu9io0IJOxGtEYWkeQYQiFzuLbgactZrzScoR0rYNPW9+iR6hap5x4JPIx7tIEYTQ2WMNUvtmDxiA6KCgh9p6XKGZMbklMrLrg4Zx0zdCQ==
Received: from DB9PR06CA0025.eurprd06.prod.outlook.com (2603:10a6:10:1db::30)
 by PAVPR10MB6789.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2fc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 07:56:07 +0000
Received: from DU6PEPF00009529.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::83) by DB9PR06CA0025.outlook.office365.com
 (2603:10a6:10:1db::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Fri, 5
 Jun 2026 07:56:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF00009529.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 5 Jun 2026 07:56:07 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 5 Jun
 2026 09:59:15 +0200
Received: from [10.48.87.71] (10.48.87.71) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 5 Jun
 2026 09:55:29 +0200
Message-ID: <08a2e8ec-9dd4-4530-be04-f06b7c1137fa@foss.st.com>
Date: Fri, 5 Jun 2026 09:55:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH v3 13/14] arm64: dts: st: support Engicam
 MicroGEA-STM32MP257-RMM board
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	<linux-kernel@vger.kernel.org>
CC: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <francesco.utel@engicam.com>,
	<domenico.acri@engicam.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, <michael@amarulasolutions.com>,
	<linux-amarula@amarulasolutions.com>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
 <20260605062900.368376-14-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20260605062900.368376-14-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.71]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009529:EE_|PAVPR10MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: 87ad815e-4954-4f6c-ba4e-08dec2d7e6a6
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|7416014|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 2nxnVF/mPDX0HlYd+XBzW1+IH+23On1lfI7s+nd/dBAOJpuN8yZ/PBoR44liWl8cR9JS1mYJbmKuJ4B165I0veChm6X9K+Yjz1CMZgm0RfLkO/KeJI6RWWJoiT7XN2JjRxF2Tbjof5bLLKXf4bs/8fD3YnKUq57naKVG3wz7AVAnrPwXUwvBf1+a4uf4/BgxctQspO4rUIE+L8wrFFvQEmQDdn9Hvx+ewrgAjdOdzceBJW8zRIkQgXTfPcNQ+MX97oBXu9bV/MC72j2elYQltiXZhdY60OXINihApoSmdz+mfdiXDrpQ9QtZYmxshE3QLqZ1ryayF1I5K//IILTbKk3FxuroBCbr9QYZlsSYh7whUuteKi9JKl5CgXTDp51bLaUn1mTV7zhtFU789inh59jTDGH8JeFNZA0KQICo5Zj0cbQh7TNCqAyEMNQ+TZ1Kj58Nj/End7z7jTobC4IyqAlcDeKlY03c1vYF4xY4qE0wIH0QfrprCCTc49uAKKfqpkH6zs0wcDM4aQpUojNCstOSjOFERq2bRApE42j84pHX4yaf8/Cz1OAyxpuTzHx1SAqdBMRSLX5R+4mP1ecSCj2cbZBp1W7/kenOv41iI6LOQfNe6XvwLQ+9ub3HGU0pMII30Yt6v0CuRg9SuF6hAafySVMMZcgkRxWDZrSPiAKj+YW+emGa+RlIFOXf10Im/zzbkb9/7nh2sxBe2CXrxSmNRXKJ+UQmwb4Uiirrdpo=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(7416014)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vE2zDxgqOqN/drdkOVyStuVflrY2shxmnT800XghACN4xBOjPtjXYESjSn6ogaqzMGYs2GG/1+dFwJ3qBbt2PSIRD+AFvJ48fijT10TMrncF0Rj+RWIYEpkTCtSda9tpgzN/6awX65OJGyc1q+1ecFw9jgkYsYHc3fdUpK1WTljvsCXJnyKFBU57iRL6Tuw/8bmtYRDTi3X3M49J84gPH3M4jlZpmUmJ3DXHbT36tdp2HFPnRstYmhIufndmGwWsKqbh6IJEmyat7uhF+RFW1zSy0wGX2p1AGEWh0+a0GKBi5mjuOezBEiPoLGE9v++UQGOkIQQQhxcDFNnL08CFnDCXlUXqUjhEQlv+JkJqdXhXyO0HUUJyo7pk8B60mL0rMHVxRvsNMp1lMfJt7BlBwcgVt9H5Z6Wp7/0L2fRq15aTIZoZ1rTM/goUzWwUG3RH
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 07:56:07.5517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ad815e-4954-4f6c-ba4e-08dec2d7e6a6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB6789
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_005616_470745_7527913F 
X-CRM114-Status: GOOD (  18.92  )
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

Hi Dario,

On 6/5/26 08:27, Dario Binacchi wrote:
> Support for Engicam MicroGEA-STM32MP257-RMM board with:
> 
>   - 8 GB eMMC Flash
>   - 2 GB LPDDR4 DRAM
>   - CAN
>   - LEDs
>   - LCD panel with touchscreen
>   - Micro SD card connector
>   - Audio codec
>   - Buzzer
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - Drop the clocks property from the sai1 node in stm32mp257-engicam-microgea-rmm.dts
>    to avoid overriding the peripheral bus clock reference defined in the base
>    SoC device tree. Suggested by Sashiko.
> - Reference the existing labeled nodes directly at the root level using
>    &sai1a and &sai1b in stm32mp257-engicam-microgea-rmm.dts instead of
>    redefining the entire node structure and redeclaring the labels. Suggested by Sashiko.
> - Drop the #clock-cells property from sai1a and remove the reference to sai1a from
>    the clocks array in sai1b, relying strictly on the st,sync property to handle
>    internal synchronization.
> 
>   arch/arm64/boot/dts/st/Makefile               |   1 +
>   .../st/stm32mp257-engicam-microgea-rmm.dts    | 319 ++++++++++++++++++
>   2 files changed, 320 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts
> 
> diff --git a/arch/arm64/boot/dts/st/Makefile b/arch/arm64/boot/dts/st/Makefile
> index 63908113ae36..386eca593c54 100644
> --- a/arch/arm64/boot/dts/st/Makefile
> +++ b/arch/arm64/boot/dts/st/Makefile
> @@ -2,5 +2,6 @@
>   dtb-$(CONFIG_ARCH_STM32) += \
>   	stm32mp215f-dk.dtb \
>   	stm32mp235f-dk.dtb \
> +	stm32mp257-engicam-microgea-rmm.dtb \
>   	stm32mp257f-dk.dtb \
>   	stm32mp257f-ev1.dtb
> diff --git a/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts
> new file mode 100644
> index 000000000000..0212c03aae1a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts
> @@ -0,0 +1,319 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
> + * Copyright (C) 2026 Engicam srl
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +
> +#include "stm32mp257-engicam-microgea.dtsi"
> +
> +/ {
> +	model = "Engicam MicroGEA STM32MP257D RMM Board";

If the SoC is an STM32MP257D, as mentionned in the board model, 
stm32mp25xf.dtsi should not be included in 
stm32mp257-engicam-microgea.dtsi (in PATCH 12).
Unless the SoM can be fitted with any STM32MP257, in which case, when 
stm32mp25xf.dtsi is populated, you will need to add /delete-node/ 
statements on the board side, to remove the HW crypto support.

Regards,
Amelie

> +	compatible = "engicam,microgea-stm32mp257-rmm",
> +		     "engicam,microgea-stm32mp257", "st,stm32mp257";
> +
> +	aliases {
> +		mmc0 = &sdmmc1;
> +		mmc1 = &sdmmc2;
> +		serial0 = &usart2;
> +		serial1 = &usart1;
> +	};
> +
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		brightness-levels = <0 100>;
> +		num-interpolated-steps = <100>;
> +		default-brightness-level = <85>;
> +		pwms = <&pwm2 0 100000 0>;
> +	};
> +
> +	buzzer {
> +		compatible = "pwm-beeper";
> +		pwms = <&pwm4 0 1000000 0>;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		framebuffer {
> +			compatible = "simple-framebuffer";
> +			clocks = <&rcc CK_BUS_LTDC>, <&rcc CK_KER_LTDC>;
> +			lcd-supply = <&reg_3v3>;
> +			status = "disabled";
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			gpios = <&gpioh 2 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +			status = "okay";
> +		};
> +
> +		led-1 {
> +			gpios = <&gpioh 6 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +			status = "okay";
> +		};
> +	};
> +
> +	mclk: clock-mclk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +	};
> +
> +	reg_1v8: regulator-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1v8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	reg_3v3: regulator-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	reg_ext_pwr: regulator-ext-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "ext-pwr";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpiog 0 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	sound {
> +		compatible = "audio-graph-card";
> +		label = "STM32MP25-RMM";
> +		widgets = "Headphone", "Headphone Jack",
> +			  "Microphone", "Microphone Jack";
> +		routing = "Headphone Jack", "HP_OUT",
> +			  "MIC_IN", "Microphone Jack",
> +			  "Microphone Jack", "Mic Bias";
> +		dais = <&sai1a_port &sai1b_port>;
> +		status = "okay";
> +	};
> +};
> +
> +&arm_wdt {
> +	timeout-sec = <32>;
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&i2c1_pins_a>;
> +	pinctrl-1 = <&i2c1_sleep_pins_a>;
> +	i2c-scl-rising-time-ns = <185>;
> +	i2c-scl-falling-time-ns = <20>;
> +	status = "okay";
> +	/* spare dmas for other usage */
> +	/delete-property/dmas;
> +	/delete-property/dma-names;
> +
> +	touchscreen@38 {
> +		compatible = "edt,edt-ft5306";
> +		reg = <0x38>;
> +		interrupt-parent = <&gpiob>;
> +		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpiod 1 GPIO_ACTIVE_LOW>;
> +		touchscreen-size-x = <1280>;
> +		touchscreen-size-y = <800>;
> +	};
> +};
> +
> +&i2c2 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&i2c2_pins_a>;
> +	pinctrl-1 = <&i2c2_sleep_pins_a>;
> +	i2c-scl-rising-time-ns = <185>;
> +	i2c-scl-falling-time-ns = <20>;
> +	status = "okay";
> +	/* spare dmas for other usage */
> +	/delete-property/dmas;
> +	/delete-property/dma-names;
> +
> +	sgtl5000: codec@a {
> +		compatible = "fsl,sgtl5000";
> +		reg = <0x0a>;
> +		#sound-dai-cells = <0>;
> +		clocks = <&mclk>;
> +
> +		VDDA-supply = <&reg_3v3>;
> +		VDDIO-supply = <&reg_3v3>;
> +		VDDD-supply = <&reg_1v8>;
> +
> +		sgtl5000_port: port {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			sgtl5000_tx_endpoint: endpoint@0 {
> +				reg = <0>;
> +				remote-endpoint = <&sai1a_endpoint>;
> +				frame-master = <&sgtl5000_tx_endpoint>;
> +				bitclock-master = <&sgtl5000_tx_endpoint>;
> +			};
> +
> +			sgtl5000_rx_endpoint: endpoint@1 {
> +				reg = <1>;
> +				remote-endpoint = <&sai1b_endpoint>;
> +				frame-master = <&sgtl5000_rx_endpoint>;
> +				bitclock-master = <&sgtl5000_rx_endpoint>;
> +			};
> +		};
> +	};
> +};
> +
> +&ltdc {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&ltdc_pins_a>;
> +	pinctrl-1 = <&ltdc_sleep_pins_a>;
> +	status = "okay";
> +
> +	port {
> +		ltdc_out: endpoint {
> +			remote-endpoint = <&panel_in>;
> +		};
> +	};
> +};
> +
> +&m_can1 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&m_can1_pins_a>;
> +	pinctrl-1 = <&m_can1_sleep_pins_a>;
> +	status = "okay";
> +};
> +
> +&sai1 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sai1a_pins_a>, <&sai1b_pins_a>;
> +	pinctrl-1 = <&sai1a_sleep_pins_a>, <&sai1b_sleep_pins_a>;
> +	status = "okay";
> +};
> +
> +&sai1a {
> +	dma-names = "tx";
> +	status = "okay";
> +
> +	sai1a_port: port {
> +		sai1a_endpoint: endpoint {
> +			remote-endpoint = <&sgtl5000_tx_endpoint>;
> +			dai-format = "i2s";
> +			mclk-fs = <512>;
> +		};
> +	};
> +};
> +
> +&sai1b {
> +	dma-names = "rx";
> +	st,sync = <&sai1a 2>;
> +	clocks = <&rcc CK_KER_SAI1>;
> +	clock-names = "sai_ck";
> +	status = "okay";
> +
> +	sai1b_port: port {
> +		sai1b_endpoint: endpoint {
> +			remote-endpoint = <&sgtl5000_rx_endpoint>;
> +			dai-format = "i2s";
> +			mclk-fs = <512>;
> +		};
> +	};
> +};
> +
> +/* MicroSD */
> +&sdmmc1 {
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc1_b4_pins_a>;
> +	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
> +	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
> +	broken-cd;
> +	disable-wp;
> +	st,neg-edge;
> +	bus-width = <4>;
> +	vmmc-supply = <&scmi_v3v3>;
> +	vqmmc-supply = <&scmi_vddio1>;
> +	no-1-8-v;
> +	status = "okay";
> +};
> +
> +&spi1 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&spi1_pins_a>;
> +	pinctrl-1 = <&spi1_sleep_pins_a>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	cs-gpios = <&gpioh 8 GPIO_ACTIVE_HIGH>, <&gpioh 3 GPIO_ACTIVE_HIGH>;
> +	status = "okay";
> +
> +	display: display@0 {
> +		compatible = "rocktech,rk050hr345-ct106a", "ilitek,ili9806e";
> +		reg = <0>;
> +		vdd-supply = <&reg_3v3>;
> +		spi-max-frequency = <10000000>;
> +		reset-gpios = <&gpiob 6 GPIO_ACTIVE_LOW>;
> +		backlight = <&backlight>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&ltdc_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&timers2 {
> +	status = "okay";
> +
> +	pwm2: pwm {
> +		pinctrl-0 = <&pwm2_pins_a>;
> +		pinctrl-1 = <&pwm2_sleep_pins_a>;
> +		pinctrl-names = "default", "sleep";
> +		status = "okay";
> +	};
> +};
> +
> +&timers4 {
> +	status = "okay";
> +
> +	pwm4: pwm {
> +		pinctrl-names = "default", "sleep";
> +		pinctrl-0 = <&pwm4_pins_a>;
> +		pinctrl-1 = <&pwm4_sleep_pins_a>;
> +		status = "okay";
> +	};
> +};
> +
> +&usart1 {
> +	pinctrl-names = "default", "idle", "sleep";
> +	pinctrl-0 = <&usart1_pins_b>;
> +	pinctrl-1 = <&usart1_idle_pins_b>;
> +	pinctrl-2 = <&usart1_sleep_pins_b>;
> +	/delete-property/ dmas;
> +	/delete-property/ dma-names;
> +	status = "okay";
> +};
> +
> +&usart2 {
> +	pinctrl-names = "default", "idle", "sleep";
> +	pinctrl-0 = <&usart2_pins_a>;
> +	pinctrl-1 = <&usart2_idle_pins_a>;
> +	pinctrl-2 = <&usart2_sleep_pins_a>;
> +	/delete-property/ dmas;
> +	/delete-property/ dma-names;
> +	status = "okay";
> +};


