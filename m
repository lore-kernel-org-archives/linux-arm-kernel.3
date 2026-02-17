Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F67EF99F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ae7jkpxTm9oRIa8vR5DG/aPE45z0hnydiwv9bczENao=; b=eQErVRkoM2ArglMNAYRFFi77Ea
	4Ogcik350nbyUff15Qqnu7FWqubiQgHSTvpDDAY9Mqf1wcU4NXyvCs60ymj/Ni5lScQUrxeh0MfjL
	vTabq56KDNiVyp1rWcKYLUDmpJ2FQ2066c8mMPggY+36Zvybu8Fmol9JgCOY1DQj0xoryzJ3cSaxC
	pOWAkK7lyzXJa/Yq9+48sZxNqaUSbQ5E0Bm2SV7PhNi9Lu0zaYdNciAB8L1x31/4AOwObH4eDpusm
	gIdjYRTpR5H7h+3UVMQXt7+WQmxfQv5btrC59xDV7KIsBfuj3AyjbSUwvOLjtmiRxuo/7iJu3tiRg
	e02DzZXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLEv-00000008KcL-3bqT;
	Tue, 17 Feb 2026 13:35:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLEr-00000008KZR-33D7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:35:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7658A1655;
	Tue, 17 Feb 2026 05:35:34 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15EC73F632;
	Tue, 17 Feb 2026 05:35:38 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: stable@vger.kernel.org
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jack Aboutboul <jaboutboul@microsoft.com>,
	Sharath George John <sgeorgejohn@microsoft.com>,
	Noah Meyerhans <nmeyerhans@microsoft.com>,
	Jim Perrin <Jim.Perrin@microsoft.com>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Eric Chanudet <echanude@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH 6.1 2/3] arm64: mm: Batch dsb and isb when populating pgtables
Date: Tue, 17 Feb 2026 13:35:23 +0000
Message-ID: <20260217133527.2881603-3-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260217133527.2881603-1-ryan.roberts@arm.com>
References: <20260217133527.2881603-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_053541_909038_3CB7CD28 
X-CRM114-Status: GOOD (  12.18  )
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

[ Upstream commit 1fcb7cea8a5f7747e02230f816c2c80b060d9517 ]

After removing uneccessary TLBIs, the next bottleneck when creating the
page tables for the linear map is DSB and ISB, which were previously
issued per-pte in __set_pte(). Since we are writing multiple ptes in a
given pte table, we can elide these barriers and insert them once we
have finished writing to the table.

Execution time of map_mem(), which creates the kernel linear map page
tables, was measured on different machines with different RAM configs:

               | Apple M2 VM | Ampere Altra| Ampere Altra| Ampere Altra
               | VM, 16G     | VM, 64G     | VM, 256G    | Metal, 512G
---------------|-------------|-------------|-------------|-------------
               |   ms    (%) |   ms    (%) |   ms    (%) |    ms    (%)
---------------|-------------|-------------|-------------|-------------
before         |   78   (0%) |  435   (0%) | 1723   (0%) |  3779   (0%)
after          |   11 (-86%) |  161 (-63%) |  656 (-62%) |  1654 (-56%)

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Tested-by: Eric Chanudet <echanude@redhat.com>
Reviewed-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Link: https://lore.kernel.org/r/20240412131908.433043-3-ryan.roberts@arm.com
Signed-off-by: Will Deacon <will@kernel.org>
[ Ryan: Trivial backport ]
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/pgtable.h |  7 ++++++-
 arch/arm64/mm/mmu.c              | 11 ++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 62326f249aa71..3ea0c9768c4c9 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -261,9 +261,14 @@ static inline pte_t pte_mkdevmap(pte_t pte)
 	return set_pte_bit(pte, __pgprot(PTE_DEVMAP | PTE_SPECIAL));
 }

-static inline void set_pte(pte_t *ptep, pte_t pte)
+static inline void set_pte_nosync(pte_t *ptep, pte_t pte)
 {
 	WRITE_ONCE(*ptep, pte);
+}
+
+static inline void set_pte(pte_t *ptep, pte_t pte)
+{
+	set_pte_nosync(ptep, pte);

 	/*
 	 * Only if the new pte is valid and kernel, otherwise TLB maintenance
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index b193ea2c0a629..ca06b5e131e0f 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -175,7 +175,11 @@ static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
 	do {
 		pte_t old_pte = READ_ONCE(*ptep);

-		set_pte(ptep, pfn_pte(__phys_to_pfn(phys), prot));
+		/*
+		 * Required barriers to make this visible to the table walker
+		 * are deferred to the end of alloc_init_cont_pte().
+		 */
+		set_pte_nosync(ptep, pfn_pte(__phys_to_pfn(phys), prot));

 		/*
 		 * After the PTE entry has been populated once, we
@@ -229,6 +233,11 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 		phys += next - addr;
 	} while (addr = next, addr != end);

+	/*
+	 * Note: barriers and maintenance necessary to clear the fixmap slot
+	 * ensure that all previous pgtable writes are visible to the table
+	 * walker.
+	 */
 	pte_clear_fixmap();
 }

--
2.43.0


