Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1143FFD9E34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 04:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gi184elZqoQJW7UFjyB6HIUKhK+pKEzfKPDadSfzV80=; b=vANGviNlerBLbDM3+/DHqKw7w9
	lIGz9zhI0MxhA/6TeOYcL0pS81x3kslSMppw13bs58+HeFb25ZLIQSrDposi9q/7bfx52W36O0LAn
	gaLt55xpMW+hAZcJ2wEJG5cUq7/NrmQacJMYBapMh1HbL3FjK1osLZ+MQUiMTMQVaxChGJ8IKPSdC
	7/o4T+2NXfBMo1s/9SiUUf7s5mvhRwxs+hRhbdO0jKyA2dp234SJk/b7PTh0flFkp8HE77OovcaBW
	/UuOJSh4I3GfulRVPyVltDHMe4G6f74T9bsprnWSCJl3UeOHZI0juhW4lZZtIfTsODOAX7JzIRUpa
	DwFRHTZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvpr9-00000007fc0-2tUE;
	Fri, 27 Feb 2026 04:53:39 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvpr6-00000007fbS-3Nre
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 04:53:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xx2KrvB/btlWUUGnBV9AVho47Id2yZ0hJj60YqJJC0Bip3tQnx5wxwDl4ZkkqmsAN64SGOoePAZDOOMjcZHPu+DOsDa1pG48H0L8mGG6hLmQZxkrtSc3f3AhKO3nAmxs2iHAe37kPfUYw93Cef/VBenUASHS9InpDZeAxJ9zGmiKYZnIZAXICGK/BOFvyw1EX4j9tvVkINkAWEu8nbBZ76k9WRSa2JqfC9xP88zxnRWH0Cc3TVA2zu5uQ6RkZHd1T7VFhL5xn1wphQF7eDINETfd/xHXRr52pNJDBHztw+Ek5FMtBCgnU2jyc4ZbiZ/l3LFEd/1PoCX0U0F1N/V/eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gi184elZqoQJW7UFjyB6HIUKhK+pKEzfKPDadSfzV80=;
 b=JTQLggxdGkfQmrHR1IgFLfF6Rjg7Cu9zgEM8dmB9oOoQQIu/17+bpSvhL2N+U85OhnO7edbUkQ75Nd0uS1V0kDEXob9KPMYDchHav2j/kwtyIDeSpM2uyTeGt4ePo/E/LChVatKebpGD11L3qrr/0SiLRr44W92aSAs5rErpC2ktqKtdfUfwZa+qGk2+fDS+j+KjDP93d8S4BaofabMj/Wk19ei/ibw+PmsaY/hKl6kxX0F+ToQKLbR4bM2gfbXtLkIx9X7FGlnDrWJbYB2YQwXVHi//srxPTlzeEZUkV6NkTGh1mgZGn9R+EjHEC+/K9/fBr5/JO0tpuXnBIlDEZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gi184elZqoQJW7UFjyB6HIUKhK+pKEzfKPDadSfzV80=;
 b=nFi4qwql1QQNONIZ4DUZdZdSLRCWs9ZCJ7DDxQr8ykNl8pyFH86hmezsIDPYPRNXdJfz+Fgid7YAByLTPi1OAsWNx5y/MFOw73XJNLK9+i6CNwcrNjVi+8DE4E2uUMrZtu/2KmS+6C/eGbrRHn+CY8NxJJSzZGx1Y2B5gAB1rDE=
