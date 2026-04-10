Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DC5F364DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 11:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8Q8t08ye5jnrE9aNvj/ntJhCP3sX4FsovskkQ85dv8=; b=HUpBTz8HB/3RAj7MSjP6OD/Ncs
	MW/yDh7IUCEGn8B8C2O4kJdBPrMV3FzK18RLnEozVrF+ORw3qISnSrHdnIH7gWwR7x4HffE7bhTNc
	2BzY6yWt4GzkY6+2nh9Mzcp3/HpyNl8E62in35cDGTnUtq+hSdToWV4IWXnmoFKmZlqv/AVTX21C+
	rEke2ZSiFmlpeR8ZGrQwqJhFFn4eOrVPjPKwu/McvUr1FWa4rNR3/s9TFRTk+UJzjT/V5HVrnGJoK
	T286pnFY2HZJfAicjqPBsJmwxX3V7Q58lOyFjM97cVal/vWAOYpqR1rXmGBXIlAb2S7ed5XWYl622
	Z7zB5Q9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9cY-0000000C3A0-1bFs;
	Fri, 10 Apr 2026 11:01:54 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9cV-0000000C39V-3BK8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 11:01:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T5dgsimpdQSKYXv8oztrOCMZGXPPA4rQyE8zhv9YkYqJRw4XhZrfzFVnyd0bpQqrcbpXn1JN3t8kZxdccGjNPdxzI3C9sMa9Nqbp5E3GhmekmK8vy/jakxOv0c32F8MzblT1nTqtL9lfPymEjN767j7TXFTjQcYZ4r3Jt6XJ9E607PTHupU28TChdo6ad0hH+7mXj18u+Abmmzm1I3RVRfELBev8KEVOBE/kYKJqlFSVWuWzDVI2wOWO0+GJGbctuNaHS9rSUSLfIUYjwraynt76XgMmEs3FdNbBHbCb1iKh3ZrUBdhFQLcq4+ekNpA+V3Z583BkhrM7//cRle0zBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8Q8t08ye5jnrE9aNvj/ntJhCP3sX4FsovskkQ85dv8=;
 b=EgOdhgfuFgYU4h3iqrHNutB2N1B8RA9/rMe7voknWXe0yhC6JgbzQe4VLkFS+ALipApwo+WOy+M122T1NmJnIl4aLaL9pt22N+zk1EiRhIIeCdyKxQenS0VS1oFWTbi2Bh24m2zO6dtKcI544T/vLHEumVa3hyMVlKSlKiKNHqlPozmzFuAskIxZ4I1IxaTwQReaYhN6slEWTAvzuAJxryTugeZJCKPnk3lELPC+Q9QhqAgvxZX8u5JfQYZuUBsILLUmyn9OgqSQ+UVyQJjoqWjRMsqwaYFdUEok7XNozHjRbm7jseAfkZvBsUnjRO4seNoKvmBD3AIiFhi5TXubHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8Q8t08ye5jnrE9aNvj/ntJhCP3sX4FsovskkQ85dv8=;
 b=opM6zNar7yGm6s9A10jwO3io+9nJdJg70lnweKDLWyQTDG5O1YIQCC9M4/ajj4Ps0oat8saPK/Eg8p7ahEfOxbWrVfxSzmgGgdC2yVMIXgvP1goYLJ0A0mrWt4TR/We6qQxFuXJ0llUNtWylvrtWDU0vIygrPcyZP2fXjkSVIb5oW/URHs3hPHFgDgPDgZMrzKfpzX61Cbcn7FG1xCo6pDu9UOHFFRxryzG8e5pSq3u1l2CEIbxvpiFljD9f6SikPYPFRc3EfWdlWaK1CmGJYO1oJFrYo9/+YbRBxvF+7prsvXeI8IwVYW6NLSeLwR9P1U3Y9B//T8ccw7x1qirbhA==
