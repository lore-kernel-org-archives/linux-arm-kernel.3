Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0DAFB5E8B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 00:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zZfIgMbeUAyXyAGudgEwXImWafVjINen6NKx1XkgRI=; b=rmdDLywvf7+nX/bZjDsmX4QPHm
	dge6ZHT7eoGxuErpQ4x5FVE+zoaienW6KdLddWOqFH5N9PrTJh46jV1tF1ElQaTMJWsz6YfQHnEsC
	OwQI0hDFjL2ffWvB8eSj7e7ZriTJoMZ6Pkmyx6remICplifcl0gdhZmFnoFMKq3bg7HrJGe4TM+UJ
	Afq2hm9kQy69HU9PdI4G2WLLCS7Zj6s1AYMNrjOBlkZwRvZV73HWHmRk7j1hLYsCTSpFN70WUUIt+
	iiXym6bsEiAKQE2as47+RYil99iGe6NyqFUpmZxsjE5HzSwlhZ0D18Yxe4FzQAMYNuJYahpqR1brf
	efGodI3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2IFL-000000058Km-00bx;
	Tue, 17 Mar 2026 00:25:19 +0000
Received: from mail-eastus2azon11020079.outbound.protection.outlook.com ([52.101.56.79] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2IFI-000000058KO-1cyO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 00:25:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSDz4MTyxPeParvZvE3YPAU9B8xnTFCrdnxVqZWwh3wpFnra18z6sgXIRQkMG1ogVnUX2Pm0DzPyu4ZXiMgSJZy8U80J/9XWYDLFM96YtLxKiWi4Id4stFnIKOCOK0Z4La0XtKZrT8od5KHqgH3jwxHHRH9MPlwr2VHR0MpfCK0pWUwbohhXanul1aulfYF4eLG5qHEfmRE8Jv1SjhzRRsDtZt400wXrCJr8Qh+L7ia7+aP/KG6Pvzw8BD7oWjYkCK61ByGVT2NvPXR8065mZ1ge/J6F+ApzUp1RL6C+pKiGJDxwmU8aX3/CyZ+yNvumizAf6tgA/vIjB+DTsx5Esw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zZfIgMbeUAyXyAGudgEwXImWafVjINen6NKx1XkgRI=;
 b=fQK/hW3Eu8Gn9RO0IIat289VDpxDzwmLRgXlPBhVPtynA0yvpb1oUExbxAvQuXMJP9/dMsKLpLeC2LRia+KQKoCCmr6y6GP00IBeplN6WoFxDCxGU6zd4LtHBSd+hKMti78PEFt0vY6xdG5zHFGBEnexrK3cQqg1WpBhYlmjGkbE5ImZoFTJhVznfpsvwdu6i4ngo3WTxeMCPGem+YLlgCZPbzS+ElgwABGBJDcCcCtvaeA3/G8nClYy6h/8ZuqP3g1uR7JQjIxdGin+3PdqbZcHHwgcFzXd86R6I3QjiXdasXlRyuMLvSgBPWbaAGIZzrZAvJahDWV6k751LDzzSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zZfIgMbeUAyXyAGudgEwXImWafVjINen6NKx1XkgRI=;
 b=YivAd6nwsYtqnI8jzkWwq4eqASuVzSjQ1hzg/ra8oo6JyPHH9aR6XMA76MzWMBsIwZr13uYLRQw5posPjNuQtryjkwCFBX989RxP+Yiy8XqRLfACymhLA5zsEOukGdC5W+MKXPTnQy2RRRDiAkxViTAgM91wPc0gyRyMVrfKzVo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DSWPR01MB994496.prod.exchangelabs.com (2603:10b6:8:35f::23) by
 CO1PR01MB9084.prod.exchangelabs.com (2603:10b6:303:271::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.24; Tue, 17 Mar 2026 00:24:41 +0000
Received: from DSWPR01MB994496.prod.exchangelabs.com
 ([fe80::893b:904a:d102:9f95]) by DSWPR01MB994496.prod.exchangelabs.com
 ([fe80::893b:904a:d102:9f95%7]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 00:24:58 +0000
Message-ID: <a8d31059-f821-48ac-b6bb-7e8d38fac7b6@os.amperecomputing.com>
Date: Mon, 16 Mar 2026 17:25:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/40] arm_mpam: Add KVM/arm64 and resctrl glue code
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org
References: <20260313144617.3420416-1-ben.horgan@arm.com>
Content-Language: en-US
From: Jesse Chick <jessechick@os.amperecomputing.com>
In-Reply-To: <20260313144617.3420416-1-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::33) To DSWPR01MB994496.prod.exchangelabs.com
 (2603:10b6:8:35f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSWPR01MB994496:EE_|CO1PR01MB9084:EE_
X-MS-Office365-Filtering-Correlation-Id: 3687e2d0-0f6a-4a75-071a-08de83bb9f0e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|56012099003|18002099003|22082099003|55112099003;
X-Microsoft-Antispam-Message-Info: 01z9w3u/q8oett/qSj3fm5KPhjk3V2VQ29c4gpGGvHCp529c06VShsaX9GXl7KrFqcNzk1JKZDDcWDQT6NeNrG5Zd67/BL77Tms9QdEpZATXT5nYXqH6j/sGS2+hpbcnEPjR/UM+jhNZiGc3eTTMSFIzz+mzUZ6OEhlCQEY9MdzyhjWbJw9KtdFe7ZS/9+zE9et83TJI0VfikKEHBj6dGuonSRVoBwkeES8AZ/Wgeyksz1WHtPXpFvyfsPZbs4M7s/a6SLBAPZa/uZdbFQxFZTz3f6mXF58sQ+RGA4usFR9pz7JLMJJqc4Qjc9wfLWv1sQYGFSVXaAr/lUpBwHfvbOzeuL82ao3SYjZOdJEFDUDtg7SU4LREubBZN2YZjhYdCl78OR6Dp0W2VwRBrE7NVkgxK1Z0cVnEIVcsGUrY7A1EvgoVCGHW8MA6EW9JNWuKcrFe3ZiLjjzQiNV8U8noCnIuUKumb50m/5D3sSTVgGNHx54RQVbjjQ/LcqvxLiPB+yLWUnFTB1wcYXAnGDBh/hWFMTAtXWK0ST5LCHQJFSjg6R6yIU+IErsGpTPd21GN4POL78HNH14/xG9lobgzx7pYKrW/HvDbSEzCL1Yeq/h8suur5FUrTlkc8s/nZ42GKfEYbW4B/ipvfyN0UTFUqxm6j0IgtcdiLgXfXR+GyHGN8UWQhap0rk8P53qZZxKP2Z+QOAw2wB314okU4uGMEPHERqpbj+p2IG6yaik48Y8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSWPR01MB994496.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2k1T0d5WjA0SURxTEoyakRXVHlzTHRTM09Oakh6Q1pyR2xnUnc1cXIycGhI?=
 =?utf-8?B?aUwrUnlrcHBiNmI3c2ZTYWZURXRoaVFVcTBjQTREMWVNK3dhL01VTXRVODEr?=
 =?utf-8?B?Kzh4dTFFRXphSHk5ODhGRzlNdXpvZ1ZDSnRFYlpHNzB6ejFjZW04V1VkRHoy?=
 =?utf-8?B?OCs5Y1B3TEc4bjBTcWxXbkVFaGpQTjh5b25hd0RGRzIzT20zVE9SNEtGbUt3?=
 =?utf-8?B?K1E5YjkyT3B2L1hxSFBpekNjdU03NHVJYXJBMTlnenJVT05YZFpBNUdkejFy?=
 =?utf-8?B?RDZoZ0NOMnJpamtPNVkxUFd2bGZXK2lxNm5YblJyN1VDc2FwcWhkZGszNUtr?=
 =?utf-8?B?cVRxQXJCYk9QS2NNM1FHUXk5MEpySWs3enphWFAwcUtFK09QUHgwSXJDZCtt?=
 =?utf-8?B?ZWZWZzVWdVpWUjZEdXNESVZ6bm4vajVzMkVEWk1FTFZSN0J1SHBzUjQ4Q0xL?=
 =?utf-8?B?VGovZTdsMmNXNnROVjJvcGFtRlpDdE13dTNSc2FMRTRuUlJWd0VLcXFmMXgw?=
 =?utf-8?B?b3BtWHBlZHFlczYrK0kvVVp4bnk2T2h1VENzMmhCRTdGTTlMckdHZkFNMUc0?=
 =?utf-8?B?VGdXeC9ZWEJyLzE2dHVsdE1wazFGR2dwQXc2bHFTdHcvQkc0S01yT20waVlZ?=
 =?utf-8?B?d3E1T3FuNXkyTTVKb1piQ082WFhyL2k1TVZhS3ZWY0V3WE9yRWpaRWhtaVgr?=
 =?utf-8?B?dmdCVktyLzlFNU9hWnAzZ1owcGFWaUJtdk14ZUNtRyt5Z0dGWndocmpJbElS?=
 =?utf-8?B?bEZPRktoNGxvL3JFcEpmcjNCTGFCeHU3WTI5R0NnZ3NINVFBOTFHeTQvTTd6?=
 =?utf-8?B?TG55OE5wRE1SYlY5MC8wZ3g2Mk9VWEJUakdUYVJvd3ZGV1NQdUhKTGpNTmUr?=
 =?utf-8?B?Z1F2MHpReFNaNHNoYzJLenl1ZEdGNzJkcWwrVkttakJEdkwrdVVoRHFSWENG?=
 =?utf-8?B?Kzk1eXFLSU8wem1nNld0emhYUXdjRXRsNW5uWXF3NzBPbE9uckRXT0xTLzI1?=
 =?utf-8?B?N1c3U2srQUR1L1F2SXpPYko5dWJBbXZ4MitWS0FmUUQ5ekVRZUhiLzVNMEJx?=
 =?utf-8?B?MG1FTGtEMnByU0pJZG5YTktqM2ZoUmMwYmlFb3lsQ0dwNnh5NmRyVXlScm5z?=
 =?utf-8?B?cXFHcjdQWUliVkZ1c2xjUU9ZbG9EVHZYaG12RU1NcjFNUUNldG1DZU9FNEFp?=
 =?utf-8?B?ak1rTklhaktVdEVxUnNzZGtEbE1rdWx6c3R6N0RJVkFaVkpPVi90d295UFhs?=
 =?utf-8?B?MlJVa1psdytaOUg1d2RLNHB3bUdxZFByVGhiQ2hEL1ZGTGtXMDJwYnFBZlZG?=
 =?utf-8?B?SW5iOG9iekdRc3NxWWtmR3BXemFYVTNHSk95b1FVRU9sNkhaRjVhTDRHcDlD?=
 =?utf-8?B?bGFLVHFUWVJYWWpGZzFVZ1FKOHBCWnVPNFpuWnVUYnA2bW1BSGVrcmphcE1i?=
 =?utf-8?B?TWticU9UL29kanRDbm85c0padTZuNXZSUW9zcHBBL2pKc0dwU2YvZFFvWmFN?=
 =?utf-8?B?OU9TSXBKZG5DeGRWWDVZUFF5UlFTYU9RejRJVG5hQkNnaFZ0L2lVZ256QXU1?=
 =?utf-8?B?UDViTnF6YTVsbThIY0duOWhWTlcwcFR2bG84MUNkbmtjV2NFZ0FibTJKTVBi?=
 =?utf-8?B?aVNHZDMzTFBRQ0IxUC9yNElZMkU3bk43YzY2MWlmOWNsdGtFWTRMMjRlZld0?=
 =?utf-8?B?bC9LU2ZYWk5JbURSMC9EWEhld1J6NkdQcFFtc2tGUnlUMmxwZTRFOFUwc25M?=
 =?utf-8?B?Sk0vRXRoMnJkTlpCTmVGbVNjd2doU3d4SXN1aExpWGpPS0JNcHh6YmJMNUVU?=
 =?utf-8?B?T1VtbDMwQTJXczQzbmZoOFpQUTg5K1ltNDA2b3NJRzhTdXFZQ3ZadkRlY2dt?=
 =?utf-8?B?Z05CWWl6STQvOHdXODZ0S3J6eFZFSzBQNWpvRVdJNHRFb3BiU21QUlhteVJR?=
 =?utf-8?B?ZXJlZ0l2NEg5VHVjUnhIN1grNzl5ajdKR0NtWDJWSEhWamdla3ZtLzRlcVdH?=
 =?utf-8?B?TVdwUUE0K0dSYU80NGI2Ym1sUVpyZG5DT3N0VFdzem4xVHFkTUhRYXhpZEhy?=
 =?utf-8?B?TzVHaTlBZWcxWjlFTytBbEdBYW1PclUycTJlWVh3Yk1SMzdUMGhESjc5b3lh?=
 =?utf-8?B?NGZHR0J6QzVDbi9LZUZPa29Zb0NtbytwOXJuaEpKNm9kU1ZrQmRQVDBFUHli?=
 =?utf-8?B?RW13OUZ6OVlBakQ4MnBpR1F1ZzltTzFibFl4NUJCaEx5cGJjSmdSUTB2cmky?=
 =?utf-8?B?eHUvc3ZTcG1rQlJLZ1ZKeTFPdUIybVZwOG8ycm1GRkZoL1FBYlNyS1FvejUw?=
 =?utf-8?B?eXhNR0FDc1U0aENxY3VhcXZRaUM4ZkZJOWxralV2UjJSRERmcGJtN3pNc0ly?=
 =?utf-8?Q?/4Q8BJKAzDiEzUK92g2qOBPVK6OuHez7oCUKj?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3687e2d0-0f6a-4a75-071a-08de83bb9f0e
X-MS-Exchange-CrossTenant-AuthSource: DSWPR01MB994496.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 00:24:58.4603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9xPJCLN+D1vEBbyvZKtKiT/9rzl1y+WgzdZPJDDfS8n+djt+0Vr2zJasshdUvExWnlwJHgrPVwjxZv0+dqueUjRs6j3/5q6BKQXLnRiNN2lCi3gbrg0xFH7Qvl77PgdG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB9084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_172516_442225_99CBB91D 
X-CRM114-Status: GOOD (  11.30  )
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

Hi Ben,


> Thanks for all the reviewing and testing so far. Just a bit more to get this
> over the line.


I tested this patch series, specifically L3 CPOR, on an Ampere
implementation with common benchmarking tools (lmbench, multichase).


> Generally the resctrl glue code works by picking what MPAM features it can expose
> from the MPAM drive, then configuring the structs that back the resctrl helpers.
> If your platform is sufficiently Xeon shaped, you should be able to get L2/L3 CPOR
> bitmaps exposed via resctrl. CSU counters work if they are on/after the L3. MBWU
> counters are considerably more hairy, and depend on hueristics around the topology,
> and a bunch of stuff trying to emulate ABMC.


The observed latency in increasingly large R/W operations scaled as
expected across various numbers of competing processes and cache
portions. The distinct jumps in latency as successive cache level
capacities were exceeded indicates that (a) L3 CPOR is configurable from
user space via the resctrl interface as described in this series and (b)
that the feature itself is working correctly.

For the series:

Tested-by: Jesse Chick <jessechick@os.amperecomputing.com>

Thanks,
Jesse

