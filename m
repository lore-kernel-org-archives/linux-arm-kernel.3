Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B673CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 03:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qBmeSyo8Qy1kGczm+FHDdZi1wa6aiGp/ZaHpAgwmdZ4=; b=UCYWiNB/DqjdPkLFM+R6R6VfWo
	awtdyfdEZhvjqWa4MOJ1lMltdnvzLOz4uAUfCB8LU1E3pyFYX75IsWJJDXo9fkrJRanobbKdmQX74
	Re8x4N7iVGdrrfcp2K+ii1JFO25yR0US/GW+dgStzdnMnxs/Oz8sKyVuFHVrjT6IApVh4ern+fXsn
	Bzod+GDecAi5HqyvIt8wGwHK2up/WDqmimupNDvsh0PK5JLlQt//JT8S00gagpFKt3HiClAAttJ7k
	Q9brihJpTuA5wSHIklE+DZdQ973vb4R7ibdPiEUO0tNvJOulrudmIYkEUPfovAg2NMOKjIkoeWu0M
	tdR7Rwjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHU1-0000000CBvl-3ZoS;
	Mon, 11 May 2026 03:39:05 +0000
Received: from mail-japaneastazon11023121.outbound.protection.outlook.com ([52.101.127.121] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHTx-0000000CBu6-2QWq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 03:39:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ha6J9NO7T8mpwA1vEZgCwmDg1uV+ugK9w57TxkLHp07qAzru45Ke4rQdmOk/7EB2BC9B9VoOYjuP5oc7M3vFjyznhG9XUZZd+I0H0km/V0RXT4zeHK31E46/ZsHrHbNG5b+iI3UuHDPb9aALRa7eNoSldDH/k7ICcm1ziu9El317RRtAbSbQ0nkfS3+US2aarE5vTMq88pouhTufI1I4G7QtMvo9sGq+SLOJoC3KZ0Ipn2gQfaqvhev/GNiBl4h6MiFDPRAoyP2LBcVBj7/TaOegEpn59ElrEBjp4G88ZdIad2q8kC9/y2+/4WjEICAIL1uB8QM/AqcSKMbYleZ7gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBmeSyo8Qy1kGczm+FHDdZi1wa6aiGp/ZaHpAgwmdZ4=;
 b=IBB2dUH+DFw9lBc+HKoZUvGP4hL3c3PIquNuknhGYgS6P2p5s0Is8cYN08JFTjrwavOQfHD7wfn3fq4dUvBDpwkCIE2ySQfjp/OOvMfbdn5Gd9smBJLiFWwa7G5GecFjoBJqWqRBJ7+ZXhqXd1z+4KHFTodjR0cjj519z6EddXUDDU/Cz8vvzsD7bTrRtE9LyDJp+JRQxh2X+sPwzBx0NMQPLazaDWJPB1loyCy5BT90oZd2h/e70NJsxTPoM/Pn0rwayoznXOHTvc8XOATaerofNeCP26/7bAUWKSxRroW6rwcTsWlvc0Vp/xzo9Z4UDutUTP/U5yB/Pm01snPuCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0057.apcprd02.prod.outlook.com (2603:1096:300:5a::21)
 by TYPPR06MB8104.apcprd06.prod.outlook.com (2603:1096:405:313::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 03:38:43 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:300:5a:cafe::7e) by PS2PR02CA0057.outlook.office365.com
 (2603:1096:300:5a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.22 via Frontend Transport; Mon,
 11 May 2026 03:38:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 03:38:42 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 3380841609C1;
	Mon, 11 May 2026 11:38:42 +0800 (CST)
Date: Mon, 11 May 2026 11:38:41 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Devin Li <Devin.Li@cixtech.com>
Cc: fugang.duan@cixtech.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, guoyin.chen@cixtech.com,
	robin.wang@cixtech.com, hong.guo@cixtech.com
Subject: Re: [PATCH v2] arm64: dts: cix: Add CPU idle states for Sky1
Message-ID: <agFPQdLVTETg4Grn@nchen-desktop>
References: <20260507065956.3900087-1-Devin.Li@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260507065956.3900087-1-Devin.Li@cixtech.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|TYPPR06MB8104:EE_
X-MS-Office365-Filtering-Correlation-Id: 462a5b80-19d2-44aa-9314-08deaf0ecccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: QLf60nF4ZTA0SklLtW0lh1pmuzgsWHkokc+VE/FdkmN3E+oaII42RNEJqN4C1FTZ8mHpxzxv0LlO5psdigj5hZ+GdETrHWJloesk+P764pKPlyrjBEMzIeeOSS0Ur2UTVRnPqEMnLTV9+S6sSYwZFA09RKBODzS8h1YkC9ZlpyykA3enddI6ole0sSM/eB9r66OdAmn0Q1UrmJnzn/+Mrj/2/nSRFMWm3ICmherpJ+zdBBopqgY2RGKzftqeSDU0+8Eb89mR4yjZKYbp6OqwL9c0T/hTI9ufEDds5z9p8KZD10EC8Bw7YbPSQ9T7dEf8tZ2pPjgFxDGPKM2gFB92MCbL1cYYIR3mo/e01fZSDp7B9wq+CrY0d5rr6ecix28EpxBlJ4gRJXnZnm8+vmtbkUgXmrul0RbmYZni6sAA0SAf65ccju1WUSducTtwbsgze+iceDqBOqmxd6JDd5dUPJinp3L5N2mUOq4wkv+U727eLn95FSEJtVSQVQlcwwC75cQtdsAa9htYuLP+eIhxXlPKvygvywTr4l0zA4mrE/Y8bjJVwlRkdXh+hK+AQjEHp9BJ8pTZ0wA8tNhzZn9ng5jU1bqdGvcjop/OeLkvRIdr+FPPp2dwEYuj/kD2w3yBrqXnFyhxEn6mi+g8RL6YXPDFJutAMFR3rwbDqteNsX0CmfoYKj9hOdXPflKMyrzDMYbLtgmf0IGz0TRLberLOBh+pwQZGAH8GXOYRBAQA9w=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SU6KYWb7CitwyzTWH1kxugZXqiBQVOYJUcX1us5ugi5lxARdBrejCCHkiGIeTGQzO4W89X47YeC3Z2KarcEBY+a1g2HIQi9dMxfWzdTmFC19ZDRx8BO1OdelqmfaTcRn74xFHP3+qsSB0Z2JDzi26Rkba3zUB9y3e8ED9Yp6oRFnyDG/+HG1XUtWEfVsdAqtvDiFJgT+Od8bJS3owFwazYmrxGYfO5y4FRGyuYcau5VXFJybWazwN/PhYNlUvDhbXg++W8ucmh4LtC4mYTjrPV0f3f5fcq7dQ/401Ye1EUej5WOsWzAGou2RVlFjpmoVZyg/DZ3KGwvJj4U0Ds65k3nKC2jhO9Ksdw0IS13cTgWjLGfoTBXj+0TDNcWLI9wyqi9cKO6Nexs5oUkx6vgGdG8nOneQ6Txarc7UDukzvmTtd0zOc0/dLI86MQmffX79
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 03:38:42.9912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 462a5b80-19d2-44aa-9314-08deaf0ecccb
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR06MB8104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_203901_621195_C12E8F8C 
X-CRM114-Status: GOOD (  16.48  )
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

On 26-05-07 14:59:56, Devin Li wrote:
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
> Signed-off-by: Devin Li <Devin.Li@cixtech.com>

Applied, thanks.

Peter
> ---
> 
> Notes:
>     Change for v2:
>     - Use real name format "Devin Li"
>     - link to v1: https://lore.kernel.org/all/20260424043436.162009-1-Devin.Li@cixtech.com/
> 
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

