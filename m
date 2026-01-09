Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DF5D26D98
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 19:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nkOS242SArkQHOdAxcxea1GbfIAO42pebaTsBq0lDn8=; b=eYCngVhtGkzCMr8Jvp5zSqVXQ1
	rhGc7DwMMsTC8Dk7ipW0bUhgcuwVzwzpCA+expSN20Hm8+Wjg63vkT8kT3rwVo8sVUN1eocr0eZ5N
	c+Jxd/sHUoIpKp6G+nQova+7rY5E1a5Ni+jyQ3k7J+jt03MRrnVXrmwC7PtvkpYDUGbr7OPw13tmI
	oaR2eohDeDFnH8y+09wiIVrCTGb/zOgk+tjCCwRzPT2xzMkDOLWuAlwkienzrE4DonIu44BK3Uclg
	w8PGWppPuXaGzstnfOGMVNVj8PLthLYbkPglx5KK3RrR/+9vr7QoYSNYqwFfeAqZpTroMmVF+P0eg
	NqomJ9Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veI9F-00000002wOm-1AUh;
	Fri, 09 Jan 2026 19:27:49 +0000
Received: from mail-centralusazon11011020.outbound.protection.outlook.com ([52.101.62.20] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veI9A-00000002wOO-2TBP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 19:27:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6/4+AREK8ht24tOX3d2y83BCPjvl5HXIT/8vFMg/UYO0TNpu6R8kRna0e8eXsjAJwu1vKLcXniSWqOpR77gtamRyJAt+MG1zZUTAHmiVTZjfQ+ygsILe+ilzidf1kKZgJtvR4ocFupUVWZEHPbp4ZbrJtYwXmNBJZFq8q9CzjkDFsRhGtj6GZ1YhbvpMHVAFRsouPkaenQ98dvlP0eKvvYac8xA9C+bjui8Hgt6wZAVBrh5s26HPa5wBL/5cWA/0GEw598wNag7SiHW8YMky9Tt+1FLEEfrPR56d7JaY2jXXWDYidCHFVItmnkRlXM3zF5VPw3RZEUCEiB29B1ELA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkOS242SArkQHOdAxcxea1GbfIAO42pebaTsBq0lDn8=;
 b=iJrHrg03hdx7JfIjicho0AD87ML7T+RB4WH+VeOM0C/8eqltg/DxRjkqw1M36eBPR8yeZWU4se+v6ztJ/YcpmqV6Q78CZdw2z4E+fN0f/V6On9yHC1tOSsYvYzMo0Ot4BmAD9tAVTwz9ZSYS6DiQet/IPA5TR9YeVW/BEupPXo0NHj0LmUy0JAKBOikRYZENkf55Ne/eqcliWvmoDjNt1bGzEMJlnE2fIV0ouzyZ5rVC6cs7VBU5LGRDCgAW4c4Q+GXjJgbDwRzVhhQC+spuBuLTnOGyhJYkhp1CffKQUUqxHP0sca7RnhGkvbOoM6oSkidC3fIGojk9sXefBQhaPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkOS242SArkQHOdAxcxea1GbfIAO42pebaTsBq0lDn8=;
 b=mfHastCxcUlrrDwKyLUKbRQK+sdewBjqbI5lzMbBuJOnh/YqaRndFbiEk9NuqfClBt9Uyo7usyawZkPoXf4tp72UDLIZBku9zhXbnN6K1DN3dgQFtjA62jFTgFFK/TDjYtKWJS0wv/bNhN5M9a0MShfdSxnrAM4tWsWSxBtroeU=
Received: from SJ2PR07CA0004.namprd07.prod.outlook.com (2603:10b6:a03:505::10)
 by SA2PR10MB4746.namprd10.prod.outlook.com (2603:10b6:806:11c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 19:27:39 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::ca) by SJ2PR07CA0004.outlook.office365.com
 (2603:10b6:a03:505::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Fri, 9
 Jan 2026 19:27:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 19:27:36 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 13:27:35 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 13:27:35 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 9 Jan 2026 13:27:35 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 609JRZwk547104;
	Fri, 9 Jan 2026 13:27:35 -0600
Date: Fri, 9 Jan 2026 13:27:35 -0600
From: Nishanth Menon <nm@ti.com>
To: Beleswar Padhi <b-padhi@ti.com>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vigneshr@ti.com>,
	<kristo@kernel.org>, <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: ti:
 k3-{j784s4-j742s2/j721s2}-mcu-wakeup: Add HSM M4F node
Message-ID: <20260109192735.rijejfwwrkunosdp@gauging>
References: <20260106104755.948086-1-b-padhi@ti.com>
 <20260106104755.948086-3-b-padhi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260106104755.948086-3-b-padhi@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|SA2PR10MB4746:EE_
X-MS-Office365-Filtering-Correlation-Id: f7baf657-1f3b-44c1-8072-08de4fb5254c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|34020700016|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PSf4aPYu6XQ37kbYk9HT02gEjNsEwB7fY1MMDuTolo3qBbZeVuj0FBRLm6aY?=
 =?us-ascii?Q?YMrRi8YmcHKnBOw1WJoXEUhtUIrIm/ymxZ5WT7K4KiFZ4VS59NMSr+Jj3T6u?=
 =?us-ascii?Q?oMzUO8KM+myNDeEq/IEulOnUBEpvKFugUTnKXJictklNbuIu88qjznup6wKK?=
 =?us-ascii?Q?AY2xBEHz3cNsBiJEQ42ckXrTopQ9EJjS7rUJRoxaKSEoIi3fNdGCs/IKma31?=
 =?us-ascii?Q?l0e+XBYoPVcbgVP/sxTam16+rDZfcjSpPKb8izNJa9DSifaV8yRw8zvIV5+q?=
 =?us-ascii?Q?tmd9UsAmKgpnklRBE0mPHa5XKoVh7pWdkdrksPhNL343cR1G7VIWG0ijGui7?=
 =?us-ascii?Q?gxtdD7lVl9UtgAxTqZs7VxO/Aq4RsDfnAN6/ap7JLslUJEkpXNw9PcsGwCsT?=
 =?us-ascii?Q?J0FdksQCPm3Zpnnb4hwnkbF4fZ3cTpTp4dPD6QD3YvrvYRiPhkeIbt1/ZE+7?=
 =?us-ascii?Q?mk31uNdM8Yg8I/y8qUYd9FBRI+xH3zr1lD2ENNtM+PwNXEF/KcjuomgwTb7d?=
 =?us-ascii?Q?71gVd2daHtkJ+jlPIwU6cLHB4a+FCFcvHC80WJrrh3n3GSHuYZwvo9ATmFHq?=
 =?us-ascii?Q?sbJh2TDwE/LnejdoxEoCr0OT5VNIFO/YTL90rQ27nBRfa2gS56sgnzKKzGhZ?=
 =?us-ascii?Q?aL8ifYk/R//BqZYpsiMbDf2z1LlXh3jqvwXle27pTPOnBNWWudGWWCT9HW8a?=
 =?us-ascii?Q?y4RIhp2k0SeaUDcN9SBoVa9waNtVgJZlbuxBUV0HbsVsfjPhkejjtP+Vcrhz?=
 =?us-ascii?Q?R7WGnZRmfnitGC67PpLapbf88VI/a06Z6vwrIddclovtp56EDpzZgSZRetoj?=
 =?us-ascii?Q?kohLog9JEmG1/pwY1RYDhsyxr+m1uvAn+wMoqyTMm+hNTwadPWE7GKIYYP5A?=
 =?us-ascii?Q?lU45DgfC0MWHxRFFj2XNFi8ESBNH+oHbctNiilxz8z8PVDMwDISxrFh/sezZ?=
 =?us-ascii?Q?nHu61QTMV1M+b6EN3sbikoqhtdf1s0qZyhgxDUIaGsV6+d3Vlp935Bx3mPDR?=
 =?us-ascii?Q?JFQfCTvh+H0YNwSNz5KXwUlYVX+odSzFgnDc573YnFZxN2PSnrDGDktabnDv?=
 =?us-ascii?Q?lS9A5hcXTy6Ege1JS44HCmqo2Pw4T1ghL70Nvnx7ZcO02EHrfvqMVFcq7xEd?=
 =?us-ascii?Q?edwqh4AMeJQ175OfBJ+D1k4/+zGEzquITe3v6rqMwQhMIT5+vVpPwNF110pP?=
 =?us-ascii?Q?5vnK+6t7QItOVsb08mTnuHmOVdGqe0F2t/vb317SzuefotHKSSi8+HyIYrlB?=
 =?us-ascii?Q?RUYchywztK60xCIhtjbCtF7XZAAUITvSN63NWRU9jj82MQqOYJ8zlZ9S+KLu?=
 =?us-ascii?Q?9uXzRvDCVZVwNgq6LgvtUkrHzWa9rBNNrs7EX/h0FY4YTzCt1lWsVg1F+9Mw?=
 =?us-ascii?Q?krwX3loxPoyyDlzPkXQxz53Jy37t2mjqgN7Ira03TxqHJkxMI0z0UKHcWuBy?=
 =?us-ascii?Q?qTkWiKvg/6+aF9IalD/Ex/udwzrx5mRqt6ADNwVI5f+BhIxPBBSiq0pOepzn?=
 =?us-ascii?Q?vuzMlnzZr0uvC2Q/vaBwl3buYeAVDVVvMxOMq9m8Wprt4BECv5iM1OWcJXfI?=
 =?us-ascii?Q?Mx0hHVeu1g0N/Z2dbTNh/Cwvpf5paximSDRrNyh+?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(34020700016)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 19:27:36.5347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7baf657-1f3b-44c1-8072-08de4fb5254c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_112744_721095_E2B70D6A 
X-CRM114-Status: GOOD (  21.16  )
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

On 16:17-20260106, Beleswar Padhi wrote:
> The TI K3 J721S2, J784S4 and J742S2 SoCs have a HSM (High Security
> Module) M4F core in the Wakeup Voltage Domain which could be used to run
> secure services like Authentication. Add Device Tree Node definitions
> for the HSM core in the respective SoC wakeup dtsi files.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> v2: Changelog:
> 1. None
> 
> Link to v1:
> https://lore.kernel.org/all/20251231165102.950644-3-b-padhi@ti.com/
> 
>  arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi  | 15 +++++++++++++++
>  .../ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi    | 15 +++++++++++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
> index fd01437726ab4..c3d78d4a838a1 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
> @@ -766,4 +766,19 @@ mcu_watchdog1: watchdog@40610000 {
>  		/* reserved for MCU_R5F0_1 */
>  		status = "reserved";
>  	};
> +
> +	hsm_m4fss: m4fss@43c00000 {

You did fix this in the binding example.. but missed in dts.

The node name should use the generic type, not the instance name. It should
be "remoteproc@43c00000", not "m4fss@43c00000".

Additionally for the label, why not just use hsm: like we have for sms?

> +		compatible = "ti,hsm-m4fss";
> +		reg = <0x00 0x43c00000 0x00 0x20000>,
> +		      <0x00 0x43c20000 0x00 0x10000>,
> +		      <0x00 0x43c30000 0x00 0x10000>;

The total address range covered here is 0x43c00000-0x43c40000, which is
0x40000 bytes, matching the ranges entry. However, you're defining three
separate regions: 0x43c00000-0x43c20000 (0x20000), 0x43c20000-0x43c30000
(0x10000), and 0x43c30000-0x43c40000 (0x10000).

I assume you are doing this since the h/w integration could be
instantiated differently?


> +		reg-names = "sram0_0", "sram0_1", "sram1";
> +		resets = <&k3_reset 304 1>;
> +		firmware-name = "hsm.bin";

I am not a fan of putting firmware-name in SoC.dtsi - esp when it is
reserved, further, so far we have been using j722s-wkup-r5f0_0-fw and
so on.. which allows for firmware specific to SoC.. which kind of makes
sense here as well.

> +		ti,sci = <&sms>;
> +		ti,sci-dev-id = <304>;
> +		ti,sci-proc-ids = <0x80 0xff>;
> +		status = "disabled";

As usual, document why? Additionally, should this be reserved?

> +		bootph-pre-ram;

"standard property"

Documentation/devicetree/bindings/dts-coding-style.rst - note the order:
1. "compatible"
2. "reg"
3. "ranges"
4. Standard/common properties (defined by common bindings, e.g. without
   vendor-prefixes)
5. Vendor-specific properties
6. "status" (if applicable), preceded by a blank line if there is content
   before the property
7. Child nodes, where each node is preceded with a blank line
> +	};
>  };

Same for the rest of the patches and nodes

> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
> index cc22bfb5f5996..42565f41b7bac 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
> @@ -762,4 +762,19 @@ mcu_watchdog1: watchdog@40610000 {
>  		/* reserved for MCU_R5F0_1 */
>  		status = "reserved";
>  	};
> +
> +	hsm_m4fss: m4fss@43c00000 {
> +		compatible = "ti,hsm-m4fss";
> +		reg = <0x00 0x43c00000 0x00 0x20000>,
> +		      <0x00 0x43c20000 0x00 0x10000>,
> +		      <0x00 0x43c30000 0x00 0x10000>;
> +		reg-names = "sram0_0", "sram0_1", "sram1";
> +		resets = <&k3_reset 371 1>;
> +		firmware-name = "hsm.bin";
> +		ti,sci = <&sms>;
> +		ti,sci-dev-id = <371>;
> +		ti,sci-proc-ids = <0x80 0xff>;
> +		status = "disabled";
> +		bootph-pre-ram;
> +	};
>  };
> -- 
> 2.34.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

