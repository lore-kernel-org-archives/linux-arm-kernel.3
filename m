Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F92FC54FCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 08:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lv7j/oUKMfYeW0dvlVjeO/Zomp+b/bd8frge7c1eBqg=; b=D0iaFmUrwJKNcB1zvWDJiyrDLx
	6GPoPt+xfI4q2k5QdyEZdpdc4ng9bgIhKqgQ6uJabj+YlfbuYcdAJXkVWRLbLPuVABYxSU3y5wshT
	NilDdPPi5+NU/2F9fiEpPp33nF4c2vtMsa4dldFDoZHF+iLIURArjA8R3ZfgPTcM+NmnyPllcYChp
	K6qQfOqcTXbr+WZg/6CN/q05MOCgb3lNQxsWGxH/aVvHYXUxPLhqeu9W8nbnaIbyRuWX1L0uk4xEM
	smhpKscNQ9PQ3SmvWJKQxCZWfLMUGriKuZUYFImAQNV3qCLDkefmTOTU4DkNVCkZACmh8Qtvxtm8B
	PKBrZBfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMCo-0000000DRRs-1jpP;
	Fri, 20 Feb 2026 08:49:47 +0000
Received: from mail-centralusazon11010034.outbound.protection.outlook.com ([52.101.61.34] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMCm-0000000DRRZ-0csv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 08:49:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lihgW4DL2XDWPyC5hobyHSu9gleLeqdrLuMAjAJ1WdTuViD67ZiAidLyBQpdIRq2rh8kbIACDndPZOrwKO2473PVHAq2rglSvxYEVFs+p1m/HQqIrsoIf0qQsgCxa/q+JedpxjNS565yA6sUpaS1m1eljOjaHAr6c8mc08RFk1+qI8XfWDqYe9Acv35S36jxgQOsDw/niAISHKHFQyrTsVPNrB7eYCH0mzvz61rklMV9KGv5OnYWGiywP/8Ws2HQ98CSzYXdzdxRLJk6dIUCGHsT4FbKz22gudGZZ1AuK2MIRVZQj66z1lB05vfF8Lur7phkcby1dUnhT23FqkBmLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lv7j/oUKMfYeW0dvlVjeO/Zomp+b/bd8frge7c1eBqg=;
 b=FLNdk3DhQYi4j6ok4UcoytAEwTKF4BudWiuZLYwLFk9FHF/3VzcJ2dsWdHCBogOpMuLINOkdmwsMXb+exOUheBF0rDYZubh79vgauWlvzPiBKfzNb3SVpJ5LfZ+R+jhUzQNyIMf/28G47s+qSgD5OfGhbflX9Me4qjlNg/QBoJTtkf5h/yovMatwt20U+YOzQk1CeoKAYecMFi+slFKtOSUh2LbcI4SbQp12nxHpx5beDI20hzEeFAFu3wlJ1q2VPSyv4bEac8H9Xb2dGa8mbgWEvbklIyUgpotPaeplXLHgQyt6uIfl8mYlCoykaEnTFKY6iANbKQtwPNTj2nJsXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lv7j/oUKMfYeW0dvlVjeO/Zomp+b/bd8frge7c1eBqg=;
 b=rOiDgvUqVDnMbS19CY4aoDjHahdQPRpO8ZyiZWFMQiuX6v6p+ybJXW+4rBNSYgtiHLtcEUBeF9becaEr9DzINXRmA+qSl8/jQ+cSdjYwv7LZoY7Id1QNhZGJUGiCyMV1TyclvwAj4SXRetVfIPKVTmtEBLEMSB4qKRDGleAAEPo=
Received: from CH0P223CA0017.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::13)
 by IA0PR10MB6865.namprd10.prod.outlook.com (2603:10b6:208:435::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 08:49:39 +0000
Received: from DM2PEPF00003FC8.namprd04.prod.outlook.com
 (2603:10b6:610:116:cafe::ed) by CH0P223CA0017.outlook.office365.com
 (2603:10b6:610:116::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Fri,
 20 Feb 2026 08:49:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DM2PEPF00003FC8.mail.protection.outlook.com (10.167.23.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Fri, 20 Feb 2026 08:49:38 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Feb
 2026 02:49:35 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Feb
 2026 02:49:35 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 20 Feb 2026 02:49:35 -0600
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61K8nWJE3586050;
	Fri, 20 Feb 2026 02:49:32 -0600
Message-ID: <fea8ff29-5e3f-40fb-b375-eb63926e4de2@ti.com>
Date: Fri, 20 Feb 2026 14:19:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Fix MMC pin pull configurations
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
References: <20260212184246.2316659-1-jm@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <20260212184246.2316659-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC8:EE_|IA0PR10MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: 88715249-a8c9-45c4-079f-08de705cfad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDBwZkxpczhqMFlhM1lneGhLUnl6VnF6RGI5L0Z4VnRIZWp3KzJBWk5NSmQx?=
 =?utf-8?B?YTE1eFM5dEpGRnIvNVZIVjh2S0lmd0QvSUN6MkdrNUk1bnY2S1JsdFlmS2FK?=
 =?utf-8?B?R3FEcjZkYWk3OHdZd3hVaGlZWWR2NW9qMjdPbi9hUURUWTRySmxUUVc3aXpU?=
 =?utf-8?B?SExSVHdjRnV4N3F0YUREZTkwN2VqRFlZNFdDWUozSmNISVRIL0ZxYncxYVNz?=
 =?utf-8?B?QUNxTlJGN3Q3a2VFbnFaMXltWXN2aUNGT0RvQlVBZVR1SjBYQlVudUFUN0xX?=
 =?utf-8?B?TmE3ZGxOT3g5NE50QWRhT2lwT3IrZ0p2T3d1YS9Ea2RvV05RcjhpMzhlRlBi?=
 =?utf-8?B?OTJ4TXoveXZWMHRlV3FuZGtobFdaaXlReTJmV243aC9qdW5xck5kQm1WZk5X?=
 =?utf-8?B?NUMvVEREbnpZVUlZZ241VW1RTnQ4VzZYbEV2M3pxRnhKM1orOHJtOW9wS3N2?=
 =?utf-8?B?TDhOUjdvSU1KQUNZUlhyNVJMeDdjd21yWEFzcEVPQXVleXRiT29LNmVUd3g5?=
 =?utf-8?B?aU9lSm9kV0lHSHlZV0ZJN2lXdU1EaTBMem1hQ1BFbmZucXpVc2phMDlpL1Zp?=
 =?utf-8?B?N3ByRitlcHdDTFh6RFg5RDdmMmt0RXk1SndlZm9NaW45OEI4MHJQandiTXR6?=
 =?utf-8?B?TVJZZkZDY203NVhyQXV6a252OUljenBFTm0yc3E2TUFieVc2Z3p1MERTb0RE?=
 =?utf-8?B?Y21idmJUMDRVUE5HMkFKSmJ1WFo5NElGRmV4cjdRaEhqanhvc0UzTGZNaHQy?=
 =?utf-8?B?cHlMUnNVdE5yRzAyZU1qNU8vWmRuQ0dNWHd0VW9qckcyazk1Q3RtOWJ2QTdM?=
 =?utf-8?B?MTA0dmNFUUNZQkdKOXRqbjAxMlZOOGNHamtObnhsZVZSOUxraTVTRC9TYzdD?=
 =?utf-8?B?ZGdYdWVrVzlCZE9YZEozci9zSU9taXFDZ005VjZQaXdlWUJOYnBCbnI2UnRC?=
 =?utf-8?B?Yzkydm1DcVd4SXZnVmtBdFI4Wk1oU0hOWTFrZmpFMFFtRjZ0Y2xWU0QwMlB5?=
 =?utf-8?B?SWV4eXVodWZxU0tYNXgrcDFqRk5naG9HcHdON0dDZGZ5RDJ6UWJvNVNxSml3?=
 =?utf-8?B?NWRTd3dGMmhxbVVoSnRDWXVWVVNuc2hKODRzUjkzaDhnbTVrSGJlQ2dYaHJE?=
 =?utf-8?B?K09RRDRFZ2lBWlVYTWJKVDJ3cFcvcmYrREVBcThOMTRCbTJremZSMGY5MkNY?=
 =?utf-8?B?V1gzbDVpcWgyR0ppL2ZRdllqeHlyK2dWWGk2eFEzbXQrWFdEM1FBa1VDZFBw?=
 =?utf-8?B?M3FPWER0S01jU3B4N2c5Tm4xc0ZXS254eDV2RHdlVFVPbEJOSVE5YWhLVlBu?=
 =?utf-8?B?b3JjTjYwa1hiQ0JlOUZoZis3RU81YzlWWHc5OGFTQ3c2U21YMEI4R09SYWdN?=
 =?utf-8?B?VUdJdmFFUHFDa2N0NWh2aEdUVXFzbHMzdWdrYk40ZThyRUIrcVpRKzNpWXdo?=
 =?utf-8?B?b3F1TTZOV09LQW1McUpybU43NHFHMWl6QnV0RTErcnU2UHc4cVJOVEc5Q0Fa?=
 =?utf-8?B?aTVISTdMQzQwUmhTR0hWa3pZaHY5d1l4YkdvUkQyWFZxRzYvc3B4NXAxZ2gx?=
 =?utf-8?B?OTBvUWpOK1QySVhrb1I4ZVZjazJOZlFaa1o1L2FTc3hkZGJUUDlyQVZYYjA1?=
 =?utf-8?B?UlRZWVMxQXo0cGZnQnN0UmhISzJpWi9Kek85RWxsbUhYTUQ0ekkyU0ZPd0R2?=
 =?utf-8?B?aGV6ZjE0VjBVcUttbUtKck1ybTMxN1c5YjN3NjRjdFN5WktOVlVEb1l6akpD?=
 =?utf-8?B?NVhQblI0ditYbUlVekFhTmNXbCtzRGpWbElJQlkyQzJIaldLZU91TnlSRUps?=
 =?utf-8?B?UkRvd3dVT0F2bTQyT2FueGNEcEhCSVgvU1hjVTF3UGZHSjh6QVRJdm5mWEZY?=
 =?utf-8?B?RnRmN2dDbkxRWW9USlExMnFWV21lVlJkNitCKysreFBwM3ZDdzM3cVU4V3Bs?=
 =?utf-8?B?ZzlTUTNXVzg2SmkxNGs5SGpBYjNDT3o1OHA1NFJRY2dTUTRoUDRjMDNtam8y?=
 =?utf-8?B?OXYwazZwVGhrckFyK0lJZllheU9adWZ4OU85WXhLUXVaVWFFRUNuVkwrK1BW?=
 =?utf-8?B?Qm90SFQya3dTUGV3dW1NN3Jxenlxb1ZSUCtNdjNiOHVRanNHeGl0QUFST0hT?=
 =?utf-8?B?YWVYRnZHS1hqK1FxZW9HY2EyTldZYnl5SEl0N3RkY3lIalFmNGh0UmdrZnZN?=
 =?utf-8?Q?vfDelPHBcnjJs225eupcpm5wwEgg3Ai41fD4I5PS2nnJ?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qeCfjUjvRXdBljOV3LnEku0TWy9nHqL4l9bE9+/+FmPk6oIPXGeMt+9qq9tUxEw33RTwz0GXy26QA9yacOu8WB/0ggQK7abpkiy6UEK3r/8VlwXfVzSZnw9Or1+nt8/GM3N+0M9GCaxlV85wIy2y4y4hLSo+ir1rJ6hL272rPktGOPEjMgEyfsPAfc6pWUFYPz9ZEt0IFX5nGobXOgFfIKr6CKLVQMLrOz7O+X7dUdD3SE1Smp/0qVGZvkuxlFIOKJ19N6LV8nGpr8bIjhxrOXR+DLZRJAOFR8pbsS1PpS8lmp8uZzD6QJiBXGL9VQxqZJKAhiNhpySME73QyC9dAVHG7MPKKmdmtJEHslBUhzVFczRJFC1cpcHzFyf0wcfSZf1vosNLx7YHWsU47zM46DVFufsHF/qDozZMJeCbR6O2coj3SGlKRVPZErDqJw6x
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 08:49:38.0017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88715249-a8c9-45c4-079f-08de705cfad8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DM2PEPF00003FC8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6865
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_004944_412639_D8680C5D 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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
> This series corrects MMC pin pull-up/pull-down configurations across
> TI AM62L EVM, AM62P SK, & AM62 LP SK boards to properly match their
> hardware design.
>
> Most boards have external pull-ups on MMC pins, but DT configuration
> was also enabling internal pulls. Having both internal and external
> pulls active causes several issues:
> - Unnecessary power consumption due to reduced total resistance
> - Potential timing issues with higher speed modes due to mismatched
>    rise/fall times across data lines
>
> One board (AM62 LP SK) lacks external pulls on eMMC data pins and
> requires internal pulls to be explicitly enabled to prevent floating
> lines.
>
> All changes are based on the respective board schematics referenced
> in each patch.

For the series

Reviewed-by: Moteen Shah <m-shah@ti.com>


Regards,
Moteen


> Judith Mendez (4):
>    arm64: dts: ti: k3-am62p5-sk: Disable MMC1 internal pulls on data
>      lines
>    arm64: dts: ti: k3-am62l-evm: Disable MMC0 internal pulls
>    arm64: dts: ti: k3-am62l-evm: Disable MMC1 internal pulls on data pins
>    arm64: dts: ti: k3-am62-lp-sk: Enable internal pulls for MMC0 data
>      pins
>
>   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 14 +++++++-------
>   arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 10 +++++-----
>   arch/arm64/boot/dts/ti/k3-am62p5-sk.dts  |  6 +++---
>   3 files changed, 15 insertions(+), 15 deletions(-)
>

