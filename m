Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E774D2D0F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 13:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RpmTwIiVGOoFb3Z6wwZgbkRLJIxT3/QB/zZZ2XnvLU=; b=gjzq2MYK444Nc3+R3BaHWAUSwc
	vl+ks1P21kEwVSk5navspPzg1W5x04j529GjX7jlyo0qHPLiWcjocJaXp1hJjriDrLfrbxDeCooys
	8ICk5xBsNEsJS+UsdWkRWHJTrrDCfZNJCny9F/GRNr0Y7Y0X9t/38J/YwRx8jgj079Wml57yAJ2Tk
	aUrvVf7cbYnO0N2yx13xAL1suWQRtVWNdkgBT3DlRfC4tE6hCLk7VuEvlmM35C1YTnDm2dqDx4163
	8vLFgoPn1zz22s89Pacgj8qU3lDqn+eOFqdQCMSAJlzisKEeqijzEBcvujgvmvf5NnIhuqQ9lOTYU
	w21CM0bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfeFD-000000079BQ-0C80;
	Tue, 13 Jan 2026 13:15:35 +0000
Received: from mail-westus3azon11012015.outbound.protection.outlook.com ([40.107.209.15] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfeFA-000000079Ak-2Bwy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 13:15:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZE23Q8+GiV8VG5RrRO8BaOwhNRt86GU4R+tuBx6lsiwxKFszCppZl34vIz7ajv27xlYIZWdK+qk62kUkBnKzc0IdaxfkWHOw+NKEbQq2jyvspBbevgSH9e7snSGsNE57zt+ZOr+85DhxgRDLg5RbzOzs137b9yUPQOln8qblVv1UoI4Iu+hwsJAqPTcmzqSBaoykyS5z7F6inTMWay8B7Ddq/rbFg3oXkM8VeNbwhIY3KbSlzkpiOq1ZUgcFIMc1Dvqex4AVFEtQx2tdyqyLQBDSZPNYXQQ7iCFUy/493apKYDDqYSP6VYU4auG9T6gjlr3NTSAllJ7evLOVqXOoWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+RpmTwIiVGOoFb3Z6wwZgbkRLJIxT3/QB/zZZ2XnvLU=;
 b=K2hW+f4uZ8/tXR7q2qa708HSA0O4Yq6eag3peV8ZSm4xAJzqgt1yy1lYAuOAB6yXarOHW5V6gDZDP5sXehpcFZrTlDb6vO9q0TuL6VxnMyzkP+pmxo9622pq06DJgAof4HPncX/IgvwqqhomK5p6hu5zaeRnhYgMH98JL++Bs/oOMR4u1b2M8mnu9F1L8Y6DNCZ97Vez9z8i+vEsRw+/CatXyDUs4OMiSp58hjvPulrg+Ck9KE4mBnBR3Y82MjcebDfNjbo26WYQZ9jB29PIZOKRvbvKMjKztm7kfZIziEVPzaij99kIoIFNSOIALY3TU0tHaacATu1vWWjdwPYqoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+RpmTwIiVGOoFb3Z6wwZgbkRLJIxT3/QB/zZZ2XnvLU=;
 b=kmKQi5CvuGmNyUhJeyG1hvQ/GVwjSdgf5A49UcO6NPKW7kKjvKvGgkuEbTcgInCQmw5WC9PJr5lRV+4n+gBojpHEoQT4x50iPcL+BZcArpPOEi8vIGDnS/vPb6W+qq0GRX4p3hR7QscN5kNZFRZq7GAFSYJHuc59l6AHc89oDyQ=
Received: from BL1PR13CA0406.namprd13.prod.outlook.com (2603:10b6:208:2c2::21)
 by DS0PR10MB6975.namprd10.prod.outlook.com (2603:10b6:8:146::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 13:15:27 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:208:2c2:cafe::59) by BL1PR13CA0406.outlook.office365.com
 (2603:10b6:208:2c2::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 13:15:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 13:15:25 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 07:15:08 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 07:15:08 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 07:15:08 -0600
Received: from [10.250.150.72] ([10.250.150.72])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60DDF3Uu2189382;
	Tue, 13 Jan 2026 07:15:04 -0600
Message-ID: <d240b882-a2b6-44d1-870f-b01144cc90bc@ti.com>
Date: Tue, 13 Jan 2026 18:45:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: ti: k3-j784s4-j742s2-main-common.dtsi:
 Refactor watchdog instances for j784s4
To: Abhash Kumar Jha <a-kumar2@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
	<kristo@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<krzk+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <p-mantena@ti.com>, <m-chawdhry@ti.com>,
	<u-kumar1@ti.com>
References: <20260112085113.3476193-1-a-kumar2@ti.com>
 <20260112085113.3476193-3-a-kumar2@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260112085113.3476193-3-a-kumar2@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|DS0PR10MB6975:EE_
X-MS-Office365-Filtering-Correlation-Id: e97c06da-8d5f-4013-f276-08de52a5d0e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|34020700016|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEJwRUJFaXoyZWJ6SG55eTVxcEtjbThSMy9qRk5GQWo3SnRLM2VxZnRzRSsr?=
 =?utf-8?B?RDlXSFB6UHkzSm1QZFZRMVlCUCtkSU1yYk5UdGN4M1IwVjNMNEhZaUljQ1Np?=
 =?utf-8?B?YTNMWHVNWVNzaEx4N20vUXl1TE0zWEdBVm1TdmxKa2FmT09lL3BXNTMyYm1X?=
 =?utf-8?B?MTFxN2RreHBCOHpqbkU2em9CRTJOSlVrZlFhYTcydzdyTUJwcFoyR1BvaU8w?=
 =?utf-8?B?YUxMWXdyTnF3RGVPNW1yd3NKZzk5R3lyZ1N1cFdqT2RpNXFHNDNDSHN4eWh0?=
 =?utf-8?B?SUdpdUhxc3I1cDZpSTBQRmN6Mm5OVmV1eVUvME5weEdvNS95ZkJzbzRLdTM2?=
 =?utf-8?B?YWxzTFMzQW5uU2I2WjJJeU1EV1luTENlNlloOWR4Q2xCckJXa1B4NEl2bTFJ?=
 =?utf-8?B?ZkdKMDFoUGpZQVIyb3p0V21idzdTVVkvZ254T0M3WjdHUVM4VEhPVGZjT1kx?=
 =?utf-8?B?VE90clM5bVhxd1FUNy9Ed0Y4Z0tSejFia2R0TzhMakxOZnFpa3lJY3JLSTlM?=
 =?utf-8?B?R1ZiZWM4VVBMSjQxUm80em9YaGZCOWN2Ri90cjlkSGd5elhMUDFNbGVQb01V?=
 =?utf-8?B?KzJkTisxcnpkMlIyazhQWVA3L1M0dkl4a1IwODMzREE4am0zdTA2bHFHUlJS?=
 =?utf-8?B?clVrb0VNQU5yN2dpQ203K3FuSjhUNTh0ZERkNzFVSEFlNVBiOGdKRkdMK0Z0?=
 =?utf-8?B?bmlqMmloNW04N3ZvalRxT0tDS3R3S1hiMHdTK25SN3JUeURXendNa0hqZWln?=
 =?utf-8?B?UUJGQ3lHRk5WZU1VZzhKbDFxRWVlQks4VjllT0l2dFczaGNEK2VxcXNxMkdH?=
 =?utf-8?B?NjErbDFzWHNUNFhZLzMvZkVOa3BIMG5GK2ttNzFybDhRZzhPM1Arblp5dkU0?=
 =?utf-8?B?QnFLQ0tid3luamtxWnFscTFBbUcwdkNCVWNnbkYrVUNwNk5JcWxRSCtHN2E4?=
 =?utf-8?B?QjVNSFplY1p1TEwySFFzSzdnN21NRlRCb0syZTNlaiswaHpua0hNVXlhRkFM?=
 =?utf-8?B?Y0l5MTF1Z0pDekZoMWppWllGZzkwSmdScU9sVlExRGM1WGV4VmVvWmMwOWNr?=
 =?utf-8?B?QkVZK1NHdGhlL1pZSXhtbXhtWldKTnpKZXhqejJIbWZRbGRIVWtuTU1FWUdV?=
 =?utf-8?B?MmlNTWRVejNGV0svbkRtRWl3M2JOdjV6NzNMS3dUM2NBeEZhbWRtSWVobWQy?=
 =?utf-8?B?azJvdmJpTFNFVkpweGxFSXBoc0pNMHhtTUhOMXpIMnRBb2xsc0VnN3AyakZi?=
 =?utf-8?B?R05rWTBkS01BMXdtdHNZNzRWd0NqUXJNajZ1a0NNc0lTQi9ZTE5QcDBQZ1p6?=
 =?utf-8?B?NVdtOG1TSTBIQjhqUS9NTVpVU1gvSGV6a3d2Zjc2VytUUWVPQVY1b2g4Rmgr?=
 =?utf-8?B?Rzcvcm83LzZOaWV0b3J5UStCQVRmMWg2M1pEVWdlSFlSdUNOWkR4OE5Jb0t3?=
 =?utf-8?B?OUxiSXAvOGIvZUF0UjBjYkdaSWh3YlppaHN0STFDVFV6YzNtMmNuanRYZ3Vj?=
 =?utf-8?B?bXFEM0ZoUFJ6TXorU0dva29zVW82K09YUTg2T3dzR3RJR0lTWDBlWkNrYmRZ?=
 =?utf-8?B?N2JKaitYUmFSTDVxTTVQU01KeXE4Ykd5dEhITkxFNmFQcjdtLzFwZklGNzRw?=
 =?utf-8?B?N0hJa3RFalN4MGFpT2xWY1lxMk9MRHFHTm94QkFrMWdKa1lydml3VW95N3dq?=
 =?utf-8?B?aytvQ2NuZ0VkVnFGZDFidFhnbXgySjV5anF4RkNhNDgvNVZpMTZlSG5LR3FB?=
 =?utf-8?B?WFN6M204OXJxOCtVcWtNZEtVZTlCS1pNTkp2c1lwN3p0S3l0MWdiZlVLQlhP?=
 =?utf-8?B?b2VVaHd5eVQ2VFBlYXRaK0F5VnFQN0xTTVVKWTFoenVOL0x2NjhHUFNpVDFw?=
 =?utf-8?B?ZU9LeVBuc3NoOTJjbDIwc3lhZGwzaHNtUkl0TlVJSWFwbkF1ZGllRlhVUTEr?=
 =?utf-8?B?L09vT2N5RzArMlIvNWVsdlduL1dFRmpwTExaZTRvNUxvbFEybTFmOU1iOGR6?=
 =?utf-8?B?UUFyVEFSREVJWnNoOW1hZklNc0g5Y2E5VmtJdTFaZVFnZ1hRbm1MY3hHRmlJ?=
 =?utf-8?B?UStBU1lSbUpZTng3dkprY1lMODA0dXNOM2Vwb3ltTkUrYUkxYUtCZEEvOGJN?=
 =?utf-8?Q?hDXQ=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(34020700016)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 13:15:25.9641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e97c06da-8d5f-4013-f276-08de52a5d0e2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6975
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_051532_571573_68ACB4D5 
X-CRM114-Status: GOOD (  13.59  )
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


On 1/12/2026 2:21 PM, Abhash Kumar Jha wrote:
> Each A72 core has one watchdog instance associated with it. Since j742s2
> has 4 A72 cores, the common file should not define 8 watchdog instances.
>
> Refactor the last 4 extra watchdogs from the common file to j784s4
> specific file, as j784s4 has 8 A72 cores and thus hardware description
> requires 8 watchdog instances.
>
> Fixes: 9cc161a4509c ("arm64: dts: ti: Refactor J784s4 SoC files to a common file")
> Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
> ---
>   .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  | 36 -------------------
>   arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi    | 36 +++++++++++++++++++
>   2 files changed, 36 insertions(+), 36 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> index 9cc0901d58fb..c2636e624f18 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> @@ -2378,42 +2378,6 @@ watchdog3: watchdog@2230000 {
>   		assigned-clock-parents = <&k3_clks 351 4>;
>   	};
>   
> -	watchdog4: watchdog@2240000 {
> -		compatible = "ti,j7-rti-wdt";
> -		reg = <0x00 0x2240000 0x00 0x100>;
> -		clocks = <&k3_clks 352 0>;
> -		power-domains = <&k3_pds 352 TI_SCI_PD_EXCLUSIVE>;
> -		assigned-clocks = <&k3_clks 352 0>;
> -		assigned-clock-parents = <&k3_clks 352 4>;
> -	};
> -
> [..]
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
> index 5b7830a3c097..78fcd0c40abc 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
> @@ -6,6 +6,42 @@
>    */
>   
>   &cbass_main {
> +	watchdog4: watchdog@2240000 {
> +		compatible = "ti,j7-rti-wdt";
> +		reg = <0x00 0x2240000 0x00 0x100>;
> +		clocks = <&k3_clks 352 0>;
> +		power-domains = <&k3_pds 352 TI_SCI_PD_EXCLUSIVE>;
> +		assigned-clocks = <&k3_clks 352 0>;
> +		assigned-clock-parents = <&k3_clks 352 4>;
> +	};

[..]

For this patch

Reviewed-by: Udit Kumar <u-kumar1@ti.com>



