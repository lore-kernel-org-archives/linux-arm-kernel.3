Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855FCFD9E3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 05:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06B7Y9sKqbsYKpqCa1ra34NutBzslFfMUNSW2Fh42P8=; b=vhB4WL0AYmubdM1XpgwU+befE2
	vbwxfbeqktLi3fzrx/xbwqknancHjvKzh/mKFf5hN+pC7fbxfRkDg0VO+fM4cV0jmLwU5eM4X+Wi9
	30PZiPpL/BuXf9OLFf5fAai8qds8sofwRAxBMpMmVep5hJiTZXRwVSbdU5DApnbloYu9iJyPZNJ0J
	Mvt3RBLWX1YWgqxx1mN/Y03rhgzDB2jc2ECWpGBxu/7+rYDAPLte9Q60aN/hpEwV4bOP9xnSRGOdX
	s7n7fM/29+uxFrADQf1FZwre/eaZbmtYaO1x0BvoWFXj86z3EX2QZx547cuNnhwhXfR0fFFCN4Lzg
	5Odbpidg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqd3-00000007jn5-2C5p;
	Fri, 27 Feb 2026 05:43:09 +0000
Received: from mail-westus3azon11012048.outbound.protection.outlook.com ([40.107.209.48] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqcy-00000007jmi-3zko
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 05:43:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bO74vmbDJxJFDncpHmyZx6305K6pRXDWqeu6FQfJEY6Blq43yey82DtOeM4NHDNQVsY4cNJBjCmQAbQEUYolXGitRFb9V2udM6CMmXXxfAXRvIVKS0k5mejA30uhSw/TNB+fKEb+lnasbKyGxad87LTSJoFEMvgVy5bblFJ8B/jR3MXbrH/tpDJnpqUsf/FBcxz24chycDsOQK3dnj2lEU8L+UMDFQwdbS5WHVDsGBGfCT9G5iCpmFvK2X1lrQsnZfw9aOLDRv+qw5Vwijk4kIcUChdcGi/9HTllOSZh9wbLaIUZRCi3/2N5YrUTQdmFvXQphEJxT713BVsi1YDUrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06B7Y9sKqbsYKpqCa1ra34NutBzslFfMUNSW2Fh42P8=;
 b=gNDBzQY0MQrmlsAZnfAZF0TrUHAu2zqJk/hRQy3m/+URwY23J9Dgzey90B1mMRMj6e6LWQ22KIUI6PsTj9ZmbErbUQ08YNtV+imcYFrQ0KK+SPzYAXQyhGSA02Bzp4KNuiQA0ZylYgKlZSXAvlk+J6Z48+2/6USV6MKuz5m9BI5fhIjX+Q2Z98knb7PeB6vYPKSBDBWjexDjN8dvBYILEE5zRTMt+Vvz3obYLM8gfAwHosCJyeAOvSDBEMJSoFYbtk/ja5ni9FN+qHUH28smF5KE5xlWYFbxiWgW2uUMlSldMATYiwu5neFsdWflbctM5y8kA+im/Veaf4gdW/flOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06B7Y9sKqbsYKpqCa1ra34NutBzslFfMUNSW2Fh42P8=;
 b=qw4I3Xa10/Uh/E8zgf7gme38wA8LBc7GxF0fjYkwKti7onAN5Ty5fRkAiHJZPXaMv7WXUCYGV6tEIV2pHIbHWmquAKGfWrqZ111GuspqIEB1+ppEZ+aAy6bPXPKTQBda78jiT6qZZ5nar6VxiSr1O17FmVgvw8o4OKNsIjLpQ9s=
Received: from BN0PR02CA0001.namprd02.prod.outlook.com (2603:10b6:408:e4::6)
 by CH4PR10MB8124.namprd10.prod.outlook.com (2603:10b6:610:23a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 05:43:01 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::e5) by BN0PR02CA0001.outlook.office365.com
 (2603:10b6:408:e4::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Fri,
 27 Feb 2026 05:42:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Fri, 27 Feb 2026 05:43:00 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 23:42:58 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 23:42:58 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Feb 2026 23:42:58 -0600
Received: from [10.24.69.13] (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61R5gskl3180224;
	Thu, 26 Feb 2026 23:42:55 -0600
Message-ID: <f8e67670-1525-4a39-bcfc-71ff683a3ebc@ti.com>
Date: Fri, 27 Feb 2026 11:12:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am642-evm: Add ICSSG0 overlay for dual
 EMAC support
To: MD Danish Anwar <danishanwar@ti.com>, <vigneshr@ti.com>, <nm@ti.com>
CC: <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
	<kristo@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srk@ti.com>, Roger Quadros <rogerq@kernel.org>
References: <20260226115454.1730618-1-m-malladi@ti.com>
 <0ec9de38-cf6f-4c27-86d7-13bc4656f558@ti.com>
Content-Language: en-US
From: Meghana Malladi <m-malladi@ti.com>
In-Reply-To: <0ec9de38-cf6f-4c27-86d7-13bc4656f558@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|CH4PR10MB8124:EE_
X-MS-Office365-Filtering-Correlation-Id: b2df47f7-d355-4eef-9123-08de75c311b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|34020700016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: YJDt5zcUTRlNzU4H6xh2m5DO/IVQ9kaMlWR5+VoshZscqLUAIJ8VRo2uychw2kspSdYgQK9IrEtrcKlqiWjrkdXXCjcaNHxOivEkqymu4lC9AmIb+DtD1CoTUNcDLHrf+QrW8lK9RF3f2hppZFGC0wvaJG2KlOOSDzbP9PamTJk4QJOCH/5QEqHYd0j70dvwNMmTh8MjG9Zn69p49OCqarcpTAyZrLfJ0xJnJJU1gS919NsP85l+zgOBgyCJyJHLVGGy8UdYtxMdHOd9qRWTtf/DI3DuAxfWkIHgnL3lMmYT/SlriO6hkRXbC0bX7xPL705gTjb2PallPYPdwRQn+ULaoq1Osa1fSSsPhL7PmxRszsLmLZcvppuPg8r7AYaYBYcqRc9VNgjKF+xqeTsQDpPmiK5U8JrYZCW+Sx8d/ZPHBgnvmj/IE/8p1B3VVGixU04JJ9meYkFxmikfrfHrG/eLESnRMwdfUCN+XswT4H5hYp0IhZeeYph1PuwIvvVDlrfPJ/ZqQW3MsoiPdS0RIE1lqVj5mqdazbOuYDeIO4YUYpj26qmJsdKNE24hYGgpBlfug23QJfswAg8XvQuXvET5hKg0MWFjFXzwsM4nFSjwEfiLSWHkBL6IUFtitbbmZi0NjKgHx9ZIhCy5Pnpdr9eN0H1Rf6TDuA/RR4dVSU55ZWOL/8/Gu5/EueFhKLBpgbxoU6Tivz5aYYh2lDq0Fiy4OwLMQdqVKItNHwYRuANwQTUqJT//AdFZt6VXQXnAA8TV3Xf2bJTz0bdLtFvBV6E3jAJjSIIQIpi4itDRw3A=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(34020700016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sA+qLDcr5lVO2b8kqmsNdIjpOeg7n4z9s7jdPH2c+kScf9purvQtAWjfZ/KGlhpU3rYt9jAjhcdBStDiqPdF8ZskvF3Tg5eNK6pXG7AoJUanmTkOxbdgZexLfNf6RVZr6S3ZfMh3+E9P6JFAnJzNMMwCNe3KEfTvroz9hoAlSN+QHHwsPjrnLZYHlXGkK0CNQVC343uuuCzS3rFg3eNDCJi1qC9wYrEp5B2Z1NEPZzyp/y9RcV2yig8zifnXU3Mw0AMCqeYPc1cQ11/bDIJJkTuNVFYFNQDzBDGhzfDALoeAK8KA3veHRE7E/9HmU+JWTSqyG3YVFsvNNLWc3nd/6ao8QHevxyHLViI69uQYqF/BumHWzuECio23At8R28oSSB3X+961bv64B4fFOOX5+Mk0udsvnXuioskOpjZ+Rumvw4IA0QNvhY9npYMmc2F9
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 05:43:00.8421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2df47f7-d355-4eef-9123-08de75c311b9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_214306_426607_F0E917D8 
X-CRM114-Status: GOOD (  17.44  )
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

Hi Danish,

On 2/27/26 10:23, MD Danish Anwar wrote:
> Hi Meghana,
> 
> On 26/02/26 5:24 pm, Meghana Malladi wrote:
>> Add device tree overlay to enable ICSSG0 dual EMAC support on AM642 EVM.
>> This overlay enables all four ICSSG Ethernet interfaces (ICSSG0 port0/1
>> and ICSSG1 port0/1) in dual EMAC mode.
> 
> Why? Your subject says "Add ICSSG0" but the overlay is adding both
> ICSSG0 and ICSSG1. AFAIK, overlay k3-am642-evm-icssg1-dualemac.dtbo
> already enables ICSSG1 so why is this overlay again enabling the same?
> 

Last time I checked with Daolin I remember her telling the customer 
requirement for needing to enable ICSSG0 was to bring up all ICSSG 
ports. So I thought it makes more sense to enable all of them together 
in this overlay. Will re-check with her and drop icssg1 if not required.

>>
>> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/Makefile               |   4 +
>>   .../boot/dts/ti/k3-am642-evm-icssg0-exp.dtso  | 265 ++++++++++++++++++
>>   2 files changed, 269 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/ti/k3-am642-evm-icssg0-exp.dtso
>>
>> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
>> index ba01a929e06f..458b9d523069 100644
>> --- a/arch/arm64/boot/dts/ti/Makefile
>> +++ b/arch/arm64/boot/dts/ti/Makefile
>> @@ -62,6 +62,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-hdmi-audio.dtbo
>>   
>>   # Boards with AM64x SoC
>>   dtb-$(CONFIG_ARCH_K3) += k3-am642-evm.dtb
>> +dtb-$(CONFIG_ARCH_K3) += k3-am642-evm-icssg0-exp.dtbo
>>   dtb-$(CONFIG_ARCH_K3) += k3-am642-evm-icssg1-dualemac.dtbo
>>   dtb-$(CONFIG_ARCH_K3) += k3-am642-evm-icssg1-dualemac-mii.dtbo
>>   dtb-$(CONFIG_ARCH_K3) += k3-am642-evm-pcie0-ep.dtbo
>> @@ -218,6 +219,8 @@ k3-am62p5-sk-csi2-ov5640-dtbs := k3-am62p5-sk.dtb \
>>   	k3-am62x-sk-csi2-ov5640.dtbo
>>   k3-am62p5-sk-csi2-tevi-ov5640-dtbs := k3-am62p5-sk.dtb \
>>   	k3-am62x-sk-csi2-tevi-ov5640.dtbo
>> +k3-am642-evm-icssg0-exp-dtbs := \
>> +	k3-am642-evm.dtb k3-am642-evm-icssg0-exp.dtbo
> 
> Why have you named the overlay icssg0-exp ? What does exp mean here?
> More suitable name would be `k3-am642-evm-icssg0.dtbo`
> 

Ok I will update the name accordingly in v2.

>>   k3-am642-evm-icssg1-dualemac-dtbs := \
>>   	k3-am642-evm.dtb k3-am642-evm-icssg1-dualemac.dtbo
>>   k3-am642-evm-icssg1-dualemac-mii-dtbs := \
>> @@ -306,6 +309,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
>>   	k3-am62p5-sk-csi2-imx219.dtb \
>>   	k3-am62p5-sk-csi2-ov5640.dtb \
>>   	k3-am62p5-sk-csi2-tevi-ov5640.dtb \
>> +	k3-am642-evm-icssg0-exp.dtb \
>>   	k3-am642-evm-icssg1-dualemac.dtb \
>>   	k3-am642-evm-icssg1-dualemac-mii.dtb \
>>   	k3-am642-evm-pcie0-ep.dtb \
>> diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm-icssg0-exp.dtso b/arch/arm64/boot/dts/ti/k3-am642-evm-icssg0-exp.dtso
>> new file mode 100644
>> index 000000000000..5a8462245704
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/ti/k3-am642-evm-icssg0-exp.dtso
>> @@ -0,0 +1,265 @@
>> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
>> +/**
>> + * DT overlay for enabling ICSSG0 dual EMAC on AM642 EVM with
>> + * DP83TG720-IND-SPE-EVM daughter card
>> + *
>> + * AM642 EVM Product link: https://www.ti.com/tool/TMDS64EVM
>> + * DP83TG720 daughter card link: https://www.ti.com/tool/DP83TG720-IND-SPE-EVM
>> + *
>> + * Copyright (C) 2020-2024 Texas Instruments Incorporated - https://www.ti.com/
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include "k3-pinctrl.h"
>> +
>> +&{/aliases} {
>> +	ethernet0 = &icssg0_emac0;
>> +	ethernet1 = &icssg0_emac1;
>> +	ethernet2 = "/icssg1-eth/ethernet-ports/port@0";
>> +	ethernet3 = "/icssg1-eth/ethernet-ports/port@1";
>> +};
>> +
>> +&{/} {
>> +	mdio-mux-2 {
>> +		compatible = "mdio-mux-multiplexer";
>> +		mux-controls = <&mdio_mux>;
>> +		mdio-parent-bus = <&icssg1_mdio>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		mdio@0 {
>> +			reg = <0x0>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			icssg1_phy2: ethernet-phy@3 {
>> +				reg = <3>;
>> +				tx-internal-delay-ps = <250>;
>> +				rx-internal-delay-ps = <2000>;
>> +			};
>> +		};
>> +	};
>> +
>> +	icssg0_eth: icssg0-eth {
>> +		compatible = "ti,am642-icssg-prueth";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&pru_icssg0_rgmii1_pins_default>, <&pru_icssg0_rgmii2_pins_default>;
>> +
>> +		sram = <&oc_sram>;
>> +		ti,prus = <&pru0_0>, <&rtu0_0>, <&tx_pru0_0>, <&pru0_1>, <&rtu0_1>, <&tx_pru0_1>;
>> +		firmware-name = "ti-pruss/am64x-sr2-pru0-prueth-fw.elf",
>> +				"ti-pruss/am64x-sr2-rtu0-prueth-fw.elf",
>> +				"ti-pruss/am64x-sr2-txpru0-prueth-fw.elf",
>> +				"ti-pruss/am64x-sr2-pru1-prueth-fw.elf",
>> +				"ti-pruss/am64x-sr2-rtu1-prueth-fw.elf",
>> +				"ti-pruss/am64x-sr2-txpru1-prueth-fw.elf";
>> +
>> +		ti,pruss-gp-mux-sel = <2>,	/* MII mode */
>> +				      <2>,
>> +				      <2>,
>> +				      <2>,	/* MII mode */
>> +				      <2>,
>> +				      <2>;
>> +
>> +		ti,mii-g-rt = <&icssg0_mii_g_rt>;
>> +		ti,mii-rt = <&icssg0_mii_rt>;
>> +		ti,pa-stats = <&icssg0_pa_stats>;
>> +		ti,iep = <&icssg0_iep0>,  <&icssg0_iep1>;
>> +
>> +		interrupt-parent = <&icssg0_intc>;
>> +		interrupts = <24 0 2>, <25 1 3>;
>> +		interrupt-names = "tx_ts0", "tx_ts1";
>> +
>> +		dmas = <&main_pktdma 0xc100 0>, /* egress slice 0 */
>> +		       <&main_pktdma 0xc101 0>, /* egress slice 0 */
>> +		       <&main_pktdma 0xc102 0>, /* egress slice 0 */
>> +		       <&main_pktdma 0xc103 0>, /* egress slice 0 */
>> +		       <&main_pktdma 0xc104 0>, /* egress slice 1 */
>> +		       <&main_pktdma 0xc105 0>, /* egress slice 1 */
>> +		       <&main_pktdma 0xc106 0>, /* egress slice 1 */
>> +		       <&main_pktdma 0xc107 0>, /* egress slice 1 */
>> +		       <&main_pktdma 0x4100 0>, /* ingress slice 0 */
>> +		       <&main_pktdma 0x4101 0>, /* ingress slice 1 */
>> +		       <&main_pktdma 0x4102 0>, /* mgmnt rsp slice 0 */
>> +		       <&main_pktdma 0x4103 0>; /* mgmnt rsp slice 1 */
>> +		dma-names = "tx0-0", "tx0-1", "tx0-2", "tx0-3",
>> +			    "tx1-0", "tx1-1", "tx1-2", "tx1-3",
>> +			    "rx0", "rx1",
>> +			    "rxmgm0", "rxmgm1";
>> +
>> +		ethernet-ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			icssg0_emac0: port@0 {
>> +				reg = <0>;
>> +				phy-handle = <&icssg0_phy00>;
>> +				phy-mode = "rgmii-id";
>> +				syscon-rgmii-delay = <&main_conf 0x4100>;
>> +				/* Filled in by bootloader */
>> +				local-mac-address = [00 00 00 00 00 00];
>> +			};
>> +
>> +			icssg0_emac1: port@1 {
>> +				reg = <1>;
>> +				phy-handle = <&icssg0_phy01>;
>> +				phy-mode = "rgmii-id";
>> +				syscon-rgmii-delay = <&main_conf 0x4104>;
>> +				/* Filled in by bootloader */
>> +				local-mac-address = [00 00 00 00 00 00];
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&main_pmx0 {
>> +	pru_icssg0_mdio_pins_default: pru-icssg0-mdio-pins-default {
>> +		pinctrl-single,pins = <
>> +			/* (P3) PRG0_MDIO0_MDC */
>> +			AM64X_IOPAD(0x0204, PIN_OUTPUT, 0)
>> +			/* (P2) PRG0_MDIO0_MDIO */
>> +			AM64X_IOPAD(0x0200, PIN_INPUT, 0)
>> +			/* (P16) GPIO0_32 - GPMC0_ADVn_ALE - GPIO_ETH0/1_RESETn# */
>> +			AM64X_IOPAD(0x0084, PIN_OUTPUT, 7)
>> +		>;
>> +	};
>> +
>> +	pru_icssg0_rgmii1_pins_default: pru-icssg0-rgmii1-pins-default {
>> +		pinctrl-single,pins = <
>> +			/* (module-sitara) */
>> +			/* (a14-y1) PRG0_PRU0_GPO0.PRG0_RGMII1_RD0 */
>> +			AM64X_IOPAD(0x0160, PIN_INPUT, 2)
>> +			/* (b14-r4) PRG0_PRU0_GPO1.PRG0_RGMII1_RD1 */
>> +			AM64X_IOPAD(0x0164, PIN_INPUT, 2)
>> +			/* (d14-u2) PRG0_PRU0_GPO2.PRG0_RGMII1_RD2 */
>> +			AM64X_IOPAD(0x0168, PIN_INPUT, 2)
>> +			/* (e14-v2) PRG0_PRU0_GPO3.PRG0_RGMII1_RD3 */
>> +			AM64X_IOPAD(0x016c, PIN_INPUT, 2)
>> +			/* (e13-t3) PRG0_PRU0_GPO6.PRG0_RGMII1_RXC */
>> +			AM64X_IOPAD(0x0178, PIN_INPUT, 2)
>> +			/* (b13-aa2) PRG0_PRU0_GPO4.PRG0_RGMII1_RX_CTL */
>> +			AM64X_IOPAD(0x0170, PIN_INPUT, 2)
>> +
>> +			/* (a11-y3) PRG0_PRU0_GPO11.PRG0_RGMII1_TD0 */
>> +			AM64X_IOPAD(0x018c, PIN_OUTPUT, 2)
>> +			/* (c11-aa3) PRG0_PRU0_GPO12.PRG0_RGMII1_TD1 */
>> +			AM64X_IOPAD(0x0190, PIN_OUTPUT, 2)
>> +			/* (d11-r6) PRG0_PRU0_GPO13.PRG0_RGMII1_TD2 */
>> +			AM64X_IOPAD(0x0194, PIN_OUTPUT, 2)
>> +			/* (b10-v4) PRG0_PRU0_GPO14.PRG0_RGMII1_TD3 */
>> +			AM64X_IOPAD(0x0198, PIN_OUTPUT, 2)
>> +			/* (e10-u4) PRG0_PRU0_GPO16.PRG0_RGMII1_TXC */
>> +			AM64X_IOPAD(0x01a0, PIN_OUTPUT, 2)
>> +			/* (c10-t5) PRG0_PRU0_GPO15.PRG0_RGMII1_TX_CTL */
>> +			AM64X_IOPAD(0x019c, PIN_OUTPUT, 2)
>> +		>;
>> +	};
>> +
>> +	pru_icssg0_rgmii2_pins_default: pru-icssg0-rgmii2-pins-default {
>> +		pinctrl-single,pins = <
>> +			/* (e9-y2) PRG0_PRU1_GPO0.PRG0_RGMII2_RD0 */
>> +			AM64X_IOPAD(0x01b0, PIN_INPUT, 2)
>> +			/* (a8-w2) PRG0_PRU1_GPO1.PRG0_RGMII2_RD1 */
>> +			AM64X_IOPAD(0x01b4, PIN_INPUT, 2)
>> +			/* (c8-v3) PRG0_PRU1_GPO2.PRG0_RGMII2_RD2 */
>> +			AM64X_IOPAD(0x01b8, PIN_INPUT, 2)
>> +			/* (d8-t4) PRG0_PRU1_GPO3.PRG0_RGMII2_RD3 */
>> +			AM64X_IOPAD(0x01bc, PIN_INPUT, 2)
>> +			/* (e7-r5) PRG0_PRU1_GPO6.PRG0_RGMII2_RXC */
>> +			AM64X_IOPAD(0x01c8, PIN_INPUT, 2)
>> +			/* (b7-w3) PRG0_PRU1_GPO4.PRG0_RGMII2_RX_CTL */
>> +			AM64X_IOPAD(0x01c0, PIN_INPUT, 2)
>> +
>> +			/* (a5-w4) PRG0_PRU1_GPO11.PRG0_RGMII2_TD0 */
>> +			AM64X_IOPAD(0x01dc, PIN_OUTPUT, 2)
>> +			/* (c5-y4) PRG0_PRU1_GPO12.PRG0_RGMII2_TD1 */
>> +			AM64X_IOPAD(0x01e0, PIN_OUTPUT, 2)
>> +			/* (d5-t6) PRG0_PRU1_GPO13.PRG0_RGMII2_TD2 */
>> +			AM64X_IOPAD(0x01e4, PIN_OUTPUT, 2)
>> +			/* (b4-u6) PRG0_PRU1_GPO14.PRG0_RGMII2_TD3 */
>> +			AM64X_IOPAD(0x01e8, PIN_OUTPUT, 2)
>> +			/* (a3-aa4) PRG0_PRU1_GPO16.PRG0_RGMII2_TXC */
>> +			AM64X_IOPAD(0x01f0, PIN_OUTPUT, 2)
>> +			/* (c4-u5) PRG0_PRU1_GPO15.PRG0_RGMII2_TX_CTL */
>> +			AM64X_IOPAD(0x01ec, PIN_OUTPUT, 2)
>> +		>;
>> +	};
>> +
>> +	icssg1_rgmii2_pins_default: icssg1-rgmii2-default-pins {
>> +		pinctrl-single,pins = <
>> +			AM64X_IOPAD(0x0108, PIN_INPUT, 2) /* (W11) PRG1_PRU1_GPO0.RGMII2_RD0 */
>> +			AM64X_IOPAD(0x010c, PIN_INPUT, 2) /* (V11) PRG1_PRU1_GPO1.RGMII2_RD1 */
>> +			AM64X_IOPAD(0x0110, PIN_INPUT, 2) /* (AA12) PRG1_PRU1_GPO2.RGMII2_RD2 */
>> +			AM64X_IOPAD(0x0114, PIN_INPUT, 2) /* (Y12) PRG1_PRU1_GPO3.RGMII2_RD3 */
>> +			AM64X_IOPAD(0x0120, PIN_INPUT, 2) /* (U11) PRG1_PRU1_GPO6.RGMII2_RXC */
>> +			AM64X_IOPAD(0x0118, PIN_INPUT, 2) /* (W12) PRG1_PRU1_GPO4.RGMII2_RX_CTL */
>> +			AM64X_IOPAD(0x0134, PIN_OUTPUT, 2) /* (AA10) PRG1_PRU1_GPO11.RGMII2_TD0 */
>> +			AM64X_IOPAD(0x0138, PIN_OUTPUT, 2) /* (V10) PRG1_PRU1_GPO12.RGMII2_TD1 */
>> +			AM64X_IOPAD(0x013c, PIN_OUTPUT, 2) /* (U10) PRG1_PRU1_GPO13.RGMII2_TD2 */
>> +			AM64X_IOPAD(0x0140, PIN_OUTPUT, 2) /* (AA11) PRG1_PRU1_GPO14.RGMII2_TD3 */
>> +			AM64X_IOPAD(0x0148, PIN_OUTPUT, 2) /* (Y10) PRG1_PRU1_GPO16.RGMII2_TXC */
>> +			AM64X_IOPAD(0x0144, PIN_OUTPUT, 2) /* (Y11) PRG1_PRU1_GPO15.RGMII2_TX_CTL */
>> +		>;
>> +	};
>> +
>> +	icssg0_iep0_pins_default: icssg0-iep0-pins-default {
>> +		pinctrl-single,pins = <
>> +			AM64X_IOPAD(0x01ac, PIN_OUTPUT, 2) /* (W1) PRG0_PRU0_GPO19.PRG0_IEP0_EDC_SYNC_OUT0 */
>> +		>;
>> +	};
>> +};
>> +
>> +&cpsw3g {
>> +	pinctrl-0 = <&rgmii1_pins_default>;
>> +};
>> +
>> +&cpsw_port2 {
>> +	status = "disabled";
>> +};
> 
> 
> Why are you disabling cpsw_port2? AFAIK they are not related to ICSSG0.
> 
>> +
>> +&mdio_mux_1 {
>> +	status = "disabled";
>> +};
>> +
>> +&icssg0_mdio {
>> +	pinctrl-names = "default";
>> +	status = "okay";
>> +	pinctrl-0 = <&pru_icssg0_mdio_pins_default>;
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	icssg0_phy00: ethernet-phy@0 {
>> +		reg = <0x0>;
>> +	};
>> +
>> +	icssg0_phy01: ethernet-phy@1 {
>> +		reg = <0xA>;
>> +	};
>> +};
>> +
>> +&icssg0_iep0 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&icssg0_iep0_pins_default>;
>> +};
>> +
>> +&icssg1_eth {
>> +	pinctrl-0 = <&icssg1_rgmii1_pins_default>, <&icssg1_rgmii2_pins_default>;
>> +};
>> +
>> +&icssg1_emac1 {
>> +	status = "okay";
>> +	phy-handle = <&icssg1_phy2>;
>> +	phy-mode = "rgmii-id";
>> +};
> 
> Again this is already taken care in `k3-am642-evm-icssg1-dualemac.dtso`
> 
> Your this patch should only enable ICSSG0. If someone needs to enable
> both ICSSG0 and ICSSG1 they can apply both of the below overlays.
> 
> - k3-am642-evm-icssg1-dualemac.dtbo
> - k3-am642-evm-icssg0.dtbo
> 
>> +
>> +&main_gpio0 {
>> +	phy-line-hog {
>> +		gpio-hog;
>> +		gpios = <32 GPIO_ACTIVE_HIGH>;
>> +		output-high;
>> +		line-name = "phy-hog-line";
>> +	};
>> +};
>>
>> base-commit: 4916f2e2f3fc9aef289fcd07949301e5c29094c2
> 


