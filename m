Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D3DCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 08:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yonosVKorvPfHjKG943kS+3aeQ7jqapDh6f5jDLbXPE=; b=M1hDzDzj/cbsRtGujKl/Ezu/pr
	HQTZf6rzoTsDqXlyl7G4l50jjJivlBgPPYdxn/AiJXrDPwspSE+PGUmnY46tOvezOXtBSckWocB8J
	f0+iWdpElGG29qVB7xS9NQsZuPIrtYEBhRIiA1gJHPstCiiNJR7S28L9+VLJU79cPN4ZWmxZi6LNR
	m6qJWskI0si66DcX+x4adKMKI3shTC5WAaVxsjECEjDrf5GO3H2kOlcYYYEafY5RHkV4CaRcK7CVe
	cgrZ18OBgH5uzaZ6JJSM6GBhj0IezOIzLcC/44L8ukTiDyRK3iRsIVEOAR32SL5rz0tRfAGPQLOps
	Hr3OErJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wsC-00000000v8y-2sdt;
	Wed, 15 Oct 2025 08:28:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ws9-00000000v4K-0rU9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 08:28:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D57AA2328;
	Wed, 15 Oct 2025 01:28:28 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8251F3F66E;
	Wed, 15 Oct 2025 01:28:31 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jann Horn <jannh@google.com>,
	Juergen Gross <jgross@suse.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org
Subject: [PATCH v3 10/13] sparc/mm: replace batch->active with in_lazy_mmu_mode()
Date: Wed, 15 Oct 2025 09:27:24 +0100
Message-ID: <20251015082727.2395128-11-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251015082727.2395128-1-kevin.brodsky@arm.com>
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_012837_284834_94DFAC38 
X-CRM114-Status: GOOD (  13.71  )
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

The generic lazy_mmu layer now tracks whether a task is in lazy MMU
mode. As a result we no longer need to track whether the per-CPU TLB
batch struct is active - we know it is if in_lazy_mmu_mode() returns
true.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/sparc/include/asm/tlbflush_64.h | 1 -
 arch/sparc/mm/tlb.c                  | 9 +--------
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/sparc/include/asm/tlbflush_64.h b/arch/sparc/include/asm/tlbflush_64.h
index 4e1036728e2f..6133306ba59a 100644
--- a/arch/sparc/include/asm/tlbflush_64.h
+++ b/arch/sparc/include/asm/tlbflush_64.h
@@ -12,7 +12,6 @@ struct tlb_batch {
 	unsigned int hugepage_shift;
 	struct mm_struct *mm;
 	unsigned long tlb_nr;
-	unsigned long active;
 	unsigned long vaddrs[TLB_BATCH_NR];
 };
 
diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
index 7b5dfcdb1243..879e22c86e5c 100644
--- a/arch/sparc/mm/tlb.c
+++ b/arch/sparc/mm/tlb.c
@@ -52,11 +52,7 @@ void flush_tlb_pending(void)
 
 void arch_enter_lazy_mmu_mode(void)
 {
-	struct tlb_batch *tb;
-
 	preempt_disable();
-	tb = this_cpu_ptr(&tlb_batch);
-	tb->active = 1;
 }
 
 void arch_flush_lazy_mmu_mode(void)
@@ -69,10 +65,7 @@ void arch_flush_lazy_mmu_mode(void)
 
 void arch_leave_lazy_mmu_mode(void)
 {
-	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
-
 	arch_flush_lazy_mmu_mode();
-	tb->active = 0;
 	preempt_enable();
 }
 
@@ -93,7 +86,7 @@ static void tlb_batch_add_one(struct mm_struct *mm, unsigned long vaddr,
 		nr = 0;
 	}
 
-	if (!tb->active) {
+	if (!in_lazy_mmu_mode()) {
 		flush_tsb_user_page(mm, vaddr, hugepage_shift);
 		global_flush_tlb_page(mm, vaddr);
 		goto out;
-- 
2.47.0


