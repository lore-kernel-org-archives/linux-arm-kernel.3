Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF7CCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 19:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SOIdp7sUbsxj/Qt7JgKZ9JB95Dg5wovTCPeoK2w2Eks=; b=mKT6aiWKWb8ZPogxoXi1pTPgsK
	sja/cqteT689LUF4i1toBI2MlgeNKWagTvyuvUmUlmWT1tqcPXJU/uJBBPUkhlgZXvNiD/dGDWxd8
	h0SUTNTmYeDR4qh6tC9likBPgsDyHmyiCOhLCWPdB8vZenm6IpNgRDuvbBHi9lHYzxUqJqaR49Y2x
	5YzTznfE/kZP2Ay3vOL27JRDmztYDM1+ovGkmdX6zxF+4TKc2BPR6GIe9Dhp0pC8ua/SwjJ6fPllu
	gIBaAOe4xjLrtSaS7Zqy6yeJA+SxBvlY4kAO3pvSoAdWE/EE9amK3k07iDC8S++4AD/3/iwyhnQns
	f67n3Fuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNygr-00000009HIL-2gCB;
	Fri, 15 May 2026 19:59:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNygp-00000009HGz-0Zns
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 19:59:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7D3C1BF7;
	Fri, 15 May 2026 12:59:09 -0700 (PDT)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00CEB3F85F;
	Fri, 15 May 2026 12:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778875154; bh=QcLi9nOXGdtsBW9OJfP749hIUAI4GeEa0oT0K7mFMZA=;
	h=From:To:Cc:Subject:Date:From;
	b=lQ+zvmr22w6KmGzdHqs9ITHCZKbFHbxFFNE8X+yyyhTFOhwHpxgCe6Q/+BsLcfMK0
	 jln7sf+/ssx8j7SC2l2hwzC8zZ98+rl2cR6l7THK6RMNo9dTSp9R35z2JWemn0wWP6
	 IGips3ebbW4FHZPtci4vjAfTCmppZZWy47+blKV8=
From: Leonardo Bras <leo.bras@arm.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] Optimize S2 page splitting
Date: Fri, 15 May 2026 20:59:01 +0100
Message-ID: <20260515195904.2466381-1-leo.bras@arm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2955; i=leo.bras@arm.com; h=from:subject; bh=QcLi9nOXGdtsBW9OJfP749hIUAI4GeEa0oT0K7mFMZA=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLLYq1lEZh1Z7DdJ3q3C69CLVoWtTt4xyjo18jLbOo982 j1jRtK5jlIWBjEuBlkxRRbZR/NX8XyfknHkyo8FMHNYmUCGMHBxCsBErjAyMvTPXLCP4Yqt5YJA KbvtWYK/D/2bIRbCYsB7hztb9NL/6Q6MDM3/hJz/C0m7BPHxf5+6fu/fNwHWx71Ffum7yTebGvi K8gIA
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_125919_257733_206C4493 
X-CRM114-Status: GOOD (  15.07  )
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

While playing with dirty-bit tracking, I decided to take a look on how page
splitting works. Found out all entries are walked, even though we can infer,
for instance that:
- If a level-3 entry is walked, it means the parent level-2 entry is split
- If a split just succeeded in an table entry, it means all children nodes
  are already split

So I tried to optimize it in a way that it does not break other users.

My main idea is to introduce positive return values that hint to the
pagetable walking mechanism that either siblings or children can be 
skipped. That should be contained to the visitor function, that returns
zero if no error was detected.

Numbers on above optimization are promising:
A 1GB VM, running on the model, splitting all at the beginning 
(no manual protect):
- Memory was already split (4k pages): 	-97.33% runtime (-172ms) - 20 runs
- THP backed memory: 			-19.82% runtime (-153ms) - 10 runs
- 1x1GB hugetlb memory:			-20.65% runtime (-150ms) - 10 runs

This is measured with this snippet[1].
I ran at least 10 times on different 1GB VMs, to make sure the numbers are 
consistent.

Ideas I considered:
- Using a negative return value, using kvm_pgtable_walk_continue to 
  filter it as a non-error, but decided that is kind of counter-intuitive
- Using the introduced return values to hint the split walker to not 
  splitting level-2 blocks (or level-1), if by adding a new parameter in
  kvm_pgtable_stage2_split() and carrying it over to the walker using 
  ctx->arg. (Splitting only up to given hugepage size)
- Looking at other walkers, and trying to think on scenarios to
  optimize them using the new return values.

Do you think it is worth doing this?
Please provide feedback!

Thanks!
Leo


[1]:
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index d089c107d9b7..6424e833b7be 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1272,22 +1273,26 @@ static void kvm_mmu_split_memory_region(struct kvm *kvm, int slot)
        phys_addr_t start, end;
 
        lockdep_assert_held(&kvm->slots_lock);
 
        slots = kvm_memslots(kvm);
        memslot = id_to_memslot(slots, slot);
 
        start = memslot->base_gfn << PAGE_SHIFT;
        end = (memslot->base_gfn + memslot->npages) << PAGE_SHIFT;
 
+
        write_lock(&kvm->mmu_lock);
+       u64 sw = ktime_get_real_ns();
        kvm_mmu_split_huge_pages(kvm, start, end);
+       sw = ktime_get_real_ns() - sw;
+       printk("split from %llx to %llx took %llu ns\n", start, end, sw);
        write_unlock(&kvm->mmu_lock);
 }
 

Leonardo Bras (2):
  KVM: arm64: Introduce S2 walker SKIP return options
  KVM: arm64: Improve splitting performance by using SKIP return values

 arch/arm64/kvm/hyp/pgtable.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)


base-commit: 5d6919055dec134de3c40167a490f33c74c12581
-- 
2.54.0


