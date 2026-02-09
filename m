Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE1BE7E0AF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 09:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uaJEfQosNAl2z8Rq3gXVCUKi/3yBf0UdGrEG2mR34YM=; b=YJ/nrLgqPz1g4LJgzDBfdT2v2o
	+QkAv5K3x+d/pwYtRm95ZoSeu+/imWs0jsOMBIFw0NRU6BFobBROZ8olqxqyUnSWw1T72eEO4R9vy
	dH2rE8441DHDJ8qvP3NaQS0CfUDdslWnufqP7BSWUYZPEwEbeV2aseeWwM1XXuLxR2ie6eLxPfG3B
	iHQ3S7hH6uD0H7RDDc8I2AmABUYSxGbMldC68Iv1JIIp6jyfvCPnA8VAdDUAImyeZZlRIOugzO+nA
	thgBEDEGiCxoCBx2wdFZr26AfqBKXHVFZ4r7Jz1v1BGWOaNKQSMQ7qGZTR5gGsJQ7uxAupKpqUHXv
	WZ06acLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNk4-0000000F9r3-2mgQ;
	Mon, 09 Feb 2026 09:39:40 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNk1-0000000F9qc-1eeb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 09:39:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bOzjYLyhDoQ0x9/MeV4QULIju6qOsMQn86uwhrp7m2tPEQoihkUhiKdkwJtcxfFxdGAqR0NpJBqjKegBlhwnqFRUPt6H8bA+AWvBGZ4KixsdMNXuqNrWACuSN69ZAcASQyqEhhs7Sqg/RWZn29bIrlsO8lKXzIkMVwzl8/wg9NTI1m5kXPJaNRkx1CkjfNQIaTfT++MLTmgDUyWXjfUKVHoJjdXZsexbX8W2hxuQaidU8epvc+3khLvvU191FUY++NkAxg8xpmbN/KvP3l6/cZHvMOExR7jr/sAHoHSy3uI6wjrXN2umoGRfZRs/rNi9xtgSfpXFjpUrqQX+E43sAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaJEfQosNAl2z8Rq3gXVCUKi/3yBf0UdGrEG2mR34YM=;
 b=lbFOFPHaZi7zByoZuWrEoeQLnoryTa3ehsvbaiWr7ury7F2/GFn/rvrSQWkt8HadFE9UsT53YzV2RlTnUv/OQHfuzL++dWOkJBwdNmICNEjsW9qfBmSGAdBe7X7rlSYY+5yhzEIzhOkih2WFkvBf8AG//m7FvTgoVnKqdmlND9xY9UbeZ7zmgxHUlO2dJ3AZyCba5A5fqN5XzeZFe8mI13hmjbbIx7Zwt7n2o932+tkyHkjAsUmvFV9/t9wLPvV9KjM7ArIBFp+oDAHfz+PkeTsxml0yGJ/HEsiqDz3yrrO9CddZP1zjrZNXZkMxTJvk5Q50TOsR3oN/seTyJ/4KfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uaJEfQosNAl2z8Rq3gXVCUKi/3yBf0UdGrEG2mR34YM=;
 b=EEcOIIVnKjjZjqx8AMHpKiCEdIxQKA2utMdBDJDamvQLTfyG7bB740RePXysyZUqQqnFIGsGzFdqGJIT0KUCa4ER9TiWmvylTpWqB+B519nvWB9+dQKOg5Gstsxy9ScKIH4AP5sE8vVZwWC8LgKa1h6qqOGQd/vchwlHaNP1o04=
