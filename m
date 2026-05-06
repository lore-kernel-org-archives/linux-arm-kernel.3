Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FE0CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 08:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Gz9LrNuXmPX7i56LpJwSIybo15/XFxSCx2ah/fZHgY=; b=kxNU/kPWtsPYpA47++LZqmAYa7
	8KJ2QlXhnTIIMMp3O5RM52DPzOST+9RK2xGBlJVGC5C9C9UmTd2UzR9h2K/NgoObAlPpuH8Mz/MyN
	rI7LPqXS0KMTdM/3wC6Vhzlf7yv+54OgN7Fk4BnovFoakziWTc0dOZIPLoDeFAgrh8V/gevbf3ur1
	84sj51WsDoeJILTRhFw/MLxuEQsPeFV+HxYEIHZUhubPa96oAo96vQLq5Sadk0/9jCOSamAkX5YrL
	dbKZIFLMEYjMG5BNHkz0bToj73nbddtRamuSmV1YeYvRXm9VRHrSOuz7SE8P+4pw7wJCSVrqs64Ow
	Qu3bRJTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXcp-000000009qU-47VS;
	Wed, 06 May 2026 08:28:59 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXco-000000009pw-0uDu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 08:28:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnyTNe0QKcM5ZyvR9/BsBlyGNe3T0bH2YC1ZIctXZyt9rfWQjpOAShUJD9oRPBfrkoAatQRs/vWP8zVV2s4YWKSEj0K3eZox0aNLmkx0a7ccT/cV9YtBFhPbMdPxyeIa8p61gca4Qt0MU3eRRSGvMi3ht9oRVhi87LBG/+GaBkcoLLUd/KSl8QoWtPf9EuYjHZp1iDjq7p5EZ1uQL96ZCBo/41wzeKW/MRpjRcOq9dX49MDkZMB9YQH7LZYmYb4QJMOm+Ku74SRXx8AAX0es7hwTBp5tlKl8MS4wht/oLYMn3kVciQtlRjXLZBaSNahfWZi9sf2inIqvTYjl4+nM9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Gz9LrNuXmPX7i56LpJwSIybo15/XFxSCx2ah/fZHgY=;
 b=WHbolJSSwGIBrV7vKl6rBIB0d99RyhAGUBkw918maH72PIuaOFfVZGRHPaggJUDo0VCSAqytZsnZt9pl8S7h/yu5QyBPcSu4ZBAZKmX9BVSclY3pGvb/r/OgnRFwM2YAwX5QTtjvmRY73QvSLCHtMyYw0F1R3SEHYWYP7oapwr4tfi6p+wR3J9l9xXAz4eYcGM7Eu2pWOERMDrENCx15MSiSsFNPoKzhAvT77G1eLY9xYQJl3+aVswclF/ptYFW/7GsJrpEo3qWz357NcqIQvxtSRj2rKB/3WJjISc6qkNojYID0NbSYXBsUlcswXFcaoZxNdQrUBS6VDEIO9XjDug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR04CA0016.apcprd04.prod.outlook.com (2603:1096:4:197::7) by
 TYZPR06MB6306.apcprd06.prod.outlook.com (2603:1096:400:41e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 08:28:38 +0000
Received: from OSA0EPF000000CC.apcprd02.prod.outlook.com
 (2603:1096:4:197:cafe::34) by SI2PR04CA0016.outlook.office365.com
 (2603:1096:4:197::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Wed,
 6 May 2026 08:28:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CC.mail.protection.outlook.com (10.167.240.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 08:28:37 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 7E51441609C0;
	Wed,  6 May 2026 16:28:36 +0800 (CST)
Date: Wed, 6 May 2026 16:28:35 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Devin Li <Devin.Li@cixtech.com>
Cc: fugang.duan@cixtech.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, guoyin.chen@cixtech.com,
	robin.wang@cixtech.com, hong.guo@cixtech.com
Subject: Re: [PATCH v1] arm64: dts: cix: Add CPU idle states for Sky1
Message-ID: <afr7swMm0gPM4q2p@nchen-desktop>
References: <20260424043436.162009-1-Devin.Li@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424043436.162009-1-Devin.Li@cixtech.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CC:EE_|TYZPR06MB6306:EE_
X-MS-Office365-Filtering-Correlation-Id: 503d89dd-e555-4507-a375-08deab4978ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 3qFcJqCWEOdNNhHsJOzxhtzPl4XYBRcb8jiptH5BsLbrJUELCGpQLEL2p+Kk9cC5oTqLmtNqceG20suVsKWf6r0KgwYWZqM2couBoZbRUb/N245HNqYCQggemIgYuZrJw6yKbYlE3bNK+gBYPzTZ9oMnupMyCdfXPzVXaWI/D7vQZMD7Ai6FD2mqboR5xuYysRn3kmbQN3BURyp0dlBydzAALGOGv38QHju076YPajXWdwyFBuETppuo05BbR7G0M1xcB5KCTntG1sRJQhAaI3mEmwFXkMWUdLfyoX6XS38IZ+qHMiDw7AP6D2a9IN/pNjbeDgoeF2sM/BiCAvX9/Eq+qC20m7b/IfPlKD1N1xhor/pAo0WFp+Ru5DhIYu3EfayDwocaUk5mYXyHwuQlOlXm11G57qCpVg2f+ObXIrYW581xu5m4aeBm7gJBMsFgGJRlS5ANFdPyomxMPcQjP6UeJpIDLpUSG3+3ck4hSAsYCOZqYL6QZcb4xxeRccTsfenNsvORtUuLCVAJ4ulE4zmTmdgGNu7Ek6HmZ0LMBg/i7RHzhagdkt19EEGZQBOOeEUn8drn6tHuZuNioD7mgYQ55XC1tg+0de/IlPaqoagh17Zffc+ltJaRUcJCTAIKthcM86rQ4AvVuPaHZ4Q/IX3gsx1D5klF8OnwX2teAPurL+JRiEzvrn6wHdcv12R2rXpEucZ5Jah7eRCx+HAPa0I1p4wKYafnMllJmMVnDvg=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uAyS+QtUrKovOtUuI7droYD53zHqBa1YqCrCu5KHLMfo19d5U4W8JPy8elExYxDFvd4pgBV6/8Yyi5Ag/xlFN2/l265RlsP+Xxh7R4C43OpA3lixLR8HdPNRzRjSblwThVRucpbW4rIDlaziWf3HMzbMVetYi4cQpPjzr3042saBc3rUQDx6R8ZEhFyuBJYNq96xp8qcm/b/DzbRStfBfxp8UmnjY7TH4faFd6pEgQvM7pTrd3AAvXnoA4J6flJCfVLtR04aTIGaKf4jIBAa6tyay3VNlMkj2KGF3I+FQ9sM1T9JbD8igEDlVSxfVYkpPuo6v+u3Uop567jMOqxY1xJVsRuht7/K+6NNXYoluTD41oinziWkeEU995TbIDB5NXnsViYqqui0WDZETjionOvFO/wSf8+xUf4mwHTgeAoGHveVM/X5ZmiaXf9JAOCY
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:28:37.6588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 503d89dd-e555-4507-a375-08deab4978ae
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CC.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6306
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_012858_256242_7017E046 
X-CRM114-Status: GOOD (  16.87  )
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

On 26-04-24 12:34:36, Devin Li wrote:
> From: "devin.li" <Devin.Li@cixtech.com>

Please also use your real name.

> 
> Add PSCI-based CPU idle state definitions for the Sky1 SoC,
> enabling core and cluster level power management through
> ARM PSCI firmware.
> 
> Three idle states are defined:
> 
> - CPU_SLEEP_0: Core idle state for A520 cores
>   (psci-suspend-param 0x0010000), entry-latency 34us,
>   exit-latency 100us
> 
> - CPU_SLEEP_1: Core idle state for A720 cores
>   (psci-suspend-param 0x10000), entry-latency 31us,
>   exit-latency 79us
> 
> - CLUSTER_SLEEP_0: Cluster idle state shared by all cores
>   (psci-suspend-param 0x1010000), entry-latency 41us,
>   exit-latency 104us
> 
> A520 cores (cpu0-3) reference CPU_SLEEP_0 and CLUSTER_SLEEP_0,
> while A720 cores (cpu4-11) reference CPU_SLEEP_1 and
> CLUSTER_SLEEP_0.
> 
> Signed-off-by: devin.li <Devin.Li@cixtech.com>

Ditto

Others are okay for me.

Peter
> ---
>  arch/arm64/boot/dts/cix/sky1.dtsi | 41 +++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
> index bb5cfb1f2113..0611098b5f05 100644
> --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> @@ -23,6 +23,7 @@ cpu0: cpu@0 {
>  			reg = <0x0 0x0>;
>  			device_type = "cpu";
>  			capacity-dmips-mhz = <403>;
> +			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>  		};
>  
>  		cpu1: cpu@100 {
> @@ -31,6 +32,7 @@ cpu1: cpu@100 {
>  			reg = <0x0 0x100>;
>  			device_type = "cpu";
>  			capacity-dmips-mhz = <403>;
> +			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>  		};
>  
>  		cpu2: cpu@200 {
> @@ -39,6 +41,7 @@ cpu2: cpu@200 {
>  			reg = <0x0 0x200>;
>  			device_type = "cpu";
>  			capacity-dmips-mhz = <403>;
> +			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>  		};
>  
>  		cpu3: cpu@300 {
> @@ -47,6 +50,7 @@ cpu3: cpu@300 {
>  			reg = <0x0 0x300>;
>  			device_type = "cpu";
>  			capacity-dmips-mhz = <403>;
> +			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>  		};
>  
>  		cpu4: cpu@400 {
> @@ -55,6 +59,7 @@ cpu4: cpu@400 {
>  			reg = <0x0 0x400>;
>  			device_type = "cpu";
>  			capacity-dmips-mhz = <1024>;
> +			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
>  		};
>  
>  		cpu5: cpu@500 {
> @@ -63,6 +68,7 @@ cpu5: cpu@500 {
>  			reg = <0x0 0x500>;
>  			device_type = "cpu";
>  			capacity-dmips-mhz = <1024>;
> +			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
>  		};
>  
>  		cpu6: cpu@600 {
> @@ -71,6 +77,7 @@ cpu6: cpu@600 {
>  			reg = <0x0 0x600>;
>  			device_type = "cpu";
>  			capacity-dmips-mhz = <1024>;
> +			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
>  		};
>  
>  		cpu7: cpu@700 {
> @@ -79,6 +86,7 @@ cpu7: cpu@700 {
>  			reg = <0x0 0x700>;
>  			device_type = "cpu";
>  			capacity-dmips-mhz = <1024>;
> +			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
>  		};
>  
>  		cpu8: cpu@800 {
> @@ -87,6 +95,7 @@ cpu8: cpu@800 {
>  			reg = <0x0 0x800>;
>  			device_type = "cpu";
>  			capacity-dmips-mhz = <1024>;
> +			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
>  		};
>  
>  		cpu9: cpu@900 {
> @@ -95,6 +104,7 @@ cpu9: cpu@900 {
>  			reg = <0x0 0x900>;
>  			device_type = "cpu";
>  			capacity-dmips-mhz = <1024>;
> +			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
>  		};
>  
>  		cpu10: cpu@a00 {
> @@ -103,6 +113,7 @@ cpu10: cpu@a00 {
>  			reg = <0x0 0xa00>;
>  			device_type = "cpu";
>  			capacity-dmips-mhz = <1024>;
> +			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
>  		};
>  
>  		cpu11: cpu@b00 {
> @@ -111,6 +122,7 @@ cpu11: cpu@b00 {
>  			reg = <0x0 0xb00>;
>  			device_type = "cpu";
>  			capacity-dmips-mhz = <1024>;
> +			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
>  		};
>  
>  		cpu-map {
> @@ -153,6 +165,35 @@ core11 {
>  				};
>  			};
>  		};
> +
> +		idle-states {
> +			CPU_SLEEP_0: cpu-sleep-0 {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x0010000>;
> +				local-timer-stop;
> +				entry-latency-us = <34>;
> +				exit-latency-us = <100>;
> +				min-residency-us = <3000>;
> +			};
> +
> +			CPU_SLEEP_1: cpu-sleep-1 {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x0010000>;
> +				local-timer-stop;
> +				entry-latency-us = <31>;
> +				exit-latency-us = <79>;
> +				min-residency-us = <3000>;
> +			};
> +
> +			CLUSTER_SLEEP_0: cluster-sleep-0 {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x1010000>;
> +				local-timer-stop;
> +				entry-latency-us = <41>;
> +				exit-latency-us = <104>;
> +				min-residency-us = <4000>;
> +			};
> +		};
>  	};
>  
>  	firmware {
> -- 
> 2.49.0
> 

-- 

Best regards,
Peter

