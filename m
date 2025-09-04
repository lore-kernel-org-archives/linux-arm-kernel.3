Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC144CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLlXfKPxMlaUvMb/as1DeaEQrf2xWKKiAo/9OSQRFtg=; b=G62+Er8Sv/4889Ah1F8KRK+wIK
	J7ghAdzschMFMzQE6pplDnYGASV0Qy8BOezYSFzCmGuGxYKYZnYdLJPrRm8HoBygVnZnbjypcXajJ
	olwqjQaqKyumDrEJVXFHc5q1AAU3K/QsXdHC6SN6G4IjpmWh0vLINnx2eOKOswxMj4H17o6zkDOHP
	RHWkhR4rUAfQdwBuRGJTeAc+ikjCsMJgBJ+q2NQflhYuHLElYdWhBy+zfn8K4Vtk30SYbmONQPyN2
	i41ejAeBfJHAd1J8Fynd/qKzn+LMBwBjhx7Z9z244dL87hadlBqNfrUVLVDrNNUUy9njHDGUmy38o
	aVmzzEIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuClt-0000000CrdU-2quT;
	Thu, 04 Sep 2025 16:25:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9YF-0000000Bixd-1few
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 12:58:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A725E2F28;
	Thu,  4 Sep 2025 05:58:46 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 757883F6A8;
	Thu,  4 Sep 2025 05:58:50 -0700 (PDT)
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
Subject: [PATCH 7/7] mm: update lazy_mmu documentation
Date: Thu,  4 Sep 2025 13:57:36 +0100
Message-ID: <20250904125736.3918646-8-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250904125736.3918646-1-kevin.brodsky@arm.com>
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_055855_482448_04F9D837 
X-CRM114-Status: GOOD (  15.98  )
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

We now support nested lazy_mmu sections on all architectures
implementing the API. Update the API comment accordingly.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 include/linux/pgtable.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 6932c8e344ab..be0f059beb4d 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -228,8 +228,18 @@ static inline int pmd_dirty(pmd_t pmd)
  * of the lazy mode. So the implementation must assume preemption may be enabled
  * and cpu migration is possible; it must take steps to be robust against this.
  * (In practice, for user PTE updates, the appropriate page table lock(s) are
- * held, but for kernel PTE updates, no lock is held). Nesting is not permitted
- * and the mode cannot be used in interrupt context.
+ * held, but for kernel PTE updates, no lock is held). The mode cannot be used
+ * in interrupt context.
+ *
+ * Calls may be nested: an arch_{enter,leave}_lazy_mmu_mode() pair may be called
+ * while the lazy MMU mode has already been enabled. An implementation should
+ * handle this using the state returned by enter() and taken by the matching
+ * leave() call; the LAZY_MMU_{DEFAULT,NESTED} flags can be used to indicate
+ * whether this enter/leave pair is nested inside another or not. (It is up to
+ * the implementation to track whether the lazy MMU mode is enabled at any point
+ * in time.) The expectation is that leave() will flush any batched state
+ * unconditionally, but only leave the lazy MMU mode if the passed state is not
+ * LAZY_MMU_NESTED.
  */
 #ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
 typedef int lazy_mmu_state_t;
-- 
2.47.0


