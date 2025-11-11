Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97060CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 00:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uF2hcnTqSMK4xCirsgBkUxl/Z86vnLwL+NwUvRk5hRw=; b=xxdMJRjFdVkGQFSKnNc6v8G/8K
	pVfLHZnNM+7NzqM1UMWa+lGLD+ZHXOZFDVIdwOEzlxvOOfhSX8iXCI3ONE5BsIlVfypTZiqxcwi+K
	/ErH6DFZUB1RzsJKP7ips7FYMCRLdrUtNNg2khw2ft+HlaBbYM8pIPD4CLVgGgifq3sUWFlvpdTJr
	m9gD5jBc1ACcbHOBK5XMtzFSZvoel67OpWvZ8eKG67CMYQivZFg+qzjC+16Ks92pa9SQsa/Cm3as3
	YZdq+GDqHJ+C6zq9lMaEqdfPozEAvtK/7EyTOPhN9+m1E1Hw2PGgbTIkFo60wHJh4cJRANtcaA4HB
	o7+OiUxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIcW0-00000006IxA-3ECl;
	Tue, 11 Nov 2025 00:45:44 +0000
Received: from mail-southcentralusazon11023082.outbound.protection.outlook.com ([40.93.196.82] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIcVx-00000006Iwk-2gPj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 00:45:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OeQ0UkB2xzMAm315szGjS+VPFqjVt+CX7IwH6qChksclV9BljW3rGACIoX1EbG3dA0PdDSMi6+RtnRYoxWrBc47J2mpT6HS1nvJyC30aAaCNtVtf2zFJ0wkMhfM7RdNHiu89BHIwvj9WrSKNxV/XJ7xNL+3i6tRAKkDyKothPZ2uuHEQdq9TEsiYK/4+nb26v6RS0dLgmuXZ1/EHGFC4VJtTgafxwXp5+EeheQlI6bill4sXpdAP31Qi4Y/mhozM4dmJxcKegIdHvB8VnpoTIe2xcewRxvtMqGowBlsNTKQepIFy2AjfR4vq/4EftfUTsUJOtxXmKerMNtnon4VGnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uF2hcnTqSMK4xCirsgBkUxl/Z86vnLwL+NwUvRk5hRw=;
 b=t7mLD81vgBEY+zE8HMWTGznxkdRB6Ili+JWXA1CMku5Grvn+L7byH4Edppgon+iObNn/Ct+u5fPNvnxkTM87Ak2FJpYdibRjA589dV9wkPjHH3Z5GCoVsHVQGOSu7ojiMrztrdk39YaS2qSku410f+zYKjM9ZS3Va2TGLHDKRr401gDTUndy08CMV/soMXOLZ295XpM2vV/U5zL5wOwMha8E9emBA/1jle/menvuErzQXNJYciuX6+O2XOkWixlFBczyaH4DuNqgK9kPIobroAOGQDQIwWF8JskO2SrYrfrudNN2gali+k0qpBGm/bVaROV7BM5vCJ5UtHZ8c5xgww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uF2hcnTqSMK4xCirsgBkUxl/Z86vnLwL+NwUvRk5hRw=;
 b=N5tV/GP150KSU+Mh/Ez0hTFyk7tNNtPJnVFeqvQ8LGqugkQxfgdnxvcAWeonG4KwPRP9FoFZ1P7sw2ofUtR2Kjr9YB9ZpZz3yzrMyTTfDWYiDa1PfrCcyG0UyTLLvp6kRinbUaAKqMlW7Awv4Niy8fSsMLP43Md30sUS4/kUhIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BN0PR01MB6862.prod.exchangelabs.com (2603:10b6:408:161::11) by
 DM8PR01MB6935.prod.exchangelabs.com (2603:10b6:8:14::17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Tue, 11 Nov 2025 00:45:35 +0000
Received: from BN0PR01MB6862.prod.exchangelabs.com
 ([fe80::8a1e:34a8:2ad9:7f83]) by BN0PR01MB6862.prod.exchangelabs.com
 ([fe80::8a1e:34a8:2ad9:7f83%2]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 00:45:35 +0000
From: Carl Worth <carl@os.amperecomputing.com>
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 catalin.marinas@arm.com, dakr@kernel.org, dave.martin@arm.com,
 david@redhat.com, dfustini@baylibre.com, fenghuay@nvidia.com,
 gregkh@linuxfoundation.org, gshan@redhat.com, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 sudeep.holla@arm.com, tan.shaopeng@fujitsu.com, will@kernel.org,
 xhao@linux.alibaba.com
Subject: Re: [PATCH 00/33] arm_mpam: Add basic mpam driver
In-Reply-To: <3db645f5-b0bf-44a0-9cdc-460e46ec7bc2@arm.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <87y0ohbf7e.fsf@rasp.cworth.amperemail.amperecomputing.com>
 <3db645f5-b0bf-44a0-9cdc-460e46ec7bc2@arm.com>
Date: Mon, 10 Nov 2025 16:45:31 -0800
Message-ID: <87seelbdn8.fsf@rasp.cworth.amperemail.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0049.namprd03.prod.outlook.com
 (2603:10b6:303:8e::24) To BN0PR01MB6862.prod.exchangelabs.com
 (2603:10b6:408:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR01MB6862:EE_|DM8PR01MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c286177-9183-4701-4838-08de20bb9ff3
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9MUON9z3lnph4u4axMrkF1GAyb/I6LVM4qgwaBAjwhKU/QIU7hTHY9rzdoSh?=
 =?us-ascii?Q?cmY44SRTzaaA6TvW+2YBgsYJl5YHAZ12laOPS9VF6wLfp1y0SCVVOOSU5pr1?=
 =?us-ascii?Q?Wa1ywGaXjfxqUM8CK9HNoRa1dzZoHwPRrfN4WmuQHqDii9KeGzQYB7iBLvpC?=
 =?us-ascii?Q?KIrTTFaBYl1KlyebHKELzb95mw8TvY7lpShD6NyGioMIjYJ8hpnyRo2WnQiC?=
 =?us-ascii?Q?tTYHu8dSMcyQiYjfiKKWF95LZUBq3ALpB1L+QfWPdiwwQ5GgWUuXWgqzA6XC?=
 =?us-ascii?Q?qhaCgNjqTdhOZ52DXxglPfvrGJcSQw0qTg8akndFJ5vpadcpz1TT3lp8azQ4?=
 =?us-ascii?Q?bUERbIQRIw3bj3VXE4hI33rVHspgWgPMmdpH9zfj3h+C/qqQJrjXKupLxhJy?=
 =?us-ascii?Q?nAo8WyFoPW/MMEDrcxGsMsHSoAWUjN2OVm72I87qq03oRZ/kZYZN1THEQ1Ol?=
 =?us-ascii?Q?Am4i2K3KgPtnhgl2z9S0NA5IncVc/wMmb+dW+2YamCRUqO39m/9CD2a0zpq0?=
 =?us-ascii?Q?bDd16JukhGKalpH19HfHdqJ9L2daXSnBf3j282AvD49CEvHgdxbwYvkXW2Km?=
 =?us-ascii?Q?+wkJbcjvRZgYO/oRbDUOsPLZr8dDQVez9VkjXUFPhC6FqxJfvQnlU9ibOKQy?=
 =?us-ascii?Q?gvUr1QbCjSL+sDOz8egJ8nfqxzI9Fbd7nIHr1O1Txm5RUPiVFgi6wBqLMBVM?=
 =?us-ascii?Q?EL1Ubt6yDtPBHw2dVx2cWwbeqWUKJ9chgfT1EjX5BIcYHN88ddNQWa+wkLPf?=
 =?us-ascii?Q?ByAHAgZVNKvpcjICFVwvCZw4NjSikTfolGSfSBahWnoDlZpCPROxu8F87wJy?=
 =?us-ascii?Q?Pt7OZNsAP97Ti0ypAYXSDgLfi3K3l+dvOj/9oeLjmD90ZcCCjr8CAaSs9ZNm?=
 =?us-ascii?Q?t1jCUV08IGNXwAMDkRI6jS70gM1TkRHZNhxRlcoDaxG5O9gE4ZNQWgSH/7DZ?=
 =?us-ascii?Q?lmA3j+uuFSMhDsXyp9WW6H5uGjtzJZ0Rqezl+fX6LK9zMHBxdwsd89fLs7M+?=
 =?us-ascii?Q?GNbckdgZb2/dgDUeICMXycGDA3nU5xUBAia/16ADD4+l2pYsAsNo5qyEmtH3?=
 =?us-ascii?Q?UCd30RNPvB7uWdO/uRlcaXVuyFLfZjxW1G5DmpUgsEr/swaM2koNHwBP9PCk?=
 =?us-ascii?Q?1FMyeVInGZ2X6jsQHehgBvOkPrH0WwL0d46WFjLeE+r2PW+upy/vK23c4B4r?=
 =?us-ascii?Q?UwiInAANWLWK/3Uzn//ciHrtPmzBU0qFU3XoEmx8TMkQ0BC1I1CO6LJtJCzT?=
 =?us-ascii?Q?kh9tGK/G1m08P9YPJx4uAE+noNmnA9epQC+VPG8TIOHmte8JC/Gt62dPDbdb?=
 =?us-ascii?Q?EFYCNt8MWPiNNNLT2w/o5rZjbHk4nRVhnvovZJIQ9YVIp/lx8XGwqu2eh2QU?=
 =?us-ascii?Q?fYAS3COS06v5pZKSq4ACzSE5Xu4Tw3nnNuJ35fOBI4ICuAfwp8SZMxlOOBA/?=
 =?us-ascii?Q?eW3ixJCC7oc2PsNqe5MEt9gEy/kgi6ZKqrqgo++9rt4MuSmEA7g364N8px9O?=
 =?us-ascii?Q?OXn+kglX8HooT+3ZjrWfa5lRuspNeLt2oAe8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR01MB6862.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PMD1cOOhZRK6VQ6AiPmCEUxiqUeFKvtSK03jhEuNdL52QTBf4fAn28l74EeW?=
 =?us-ascii?Q?CzjHnbhzUy6caAjzvtJX1jJfnCkwXJuyns/L4z2+gDl+cBZGgf4OAvQJt2+X?=
 =?us-ascii?Q?vDWKwFVi3la3sjUpkkQTUeV54SompEIWiK2KtTGCbn1BlAk6XuEMiiZzxdmz?=
 =?us-ascii?Q?2o99QMFFE64Eh3MN4ePPuTcDi/PFDaDv9r6XN6Opv5IH0ph6a9fEaebYoR+/?=
 =?us-ascii?Q?b+hOz73cxaqlW2LGLKJJUGSsYH8oUdtHP+10kOr93RWSLkguu+VkwYF6Kmwb?=
 =?us-ascii?Q?J1rm/JMEs3fqnxeydS0mxgePhZTIyHT+v0K61iVIX+8mMF3Wa7ATKMCqWCbS?=
 =?us-ascii?Q?CO2Ckn4QDpsczSZ4AqYLWEVzUyXz516ygSHeE3YMReuNO6Y/XK9ImfRquYol?=
 =?us-ascii?Q?QccidAYJ5in6vD/g/HBXEi15J9k09m/2fbuBkpQTX/+61I5IFemKtt4DNU45?=
 =?us-ascii?Q?ApHoYq5zAMkG7fUH1AUfntL4maTqMbzdqkYfBBfGMWxlImfy+IjmmPai1/ID?=
 =?us-ascii?Q?r21ITM0G3cVUJiwZEaInUfxG4bnuOYulXBL4UnvcxCtUFxfthXcNHtrcwSXT?=
 =?us-ascii?Q?zK+lhCJOxCrJKc9A/Rfrka022Pbd1TnmSx4xYMt4+P73jU2W/CpQisiw8ZKa?=
 =?us-ascii?Q?ABrpW/khO2G6w8zfRjZ9wdmgxKj+mSKig0BMFpNy2zkJpGT0dKFEeH2vuTqf?=
 =?us-ascii?Q?PbikE9B4ltEQNXxRaI7aXoFgq13plp2c/NQM4MZ41/+xlGIFA8V6RmUJ7kON?=
 =?us-ascii?Q?ZPN6DGRzzsBScgmqd1LWNrc9EbKw35Yb887gIeczKHeBwyqyvgL4yH5PUfhd?=
 =?us-ascii?Q?o9I25qNvaIJmJZ2Lz55Q+DlYmAhPX0qDGE02JotBhRoG6GHqrwFb27LxFgN9?=
 =?us-ascii?Q?Y/5MYPr3wL3jGRRnIYwggQfP2e/bOrPhV6ekBkJLVweKz1k4sXVAxW+kEkRK?=
 =?us-ascii?Q?5vMPujWmN1JglOv6gvQsNq148bUP2DdJWYfZjBH7UtXJJKw8YIdS1VFIrieb?=
 =?us-ascii?Q?ogw4TCbg8t6OxcozPUvo2Btg3NrXI94ytshFDdB44O6OG0+2TIL+BPEdjWHR?=
 =?us-ascii?Q?ueU4QtQNpnmZE4TS3/Yel4ctCr4vx2G4RAckIy+EVmC9w3NvcjHhRV7CBLNh?=
 =?us-ascii?Q?rPVqrluQHMBlN4VoKe7KI7j4stc5OmDW0LmIElKcvchiukmjASiqWu7NgVsM?=
 =?us-ascii?Q?ngvreQQqqGqYYi/eaTGIUgDgp0Duo2itqxfn3u7YgANxiILD18tG7R4IuxPp?=
 =?us-ascii?Q?D9UZcXzpNc/GURvYVob5z074h/tsKhD9Y8TQWfu47OUO0PhHjRdRXYU4Plkv?=
 =?us-ascii?Q?A3yFIw87EuTm7Zk7AOukJ1uYLAmxk8tBIYrM/Pwt+L5dchMM+DUfg4mZZJVv?=
 =?us-ascii?Q?RtLwyy1NGr3nj+L5B/ww6ixp/yZAiRPfnjXPrl/mIBMVHjXNE1I8MxqhB8wt?=
 =?us-ascii?Q?SUDtGI1vOVErAuV/Fu1aCSvy4A7BJFTh5MUgvz74P1fNcc6/y/B5nwdUN6Zy?=
 =?us-ascii?Q?ewe03K5zaUGfFYf1wSrE9fxhoNB2kA4Q2wgcI0n7jtjadiPyOWdo9jH6PMqa?=
 =?us-ascii?Q?wSxV2n2jiP4tGUCQzl2Z5P4k6HbdcyhK0pV2YW95ZzwreGBobVllodR3bckp?=
 =?us-ascii?Q?TBWTt9uNwXiTwlqgwFw3MiU=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c286177-9183-4701-4838-08de20bb9ff3
X-MS-Exchange-CrossTenant-AuthSource: BN0PR01MB6862.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:45:35.2131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /K9MeckoxeJFLvDvP8PDwqpYpveeAuu9aElPyuHNwHG1C7E/smSh3YLpUplWr8e67OGu5imChBhBXTlKDitdJy/cj/oz0Pv050KUXXpZLtQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR01MB6935
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_164541_699477_96447FA3 
X-CRM114-Status: GOOD (  11.27  )
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

Ben Horgan <ben.horgan@arm.com> writes:
> Yes, the driver does barely anything without a requestor.
...
> Thanks for the quick response and testing.

Sure thing!

> I've just responded to the cover letter with a branch containing the
> rest of the driver. (Just so it's not hidden in this thread) It's
> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/log/?h=mpam/snapshot/v6.18-rc4

Yes. I saw that. That's very helpful, so thank you!

> With that, you should be able to enable all usable PARTID and PMG, mount
> resctrl, add tasks/cpus to resctrl control groups, run benchmarks to
> check that the controls are respected and check that the monitors give
> expected values.

Indeed. I now get:

	MPAM enabled with 256 PARTIDs and 2 PMGs

And I have mounted resctrl, added cpus to resctrl control groups, and
then manipulated the L3 cache bitmap control and verified that
benchmarks respond as expected to changes to the control.

I was going to report that I am encountering an unexpected alignment
fault in one of the KUNIT tests, but then I realized that that's in
test_get_mba_granularity which comes in as part of the snapshot, and is
not part of the code that is submitted here. So I'll continue to
invetigate that, but that need not delay the code of interest in the
current series.

Given all of that, for the series:

Tested-by: Carl Worth <carl@os.amperecomputing.com>

-Carl

