Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054B4EE6B4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 18:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9kOl4yJjpftHSsvlY5hRzTdSzxGFTkoDKwIMYJmYYx8=; b=nDcQ3cXiOx4Gsz2A8rQOEnysJa
	disbPGOH7UZodbrh98pKLlfk5ict/BNTfM/mi9lhkTBAu2xxI4wEv/IWoj3rAoEZwfvKDdaJqSMkQ
	zdix9AJ51D6Z9HkSh+wfGYyaTTFIhJdG3MtkbwEqqgTNiAZg6Kp7P3qw35B5C8B1MqmMwtmmSxcUO
	cmAEcXRkxivUjXza9so/gqerjaA5SA0vZ4Dv7LjRZz0EFxENCgdZYsgiilFnqRN3r4YVJxRT57Wb6
	4PyCzBMqXqMdQGN32fz3SNBUaJFXCfu9C331RXJtk8LTHs1nbmOIqelsnpT3ZRx1BKWo3mRb2afq1
	mWpiSfcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQqi-0000000Bhul-3OQW;
	Fri, 06 Feb 2026 18:46:36 +0000
Received: from mail-southcentralusazon11011010.outbound.protection.outlook.com ([40.93.194.10] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQqf-0000000BhuF-3VLj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 18:46:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQdZAFKY2fxLyDwVEJyZuH9+wX1Ezzg7D5mYHpTbjghxE0m0mhdZsoRMfg9Y+dunbU9yB8wMi+m/sID3eQ1IoaqQOUTG95K/UzXBNpoyzfoHSHvhg5Poe44UgtQvYG4ZeEVIp3yp+io4kvuY8ccHViDqPXg/EAQoeFviCIb/KwZSpQiVLUC0uL4RC0Hmcz2aPuQK+e4QJVuuLL1kICalXRoA6OGJnIq7o6Ix2UD913CWZCWj6jU9xcFbTYeyu34TA32PSSCrouUc3l7iosykFGvQWwYXmjSgQio37mTHiSr+HvHrLeNdC/N9CrZBRD5ruv5sSCbmlYIc/fUi1/+j1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kOl4yJjpftHSsvlY5hRzTdSzxGFTkoDKwIMYJmYYx8=;
 b=Uk52WZKC28o3txeGvAfgvAMkip0OTYmx0imeaTnjra1pSnQ3n2sZ9s2L9Zirlh0tOCUn+U7l5bhIr6b8DDF54rJ30J+4xCVRLQyeJ9yCBsT8l2YB0BjjmKVvD8xv4wc8wPs5Y4qoRpF6SkO/GSdBGkODVLblUAkcOUhGK+j3IgRqJL7DBKuYul8Dn8ozwzqFl8EQATcja2NZciZRQ0rIv2tvsM8juGJU5FDk7NE7ZoahwWqK/iSjKVTXa04aPTl9fppyYw+mYrA/knlJgS918WULdzlcFlJZfPB3SL4L1Wcsgcpbr8qf9fj0V/vHs8vdYqe7NQsLyhAEgP1uXnYEGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kOl4yJjpftHSsvlY5hRzTdSzxGFTkoDKwIMYJmYYx8=;
 b=viqDheDkJD83TRSTWVG249wIPgRuRb0ovpbUwdhWPt9l/W1HRKxijhI6MynPth5F/GfNZKLFptpaFPOJvDQ3U4zBaTeMDbys6vuZ+9/fn4HLn+7CrDpTpl3OyB0GTqA5xmFr1JN+DT1M+z622GZUyg9fXdI4pJAlQ3esKvPbZ64=
Received: from BYAPR21CA0027.namprd21.prod.outlook.com (2603:10b6:a03:114::37)
 by DS7PR10MB4925.namprd10.prod.outlook.com (2603:10b6:5:297::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 18:46:28 +0000
Received: from SJ1PEPF0000231D.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::13) by BYAPR21CA0027.outlook.office365.com
 (2603:10b6:a03:114::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.3 via Frontend Transport; Fri, 6
 Feb 2026 18:46:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF0000231D.mail.protection.outlook.com (10.167.242.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 18:46:26 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 12:46:26 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 12:46:25 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Feb 2026 12:46:25 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 616IkP6X1360117;
	Fri, 6 Feb 2026 12:46:25 -0600
Message-ID: <9a127d54-c028-4b20-9b08-42da5c235c53@ti.com>
Date: Fri, 6 Feb 2026 12:46:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: ti: k3-socinfo: Add support for AM62P variants
 via NVMEM
To: Andrew Davis <afd@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260204213746.2589028-1-jm@ti.com>
 <20260204213746.2589028-3-jm@ti.com>
 <25ced9af-b103-4cd3-9b31-42b188fcad60@ti.com>
 <528b107d-e2ff-4970-9484-24a6acca8308@ti.com>
 <d04fbaeb-1801-4987-bada-5f99018aa2bd@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <d04fbaeb-1801-4987-bada-5f99018aa2bd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231D:EE_|DS7PR10MB4925:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a18f71e-36d1-4fca-6745-08de65b008b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2hudnE4ZGJSVGlqdGo4QUNCN3dlL014T2JPV0RuUElkUjNJMkk3U0xOMy81?=
 =?utf-8?B?MzdBalM3eDJkeU5RR0FOalV3OU9DaTNuNDAvWmV0b2JCdHRsSFdObWpKUFZR?=
 =?utf-8?B?NldYNU1wV0dWSC96TW02Mk5FZmk4N0JNWFBIQVpmZ0I5VWhzeHp5T1pNNmsr?=
 =?utf-8?B?SkRrTUZhYy9yWVRFZW9MbUY3NTlSZk1XSUgySXRnY3BTcUlpREl0L3BJanli?=
 =?utf-8?B?VnJIb3BGdm94VURSRVlvaldrREUrVE51WUFCSm9CbDBGK0h1N3pQU1RtTkZn?=
 =?utf-8?B?UExpUHQ2VkxodjhCVXBZcXVGTVhhVUphYmNjUmE5SUM3TU1WMzJwWDU0OTZJ?=
 =?utf-8?B?VGpBSFJKYnRKMnFjemUvOGpOMkhwbENnek9GWXdMWXFQTkJVb0owM3lWdmJI?=
 =?utf-8?B?aDVtdzRWakFWM0RXL3FvYjNiQmZ5TjJqaEtsMTI2d2VxYmwvSmV3d0FhYXZt?=
 =?utf-8?B?YW04bER1VkNPa1o2bThuMmpPdUlKdXBrc0xRbmUyT3VXNFJPUm5wa2pZL0xF?=
 =?utf-8?B?RWg0L2xBYXcwZE5GS0VlSVM1RFpaN1QrMDh4bDAyMHRjUVdMdmpaSXRSZG9W?=
 =?utf-8?B?UWtQTHZTa0JXVGFzeU4zTUlmYUhaY3Q2Vm5tN21mYmlpNkZMT21YOGpJQi9E?=
 =?utf-8?B?dWd1VndtaHdzOUFTc0JOa2h1QjBLU1hocXZPTm5WODc5SEtKdGtZbVFvWVVy?=
 =?utf-8?B?Mm9xU3lQVC9LM3E2RUh4dDhzamlRbHA5MFpDa1laNTJjeG5jQThGYjhYU1BY?=
 =?utf-8?B?TDZHWGl4WnVNUFUxTTZIdVB3ZFNJYXk2UmcyNnY4eUpMcXR6MVk5NnpEWHNl?=
 =?utf-8?B?akRXOFBZWXNOSVRyL3hyR3lwRTJIYW1HcFVESE8ranB3ZzRrcDlsV1ZQNlc2?=
 =?utf-8?B?WWdTZEhMcU03NGIzRlBRK3ZjUG5lWFdQTlRGdkRQWFZtUDgxVWtzOEMvdEk3?=
 =?utf-8?B?eVNQck1ZZTRlYUlTcGFEdnU1RTJBWTM3aCtCWHVwMm9VR2lIZDM4anl6VTc2?=
 =?utf-8?B?OGxmaTV2ZGJhM3JLNUVydjBremFXblhtWEtxQUpoYkRYNHg2RFBMZFE3Vkwr?=
 =?utf-8?B?SG1TbzFQUm5zd20vYS9wWmh5Wmx4L0dRSFNEV2phSTZOZjNDQzcwLy92bTRx?=
 =?utf-8?B?V0FUMnMyYWZWV3huVDZ4R216Q2E2anFtYndadzVHOURwQ0JVY3l1TUdUTU5Z?=
 =?utf-8?B?aS82K2xxcW5qTFRDbTBxUmNQMU1PUzRiU0dQZmhyRlNscXdKRHJUdzNlQU5k?=
 =?utf-8?B?bnBKYmc2b3F3VHhQSDdVUjM5eWJhVkJuazBHQUFPQVZ3bU9wUU5UNE0xS0NV?=
 =?utf-8?B?Rldvb2Y5T2tQdkhlUVZyR3NNVHFVZ1JXWU5POHFpUklYTlN0Z1BSZWJyNjFS?=
 =?utf-8?B?cDNJRHMrSWhKenRjZTV1MFZ6UFNMS1A2OEcyNVJ3Z3c0QVZHa21xUSsxYUlQ?=
 =?utf-8?B?OHp1ZHUzZXdlU0hjSjJVWVgrSy9Ld2hsNldNS2RZbGNVcm5YdmJJTnU5cGty?=
 =?utf-8?B?MGgvZFJGc2hLZHJrc1VORlZHRmJuMXQ1bnFUeUJmSlRLSHNlWS80T2Z5R3cr?=
 =?utf-8?B?RDRUK1lOcEVaZDF5V05YODk0VEx6R2ZYSEEvUkQ2T3J3NUljc3hsRjY4aUdH?=
 =?utf-8?B?NGdlMHprRU1DVThvQzRKWlRzNXVmbDlEaTVUM3FjZmJXRmRoU1U2UjZscFVW?=
 =?utf-8?B?cFlwUVJQKzNFTUdNQnZtSTZPREM2ZTQrYk1uV1MyNkNVNjBuT3ZmT3grL3lP?=
 =?utf-8?B?T0pXWXNPQ1JLTlkvNjFoQVlySjJWQjFqWDZPSlhrVDVncld6R09kWVdHWTg3?=
 =?utf-8?B?VnBtM2lrd0Zua21zS3BnK0NHUEpFNHhJY0NjdTc4SjVyNm9zUEUvTWVzdkNF?=
 =?utf-8?B?US95SW1ISjUwUnpYV0k1eUR3cWZWWGcrU1RxdFVMY0lhWkYxYUlid1k0WEh4?=
 =?utf-8?B?YXc0ZllOUXRPQkJlUmtYU2RWSEJQa05iOE1WNkZQQ3Q1VWtvQTljRnZYY0JY?=
 =?utf-8?B?WXFMYmJ0K0NXY09Mb21DeGNiNElYd2lnYVVPcWJFK1krWmJraGNkWERkWFVI?=
 =?utf-8?B?UzJudlVGYnJrUzZqVnJ1TTBDaXgzQTBIYU5SOUl2ZjM4aGVseFpwenZQNEdG?=
 =?utf-8?B?UFEvWXFuSDM4UE5kbXg3bEtiSzV2L0p3VEIxSHFSY3FLUFNPWk1ndWZqcHJv?=
 =?utf-8?B?OHBqNFVHWVlZVWlQNE05dGh0RDNhaGIvczV5ME5FQ0NZQVdVSG5FbldGdmZi?=
 =?utf-8?B?NDNyVFJkR1g0NXArL0tPem5GbHV3PT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oA6YAHPv1bQ2CDJDLN95MxSYk+U+YVqNFDT7AyBYJ9B8WQVaEdfxOqfmLitBTdDEl9vpppFsZOVjvg8+uToZricUfnyYHcbApsmbchNG2bGbAA0v2cevxGNR4vFjrIQ6fdNr2dQ4fA1BSyQQPfOrvQ6BdZhslKdu8ojxcHD6mlIZFeRC3PWXOq8MBcrHI3wghqEjCn+HinkG5KJ5Am0cUelm5PtwgKRy/xf4eZltcz/ryZJ45zCoiMsEmABsxBMQuV4l+l/C+2yAJCB3uGkIBuL+GFL6quoqOgGPexbKJRulP/RFnXHwOwepqffiH4x3DAOixfwsPCKvIWF/5COaEcxYE4fyCSG1u7P0y7UHXlLIHlwOyMNyccqxDIIKyInDfExbEGIuZLQVEPUbQXnaIGTlzugso2hPoESSkla85q2KYtFS0jh54qNyCpOgVPPL
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 18:46:26.6622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a18f71e-36d1-4fca-6745-08de65b008b5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4925
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_104634_002259_4DC72759 
X-CRM114-Status: GOOD (  18.23  )
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

On 2/6/26 10:50 AM, Andrew Davis wrote:
> On 2/5/26 6:38 PM, Judith Mendez wrote:
>> Andrew,
>>
>> On 2/4/26 3:54 PM, Andrew Davis wrote:
>>> On 2/4/26 3:37 PM, Judith Mendez wrote:
>>>> Add support for detecting AM62P silicon revisions.
>>>>
>>>> On AM62P, silicon revision is discovered with GP_SW1 register instead
>>>> of JTAGID register. Use the NVMEM framework to read GP_SW1 from the
>>>> gpsw-efuse nvmem provider to determine SoC revision.
>>>>
>>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>>> ---
>>>>   drivers/soc/ti/k3-socinfo.c | 48 +++++++++++++++++++++++++++++++++ 
>>>> +---
>>>>   1 file changed, 45 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
>>>> index 42275cb5ba1c8..4b6947a9ceb4d 100644
>>>> --- a/drivers/soc/ti/k3-socinfo.c
>>>> +++ b/drivers/soc/ti/k3-socinfo.c
>>>> @@ -6,6 +6,7 @@
>>>>    */
>>>>   #include <linux/mfd/syscon.h>
>>>> +#include <linux/nvmem-consumer.h>
>>>>   #include <linux/of.h>
>>>>   #include <linux/of_address.h>
>>>>   #include <linux/regmap.h>
>>>> @@ -25,6 +26,9 @@
>>>>   #define CTRLMMR_WKUP_JTAGID_VARIANT_SHIFT    (28)
>>>>   #define CTRLMMR_WKUP_JTAGID_VARIANT_MASK    GENMASK(31, 28)
>>>> +#define GP_SW1_VALID_BIT            BIT(4)
>>>> +#define GP_SW1_ADR_MASK            GENMASK(3, 0)
>>>> +
>>>>   #define CTRLMMR_WKUP_JTAGID_PARTNO_SHIFT    (12)
>>>>   #define CTRLMMR_WKUP_JTAGID_PARTNO_MASK        GENMASK(27, 12)
>>>> @@ -70,6 +74,29 @@ static const char * const am62lx_rev_string_map[] 
>>>> = {
>>>>       "1.0", "1.1",
>>>>   };
>>>> +static const char * const am62p_gpsw_rev_string_map[] = {
>>>> +    "1.0", "1.1", "1.2",
>>>> +};
>>>> +
>>>> +static int
>>>> +k3_chipinfo_get_gpsw_variant(struct platform_device *pdev)
>>>> +{
>>>> +    struct device *dev = &pdev->dev;
>>>> +    u32 gpsw_val, adr_val = 0;
>>>> +    int ret;
>>>> +
>>>> +    ret = nvmem_cell_read_u32(dev, "gpsw1", &gpsw_val);
>>>> +    if (ret)
>>>> +        return ret;
>>>> +
>>>> +    if (!(gpsw_val & GP_SW1_VALID_BIT))
>>>> +        return 0;
>>>
>>> Return -1 here so you will get the warning message about setting 
>>> default SR1.0.
>>
>> Actually, thinking about this some more... If valid bit is zero, that
>> means that we have detected SR1.0.
> 
> To me a valid bit set to zero means the register is not valid.. If you are
> saying that bit actually signals SR1.0 then that bit is not well named.
> 
> Although if the whole register is simply all zeros for SR1.0 then do you
> actually need this check at all? When you do extract the revision from
> the lowest bits (gpsw_val & GP_SW1_ADR_MASK) the result will also be 0,
> which is the SR1.0 value anyway.

Ok, sounds like a plan. Will drop valid bit parsing and respin the
series, thanks.

~ Judith

