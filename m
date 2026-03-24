Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BE0E9A776
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 11:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7bLDa5FatlQiQDgslRUvd7a89kzDDOt8E5RHDR74RRs=; b=qx1R7Jb4A6dYZxyfcU1CIXKOH6
	bKEzUEw06FYthEH6Hm9NfMLBIoaCd2Z6eovW5VmPZgkw7MGsXuaE+shvg6Y+wobKMrn0i0bRPYlIE
	ALM2gQimej1XR1t6FvsTuspecD3YjLEJE4ASSMbvR++QA56XDG02cmhtz19+Ql5s+heWhuClE/JEs
	3SyjsWo0hRYYQkFS8IPghWImrH7O/WHlBrZC3ht+Iau48m3Qn/SeBeCf6odIDMs9uhtNZz0LqASxL
	ZC+y+qU1cM72GwnYmbWUM/L+0UiQKQ+EvGMCTpE8+SfXklQ9u7a6bHYOAhy3dzWa2vAYpoqqpKIZQ
	p654wa1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50CD-00000001IGs-3FGo;
	Tue, 24 Mar 2026 11:45:17 +0000
Received: from mail-japaneastazon11022093.outbound.protection.outlook.com ([52.101.126.93] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50CA-00000001IGG-0K8K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 11:45:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IyCs/YwMQqRUAX9nsAq/+nIO1fACxqvU0ZmNhU1RRvXJurrYJP+C6fh0YOmh6zreJ+11cPTswapHMNYYdrz//Ny1coe4cEweY+FWyrwXzl235tne6zFJMZwJn8a1iTFEe16kHgy5H608spnXf8SU1SyWGc613QUTs+JA/cPjJDn50ZeYKvjjKYeYFC6cId+H9rstCOfTNcM8rAhwytYW0U6nQFlVufPVLJZ0mdHEUXfzhz88LO7FvdCiimZhn5Gzbsjp7zD1jOsXaZVL4MUMM8TooYgmNoXNA7lbjQht6JANaozwCa2/EUkcmdeV4IOoUlrb/J0PFluzYDjdUbL2Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bLDa5FatlQiQDgslRUvd7a89kzDDOt8E5RHDR74RRs=;
 b=spDkp56luWT0Gg+OCBcCYJ3zfTQPZ7XeBJqTcmoQ+AHx+dRKSbBwWva9JqTNs6JP9w4x9qCmj4octRqfCxgEAPUJSDyg76P+g73bmeHMj1/8mCLgj8I6YxUXdJ+fiTrsfK/7HDh0FoqHPCcgC0FKE3LPvAoKjB7qM4LOBiYN80yGVEL4MEgHWZql2m1UYfVODioQYXpOEZu7F3c1o+33AHYzfQXpkSNu5MMVBwQGG9k6Gh0EvTI5Tm2SVCAWPQp9P9ENO/WO36TEtSJXrbgXQ9kQtnvXgwDyup9lVGppaOeFKDWAiX0nzWTMI6uqMeN09CMEHGnbzne71xezFS2Fdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OSTP286CA0052.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:217::13)
 by TYZPR06MB5321.apcprd06.prod.outlook.com (2603:1096:400:1f3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 11:45:03 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096:604:217:cafe::58) by OSTP286CA0052.outlook.office365.com
 (2603:1096:604:217::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 11:45:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 11:45:02 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 4D3D24126F80;
	Tue, 24 Mar 2026 19:45:01 +0800 (CST)
Date: Tue, 24 Mar 2026 19:45:00 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Gary Yang <gary.yang@cixtech.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v4 2/2] arm64: dts: cix: Add scmi powerdomain nodes for
 sky1
Message-ID: <acJ5PLtFwZ8+E5q+@nchen-desktop>
References: <20260313114914.1564115-1-gary.yang@cixtech.com>
 <20260313114914.1564115-3-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313114914.1564115-3-gary.yang@cixtech.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|TYZPR06MB5321:EE_
