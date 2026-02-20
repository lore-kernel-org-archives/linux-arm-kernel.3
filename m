Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F03C54FCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 09:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=si2Ed7ziP5KxcRfMVdSuTpVjs9xBjGJGZP1wFgdZslA=; b=xYsZ5Px8xL3Rd1gLAAajap6doM
	orw9DMsKxWevAnXI3f7VkSocE2EEejX+RZ0SNzFcGpOQATe3M3ltBSTust/iVntgoAYqMNg2oV4tn
	7qT4OV2mAPCxdhJjZ6/jTFx6vnkPBWeYfKmlTWmIcbvck3YNA/GisBxW+RezLqPv3KriXXwKEjxG3
	y+O30r6t2xgR0IlZ1s+sFpu19vRWv926uNWQQ0Ugt/7Otm7xInP82CVsV9J/t60XMTL7nleHXAIfZ
	b1lxX8O4tFn0UHxFk7DTbSa3Q6uEIiywqCKNIwn9h+gzvlvQZdtqWxHeIIl0ayWmffBR2tBxYP8es
	B/9RCW9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMP1-0000000DSGg-2TGM;
	Fri, 20 Feb 2026 09:02:23 +0000
Received: from mail-southcentralusazon11012044.outbound.protection.outlook.com ([40.93.195.44] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMOy-0000000DSGD-3NbC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 09:02:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKgj7fq11hdCpJBhegSbSdXtkVhXjuoXmcrU7YQ0d01hWIDWvOU+HoXhunVp4+V1g04PW6Q5tGvhIKtC01sjS9cxTvGpxzDbEmnM13WLy2Jew3sBEOB90nMKLNWCz7HnMLC/obSwXp6CghjI+/EOXGXB8S5icFIyQ2dOm8p5iWTyrMD917hz4Gbi3T1jlcL1tPJab1gz8PJS+PmNrpeFMJfTvZplFHB9P33MQt1SFl4IsPGmM9gEfXlp4frLPczfA/nO5L1Mzux0RFahI49A7Bt5A8/YQX/H9SPcJ7kqWFyvpDGvhsGgWII1LUFNBThhNMSBPs0nHgQSyxY0ujMPYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=si2Ed7ziP5KxcRfMVdSuTpVjs9xBjGJGZP1wFgdZslA=;
 b=Q/K4usMj7nnGryur/yrR9UiSGmVRlAJgUCy0rRxyxPkD6f5SGdsRUQP5wikrgXVQojFRgjJr9UE8Dke8gHfc92XKLRgMRLQu3EKXSvmZ5P7JA76NqAuVByK0golZdKvj5Xf4LbfvKl9TDhrySHPcZNdlSitAwPCRU25AdxReLfF3PRc1LItXqQRkaSmZQuJ1c2VTS1lo8Q7TV1I6h6Ryyvgw/IlVND8VCS6h/32tlkLHAhYC+MRgqMNnwA2WdPfoY283s2RLm0WmGHoX8uMLqHZ7I2yFVt3sKXXvSlmItH2Wkd8DiSRHUErDni1VGC6CFzcs8ylufl4AlKqTI0EuLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=si2Ed7ziP5KxcRfMVdSuTpVjs9xBjGJGZP1wFgdZslA=;
 b=sECGQnnnhWobM6Mway72G6sShEg/OSIcW+3skDa4k/bl1oZhYkSW7LrR3GkH+y2hXxOROo1aTC/ykkvlbl2ihkPjKjni5GJZd+12hVJCdgPhTeX+No09p1p8/axy4KlJ1xnXznIxFYxWRzAHmKTaYEbKUWPpnfqG85xtZeJs+9A=
Received: from BYAPR05CA0104.namprd05.prod.outlook.com (2603:10b6:a03:e0::45)
 by IA4PR10MB8256.namprd10.prod.outlook.com (2603:10b6:208:56c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 20 Feb
 2026 09:02:15 +0000
Received: from SJ1PEPF00002317.namprd03.prod.outlook.com
 (2603:10b6:a03:e0:cafe::25) by BYAPR05CA0104.outlook.office365.com
 (2603:10b6:a03:e0::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Fri,
 20 Feb 2026 09:02:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002317.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Fri, 20 Feb 2026 09:02:14 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Feb
 2026 03:02:14 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Feb
 2026 03:02:13 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 20 Feb 2026 03:02:13 -0600
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61K90LQ83602457;
	Fri, 20 Feb 2026 03:00:22 -0600
Message-ID: <696e0132-b54d-45a5-9c88-ba9324f17e26@ti.com>
Date: Fri, 20 Feb 2026 14:30:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: ti: k3-am62-lp-sk: Enable internal pulls
 for MMC0 data pins
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
References: <20260212184246.2316659-1-jm@ti.com>
 <20260212184246.2316659-5-jm@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <20260212184246.2316659-5-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002317:EE_|IA4PR10MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: a309dd7b-369f-40a5-b981-08de705ebe0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1FtK2lDKzc1aFVpOHZpREE1cEJGa0U3RTUwYVNpTnZKZjFMVG10RG8vaGxy?=
 =?utf-8?B?b2tnWnErOWE4aG1oblJQdGJxRGpDdnVsejhUWklBa2oxb0VqbDE5MlhCeXpp?=
 =?utf-8?B?eWVqbTlkd0hoOS9uUG1TL2hGZXV1TDdYbitjV2VEcU5xTGpuSEhPYmlWSUtu?=
 =?utf-8?B?WDRzRlgvRVdkaE9JalRjM1VqYW11bEd2QXRXOVVxUkhadW1zTTZmZys2cUJB?=
 =?utf-8?B?eWpSVE9JZGlLTjgxT1phSXN2dkczU21pam9iRDlBc0lubFIrMjhKa04vVlR4?=
 =?utf-8?B?MmZ3NjVjQ1YrSlF0ZlgvR21UZy9mZjI4UnpvN0VhNGVVWElOY0c2TlZOVUFB?=
 =?utf-8?B?Qk1jWGhzTDc4aFZrbHc2Q1FzNlhmK2xNZkx1aFV6YUl2ZWJiWkR0bWN3SmY5?=
 =?utf-8?B?K1l1MnNkNmVpdnYxZHcvc0VPMVU3NGpMdVMvSjhQcXRNa3NQY0tncVF3ZEJs?=
 =?utf-8?B?MDdrL1hvdE5INW9HbWxEc0I2MEkxNG93L2dzcUdvUHA1SldhN1MwRHorSS93?=
 =?utf-8?B?QUZjUnJJaHkvTk9rMXVwM1J2N2MvU0FUSGNJazZwczZrbGNpTzJjTWZaOU9j?=
 =?utf-8?B?ejcrb2N2TEp5NG1JRWZhRVh1RHFPOEV5SzNsUDNVTSsxVEtKR3pta0Q2dE9w?=
 =?utf-8?B?WUFFVjdsN0hxN2d1T1NrVFc4VFoyVkRLSTlrRU85YTB5Sk1RTlVleEJwcUJp?=
 =?utf-8?B?dGlKRm0xYUMzYmROREcyTnNnODdjcktZYzMxdFhtbCtwRWJ5eDZzSllEbm9J?=
 =?utf-8?B?NFpTSUszVVl0S0tkTjU5MXhzSXhmQ25jcWlTZ2hud3Zvdko4V2FmZ3VEam1V?=
 =?utf-8?B?d1ptSGxLOEFqbStrTEt0d3BSNTNTVUNldk1qTUlzakVySXljcEp5dzhoWldS?=
 =?utf-8?B?amlnZDVsbzdiWERlOXpNeHJZOThWa2dZakFVU3RJNXpSK2g3VmZuY1h0NE9a?=
 =?utf-8?B?L0RmLzdIRXMxams3aWJTUW9RL3NIRDNwZGpjREZ0TzRVUFU2ZkpSblYwSDI0?=
 =?utf-8?B?eWh4Ujd3VkVmajdsYVN6UzNMaXhFRDBDNlZKOFBIUEpWU2tEQ0xwSFhvaGVM?=
 =?utf-8?B?a1JibFJ1L25HSUc2VWRDeUg0SndkdlFwYU5xamVuVEFiU3ZOL0tCSEY3RkFS?=
 =?utf-8?B?QlU3WkdUR2hCaGZIYmRxb0tIRlI2QnY5TW9YMXEvVmYyN0RZWmZRd2FTWTRQ?=
 =?utf-8?B?YlJHalMyUHR5aW92aEY2WGJpcXFibHdNSDM0c2V1eElXS2RDQXR1NnBjWGtD?=
 =?utf-8?B?aWxTdW8raHhLVWZPQTg2ekx1MGdtMDlSYkVSaGVzQVplTEExMHNnMDR1Ym5U?=
 =?utf-8?B?bWoyMFVDZ3A3dkNEQ2JmUlZjazBRVitVQmdoN3FpTnRvVzFrd2RPK2t2eXlw?=
 =?utf-8?B?VU52UkRMV1dLRUJWUXB6elBLb2JZaW80Qjk2VFhpNVFhbnNLSlFEVEVkcEE0?=
 =?utf-8?B?cG54aG8xdWtUODMyaHlFYTJBMGNlR0t5Z1dSQ3FROS9mQVN1eEFQZVp4T3h2?=
 =?utf-8?B?ZTluMHNueWRWemhhU1ZpblRRMGdJYTF2K0JZRVFRK05kbFdsNmduK3JjZkJr?=
 =?utf-8?B?cStmSkx6aklGWEprWnpvWnE0MkEwdTVCcmhvUG9wemRwM0taSUxyY3BTa01V?=
 =?utf-8?B?WXZlYkJTcnNjamozN0pUY2xLK1lnQUY1d2FQNjJYN2dxUitlTzRDTjIxcm52?=
 =?utf-8?B?Nk5JcFk0N1gxa2pmSkxNZEMvN0VXVzYvWVA0MkF6MFcyOU5ibFlxcWRRL281?=
 =?utf-8?B?SWJkdExLVlphaHlicTFFZEhGbFpidzEvKzZwZUZXbGxPeXdWa1J2VUNOc1NR?=
 =?utf-8?B?am94ZDF1RjlWMFZLMmJsSG4wd3JCQ3NVMnZXQUswOTJoQmExN0oxL3ZBcWxJ?=
 =?utf-8?B?L3lKZ1FWQ1VNbC9HaUNpR0cwOVl0L3FTTjBnUEZKbmJ2V1FmQkFvYjdzWlJj?=
 =?utf-8?B?SzByRGMxTjhycFNnaG54Nm9uQlA0UU9iZlFTQytBMi9HbWVwT0o3MURmQVox?=
 =?utf-8?B?U25qWUVkRk10L29mQzN3c1YzMjBhaHM2aFU0alh6SDRoV05Da3pVMnhFVCtK?=
 =?utf-8?B?Q0o3MCs1M1hJMG1YZzYvdE4zQmZZVmpNNW92bnlDcjZPY1pGZlBFRmxkYzdY?=
 =?utf-8?B?bXpkTVA1QlYxd3loNS9iRkJib2lVRnBYQnJNZUFjY3lhNTMvZ2d1K09KNVNN?=
 =?utf-8?B?MlpzdVkwdmxSSFl0bG5BNHpLQWVHWHByYml5K2Q5dlpFR0psZTQwSHZqdjFZ?=
 =?utf-8?B?MHlrTXRBQ2lDUTMxZEJtQ2ZzZEhRPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ywzeJoDbPNJfPj6avs/9/s+bcPJmc9HqPNy8qsxTqAcpCbxwnX/+HrXDbuCDyFcZiokBvDumW9nmNDuDrDvVQ+C7ca7Veg5jIczEgTeuqdWB6x3gGNMTIox7xk5849oUe2xEM1Kh9UpQFKyU+dWo7lqOvrqotfdbH1kK84Qx8TSK3oON9B8x9MS9SLjPun++f+esdsj16CZGMzpt1sTSo/CAAsOTUKhaGKSFTq2R+wqxX5WiTbX+LxW50RZPaDuK2gSiwltCbub+vGpi8SZnVnBmf/jcZuF2h0F7zLaf2lnlQxW9II6eQ9tPCEZbOJV76cX6IsNObkBGqTWran52tQfAkDmFlBOYC09U5QTZB5sTRjLA6mSJFd0kFnRHt4gw6xLHxPFGiBnwP1f2u+F+JiPeMJocYiwQL9MQgetJJsMJjvgCStJh8oYkYIVTeyWp
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 09:02:14.9663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a309dd7b-369f-40a5-b981-08de705ebe0d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002317.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_010220_848835_D33F0EF2 
X-CRM114-Status: GOOD (  12.11  )
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


On 13/02/26 00:12, Judith Mendez wrote:
> AM62 LP SK board does not have external pullups on MMC0 D1-D7 pins [0],
> enable internal pullups considering:
> - floating lines violate JDEC spec recommendations
> - mismatched pullup resistace between D0 and D1-D7 may cause potential
>    issues for modes with tighter timing requirements. The different pull-up
>    values cause different rise/fall times on each data line.
>
> Fixes: a0b8da04153e ("arm64: dts: ti: k3-am62*: Move eMMC pinmux to top level board file")
> [0] https://www.ti.com/lit/zip/SPRR471
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
> index 3e2d8f6695351..8a556fbbe08b7 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
> @@ -88,13 +88,13 @@ main_mmc0_pins_default: main-mmc0-default-pins {
>   			AM62X_IOPAD(0x220, PIN_INPUT, 0) /* (V3) MMC0_CMD */
>   			AM62X_IOPAD(0x218, PIN_INPUT, 0) /* (Y1) MMC0_CLK */
>   			AM62X_IOPAD(0x214, PIN_INPUT, 0) /* (V2) MMC0_DAT0 */
> -			AM62X_IOPAD(0x210, PIN_INPUT, 0) /* (V1) MMC0_DAT1 */
> -			AM62X_IOPAD(0x20c, PIN_INPUT, 0) /* (W2) MMC0_DAT2 */
> -			AM62X_IOPAD(0x208, PIN_INPUT, 0) /* (W1) MMC0_DAT3 */
> -			AM62X_IOPAD(0x204, PIN_INPUT, 0) /* (Y2) MMC0_DAT4 */
> -			AM62X_IOPAD(0x200, PIN_INPUT, 0) /* (W3) MMC0_DAT5 */
> -			AM62X_IOPAD(0x1fc, PIN_INPUT, 0) /* (W4) MMC0_DAT6 */
> -			AM62X_IOPAD(0x1f8, PIN_INPUT, 0) /* (V4) MMC0_DAT7 */
> +			AM62X_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (V1) MMC0_DAT1 */
> +			AM62X_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (W2) MMC0_DAT2 */
> +			AM62X_IOPAD(0x208, PIN_INPUT_PULLUP, 0) /* (W1) MMC0_DAT3 */
> +			AM62X_IOPAD(0x204, PIN_INPUT_PULLUP, 0) /* (Y2) MMC0_DAT4 */
> +			AM62X_IOPAD(0x200, PIN_INPUT_PULLUP, 0) /* (W3) MMC0_DAT5 */
> +			AM62X_IOPAD(0x1fc, PIN_INPUT_PULLUP, 0) /* (W4) MMC0_DAT6 */
> +			AM62X_IOPAD(0x1f8, PIN_INPUT_PULLUP, 0) /* (V4) MMC0_DAT7 */
>   		>;
>   	};
>   


Same question as of the other patch, won't the mismatch in resistance 
between D0 and other data lines will cause an issue here.

Regards,
Moteen


