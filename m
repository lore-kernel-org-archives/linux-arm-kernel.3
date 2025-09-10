Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C234CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 19:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GwL5lw+/N5QFdXvh9+e7gnl+eA5QPFIR7IVFyRnBslc=; b=BsqBfQ0zorQVGbYr6DklxmdgkL
	L+SLtZyjmdccigNd6DHgmLsnZSAb+myml2TRijj4cbVdF0dasdHKd8+CFQ36xGM2Um0MUB7dhG7dC
	YjQi9pcVkFPkTGoPEwINReSxsTMcYHqIwdqsp8TNuZkkgnz7LyelbFrg5XNtGtpR1XN/Dtqdk8fvx
	CLWmTjO5PxOo/QXHEmtZMA2VY8JbwdUJ4fh9S6WmaFGM9qUpxBaGAsyKAwOZh15axE/QIQ2he6Nhc
	ioHkinv7nCNr+1aRMNeasAEt2jegFIIkGeZo5PiDeZfmQrTLrHD4JreIMYa/aG7Th9irAb34SaNvw
	FwQbx0qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQmF-0000000GNfB-04tn;
	Wed, 10 Sep 2025 19:46:47 +0000
Received: from mail-dm6nam11on2072d.outbound.protection.outlook.com ([2a01:111:f403:2415::72d] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQmC-0000000GNd5-1aSV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 19:46:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPSoLKY2on6x+IDKHMVcTf5LenVW/pFO7g9fQ+FCwZ4xZOaoHGfCboJmciIn3VyQmPSf3OlbGFMvSuzE2tirPypSKR053m1FGfA0qbc9ud186QKxEbbnKdr7+oDovMerQMG7fOCoMspb68JmhoeC2bP6Mgz2nOyOl0kYKJKyuaFP+8rFvk7f0pd+QJ61PBxjUwTahvWbJaW5zogH97Kg9QxIibWHmWqrMrQnd8CaT8DsNkgugPmNzFbIMasUBTdJUv5OtqOXNFSkmErz1MWl/NwyePl5mS9e7ogN84op8nZCUK9ZbBS8n1UKaSDryrwxg2dxQbkqBYEdxYUcHXJFtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwL5lw+/N5QFdXvh9+e7gnl+eA5QPFIR7IVFyRnBslc=;
 b=pykZ/2YZdQgsrnHSmVO4/w2RP+2Nxtz8mf5jgLJhL0oDiZmIZU+NpuLr35jtDgB3ZqM/g/46FOV1ZCsniamKtDDpM/JknSXlJEN8I9o/DvNF0A2PSqkPmOcFxy4yEo6jn344pNaXVVrNDlve1CGdX7+3Qykbgk4FDbLWmC4kzDCt65T1hj0E37z4HyRpWpXsvaJRVwKcvCiVsmoQ54sbE2O/eis1TjJ4xUeAcuBi7cpuNWo7ojOjRd0fKhsXfLCqrJl0+KxkbnKDf6tXK6H5iNyaS8fjaIknaTtVpUTobl+G3kctTLZfozUzDZUeNbYsEotAeC8ZGpSHwjn8QC+Vkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwL5lw+/N5QFdXvh9+e7gnl+eA5QPFIR7IVFyRnBslc=;
 b=l3INOp3ENrihKUMv2y93oclwhMoqjSHvcbWVrizM1xNpCO1IT+jRb3fODNfvPEUfn8//jaSR29f1NRAPLhBZHKOcpoNoB/u4HS6FVTUQH7WTtyACVDCMutavTY09FzvXjUERCiDzWnsYXuEGCMmrlAK1H9D4YUYUruLekcPJT/8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 SA3PR01MB8547.prod.exchangelabs.com (2603:10b6:806:39b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Wed, 10 Sep 2025 19:46:27 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::86f5:4db2:7ad5:7fc4]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::86f5:4db2:7ad5:7fc4%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 19:46:27 +0000
Date: Wed, 10 Sep 2025 12:46:24 -0700 (PDT)
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: James Clark <james.clark@linaro.org>
cc: Ilkka Koskinen <ilkka@os.amperecomputing.com>, 
    linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
    linux-kernel@vger.kernel.org, John Garry <john.g.garry@oracle.com>, 
    Will Deacon <will@kernel.org>, Mike Leach <mike.leach@linaro.org>, 
    Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>, 
    Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
    Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
    Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
    Adrian Hunter <adrian.hunter@intel.com>, 
    "Liang, Kan" <kan.liang@linux.intel.com>
Subject: Re: [PATCH] perf vendor events arm64 AmpereOneX: Fix typo - should
 be l1d_cache_access_prefetches
In-Reply-To: <6a24df18-832c-41b8-8226-5dc5b3c9995d@linaro.org>
Message-ID: <c48690ca-f7d-e711-5b9a-d18c138568d@os.amperecomputing.com>
References: <20250909210120.9823-1-ilkka@os.amperecomputing.com> <6a24df18-832c-41b8-8226-5dc5b3c9995d@linaro.org>
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-ClientProxiedBy: MW4PR04CA0387.namprd04.prod.outlook.com
 (2603:10b6:303:81::32) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|SA3PR01MB8547:EE_
X-MS-Office365-Filtering-Correlation-Id: 83fd0d73-f4a3-476e-88d2-08ddf0a2bb0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qfksJa9fpSoknThrBn8ZAK3WvUvsV4iUZNcuz7GkSDbvgZlb+tNCulXMd015?=
 =?us-ascii?Q?bwK93kAg0LGVdiflZaMmaSzH3//wJkGtTJw+myypmnjiT3b/Ob3Kk+fxiyzm?=
 =?us-ascii?Q?3uiGKFlNx1ZGa25KucoOJC3UV8KQ+RoSRVuUtRI1iwJin5iMplMBV3VFVnQV?=
 =?us-ascii?Q?1Nv1q9bNicSTahZ/aoFqTnk/W+tSNHl7+oxiFvRXKPKDPlKnyDSIN+ZbF0Yf?=
 =?us-ascii?Q?WwK4GOlmBHIB/NuvJbXrCOHJE7rZex47mhbF2MxfLy7uGIm3AcM96bjPuygT?=
 =?us-ascii?Q?JC4EbBO7ZhOj93jE5v/Re1+sYRVijIXW5jVNi4kGYxZ7WTsrrve+WlXHyoD2?=
 =?us-ascii?Q?W1HfF8cOVkayPMgOpbqQgpCPZFLfzUAXdgR2LzwDkwHtplan8N0+lu6apKRy?=
 =?us-ascii?Q?YgwaBwjm/xFh0kQY8LtvQ77kP7JJe4J8nrXLtkeTACU/2g65sM4NBKzNGbl/?=
 =?us-ascii?Q?aWN4XLfE1+eKboyA+pYaXehJoaXTlT+PBb3tApErBFnn1zMLx+DezoJk9F9q?=
 =?us-ascii?Q?I6BhYlLfztSsOaW3X4OR3aLpJU+cN4r4pG+GVCF5YPiEsfnIpW0zzF/APkNw?=
 =?us-ascii?Q?CEP4kev4uLyd13PC8VcSTVWcYSSVHmIlSdEfcm4iklNZsUO925GMTsxus+w0?=
 =?us-ascii?Q?Cv37lJU/7FWcHsLm83GHm8L0zUXwOomRkGdy9k691CbsAsitQqIwhL+nI8GU?=
 =?us-ascii?Q?YZnRJRYVN6kGshlXWSlGdqmvaYpg4AEFKEz8rdNSXpoqxwcV/nu0/V1Mhxk+?=
 =?us-ascii?Q?6bE5majdFKYtCLmnqWgnpcg/L3HCcrWM+fW+vl1sN230AY0NbiMXjMd45Hi/?=
 =?us-ascii?Q?8KaEjAvgp8OjAgVIasbHKh0AGU6+l9wKGs9L4kYauGN0jiiTKf704VMM3FR2?=
 =?us-ascii?Q?RDbGmhW3d91P6ldk7y/crbrCIZ4AFWhegI9TrxTGx1QWhYrbap+KoMazRIMR?=
 =?us-ascii?Q?oWVFvf/S6v2SyOhvl7K7x9TcKkvVwbjPiYNwVsX4VSbmgNJY+5g+GF4iLaPI?=
 =?us-ascii?Q?DgA+GNdnR4a2bpxenxY94iy4Gp+qQILnCPCzgMeaF09HbuyoZvRE1PGHaXfg?=
 =?us-ascii?Q?L/zL005ThrTQNp8NyTtJSwi7tRLT9yDtbu+JPME8RGPrbRdbjJlown3DVdye?=
 =?us-ascii?Q?DrF/3lkoGsB6NhBjxygVNVoarDRFMxd1Xp8VH7ETaJxsfBNQ6B6pNV1m6g3B?=
 =?us-ascii?Q?0wsbWFEPZS8nyHq0SvEQzKRqukieNP3W0YgSh/eJTom1Mzi9mXuqGP9Yb/JN?=
 =?us-ascii?Q?o1TdAUe6hpVMJ8/GBkmj3S1919YYQSQLkmWbvUylJvJlcC6a3eLwxP4tAnM1?=
 =?us-ascii?Q?kMjJR8HhpmLqY7VvHfqjsieJ0Q7818zM+K2yFe37nhBnw1EOPE5X05tMcG5p?=
 =?us-ascii?Q?tRPlBelZJu0s0l93772IcWTCUJ1YLhW9O6CvWqhNZc9AxKeJHQX8XoG0bXYh?=
 =?us-ascii?Q?mwdKqunSBg2pxJZEWM+ujR9d9wAZhfLwpy82TjScxcggM80NFLCUYGNyrgSD?=
 =?us-ascii?Q?O6O6oG+V2IGLBQ8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9k3J6ruKY4+tewuxzc1HIV35VrMUZlWpWmB/TdSSzBnyEFBUPbSTM5O1nST3?=
 =?us-ascii?Q?lLFZajxkm7M2jDsbjwXV3Tj+dw2HtpIizZS2eSRVy0vI1EuYZO09qirq0+LY?=
 =?us-ascii?Q?/mteFW/us3B2efeGmPQTgPZDSY+2E9LeU2o5ei1uJm5K7ajWw24SfqEovqmA?=
 =?us-ascii?Q?9jq/ypeED7xoff9WT28t/FO/ZuJF79KvdQwxaoaQzIAP1sKB2qkavGvSKyto?=
 =?us-ascii?Q?dwnyqI6Qn64wqISMOCobojDv/0NaVZiKYKWIrDnk3/SMfLQHKesL2uWLLmmV?=
 =?us-ascii?Q?rPIcyPhG1YsjNH1VuFBxpcm0bwPU0Fb90hkGLrfZ8SPi03F9HSrCUMtgNko/?=
 =?us-ascii?Q?yAG32jiQkU1joIltRwPoNQkn5Uq/SOIHaTDkdhV38H1bIBdYQutR/eCWrnmb?=
 =?us-ascii?Q?xR3EnGNVics/GonGxH5xS22Wz7mmAald0I461ssIOlB3xs6++IQZ3eabLXPC?=
 =?us-ascii?Q?zK3oc8mRgOuqAMkgpfMcJ0csIZaWHRlxm0qTDmnbdntq7ZGh8j/ZLQ/tbRdp?=
 =?us-ascii?Q?rPMy/v6uyU8WK6zEFaZoFW+HU1gt7StRkGLJEjbO1gG3s9jM+xLp35XXbmbE?=
 =?us-ascii?Q?Z7gvnEZQr+l/EyQSjILMIl7yT01xAenujlaz7u2nhQj62TewjK/lKjb7wQSZ?=
 =?us-ascii?Q?Eir4+jp+xs6s+B9ND+MZTW3j0cFXeFLCQ1glzyZ7dNeCoobuV9QRbvr/a0KP?=
 =?us-ascii?Q?AAEzEnOnLjiE18BiQILHl0cB+t8v0NQBg9zDB7i2YaZAVWEHndh0w597sBXn?=
 =?us-ascii?Q?1sATXTgMrUpq6HM5Tvm+B+BWsuWb5p11MQ3tAl9Oj9GKZuGWiEfiHOtwEnjQ?=
 =?us-ascii?Q?JkVEQo+PabYrHuI0Q/7Z6PtFiViB6UFiAUwqI8Ze3SRjTkySB5iaoQjjY3WA?=
 =?us-ascii?Q?J1xWOY3liIsmvcxrnA26H4i1/1QqQ0DiUWuTv3GuYDpA/m8HTqaCBGqn3Vms?=
 =?us-ascii?Q?ing9Lb2qs3mbzk6KF4ZWUlkhuqr966vTQL4LCL8uHvboO6qUtQPTZ1iqinOe?=
 =?us-ascii?Q?v28zbIV3l0gjwaX9malA/xaDtyEF64ktJPhCQjdKpqjyUAQSKRwAvm4Pw8D9?=
 =?us-ascii?Q?7M8tuGU5js8U93AX3BcGmNuAKDO4uL1oszRlWGFKguMEM7X0kaZd2dZobJpi?=
 =?us-ascii?Q?unJ5Xcg3tcvS8TMqPTo13FVuJrMQADuKAMVgrFUwTDMRi2Z3PR80jAVaxeBB?=
 =?us-ascii?Q?L649+B26C6LrfARb4ly9gMRhWRW8w/y3Svhfb/EgTrqFiNvIavCZluBZ68hP?=
 =?us-ascii?Q?Ho91GJ9fG/5BCxVFZlVY9RWncMJIVUd8D8hC9QCvn6OM0e1qGsNrTnV6s21W?=
 =?us-ascii?Q?blyrzzfkxNdhI7ehneKd4LhZXjasQrZ/9mUqHPA6e4iWfIN7zJ+52KfetE2J?=
 =?us-ascii?Q?yEsggClwDcOdaZeYLHj3VtNF07PXGs0UXOJrDe7b+t/5dSQETcEpBszf76aL?=
 =?us-ascii?Q?dTkUNY7+PsFPrrEHXLj8Z53EVCHD+lvkehvtefahSKb4Vewv5bWTOFKl1PZa?=
 =?us-ascii?Q?8U+rLFsHya5dlytV/9kkwkh+ca2nuwrE3C8JEb6sJf6MWjhppGvLOSRLCm7g?=
 =?us-ascii?Q?9A7QWsSm+Xu6iUgZ2KI98cGa23DvXQLx6SpSwLw5GD8f0k15zPwa/FPZxSv1?=
 =?us-ascii?Q?FumgSIC8KQoMTcnQvf3xmeE=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83fd0d73-f4a3-476e-88d2-08ddf0a2bb0a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 19:46:27.1695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: apZ7ZiGWjRo5d4VAAhHeNkj5Q/dPRx/BgNd3JC7HT6vRaKXbYQvOFcGgtOxKd8kAWPvXfYQhfm83exyrXetENxZz18kNVv9oIbkVVs2tHLJSsm7sRri2yGznpB6LxZXk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR01MB8547
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_124644_416799_F184DF62 
X-CRM114-Status: GOOD (  13.89  )
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



On Wed, 10 Sep 2025, James Clark wrote:
> On 09/09/2025 10:01 pm, Ilkka Koskinen wrote:
>> Add missing 'h' to l1d_cache_access_prefetces
>> 
>> Also fix a couple of typos and use consistent term in brief descriptions
>> 
>> Fixes: 16438b652b46 ("perf vendor events arm64 AmpereOneX: Add core PMU 
>> events and metrics")
>> Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
>> ---
>>   .../arch/arm64/ampere/ampereonex/metrics.json          | 10 +++++-----
>
> The same typos are in arch/arm64/ampere/ampereone/metrics.json as well.

Ah, that's right. The descriptions do have the same typos. I'll prepare 
another patch for AmpereOne and submit them together as v2.

Cheers, Ilkka

>
> Reviewed-by: James Clark <james.clark@linaro.org>
>
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>> 
>> diff --git 
>> a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json 
>> b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
>> index 5228f94a793f..6817cac149e0 100644
>> --- a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
>> +++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
>> @@ -113,7 +113,7 @@
>>       {
>>           "MetricName": "load_store_spec_rate",
>>           "MetricExpr": "LDST_SPEC / INST_SPEC",
>> -        "BriefDescription": "The rate of load or store instructions 
>> speculatively executed to overall instructions speclatively executed",
>> +        "BriefDescription": "The rate of load or store instructions 
>> speculatively executed to overall instructions speculatively executed",
>>           "MetricGroup": "Operation_Mix",
>>           "ScaleUnit": "100percent of operations"
>>       },
>> @@ -132,7 +132,7 @@
>>       {
>>           "MetricName": "pc_write_spec_rate",
>>           "MetricExpr": "PC_WRITE_SPEC / INST_SPEC",
>> -        "BriefDescription": "The rate of software change of the PC 
>> speculatively executed to overall instructions speclatively executed",
>> +        "BriefDescription": "The rate of software change of the PC 
>> speculatively executed to overall instructions speculatively executed",
>>           "MetricGroup": "Operation_Mix",
>>           "ScaleUnit": "100percent of operations"
>>       },
>> @@ -195,14 +195,14 @@
>>       {
>>           "MetricName": "stall_frontend_cache_rate",
>>           "MetricExpr": "STALL_FRONTEND_CACHE / CPU_CYCLES",
>> -        "BriefDescription": "Proportion of cycles stalled and no ops 
>> delivered from frontend and cache miss",
>> +        "BriefDescription": "Proportion of cycles stalled and no 
>> operations delivered from frontend and cache miss",
>>           "MetricGroup": "Stall",
>>           "ScaleUnit": "100percent of cycles"
>>       },
>>       {
>>           "MetricName": "stall_frontend_tlb_rate",
>>           "MetricExpr": "STALL_FRONTEND_TLB / CPU_CYCLES",
>> -        "BriefDescription": "Proportion of cycles stalled and no ops 
>> delivered from frontend and TLB miss",
>> +        "BriefDescription": "Proportion of cycles stalled and no 
>> operations delivered from frontend and TLB miss",
>>           "MetricGroup": "Stall",
>>           "ScaleUnit": "100percent of cycles"
>>       },
>> @@ -391,7 +391,7 @@
>>           "ScaleUnit": "100percent of cache acceses"
>>       },
>>       {
>> -        "MetricName": "l1d_cache_access_prefetces",
>> +        "MetricName": "l1d_cache_access_prefetches",
>>           "MetricExpr": "L1D_CACHE_PRFM / L1D_CACHE",
>>           "BriefDescription": "L1D cache access - prefetch",
>>           "MetricGroup": "Cache",
>
>

