Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7006DCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 03:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUoIFe1Cwh3yihmoV880xesqHwuRHBuIwwUq7zEeAE8=; b=sRDxM5BrQC/SOn1UuwdR1GxlT+
	ei2NPqMNG7xhmfxo5+Cki2mxX21JubciUEdwleSMtqi80Q4lzPaebAMyIeieUzAkmDahCZUBinzFi
	TXoas7ZDXdEBePmzsybeWiy2cDicn1oFYekm721lIR3OhaoqkR7fRtr9lAeH7qnN2crwM/EOcalve
	Bb0MwrJr0G6oINnAT3DozfsLwwDSLllysS4L+U4tSq+cb4b7gLTTJxozgQQow79MtNfex+RF2f8vz
	J0IKx4/iucjVnA0R2MEOBKR8FJPiSYZpK+9JEJoNLZ4EmhPEyWehi0w8U8bjO3CuTdxYUrHVsn0kc
	WgXSPfGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHTT-0000000CBnO-2vyC;
	Mon, 11 May 2026 03:38:31 +0000
Received: from mail-japanwestazon11022103.outbound.protection.outlook.com ([40.107.75.103] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHTP-0000000CBma-0mJF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 03:38:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ruLcRJGQ4LmrfhMWszYa1oG2KC0X46aMGwGCNfVw32EG72X83N8hxOey3SPGTX41edHSJCNlXxad8sMYEGO9t3CJZoVdZYmnRTVFCCGvyOWxTKx2XML/ghbGa1NB2sdqWGq/XLOhdFKYMCeWrKWY0+hKBxkQ9whAmak6Em2z6wO6BwFxTjJpZ798Bbi7SYtpRypg8ZJSB4FWRdeqMTumpT1Y9dAvw12vrFI90bpqPJIxbSLdOxwWn7FgZ3Ub14qc480iYKt2nDjAfY4g8/WG7GRHDv5+oTDhwUr481673qwuj19K4GMktOCHRoCXhxBhJ2fX8MGKzskxkKbdlfI+zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUoIFe1Cwh3yihmoV880xesqHwuRHBuIwwUq7zEeAE8=;
 b=Ve9QLrV358sYUwTaofVZGw6zH8jYobKBT+ZKsfG96LZCBvbzOO0aALW8duFIrT1K/+sSeilFAt1BNNk8z7emqYDp9A6Y+uXSjik5NEWMVywS0kYfrCtPnbqcGSQi7ux+sYMX3nz2I7pjrom2x4zHFTXjnYMgnHs5yq0Fz3GwFquagbrf5SAi01Eo6LxTDmk7yh1KCJgmNdbBsE7qTlZ780iyeZnLwOWrRlEbtDDQXej0Mj0zkyAz0ITR4HScqlRX89PtwDGN9GWxPPSNCg8PaiYgvdeEQgTF1jR4QgaCCnN/6bhkQg5ORbt9JRt5P3Xx4x4cnVwdU/Ii3jnSD8uavg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0052.apcprd02.prod.outlook.com (2603:1096:4:1f5::20)
 by SI6PR06MB7168.apcprd06.prod.outlook.com (2603:1096:4:250::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 03:38:08 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:4:1f5:cafe::f4) by SI1PR02CA0052.outlook.office365.com
 (2603:1096:4:1f5::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 03:38:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 03:38:07 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D298D4115DE1;
	Mon, 11 May 2026 11:38:06 +0800 (CST)
Date: Mon, 11 May 2026 11:38:05 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Devin Li <Devin.Li@cixtech.com>
Cc: fugang.duan@cixtech.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, guoyin.chen@cixtech.com,
	robin.wang@cixtech.com, hong.guo@cixtech.com
Subject: Re: [PATCH v2] arm64: dts: cix: Add SCMI performance domains for
 CPUFreq on Sky1
Message-ID: <agFPHR+qh15A1RqQ@nchen-desktop>
References: <20260506025254.3602623-1-Devin.Li@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506025254.3602623-1-Devin.Li@cixtech.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|SI6PR06MB7168:EE_
X-MS-Office365-Filtering-Correlation-Id: bb717df2-4016-4784-6b84-08deaf0eb781
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|22082099003|3023799003|56012099003;
X-Microsoft-Antispam-Message-Info: mGlxLAJ2aRTR83hUNS/QLw9eV+3cCijjfFr67YpiDijflz7b1jUGclLLA8k6SqtusVKr1EqfkuQNNobj09y+QnaRSFZLvpNCqUO/NRq7zwfRcJYElipWKlU2ldxMvrWIXqDjE+QTcGd5a9jU30LNSkXbeF0Sy9XEcYvTQBWgcgBYuN5eabMPo/PSEc4bnKSaXKSDKyiegeYXxY7gc7XQj4MP54FhcEVaDryo7W6Oz/1kT/8uH8mE85pEKXOoYC5o8geo0i0LvfTn9bzCFLa4Sca0Olx5jVoIN0gSteRLSRvmN7bgTlgS7qgSwzUZZC9sZYl0YnPQqfiVxFvRii/Ccplasy5Ir7RJ5V9m8WaPX0GYnk8rkENWV/GSnNBUCYbsVj70JAw15s7pUBjX4Lkd8z4rmgx9XNQSzTUZNYtJBrogm3Aol4QOq+y2eUHcUCfELc4ZANdHHLgTBZvVwVKAG7bfuRmk1q7FGHs+rzb2h9x609ITm98/mEi+z98piEQ55C4QqXeQBs42K5aTnSz4awS7Kc7Ejy8URsBasaMZMqZuSnWWleTm1kqRbC2kU5tjwdhgFo3AlZkD5THJItfKaUfHFibchSWq/4HLanEVOyjc+mDEy1lCFT21bRnuzCrCRlVxHqQCe4TlwStR/JUKqjD/o2CdeQfCHbd69D4Rr1bZyDHBNzv4wrCb8ZNGDi+hburt/g5CCyX06IItud6FqEjzLew4YW8d40zTclKhH/k=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(22082099003)(3023799003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GWh3oUQQKRisbNEOFe6fJDL/2xOzzTy0TNguS6OWdHkaTexoqid8ohQwrh3HnjZryuro52SLoAzIMAx9LZeuzb4YrLzDNMQm69k9nmqKARZwr7GsxW8kuXYcQvAcxsZT9eNBfkkdrsIY94xpOpAOaFNvgfl3a9ILHCVLTfLMTedg3FAE4C2JJVMm8b7nj5T/ss25rWoO+jQTeb3fyDdjCDblZuhU+VfTWOu9pucioK92RPM1fEGks+HVSDXVuXltLCi6cJ7v2WlXRq6sS/0CMBIIErXGkxGHYK6j2RBkfO2huwbYiNnqYTCKsdOMazmTOrACqjSOkSXfaz/9V5IkCLef+fZbdHZej1OuOpn8S4ELNekQVCidf/rIeKGsz+rR+NucxvnuPXiJbXX16Bz18E0ZBI3D9VDHd/uBAR/PrpYNNyjsvS7XpglYgdzZYxFB
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 03:38:07.4043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb717df2-4016-4784-6b84-08deaf0eb781
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR06MB7168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_203827_235488_872DEC88 
X-CRM114-Status: GOOD (  15.08  )
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

On 26-05-06 10:52:54, Devin Li wrote:
> Add SCMI Protocol 13 (Performance) node under ap_to_pm_scmi with
> domains.
> 
> Define SKY1_PERF_* macros in sky1-power.h for all performance domain
> IDs (CPU L/B0/B1/M0/M1, GPU, DSU, NPU, VPU, CI700, NI700), and
> wire each CPU node to its corresponding performance domain using
> power-domains and power-domain-names properties.
> 
> Signed-off-by: Devin Li <Devin.Li@cixtech.com>

Applied, thanks.

Peter
> ---
> 
> Notes:
>     Change for v2:
>     - Use real name format "Devin Li"
> 
>  arch/arm64/boot/dts/cix/sky1-power.h | 13 +++++++++++++
>  arch/arm64/boot/dts/cix/sky1.dtsi    | 29 ++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/cix/sky1-power.h b/arch/arm64/boot/dts/cix/sky1-power.h
> index 53f4a3af36b3..144567579b71 100644
> --- a/arch/arm64/boot/dts/cix/sky1-power.h
> +++ b/arch/arm64/boot/dts/cix/sky1-power.h
> @@ -30,4 +30,17 @@
>  #define SKY1_PD_ISP0		20
>  #define SKY1_PD_GPU		21
>  
> +#define SKY1_PERF_GPU_CORE	0
> +#define SKY1_PERF_GPU_TOP	1
> +#define SKY1_PERF_CPU_L     2
> +#define SKY1_PERF_CPU_B0	3
> +#define SKY1_PERF_CPU_B1	4
> +#define SKY1_PERF_CPU_M0	5
> +#define SKY1_PERF_CPU_M1	6
> +#define SKY1_PERF_DSU	    7
> +#define SKY1_PERF_NPU	    8
> +#define SKY1_PERF_VPU	    9
> +#define SKY1_PERF_CI700	    10
> +#define SKY1_PERF_NI700	    11
> +
>  #endif
> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
> index 0611098b5f05..a77c52296ebd 100644
> --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> @@ -22,6 +22,8 @@ cpu0: cpu@0 {
>  			enable-method = "psci";
>  			reg = <0x0 0x0>;
>  			device_type = "cpu";
> +			power-domains = <&scmi_dvfs SKY1_PERF_CPU_L>;
> +			power-domain-names = "perf";
>  			capacity-dmips-mhz = <403>;
>  			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>  		};
> @@ -31,6 +33,8 @@ cpu1: cpu@100 {
>  			enable-method = "psci";
>  			reg = <0x0 0x100>;
>  			device_type = "cpu";
> +			power-domains = <&scmi_dvfs SKY1_PERF_CPU_L>;
> +			power-domain-names = "perf";
>  			capacity-dmips-mhz = <403>;
>  			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>  		};
> @@ -40,6 +44,8 @@ cpu2: cpu@200 {
>  			enable-method = "psci";
>  			reg = <0x0 0x200>;
>  			device_type = "cpu";
> +			power-domains = <&scmi_dvfs SKY1_PERF_CPU_L>;
> +			power-domain-names = "perf";
>  			capacity-dmips-mhz = <403>;
>  			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>  		};
> @@ -49,6 +55,8 @@ cpu3: cpu@300 {
>  			enable-method = "psci";
>  			reg = <0x0 0x300>;
>  			device_type = "cpu";
> +			power-domains = <&scmi_dvfs SKY1_PERF_CPU_L>;
> +			power-domain-names = "perf";
>  			capacity-dmips-mhz = <403>;
>  			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>  		};
> @@ -58,6 +66,8 @@ cpu4: cpu@400 {
>  			enable-method = "psci";
>  			reg = <0x0 0x400>;
>  			device_type = "cpu";
> +			power-domains = <&scmi_dvfs SKY1_PERF_CPU_M0>;
> +			power-domain-names = "perf";
>  			capacity-dmips-mhz = <1024>;
>  			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
>  		};
> @@ -67,6 +77,8 @@ cpu5: cpu@500 {
>  			enable-method = "psci";
>  			reg = <0x0 0x500>;
>  			device_type = "cpu";
> +			power-domains = <&scmi_dvfs SKY1_PERF_CPU_M0>;
> +			power-domain-names = "perf";
>  			capacity-dmips-mhz = <1024>;
>  			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
>  		};
> @@ -76,6 +88,8 @@ cpu6: cpu@600 {
>  			enable-method = "psci";
>  			reg = <0x0 0x600>;
>  			device_type = "cpu";
> +			power-domains = <&scmi_dvfs SKY1_PERF_CPU_M1>;
> +			power-domain-names = "perf";
>  			capacity-dmips-mhz = <1024>;
>  			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
>  		};
> @@ -85,6 +99,8 @@ cpu7: cpu@700 {
>  			enable-method = "psci";
>  			reg = <0x0 0x700>;
>  			device_type = "cpu";
> +			power-domains = <&scmi_dvfs SKY1_PERF_CPU_M1>;
> +			power-domain-names = "perf";
>  			capacity-dmips-mhz = <1024>;
>  			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
>  		};
> @@ -94,6 +110,8 @@ cpu8: cpu@800 {
>  			enable-method = "psci";
>  			reg = <0x0 0x800>;
>  			device_type = "cpu";
> +			power-domains = <&scmi_dvfs SKY1_PERF_CPU_B0>;
> +			power-domain-names = "perf";
>  			capacity-dmips-mhz = <1024>;
>  			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
>  		};
> @@ -103,6 +121,8 @@ cpu9: cpu@900 {
>  			enable-method = "psci";
>  			reg = <0x0 0x900>;
>  			device_type = "cpu";
> +			power-domains = <&scmi_dvfs SKY1_PERF_CPU_B0>;
> +			power-domain-names = "perf";
>  			capacity-dmips-mhz = <1024>;
>  			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
>  		};
> @@ -112,6 +132,8 @@ cpu10: cpu@a00 {
>  			enable-method = "psci";
>  			reg = <0x0 0xa00>;
>  			device_type = "cpu";
> +			power-domains = <&scmi_dvfs SKY1_PERF_CPU_B1>;
> +			power-domain-names = "perf";
>  			capacity-dmips-mhz = <1024>;
>  			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
>  		};
> @@ -121,6 +143,8 @@ cpu11: cpu@b00 {
>  			enable-method = "psci";
>  			reg = <0x0 0xb00>;
>  			device_type = "cpu";
> +			power-domains = <&scmi_dvfs SKY1_PERF_CPU_B1>;
> +			power-domain-names = "perf";
>  			capacity-dmips-mhz = <1024>;
>  			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
>  		};
> @@ -205,6 +229,11 @@ ap_to_pm_scmi: scmi {
>  			#address-cells = <1>;
>  			#size-cells = <0>;
>  
> +			scmi_dvfs: protocol@13 {
> +				reg = <0x13>;
> +				#power-domain-cells = <1>;
> +			};
> +
>  			scmi_clk: protocol@14 {
>  				reg = <0x14>;
>  				#clock-cells = <1>;
> -- 
> 2.49.0
> 

-- 

Best regards,
Peter

