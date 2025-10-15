Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664B2CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 08:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1KJWxkttRktG4lw48Z8HifwxXCgZe80BxWPdftCaJ8=; b=pfDJcIQjcGLhgZCKJtN8C/e4rZ
	N18kuSt6SkgDXbmdcA9T51VJ011gsgjrqjVbG9ninCRYmDrNTDnKMXG7gU1OrJljYx0dTmVp+Kfe5
	bYJUMen+GFLJphhf8KHyBjxb23R4OMFoEVQawJPem6+awxV7atSk5UxGAsDc0BRszkSBHQGX8vO5W
	eMVnmsn4mmDvgWvRukY0X5OzleD7HzBcVZDIxh+Tvtzh874cLJl5VPdxgl+tgHrZTyk8qfjRmkP/i
	NjX8AtuwM7d1agnThGxreesu9N+CSsMSqFeA1TtnNEwVAVri0f4vBPD7zkGL03s0lybWVbaIN53dZ
	H+4PdyYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wrf-00000000uXO-1DQA;
	Wed, 15 Oct 2025 08:28:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wrc-00000000uUm-2aZJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 08:28:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36B1D22F8;
	Wed, 15 Oct 2025 01:27:56 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 361C63F66E;
	Wed, 15 Oct 2025 01:27:59 -0700 (PDT)
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
Subject: [PATCH v3 04/13] sparc/mm: implement arch_flush_lazy_mmu_mode()
Date: Wed, 15 Oct 2025 09:27:18 +0100
Message-ID: <20251015082727.2395128-5-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251015082727.2395128-1-kevin.brodsky@arm.com>
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_012804_690547_4CF31022 
X-CRM114-Status: GOOD (  13.23  )
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

Upcoming changes to the lazy_mmu API will cause
arch_flush_lazy_mmu_mode() to be called when leaving a nested
lazy_mmu section.

Move the relevant logic from arch_leave_lazy_mmu_mode() to
arch_flush_lazy_mmu_mode() and have the former call the latter.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/sparc/include/asm/tlbflush_64.h | 2 +-
 arch/sparc/mm/tlb.c                  | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/include/asm/tlbflush_64.h b/arch/sparc/include/asm/tlbflush_64.h
index 8b8cdaa69272..925bb5d7a4e1 100644
--- a/arch/sparc/include/asm/tlbflush_64.h
+++ b/arch/sparc/include/asm/tlbflush_64.h
@@ -43,8 +43,8 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end);
 
 void flush_tlb_pending(void);
 void arch_enter_lazy_mmu_mode(void);
+void arch_flush_lazy_mmu_mode(void);
 void arch_leave_lazy_mmu_mode(void);
-#define arch_flush_lazy_mmu_mode()      do {} while (0)
 
 /* Local cpu only.  */
 void __flush_tlb_all(void);
diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
index a35ddcca5e76..7b5dfcdb1243 100644
--- a/arch/sparc/mm/tlb.c
+++ b/arch/sparc/mm/tlb.c
@@ -59,12 +59,19 @@ void arch_enter_lazy_mmu_mode(void)
 	tb->active = 1;
 }
 
-void arch_leave_lazy_mmu_mode(void)
+void arch_flush_lazy_mmu_mode(void)
 {
 	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
 
 	if (tb->tlb_nr)
 		flush_tlb_pending();
+}
+
+void arch_leave_lazy_mmu_mode(void)
+{
+	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
+
+	arch_flush_lazy_mmu_mode();
 	tb->active = 0;
 	preempt_enable();
 }
-- 
2.47.0


