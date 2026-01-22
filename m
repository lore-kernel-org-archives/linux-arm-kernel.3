Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0BBD3EE6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 14:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UI8MNGlFqb4iswiqM+0G8SxoXKWkEl6ay/RaEOXRPNc=; b=ikrPprCdv5UwnH92ov7wP33ov9
	D+6Hd6PIjTeDKI0dzKlnyfwrNKLN2OSetkE7tcyIn0G7b5DTGPE+a/EO5SyyjWqrow07jjFtEaiiz
	9y1NwgzdW4XpnOp1Z/TODK75B+2gh6+aMDJrGXYP0k5h7kjqPgAQhLcr+NsmE9yygFv8wLDoCbIac
	NPGHn++8oZZyqXEwMrfbAcWKISOzj1CoKNWgR7j7MigNuJjSROPWdRkNvt7DRr0PEFT+H5SKiJUAw
	49XQGljHltG45E7q/Cw8qFRwpVP2sdlD3BkQ5Hvd1p1c6bMEt7mIwH7DvJL7HmscPlWjXGgjyd5KB
	oYjpPPlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivoH-00000007FUL-0Zvr;
	Thu, 22 Jan 2026 14:37:21 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivoC-00000007FTb-1yf7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 14:37:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gio+y2p3JiJ0eeskOxwWnmq+X8ZCzjqtYduwr7YLSPV4FaAxj+3ZVG8WHW+niHpxNN0Wckd2sW+Z5izEploQy9Eiuay8TPxADuUulfc8H0M24Y/3e2SpQJq89g2phUkv6eMMzsHfWqL0CNlzvvsO8UHksydoCi5jvMoolzNp1jeT35IYLJCnsiLuQ2EvOkEPYWazoeLT/ferKJ7Jfqi5ABhi2XGpgnrYNsTTzcGH6G9EitxtAqLMUTewDkbPBKu4FMZjr5qdwY+JwYE13paKc98J1D5d970+1Zigq62DkL6K8VNbEhyPyirCQ5259Z/+sza7nXUmjnQ1zgswUbLQCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UI8MNGlFqb4iswiqM+0G8SxoXKWkEl6ay/RaEOXRPNc=;
 b=GxEBA1ZVfdJ0GiI1/ZX/MmFVN9vHwn3kq/IqMVCOxPBHfBti1OD/N19tkSm0CChNfNtw+GjoD3UBtUafk35T1Fm0prl4WW7/u0oClGLZpDjvvoxgVDVXX/WceQeL2QT6zB960RQIO8iSoDDY7DmBwQzN2cIT7UJv1lObAmKTz6WnmwAlHwtl9kf+gnzKsFnBLWVV/5WZP/M4DvwYqCB8dhVRCmhWhf3nZ1MzwlWWwqNn9tTiMe29zqO2H3tB0JtTpddekO5PVnvo7+xv0i2SRjCwxUM/bURs2XtKdUg6G2v0KpiYf+kJJwzr/PnzEXN8uUW2y2vSLcwGJbHpFRTyww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=linaro.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UI8MNGlFqb4iswiqM+0G8SxoXKWkEl6ay/RaEOXRPNc=;
 b=ny19b9YgouHw+thfYpyb2YWrDifuLsIeEKd5Ys5LUq0xgzXPh8vhXsy8mu8c/MiC619erdOHxD4AUGXVQ2z9UZea51OZpxvHja5qOBxhMSP77vC+htvdcP2kCH2o2riRJvjNeuBlmqdmkhhjUPZbvxnN55zKlsu0bUury6df9xo=
