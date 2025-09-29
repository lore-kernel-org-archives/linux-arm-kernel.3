Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52A2CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 20:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8EMxCL06LNByN1UHB2EoOFYkFyhA1vWBerzpYyGeXlM=; b=gkvwWL6Dy+5j/8Bi32XBTquIj2
	cistHa9O74Re5zGJEa58cRvfTZcGTLKs6SJyZFT9TR9NbUEsJhnMpts7u9ecEpmO3Xrl/2F3sgwvB
	kEvXcClztrwu5Y/FmM3nx12s0ALcLCmPlOfQOmNrLaSYaGWkeX8sN95LG9v7ppnVgHABj30TGXo1j
	Niqv04/xIfvTlo0c1IedK0tx4qiz+cBQBUDl9vM7m48CAqEDrP+EeirMu/lOccC/jZw9ryBeuhPYG
	ttLWxzOzPgEAJTl2IsB3XG2sD7YMmnGKFjS7VMywVP+swLibuownSrKBD0f4kt6YtFyCIibdBxklF
	OYLaLrfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3KQE-00000003RTX-3Uc9;
	Mon, 29 Sep 2025 20:24:34 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3KQC-00000003RSZ-1zjJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 20:24:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X42ryLJhmKijPNIM4cUaCoi/EUpnK8mcMzuBPKLYDsIbx5Cs2qiO6uHSLKLp1maCl55eEuB29dp8VkpAl+KlG6LymRzFCETZwP3d7JcHFx01+0wY5WUilzLsqa1s2lq2y5Sy/3/8EuhLV7WbLRwRXPlhtWWQt+RYlrZDe/p7+LIL+xzmaS7AbbkfUi9hAhj8KOCSDoxx9Qch9eNmVsPncxBWQRTdiwXvDfIPafJyRYObQSb9Ik9Kgl37vw9SD1T7imsVDo2/9SK3vhfOCVa8fpNfCUc5+XBZmCIzBhf8y2i1Iw39vaO/reo3HGBX2v2NCqBQFKecDs1jjIyMSI5v0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EMxCL06LNByN1UHB2EoOFYkFyhA1vWBerzpYyGeXlM=;
 b=oUnutL2MXqG9sKs5vbZ//nJ1oAC1yebvbewl1w2ZvnygF6hje58sCb4tIO0Q3dvrizTO73nkP6JS2z+P2EJZbaKXrQTqWc4t1jnSwlxVdWDXkThsA9GQgWVsO8qqvXAvfK89+5pUhZ6Lyqy1aEFFPLZqpi+66nNMcI/YCtSanCIc2xWGisd7go2u9c3m/TE4xpE/l07F17tdjtB9DI7OPbJy9+PH4Y++V/gyBx5UP7aC0ugLqUU4oz2vLytS8a211QJZWBaW+NZFv6ui9WRjA6UXmP5ggp5931RN2V89C8XYNnQRTzbNFysQqA8dlGx4Jbzz+pZz5s2d5AgMbGpMRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8EMxCL06LNByN1UHB2EoOFYkFyhA1vWBerzpYyGeXlM=;
 b=OvZWiuOUpS8lC+1E/V0za6C8FkvnvHmAd8/tL/eC8TptFMYI7il3q8YYTqEfHelxZ63eZtGIA8AcW1jFU0A3VHvBP7185iEGC+EWINPHylNJCVEx1Lnt+swNhU5nr49+NTVGgLn9yoLtYbtwnpuLPQT5cqCw27SXwnJpNKWM+P4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 DM8PR01MB6982.prod.exchangelabs.com (2603:10b6:8:17::20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.17; Mon, 29 Sep 2025 20:24:20 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%3]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 20:24:20 +0000
From: Yang Shi <yang@os.amperecomputing.com>
To: muchun.song@linux.dev,
	osalvador@suse.de,
	david@redhat.com,
	akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	anshuman.khandual@arm.com,
	carl@os.amperecomputing.com,
	cl@gentwo.org
