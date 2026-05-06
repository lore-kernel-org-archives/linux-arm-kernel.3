Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F9ECD342F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 01:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+kSzB09yTbc35Xjh5K3HYp/b9j7X9OVMBfU1bBLn1E=; b=nfnz4TAVBh8D+HrUEtAuEt8aVJ
	petG/2RZkqayjbQdSanf+MVxhM5AgoMa6Wgdp0GXQkr+IvYOBy2hu8HFhSXlFynYPhYMfYNI5Sjfw
	9IXDp7GwHZCfSxrlx+z7f2+HRkwr2Pi9mSEnnd9oq3S0H6egp4AO0intf/zKKkM3OUtxSwqRmvJHu
	UvZKQfH7c358jNw6U9EYULiTqLzTUE5EEvt/3VfTDBGJ0kUB3Q00NC1LU7T6E10zvkOg5aSllGXe8
	7laRMkEFwe97E+yOQKoauZlg8Z/lgSoiAIJOpK3WRQ1gKv19P3s6x3M/+sIwpap1K8SEWd/kM9Vis
	s81lDzlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKR0M-00000000Onb-0X7M;
	Wed, 06 May 2026 01:24:50 +0000
Received: from mail-japaneastazon11023087.outbound.protection.outlook.com ([52.101.127.87] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKR0J-00000000Omj-0CdW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 01:24:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLwTHvKJUuZO8mMMrQDUL+VZ46Q7yIvszkKexK73qGJCHgBfRuTh+0Y8h1nll22nwRg+/3cboZkOMIg3msA/p8xh+IMxCxwz6E0CC8Fz4489f8h+WI9rvAdhnNS9osU+mmUUvyh9LzczDhsXFd85lWaIA4QziQIWTHC6YSp3QpJKT4v1G1nOjCz96GpTGFEuAx+wM//J+HbOX2IQKNUHQAC8vi25nNtD+SuyZEfFXQ6iYoufpKy8mdohf1YVEQEHQv1GgUnBYadOXk47pHT9prwRrhQ5HKOaC7lGaKs4Rq7fnrN22hIGWeF6gDiGzCfq5UR3Px1a1pJ3Dw6MNRR7vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+kSzB09yTbc35Xjh5K3HYp/b9j7X9OVMBfU1bBLn1E=;
 b=S6T3ysdT0BuAHoAeRBZ7tfLlFdkypQIyhOxZ3ZmnNzytb8r32nGI7fx5IwRhrLLytggRKM2KBm8MqXNAo38GIuu8PNBGb271CZNQbP9rnxt2QJEGVFRUhnxYy0Lnav+PxMDAG27lPVkMjGBF761cOWbZzRSo5qXPgB14Fqp/ToLaAerr/2JTwSNrCrm54rwmom1nlXAAiNKcczX5s5BjChQ43umYev0ekPcv8ZxXE/CEbU+4UOxC7b6wF8J+GK/A2IN44pDYqI4Bo4CMvoMuCrMKmeWLPWCAywZsyl0sWZ0HOA6ZGXcgzOwUWOs7iVgUw3M2KMR+SWIQFXsV9HzgBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR01CA0152.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::32) by JH0PR06MB6797.apcprd06.prod.outlook.com
 (2603:1096:990:2f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 01:24:24 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:8f:cafe::e) by SG2PR01CA0152.outlook.office365.com
 (2603:1096:4:8f::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 01:24:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 01:24:23 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 495DA41609C1;
	Wed,  6 May 2026 09:24:21 +0800 (CST)
Date: Wed, 6 May 2026 09:24:20 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Devin Li <Devin.Li@cixtech.com>
Cc: fugang.duan@cixtech.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, guoyin.chen@cixtech.com,
	robin.wang@cixtech.com, hong.guo@cixtech.com
Subject: Re: [PATCH v1] arm64: dts: cix: Add SCMI performance domains for
 CPUFreq on Sky1
Message-ID: <afqYRK+1oB+SZDNe@nchen-desktop>
References: <20260430113559.3102436-1-Devin.Li@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260430113559.3102436-1-Devin.Li@cixtech.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|JH0PR06MB6797:EE_
X-MS-Office365-Filtering-Correlation-Id: ddd49f36-a097-49a1-615c-08deab0e34b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: qCpXgKZ19D5aQKrGJC1E1qS4+vD4m/CRAsNhEi7d4HP/ZoMcG8mCWCPSD3aGcYjTcxWSaYz4ZE1vbpSnnpRtLU60WiBYJyQYfKyj563p8tZ14LqogWW7BLn0WB3Lnd/8EyVLtwAhYrc7D826vwvJqCmHTkPnoZjMSrcE0WiEgnHcA1P9okzqXG6Q6fFjSoi7S+MZXDM3olIDnZ2BQ03Hk+qK+0DEaEIGmiRE0LonJOxDWf6FJPiYlycuDncy5dwbCiEgO71ZDkHlWIjAQuFepNXDLgBun666zMcNI5RR819/BV4ftyireS6gG7a7snsQ9oZGQtwPJTfhBvNIF8zfCvzdW8xaogj1j9cPJ9cdiW+afAKcTCrMRHP2iKz1Nz6XssDo3ZVi11LfxcTLbrR1g02jfUdQo+xY6n6RzgSnd6qpwsukbvHYDotNr9gtwnfWV8ZOtbObb/HkNC2ZdT43wXaGZ+3dXpBXkifi9te4vubpx8/8D7TxjWDDQOHPRz4G5NVLZinqgcXqqxQ9eaTucz+Swt+TapAnxa5p+opT4UHl/k+OJfJk+JIP5Ltnt7IClZIJEkLdi9MdUeeMJ4L8HoQI9HbMLXhBeu4XDCzlV1EY6sYTmoa56uFQaX3O/c8u5XFxjSadOjRniA44lMgN3jKxn8OwLSi9k+HALxj2k6lNFvhTdBCQx2HA3JJXqIU+UqLsnF7vKacj6rk0f2FBIl1ptm2zzwWu22LqmH8P3Tg=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Q0G51N2jTFjs+mt86shGN51ZQFAroJxhA1XRTrJyzf/m1YBYpfA19VjAC7pAOFBPONJzjgqoNldDn8RwwAWHQkeGx3MAJ6z/mRO2+cLWLaFdaadmcFSaj7Zd9HVH6WLe65C1yMd2aNkAImM2GSQrdBHjs7o3ZURAX1JuOTefaAUnk8X7eXCbFhiu1PLhpg5jnrDExL1TqQVaj6OzIEX8oxKrkudhfbg9YcQVhrB8fKnU71651xe2xqLOt7itekXIdQWMOTlF4ctXKYNKr5fNqXO5pPuy28VZHNZxyYo2/1TpFbei8OceRynxmekX1KGWNhgbMnXGCe7Uoe90kDN5JWuppFJxxyypSaHnIZPCYtKKSibdQhldL//5waKVk9yZr+vyUXhIsPjxMBoHobgFUFZNEgqaQdjSPgqPuzCajcUIWlt1KC5gFh7u4IKoJwjr
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 01:24:23.3393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd49f36-a097-49a1-615c-08deab0e34b4
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6797
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_182447_102176_2D953B46 
X-CRM114-Status: GOOD (  15.36  )
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

On 26-04-30 19:35:59, Devin Li wrote:
> From: "devin.li" <Devin.Li@cixtech.com>

Please use your real name

Others are okay for me.

Peter

> 
> Add SCMI Protocol 13 (Performance) node under ap_to_pm_scmi with
> domains.
> 
> Define SKY1_PERF_* macros in sky1-power.h for all performance domain
> IDs (CPU L/B0/B1/M0/M1, GPU, DSU, NPU, VPU, CI700, NI700), and
> wire each CPU node to its corresponding performance domain using
> power-domains and power-domain-names properties.
> 
> Signed-off-by: Devin Li <Devin.Li@cixtech.com>
> ---
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