Received: from BN9PR03CA0420.namprd03.prod.outlook.com (2603:10b6:408:111::35)
 by DS0PR10MB7400.namprd10.prod.outlook.com (2603:10b6:8:138::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 04:53:32 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:111:cafe::ad) by BN9PR03CA0420.outlook.office365.com
 (2603:10b6:408:111::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Fri,
 27 Feb 2026 04:53:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Fri, 27 Feb 2026 04:53:30 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 22:53:28 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 22:53:28 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Feb 2026 22:53:28 -0600
Received: from [172.24.231.152] (dhcp-172-24-231-152.dhcp.ti.com [172.24.231.152])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61R4rOl63600296;
	Thu, 26 Feb 2026 22:53:25 -0600
Message-ID: <0ec9de38-cf6f-4c27-86d7-13bc4656f558@ti.com>
Date: Fri, 27 Feb 2026 10:23:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am642-evm: Add ICSSG0 overlay for dual
 EMAC support
To: Meghana Malladi <m-malladi@ti.com>, <vigneshr@ti.com>, <nm@ti.com>
CC: <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
	<kristo@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srk@ti.com>, Roger Quadros <rogerq@kernel.org>
References: <20260226115454.1730618-1-m-malladi@ti.com>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <20260226115454.1730618-1-m-malladi@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|DS0PR10MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: 3611a0ce-d4f6-4847-a250-08de75bc2741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: neZ25b7Jj54dnf1UQqSYn3td8aTjkJRqI26mokXtjKetgOyqznzf49B6c/8Dl7yHH1jGgUdxE/ivZnA7MsjbU/YGOLZNU3o4i7kGpRsVSZIz8t2Q74CjvcHEbwljH0T/X8q0Ovaev5CzoEjEqoWDZKIRtUsGz1C80HnSYbdub+QEwF3XSnw+q68vSTp9XOm2O6EM+hjDAqMdB0l/0DXlhGTTrXbUFh2dajcr9nSt1uy/u9RQRTNB4yGzb2H9yXURkU9//xayFNyeXWyfLNDfOXnM5LuvXXRbRSQ0atH54rdvKJsghTkTQ2e2E9FF0EHu68WOX6t24nrKDJNgUARjcJ6YtaQNj9vKKd1qjdVwhf3UlrIt7l6FFpBL6ppaQKdhbTHJXEWlgGNwlHk2IyaZp8fSVlNcwfsypIIkXbAiXICw5V3/ICAumBVpmnyq27J+ldArnC+79t/HmtbnwwPJZlRch5nM1gMQx+rr1lceNEkTIlDWTYwYWuhjVz4YapG6f3l3GVi5HvV2o7wmb1u52SdqEiwR1Rv5vDCloQXVVpQGb55F6S92vCI5tLY+UHeSZmvqNUfKfsMdkXKWbe8B+S4VkKpGNEMOGql0soNGGdBKKBiwl7H1BBvPmFDsXEIb+saikC/09FqFUUDqU1BLGqOO6EpM6FdbEvcoyaY3SZiL6cFVAQcJtKSCB4r/WhPh/CBjZKsC4bLtJl0kYnE63MO/ZLRfII9IEtjGvdMi05wRJS/GZJ0Iu2/TIbAS7UHmE/WiYs4PXjn10LC0hXRhcmL9GY6AeCpGCKtJUsFs6Ws=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CCRzeBgZkTixzYlI6B6ISH92MR3/HlCdTBvnuSEhvGorl3cZwg9mprhYzk3jFjmqkukaCq3aXDxDs8RLWZ7FezXfVYo/y2oaTNaF3EVoeqZtZrZf3hrFZQKkDN1yS+PsdBuM4TYgM4ct1OlV9yhU6ebz4NbT+dklFR9Bw993ON5o9Q0jI3kGNUWQ6CHpRb5cP+L8k+Cv6/q33hZphYAMAufm5fQ+bQwF8lu7gLkPppe9EES+0qmS0n6E9cWX/0/qpWaXWUXpMsTGntdYCLOgTWrs9xa9OLaVsnSI9hZKjRnz7zcrQqLCDERhLUmGSTCdEKv+svG6xRheEnFVHXu5tsupXCkLIo+MAtLjEIWT3HmAEsvKJ/NoTtjOIHVG4SunNM+papsqfj/kIgSDPGlpPZTLpsTS7DsRyZXu2qUicS0sA04zUSOlhDG0AV0p4DCC
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 04:53:30.4972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3611a0ce-d4f6-4847-a250-08de75bc2741
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7400
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_205337_039915_7D95558C 
X-CRM114-Status: GOOD (  16.62  )
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

Hi Meghana,

On 26/02/26 5:24 pm, Meghana Malladi wrote:
> Add device tree overlay to enable ICSSG0 dual EMAC support on AM642 EVM.
> This overlay enables all four ICSSG Ethernet interfaces (ICSSG0 port0/1
> and ICSSG1 port0/1) in dual EMAC mode.

Why? Your subject says "Add ICSSG0" but the overlay is adding both
ICSSG0 and ICSSG1. AFAIK, overlay k3-am642-evm-icssg1-dualemac.dtbo
already enables ICSSG1 so why is this overlay again enabling the same?

> 
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
> ---
>  arch/arm64/boot/dts/ti/Makefile               |   4 +
>  .../boot/dts/ti/k3-am642-evm-icssg0-exp.dtso  | 265 ++++++++++++++++++
>  2 files changed, 269 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am642-evm-icssg0-exp.dtso
> 
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index ba01a929e06f..458b9d523069 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -62,6 +62,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-hdmi-audio.dtbo
>  
>  # Boards with AM64x SoC
>  dtb-$(CONFIG_ARCH_K3) += k3-am642-evm.dtb
> +dtb-$(CONFIG_ARCH_K3) += k3-am642-evm-icssg0-exp.dtbo
>  dtb-$(CONFIG_ARCH_K3) += k3-am642-evm-icssg1-dualemac.dtbo
>  dtb-$(CONFIG_ARCH_K3) += k3-am642-evm-icssg1-dualemac-mii.dtbo
>  dtb-$(CONFIG_ARCH_K3) += k3-am642-evm-pcie0-ep.dtbo
> @@ -218,6 +219,8 @@ k3-am62p5-sk-csi2-ov5640-dtbs := k3-am62p5-sk.dtb \
>  	k3-am62x-sk-csi2-ov5640.dtbo
>  k3-am62p5-sk-csi2-tevi-ov5640-dtbs := k3-am62p5-sk.dtb \
>  	k3-am62x-sk-csi2-tevi-ov5640.dtbo
> +k3-am642-evm-icssg0-exp-dtbs := \
> +	k3-am642-evm.dtb k3-am642-evm-icssg0-exp.dtbo

Why have you named the overlay icssg0-exp ? What does exp mean here?
More suitable name would be `k3-am642-evm-icssg0.dtbo`

>  k3-am642-evm-icssg1-dualemac-dtbs := \
>  	k3-am642-evm.dtb k3-am642-evm-icssg1-dualemac.dtbo
>  k3-am642-evm-icssg1-dualemac-mii-dtbs := \
> @@ -306,6 +309,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
>  	k3-am62p5-sk-csi2-imx219.dtb \
>  	k3-am62p5-sk-csi2-ov5640.dtb \
>  	k3-am62p5-sk-csi2-tevi-ov5640.dtb \
> +	k3-am642-evm-icssg0-exp.dtb \
>  	k3-am642-evm-icssg1-dualemac.dtb \
>  	k3-am642-evm-icssg1-dualemac-mii.dtb \
>  	k3-am642-evm-pcie0-ep.dtb \
> diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm-icssg0-exp.dtso b/arch/arm64/boot/dts/ti/k3-am642-evm-icssg0-exp.dtso
> new file mode 100644
> index 000000000000..5a8462245704
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am642-evm-icssg0-exp.dtso
> @@ -0,0 +1,265 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/**
> + * DT overlay for enabling ICSSG0 dual EMAC on AM642 EVM with
> + * DP83TG720-IND-SPE-EVM daughter card
> + *
> + * AM642 EVM Product link: https://www.ti.com/tool/TMDS64EVM
> + * DP83TG720 daughter card link: https://www.ti.com/tool/DP83TG720-IND-SPE-EVM
> + *
> + * Copyright (C) 2020-2024 Texas Instruments Incorporated - https://www.ti.com/
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include "k3-pinctrl.h"
> +
> +&{/aliases} {
> +	ethernet0 = &icssg0_emac0;
> +	ethernet1 = &icssg0_emac1;
> +	ethernet2 = "/icssg1-eth/ethernet-ports/port@0";
> +	ethernet3 = "/icssg1-eth/ethernet-ports/port@1";
> +};
> +
> +&{/} {
> +	mdio-mux-2 {
> +		compatible = "mdio-mux-multiplexer";
> +		mux-controls = <&mdio_mux>;
> +		mdio-parent-bus = <&icssg1_mdio>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		mdio@0 {
> +			reg = <0x0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			icssg1_phy2: ethernet-phy@3 {
> +				reg = <3>;
> +				tx-internal-delay-ps = <250>;
> +				rx-internal-delay-ps = <2000>;
> +			};
> +		};
> +	};
> +
> +	icssg0_eth: icssg0-eth {
> +		compatible = "ti,am642-icssg-prueth";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pru_icssg0_rgmii1_pins_default>, <&pru_icssg0_rgmii2_pins_default>;
> +
> +		sram = <&oc_sram>;
> +		ti,prus = <&pru0_0>, <&rtu0_0>, <&tx_pru0_0>, <&pru0_1>, <&rtu0_1>, <&tx_pru0_1>;
> +		firmware-name = "ti-pruss/am64x-sr2-pru0-prueth-fw.elf",
> +				"ti-pruss/am64x-sr2-rtu0-prueth-fw.elf",
> +				"ti-pruss/am64x-sr2-txpru0-prueth-fw.elf",
> +				"ti-pruss/am64x-sr2-pru1-prueth-fw.elf",
> +				"ti-pruss/am64x-sr2-rtu1-prueth-fw.elf",
> +				"ti-pruss/am64x-sr2-txpru1-prueth-fw.elf";
> +
> +		ti,pruss-gp-mux-sel = <2>,	/* MII mode */
> +				      <2>,
> +				      <2>,
> +				      <2>,	/* MII mode */
> +				      <2>,
> +				      <2>;
> +
> +		ti,mii-g-rt = <&icssg0_mii_g_rt>;
> +		ti,mii-rt = <&icssg0_mii_rt>;
> +		ti,pa-stats = <&icssg0_pa_stats>;
> +		ti,iep = <&icssg0_iep0>,  <&icssg0_iep1>;
> +
> +		interrupt-parent = <&icssg0_intc>;
> +		interrupts = <24 0 2>, <25 1 3>;
> +		interrupt-names = "tx_ts0", "tx_ts1";
> +
> +		dmas = <&main_pktdma 0xc100 0>, /* egress slice 0 */
> +		       <&main_pktdma 0xc101 0>, /* egress slice 0 */
> +		       <&main_pktdma 0xc102 0>, /* egress slice 0 */
> +		       <&main_pktdma 0xc103 0>, /* egress slice 0 */
> +		       <&main_pktdma 0xc104 0>, /* egress slice 1 */
> +		       <&main_pktdma 0xc105 0>, /* egress slice 1 */
> +		       <&main_pktdma 0xc106 0>, /* egress slice 1 */
> +		       <&main_pktdma 0xc107 0>, /* egress slice 1 */
> +		       <&main_pktdma 0x4100 0>, /* ingress slice 0 */
> +		       <&main_pktdma 0x4101 0>, /* ingress slice 1 */
> +		       <&main_pktdma 0x4102 0>, /* mgmnt rsp slice 0 */
> +		       <&main_pktdma 0x4103 0>; /* mgmnt rsp slice 1 */
> +		dma-names = "tx0-0", "tx0-1", "tx0-2", "tx0-3",
> +			    "tx1-0", "tx1-1", "tx1-2", "tx1-3",
> +			    "rx0", "rx1",
> +			    "rxmgm0", "rxmgm1";
> +
> +		ethernet-ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			icssg0_emac0: port@0 {
> +				reg = <0>;
> +				phy-handle = <&icssg0_phy00>;
> +				phy-mode = "rgmii-id";
> +				syscon-rgmii-delay = <&main_conf 0x4100>;
> +				/* Filled in by bootloader */
> +				local-mac-address = [00 00 00 00 00 00];
> +			};
> +
> +			icssg0_emac1: port@1 {
> +				reg = <1>;
> +				phy-handle = <&icssg0_phy01>;
> +				phy-mode = "rgmii-id";
> +				syscon-rgmii-delay = <&main_conf 0x4104>;
> +				/* Filled in by bootloader */
> +				local-mac-address = [00 00 00 00 00 00];
> +			};
> +		};
> +	};
> +};
> +
> +&main_pmx0 {
> +	pru_icssg0_mdio_pins_default: pru-icssg0-mdio-pins-default {
> +		pinctrl-single,pins = <
> +			/* (P3) PRG0_MDIO0_MDC */
> +			AM64X_IOPAD(0x0204, PIN_OUTPUT, 0)
> +			/* (P2) PRG0_MDIO0_MDIO */
> +			AM64X_IOPAD(0x0200, PIN_INPUT, 0)
> +			/* (P16) GPIO0_32 - GPMC0_ADVn_ALE - GPIO_ETH0/1_RESETn# */
> +			AM64X_IOPAD(0x0084, PIN_OUTPUT, 7)
> +		>;
> +	};
> +
> +	pru_icssg0_rgmii1_pins_default: pru-icssg0-rgmii1-pins-default {
> +		pinctrl-single,pins = <
> +			/* (module-sitara) */
> +			/* (a14-y1) PRG0_PRU0_GPO0.PRG0_RGMII1_RD0 */
> +			AM64X_IOPAD(0x0160, PIN_INPUT, 2)
> +			/* (b14-r4) PRG0_PRU0_GPO1.PRG0_RGMII1_RD1 */
> +			AM64X_IOPAD(0x0164, PIN_INPUT, 2)
> +			/* (d14-u2) PRG0_PRU0_GPO2.PRG0_RGMII1_RD2 */
> +			AM64X_IOPAD(0x0168, PIN_INPUT, 2)
> +			/* (e14-v2) PRG0_PRU0_GPO3.PRG0_RGMII1_RD3 */
> +			AM64X_IOPAD(0x016c, PIN_INPUT, 2)
> +			/* (e13-t3) PRG0_PRU0_GPO6.PRG0_RGMII1_RXC */
> +			AM64X_IOPAD(0x0178, PIN_INPUT, 2)
> +			/* (b13-aa2) PRG0_PRU0_GPO4.PRG0_RGMII1_RX_CTL */
> +			AM64X_IOPAD(0x0170, PIN_INPUT, 2)
> +
> +			/* (a11-y3) PRG0_PRU0_GPO11.PRG0_RGMII1_TD0 */
> +			AM64X_IOPAD(0x018c, PIN_OUTPUT, 2)
> +			/* (c11-aa3) PRG0_PRU0_GPO12.PRG0_RGMII1_TD1 */
> +			AM64X_IOPAD(0x0190, PIN_OUTPUT, 2)
> +			/* (d11-r6) PRG0_PRU0_GPO13.PRG0_RGMII1_TD2 */
> +			AM64X_IOPAD(0x0194, PIN_OUTPUT, 2)
> +			/* (b10-v4) PRG0_PRU0_GPO14.PRG0_RGMII1_TD3 */
> +			AM64X_IOPAD(0x0198, PIN_OUTPUT, 2)
> +			/* (e10-u4) PRG0_PRU0_GPO16.PRG0_RGMII1_TXC */
> +			AM64X_IOPAD(0x01a0, PIN_OUTPUT, 2)
> +			/* (c10-t5) PRG0_PRU0_GPO15.PRG0_RGMII1_TX_CTL */
> +			AM64X_IOPAD(0x019c, PIN_OUTPUT, 2)
> +		>;
> +	};
> +
> +	pru_icssg0_rgmii2_pins_default: pru-icssg0-rgmii2-pins-default {
> +		pinctrl-single,pins = <
> +			/* (e9-y2) PRG0_PRU1_GPO0.PRG0_RGMII2_RD0 */
> +			AM64X_IOPAD(0x01b0, PIN_INPUT, 2)
> +			/* (a8-w2) PRG0_PRU1_GPO1.PRG0_RGMII2_RD1 */
> +			AM64X_IOPAD(0x01b4, PIN_INPUT, 2)
> +			/* (c8-v3) PRG0_PRU1_GPO2.PRG0_RGMII2_RD2 */
> +			AM64X_IOPAD(0x01b8, PIN_INPUT, 2)
> +			/* (d8-t4) PRG0_PRU1_GPO3.PRG0_RGMII2_RD3 */
> +			AM64X_IOPAD(0x01bc, PIN_INPUT, 2)
> +			/* (e7-r5) PRG0_PRU1_GPO6.PRG0_RGMII2_RXC */
> +			AM64X_IOPAD(0x01c8, PIN_INPUT, 2)
> +			/* (b7-w3) PRG0_PRU1_GPO4.PRG0_RGMII2_RX_CTL */
> +			AM64X_IOPAD(0x01c0, PIN_INPUT, 2)
> +
> +			/* (a5-w4) PRG0_PRU1_GPO11.PRG0_RGMII2_TD0 */
> +			AM64X_IOPAD(0x01dc, PIN_OUTPUT, 2)
> +			/* (c5-y4) PRG0_PRU1_GPO12.PRG0_RGMII2_TD1 */
> +			AM64X_IOPAD(0x01e0, PIN_OUTPUT, 2)
> +			/* (d5-t6) PRG0_PRU1_GPO13.PRG0_RGMII2_TD2 */
> +			AM64X_IOPAD(0x01e4, PIN_OUTPUT, 2)
> +			/* (b4-u6) PRG0_PRU1_GPO14.PRG0_RGMII2_TD3 */
> +			AM64X_IOPAD(0x01e8, PIN_OUTPUT, 2)
> +			/* (a3-aa4) PRG0_PRU1_GPO16.PRG0_RGMII2_TXC */
> +			AM64X_IOPAD(0x01f0, PIN_OUTPUT, 2)
> +			/* (c4-u5) PRG0_PRU1_GPO15.PRG0_RGMII2_TX_CTL */
> +			AM64X_IOPAD(0x01ec, PIN_OUTPUT, 2)
> +		>;
> +	};
> +
> +	icssg1_rgmii2_pins_default: icssg1-rgmii2-default-pins {
> +		pinctrl-single,pins = <
> +			AM64X_IOPAD(0x0108, PIN_INPUT, 2) /* (W11) PRG1_PRU1_GPO0.RGMII2_RD0 */
> +			AM64X_IOPAD(0x010c, PIN_INPUT, 2) /* (V11) PRG1_PRU1_GPO1.RGMII2_RD1 */
> +			AM64X_IOPAD(0x0110, PIN_INPUT, 2) /* (AA12) PRG1_PRU1_GPO2.RGMII2_RD2 */
> +			AM64X_IOPAD(0x0114, PIN_INPUT, 2) /* (Y12) PRG1_PRU1_GPO3.RGMII2_RD3 */
> +			AM64X_IOPAD(0x0120, PIN_INPUT, 2) /* (U11) PRG1_PRU1_GPO6.RGMII2_RXC */
> +			AM64X_IOPAD(0x0118, PIN_INPUT, 2) /* (W12) PRG1_PRU1_GPO4.RGMII2_RX_CTL */
> +			AM64X_IOPAD(0x0134, PIN_OUTPUT, 2) /* (AA10) PRG1_PRU1_GPO11.RGMII2_TD0 */
> +			AM64X_IOPAD(0x0138, PIN_OUTPUT, 2) /* (V10) PRG1_PRU1_GPO12.RGMII2_TD1 */
> +			AM64X_IOPAD(0x013c, PIN_OUTPUT, 2) /* (U10) PRG1_PRU1_GPO13.RGMII2_TD2 */
> +			AM64X_IOPAD(0x0140, PIN_OUTPUT, 2) /* (AA11) PRG1_PRU1_GPO14.RGMII2_TD3 */
> +			AM64X_IOPAD(0x0148, PIN_OUTPUT, 2) /* (Y10) PRG1_PRU1_GPO16.RGMII2_TXC */
> +			AM64X_IOPAD(0x0144, PIN_OUTPUT, 2) /* (Y11) PRG1_PRU1_GPO15.RGMII2_TX_CTL */
> +		>;
> +	};
> +
> +	icssg0_iep0_pins_default: icssg0-iep0-pins-default {
> +		pinctrl-single,pins = <
> +			AM64X_IOPAD(0x01ac, PIN_OUTPUT, 2) /* (W1) PRG0_PRU0_GPO19.PRG0_IEP0_EDC_SYNC_OUT0 */
> +		>;
> +	};
> +};
> +
> +&cpsw3g {
> +	pinctrl-0 = <&rgmii1_pins_default>;
> +};
> +
> +&cpsw_port2 {
> +	status = "disabled";
> +};