Cc: yang@os.amperecomputing.com,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [v2 PATCH] mm: hugetlb: avoid soft lockup when mprotect to large memory area
Date: Mon, 29 Sep 2025 13:24:02 -0700
Message-ID: <20250929202402.1663290-1-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS2PEPF0000455B.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::518) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|DM8PR01MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: 1436f454-51fe-434b-84a0-08ddff962bbb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3hhMms4UnJlZHRSZ1ptTmhoSUN2SDYwekVzMURwSUFuR3c4M0RtYWJLT1Rh?=
 =?utf-8?B?NEdSWTB0aXUxdGVNUmhjU1RjVCtkYzVjVXJmV1czc3JlVnlqQWcvZnpZSjdV?=
 =?utf-8?B?YVRPSkVjQXRGbXBjK1g2emkra09HR3RzOHBPY0dXV3hyOVFuVGZTclZULzRy?=
 =?utf-8?B?RFhmSkFoUmdXVk1HdG5ucTQ1MU1ESUpVMCtyWjY3SHBMSUtoaE5ZMjlwNU9H?=
 =?utf-8?B?TlczczNXL3g1TjUzNzU5Z3FqWUhSQUM0SmtDSXJLWHZNS2M2SGNRNTJod0cz?=
 =?utf-8?B?OFRZZ3JsVUNyYnRPN0JsTzZCZ1lOaHp2enpRK1NCbndrUEMwM0NSQ0VMdno2?=
 =?utf-8?B?Z09xaEt6SzZhY1gwblBNREllWW9FVy8ySVlXd2I5UllRM2RoNGZNR2gzbU9X?=
 =?utf-8?B?UXFFdDdZYnY4dzVHTk9rTC9LdGR2QmRybjVwV3k2RTNCdExCQ2NScGxmMnZn?=
 =?utf-8?B?T0g1RTEvdnVLOUhiWjM2KytZWlhscStIWmhSRXF1TkxTbXduNzVXV1I2bjFV?=
 =?utf-8?B?Z2cxRjJ0VSttL0RhalZ3bi9uNExyREVrRE13ek9iRE9ZaHBDckhsckV3bGc3?=
 =?utf-8?B?SG9mZjgvUWcwRDZXUjhVK3hEMzE4U0RlaFl2Zk9lVnNrK29xWnBHY0lnUFNj?=
 =?utf-8?B?KzBLOHRxUllYa2xjK2pHdXhUQTVqbEh2b0tEZStFRG9aS3diQzBTU3pEcXJO?=
 =?utf-8?B?NFNPa1FCQ25rT3YzSDFBNVNSNkRHV0FnM2xjdW9pSnM0M0xMV1N2ZW1zNEwx?=
 =?utf-8?B?eVFYY1ZKQVMzcjVWSU9RNUhYaXR5ZlRNT2VmWEtFMU9EMVljVnNMd1p6eWlQ?=
 =?utf-8?B?OHNBMktOdms4eW1ESHNFMmJlKzB5Rm1EKzVDc0pRL1Awa2dEMkx4a251UnpM?=
 =?utf-8?B?akt0R09PcTFEOXpJU05rTVNvYjNUN2w2U2dSLy9VeWx0bWE0UzBmTHpyVzJB?=
 =?utf-8?B?aU5jRUVBNDdWems0Ny9EZ0NqYjQ4OGV4U0ZUdU1QemNtUVVpRllPTGMrTVdZ?=
 =?utf-8?B?MDlvMWUxcmJnN3g1T0VwZnB3Vm42NW52N0VWMlEySkxXUnJ0cE5CYUU4WFdz?=
 =?utf-8?B?TnJrc0NPN0Z6c3dyQ2tmUCtvTWV2SVE2dkpHVFZUYk02bGdaamYxdUJiRVFj?=
 =?utf-8?B?ZVJCdkZDSXYrbjVLM1hDUDZGNDFtNzB6a0dmOU9yWmRJaUZyek1RRHp1S3BC?=
 =?utf-8?B?ZElOQnJuclpSQ05wMVIrQ2dqY1B1SjdvQUE2SEpQWENKMXF2cHJoNVIvT3JS?=
 =?utf-8?B?a2pER3NGbmxHQy82OFdVKzRRTklBR08yTEVlRFZEYlF3OHNaR01mZDk5a2hN?=
 =?utf-8?B?UE1WQjg5QWNXbHExbHBqZWpRaituR1hKdTJjQitLNVRUdVJGcHB6YlBQVEFu?=
 =?utf-8?B?aFc0eThIeVFGTlF3Zm82UXFWaXZDQ1lpSWlEaExpR1BsaE0wbkt0Tkpld1Ju?=
 =?utf-8?B?ckpORWxoam9HTVc5SkdHTmF3blY2SHpJRzFlNzVXaDJuRVd6MFIyaTFTZ09C?=
 =?utf-8?B?NTh0akh1d25UV0RDTW54dHJnSDg5M21YYzhHMGcxcDFMMUdsb1ZlZ005NWdJ?=
 =?utf-8?B?bi9iNXJ6R2lRczN5NmUrdUZrR3E4RlF2ajZ3ejlQMVNMbzl5d1ZJWmRWK015?=
 =?utf-8?B?TFZzcnNlOUh4MjJieVd1aC9URDVZQ0JCb0hsTVJTSEcxaThDVnpaV0w1VUov?=
 =?utf-8?B?RGM1Z0R6QzB4dFBZKzVTSXc4dm9tazhDRTg4Qy9jREtqUVg4STNOWUp4WWti?=
 =?utf-8?B?S2QxdDBGM05SbmtocFlaR2dhcjBYTWxBZkRkRFJhamNHU29JM2VsK21lV09z?=
 =?utf-8?B?RUp0bndzRlJxR3BkVmFLYjZ1dGJWeXRhTVkxZ3hMWmExVFV3TGh5Mzc1QkU0?=
 =?utf-8?B?VWptN1NlZ0FndWFTZUhFUkJvZlRYZ0VjczNUOEZ2ekhSUmwzbFE2TmhudWhJ?=
 =?utf-8?B?Y3RWUHNhbzdGUmJsVEFZOU5RWXZwM2tUUndiTkNTM01FNXRHdFhockYwZlFI?=
 =?utf-8?B?MCtCSlNuU2wvTWF5V0hVeFR2V2N4Z2ZYNkd5c2dCWW9lb2NuZXRqQVJCQUFO?=
 =?utf-8?Q?NKFvMQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejMrcDYzUGsvdDVKRXZhdlNXWmgxelJySlJxYlFuaG54bHVBckNxaVowSEE2?=
 =?utf-8?B?eldPRW42NFh5a2dEeEQ5T3VOa3dOZHVTL3Y2ajdFYlJ6V2MxTW1GVWw2SE1R?=
 =?utf-8?B?ZEs2OEFxVEZVRGkwUzRIMXJvTDYwbGkzRzVka3BQRUU4KzhKcXFWWTJweU0w?=
 =?utf-8?B?M0hCcFdmZm9vOU1oUjNjNXdqTm02N0xWcXZqeDB0c2Vwc1R0NHZwV0NoVnB3?=
 =?utf-8?B?bVVMdWprMXhUZ2FwdVlpZmZhL3Y5UFVQU0ViRzdraXgzU0hWVHdybldWQjVV?=
 =?utf-8?B?Q0FVZkdXNzA1dDExeEZyN1F5dElpOXdKS1kwaVpzVDlZdjBsVURNdzNjVm0w?=
 =?utf-8?B?c3dDeEpBT2prS0UrVTJMSi9kZVQ2R21lT1JobU9LbkZrU013MjB2TDRBL2lT?=
 =?utf-8?B?RHNycTRIdnJFaG1kSENXWVc1T0FVR05nYVhXTjlqUWRXdmMyUElqVTNOS3Bp?=
 =?utf-8?B?eGtJQ3JpclYzRTlwSEhocDhlU0VRQWV5bENNYUJ0YWdySmlkVzVjdGhKSWxy?=
 =?utf-8?B?UVl1Y1JHY1lCaGFxTXVScURYSjFFbUp3Sm85VmwyeDJCUUhiakllWURGSEpO?=
 =?utf-8?B?OVpmTDdTdHBKd25UQTBzQXl1TktFMFc3cjYzcTd5S3Nka2VRTWFtdGJmTWZ6?=
 =?utf-8?B?Sm5JOG9UZ2l2UmN3aks3RUdmbytaUGFSbzhwQ1JzOWpGTHloSWxHRUxad0F2?=
 =?utf-8?B?RHVQbGx5elJvdEQzdzhUTldlU1pQYVZ6YVV5U2FXc1Vjb0JTd1FGcUtVNThF?=
 =?utf-8?B?TXNIUDNsTDZ1VXBvQVk5MlIydldaTWpxOWU2R2dKNFkrMTZEdFQweGVwQ3NQ?=
 =?utf-8?B?bzRLNmJmNHlsVGFUQTBDMFUwd0Y2YnJzSHZ3QWJXZmFmNWxRZGJsYzQwb1li?=
 =?utf-8?B?MTN1aXJsajFqQjhnWmhFQVZ6WVl3d0hPVVVGa2l2VkpGSzBYSGZtNHphWmVi?=
 =?utf-8?B?VnVtRTNvejRkYnFXOTlvQlNkdkE5MTF5RjYvU3VHMVJtMmNoalJZcjcvU0dJ?=
 =?utf-8?B?Z2oybXFQSXJCTDNQM0hXUmRpWXZROU01Y3NBZlBQMHpuMTNWbVZWRnBNTE0v?=
 =?utf-8?B?Vk1mL0ZWWjVUQzU4NEU5d1A3Ukx0ck8yQ0ZsZlhreFgwMVBlYkd1d0hBNHE1?=
 =?utf-8?B?RkxTLzRoeW9ROTg5cExhUFRxNDRBTEc1N3ZhZS9nMkRoVFViQkMvU1RXMHgr?=
 =?utf-8?B?Y1RpcUF2WkZWbzVRSWFMa3d2Tm1UbVZyZkNZb1JQSlBBbHBzMEEzQWxCZGlj?=
 =?utf-8?B?a0NROVBmRmRIY0c5dzhqZkloR1pHRU1TR0YyL0JKUmVEOEM2SW16Qi82Y0lu?=
 =?utf-8?B?VWxvQVQ0V2FvYUFtUVY1SE1OV0NOYnh0TmlTZldLWms0U1RUOGVpQnc1Y0Ir?=
 =?utf-8?B?T3Q1RmVUd2tUWFppNjQ5WTBXc1FSQzM3UHpIdiswbEZIeFZaeHZ5aG15RG1N?=
 =?utf-8?B?ODd6YlpiUmZJT1U0c01Xa3ZKdnFKSHVManN1bThuTk01WlBLNFJ0ang4NlFZ?=
 =?utf-8?B?SXp3L2VrYVVIM29WcS8ySUpYVjdnUDBidS9YRjVZcEU0dlcwakdRdG1wbzdN?=
 =?utf-8?B?bUpGcW9sQ3RSeEk3a0dHRmsxcVJjZFZob3lsRkhUL3R1UHExQlNhc3VxN0Er?=
 =?utf-8?B?aHJuVG1DUSs2eTZ6YzZqY2JLRmNVdTZnQ3dRMWlPcGNxN25YL1lxQXhnb2RV?=
 =?utf-8?B?ekZhZnlUdkt0SlJkckl0eXNOOUdyTWNtcjBWL2tMRFlQcE9jT00yYzY5SVJp?=
 =?utf-8?B?Y3hUUVBSaU10dGdhUlJudXVEMjQzRmdQYU0xSEU2NFNnTjhJVVAyRTJndHVJ?=
 =?utf-8?B?ZTBsN1gwY1A3a3d2Wm82Mk5NVHlBSk11S0pmMjFBbUZVRWR2N3dsbkdUbGJP?=
 =?utf-8?B?RVRydlQ3c0hDdll4TDRFYkhwWlN3Q25MMjBCWmVxY20vZS9kN0U1MDNmeWlR?=
 =?utf-8?B?OXVKY29rcFhSaG9MTncvZmZZQU85WTNxc0gzdDZqNGlBNW1YamNhRE1RTmZ1?=
 =?utf-8?B?OUR1ZDAyOFo5eTlZeVRyRy9EcTc3SDQrbUlBdkNJbmVoNWFCRGUveWNqc2pI?=
 =?utf-8?B?V1kzWlpXbHIzRFRZd1hxNHpQYml1T1FDS3ZrS3ZzWExuWU8zZG1xSnZ4bldJ?=
 =?utf-8?B?TmVRQ3dRZzdic0ZNcGlsTTJTVDNqU3F2aFJseTVabVB6NnZGVFhtRzhpb0NK?=
 =?utf-8?Q?pGyfVZepNTvmq1tjcFumA6k=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1436f454-51fe-434b-84a0-08ddff962bbb
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 20:24:20.2206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eY1Mb1PUvCDPS09yteqPcTwaCy6Pc9T7+dzvhRzj0c/qg7vd54XcjIbtOHQVanWY6U6PbqEhPnT/Ka5VRUkxiFtPOrmsKrKkXdlJS87vRF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR01MB6982
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_132432_517254_68554B02 
X-CRM114-Status: GOOD (  11.12  )
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