X-MS-Office365-Filtering-Correlation-Id: 94595e17-9618-44d1-bb56-08de899ac93c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|36860700016|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 6cGnMZ4M/iTWiVaaIFdBOgnDmJGX+S6VrN25Oiv88uDO7g3o4nRExA+tVb/pSDvg+J4lXAPSBqzSGmgpYtriBGG9O9VefI4H4nUSwO3Fba3obt75lTPrM8SGHuTj8+V4JIPJYisjRSbynUO4OPGX6nLUBNTk1z67ngFrM6duUIp2/N/akv3AlnkHeCzTej6WU2RdL4DCBot4LpI0UdAS4lUMeaniEX0tTGTdMtHojPDVcSh2l54q55eCL9Bbs6MN2fXCMa9Hb1+ShZie4ADearNnc25vLOvesIrpO6IelpgRQyOjXF0vP70iPuilj7cA8Ef0utzae/8XPfWtKq94CHsK8XcJW7X2m68s5U6kbh78pG5D01CS3tp/as+6pJL3wsvleGxF7Mqj8XP7TL/dDeWzJIHcGIhN/8mV/+19+0UfKkBDMYp05AkPFQFy9IBlfIYQpB7dC4fs4zRJ/a/LX0bwrBlJZ7riw7DMiPnJVLBXzWwMO0RqOBmxvEfjsVefba2xYJMNmTVzPOCrnlq9fCq/TLiBPp9ERLMtRaugq7Tsnu3O4dMDbJqMZ8bkgnEPxKgXsalDLNWF7eOTCa0gPkT//3VqLnW65jQwu9Bo1UZoshZjeECYupdRYIfjeGO9FPYlclyFSImmmwM0N6jDmhSMROCLGeg/oA9kE2LMQy/jVqDaFcw4W5a0IfN86ys/2b3myjiJEGU4yRzRYW7KtzfVEwApWj3vYDO7/TELaiqHR6N+SiHKD19xY9Dc7C8vNwslyL0pbkhcJxiVu4r2uw==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8Z8loxmIfqF6ZeVp8D7FPIU/ufmfBabBkKXNcjtoZEEtDX9cBbCgIB45lQmcsfXRjzdzWmr2pVPAjHoi+adDxNp9cz9bji5gaFc7sDvxZF2HAAOa8H2RZS4bUMyRextHbJDR91GaM6HTRAU5wgHflcMgSAaV7GVhOu1E137jjaM/SUQvzrYxtrV4QJrT2VODirgmPymTYsd8lWriAeZyFLIOs9iJsdH7/U3rs0azjRDQ6iv4lr07AZfE96xvdS8XYGEooNMLOCmVllxzojRne3XKJzrHOH0fLOixIQd7M+Ai+f+NV42J9Nkq/kYtcdH51KyDsaZjuImAbCx5Vi2J5dl6ot6rl0c3Qa7VuUMy27fJKfMdtwzOT6Gqy5OTFYMVUdQXzOXO8fNSc5edmMXIl+Lx4xJ2A/w9gcvdgK8ukSU1K0H7E0BMtynrZIVPv46u
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 11:45:02.4934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94595e17-9618-44d1-bb56-08de899ac93c
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5321
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_044514_145639_F723BF91 
X-CRM114-Status: GOOD (  18.88  )
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

On 26-03-13 19:49:14, Gary Yang wrote:
> Add a second SCMI channel using SMC transport to communicate with TF-A
> for power domain management on the Sky1 SoC.
> 
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>

Applied, thanks.

Peter
> ---
>  arch/arm64/boot/dts/cix/sky1-power.h | 33 ++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/cix/sky1.dtsi    | 21 ++++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/cix/sky1-power.h
> 
> diff --git a/arch/arm64/boot/dts/cix/sky1-power.h b/arch/arm64/boot/dts/cix/sky1-power.h
> new file mode 100644
> index 000000000000..53f4a3af36b3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/cix/sky1-power.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright 2026 Cix Technology Group Co., Ltd.
> + */
> +
> +#ifndef __SKY1_POWER_H__
> +#define __SKY1_POWER_H__
> +
> +/* The Rich OS need flow the macro */
> +#define SKY1_PD_AUDIO		0
> +#define SKY1_PD_PCIE_CTRL0	1
> +#define SKY1_PD_PCIE_DUMMY	2
> +#define SKY1_PD_PCIEHUB		3
> +#define SKY1_PD_MMHUB		4
> +#define SKY1_PD_MMHUB_SMMU	5
> +#define SKY1_PD_DPU0		6
> +#define SKY1_PD_DPU1		7
> +#define SKY1_PD_DPU2		8
> +#define SKY1_PD_DPU3		9
> +#define SKY1_PD_DPU4		10
> +#define SKY1_PD_VPU_TOP		11
> +#define SKY1_PD_VPU_CORE0	12
> +#define SKY1_PD_VPU_CORE1	13
> +#define SKY1_PD_VPU_CORE2	14
> +#define SKY1_PD_VPU_CORE3	15
> +#define SKY1_PD_NPU_CORE0	16
> +#define SKY1_PD_NPU_CORE1	17
> +#define SKY1_PD_NPU_CORE2	18
> +#define SKY1_PD_NPU_TOP		19
> +#define SKY1_PD_ISP0		20
> +#define SKY1_PD_GPU		21
> +
> +#endif
> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
> index 64b76905cbff..495ea91a63f5 100644
> --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> @@ -6,6 +6,7 @@
>  
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/cix,sky1.h>
> +#include "sky1-power.h"
>  
>  / {
>  	interrupt-parent = <&gic>;
> @@ -168,6 +169,19 @@ scmi_clk: protocol@14 {
>  				#clock-cells = <1>;
>  			};
>  		};
> +
> +		ap_to_tfa_scmi: scmi-1 {
> +			compatible = "arm,scmi-smc";
> +			arm,smc-id = <0xc2000001>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			shmem = <&ap_tfa_scmi_mem>;
> +
> +			smc_devpd: protocol@11 {
> +				reg = <0x11>;
> +				#power-domain-cells = <1>;
> +			};
> +		};
>  	};
>  
>  	pmu-a520 {
> @@ -428,6 +442,7 @@ pcie_x8_rc: pcie@a010000 {
>  			#size-cells = <2>;
>  			bus-range = <0xc0 0xff>;
>  			device_type = "pci";
> +			power-domains = <&smc_devpd SKY1_PD_PCIE_CTRL0>;
>  			#interrupt-cells = <1>;
>  			interrupt-map-mask = <0 0 0 0x7>;
>  			interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH 0>,
> @@ -572,6 +587,12 @@ iomuxc_s5: pinctrl@16007000 {
>  			compatible = "cix,sky1-pinctrl-s5";
>  			reg = <0x0 0x16007000 0x0 0x1000>;
>  		};
> +
> +		ap_tfa_scmi_mem: shmem@84380000 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0x0 0x84380000 0x0 0x80>;
> +			reg-io-width = <4>;
> +		};
>  	};
>  
>  	timer {
> -- 
> 2.49.0
> 

-- 

Best regards,
Peter