Why are you disabling cpsw_port2? AFAIK they are not related to ICSSG0.

> +
> +&mdio_mux_1 {
> +	status = "disabled";
> +};
> +
> +&icssg0_mdio {
> +	pinctrl-names = "default";
> +	status = "okay";
> +	pinctrl-0 = <&pru_icssg0_mdio_pins_default>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	icssg0_phy00: ethernet-phy@0 {
> +		reg = <0x0>;
> +	};
> +
> +	icssg0_phy01: ethernet-phy@1 {
> +		reg = <0xA>;
> +	};
> +};
> +
> +&icssg0_iep0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&icssg0_iep0_pins_default>;
> +};
> +
> +&icssg1_eth {
> +	pinctrl-0 = <&icssg1_rgmii1_pins_default>, <&icssg1_rgmii2_pins_default>;
> +};
> +
> +&icssg1_emac1 {
> +	status = "okay";
> +	phy-handle = <&icssg1_phy2>;
> +	phy-mode = "rgmii-id";
> +};

Again this is already taken care in `k3-am642-evm-icssg1-dualemac.dtso`

Your this patch should only enable ICSSG0. If someone needs to enable
both ICSSG0 and ICSSG1 they can apply both of the below overlays.

- k3-am642-evm-icssg1-dualemac.dtbo
- k3-am642-evm-icssg0.dtbo

> +
> +&main_gpio0 {
> +	phy-line-hog {
> +		gpio-hog;
> +		gpios = <32 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "phy-hog-line";
> +	};
> +};
> 
> base-commit: 4916f2e2f3fc9aef289fcd07949301e5c29094c2

-- 
Thanks and Regards,
Danish


