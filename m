Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C70C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y6/OuiF3EVS++6wyCQZUZdqgy9pv8KIXpYmHHOr78os=; b=r8ZFbOhgB8pb735zNRlNBsQjEP
	gvAEvLi7ksyJdRYNCn3JzjC6epZzucesBLGsVHPKL0N1bx9CXVMCDl4C2WJ4pXlipREUtpcZiLcV/
	ijI+QNa4bcvvW5B2oaXTSAWE1O6wh/74Ox6ZGvOD5k2R2arCj7dpdynjNOLHpeyya41AHz2thsxOd
	ih36kyOFEL1woFQTbqMzq3mF0MoV96TqOqTI4F2HaiQw6yPUM6toZKSnaGteO7Wg810nM2+xm8vFA
	gsKHRgtbA5LlFb7a2aNWM3TluSEOxZ+sVeM3KeKw91OU3J2KaGzQeUjKjxhkx5q4c2n8TZm0qF+Cn
	8xTrrpcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis32-00000006qz0-1YDh;
	Thu, 22 Jan 2026 10:36:20 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis2y-00000006qyf-27gS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 10:36:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bLfkT7rXMVa2jcCYPvmiaPp1aRxnBIBAJ3BcWMbPrKRo2xW8hhVprPr6DxCT6JvGtKRvOJrxH53Iyiv5cgULPSh8dSVkq+jzU2siZB64Rx5h7WFyI8ufDZ/jFhKGskDlk9xmuW/sZIeifD+PcA2gqNqz6uLP8ruMx29zTG93IDiu5s537Io0lkaDYPGbWIG917Yhtk7mn5wCOdrxm0ONoPbuoF9KOFpVRGbsxo4plpgYuUCotmIvsY53I2fUcxReG7rYiWcq4KeTOK/I3/pc35D8KtDq845y0rJqkgcwEEpprOtFIHooHkQOuRZTvfHePY717PkBHJxubK6HcnfJGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6/OuiF3EVS++6wyCQZUZdqgy9pv8KIXpYmHHOr78os=;
 b=kPCYhq39OBZltYLmYBRLlR6xYEjotOVruoMesfsZkalWMfdUPUIdfsrGsX+tdxePw6jErKD2p85xDmnBB0X8XgWJVX5aXy+S1IYLvgR/QJAQYTn2V8M7yo91s2EmXZVxeVlH/ZIBJmr7jM5evmSn5gFcjSeMHXUTzJwh8ld9diKaqwRNeYnzidrxewoKKtXh+/osiw+/1EGWms0XduvMkqnPD7g/nsvppitrozC5wFwnZ+kz4Irud6AAVfBLD1eOmaU1jD5KEie3gFtkei+4xCngOvc2AZzpXDodbxScwXGfWTqkMf4rBxHwaL+phwKGZfiGq2RreJJLaCBfGBi/2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6/OuiF3EVS++6wyCQZUZdqgy9pv8KIXpYmHHOr78os=;
 b=Y1PjLB316w1zBfGl3sdBApowd07OP5vG3GeM/CSfvdEW1I3n7l3rppVdXXafjT7Sw8O/ql9FaOwh57bRSbbO6spKsyrYzXauuy46Xw/K0M32tTzyykGKVG5t5f6Qq6L7AJKwKM+quc/4rge5gz/tso80VpEzmQAxnkG6ye4SIEk=
Received: from BN0PR02CA0024.namprd02.prod.outlook.com (2603:10b6:408:e4::29)
 by PH0PR10MB5627.namprd10.prod.outlook.com (2603:10b6:510:fa::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 10:36:11 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:e4:cafe::81) by BN0PR02CA0024.outlook.office365.com
 (2603:10b6:408:e4::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 10:36:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.0 via Frontend Transport; Thu, 22 Jan 2026 10:36:09 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 04:36:08 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 04:36:08 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 04:36:08 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60MAa7Sv293668;
	Thu, 22 Jan 2026 04:36:07 -0600
Date: Thu, 22 Jan 2026 16:06:06 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Kendall Willis <k-willis@ti.com>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sebin Francis <sebin.francis@ti.com>, Bryan Brattlof
	<bb@ti.com>, <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] arm64: dts: ti: k3-am62l: support cpufreq