When calling mprotect() to a large hugetlb memory area in our customer's
workload (~300GB hugetlb memory), soft lockup was observed:

watchdog: BUG: soft lockup - CPU#98 stuck for 23s! [t2_new_sysv:126916]

CPU: 98 PID: 126916 Comm: t2_new_sysv Kdump: loaded Not tainted 6.17-rc7
Hardware name: GIGACOMPUTING R2A3-T40-AAV1/Jefferson CIO, BIOS 5.4.4.1 07/15/2025
pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : mte_clear_page_tags+0x14/0x24
lr : mte_sync_tags+0x1c0/0x240
sp : ffff80003150bb80
x29: ffff80003150bb80 x28: ffff00739e9705a8 x27: 0000ffd2d6a00000
x26: 0000ff8e4bc00000 x25: 00e80046cde00f45 x24: 0000000000022458
x23: 0000000000000000 x22: 0000000000000004 x21: 000000011b380000
x20: ffff000000000000 x19: 000000011b379f40 x18: 0000000000000000
x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
x11: 0000000000000000 x10: 0000000000000000 x9 : ffffc875e0aa5e2c
x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
x5 : fffffc01ce7a5c00 x4 : 00000000046cde00 x3 : fffffc0000000000
x2 : 0000000000000004 x1 : 0000000000000040 x0 : ffff0046cde7c000

