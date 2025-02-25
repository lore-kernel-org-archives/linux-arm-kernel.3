Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B16C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 12:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UhRam0JBn74B89ZVCpuJo7/ruXYreKV/tj8Ssr13oZc=; b=pia5hOuG7PTa2b+gYY0gdJSVvh
	HMa0Am3ZUuFh8YoVWp/59Zp5vlYoVNyG2k+/rydwqoegQxrbFYDZpqctGQvi8ed+wPg0aoC0cyxxD
	05mCiQugSAPywVG7e8RGXlR/ebUHCC7s+21B4eEabz3/7N2X2T/WXkHzvXFJVfIs3ECtNcawFckUh
	rFxv6Lg5nL92p9tk9mPz9U1MEPxfGOYvD4CFmpBiuQ/D0n3imBvzr19KgyGyA/yq4NMho/Bpwd6j7
	8eo5PWLaKtpASUxno0g/kBS3Np8Hngp1PXh9MzHz2jVKAX1ozsroD7cxJ0wBEqRgKRDfjbeQf5gNr
	w9weqIUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtlY-0000000HA27-04jf;
	Tue, 25 Feb 2025 12:10:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmspy-0000000GyTc-1u4C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 11:10:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D71D81516;
	Tue, 25 Feb 2025 03:11:09 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D357D3F673;
	Tue, 25 Feb 2025 03:10:51 -0800 (PST)
Date: Tue, 25 Feb 2025 11:10:46 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Luiz Capitulino <luizcap@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
	ardb@kernel.org,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: kernel BUG at arch/arm64/mm/mmu.c:185!
Message-ID: <Z72lNoOdZp5_kiT7@J2N7QTR9R3>
References: <a3d9acbe-07c2-43b6-9ba9-a7585f770e83@redhat.com>
 <fe95f4c8-4b09-4d8e-99c9-987ddc2761e3@arm.com>
 <9f5600b3-6525-4045-ad1f-4408dfc9ce0f@redhat.com>
 <cf2b32a4-2217-4a31-b6d7-e60a9f4ef7dd@arm.com>
 <789c17e6-5ebc-4e37-93cd-19d24f148fd8@redhat.com>
 <dee18de8-7938-4df1-badb-c00832d6995f@redhat.com>
 <b39a37c8-c9b5-406d-a97a-24fa67622b49@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b39a37c8-c9b5-406d-a97a-24fa67622b49@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_031054_577965_7DD40B26 
X-CRM114-Status: GOOD (  27.38  )
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

On Tue, Feb 25, 2025 at 09:47:30AM +0000, Ryan Roberts wrote:
> (Adding arm folks for visibility)
> 
> See original report here for context:
> https://lore.kernel.org/all/a3d9acbe-07c2-43b6-9ba9-a7585f770e83@redhat.com/
> 
> TL;DR is that 6.14 doesn't boot on Ampere Altra when kaslr is enabled.
> 
> 
> On 20/02/2025 20:08, Luiz Capitulino wrote:
> > On 2025-02-19 09:40, Luiz Capitulino wrote:
> > 
> >>>> Btw, I'll try to bisect again and will also try to update the system's firmware
> >>>> just in case.
> > 
> > I tried to bisect it and again, got nowhere.
> > 
> > Git bisect says the first bad commit is 8883957b3c9de2087fb6cf9691c1188cccf1ac9c .
> > But I'm able to boot that tree...
> > 
> 
> OK, think I've found the dodgy commit:
> 
> Commit 62cffa496aac ("arm64/mm: Override PARange for !LPA2 and use it consistently")
> 
> Based on the changes it certainly looks like it could be the issue, but I
> haven't spotted exactly what the problem is yet. Ard, could you take a look?
> 
> I managed to hack multi ram bank support into kvmtool, so I can now repro the
> issue in virtualization. Then was able to bisect to get to the above commit.

If you're able to repro this, could you please say the configuration of
memory banks you're using, and could you hack the BUG() to dump more
info, e.g. something lihke the below, UNTESTED patch.

Knowing the VA will tell us whether we're spilling out of the expected VA
region otherwise going wildly wrong with addressing, and the values in the PTEs
will tell us what's specifically triggering the warning.

Also, if you're able to test with CONFIG_DEBUG_VIRTUAL, that might spot if we
have a dodgy VA->PA conversion somewhere, which can 

Mark.

---->8----
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index b4df5bc5b1b8b..d04719919de33 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -171,19 +171,22 @@ static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
 {
        do {
                pte_t old_pte = __ptep_get(ptep);
+               pte_t new_pte =  pfn_pte(__phys_to_pfn(phys), prot);
 
                /*
-                * Required barriers to make this visible to the table walker
-                * are deferred to the end of alloc_init_cont_pte().
+                * After the PTE entry has been populated once, we
+                * only allow updates to the permission attributes.
                 */
-               __set_pte_nosync(ptep, pfn_pte(__phys_to_pfn(phys), prot));
+               if (!pgattr_change_is_safe(pte_val(old_pte), pte_val(new_pte))) {
+                       panic("Unsafe PTE change @ VA:0x%016lx PA:%pa::0x%016llx -> 0x%016llx\n",
+                              addr, &phys, pte_val(old_pte), pte_val(new_pte));
+               }
 
                /*
-                * After the PTE entry has been populated once, we
-                * only allow updates to the permission attributes.
+                * Required barriers to make this visible to the table walker
+                * are deferred to the end of alloc_init_cont_pte().
                 */
-               BUG_ON(!pgattr_change_is_safe(pte_val(old_pte),
-                                             pte_val(__ptep_get(ptep))));
+               __set_pte_nosync(ptep, pfn_pte(__phys_to_pfn(phys), prot));
 
                phys += PAGE_SIZE;
        } while (ptep++, addr += PAGE_SIZE, addr != end);
 