Message-ID: <20260122103606.wsuwl7pyyfxo5xlw@lcpd911>
References: <20260120-am62l-cpufreq-v3-0-8c69b80168a3@ti.com>
 <20260120-am62l-cpufreq-v3-3-8c69b80168a3@ti.com>
 <652d6b5a-57cc-4985-87fb-94eb53c520be@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <652d6b5a-57cc-4985-87fb-94eb53c520be@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|PH0PR10MB5627:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ac16076-cb7e-4137-71de-08de59a20e93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MJgUA+gk4vpIVP3KoBRSVva+DXMRko4f3qfRFPf3hYRdVFVQbbkQAvj56D7a?=
 =?us-ascii?Q?dY18G7nwh4BY/RunI7NR02uyFrmkKwBvkUijlG/UwPv9T4ASarQky/zFm7Nl?=
 =?us-ascii?Q?6XAQU0kvEFOjKt41nCRRiXKPWuFha1N+ylGzQJ4nWv4Gp2OH1oYX40ZITLIS?=
 =?us-ascii?Q?Be5ymITH9phO6IEtNM6p1GzVzpojtbb46U/WnW6ccUZJx/PsTlNjv27Y7dP6?=
 =?us-ascii?Q?kByHKkoQgherHdmrlZRfaAEltUxsczL4E9QMb8wFWOzTzHX5q7E8jyteArZj?=
 =?us-ascii?Q?8gfZnUxT7T6iC6fUwjnuPIIUmQWMyDEL8qrgxfPUh3dXwCzRIz2x8x4hmsb1?=
 =?us-ascii?Q?mUFBAIkT6ogG3292y/KXxsArNfG0PHv87gLmU72vBSVS6cYf7IICSBcAe0ON?=
 =?us-ascii?Q?BwlCsbivQoEOPYFMb+xJC9yIj+QIn/zXfXKGYlKOhCkMKMvp9DiHSGqu94cm?=
 =?us-ascii?Q?eiFfWcFUWNsIQkZf3XZYDLLMFLcPCH5GeLuhSxZUovMNNdk1Z/RcE98Y89uT?=
 =?us-ascii?Q?trJJc0kFHOo3JUR8rRA8ejtS5jH0XxaHkk5vuX4yWETN5iPVnFucpW+C2v9U?=
 =?us-ascii?Q?nGPb2yJ/2rVpv0c9+a5tMy7GgAtNR+0hAGuh3hGac0IPZjIJ5O5lcCpxC8JB?=
 =?us-ascii?Q?9VEa3g6dRDjus1r5gHZlkd/ePP7X7kFtGY+s+JGqUYemnaWvdka2oJ92s1Ua?=
 =?us-ascii?Q?2s7RGL0YKgSiPbT1lDjENJ06HZ2+xjYg4mT08VqSs6sC795j5Pey888DPYYb?=
 =?us-ascii?Q?NqqKKWWuygctN3ZR+HQY02Tx529dOFy/OsB8pzzh5e3UTcNUhdResbVCXXtP?=
 =?us-ascii?Q?+5/3OxK619R+dUNNSJTDFSWZvj4z1AdwlpZI8sVf6NO/hOwzva9oErqg8cde?=
 =?us-ascii?Q?QcNL83FNNUKt1s9wVVqo3EBpGNnyXn8uqh106FBR7UQWyeSMbG/Ak5E2Orll?=
 =?us-ascii?Q?FdPYTmJ3tiXlz8UtLWPGr1xOLVvGFxb6lrwEZ2E01mBE6aVrBISlhjxxKHG5?=
 =?us-ascii?Q?A8OMR7sAGRtpL/5pOmCIx12gzaz7NK2RQktPzwa1hk4+5rpmJ2D7u8Xzv3la?=
 =?us-ascii?Q?+anZCZhfEWFDRUKvqeAIGS4IqfEj7RTYkWQQnRjdtxQY2A6SGkZB7xrBxi4N?=
 =?us-ascii?Q?g4ZaXN3WrKgkAebjwyreqPg8nySFAHxdaAymGVgXtuaJk+kghEMcUAApHFkk?=
 =?us-ascii?Q?CSpzQOAqBekBuyeMUaujFQfgVSKr0kF79scDtw0xVSBqsPKy4YbS67t78wNc?=
 =?us-ascii?Q?XD79euoetq9KJh3uOeoGMue1ykJcq4Pihts4ufkhKXkgOHT3GgUJY5bOUsz3?=
 =?us-ascii?Q?V3APINVeZAz2HZsr29LSbWO/VYfsq+IlmGb7PZICIuEYXkPrgwjqmkkZwUC7?=
 =?us-ascii?Q?0j+wlKrlSHM5Lyp9z8nquFY1Fkm+xEeVF69nr70SBYtj3SscnEpFw8fw137f?=
 =?us-ascii?Q?6aathtCdhnWMwW13SQ1lv2+1uItraq2Rv8HX67zt+/ataf1Jdf7TbxTMilgC?=
 =?us-ascii?Q?GqLQneQ7YbYYliUgTDaCAJ3mqgzOk/pbchEX96xTyeQfkYuIlUlgTFxXSjmD?=
 =?us-ascii?Q?5OweXuHrI/AFI1I7cfvDlvVCefo6Uji/abS1xjRGLpL6Zoxe36PU9qTAZbAd?=
 =?us-ascii?Q?pp44hyBuSi5M3LILSMPNe/8B4x/1AGCfW4zYK49MNZnrZNHzc/4tEi893F2o?=
 =?us-ascii?Q?SdIfmA=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 10:36:09.6038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ac16076-cb7e-4137-71de-08de59a20e93
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5627
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_023616_570456_3E6D9943 
X-CRM114-Status: GOOD (  22.73  )
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

