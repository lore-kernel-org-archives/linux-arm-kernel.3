Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678F4C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 19:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9vSycWbe1YxzBrdH4Qb5Omqz5bKdg1XGkizBFtZ6Uk=; b=gn1eeA3wBry5V4d+zAx5wj/BPF
	rCIY3m5A5bgWpeEJ37LzAYmV/IPjq+ibU9OOk6dMQo9LIUhFB3JNNxJ4NNZ+ILwwLIdmxOhvQkWcI
	WPBdpUizrYGILtBztk5mgvgaIVVKSM4O7+1keDAx82HteG1F14yyMNawtRmUYot3+rN1ZMcq6NXHJ
	UFg8zRVPYfbVntMLoUDE6Pyt7XfbKCXdOM8fpaBLCL58qPzrVcImct69ZqmOc83GbG+AOxSndpef4
	yoVv2ovwTxizi7sYr1ChmSc14hHMTafnvtDLhPSrrZ6bAHhLgK5WU+qwFxaabSs8h1vAMv6SRlrjs
	Ha58WKeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj0Uo-0000000BC2Q-1rUf;
	Mon, 04 Aug 2025 19:05:18 +0000
Received: from mail-mw2nam12on2062d.outbound.protection.outlook.com ([2a01:111:f403:200a::62d] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj0QH-0000000BBhQ-3mea;
	Mon, 04 Aug 2025 19:00:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iBSuxvIX4doIfnqwTHn0zL+3etCwyCGdV1AD5SMbmC59CZSwhGAPuqFgAQRX9f0qPB643u6EMIGjZTOnjJbzqcETFmvNxWA9xl2MlCG7ZF/AXcNLHCXtMJnzcqZdjV9WYVWsGBUPyIWIw8+IAn5mt6HrEZTOZoH2R3I8iZXHKfVPrTCvZVN1tGuVFSH9guTGoQLr9W//4vMS9w5kKH+tpjGkbtmly+6XaTxH7Yig45LMsVRviIqKesUdJF5a00UEXreVV20IHachrIWp62KV5efVRVPzrmmGMjMlJNZhxSww/zRCr4AS59zVHwEOYxXzu1ephZ994tTPn78VXXvHdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9vSycWbe1YxzBrdH4Qb5Omqz5bKdg1XGkizBFtZ6Uk=;
 b=XydlMyImHWAbcJVf1rfCIiS1D2VKMKSAoYFyIHKc8NUzWY83gNbFmGk0q1qQG3SpUH2rf2HgCj0N63d0NX25fGj54T04Wskb7jhlnRhZ78eyktG9smXHSUhMLWEP5i8O81AWnvS9TkL8T66rFQ3dFiquN8oie29M6QQaQqUpxQ/jSl/cGxqVSeqkCQ6aQ26wZd8EWkiu/Gk1pCUD453vcRA+wBiBXtCKWA7ibpsOqWpiORPbjDnEC22/GtY615Ox1XBpuQ1Bc9B6MB9nZTBN+ayCKoP2Hmv22moP01V5Jg9m/56RQYs9dbWUflHffNvXDdRedUWcbT2DJxQlgeC4sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9vSycWbe1YxzBrdH4Qb5Omqz5bKdg1XGkizBFtZ6Uk=;
 b=c87tWqTN/S5nbaPEuY80RCauzDj4RYfzg/aZYc6nemrR9lbht/iA7wRYo3ekna4xjyy/c5TTBFCLiYpGhaYspFTEXpJEGSjSX4tL1Rp6IFS30bRRCUfyvIiQSwT9NEnmqZjFjLn6/l2MIX6G1+6mYHJoGETTgsAZHY1yw7sNpv/acxns0IkqJZHzUt3e4bWQHXy5hJVQEzDVrz4vlbyYcDtC9LacIHIqpeSSserqp4HWwNaJlLqZc9VBpODCtvWNqfcW4FiwGjKTw6lGoktfCy9ULeEFc9rULo3fif9uff91ot2laSCG8QFHapwaUHky3mt8lCVNVmUBjrHZTfrNJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 BN5PR12MB9510.namprd12.prod.outlook.com (2603:10b6:408:2ac::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.20; Mon, 4 Aug 2025 19:00:30 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%6]) with mapi id 15.20.8989.017; Mon, 4 Aug 2025
 19:00:30 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: Juan Yescas <jyescas@google.com>, akash.tyagi@mediatek.com,
 Andrew Morton <akpm@linux-foundation.org>,
 angelogioacchino.delregno@collabora.com, hannes@cmpxchg.org,
 Brendan Jackman <jackmanb@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Linux Memory Management List <linux-mm@kvack.org>, matthias.bgg@gmail.com,
 Michal Hocko <mhocko@suse.com>, Suren Baghdasaryan <surenb@google.com>,
 Vlastimil Babka <vbabka@suse.cz>, wsd_upstream@mediatek.com,
 Kalesh Singh <kaleshsingh@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Isaac Manjarres <isaacmanjarres@google.com>
