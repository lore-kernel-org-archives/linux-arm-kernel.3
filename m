Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B94D3EE86
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 15:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZdsrNJjRzDjnskb+rcRKoon8p27D1rAAHlWkiyMLFQ=; b=ZWLiMUEMMMglcQ4kpTjyRZqlPm
	OhdGhIPePoLCQnoUZfCl50IqBIb1CvP+GX9gmxRJoamfbrGmjAUCITby61SeRtjuSjgolBDFFPDSQ
	d7l9mhHXeZ9D1D6eQmec4bKxT4n44CoPGosR8GuX0y0qXLc+39CGKLtEzteqMF83AQLDQ2+/7Larb
	vjATtnl7W+8cTJRtIxVwTK7JvDgH/atvBI7QaSyRSVlmphFnb65fy4ZvxpceaG+8Y4PkqmwnSgEwo
	ApWjFyv1FGd2BaoepanUfAy/khfFVV5hc6+HRBgkqFneN1vdo0zu02rqez5ANi6LgDj6fWEvxvsTr
	E7SL7XUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwsN-00000007MPA-2K30;
	Thu, 22 Jan 2026 15:45:39 +0000
Received: from mail-eastusazon11012000.outbound.protection.outlook.com ([52.101.53.0] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwsL-00000007MOP-0JfZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 15:45:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X9fyVTzdp9XRQfzh0/FufrSuWjebg3d+jT8f3OzCxvgxAhZ/FPf3BlLlL5+C6MTbViMrj6R14H1qsaAhx13D83T+XA4UZoA/ddcnhrOt5YM+6KapLrMh/7rEyZyVK8bappYWd+bQG58cNEFEx3TNgqs9+T5y/UjE8HzHVunTNq6DW4rAO+uRsLv3oEqSsrMCEZsFtPtyyU9J7pGl9D6MnQzPObFHTRiJLQ7yN+rn0mDShTrpEnZd2aVpZtTJomzeLzYGNa9X8MERnEe3dEEjHm9SkEvce1efEIOr57fA2Rad07lGbmZnxHsWdusFbge/HuCpWeFECIZNYo0ucyWQzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZdsrNJjRzDjnskb+rcRKoon8p27D1rAAHlWkiyMLFQ=;
 b=eqLDbnVok2qtFkZ48lbdINrsJdBoujrusb9xe+ZtRHbNF9RbuAdh//flWXBL3vnURAzq7N4myM5Ua+TTw3i4HrJWskJ4HZtYQhqpNZTtJsbMhxAI2XMElciIQPJLoZMPkogc7DNey9uxOON4VNwFE7hcnFt2k/UvrQXAaU2PMdln2wafKbAfShwXWKmUegjF9V6xQFjTsNx4vo5yD00qdtNwIS9w6jdXxIiBpduUTGP0EgJSHaIBwMxMi6YXSl5RsHC+mS1hsMGbU9C18aV3iXz/tNUErSHxFCNiutzN5cXTU5RQskH3y90B2bG1n0qV3P9p7ioP2+1arCmANXus0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linaro.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZdsrNJjRzDjnskb+rcRKoon8p27D1rAAHlWkiyMLFQ=;
 b=Hz6hxyza0GQV0GtPdRAxjQp3JI/tZyXkORQMEIzUu5CnoBZkMfUl7m1TGScntKXycuf6+vyTKBDo/83v2eeGpjbX0x9BaIqWEEwQk0YIUab6IyPEXoptgn/PBk9+8VjVaMhwtGX7RMlXMrVFKcG3HNC5nb6OoPqtZzLrsXIhd/o=
Received: from SJ0PR05CA0082.namprd05.prod.outlook.com (2603:10b6:a03:332::27)
 by PH8PR10MB6292.namprd10.prod.outlook.com (2603:10b6:510:1c3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 15:45:30 +0000
Received: from MWH0EPF000989E9.namprd02.prod.outlook.com
 (2603:10b6:a03:332:cafe::9c) by SJ0PR05CA0082.outlook.office365.com
 (2603:10b6:a03:332::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via Frontend Transport; Thu,
 22 Jan 2026 15:45:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000989E9.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 15:45:29 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 09:45:29 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 09:45:29 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 09:45:29 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60MFjRVv657364;
	Thu, 22 Jan 2026 09:45:28 -0600
Date: Thu, 22 Jan 2026 21:15:27 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Kendall Willis <k-willis@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Bryan Brattlof <bb@ti.com>, Viresh Kumar
	<viresh.kumar@linaro.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62l: support cpufreq
Message-ID: <20260122154527.fbpo2vxtfv66bh2x@lcpd911>
References: <20260122-am62l-dt-cpufreq-v1-1-fabcc15e25fa@ti.com>
 <77815f93-e5cc-407b-8e09-93b007f3ecc9@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <77815f93-e5cc-407b-8e09-93b007f3ecc9@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E9:EE_|PH8PR10MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: b51b19f9-5ba6-49e6-3487-08de59cd4559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lWvVtHYaMsFxRooVHQg+XrluTjoazfEKSZkiSCqOClPkuuNzoILAYjrsqK9n?=
 =?us-ascii?Q?nYQu7iWY3fetuW84xtWLtTx4d3OzKA0qSJyx/iWdngw3wQCVQ/Gq0QNTy7qp?=
 =?us-ascii?Q?y6QowIKJgBFKEitJyEc+WaNYkjGv0PIjtY08rhSxm+9rh2+GHvEQpLTo+9mw?=
 =?us-ascii?Q?nscSnq7HrjQQtv+JXQHa/wlgOUKtvj/2lTZ/GgnvzqZuvBlJclp9cOVpPH9m?=
 =?us-ascii?Q?JHT5E2FWfW++fVswAhm6tOEuiebiFDThAQH7cxW9Q6Gfv3Qip0SWh16afFeF?=
 =?us-ascii?Q?uIMoSAF/omfGqX0740UbTvMYy/ZojEpKkJ+MK8ar8PvnfFiMtIXnkfPv9BSB?=
 =?us-ascii?Q?/j+JwfcdXfg/ADTetkoiGG0bHXkjIyR91EletaW5hy/eICAtiRE8oUgGnZ+L?=
 =?us-ascii?Q?kbmIfzl0vHq6BOu1UqwkJzpPfn6SNJLxkc8rndFkThgnr6SAnxJPkIaKv6Wr?=
 =?us-ascii?Q?GS1P34kJBfzC7jH9eJstcJhrx4o7vqDrf+QtO+tJcgvNuIWf9a+2FVXXso+9?=
 =?us-ascii?Q?4qXDml3V0EPUnyhWacRHttoFJ9/4YvaPJyOw8cK3E1WCny179enXOFL5LP9y?=
 =?us-ascii?Q?6xlg4ynQsKxjxKmmbM/+eWNQPwzfUtGsmsUfmRfH8JcTiISDRhZbRsg/yBEi?=
 =?us-ascii?Q?f1XGlezPdvFkAFxrP682H3xYFyKaALzyYrD+sLmH5LLU4VAEvODVPOrcTQX8?=
 =?us-ascii?Q?j9sJ7k/NjJsd+clXDMkpLpR9tLNGN5kI87o4IwZxH/r+EeI7enT2A1TLuD9F?=
 =?us-ascii?Q?XaTsZUdM387870zuwx+a5DKm+IzjwCEQpNCXe6LN68RT4WyAUSL0sXvPrN7x?=
 =?us-ascii?Q?cA8iNKiL4+cakR686/Md4NXi0xoWaoefmfWN+bdUrCQkfrKZy11E2dC8ffUj?=
 =?us-ascii?Q?NF7U9uDtbvOb9vSrttBJflqBaq+bGDo4bwG3hDcQLxK2T2T4GISDXYpkTnoi?=
 =?us-ascii?Q?UbsQ3yIk1F+KWgO5ihgriaKOtZJNHRlZ+lpOf0SwkfL0rPeB0QznL1fPbWB/?=
 =?us-ascii?Q?TPhQZWiovyqgZC1nuHK+HBO3ljIQ4xuPFNc/KxE+2kfVuOym+C6jX4XuVHLH?=
 =?us-ascii?Q?L7om9KjtyOPKqe/b0V1v1GZ/nsHHt1Otd5sX/Ib6w7rBpfRnLu+ndskca9zR?=
 =?us-ascii?Q?5Ved1islbAFLgILJzFG8kECuRbAGwtAD/ievfd3FcBmshGrfsFG38QgITXV9?=
 =?us-ascii?Q?onc7w6ZeiagQhVoQrRYuj42p8hCHk5wPrcSveMDo0d2r7PTvvSgsKc8hmqwq?=
 =?us-ascii?Q?Av9oy9EcYjqVfmzCeqaGFHYCVCe/+02aHqZRixLqZDCnkmtGNgwRnmVPjAbo?=
 =?us-ascii?Q?wx6xHXADnRgtBkUihmMrFOmpncXt39SDZeqBbxBNYiJBYEucHdksUo7IzVql?=
 =?us-ascii?Q?DR89OylulDgbEYZA4gcwY0Pm67/K7MpgJzYp19qBcAzmRMgMGTreQojRkQh0?=
 =?us-ascii?Q?Ieyy80kUuswN3O9fxcZN5mKAI+Tf1aucwq+0lSDVNW14OxoChqqdWip9RxX5?=
 =?us-ascii?Q?hv1CuAaBimxMSPUuy0hQ0YOWsDA1nzEEMxFHxsk/leiHfc+LjrnDBYCO2GuX?=
 =?us-ascii?Q?VPPCCRkH2+oFDpupY6wMX6UP0w0wL5nP4mPKMuyMxBeK2QGGNyPBGnbpIxJz?=
 =?us-ascii?Q?/y6t2r5yslI3DGhK6jUatmX6Nv7xX943poSSSzf7bCzqZRcPCycrUXp9k1s7?=
 =?us-ascii?Q?zqCl2g=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 15:45:29.8439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b51b19f9-5ba6-49e6-3487-08de59cd4559
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6292
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_074537_114541_BD289AE7 
X-CRM114-Status: GOOD (  23.75  )
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

On Jan 22, 2026 at 08:36:45 -0600, Kendall Willis wrote:
> On 1/22/26 04:49, Dhruva Gole wrote:
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
> > The driver changes were merged previously [0], and so the DT patch
> > is now being posted seperately.
> > 
> > Logs:
> > 
> > root@am62lxx-evm:~# cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_available_frequencies
> > 200000 400000 600000 800000 1000000 1250000
> > 200000 400000 600000 800000 1000000 1250000
> > 
> > Changelog:
> > - fix the bit fiels in the OPPs as per Kendall's suggestion
> > - Fix the scmi_clk ID of the second A53 core
> > 
> > [1] https://lore.kernel.org/all/20260120-am62l-cpufreq-v3-0-8c69b80168a3@ti.com/
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
> > index da220b85151227c63f59b2b8ec48ae2ebb37e7bf..26d3040ff53259daba21b39a55bb8a2ed65d4e8f 100644
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
> > +			clocks = <&scmi_clk 357>;
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
> > +			opp-supported-hw = <0x01 0x0003>;
> > +			clock-latency-ns = <6000000>;
> > +		};
> > +
> > +		opp-400000000 {
> > +			opp-hz = /bits/ 64 <400000000>;
> > +			opp-supported-hw = <0x01 0x0003>;
> > +			clock-latency-ns = <6000000>;
> > +		};
> > +
> > +		opp-600000000 {
> > +			opp-hz = /bits/ 64 <600000000>;
> > +			opp-supported-hw = <0x01 0x0003>;
> > +			clock-latency-ns = <6000000>;
> > +		};
> > +
> > +		opp-800000000 {
> > +			opp-hz = /bits/ 64 <800000000>;
> > +			opp-supported-hw = <0x01 0x0003>;
> > +			clock-latency-ns = <6000000>;
> > +		};
> > +
> > +		opp-1000000000 {
> > +			opp-hz = /bits/ 64 <1000000000>;
> > +			opp-supported-hw = <0x01 0x0003>;
> > +			clock-latency-ns = <6000000>;
> > +		};
> 
> Thanks for implementing the feedback! One last thing is I think
> opp-1000000000 should have the opp-supported-hw value of 0x02 because speed
> grade E only supports up to 833 MHz.

Okay fixing this in the next revision.

> 
> > +
> > +		opp-1250000000 {
> > +			opp-hz = /bits/ 64 <1250000000>;
> > +			opp-supported-hw = <0x01 0x0002>;
> > +			clock-latency-ns = <6000000>;
> > +			opp-suspend;
> > +		};
> > +	};
> >   };
> > 
> > ---
> > base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
> > change-id: 20260122-am62l-dt-cpufreq-c24f0236ad15
> > 
> > Best regards,
> 
> Best,
> Kendall Willis <k-willis@ti.com>
> 

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