Received: from PH7P220CA0084.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::7)
 by SA1PR22MB4837.namprd22.prod.outlook.com (2603:10b6:806:3d7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 10 Apr
 2026 11:01:46 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:510:32c:cafe::87) by PH7P220CA0084.outlook.office365.com
 (2603:10b6:510:32c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.42 via Frontend Transport; Fri,
 10 Apr 2026 11:01:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 11:01:44 +0000
Received: from zoo11.fihel.lab.ge-healthcare.net (zoo11.fihel.lab.ge-healthcare.net [10.168.174.93])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with SMTP id 24A3AD9C13;
	Fri, 10 Apr 2026 14:01:42 +0300 (EEST)
Date: Fri, 10 Apr 2026 14:01:41 +0300
From: Brian Ruley <brian.ruley@gehealthcare.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Will Deacon <will@kernel.org>, Steve Capper <steve.capper@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/arm: pgtable: remove young bit check for
 pte_valid_user
Message-ID: <adjYlUk8_JjPivNi@zoo11.fihel.lab.ge-healthcare.net>
References: <20260409125446.981747-1-brian.ruley@gehealthcare.com>
 <adewJetUv6wMiz9o@willie-the-truck>
 <adfDEMK8EbIjPu3J@zoo11.fihel.lab.ge-healthcare.net>
 <adfNN33QIOP3VfDm@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adfNN33QIOP3VfDm@shell.armlinux.org.uk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F43:EE_|SA1PR22MB4837:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e62111d-c44c-4968-35d4-08de96f08de5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: zXVwjVtSs8gANTQNlKIrRqeX5rLZCyDX+FdBcbqMrh/f7V+4GtXRxknwMU+q1plZbnlb7mYvF2C1hE80j61NBKgxqBeD9Val+hFF0XnV6RY2U6BQvhSwAukhoyhyAadnUbxTf1GSY4Z0hwL2p1Zpzu32Uc6EPzme0XyUsO1XlwwAj/hLmPGxGatYDpsyB9TeKNBHMZRu2fdY2Xa5uM54tH4I3AaB+XBSih6xW1VXhLzLslKFMcnckpQ679w92iDow2HMPlAbp5BrL9rAqHv0HIKm3a9tth05eFpTAiDbFk7Qj4uU2Vlkj+QFsDych4Pu4hqNeexTqIZnUcU/IkQXHwHGEy1rAzuSQEZX/tk8g0ffxWqpEKQNoLkRxXyMT66AW+O8VM6PUg5OQE8X+5xkLDFaHbmyaXuti6qjaEa3J32OP46U37vc09094vPWD2aOT/guxxz+Qkmhs/sNDNscEc1E8pTzcvGa/2yiAwdPpW757vYzk8MPcNCl6RTQmj6KnH3JLWqLjwQ/iLNRE5lMCgLC6VFlJqfzIMVRq6bYe+2qBgJT9mQGqnLMHClSrwkhLfk20FPrT6tfvenOE7sD0jP0IGKrmmiXXF+Zaw5STOts+1sxoEaLGGVxLu8sVJM0486nyjL+VCzd5cV6ggN/m1PTlVH4tscd2liZWIBQCKTJnxp0btOSKWbVpv+F7x49yKcpXtOqNH6B9rCoXPBZi1C0eV1iuzcd5tOigUP2Uruv1yw7sspmKydR5QNwNBsZeHRaOH+vg0H/6anOcW/J1Q==
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0YO73T3HCd7BOVgYj2yj06H1pxbZBAuUIpTePWfdGghVGfZ5KKm8GJTZh0DJygoVS2KRM6i5mm0aHBDZf+EP7QbOA9VXdhYP+SjjAl/yFdhEObMLGlTaX9yPnO9l6nECLS5Uc1I6rmdnmZPygMm9GIG3evawiGkJCnSvaME6O78HnaMw3MOgcPEl5jmoBBVEDksSyWTF6X7qqN7L8UiW//3bvDD9sBWMeIwG6GdqmnxIZprGCTDn0rQN9r1byOzSPse9eHk3YsnyICEsnbDeHIenHaG8T0YcbLKcB91+lNu0IMXr5tzHp3u5sRmKjPjadS55Ep3RMc7Mr/nJ9kZ/Gtgu/grT1AMO9fzFd8tYsH2H8woVLGZgPyzgPZBWKCmth4dysoRS88nNR+LWqNdv6dPnX2ADE7J8dtMcKeubGi5o3ZO+efiYsDFMi+Qsp5Gc
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 11:01:44.7322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e62111d-c44c-4968-35d4-08de96f08de5
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR22MB4837
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_040151_834512_CC09D388 
X-CRM114-Status: GOOD (  33.00  )
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

On Apr 09, Russell King (Oracle) wrote:
> 
> On Thu, Apr 09, 2026 at 06:17:36PM +0300, Brian Ruley wrote:
> > However, in the case I describe, if VA_B is mapped immediately to pfn_q
> > after it been has unmapped and freed for VA_A, then it's quite possible
> > that the page is still indexed in the cache.
> 
> True.
> 
> > The hypothesis is that if
> > VA_A and VA_B land in the same I-cache set and VA_A old cache entry
> > still exists (tagged with pfn_q), then the CPU can fetch stale
> > instructions because the tag will match. That's one reason why we need
> > to invalidate the cache, but that will be skipped in the path:
> >
> >     migrate_pages
> >      migrate_pages_batch
> >       migrate_folio_move
> >        remove_migration_ptes
> >         remove_migration_pte
> >          set_pte_at
> >           set_ptes
> >            __sync_icache_dcache  (skipped if !young)
> >             set_pte_ext
> 
> In this case, if the old PTE was marked !young, then the new PTE will
> have:
>         pte = pte_mkold(pte);
> 
> on it, which marks it !young. As you say, __sync_icache_dcache() will
> be skipped. While a PTE entry will be set for the kernel, the code in
> set_pte_ext() will *not* establish a hardware PTE entry. For the
> 2-level pte code:
> 
>         tst     r1, #L_PTE_YOUNG        @ <- results in Z being set
>         tstne   r1, #L_PTE_VALID        @ <- not executed
>         eorne   r1, r1, #L_PTE_NONE     @ <- not executed
>         tstne   r1, #L_PTE_NONE         @ <- not executed
>         moveq   r3, #0                  @ <- hardware PTE value
>  ARM(   str     r3, [r0, #2048]! )      @ <- writes hardware PTE
> 
> So, for a !young PTE, the hardware PTE entry is written as zero,
> which means accesses should fault, which will then cause the PTE to
> be marked young.
> 
> For the 3-level case, the L_PTE_YOUNG bit corresponds with the AF bit
> in the PTE, and there aren't split Linux / hardware PTE entries. AF
> being clear should result in a page fault being generated for the
> kernel to handle making the PTE young.
> 
> In both of these cases, set_ptes() will need to be called with the
> updated PTE which will now be marked young, and that will result in
> the I-cache being flushed.

Hi Russell,

Thank you for the clarification, this is very educational for me.
I understand your scepticism, and I can't explain what's going on based
on what you replied. However, I do honestly believe there is a problem
here. I'll share the exact testing details and the instrumentation
we added that convinced us to reach out at the end. One idea we also
had was that could cache aliasing be happening here.

To clarify any potential misunderstanding, we've observed the
following:

- Sporadic SIGILL and SIGSEGV under memory pressure
- Scales with core count, i.e., quad core more likely to reproduce
  than dual core. We haven't observed an issue on single core.
- Coredumps show valid instructions at the faulting PC.
  The CPU executed something different from what's in memory.
  This pointed us to stale I-cache.
- Instrumentation indicates a correlation.
  A per-CPU ring buffer tracking exec page migrations was dumped on
  SIGILL. The faulting PC matched a recently migrated pages.
- We started seeing this after upgrade 6.1->6.12->6.18. We bisected
  two commits which had an impact, but we weren't convinced that
  either was the root cause: 5dfab109d5193e6c224d96cabf90e9cc2c039884
  and 6faea3422e3b4e8de44a55aa3e6e843320da66d2.
- Failed processes include systemd, tar, bash, ...
- Debug options, e.g., page poisoning, seems to hide the bug


> So you're saying that stress-ng doesn't reproduce this bug but
triggers the OOM-killer... confused.

Apologies for the confusion. I meant that with `stress-ng' we created
the memory pressure and OOM might have played a role in exposing the
"bug" as we (at the time) believed that anything that would trigger
memory free/reclaims and page migration was the key. One note I'll add
is that in our test we invoked stress-ng for 2 minutes (--timeout 2m)
and after each we would reboot the device. We had observed that reboots
seemed to have a discernible effect on the occurence in earlier testing
so we kept that in. I'm beginning to doubt if it had an effect now,
and unfortunately it's all anecdotal.

One more thing, even if you don't accept the patch, is this patch
harmful in any way or is it just sub-optimal?

I'll send the instrumentation patch as a follow-up, migh be there's a
flaw in it.

Best regards,
Brian

###TESTING###

1. stress-ng --vm 4 --vm-bytes 2G --vm-method zero-one --verify \
             --timeout 2m
2. reboot
3. repeat

Cleaned up logs of instrumentation:
```
kernel: [  104.610248] SIGILL at b6e6f1c0 pid 896, recent exec migrations:
kernel: [  104.610313]   cpu0: addr=b6e6f000 old_pfn=467d3 new_pfn=577fe pid=34 flushed=0
[...]
kernel: [  456.066661] SIGILL at b6d99f40 pid 455, recent exec migrations:
[...]
kernel: [  456.066963]   cpu0: addr=b6d99000 old_pfn=44270 new_pfn=7c9ea pid=34 flushed=0
[...] 
```

