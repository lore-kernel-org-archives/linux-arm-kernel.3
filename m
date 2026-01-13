Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B173D2D0F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 13:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=50BBhjvGDLp0Im/N7oj9Q0KHYDwbeRyL8qFdZykysms=; b=SColL46vAbOkwxV5UavttqCCnE
	SWR+ZRJ4vUGaZ+KCuteUwOQmOpAQywByeyc2PBOvYn0RYnfeMtiVO/QFgq1LNSjUiVlq1UCpNq1Jf
	pYTggnYMZ4AuagH8J6iVp/7jOmDiXyNEvYvyPrPleYiO/o7fxtRu97FmAazK2ou/edT6twCAkSZYi
	3JG3Sy3Z1D/rrOMRa4mzqTswHEnmy0MQmMxOlKdhGpiFMmto8xCFYjE/HLWfR614nd/EXN/ssAs6C
	KbMpUt8a8OEeayEHbzSSizEFAUMbDkDEbhySDps47FLYh6p8Gfr0Ef8hAqturi3I+v0fbRFuCxHha
	XKfpl4pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfeBP-000000078T9-2j4T;
	Tue, 13 Jan 2026 13:11:39 +0000
Received: from mail-southcentralusazon11012015.outbound.protection.outlook.com ([40.93.195.15] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfeBL-000000078Sg-43L1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 13:11:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQP6qDKvj0s6+rsa2KmAJr6SY1z0XwMLE23z0acEAkimAn0cpAaFquCWSn+KwELLd8uMZLNHmIKSyDCeuyCDh/UVyK5TTr36VSVXnlKMtBlV2No9o3UijHbEIJFtZsKK7ob5FTefG94vJz31b8IlKMCmgWC6gQIxUO4l3rB6iEDZxTBcU30hLrmqUmsbrwrXGgcYnrABZTY931LFVNfptMj6x4mIskxoYwnLRv66FcGbQivmEdneVkeWwwoAGBmL4AqnF0JsWz4er9GsD6+2TUkW5wRnDS3EBC5b8iB5wHfdeWX10MywQPpXZUMYUwvXDOx4pghOc6gaROGnLxo0hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50BBhjvGDLp0Im/N7oj9Q0KHYDwbeRyL8qFdZykysms=;
 b=YGqaneIMOtCPTeIiLF/kpF5br4cFg039dAdXgmY6Et3hUgz2eoKA+qbA3Fww/NUPw6qWFWmMqHw2H4uUQRu2u/LsgJpLaM1O8IkFz3/rZqZNUQQIL53KJDlXt+WBO0i+yMJiwcf/aa+wSOsbXnQRLsd6MvZsQt70TNm8Z1GuHak8aYjXJ8vwIM6ndtqfG35YGy54E90gzdAsL481pzR74qPFMBy1YaKf+1bKpQZSx4XDxcAHBe4ENLROEuadiP5pMvsRwNfiPuNas6zIkTZPcTMKU8yx00fuyV2RbCjqm3BQbURQylj2QM6LNtRQFz6Jl7xp18iZ3xqKCynniKrHGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50BBhjvGDLp0Im/N7oj9Q0KHYDwbeRyL8qFdZykysms=;
 b=s2jlYTY6frsNKW13jqELkbjHfwRjfQamfX+ec09t3rCzP9zlqyHPvgrZdjWJXtTJezmKzAKQzNLYM6a0/XBVFILoD+qrnwEVx/BnLzvdWKhV0Ju2g+0QwwVYhx92p5UIwRUQRoC2LSRghGkeUS97omQTjX8TjRfv5ZNUlNIUyB4=
Received: from SN7PR04CA0157.namprd04.prod.outlook.com (2603:10b6:806:125::12)
 by PH7PR10MB6458.namprd10.prod.outlook.com (2603:10b6:510:1ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 13:11:30 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:806:125:cafe::d5) by SN7PR04CA0157.outlook.office365.com
 (2603:10b6:806:125::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 13:11:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 13:11:30 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 07:11:30 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 07:11:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 07:11:29 -0600
Received: from [10.250.150.72] ([10.250.150.72])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60DDBOw12303905;
	Tue, 13 Jan 2026 07:11:25 -0600
Message-ID: <880e6dc2-e4bb-4628-89a4-a487264e4475@ti.com>
Date: Tue, 13 Jan 2026 18:41:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: ti: k3-j784s4-main.dtsi: Sort the
 nodes in appropriate order
To: Abhash Kumar Jha <a-kumar2@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
	<kristo@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<krzk+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <p-mantena@ti.com>, <m-chawdhry@ti.com>,
	<u-kumar1@ti.com>
References: <20260112085113.3476193-1-a-kumar2@ti.com>
 <20260112085113.3476193-2-a-kumar2@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260112085113.3476193-2-a-kumar2@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|PH7PR10MB6458:EE_
X-MS-Office365-Filtering-Correlation-Id: 4223ba15-a44a-46f7-f4fc-08de52a5448b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|34020700016|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzJhZFJxaWhZbEdkcHQ1cDBicVZ4RXZ5MDV0R0o4N3E3TWd5Z2UzN3VJYmMw?=
 =?utf-8?B?R2JrQ1RLdER6elFKNkNWc0VEdTZIZUpaNUV0WW1GbEM5YlJTcEpmajhxTUhD?=
 =?utf-8?B?NFBaelNLMGRlaGp5R04yZVFQVFh2enBqQ29OdHVtQ0VxT240S0tteGk5b1Np?=
 =?utf-8?B?M1luWk4wdjdoekt0UWtCTjM3SWFNemY3NGhIMUNodnlIWlpEMHYvZWFiRWFL?=
 =?utf-8?B?VU5WS0ZjaG9qSEFlaHVCZE91MzBQaHdqOTNKeExLT2ZHSHRVZkZ4VlR4TGhO?=
 =?utf-8?B?b2FTVjVnaTBpVUtlSzZ1NGxlc0dhK3BhM1h1TlgvNVJCWkE0UTR0SlZKYUUw?=
 =?utf-8?B?dENIMmIrU2RveGRTQjc0STFzVmd3ZUlaZXE4ZW9QYVBYbkJ5cjR4YjZCQ1dW?=
 =?utf-8?B?b2JxZTJBMlBGR0RaRzB1cXAzdjlpOWRsU3Z5Rjhwd2tCWjkyRHI3OEhaUzZl?=
 =?utf-8?B?c2RvUVJId1NZbVZmeVphTHVzd1RMd0labVRVbmhQS2x4STVHUitvRXhPRXFT?=
 =?utf-8?B?blZudy8vZjFNWDFoZGRjMVU2b1d4TXp4OHJic0kycVIxQTJrdTQvZlB6Nk9u?=
 =?utf-8?B?dDRUYUp6Z3dwMWpoNXBvcHowcm9RcFY2Z0t4SytVRlVOQkE5UTg5Mjd6c1Yr?=
 =?utf-8?B?VTNwYnppZGhOQ2dZRXpFVnRCRytuYzdPQU9BZkFpdE9yYVh1RCs1MEp0MnVh?=
 =?utf-8?B?a3lvNnFEMzU4U0FMM2FISXFONHpoN1ZhN3ZtN0pOa0h0RjBmWFlJQ0I1Vm03?=
 =?utf-8?B?d1UrRkdZMmc0SWZlQnI1ZFhSdURVNCsvSVc3aFNFVy9PMXpkSFN2aHBQU2g1?=
 =?utf-8?B?YmJiM2tDZjdwU0R1Q3RtOThtbmVwL2czd1l0MnhDTnpMak9BdkdXdGw4d3NV?=
 =?utf-8?B?b2s5ZFFLb3BlQzEyZzZXQnJvbDc1WjhneUpkUisvUHRsN3Ird0V1L3ZrTW96?=
 =?utf-8?B?TEhzYWlYczZ6cWV1eDhWK3lZSlE4QnFna0hUYWhsalVoK282clprVUxETnND?=
 =?utf-8?B?bjNYOTJ4OEVSdUk5dWR3RnI3N0QvUGMzZjlRZlRmNEVJWFE0NGhIR3NSRHpn?=
 =?utf-8?B?b3VidEJ4aVdUanZqVFFDd3BOUmhzbnVkVGpjNXErWlNZNzhCVklCTjZjT2kx?=
 =?utf-8?B?RnFzQnc2TDNSYmNhU1p3YUFvRnh6NTJoUURjcnhFMG1iMDJoelZuSEtWeS9q?=
 =?utf-8?B?V0xnN2lxY3NYYXZPT0pSTmhMREdSMTNIeGl1MENpZG53OWt2WWw5K1RMWDdP?=
 =?utf-8?B?UlgzcjNRdmNPeC8rZ01may9LVmdhS3ovU0s0OGo3TGs0Y2V3aHltU0dLS0Yw?=
 =?utf-8?B?TFpsZmxPWlZaUmMrOUh3NHBrNCthQzRlTENldDg1RGFsQzBxL1ZWUWhEOHZR?=
 =?utf-8?B?K245cldxU3J1bU9PMFBZcVJWUTNKVlZmK2o1SGprc05RMnNPM1hzd2hoeFFk?=
 =?utf-8?B?SmlmbzRkWk1MZ3dBWFNxMG1ISmdPZE82NkV0NjF3Z0w3ekpmcWZRUEJCSS83?=
 =?utf-8?B?czZ2aG4ya0lGaWFTL3RzZzdJcW5zTStjajM3TnJvREw3U0RDN3QwdTBIcC9t?=
 =?utf-8?B?NzFYUDF0MzhlWk4rVm83WWtmSlZST0dlUDFxUmpyejZRQnJVd2xCbGNsOG9a?=
 =?utf-8?B?VERUOWdpQkxpd25yYk1vbVQvaTNYTldZRDBRcjhDUEV1YVRQTHlXOWJST2sw?=
 =?utf-8?B?UDdiZk5QU0YzcHRSdDgrMmdwN3k1ckxRc01yOHk3bHFjSU9EeDJWWDB5Mldz?=
 =?utf-8?B?aFlxeUJ0NHo1cnBpc0JKYVJzT0xDa1JMZVdvYng0QUZFQjl2NGhsR2pJOEJR?=
 =?utf-8?B?V3NIQUZSTXNObVdDZHBUV3EzdkRKMS9WcW9PSEJTRE4xU2RoMUt6UmttY2F2?=
 =?utf-8?B?VGlWL1dibytKb3RIcThqNmlTcURhRFhRMlFHbjd5RDRvOTltN0pNM0ltcDN1?=
 =?utf-8?B?eENudmNOTzc3OTVDOUxyUmpwTFNESStPOXlMdk5Mc1JOZVJjZHJ6elA1SlhS?=
 =?utf-8?B?SUR1SUU3eGo0TndiWDBNTndJN0FBUi93ZmFBQkk0SzlhVUFyTXc3MTlCNWdR?=
 =?utf-8?B?MVVJVHI2VHFwKyt4b0xRY1ZmMklMUWVyY1ZlRE0xYmRyRWxtV0NhcXplWkYr?=
 =?utf-8?Q?Nlb8=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(34020700016)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 13:11:30.5631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4223ba15-a44a-46f7-f4fc-08de52a5448b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6458
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_051136_123176_6DBF6AD8 
X-CRM114-Status: GOOD (  15.04  )
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
> The device tree nodes should be ordered by unit addresses in ascending
> order.
>
> Correct the order by moving the dsp node at the end as it has a higher unit
> address.
>
> Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
> ---

Please keep clean up as separate patch or series.


>   arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi | 26 +++++++++++-----------
>   1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
> index 0160fe0da983..5b7830a3c097 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
> @@ -6,19 +6,6 @@
>    */
>   
>   &cbass_main {
> -	c71_3: dsp@67800000 {
> -		compatible = "ti,j721s2-c71-dsp";
> -		reg = <0x00 0x67800000 0x00 0x00080000>,
> -		      <0x00 0x67e00000 0x00 0x0000c000>;
> -		reg-names = "l2sram", "l1dram";
> -		resets = <&k3_reset 40 1>;
> -		firmware-name = "j784s4-c71_3-fw";
> -		ti,sci = <&sms>;
> -		ti,sci-dev-id = <40>;
> -		ti,sci-proc-ids = <0x33 0xff>;
> -		status = "disabled";
> -	};
> -
>   	pcie2_rc: pcie@2920000 {
>   		compatible = "ti,j784s4-pcie-host";
>   		reg = <0x00 0x02920000 0x00 0x1000>,
> @@ -113,6 +100,19 @@ serdes2: serdes@5020000 {
>   			status = "disabled";
>   		};
>   	};
> +
> +	c71_3: dsp@67800000 {
> +		compatible = "ti,j721s2-c71-dsp";
> +		reg = <0x00 0x67800000 0x00 0x00080000>,
> +		      <0x00 0x67e00000 0x00 0x0000c000>;
> +		reg-names = "l2sram", "l1dram";
> +		resets = <&k3_reset 40 1>;
> +		firmware-name = "j784s4-c71_3-fw";
> +		ti,sci = <&sms>;
> +		ti,sci-dev-id = <40>;
> +		ti,sci-proc-ids = <0x33 0xff>;
> +		status = "disabled";
> +	};
>   };
>   
>   &scm_conf {

