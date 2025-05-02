Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DF6C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 06:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rK4WmrIeb2b5bvnykqexAOgdy3PvAb2i9pydo2nq594=; b=bvOg1YO7PDek4UvUqelSYtni3L
	yPP2KUHsWcUz2Btbn7b1Adkdf4NVSq2E4UzRoVeLlhjN/KbeeN2arkSggN2AoXlxQ6PGlzq1/Ft+m
	VbHZkummPzrERBIQumYJbIcitn52gahdTf5/5EQ03vQEbuj6jyanffvnnLymDGDrOMD/LaS7yyW+T
	vveHionbRk4GTv2YynH/J2Er1SN2CJPNCd86dvVyx6P/ZgejmEVLuyEQq5JUS3dYclmCwvRiOchm9
	pZ6IHP8sVEDOnHvaO450GGyLbQxkIJjvj1ppQ3uaESpg7NMR7R3cs4XMCHvF4DIohOB5bNFMRZhYA
	2gkFlOjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAjzh-00000000zmJ-3Pjs;
	Fri, 02 May 2025 06:35:33 +0000
Received: from mail-co1nam11on2060d.outbound.protection.outlook.com ([2a01:111:f403:2416::60d] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAjxh-00000000zZi-3t3S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 06:33:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nsiT1arWRjL1UTiRprvWZ0dtaNkKw54UDhrCHhX+J6w8vqVwlhDU4VCA74ijZuOkifzpCov6H33Jv4NmSfIGk3UQzRjSvaehGzKlQouiJuUrSYyBQYPqnZBESjACxkb0E+kEEkB+B88SIUYcKsXYqUQ/0K5z1fHmJOM/tcPEtbL8Ku4JDKwQNAXDluUvc6y4xSWEZzrPmHhO5Re+3i6q/2iCnArXvOJ0Rt+3KIUd6QPwbhLs1atA0dgTGd9EAAjn02Z93rdF0IjboE2ursFbtVDgHRPezpvdei/uhGLNk/9hqD6Sd8S2q8sg+bHTJH4g5rBTZtXvXVpgkTa4WUndKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rK4WmrIeb2b5bvnykqexAOgdy3PvAb2i9pydo2nq594=;
 b=NOv31shlRm8c8YmcB3naUwWluPMyYEUqQQkGA/sZm99hQHKIi4+lhhoxYufpSRSn+IdOg7rrFtav0SqUmEpt7Z5Z0i+jkl0GwLbnxZSQFKHZGt3SPHShmtwboi4PGehWHS6Oze+mbRc2QGrsTgrjAMKi0VSFK1geN6WKxDsK65X09xsHMRTq98CPIyOeiSyVU43dTtGRkM1Ohp9b3t1iXlNDJ1w7fEqIoyb84rCFc4gI8apDwqzDCqDfkAjg/W4+7NsxMf22QuUJk9eoqlCHIZC0hjv/cBLKi37vF7fAEgO3cJfz1uOtwJiXitYz2L5v2yS5IwGDHX/Wevi25BMK7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=amazon.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rK4WmrIeb2b5bvnykqexAOgdy3PvAb2i9pydo2nq594=;
 b=NSDYrYRZrxOSssi4S8D3vEtHgSPfZ8rEQ62YVEKZFDdDp8vT6yxpRHXza/x/eBdo/0oxsPxray3GKSzqan1DXJS8CsXsMwgikqRMBOi5mYVJVMTZue8UhaEF0bPckZorJNymxzIqouwkocxNNdSZwFw59YCt0lV8V+k0hW3mTLs=
Received: from BN0PR04CA0027.namprd04.prod.outlook.com (2603:10b6:408:ee::32)
 by LV3PR12MB9353.namprd12.prod.outlook.com (2603:10b6:408:21b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Fri, 2 May
 2025 06:33:21 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:408:ee:cafe::9b) by BN0PR04CA0027.outlook.office365.com
 (2603:10b6:408:ee::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Fri,
 2 May 2025 06:33:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Fri, 2 May 2025 06:33:21 +0000
Received: from [10.85.37.104] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 May
 2025 01:33:17 -0500
Message-ID: <7d3bd258-fa45-4e85-8700-90203bacdeea@amd.com>
Date: Fri, 2 May 2025 12:03:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: EEVDF regression still exists
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: "Prundeanu, Cristian" <cpru@amazon.com>, Peter Zijlstra
	<peterz@infradead.org>
CC: "Mohamed Abuelfotoh, Hazem" <abuehaze@amazon.com>, "Saidi, Ali"
	<alisaidi@amazon.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	"Blake, Geoff" <blakgeof@amazon.com>, "Csoma, Csaba" <csabac@amazon.com>,
	"Doebel, Bjoern" <doebel@amazon.de>, Gautham Shenoy <gautham.shenoy@amd.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>, Joseph Salisbury
	<joseph.salisbury@oracle.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-tip-commits@vger.kernel.org"
	<linux-tip-commits@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
References: <20250429213817.65651-1-cpru@amazon.com>
 <20250429215604.GE4439@noisy.programming.kicks-ass.net>
 <82DC7187-7CED-4285-85FC-7181688CD873@amazon.com>
 <f241b773-fca8-4be2-8a84-5d3a6903d837@amd.com>
 <CFA24C6D-8BC4-490D-A166-03BDF3C3E16C@amazon.com>
 <d875adc0-744e-4b1f-a1bf-7e051298a0ae@amd.com>
Content-Language: en-US
In-Reply-To: <d875adc0-744e-4b1f-a1bf-7e051298a0ae@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|LV3PR12MB9353:EE_
X-MS-Office365-Filtering-Correlation-Id: fef9ca9f-86d4-467a-66e4-08dd89433bff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3Y5Z1A3VUM5MjFHcllOb0RyMnJ0dy9aNXYwSHl1cStnaDFrMlErUVh2SklS?=
 =?utf-8?B?SGNyNU9jZkdKNmtoZ21iQ2dlMko4ajVOL3YxTmdDa2pOMzVndUM1V1VqdjAv?=
 =?utf-8?B?aG9CYzdkS1g4WnRqV25XczVyNEljbGUyWHhPSUd2UzRsL3luZEFqY0VKQXZE?=
 =?utf-8?B?cWEvL2MvSnlIaEJ4clVpOXZKeXM0T3hHQUJIR0Z1ZFlhU0wxSmRteTdXcytq?=
 =?utf-8?B?THJxeC9Da1hJNi9Ga3p2VzcyRUZybE1JY2dWTUtVQkFMd3NWTDJWYm5KSUxH?=
 =?utf-8?B?SjRJMnZGUjBYV2o0Q2I0T1FvcnllT3FsbkhoVG5UWlA5dzZZQlAyL2IyNk5T?=
 =?utf-8?B?VVFaRnVMamRxSVhCYWVLaFNHY2FFMU5RbFQ3d1BJbHUrNGM1N2EwRDFRV1hF?=
 =?utf-8?B?RElYZkw5dk5EQ2IvQlg3cm93RnFBUG5QVVZFaG1FbGdyT2s5cG5NVmFyeGlC?=
 =?utf-8?B?UEZxOHRuSk1pY2JGVjltTGQvaVJGVzNMdGtVNGwwMFNWZDBmdDlMenhTUkEy?=
 =?utf-8?B?M0FjRmJIamdiUUlRd0JTZWFkWEI1ZzVMOUw3UDliMWVreFBzbXkzVEN4YTFT?=
 =?utf-8?B?K0RmQWRsOUhjc0J4RUlnd2VuSzZCVU9VRVVadHpmaDJEZ1R3NEpDYlYyU1Ax?=
 =?utf-8?B?M2NGZmNncW5sWmt0Zy9kanRLd2YxaERIbCsxNGJTTkFFRjI5dWdyUGY1bVdQ?=
 =?utf-8?B?c09KK3R6T1o3a21DWkhVR055OHAyM3FjTk5jVkVqbXNleDU4YVFYRmV1bGc3?=
 =?utf-8?B?bXBzMnpzWDJRbUY5RXlYWXgybDRNZi92WTRxamEreE14d2hNSzI1cUxRTWJp?=
 =?utf-8?B?VG1iVEtsamNnRXNuTC9iQ1RudE5VVVZDWk8yUFBVL3phZTZJc3RtT1BvcjBE?=
 =?utf-8?B?R081YnlodjdCM2NTeXhja2RrWnJsYXNHMWRMUEVBYTdHVm8yZ0R2Y3dtc3dX?=
 =?utf-8?B?UmZPWTFTWGRBNThHUFp0WnFmeUdwdUZncFBDb2M3MWRSa2UxV3YvYmlwWEI5?=
 =?utf-8?B?a0hEeklTVkdlZ29FQzY3VFhzL1NrMUFBT2dVbmZxamIreUd6YUNSbUN3Ukh5?=
 =?utf-8?B?Z1o2dDk3VlZWMkhpeDZlemw5dWcvTkl0dXdvYlhkTzM3Z0JWbW12SFZSUFUw?=
 =?utf-8?B?WTFZY0ZWc04zVlNDNm91M2dKb2gzL0xGK3pxbG1VK3J2TjE0aXFwVUhmYS9n?=
 =?utf-8?B?eUxUencwTzdzeDRNZDNqZWt6SUYwN1BYSHFpcEhudG11aXJSRmllLzRjSjdq?=
 =?utf-8?B?UzZpV05tK1V3Z0xrUzZLMDd6d1c3ZE9zT0JpUFFNWDNVeFl4MlkvdjZJZE02?=
 =?utf-8?B?a2t4TjIwb1RnYXhQWTBPS1hyd2hDU3ZBazB4MjdHSVJ4MmN3UkFIb1dIdGNW?=
 =?utf-8?B?VUZVNERpblN5QjlESHc0cjVHL1RJOUZNbWZ4Mll4amxMRVdWOURXSmVaTlkz?=
 =?utf-8?B?cEZrM09OSUR0RTR6Y3VXVnByNXZ3QWtlNUZJUk1hNmw0Ym5DUUhJVzJ0c1N4?=
 =?utf-8?B?aVJXOXk0V25hTFNRbFhva1duMTlVNjMveW5XSHpvU3puVFplSC9qUytwK0R3?=
 =?utf-8?B?TW82NlZjRmxkRDZFR21LNlhSZjNGYm9jRFVhYWpNQ1MxR3JNU001cWU3bVJH?=
 =?utf-8?B?eE5ETnRlVldiQXRqTWVIVkdvSmc0cmRRRFN5dHNDVGV3MGtCcDY3Z3NlaFA1?=
 =?utf-8?B?WUtGRlZKKzFTbTBMZGxCTUMrT0dNUTVtc0xCZlE2R0xKNzlQM3NSY05ieXBP?=
 =?utf-8?B?UDBVYVI3MGVUMmtwbEJ1LzNqeGpLVlZ4M2dVNEJ2K2NtRUNaWjVBOVVicjhY?=
 =?utf-8?B?d29PaE0zemFYd2o4K2tFNzZBQXorUnhXdWQ5d0F6SUlmNVlzQU5DNWhPYXBq?=
 =?utf-8?B?b2JEYi9jd3M5V0oyYkVyNDN4YTE3QThWTURHTkRubEsvcUFBMGErVzJBTTRD?=
 =?utf-8?B?Ny9CdW5qOXNkZFZnVjN5bnYrd2c4U3c0QTlkc1hiTlBKVGRxaDhiVkZWajFP?=
 =?utf-8?B?aWpCcE1wTkl5WHlTYnBkR3pUWHY1Y3FobGZtYWtjSlNTcStUeWFsVUd1YXlF?=
 =?utf-8?Q?l8GHtl?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 06:33:21.8456
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fef9ca9f-86d4-467a-66e4-08dd89433bff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9353
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_233329_959672_76F6CCA6 
X-CRM114-Status: GOOD (  12.66  )
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

On 5/2/2025 11:26 AM, K Prateek Nayak wrote:
> Could you also provide some information on your LDG machine - its
> configuration and he kernel it is running (although this shouldn't
> really matter as long as it is same across runs)

So I'm looking at logs at LDG side which is a 4th Generation EPYC system
with 192CPUs running the repro on baremetal and I see:

[20250502.061627] [INFO] STARTING TEST
[20250502.061627] [INFO] 768 VU
...
Vuser 2:VU 2 : Assigning WID=1 based on VU count 768, Warehouses = 24 (1 out of 1)
Vuser 2:Processing 1000000000000 transactions with output suppressed...
...

Now that is equal to 4 * 192CPUs that my LDG has which means I might
need to match the same configuration as your LDG to mimic your exact
scenario.

768VU each processing 1000000000000 transactions sent to a 16vCPU
SUT instance seems like a highly overloaded (and unrealistic) scenario
but perhaps your LDG is also a similar 16vCPU instance which caps the
VU at 64?

Currently doing a trial run, staring at logs to see what I need to
adjust based on the errors. I'll adjust the LDG based on your comments
and try to reproduce the scenario over the weekend.

-- 
Thanks and Regards,
Prateek


