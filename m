Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55C6CD98E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 20:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tOPuob3WbzWntjhBc88382pJW2jJocO3U+iuCNG9usI=; b=l6kCPJ4aAIiZp+Vi+aWdRv1Z7P
	GNEmL5COZweXDHaSgQeo3FbczCLZklcMtfnyPrBRCC7ayyRzaKzrqt371ag+2TrWdDWQ503Dfp+h5
	+GbjhHsa7o6pp1KVQrNagvKEAqcqD0Nh4wQfgp8ABVMghuBdJyNY4IjmTth7lRP3yEhEPC1K94bn6
	rREVv6eyqZ3xdBzxU0aYpS/8pYM8IHczQprp/n+G/ePtku+XNVJZSvWe0EgnROrazySpzxI/77Nab
	tR1dCwOz9gsi5pzH6qCgD3L286FsyxrTSI0cwlUrZB9NDMhatDAEynJQlxkOpaRdpRf5NeD+yaOPq
	/3bdKs7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZDdM-0000000Eo4Z-0bY3;
	Mon, 15 Jun 2026 20:10:12 +0000
Received: from mail-norwayeastazon11013025.outbound.protection.outlook.com ([40.107.159.25] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZDdJ-0000000Eo48-0zvg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 20:10:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J2TtEQQj0dajnOQC71F26hgq9DIuEIIT34gDFOMpZ5rCwsT86mFxnyFkgYjopfmuTGWqTfMjTYTA4BFUv53MXG26BfMA+yBhUiD7i6xUNxUbVFgAN+NyLsnrWW9dfpNNqgWCDqDt4fiSPaJJlpyQz0cOimjUkUj9swwTripR330lwS2fuMo1acB/KvaFBWRL9rE4jkbpjqVewmyX6UW899wvfpfrLtuPNdClTuMpEej/2USzn9+NkHCduXoPKHUj3ExMiV9RJ4tJ1ETK/ogjZG4SCRRGVEWLRt4MqlZhd1F7hebTz2nYEDvgth5AiO+KpysjxmbgulNE0clOFg0hkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOPuob3WbzWntjhBc88382pJW2jJocO3U+iuCNG9usI=;
 b=GRcSAQous75GPTaUV8E1XP2nTF5hq2l5drlK5OkuwqklPd8JPp4nPfNvRmI4iqG7M5O5xmmerk9EDYNZnzn4c+J4/887fN/5gRnK4YfzXcVaDOUGAzUFJ4f0EuUClLF0SD4dP/+q7HIymoElLIO+EHbTd4eaIO/3Hui4uQVmq9WNQQ5ZkeRlZahYLH/UpegSIoSDLvXjOwoiv69wd+90L6+s9U0aVgtsDJkVZfz1Z4UVcdHYcHgs+ev6faRQo1QKnKJ68ILw7Wv4seJjj6qFrltguLpQ6w6kULF3NnKXDeOFRADvnd60X3EfOT1m8GGq2XS3XOBlg1eKVKN3GTlKpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOPuob3WbzWntjhBc88382pJW2jJocO3U+iuCNG9usI=;
 b=T3CBolmhAo6q0F5rVcfu4xjZhjhRQvrrgpgfyJ2Obn7ifQ7mWb/YThKyY9th3MkOKwF8RM+LZ9ZVDDRMsKlUaq04ZN2lcR6mvbTG7HX5qwu8+I6NAI+BQfB7nbj7zsiPYAzJxwvNHzNDanYgKX1zwt6vmVBHUlCcQ+q3LF5rH3li4Na2mYbiedRco9x4OhcTwwFUWT8Qe+lwJIyJlKdI9fOx4XXF3xpqA4v7b3uFg9lbfgq6hrOQae8qWQs3gyAZSHtGG8CAwduvroL5pLOza4AG4M94lA9BCZ4eVIaDPSL8O7SgwIMUPLl7tvhrTraGbWKypHUuTCbVNDdEjjkneg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB12067.eurprd04.prod.outlook.com (2603:10a6:150:30c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 20:10:02 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 20:10:02 +0000
Date: Mon, 15 Jun 2026 16:09:55 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, catalin.marinas@arm.com,
	Ard Biesheuvel <ardb@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 1/5] arm64: Rename page table BSS section to
 .bss..pgtbl
Message-ID: <ajBcE3qfT7ldBNKG@lizhi-Precision-Tower-5810>
References: <20260604151151.150377-7-ardb+git@google.com>
 <20260604151151.150377-8-ardb+git@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604151151.150377-8-ardb+git@google.com>
X-ClientProxiedBy: SA0PR11CA0094.namprd11.prod.outlook.com
 (2603:10b6:806:d1::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB12067:EE_
X-MS-Office365-Filtering-Correlation-Id: bec5356f-da0a-4de8-833c-08decb1a156f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|19092799006|376014|4143699003|18002099003|56012099006|11063799006|3023799007|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: iXzwtgtV2bZzzRLXx/ZB/HPUfCjhWNt2wc/4A+AxA+ofvf7WyKhrW7joz6oJN94A5Xu97Ka4uDcjMmhPfwkoGlM6fu1fUwWhirKrCWe4nIlzJbwYZ5adKi7TyVQhPQE51K2qpQ5E67hOrO3rpaOA4OUiDiuaIT+M1K1xatPuG8jsRCvvEd8dYDhJkkemomsGFrlRHjn/lmbWGuQTncCZGSD3XyUdvf8S+vJApOQ5PZ0mY061GO60Y7m3uYLXO1LruANC80XUFrjwmeBiQvVISF9jK4iD7lS+bnI1eiHtI5nzUL3Q8rAXzm05ebMJu6/iWHZU+sLHcql3z1f7IJfbX/zmKRGrw++TpjGodHvbwULNroR+1Vb9/toNqKIfZUPvgzJ1ZgTHplbhlsx3idM1qXw3DpH/nQppyfRlokWpJA7tPQD8lO4YBtIX274mxgcHgX7zo22N78wCe+S6Lnjm2T7KASh9c5PhC8nxz/gEuGw/Y5XGm1lgzKlVjZd272upDh2Njk9wAWIc720rSEvieASSfWRcKQFvTdGX9Liu7riIdttKgPIlbbfqy4bpiVA31Y847ULw2tEukHh+iBX12TDOe5k8jjhr+5QA2X0HI4RRaQUNK5XeSCuUY08VlwUtZTQpWy0FlZ7FTsDoViZ9tPFzBxTSP0vpi+8zwQB56S/bqgQUYkMgcb7T+6M0kurQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(19092799006)(376014)(4143699003)(18002099003)(56012099006)(11063799006)(3023799007)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tiuhVHzaGvq/8DwdpoShlpJzxPVgedhd79F1jT8DmDHsv2Hp6/TKqRPwxmAS?=
 =?us-ascii?Q?to0dz8XtikNATNum7uPGx9d4e+ufXXT0MyFXLw7i8oODmetM7Byr0bZyy8qV?=
 =?us-ascii?Q?5xUyfkQvjrV9qm4K/HLeZSmVa35WXk7EmzGZ2eqSVDKGi5c3S8ty1MiUBBGN?=
 =?us-ascii?Q?oj3jfcSISHkzcvvS0FTrw7e29kvRPEHzARrvMmTbJXgkqwG7lOb/Bvq1Xvn9?=
 =?us-ascii?Q?MpM394E23Q+PgT9/t1BcxAAkwaXrDWNwQyQQ8o2O0i/mQOy7klwujOy2oaf6?=
 =?us-ascii?Q?iCJLH13odDHxJES2ccmB37QcQ0TArYQdVdbEJ+ev0AZI4etb8j0fMVu0rLXD?=
 =?us-ascii?Q?HzZOSzEP2F8EhxlUWju8Wj0l11lNNYzCJt7FUemgw8nZwXWbkBUBqhp9G6Ib?=
 =?us-ascii?Q?gAHBHNXZVCfDX9vDAoLZPzGsvM8QL9McSZ+VJP20bbueGmC2HKfwTstG0BTp?=
 =?us-ascii?Q?0Mhmtzkq4k8a1KZedOpea6Om+4J2pyCkQjGkOYqJ8mVbx0DTKVRwlz502OIh?=
 =?us-ascii?Q?6VXgFjBs1Zgz8BvixEuR1JwApaNDg/8lIo7oIkzwOTPObxigFRE5qptQ+/Ds?=
 =?us-ascii?Q?7o94zaafkZBryCHa+uHVeu+N4fxT2K17nNNj+G6xqHCvMD/fkGGg2xU/WwMi?=
 =?us-ascii?Q?myeXftsTiLwCEMoiu81rYN/Yo+l7HBuWl3ySfpfK7Q7/JnDvKPfGYCyyEpH9?=
 =?us-ascii?Q?1eKcZ04IrG4+IesJ+TSs17RB6MlVOLrkkq0mpJ0qpXg8hvHgeGfVJhJKCzB+?=
 =?us-ascii?Q?8mFwWXtCLQe7StxPZyD0wv29NoX/PhJIynJlFv1dvlKgy0He3qNZyHcKZtLL?=
 =?us-ascii?Q?KqK2FsnzOgI9nHYuSbF53yE/yKBXEo97GjqbaU7C8NvaFOfWhOe370AMsxkc?=
 =?us-ascii?Q?O7gvRnmdj1U9bSqD/fqzdc/1BTwJsIo5TVEbSzSsIS3d4VaTRqanWF/sHo2U?=
 =?us-ascii?Q?Ddp6kHS7Skqxw6CBl0krHEWhpuxYsgnuZDLfpHEmdIF1cGZHQmdYm8Fotr4p?=
 =?us-ascii?Q?IawPG8a+kKGyaCKPt39OoDFb/HHKhl+MOLWIY6hu/JoJDAJczSOyGia44JZB?=
 =?us-ascii?Q?Jr4GOtmm9E5d9cKoaLZTXFFBfETheMwGYb4rft9nA2iLR66U5Oub/cy5VNY+?=
 =?us-ascii?Q?z1RUopdj8s2iw1kii6F9hzVlnJNybOFUi4kgdDVO0HpNkO/VNIZ5oIKuzETc?=
 =?us-ascii?Q?0QjNE89rz4pJbzFomte9WPp1tcV84A3dYhwqk5ufTM0mJQPPNqncQj4unE06?=
 =?us-ascii?Q?H6nTNBaWML/JZ0bsE1YSnVuJo+U2lAyrJPvbSyn1qvvBzavKN6yCN0CFOjb8?=
 =?us-ascii?Q?I6GEfwThMFCsO3qxst3kCtII1KOX0jY3bN2R81cOWsKAZkG7MX2U76OT6NC5?=
 =?us-ascii?Q?1tpXFVAxPSpDK+isN2xyodnSYlJc+Trig1+0jSCBmOFXgPocFUBIrY0jKARy?=
 =?us-ascii?Q?96cvnNQVx51TYhC58Drydj3p+dy2boydfjy1tiecpueyIoB+1d81yTbzeLjJ?=
 =?us-ascii?Q?BbnR8hmFCg/cAO46E89HpDYiZ+Jtii1OHxV5ARfvsan9+FsPgpVQHLeOW7Yt?=
 =?us-ascii?Q?tHLgsI/M6Fzi+/QXSV9RgUDx+3VpOtXWaCwbd9ZnKg1C02sBbm7sgs0KA3gS?=
 =?us-ascii?Q?tTRPYxy8+skFpgs7g88G4U1C11IgHRKYfzZkC20Zjg7hqSOWJ0RTxbbj7YSW?=
 =?us-ascii?Q?WXbO+gJsM3JG0k8TLwhmTZ2/Qgx939aan/tVdyReuGQ7Cnq0K3NJJ9UUcem9?=
 =?us-ascii?Q?O+8E2ORhxT6kRN9bfxBKs+yj40g6kE8PyPJhPN8EWNSMrtI8QAXI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bec5356f-da0a-4de8-833c-08decb1a156f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 20:10:02.4896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Al4D3hUhcuM/esR5J5IWoJQgD8Jdtyup2ZJjt2CsXGJDigdMM2FPimwJpDOxKb5qd+Vr1gedR8L7SD06yvnNOkoPnzoi7cAhV9/kKMZEzMPiNaBaokfgTqvw/gJluUz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_131009_496287_086ACCF5 
X-CRM114-Status: GOOD (  22.71  )
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

On Thu, Jun 04, 2026 at 05:11:53PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Rename the .pgdir.bss section to .bss..pgtbl so that the compiler will
> notice the leading ".bss" and mark it as NOBITS by default (rather than
> PROGBITS, which would take up space in Image binary, forcing all of the
> preceding BSS to be emitted into the image as well). This supersedes the
> NOLOAD linker directive, which achieves the same thing, and can be
> therefore be dropped.
>
> Also, rename .pgdir to .pgtbl to be more generic, as page tables of
> various levels will reside here.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---

I met boot failure for i.MX8QXP by this patch

[    0.823515] Unable to handle kernel paging request at virtual address ffff00000328f000
[    0.831116] Mem abort info:
[    0.833886]   ESR = 0x0000000096000147
[    0.837622]   EC = 0x25: DABT (current EL), IL = 32 bits
[    0.842923]   SET = 0, FnV = 0
[    0.845961]   EA = 0, S1PTW = 0
[    0.849088]   FSC = 0x07: level 3 translation fault
[    0.853952] Data abort info:
[    0.856809]   ISV = 0, ISS = 0x00000147, ISS2 = 0x00000000
[    0.862296]   CM = 1, WnR = 1, TnD = 0, TagAccess = 0
[    0.867330]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    0.872633] swapper pgtable: 4k pages, 48-bit VAs, pgdp=000000008211f000
[    0.879321] [ffff00000328f000] pgd=0000000000000000, p4d=18000008bffff403, pud=18000008bfffe403, pmd=18000008bffea403, pte=00e800008328ff06
[    0.891834] Internal error: Oops: 0000000096000147 [#1]  SMP
[    0.897469] Modules linked in:
[    0.900514] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.1.0-rc1-00016-g63e0b6a5b693 #834 PREEMPT
[    0.909978] Hardware name: Freescale i.MX8QXP MEK (DT)
[    0.915104] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.922053] pc : dcache_clean_inval_poc+0x24/0x48
[    0.926742] lr : kvm_arm_init+0xa78/0x1638
[    0.930828] sp : ffff80008318bd10
[    0.934127] x29: ffff80008318bd50 x28: 0000000000000000 x27: ffff00000328f000
[    0.941251] x26: 0000000000002000 x25: ffff80008219e000 x24: 0000000001002222
[    0.948374] x23: 0000000000000030 x22: ffff800081e850c0 x21: ffff800082b790d0
[    0.955498] x20: 0000000000000004 x19: ffff8000830a0000 x18: 0000000000000000
[    0.962622] x17: ffff800082f938b8 x16: ffff800082b8b4e0 x15: ffff800082b8b4b8
[    0.969746] x14: ffff80008308f0a0 x13: ffff800082b8b490 x12: ffff800082b8b530
[    0.976869] x11: ffff800082b8b508 x10: ffff80008308f140 x9 : ffff80008308f118
[    0.983993] x8 : ffff80008308f0f0 x7 : ffff80008308f0c8 x6 : ffff80008308f078
[    0.991117] x5 : ffff80008308f050 x4 : ffff800082b8b468 x3 : 000000000000003f
[    0.998240] x2 : 0000000000000040 x1 : ffff000003291000 x0 : ffff00000328f000
[    1.005367] Call trace:
[    1.007800]  dcache_clean_inval_poc+0x24/0x48 (P)
[    1.012490]  do_one_initcall+0x80/0x1c8
[    1.016310]  kernel_init_freeable+0x208/0x2f0
[    1.020654]  kernel_init+0x24/0x1e0
[    1.024131]  ret_from_fork+0x10/0x20
[    1.027700] Code: 9ac32042 d1000443 8a230000 d503201f (d50b7e20)
[    1.033779] ---[ end trace 0000000000000000 ]---
[    1.038428] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    1.046026] SMP: stopping secondary CPUs
[    1.049943] Kernel Offset: disabled
[    1.053408] CPU features: 0x00000000,00000008,00040021,0400421b
[    1.059316] Memory Limit: none
[    1.062359] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---


