Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8296D5A6D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 04:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DBJPSBxVgkzbC+wLCIZfApLVh7wEB/aUC0AtF86Rx4Y=; b=flE92G2x0bZ5Z5eRBshogvs5ar
	PeHbqAXsSxbTF9CPoNgwioDVZIyOB3dKvXqVO0haJiYWhThxvtdtgT3aR/NNyI3Stb4lQJfG2Crn4
	8s12ehzpu8+UVMvagdW8Q8R1/NFMpQFys3h5zaHize02UJhbLXthQb1zSvHDWuaR0YhllfNhkRB8N
	9DhAXRj0UUQM/s0B8l/o9oepU1YRGKK/ZEHNvN95frnQQoOPkt2WaoRC49atofJj0VLhtIYIGJC3+
	O6Ecjuvfmcw5BDTiyo1Wti6s7lPfVpiQea7EsdN+xPayaCzPPofWFtinGGAp90FHBd9VNSBL/pQsw
	95SI+cPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFmkZ-00000009aJy-0cbj;
	Tue, 26 Nov 2024 04:00:31 +0000
Received: from mail-co1nam11on2061a.outbound.protection.outlook.com ([2a01:111:f403:2416::61a] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFmjb-00000009aCI-2T9m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 03:59:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kBw7pW52Lh/cNF/NHSVKeY2wTI7c/xKIAaWnMbbO/vhphjYrG9WXnodc2QUXxOiCls7zKudkvJFgE6ylVObE51I9eTz5UNEsGQ0c2azHsl7CeUGMpGzlJ41HAXXEEnd2n7kHePaAnxa4hvwQs6SfAB6JxuNWR8Svvk8f9jEqkk43Ty8RHiqJOPFKpMFGbU5n/Zf67w1EJgkNAE8cgjWfk3fT7aXqHxfMMDaLsHKFMg44Njso7ZjUYYYotYkCTdOnutQhOd76D+jmz/t3wyQzcAjdvsdixF7v7uAFMt8yZBhSw3RlonHvlRhOBn/BD+BziVhpshnT+XiixdL+ExxZKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBJPSBxVgkzbC+wLCIZfApLVh7wEB/aUC0AtF86Rx4Y=;
 b=Ja5P+rCe1O9llmrvYWQfcFcSiJDd4k4glnRU9CViMC7I9O4UWpvdaslySRRYDwy8jei+iREmaEnvcljBLD6DzlbWaO8odAA+bZAXymmWBmedd8tzKNZA5LiSu1j41m0ZpKMIjX70zJjyzTPLX/+C1zL/51ORf7dPQCwKIDJwLyxPjCpG3nqX4ECvNe9S8HInt8jDFCjbe/NMricxc6SYjl93d1oalEtcO2JZcNkK3v6K0TBS4satzho4i+b3ZF83ufXY4PP2oGmMcMUWaFmj9GPgwdMjfgwMsiyMeIJalr7+VaXCEAHruRgEp8ZPtARva9pDViUs7Xhh6FDe9+YJ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=amazon.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBJPSBxVgkzbC+wLCIZfApLVh7wEB/aUC0AtF86Rx4Y=;
 b=F9mxYniXg4vO0O2y0nBl9vqZXv15B15iArZcstaNyPZ8urn+s2CnZR6Eq7igBXmGu2Iv7k6cBDYwjYLwDTx0oPPXzJjz4yujjtTGACTHpPGZoI7mIB7faOrdhO4fm2JVfJ2bhVfClxWReHRRfYJE5BKNEqVYZsxwnf12MCHODvE=
Received: from BYAPR02CA0009.namprd02.prod.outlook.com (2603:10b6:a02:ee::22)
 by CY5PR12MB6324.namprd12.prod.outlook.com (2603:10b6:930:f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 03:59:20 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:a02:ee:cafe::67) by BYAPR02CA0009.outlook.office365.com
 (2603:10b6:a02:ee::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.17 via Frontend Transport; Tue,
 26 Nov 2024 03:59:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Tue, 26 Nov 2024 03:59:20 +0000
Received: from [10.136.45.86] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 21:59:03 -0600
Message-ID: <41d0bc96-2e42-4fa1-85df-a6a93611240c@amd.com>
Date: Tue, 26 Nov 2024 09:28:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] [tip: sched/core] sched: Disable PLACE_LAG and
 RUN_TO_PARITY and move them to sysctl
To: Cristian Prundeanu <cpru@amazon.com>
CC: <abuehaze@amazon.com>, <alisaidi@amazon.com>, <benh@kernel.crashing.org>,
	<blakgeof@amazon.com>, <csabac@amazon.com>, <doebel@amazon.com>,
	<gautham.shenoy@amd.com>, <joseph.salisbury@oracle.com>,
	<dietmar.eggemann@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tip-commits@vger.kernel.org>,
	<mingo@redhat.com>, <peterz@infradead.org>, <x86@kernel.org>
References: <20241017052000.99200-1-cpru@amazon.com>
 <20241125113535.88583-1-cpru@amazon.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20241125113535.88583-1-cpru@amazon.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|CY5PR12MB6324:EE_
X-MS-Office365-Filtering-Correlation-Id: ea1f27d8-6618-4f53-9ed2-08dd0dceb4aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnN3QzdXZzNLYlNtN1Yyam8vbjY2TE1yVjNRRy9WcUhlMGR6Wk1PY2NtMnlH?=
 =?utf-8?B?dnpPenQvRzhCQmFGb0taYWowc3NiMzQ3NUZVM1ZXcFVJb0tzdlNwNTJIekl5?=
 =?utf-8?B?NkVFT2d1R2NTVSs0V0w5YVdJb0pSL0lJZGMzbUMyNkxUUkxrWk0yMWNycjVJ?=
 =?utf-8?B?MWxxOGpTU2lKMkdwL0tmUUFwVnNwN2dYVjRrQTViY25QZFczMWZvaHBCZlIr?=
 =?utf-8?B?ZGRhc25WYVFKOXdrTzZPb05iTHlxWS80dHR5WkF6am9DQzN6bmZSWURtWjNq?=
 =?utf-8?B?UzlNRE96NFdMQUdMc3cxcUg2cnluRUdxRmFuTGVucmIwR1duSjJtQWpOSEZJ?=
 =?utf-8?B?WEd1Uit5YTJYZiswYXNJdmMxVFlkek5TM2JsWmhoWVhFS0Z0cHFlSjBzK1F2?=
 =?utf-8?B?Kys0L3U5NzcyVklMelg2eUxWL1JzUmREaW9IYUVPWmlJSkpxRnJtVWxvZmVh?=
 =?utf-8?B?cXMrRkE5OFM2SEt2SUtUQ0ZYeGtWTGtUZ2RWUzlabDlEcUJDSE5adXVSSFRF?=
 =?utf-8?B?em5OVHg4Mkcyd0l0a05UY3N3elQrKyswK0luR05aMlZCNExlRE8xNUxSdmFq?=
 =?utf-8?B?TzREckdUakJKWmtqUkNsWHFnTFBKUTlVRlhtaXdTekxyeElKcHcrYVczcDVS?=
 =?utf-8?B?V3hnbUMxb0pDaThYWUFEbmZSUXBCUzFTOHBQdE9UUXk2dmt1UjVPKzJTK0J6?=
 =?utf-8?B?b1BRdkJOQmJMTGFTbER2cTA3blJSbVJhNTl2cjVITzdENUM2dzBZUnhtRGFW?=
 =?utf-8?B?bXBMLzdNNHlZTDFOazMwdmRlU2h1bHVtelorc3RjZ0FvT1dkazAxOExlRTVT?=
 =?utf-8?B?VWE4dTZEOXNCUHlzajVobXFWaE1nN1gyREhJcEg1YWNPNzRILzRjRU43WDdm?=
 =?utf-8?B?MUZlYzg4TkVUeXFoR3pVTW9qNTlkYmlYME8yWTlXY1dtYkJXVFJnenBLSita?=
 =?utf-8?B?c1c3NzdoM05lUjZqb3RNK1h5OElCNnFHdkJBZVQvaS9hbFEzVTBkNzl0M0tO?=
 =?utf-8?B?ZHFZZ1cyQWQwT2pwbkZJMWE3MEYvZkVkdmxFbjcwZXUxaDhBVC9YZmdpdDVH?=
 =?utf-8?B?bWJPeUY0bGsrbDZuUi9mcVJUMEhIUVRPWS9jRldGRGdUT2N2U0VDRHhQWE55?=
 =?utf-8?B?TGFiVWJhRG93UmtmTTkyQzlmZU0xNXEzaERqcEpmam1nTDlncFlSZkprcXdi?=
 =?utf-8?B?RGx0bkl5OUk4dkRaUGpuN2NBUnVlVEVJQ1RtOVRXbXJ4MmhwNDlhRmNpZ0tM?=
 =?utf-8?B?eDUwVWRTODNTcUw3SktpOVpva2ZKYnk2aHNzQ05ubFFZYjN1V2dUNU11Zlpr?=
 =?utf-8?B?dVlOZDFRVk1xNWQ2Zlh3TWxXd2Y0U0Z6dm05N2RGZGI3ZklIVHBKVFB4QWJp?=
 =?utf-8?B?YzRzUGtzRitDTlJYTW5WWVJWSUxNSzhNWk5BWk1XcHlMeXl1Z1g3bFNJY1BO?=
 =?utf-8?B?Tmw4eDhHbmZySUhRakMwalBMbldUL3FwUGdTdElTYmVMWmI5K05iVllrWkF4?=
 =?utf-8?B?VzlIRXhjbkFETG53ME8yd050WnY1SjF2Y0p6SnFzVHZ2L0l4SGg1MHk2cnBl?=
 =?utf-8?B?S21UbVRjajZXb05TZGVVMjNLVnVsVFJORVQrQVM4VXMzTTV1QXYrdGh5ZmVK?=
 =?utf-8?B?Y1RxREN4ZmhXZjJ5OGRNZmQyeSs2RDd3dUIyZ0RGcEM5dUhKcWcwb3IxZGY0?=
 =?utf-8?B?SnAyWHRrMTRTWnYzSVFIQTJDanovNTRzTXhCTng5SnlwS01sSWoyQ2pDS0xz?=
 =?utf-8?B?dFgzSW9GUnBnNnVRS2s2aWp1ZlRqWHVVREhkSnB1OEZnRXZrQ1dsdStXam1U?=
 =?utf-8?B?RXFnN3huSVZvbW1NMy9QZGZ5K3FHanUrS1UrR1dxd3lyWW93eWQ3QnZXQWM3?=
 =?utf-8?B?eWUzTHlqZEJvMVdoVjdYMWw1clJ4K3pVUythM2JISm41aE5Ha0lpWEJMMVVU?=
 =?utf-8?Q?AsVw3S+RLUMut6+7+ZhDYdMKeKCuoedx?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 03:59:20.0420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea1f27d8-6618-4f53-9ed2-08dd0dceb4aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_195931_623212_842C4F69 
X-CRM114-Status: GOOD (  17.93  )
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

Hello Cristian,

On 11/25/2024 5:05 PM, Cristian Prundeanu wrote:
> Here are more results with recent 6.12 code, and also using SCHED_BATCH.
> The control tests were run anew on Ubuntu 22.04 with the current pre-built
> kernels 6.5 (baseline) and 6.8 (regression out of the box).
> 
> When updating mysql from 8.0.30 to 8.4.2, the regression grew even larger.
> Disabling PLACE_LAG and RUN _TO_PARITY improved the results more than
> using SCHED_BATCH.
> 
> Kernel   | default  | NO_PLACE_LAG and | SCHED_BATCH | mysql
>           | config   | NO_RUN_TO_PARITY |             | version
> ---------+----------+------------------+-------------+---------
> 6.8      | -15.3%   |                  |             | 8.0.30
> 6.12-rc7 | -11.4%   | -9.2%            | -11.6%      | 8.0.30
>           |          |                  |             |
> 6.8      | -18.1%   |                  |             | 8.4.2
> 6.12-rc7 | -14.0%   | -10.2%           | -12.7%      | 8.4.2
> ---------+----------+------------------+-------------+---------
> 
> Confidence intervals for all tests are smaller than +/- 0.5%.
> 
> I expect to have the repro package ready by the end of the week. Thank you
> for your collective patience and efforts to confirm these results.

Thank you! In the meantime, there is a new enhancement to perf-tool
being proposed to use the data from /proc/schedstat to profile workloads
and spot any obvious changes in the scheduling behavior at
https://lore.kernel.org/lkml/20241122084452.1064968-1-swapnil.sapkal@amd.com/

It applies cleanly on tip:sched/core at tag "sched-core-2024-11-18"
Would it be possible to use the perf-tool built there to collect
the scheduling stats for MySQL benchmark runs on both v6.5 and v6.8 and
share the output of "perf sched stats diff" and the two perf.data files
recorded?

It would help narrow down the regression if this can be linked to a
system-wide behavior. Data from a run with NO_PLACE_LAG and
NO_RUN_TO_PARITY can also help look at metrics that are helping
improve the performance combared to vanilla v6.8 case. The proposed
perf-tools changes are arch agnostic and should work on any system
as long as it has /proc/schedstats with version 15 and above.

> 
> [..snip..] 
>

-- 
Thanks and Regards,
Prateek