On Jan 21, 2026 at 10:27:15 -0600, Kendall Willis wrote:
> On 1/20/26 05:47, Dhruva Gole wrote:
> > Enable CPUFreq support for AM62L SoC by adding the relevant OPP efuse table
> > syscon to k3-am62l-wakeup.dtsi for speed grade detection.
> > 
> > Add the operating-points-v2 table with CPU frequency steps from 200MHz to
> > 1.25GHz to k3-am62l3.dtsi
> > 
> > Configure CPU clocks to reference the SCMI clock controller for frequency
> > scaling
> > 
> > This enables proper CPU frequency scaling capabilities for the AM62L SoC
> > using the ARM SCMI protocol to interact with the power management firmware.
> > 
> > Signed-off-by: Dhruva Gole <d-gole@ti.com>
> > ---
> >   arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi |  5 +++
> >   arch/arm64/boot/dts/ti/k3-am62l3.dtsi       | 47 +++++++++++++++++++++++++++++
> >   2 files changed, 52 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
> > index 61bfcdcfc66ea8d802a36ed43cd01fbbf3decc70..a42ccd0d2fcc4d204cae81508f839c44ce83f558 100644
> > --- a/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
> > +++ b/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
> > @@ -127,6 +127,11 @@ chipid: chipid@14 {
> >   			bootph-all;
> >   		};
> > +		opp_efuse_table: syscon@18 {
> > +			compatible = "ti,am62-opp-efuse-table", "syscon";
> > +			reg = <0x18 0x4>;
> > +		};
> > +
> >   		cpsw_mac_syscon: ethernet-mac-syscon@2000 {
> >   			compatible = "ti,am62p-cpsw-mac-efuse", "syscon";
> >   			reg = <0x2000 0x8>;
> > diff --git a/arch/arm64/boot/dts/ti/k3-am62l3.dtsi b/arch/arm64/boot/dts/ti/k3-am62l3.dtsi
> > index da220b85151227c63f59b2b8ec48ae2ebb37e7bf..f7146421918f7037c6a192cc4765e8814a508afc 100644
> > --- a/arch/arm64/boot/dts/ti/k3-am62l3.dtsi
> > +++ b/arch/arm64/boot/dts/ti/k3-am62l3.dtsi
> > @@ -39,6 +39,8 @@ cpu0: cpu@0 {
> >   			d-cache-line-size = <64>;
> >   			d-cache-sets = <128>;
> >   			next-level-cache = <&l2_0>;
> > +			operating-points-v2 = <&a53_opp_table>;
> > +			clocks = <&scmi_clk 356>;
> >   		};
> >   		cpu1: cpu@1 {
> > @@ -53,6 +55,8 @@ cpu1: cpu@1 {
> >   			d-cache-line-size = <64>;
> >   			d-cache-sets = <128>;
> >   			next-level-cache = <&l2_0>;
> > +			operating-points-v2 = <&a53_opp_table>;
> > +			clocks = <&scmi_clk 356>;
> >   		};
> >   	};
> > @@ -64,4 +68,47 @@ l2_0: l2-cache0 {
> >   		cache-line-size = <64>;
> >   		cache-sets = <256>;
> >   	};
> > +
> > +	a53_opp_table: opp-table {
> > +		compatible = "operating-points-v2-ti-cpu";
> > +		opp-shared;
> > +		syscon = <&opp_efuse_table>;
> > +
> > +		opp-200000000 {
> > +			opp-hz = /bits/ 64 <200000000>;
> > +			opp-supported-hw = <0x01 0x0007>;
> > +			clock-latency-ns = <6000000>;
> > +		};
> > +
> > +		opp-400000000 {
> > +			opp-hz = /bits/ 64 <400000000>;
> > +			opp-supported-hw = <0x01 0x0007>;
> > +			clock-latency-ns = <6000000>;
> > +		};
> > +
> > +		opp-600000000 {
> > +			opp-hz = /bits/ 64 <600000000>;
> > +			opp-supported-hw = <0x01 0x0007>;
> > +			clock-latency-ns = <6000000>;
> > +		};
> > +
> > +		opp-800000000 {
> > +			opp-hz = /bits/ 64 <800000000>;
> > +			opp-supported-hw = <0x01 0x0007>;
> > +			clock-latency-ns = <6000000>;
> > +		};
> > +
> > +		opp-1000000000 {
> > +			opp-hz = /bits/ 64 <1000000000>;
> > +			opp-supported-hw = <0x01 0x0006>;
> > +			clock-latency-ns = <6000000>;
> > +		};
> > +
> > +		opp-1250000000 {
> > +			opp-hz = /bits/ 64 <1250000000>;
> > +			opp-supported-hw = <0x01 0x0003>;
> 
> What is determining the opp-supported-hw values? To my understanding based
> on the DT bindings docs, the values should be based on the number of unique
> speed grades, which there are two for AM62L. Looking at the values used
> here, it looks like it shows 3 unique speed grades.
> 
> By this logic, the value of opp-supported-hw should be something like 0x03
> for all OPPs below 833 MHz and 0x02 for all values above it.

That's an astute observation indeed, and I will go fix it right now.
Thanks for reviewing thoroughly! I will anyway send this patch on it's
own now that the driver patches are merged and the DT needs to go
separately at this point.

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