Received: from BY5PR13CA0021.namprd13.prod.outlook.com (2603:10b6:a03:180::34)
 by IA1PR10MB7216.namprd10.prod.outlook.com (2603:10b6:208:3f0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 14:36:55 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::31) by BY5PR13CA0021.outlook.office365.com
 (2603:10b6:a03:180::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via Frontend Transport; Thu,
 22 Jan 2026 14:36:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 14:36:54 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 08:36:46 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 08:36:46 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 08:36:46 -0600
Received: from [128.247.81.19] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60MEaj94570707;
	Thu, 22 Jan 2026 08:36:45 -0600
Message-ID: <77815f93-e5cc-407b-8e09-93b007f3ecc9@ti.com>
Date: Thu, 22 Jan 2026 08:36:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62l: support cpufreq
To: Dhruva Gole <d-gole@ti.com>, Nishanth Menon <nm@ti.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Bryan Brattlof <bb@ti.com>, Viresh Kumar
	<viresh.kumar@linaro.org>
References: <20260122-am62l-dt-cpufreq-v1-1-fabcc15e25fa@ti.com>
Content-Language: en-US
From: Kendall Willis <k-willis@ti.com>
In-Reply-To: <20260122-am62l-dt-cpufreq-v1-1-fabcc15e25fa@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|IA1PR10MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: b6eef398-ed3a-4173-73eb-08de59c3b060
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzFYQURTbm5ic1hMbW44d2Y4cWZIMWE2Tm91Y0pCU0d0QkZhdWNOemJCMjVD?=
 =?utf-8?B?VWNnTDFXSWNiRTBoVjcvdnNQRzk5STc1dTJXdkVyWlJ6SGVjcy9hbENwa1lL?=
 =?utf-8?B?K1I5Y1U3QWRHaGxoSnNjZ2ExNUhhTUVKdEc0cDU5OWZBUmVYam43S3hJQU9X?=
 =?utf-8?B?YlQ1NzJHek8zUE9CTXMyQzFXbmRQV1BJRkhRQ2J6Zzg2cC9pSENZdlF6blBH?=
 =?utf-8?B?S1AvNEtiNFg2TzZNUmhFQUllNUJ3NHZBZGRueVZxVlRHcUlrR0NDMWxkeDRH?=
 =?utf-8?B?ejdqL2lPbEtGOWZESVgyc1NWai9sbE5oS0RiWTBVVTN6MkFrK0FTR21vaFhR?=
 =?utf-8?B?a2ZRVTlWTjUyeHBRdjJaVUQ4Y3pYZUZGNEtiSUYxemx4UDk2dVJpaFlkWlc3?=
 =?utf-8?B?N1FyZFFFWnp3RVlDWk1UNmFYMjhHT1A0RXlSZ3ZrY2o4QjI0ajhKdXRQSFFU?=
 =?utf-8?B?eDdTUmlxUURhYURVYUVUakZ5RVFhTHpPcHlFUnhHZkdFMUZXSzgzSVNFZFlo?=
 =?utf-8?B?ZVd3ZElKUytuV25zVWd2V1J5Z2Zhc01Fd0JZN1lXL2dCWmN0MXRxOEpocUVx?=
 =?utf-8?B?UmhNRGVyYW10Z0VNRmRsRWRBQmx0ZEJGSk5jOEZvbXY2S0R6UE8zMlFoNGZM?=
 =?utf-8?B?VFpnWEkwVmN4b3pRd01qTm43dzVpWjladlhuVXlYaG95Yjl3TmYyVENkZ3da?=
 =?utf-8?B?OTI2SU5LUzFvOE1ncmRaeTB3MWxPSy82ZS9abkhxb3o3RE5Ka0ZoRFpFc2dw?=
 =?utf-8?B?NDBvVGRWWk4vTHlNaTJSc29sQUdkMVY1THlxRW5DNEs1T0sxWnFic1Foa1FO?=
 =?utf-8?B?ZnA0d2Rpek1RZXdUNll1bExMVHBOeG02MnAyUEc4RXQ2R0RJTitZK2hZL2p1?=
 =?utf-8?B?MDNMRG83ajBtVC9xYnphUnZQNGZzUE9tZm02Y3FsVjVINXRjS2NYNGV3c2po?=
 =?utf-8?B?cm52MGVBY0FPRG5qM0xRUFYxR2JoMW9kVlVFOGV3WVVYczZScnoxUDA3NnRG?=
 =?utf-8?B?Z3JjbXZQSFl1aHBtVlEvbUswdzVJVGQ1MnMrWER3c1NYYkVjbkx2aHpJcXJk?=
 =?utf-8?B?TlRsMzFkcW9TbWY0WjE0RFpvcVJWVWwyZUVySFZnQW5VRTR3QmxuajZsSnR1?=
 =?utf-8?B?SVhMcElvSzY4bXFSRXR6SmloOENzMUZmOFRTUVJka3BqTnJ1YnhuM0JMeEpP?=
 =?utf-8?B?azRRNlJjOEk0WTJBQ2tycnRidEdjcTRNMFhTUWNmVGc5Qm51S20wbVRUaVh2?=
 =?utf-8?B?Q2lDeWFCWVlrWTEvSHhzbURaWEE2UzBGakZ1b3FtYjhmNnBHT1hZa2pxbE1K?=
 =?utf-8?B?ck9COXd4cis5UkNQMDVhTk9DT1hQNXFxTzNiakI3NVJhWjV0THNWMStpVktY?=
 =?utf-8?B?cFlFUWx1ZkFZYyszeERvTzFhRk5oVkQ1Z3NacTBqcW1Taktwc0c0enFwM2xT?=
 =?utf-8?B?aE43MWxQaFljZlJqRGNZL2xVWnFSMURGMjdpYVFoZVdjWDhkbW9BS1hZSWpH?=
 =?utf-8?B?WHh0QnlFWXBuMENQZ2x4ME9pL3JsQVI1MnJlY1gwSmFQMjRqcDlmMTl3Tk5P?=
 =?utf-8?B?WWtzTzNaWnY4d3JMN1VHQll2QUtxWmF2RHZVc3dKeG1TR2JYakwrblVxNmVH?=
 =?utf-8?B?ZXJ2d3VoY2pEUy9LMkxTa1FUbGMrb3dhTDV5Q3N1aUhXWVJQK3VnQ2I4bWJy?=
 =?utf-8?B?c0ZqR2hDdGpqZ1RCL1dPVFlYa1NFV0IyWWhNc1hzd0FhbThYWWRpY2R0aUZV?=
 =?utf-8?B?elNPd2JKSCs3cUF4c1BFT0ZFMEM0OS95T2RaV0Q0MzNvU0NvS2FwQU5aRWNX?=
 =?utf-8?B?VzE2QTJKcko0ZmVIcEMzeS9hVGp0NnZrc0dyMFlodUp3c21KZzNpRVMrVUNr?=
 =?utf-8?B?TmpKbncrVjhJanJOSWY5UTc2R0dLakJ6RzFuWmk0OHA2WWd1QnVZQWxOZlNE?=
 =?utf-8?B?UDNzTkN5VXZSYzJ6dkRNNFBHVDZvZGxTUnFlZ3V6enR4S1NmYUxzaXhrZit3?=
 =?utf-8?B?Y1BKQk9ZMHB3UWYvU3NtTXgvY0x2NmpxWmI1ZUVMR25ZUngzRnlMQXQyODdp?=
 =?utf-8?B?L3kvTy9rZkZVbTQvVVI0SzhDa3dMNHN3clU3Q0ljWVJwVkJMelBVVkVZNUdO?=
 =?utf-8?B?ZlppQkN6cCt2dmh5SUluUTBESVRtSmxvcmNzMzNtQkJQd0gvbzBYcFNwSzZX?=
 =?utf-8?B?V0tjR2hNTlRXWFdZVXV4SytLOWZ4akpkeFNmQzRKbGxiUXZsUGRMVmxoYmxL?=
 =?utf-8?B?UnhIMWE3RkN5S244UHZ0eUtMT1l3PT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 14:36:54.4517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6eef398-ed3a-4173-73eb-08de59c3b060
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_063716_879270_E3A6E896 
X-CRM114-Status: GOOD (  19.86  )
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

On 1/22/26 04:49, Dhruva Gole wrote:
> Enable CPUFreq support for AM62L SoC by adding the relevant OPP efuse table
> syscon to k3-am62l-wakeup.dtsi for speed grade detection.
> 
> Add the operating-points-v2 table with CPU frequency steps from 200MHz to
> 1.25GHz to k3-am62l3.dtsi
> 
> Configure CPU clocks to reference the SCMI clock controller for frequency
> scaling
> 
> This enables proper CPU frequency scaling capabilities for the AM62L SoC
> using the ARM SCMI protocol to interact with the power management firmware.
> 
> Signed-off-by: Dhruva Gole <d-gole@ti.com>
> ---
> The driver changes were merged previously [0], and so the DT patch
> is now being posted seperately.
> 
> Logs:
> 
> root@am62lxx-evm:~# cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_available_frequencies
> 200000 400000 600000 800000 1000000 1250000
> 200000 400000 600000 800000 1000000 1250000
> 
> Changelog:
> - fix the bit fiels in the OPPs as per Kendall's suggestion
> - Fix the scmi_clk ID of the second A53 core
> 
> [1] https://lore.kernel.org/all/20260120-am62l-cpufreq-v3-0-8c69b80168a3@ti.com/
> ---
>   arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi |  5 +++
>   arch/arm64/boot/dts/ti/k3-am62l3.dtsi       | 47 +++++++++++++++++++++++++++++
>   2 files changed, 52 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
> index 61bfcdcfc66ea8d802a36ed43cd01fbbf3decc70..a42ccd0d2fcc4d204cae81508f839c44ce83f558 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
> @@ -127,6 +127,11 @@ chipid: chipid@14 {
>   			bootph-all;
>   		};
>   
> +		opp_efuse_table: syscon@18 {
> +			compatible = "ti,am62-opp-efuse-table", "syscon";
> +			reg = <0x18 0x4>;
> +		};
> +
>   		cpsw_mac_syscon: ethernet-mac-syscon@2000 {
>   			compatible = "ti,am62p-cpsw-mac-efuse", "syscon";
>   			reg = <0x2000 0x8>;
> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3.dtsi b/arch/arm64/boot/dts/ti/k3-am62l3.dtsi
> index da220b85151227c63f59b2b8ec48ae2ebb37e7bf..26d3040ff53259daba21b39a55bb8a2ed65d4e8f 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62l3.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62l3.dtsi
> @@ -39,6 +39,8 @@ cpu0: cpu@0 {
>   			d-cache-line-size = <64>;
>   			d-cache-sets = <128>;
>   			next-level-cache = <&l2_0>;
> +			operating-points-v2 = <&a53_opp_table>;
> +			clocks = <&scmi_clk 356>;
>   		};
>   
>   		cpu1: cpu@1 {
> @@ -53,6 +55,8 @@ cpu1: cpu@1 {
>   			d-cache-line-size = <64>;
>   			d-cache-sets = <128>;
>   			next-level-cache = <&l2_0>;
> +			operating-points-v2 = <&a53_opp_table>;
> +			clocks = <&scmi_clk 357>;
>   		};
>   	};
>   
> @@ -64,4 +68,47 @@ l2_0: l2-cache0 {
>   		cache-line-size = <64>;
>   		cache-sets = <256>;
>   	};
> +
> +	a53_opp_table: opp-table {
> +		compatible = "operating-points-v2-ti-cpu";
> +		opp-shared;
> +		syscon = <&opp_efuse_table>;
> +
> +		opp-200000000 {
> +			opp-hz = /bits/ 64 <200000000>;
> +			opp-supported-hw = <0x01 0x0003>;
> +			clock-latency-ns = <6000000>;
> +		};
> +
> +		opp-400000000 {
> +			opp-hz = /bits/ 64 <400000000>;
> +			opp-supported-hw = <0x01 0x0003>;
> +			clock-latency-ns = <6000000>;
> +		};
> +
> +		opp-600000000 {
> +			opp-hz = /bits/ 64 <600000000>;
> +			opp-supported-hw = <0x01 0x0003>;
> +			clock-latency-ns = <6000000>;
> +		};
> +
> +		opp-800000000 {
> +			opp-hz = /bits/ 64 <800000000>;
> +			opp-supported-hw = <0x01 0x0003>;
> +			clock-latency-ns = <6000000>;
> +		};
> +
> +		opp-1000000000 {
> +			opp-hz = /bits/ 64 <1000000000>;
> +			opp-supported-hw = <0x01 0x0003>;
> +			clock-latency-ns = <6000000>;
> +		};

Thanks for implementing the feedback! One last thing is I think 
opp-1000000000 should have the opp-supported-hw value of 0x02 because 
speed grade E only supports up to 833 MHz.

> +
> +		opp-1250000000 {
> +			opp-hz = /bits/ 64 <1250000000>;
> +			opp-supported-hw = <0x01 0x0002>;
> +			clock-latency-ns = <6000000>;
> +			opp-suspend;
> +		};
> +	};
>   };
> 
> ---
> base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
> change-id: 20260122-am62l-dt-cpufreq-c24f0236ad15
> 
> Best regards,

Best,
Kendall Willis <k-willis@ti.com>