Subject: Re: [RFC PATCH] mm/page_alloc: Add PCP list for THP CMA
Date: Mon, 04 Aug 2025 15:00:27 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <8A3D2D44-DCE9-48FC-A684-C43006B3912F@nvidia.com>
In-Reply-To: <d395b14a-9a84-4f25-b4f0-45e8500fc5fe@redhat.com>
References: <CAJDx_rgzkZognxWzOXJ-ZxdTtUaM3FT6bmpkwxMz03XiX3fKAQ@mail.gmail.com>
 <d395b14a-9a84-4f25-b4f0-45e8500fc5fe@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1PR13CA0205.namprd13.prod.outlook.com
 (2603:10b6:208:2be::30) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|BN5PR12MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: 017c7657-774f-4cbe-5e7c-08ddd3892eb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UMU2mA0H5igYGj4zTGk2b6MF0Rwif6Zy1JcmudmCE5pnp98EtWkq4Tz7Q4vB?=
 =?us-ascii?Q?1+8AqF3hTj3hD+w+g1PSJiq44nLf2Wzndb2NztQztzI0tAKYAU50w/gKu6Tk?=
 =?us-ascii?Q?MwhvgV2nO1rkHunmowuflE2qohRnt8cWLYidcmCXEabp3R3MjZr8xdsL6mtD?=
 =?us-ascii?Q?cpu5a9xEtOZrsJdbNlvlA7+qQkZCqEJtoTyndKfFXBO6T2PFu9RMnBrgYEkz?=
 =?us-ascii?Q?Z1B4qec1J1SInvra7nOXEBKeuUXghiIC4U/LRG81o/yuvbclF79AFCAvMsg8?=
 =?us-ascii?Q?CGf0k+yn8CTVEsgBrF9QJ/ynBtEKrhHaStiIZHW1aQGNzDMNwi72a1waSbII?=
 =?us-ascii?Q?Ec12AJY4Vu3B8rEDFHVIxviU2VMFzSEY0J4QiLTkD1WYDXxtIpHK54+EWfD8?=
 =?us-ascii?Q?KB0ZgFgAwZECPqRNsuFeRm9a3frWmBXoqNvq2pRjiQ0ht0WDvORlG3uFVh6b?=
 =?us-ascii?Q?5E3V3zd5+81sx3gVazsrdWRuP+OvkKjRZWhcSlAEOpIwH9kZAbUaYuUh+cmr?=
 =?us-ascii?Q?Mo5XkUHLBrlm3htXLImcERcS7B7fuLqEV1Zj66CRX+3XICe0hheBZDv5RDF6?=
 =?us-ascii?Q?lYlitKH3MMG/S0XKLfD0HIRw6rSFs4JI5DKgQU2/n2cOnY+0LOFpco2DRM7h?=
 =?us-ascii?Q?3XbYFxdS3z/g8eAx/RtquUOVuV0oImpC3474O9HijSznL12/EswABg4R1tGu?=
 =?us-ascii?Q?1PKTO5RSQBM4ZrTtx1MUeyMVYC+HOBBIRIC5LEZkS0YO4DddKJmhqDYcjvIY?=
 =?us-ascii?Q?UCAZulJN1+2nukwXHprij3TmMi7oz1b1A3fxG8MfYfAMG+em7+kofeyVNruw?=
 =?us-ascii?Q?ldx2XNNG572lbWRFYsQJgIHJ3HJ3SCjJI6Td+XMm3YAGTKd4iwhw7m4bMCgm?=
 =?us-ascii?Q?Vh2ro9ga/72FQdT6Qwz2gQf+pTsdgUj472C1r9oMzomDHsodCU68aeEmGzUy?=
 =?us-ascii?Q?Us9y1MOdGdO07kGiATYGQwJZSxHz3UzF09eaI0W1ZUjN/XsYHFnm8zd7Ozl/?=
 =?us-ascii?Q?fJtRwlTrNeSIobfRYleQVmV8E3GI++/ciIcvkiQB0WrRFsaG57yBn+dWJl+v?=
 =?us-ascii?Q?/0w7s5I/OEoyXPe1JqsjNc/Fj8M277vMpmFuf5BBGIk0J/N903/JpDJm5TCO?=
 =?us-ascii?Q?QWfjjfmxHg7UmnO0ItmfDU5cio630CVqG8zAcMjpv+hi/nXVw8Ihe69iKcTM?=
 =?us-ascii?Q?AyBNsQwPE+Sq/cT7ES6LjC0J0wlAJApiahARGSpmk2JEfUoYv5Q8ehoklmqq?=
 =?us-ascii?Q?IXUPLY1pLN6s41Dp7J7lxFoKxPkkAG9rxV0gMoyip5D5BmpaPkhzTUZHIYPH?=
 =?us-ascii?Q?d39B0o7bpsoPiP8UwMDgxndm3ojgbUAxB02j+q35Lgr9Tl+VQdfknP6CkLw6?=
 =?us-ascii?Q?+TULtHU3pneWdnCqL+URg68KzXlmqC7xVG5RoHOGNOR9YW+TCXKRLIrXxyWw?=
 =?us-ascii?Q?dhTmpYgt6L8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gLjVPctGu/FbVtsGURHarDkWHQXnkxpSMs9H76U9CO7lctLgT81gqsOn/t7g?=
 =?us-ascii?Q?C8rNLWiaA8lFRNXqEs3usy2b+svOOu/wqN8myM+mdgXHfZZrHSO2L5eTsjg0?=
 =?us-ascii?Q?BupvohYqBDyNNaCBwRWrzP2W2qof5uIBdtUASkqdIfxe3Ae/mNDy7oczyAii?=
 =?us-ascii?Q?xfYEjFe5mx/tHvLg0HjNx4HhJTr2mV6b9h/3ky0uTgHDeX5fsJgGlWWWJQpl?=
 =?us-ascii?Q?4e3IA4zj2PwXzsnHbHK5GvP/0KTQjimwHCSefZ0KK/SDJShctERFwsXCPXzp?=
 =?us-ascii?Q?PHVpb7uxJbQKg9OG59JJzhA9PWDiV+TOjLM7Vk/QEdsjoPNBfzdOX6UUc440?=
 =?us-ascii?Q?0CuUc1bCkN4kuOFtXtGuLevOaTYMRCMLkX7z1EbhzLp+Hb4wRQHIAMccbEI2?=
 =?us-ascii?Q?Vp0+MD0Mvl8ZPk5Kjm9okfhe7Upb83SPEw/eTtzDG/RFfFLptKi9UHxAALEJ?=
 =?us-ascii?Q?JLmC43tWZS40w3t71RBLALigGTQ7PZQuiQQqO5cdWyt+FsGxQurhVw8asFq8?=
 =?us-ascii?Q?ijaQGPsZtBjPso2FjAHpx0zP4svAt2F37fAnv/EF/I4/wDQWgnFvNk/VWO7m?=
 =?us-ascii?Q?44wTIj7YcUd3jh8tvUc5AHxwD1qJyAu3EwvfpLdWwVa03Ne4dKUV3i17LFk6?=
 =?us-ascii?Q?iD2j24lCglMqa/TvMBgDB8hhbi5yWPXjYSVrbjMmuqx5Q3vXdJvjSleMXRdp?=
 =?us-ascii?Q?WujmYXZ/8tTRe5Zi1gGjObvckXTfAdQNL/Y4YQj++7prbFiLMNcYaBeG4Nao?=
 =?us-ascii?Q?nyndDPqjgX4T1WuQbbdRLmKtQYi6/7lSLDGIa8fKadFTLyaSDrwWGwEyhexn?=
 =?us-ascii?Q?Fd/1JkqZVHQIQZjN71kWrOt3EFTIeatuLyPnRTDIYf+UfunAC6lMyfxQAbso?=
 =?us-ascii?Q?v+PK0hLc3hjHisu3Th3z7R51WozhMuCqXGA9D/Omr54JIDMLcQm3XOaYUvLs?=
 =?us-ascii?Q?FFYYTaTBOIAFoiKDdpK1mMorAGxZvgIp+OUizTsfUkYuQUeCwExxKKp3GgS4?=
 =?us-ascii?Q?OUDxejLgD84exA74DUNR/l5iJZL5PkKyqjalwimZziqNpQXKhgFFOUeckQNF?=
 =?us-ascii?Q?35CRwKoGLKPtCh1HGpO5BhhoHvMsbCX8WmjWQtlsMCkqfKImJnd3UcL4of7N?=
 =?us-ascii?Q?qxZPcD7wjGmJp+Jer8gcF4maQ58Jzy4sIgLtmwRSzQVZAQd3WudKnxD02XFt?=
 =?us-ascii?Q?GneVBtsrE6ioIjLYMjin1umTpsRumjXkaX06lJJQOfpud78OdPHphWhhGZ2t?=
 =?us-ascii?Q?UYwzIZre2wj0P840GmJeczXgkaJ4tNoKlgqYypNln9pjt94LBNlKJFufgaW4?=
 =?us-ascii?Q?aDULGiBDqnugBH9GYbfGXGp0icfN4VHW3AE9SQYCzf1tSz4wftfujr6GwZyg?=
 =?us-ascii?Q?IQkHG6lpQhbZiPUhG21evqEGoBXyFAqCtkgVRKei1Mxy19uzA8cxFuxwrpH/?=
 =?us-ascii?Q?vI//sA4QYgklXiDGXF/NZALhtGcoq3lHXX1kO/3yFKBqoMUaVrvbPJuJGHZl?=
 =?us-ascii?Q?SqxgT70ioccWVTx/A5tpA6usPirfZiSf9HZVa9ZPZWtQ8/JOmfYFh0xUPhHI?=
 =?us-ascii?Q?+cimEz8KWQLVP5gWMOBF5cETtffEOdAQpNgbyKIA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 017c7657-774f-4cbe-5e7c-08ddd3892eb8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 19:00:30.5429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/l+Q1aN4rqh1Qsi+ktmAxktc4d9J9XhyevUww2sxPLZxXnZr8vngIdXtL53fpTp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9510
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_120037_943409_E4BBD165 
X-CRM114-Status: GOOD (  17.34  )
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