Any idea?

Frank

>  arch/arm64/include/asm/linkage.h | 2 ++
>  arch/arm64/include/asm/mmu.h     | 2 --
>  arch/arm64/kernel/vmlinux.lds.S  | 8 ++++----
>  arch/arm64/mm/fixmap.c           | 6 +++---
>  arch/arm64/mm/kasan_init.c       | 2 +-
>  5 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/include/asm/linkage.h b/arch/arm64/include/asm/linkage.h
> index 40bd17add539..8637f667667c 100644
> --- a/arch/arm64/include/asm/linkage.h
> +++ b/arch/arm64/include/asm/linkage.h
> @@ -43,4 +43,6 @@
>  	SYM_TYPED_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
>  	bti c ;
>
> +#define __bss_pgtbl __section(".bss..pgtbl") __aligned(PAGE_SIZE)
> +
>  #endif
> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
> index fb95754f2876..5e1211c540ab 100644
> --- a/arch/arm64/include/asm/mmu.h
> +++ b/arch/arm64/include/asm/mmu.h
> @@ -13,8 +13,6 @@
>
>  #ifndef __ASSEMBLER__
>
> -#define __pgtbl_bss __section(".pgdir.bss") __aligned(PAGE_SIZE)
> -
>  #include <linux/refcount.h>
>  #include <asm/cpufeature.h>
>
> diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
> index 2b0ebfb30c63..d3ed59abab38 100644
> --- a/arch/arm64/kernel/vmlinux.lds.S
> +++ b/arch/arm64/kernel/vmlinux.lds.S
> @@ -352,11 +352,11 @@ SECTIONS
>  	BSS_SECTION(SBSS_ALIGN, 0, PAGE_SIZE)
>  	__pi___bss_start = __bss_start;
>
> -	/* fixmap BSS starts here - preceding data/BSS is omitted from the linear map */
> -	.pgdir.bss (NOLOAD) : ALIGN(PAGE_SIZE) {
> -		*(.pgdir.bss)
> +	/* page table BSS starts here - preceding data/BSS is omitted from the linear map */
> +	.pgtbl : ALIGN(PAGE_SIZE) {
> +		*(.bss..pgtbl)
>  	}
> -	ASSERT(ADDR(.pgdir.bss) == __bss_stop, ".pgdir.bss must follow BSS")
> +	ASSERT(ADDR(.pgtbl) == __bss_stop, ".pgtbl must follow BSS")
>
>  	. = ALIGN(PAGE_SIZE);
>  	__pi_init_pg_dir = .;
> diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
> index 1a3bbd67dd76..f66a0016dd02 100644
> --- a/arch/arm64/mm/fixmap.c
> +++ b/arch/arm64/mm/fixmap.c
> @@ -31,9 +31,9 @@ static_assert(NR_BM_PMD_TABLES == 1);
>
>  #define BM_PTE_TABLE_IDX(addr)	__BM_TABLE_IDX(addr, PMD_SHIFT)
>
> -static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __pgtbl_bss;
> -static pmd_t bm_pmd[PTRS_PER_PMD] __pgtbl_bss __maybe_unused;
> -static pud_t bm_pud[PTRS_PER_PUD] __pgtbl_bss __maybe_unused;
> +static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __bss_pgtbl;
> +static pmd_t bm_pmd[PTRS_PER_PMD] __bss_pgtbl __maybe_unused;
> +static pud_t bm_pud[PTRS_PER_PUD] __bss_pgtbl __maybe_unused;
>
>  static inline pte_t *fixmap_pte(unsigned long addr)
>  {
> diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> index dbf22cae82ee..3fcad956fdf7 100644
> --- a/arch/arm64/mm/kasan_init.c
> +++ b/arch/arm64/mm/kasan_init.c
> @@ -214,7 +214,7 @@ asmlinkage void __init kasan_early_init(void)
>  		 * shadow pud_t[]/p4d_t[], which could end up getting corrupted
>  		 * when the linear region is mapped.
>  		 */
> -		static pte_t tbl[PTRS_PER_PTE] __pgtbl_bss;
> +		static pte_t tbl[PTRS_PER_PTE] __bss_pgtbl;
>  		pgd_t *pgdp = pgd_offset_k(KASAN_SHADOW_START);
>
>  		set_pgd(pgdp, __pgd(__pa_symbol(tbl) | PGD_TYPE_TABLE));
> --
> 2.54.0.1032.g2f8565e1d1-goog
>

