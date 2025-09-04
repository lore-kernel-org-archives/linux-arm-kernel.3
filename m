Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18E8CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VWLhIfYPiP+dXnnlv2JP5/iNtaUNDnuC0/GRhQaMOhs=; b=cX/hUUjt9YkloIo7aLijmsaNIB
	qCxz9zgG92TTo9lpR327B/bk2doAJfH8SU8sjYEjhZwj6UsozjzHJ2lPQfF693c9UFVR5/vOR2YYa
	Ue+/kWF7DPtRcwjggzgMlTwyu8NLQnyLCz2kL7b9klVaDf8STde4n5s0R5HDDb3t2lod+3GODk/Vv
	ZHasD13SPYz1Ocrs1dKTHE9rRnkCdlnWpQQxXWQ62Zqps2Lrc4e8Guql6mE0zHgt/155U8ve/vcD8
	gDB/UXCAJPgGfcNEPyp6U4B4yoQs9+f6mV4M4XQURM1SqoZ81D/65doAIcJeFA1/89rfi5izkWKpi
	7O+5MwKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuClo-0000000CrSe-0hLK;
	Thu, 04 Sep 2025 16:25:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9YA-0000000BivB-462L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 12:58:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD01C2F27;
	Thu,  4 Sep 2025 05:58:41 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C1D63F6A8;
	Thu,  4 Sep 2025 05:58:45 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 6/7] sparc/mm: support nested lazy_mmu sections
Date: Thu,  4 Sep 2025 13:57:35 +0100
Message-ID: <20250904125736.3918646-7-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250904125736.3918646-1-kevin.brodsky@arm.com>
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_055851_072850_1E2F335C 
X-CRM114-Status: GOOD (  15.25  )
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

The lazy_mmu API now allows nested sections to be handled by arch
code: enter() can return a flag if called inside another lazy_mmu
section, so that the matching call to leave() leaves any
optimisation enabled.

This patch implements that new logic for sparc: if there is an
active batch, then enter() returns LAZY_MMU_NESTED and the matching
leave() leaves batch->active set. The preempt_{enable,disable} calls
are left untouched as they already handle nesting themselves.

TLB flushing is still done in leave() regardless of the nesting
level, as the caller may rely on it whether nesting is occurring or
not.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/sparc/mm/tlb.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
index bf5094b770af..42de93d74d0e 100644
--- a/arch/sparc/mm/tlb.c
+++ b/arch/sparc/mm/tlb.c
@@ -53,12 +53,18 @@ void flush_tlb_pending(void)
 lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
 {
 	struct tlb_batch *tb;
+	int lazy_mmu_nested;
 
 	preempt_disable();
 	tb = this_cpu_ptr(&tlb_batch);
-	tb->active = 1;
+	lazy_mmu_nested = tb->active;
 
-	return LAZY_MMU_DEFAULT;
+	if (!lazy_mmu_nested) {
+		tb->active = 1;
+		return LAZY_MMU_DEFAULT;
+	} else {
+		return LAZY_MMU_NESTED;
+	}
 }
 
 void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
@@ -67,7 +73,10 @@ void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
 
 	if (tb->tlb_nr)
 		flush_tlb_pending();
-	tb->active = 0;
+
+	if (state != LAZY_MMU_NESTED)
+		tb->active = 0;
+
 	preempt_enable();
 }
 
-- 
2.47.0