Call trace:
  mte_clear_page_tags+0x14/0x24
  set_huge_pte_at+0x25c/0x280
  hugetlb_change_protection+0x220/0x430
  change_protection+0x5c/0x8c
  mprotect_fixup+0x10c/0x294
  do_mprotect_pkey.constprop.0+0x2e0/0x3d4
  __arm64_sys_mprotect+0x24/0x44
  invoke_syscall+0x50/0x160
  el0_svc_common+0x48/0x144
  do_el0_svc+0x30/0xe0
  el0_svc+0x30/0xf0
  el0t_64_sync_handler+0xc4/0x148
  el0t_64_sync+0x1a4/0x1a8

Soft lockup is not triggered with THP or base page because there is
cond_resched() called for each PMD size.

Although the soft lockup was triggered by MTE, it should be not MTE
specific. The other processing which takes long time in the loop may
trigger soft lockup too.

So add cond_resched() for hugetlb to avoid soft lockup.

Fixes: 8f860591ffb2 ("[PATCH] Enable mprotect on huge pages")
Tested-by: Carl Worth <carl@os.amperecomputing.com>
Reviewed-by: Christoph Lameter (Ampere) <cl@gentwo.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
v2: - Made the subject and commit message less MTE specific and fixed
      the fixes tag.
    - Collected all R-bs and A-bs.

 mm/hugetlb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index cb5c4e79e0b8..fe6606d91b31 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -7242,6 +7242,8 @@ long hugetlb_change_protection(struct vm_area_struct *vma,
 						psize);
 		}
 		spin_unlock(ptl);
+
+		cond_resched();
 	}
 	/*
 	 * Must flush TLB before releasing i_mmap_rwsem: x86's huge_pmd_unshare
-- 
2.47.0