Received: from SJ0PR03CA0337.namprd03.prod.outlook.com (2603:10b6:a03:39c::12)
 by DS7PR10MB5167.namprd10.prod.outlook.com (2603:10b6:5:38e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Mon, 9 Feb
 2026 09:39:32 +0000
Received: from CO1PEPF00012E82.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::1b) by SJ0PR03CA0337.outlook.office365.com
 (2603:10b6:a03:39c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Mon,
 9 Feb 2026 09:39:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E82.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 09:39:32 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 03:39:30 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 03:39:29 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Feb 2026 03:39:29 -0600
Received: from [172.24.234.212] (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6199dRO71333265;
	Mon, 9 Feb 2026 03:39:27 -0600
Message-ID: <e58c3a53-0b46-4478-9f82-389a6332b9de@ti.com>
Date: Mon, 9 Feb 2026 15:09:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm: multi_v7_defconfig: Enable more OMAP related
 configs
To: <linux@armlinux.org.uk>, <arnd@arndb.de>
CC: <krzk@kernel.org>, <afd@ti.com>, <u-kumar1@ti.com>, <praneeth@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250616082038.3241346-1-b-padhi@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <20250616082038.3241346-1-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E82:EE_|DS7PR10MB5167:EE_
X-MS-Office365-Filtering-Correlation-Id: a4efe93f-ffa8-4052-9a80-08de67bf210f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZG51V1o0ak9ZTnpTcFhwMEhmWWt3WTYvYkJFRXF5WndoSldZWkNLeGtaVjR1?=
 =?utf-8?B?Z3hYc2JpbE5jQVVDZDJjMURmdXd5K3BoRU50bTJIR3o5YU5rZ3hTQWlvOXdo?=
 =?utf-8?B?OHNmSkN6Q25ERmFxNTZVT1pvY1BWUTdYbUVEQ3FIWDlldjZKSnRnbzZHMTBN?=
 =?utf-8?B?d1k1ekdUdUFtZCtYL1l1THpZeTJDUlg5dlNmbU5EY04rMHRlbVMwbkFNVTd2?=
 =?utf-8?B?MUNaMytPbHFnZUdLRXZGeGVQb29UMXRiVThubi9ONjM1OGtVUkV0S0hCcUFt?=
 =?utf-8?B?VjF2SGJiNUxMYzloZC9PR1MwRGNyS0xMNDhwSHF4cmVMTWp1WGtsbzM4TlY4?=
 =?utf-8?B?R2NUbElIeWNRUmx6R1oxYUMrSmc4cjluRzYzM1g2dWp3Yk5KT2I5VUFRTkFm?=
 =?utf-8?B?dGp2ektrb3gvQ0lmcFhHbEE0V0gvdisyQ0xVU1pwQm54eXJnQU1NM0Exdnht?=
 =?utf-8?B?VENnQUNESWZlanM1eEFYejJIZ05YOXJLSmZRdFlZOTZZMVEyTENPaFFJRko0?=
 =?utf-8?B?SEozWS83a1BDaWhJMmEvUEhOMStuOG1IWDRLVk52RGRmenVCbFByb0pOSk9H?=
 =?utf-8?B?dHV1VWFmV2VRYjhtZURtcHpYQVhyakV1VStCOUx1amRNNjRpODRNYmRNNE5T?=
 =?utf-8?B?MXBqOUNYOEpWTG1GaHluOENRN0x1NmxvTC92c3oxbnE0TDNFYmZLRjlZdFNh?=
 =?utf-8?B?QlZNaDNnemU2ZlpaR3E1dUFZQlZEenBFMHNpaXJCc0Iwb3p2eGxtMkFwOVli?=
 =?utf-8?B?MUp6NytrT29zajlRTzBqcFUxYXMwcXRVT0F1Tk9iWnhTT1ZDakp6WFZyLzY4?=
 =?utf-8?B?cDBEZ1ZGM2JJZHNqNXBmSFVUSGJuaWlLaVlMbk1SaExVNFJFaGZtaWpyZG90?=
 =?utf-8?B?RVMvMEl6UStya1VaYk9xVlYwR2lkN2lrR0NNZS9mVDNrU1BDcTFWQ3pYVWti?=
 =?utf-8?B?Y25ucU55b0pnZU1KdEtPZm41cENFS2NNaGlVZE1mZE5ZZG4wR05nb0ZZQWZq?=
 =?utf-8?B?K3VIZE5KTmp6Z0N3WS9FS3hwQU04eTNWZ3dNdTVBV1pvNnVoaHpwNFlUZkQw?=
 =?utf-8?B?ZnJGTjAweU5qNjg0RzFKenFNSDdzM3RRQUJTZm9OcFU3VVlRUEN0SlhWYkxU?=
 =?utf-8?B?eHovMFFFU0h2a2pHSnJSME8zR1JFTEJvaU5NRDRVbUY2ckg3VkNoTmE3VkZ5?=
 =?utf-8?B?cE1HTWJEbWdXbTlVbzBlNVoxb0lIQUNpaFczUzlWWGpwOUNiM2xUMkgxbG1w?=
 =?utf-8?B?Q1ZGb3FoaXA1NS9WbXc0Q3d2YUxETjRod0o0OHgyeDYrVkFyYTVtZUE2MzBy?=
 =?utf-8?B?SnExb1REMkhkNHh1ZFFGTVFmT1BpNXZyMUdOa2grL0ZwTkdzRWk5cDBzR011?=
 =?utf-8?B?NDhwYUsvc3F2MFNGQkZHNFZ4YnNGdWd1eFBhRHdqSXcrRWVhRzNwZ2ttVVlT?=
 =?utf-8?B?N1N1bmRNTUFNWWNQU1BlT3BqMlpJcWtvWjI1TmNLdEEvTlNQbWNwU0VxMVJk?=
 =?utf-8?B?STRrN1NHNnVmenpYOFlWSjYvek92ZEJVcGpuL2JydFlMcmRkK2J4aUJxdjJm?=
 =?utf-8?B?Tzd1QTNJYTB5a2dDVVpXZXgvdW1waUhzZTZIbTJnYWNmRmVLNEwwZVlTc0tL?=
 =?utf-8?B?YVlGOElidlRRZnVjaVlSVE9LTHBXaTgxNHVDNFVvcDdHQUh0cHJqMGVRTnRh?=
 =?utf-8?B?eWlwN1p5eFpHVGhMRWNSWkh1bGdqbXpoTk9zSFAvZ2pZWjdMaDUzVVZCcW1L?=
 =?utf-8?B?OXpRYU04bTZEbG9kYWRwNnhaRUw5UmRvZjhNMGxWN1A5R3lyU2pBTU1ibkEw?=
 =?utf-8?B?b2xxRGw5ZzV0aFhGdmVrTVRoM0pBY1RZNmY4UVhUK1N6NkQ4eXdxRmluNXBF?=
 =?utf-8?B?UEhSS1crQWQ4UXRFemgvRmgvVFJEV0dvczhvRWZtUVJwUmdUczFPZzFRdnZ3?=
 =?utf-8?B?TXZuK3dSNjZEdTdqN21LdkpsakdDL0tLMjZBRGtpNzB6dE1HT1NObWMza2dI?=
 =?utf-8?B?VlhYemxuTVBZTWlZR0llbHZJczhLMTV3djhrWEtMaiticzZEb1k1YXFNNzNo?=
 =?utf-8?B?UUUvbXVYOWp6Tm1pTTlwelRVbmpjYURqVGRhV2o1dXFmUzErZDJEMDlXL0t2?=
 =?utf-8?B?dnFSZC81azR2QkFKNnFDOFJ2T2J1c2ZleWVrbnV0QUtiS3ZTUVQ0aVg4U3k2?=
 =?utf-8?B?b05DdmZ6ZGY2VUxaYmJCU3JUNXQvL1kxVkRGZjBSMmx0RnFzVFYxaWk0Z04w?=
 =?utf-8?B?N3FsKzRwSnBPQlNCVERXcGd1d253PT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FjRCDuAb8LTrt+m4a1gs5t6omyXDqUQi9Gm3g4xyFxSnkEn4Id9f7u01sSDSOZ4SumdMy9Jw1ehEr6RpYV5Tsu0CqJPVsGmwVDCvIfk42MCOa/ei0V3e6QE9Z/UQ0Zs+jjWLKQaQoRjdqzG0iJkoMjykuSBP1XPkQhPXfoo0ILrcLyDzshiCWEgoYQRQC5ecL8VuEjVFCU+LyrA+V35AGGMeHm9DzrReia/wjigJNkt28eLuay5p3Te/pI/jf2+wwFUCnm+0rP85t1dajOINlgHR2tGjdfwCV0l7y/0lrXrm5MUrEUbBIbFpJDtz/cbZJp6UqRDcEtwlm3tcfpylLHszIMvuYt5zDFK0S1CC6Tn3+oz3s3ytYDImUCoIsO9JQ3dt9fteYNcQpIxFegaqTpOlrRCyG65IqR8tsV+LnRKjN3/CgHihqDbVOfY/Tqr8
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 09:39:32.2937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4efe93f-ffa8-4052-9a80-08de67bf210f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E82.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_013937_622863_9D11A48B 
X-CRM114-Status: GOOD (  12.52  )
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

Hi all,

On 16/06/25 13:50, Beleswar Padhi wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
>
> This allows us to enable various peripherals in the TI OMAP family
> platforms like AM571X-IDK, AM572X-IDK, AM574X-IDK, AM57XX-BEAGLE-X15,
> AM57XX-EVM using the multi_v7_defconfig, instead of only with the
> OMAP specific defconfigs.


[...]

>
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> v2: Changelog:
> Krzysztof:
> 1. Updated commit message to call out which (and why) upstream boards
> need these configs to be enabled.
> 2. Used savedefconfig to correct the order of configs in the defconfig.


A gentle ping on this patch. All of the drivers are enabled as
modules in this patch and the existing review comments
have been addressed.

Please help in a review/merge.

Thanks,
Beleswar

>
> Link to v1:
> https://lore.kernel.org/all/20250611074925.1155547-1-b-padhi@ti.com/
>
>  arch/arm/configs/multi_v7_defconfig | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
[...]