On 4 Aug 2025, at 14:49, David Hildenbrand wrote:

> On 04.08.25 20:20, Juan Yescas wrote:
>> Hi David/Zi,
>>
>> Is there any reason why the MIGRATE_CMA pages are not in the PCP lists=
?
>>
>> There are many devices that need fast allocation of MIGRATE_CMA pages,=

>> and they have to get them from the buddy allocator, which is a bit
>> slower in comparison to the PCP lists.
>>
>> We also have cases where the MIGRATE_CMA memory requirements are big.
>> For example, GPUs need MIGRATE_CMA memory in the ranges of 30MiB to 50=
0MiBs.
>> These cases would benefit if we have THPs for CMAs.
>>
>> Could we add the support for MIGRATE_CMA pages on the PCP and THP list=
s?
>
> Remember how CMA memory is used:
>
> The owner allocates it through cma_alloc() and friends, where the CMA a=
llocator will try allocating *specific physical memory regions* using all=
oc_contig_range(). It doesn't just go ahead and pick a random CMA page fr=
om the buddy (or PCP) lists. Doesn't work (just imagine having different =
CMA areas etc).

Yeah, unless some code is relying on gfp_to_alloc_flags_cma() to get ALLO=
C_CMA
to try to get CMA pages from buddy.

>
> Anybody else is free to use CMA pages for MOVABLE allocations. So we tr=
eat them as being MOVABLE on the PCP.
>
> Having a separate CMA PCP list doesn't solve or speedup anything, reall=
y.

It can be slower when small CMA pages are on PCP lists and large CMA page=
s
cannot be allocated, one needs to drain PCP lists. This assumes the code =
is
trying to get CMA pages from buddy, which is not how CMA memory is design=
ed
to be used like David mentioned above.

>
> I still have no clue what this patch here tried to solve: it doesn't ma=
ke any sense.


Best Regards,
Yan, Zi

