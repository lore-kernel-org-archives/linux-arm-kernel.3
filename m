Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADF0CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 00:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m1+pHkGLGPbN4wPcHtUhqjZGQLRShR3QHh8OhW47xJQ=; b=2QUsDFrU9mA3rVRCMMqTuZ/9qf
	M4IjSH6KWobmaH543Z2Lt5NS0o+a4e17K1kqapee8B7EY487BV0EpHGO/leVsXiTazp7l+hx//nL2
	00pqeM/ihgnHbYiCEr1OdlWj/8i2L8O0IVfx62rNNalNLmg9zArZKBBAU5/TXFCYNoEqoXjt1EfYL
	320cJ3vl3qaMWSxVOK7R+ptVbnx4Plpi+pf8CFcEsMXRglkm7jaLGMDOzzS8ve1UkM/Ab7Z4wz9Dy
	Sxyoorsm/d7dTA32qP8MsgoGbl7+tC4wbbFzODm4AkkwiaKH8oLimNc5uUcPj0T+uSU3tPUSlS+Cg
	hTkYx4Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw9Aa-0000000BHBJ-1S3o;
	Wed, 10 Sep 2025 00:58:44 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw9AX-0000000BHAZ-3CJO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 00:58:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XkjnDntiZg++R6nxg26RuJlhpu7+hgJBtDsKX+4UbcvPcVN9a8qDfkmHM0EdrDTXf+yMwntZqq6tvBqcKnpQH0H9/3y0wTj9SOQvlwyTzhiNgEIITgJvka3C68ekkfIoN+xh45Md6QMcssnnmxrVvbFz8cZu9JXsAlJvKyjB83z7IcRpEDCxvOCSZpnu4fDZpPj16+LczdAr5z9Iq+XNhyjaQOgnrDq+CzKF3D8ifuuVfLQI3O7q+rzUnvQYfv5+LPXCnN4FIuxQ4CnKA2/F1BPOBP2zEHVacQx/Sf19ERzzBnjL3wf9b8pYbs6NyNj6q9zM17WgAc85xR9QlAqRFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1+pHkGLGPbN4wPcHtUhqjZGQLRShR3QHh8OhW47xJQ=;
 b=f6LTxV6S3iCU2zmwSvDQDIlL3p2uddh944Eeipku3+WL4in2s9G8zQX6/IBeUYwMh5dgJxRK8hpMPCPIrS2bYXpxrKH4XTsmFCzQqJy/kISf8dq2tHxpYjUBDpCU/jm5mQmgbyDde+mWMTglZcoTEuSeSw6lYpuXIdzBGX1mQilQo+UsS41kEhQuNM2hluNKPaHKDIpvpAoCbgK4ktmEO8sqaW9G4jdNK3/jZEneK2ClF0LEEwDjJr5DkE3Coslk2k0xMXBKyWGtBsVVVYH0C5ir1/R1tdtqqIK6oVkuKdgeOxzIEuhOoxHniCJ6PS76KXn/YXtUXkByLd9aZ6uQsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0027.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:263::18)
 by TYZPR06MB6894.apcprd06.prod.outlook.com (2603:1096:405:20::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 00:58:30 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:400:263:cafe::5) by TYCP286CA0027.outlook.office365.com
 (2603:1096:400:263::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 00:58:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 00:58:30 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 3C90540A5BD4;
	Wed, 10 Sep 2025 08:58:29 +0800 (CST)
Date: Wed, 10 Sep 2025 08:58:28 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Jun Guo <jun.guo@cixtech.com>
Cc: <fugang.duan@cixtech.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <cix-kernel-upstream@cixtech.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Hongliang Yang <hongliang.yang@cixtech.com>
Subject: Re: [PATCH] arm64: dts: cix: add DT nodes for all I2C and I3C ports
 for sky1
Message-ID: <aMDNNJ6u8ZHldxKE@nchen-desktop>
References: <20250903084713.3221907-1-jun.guo@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903084713.3221907-1-jun.guo@cixtech.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|TYZPR06MB6894:EE_
X-MS-Office365-Filtering-Correlation-Id: c4335b3e-cb30-467f-6882-08ddf00528c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zXy8HTN3tPqof/rmt/TdmXQEp3RGwksI93C4VHd8lL7pYuzQ1YkTB1ZEedYZ?=
 =?us-ascii?Q?aJ8HCZTE65IKbmh/DB/uk4sFNyrMQ4yrLGRuYu8MwzfRqT9X86m4iEqpYAAY?=
 =?us-ascii?Q?kjKGd/leTQVI/NXykKAsGBNnrfUJBgSvnA6fTJFOEBo8BdamBMiJwECz3X5x?=
 =?us-ascii?Q?IPGnwwfRT8jowNaTeXSxVqgYrSIMRe3TEu3o7v2E4rcP1drifGb2AFViaDF/?=
 =?us-ascii?Q?DJEci3M1BsHTGgkpR+lyyqny6J9YPQZmcgEEz+2tNTFeawVWuDsX9PWHfQPn?=
 =?us-ascii?Q?i/isVJvg9H2jQOwlPtP03hRM27QFOOYqE/Vz12jtULeUW+TYymaqgwRxMrRb?=
 =?us-ascii?Q?tD+jgDAGv/Rcn/Gs3XcWZl+Jn/tCNp9nSBcYIQs91hBAqaPuoA7vn+OOzw+c?=
 =?us-ascii?Q?yluoU4t/knCLrNevIv72ndqhr9eNcIA71NYZ/kMvlc3SHnmFLqIzvHya4AXd?=
 =?us-ascii?Q?DY309XvEdx45ITSAJ41zlMrCTEVMx0GPvyvNXY/w9/rIoiIAbIfbs+AGUUG6?=
 =?us-ascii?Q?wer4GCQjhdkmengJXZHdmUdnkIHgYzFjlAS/Ej97HMBEDkDaJwFQFKiktKqy?=
 =?us-ascii?Q?cwcLJNpEnXFhMko/mp8DqxB6ePiy0eH0UhzaqZDf7eNaEV2dTu3lucIYwP7D?=
 =?us-ascii?Q?B7ANemjjeWJZq/0550kip93nch1woO8oM5jIkaO+GqK7tRhu7dMv+nCDYWfY?=
 =?us-ascii?Q?gUG99MN8/JwQVEf7Y2qmJcWsIgX5xywJnNUlr3qT+CstzB65wdJgk9bHSDiP?=
 =?us-ascii?Q?SJgvIsKhRV/OQyoRo65UeB8ZsAa296SLmXKzJzmnMHCXqIj+LYiICi92sXWx?=
 =?us-ascii?Q?M7BwhD+l+w/k1Af2IDPNwTYeOJbBbTMe0KlYSgPKE0TU7+YOvWt94wEm/i2i?=
 =?us-ascii?Q?y2bXcBNYBupq5bXNMJl+H2MketF+s4G7iFhLQu2FcBWaHkUCcVzQzGVV0MKw?=
 =?us-ascii?Q?dwJUYEFswrxW39O4L8XGQ1IZY7l+hwY+VMraewPD0n4zr+tecxh2jyi1C4Ek?=
 =?us-ascii?Q?tOTKAVhNe80L5lGWVzYh5A8Mi9nDIYNeKYV4u/n85IU9bw235kyIYfecNNP/?=
 =?us-ascii?Q?+rOu4695kE9+T06ZsZdv32DOFlYqzH2cWPcqEImKC2NLrtiqO+sGhKGfVm+c?=
 =?us-ascii?Q?kySLh2dyu3DqGXTvqEM9fODgMQzw8mIKNA2GNyFO9ui9oI/PiYB5qOCYXhax?=
 =?us-ascii?Q?QwDne4mHUlxbGDX+bBFcik8Ujszto120V2UC+F0nS7O083X/R90JppAGyAHF?=
 =?us-ascii?Q?pNvDdVVVYRWfFBEyInB5u2XfivR+ME0uK+CJuhYWTUOGvkuRz8JbjaXJ4RES?=
 =?us-ascii?Q?ygT5L0dMEVfw8fCXyL4/I7Cq1TVSfm3w0oQq3bAIloVeEsQOAlIklxORBen0?=
 =?us-ascii?Q?6vN4TAu0myPmhjDyhx7GGQlS1qul8zDGGHUiI44OFpKYaEgZumVsF5S9Hijw?=
 =?us-ascii?Q?Texi9YzQsBbHP6R8ElqSUkbHFIDL3hUsdQTXPriALkBS2wtgWwHFT/8lsMc0?=
 =?us-ascii?Q?bVmBoVBrncA2gC7cZJaZ9mvErCj3UeAPjMCh?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 00:58:30.3432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4335b3e-cb30-467f-6882-08ddf00528c4
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6894
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_175841_806592_F1D1CD08 
X-CRM114-Status: GOOD (  15.39  )
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

On 25-09-03 16:47:13, Jun Guo wrote:
> From: Hongliang Yang <hongliang.yang@cixtech.com>
> 
> The CIX SKY1 SoC supports the integration of 8 I2C bus controllers and
> 2 I3C bus controllers.
> 
> Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
> Signed-off-by: Jun Guo <jun.guo@cixtech.com>

Applied, Thanks.

Peter
> ---
>  arch/arm64/boot/dts/cix/sky1.dtsi | 100 ++++++++++++++++++++++++++++++
>  1 file changed, 100 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
> index 7dfe7677e649..2fb2c99c0796 100644
> --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> @@ -192,6 +192,78 @@ soc@0 {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
>  
> +		i2c0: i2c@4010000 {
> +			compatible = "cdns,i2c-r1p14";
> +			reg = <0x0 0x04010000 0x0 0x10000>;
> +			clock-frequency = <400000>;
> +			clocks = <&scmi_clk CLK_TREE_FCH_I2C0_APB>;
> +			interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH 0>;
> +			status = "disabled";
> +		};
> +
> +		i2c1: i2c@4020000 {
> +			compatible = "cdns,i2c-r1p14";
> +			reg = <0x0 0x04020000 0x0 0x10000>;
> +			clock-frequency = <400000>;
> +			clocks = <&scmi_clk CLK_TREE_FCH_I2C1_APB>;
> +			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH 0>;
> +			status = "disabled";
> +		};
> +
> +		i2c2: i2c@4030000 {
> +			compatible = "cdns,i2c-r1p14";
> +			reg = <0x0 0x04030000 0x0 0x10000>;
> +			clock-frequency = <400000>;
> +			clocks = <&scmi_clk CLK_TREE_FCH_I2C2_APB>;
> +			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH 0>;
> +			status = "disabled";
> +		};
> +
> +		i2c3: i2c@4040000 {
> +			compatible = "cdns,i2c-r1p14";
> +			reg = <0x0 0x04040000 0x0 0x10000>;
> +			clock-frequency = <400000>;
> +			clocks = <&scmi_clk CLK_TREE_FCH_I2C3_APB>;
> +			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH 0>;
> +			status = "disabled";
> +		};
> +
> +		i2c4: i2c@4050000 {
> +			compatible = "cdns,i2c-r1p14";
> +			reg = <0x0 0x04050000 0x0 0x10000>;
> +			clock-frequency = <400000>;
> +			clocks = <&scmi_clk CLK_TREE_FCH_I2C4_APB>;
> +			interrupts = <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH 0>;
> +			status = "disabled";
> +		};
> +
> +		i2c5: i2c@4060000 {
> +			compatible = "cdns,i2c-r1p14";
> +			reg = <0x0 0x04060000 0x0 0x10000>;
> +			clock-frequency = <400000>;
> +			clocks = <&scmi_clk CLK_TREE_FCH_I2C5_APB>;
> +			interrupts = <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH 0>;
> +			status = "disabled";
> +		};
> +
> +		i2c6: i2c@4070000 {
> +			compatible = "cdns,i2c-r1p14";
> +			reg = <0x0 0x04070000 0x0 0x10000>;
> +			clock-frequency = <400000>;
> +			clocks = <&scmi_clk CLK_TREE_FCH_I2C6_APB>;
> +			interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH 0>;
> +			status = "disabled";
> +		};
> +
> +		i2c7: i2c@4080000 {
> +			compatible = "cdns,i2c-r1p14";
> +			reg = <0x0 0x04080000 0x0 0x10000>;
> +			clock-frequency = <400000>;
> +			clocks = <&scmi_clk CLK_TREE_FCH_I2C7_APB>;
> +			interrupts = <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH 0>;
> +			status = "disabled";
> +		};
> +
>  		uart0: serial@40b0000 {
>  			compatible = "arm,pl011", "arm,primecell";
>  			reg = <0x0 0x040b0000 0x0 0x1000>;
> @@ -228,6 +300,34 @@ uart3: serial@40e0000 {
>  			status = "disabled";
>  		};
>  
> +		i3c0: i3c@40f0000 {
> +			compatible = "cdns,i3c-master";
> +			reg = <0x0 0x040f0000 0x0 0x10000>;
> +			#address-cells = <3>;
> +			#size-cells = <0>;
> +			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&scmi_clk CLK_TREE_FCH_I3C0_APB>,
> +				 <&scmi_clk CLK_TREE_FCH_I3C0_FUNC>;
> +			clock-names = "pclk", "sysclk";
> +			i3c-scl-hz = <400000>;
> +			i2c-scl-hz = <100000>;
> +			status = "disabled";
> +		};
> +
> +		i3c1: i3c@4100000 {
> +			compatible = "cdns,i3c-master";
> +			reg = <0x0 0x04100000 0x0 0x10000>;
> +			#address-cells = <3>;
> +			#size-cells = <0>;
> +			interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&scmi_clk CLK_TREE_FCH_I3C1_APB>,
> +				 <&scmi_clk CLK_TREE_FCH_I3C1_FUNC>;
> +			clock-names = "pclk", "sysclk";
> +			i3c-scl-hz = <400000>;
> +			i2c-scl-hz = <100000>;
> +			status = "disabled";
> +		};
> +
>  		mbox_ap2se: mailbox@5060000 {
>  			compatible = "cix,sky1-mbox";
>  			reg = <0x0 0x05060000 0x0 0x10000>;
> -- 
> 2.34.1
> 

-- 

Best regards,
Peter

