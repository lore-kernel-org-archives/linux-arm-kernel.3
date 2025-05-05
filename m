Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0682FC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 23:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9jgJBsZvESTlfpwYJA5m690mJHYdlomkra6z8YGu9I=; b=QrC7GZvGn2NVeu/rm+gg+qGbsx
	DE0bh77+0dtg5rkTHZ8mEphGJne3ntlvYOagwjwubGgEw8P7VsJ68s81rcAvPENa/mmwwQ5HN7BSr
	MLbanL1Ik82o3Xg2O55v8Z7SyCaocG1H37/VlghuRZyM3kXd2RqN95iwAAzdU1toZhRVyhDyp3KNF
	v8sgszYTtO8gohRciqBbTnEvExshPsS6CWDIKVaOL82YFNNwTvBi1XTARtj+DunlFKb/FxakOmabi
	N4ZuxJQDCTlO6I1lbQ0TIiHXVrfNbmmmLucvenyPLJ9YR5rIu4AwkB/5+P3ZMhu+6/ns+jYdKnK5Y
	xN5ChBaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4r6-00000008wcA-3bMF;
	Mon, 05 May 2025 23:04:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4BV-00000008jGZ-0Wrt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:21:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 14BE54367B;
	Mon,  5 May 2025 22:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26866C4CEE4;
	Mon,  5 May 2025 22:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483672;
	bh=siqNuZOnYr/OxqzZlTEEU7LPtOKhtSzbt8IEGSo8F0w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pO1QNXlWiSFQ2FTxtxrKWiPjoqHvLGZ2GoUk4n2b5uhvU5BRbNWhUlqfak6WfRO9o
	 FVKtBitE8u/CxQp2POtr6FulUqOiZXrXT+pJ30aRwEPm8KkJqhX3A3/4K68irRVSDP
	 mF58zDV1Pc7isuAhIbv3SjYgqav1mDnVbnl0OBjYMKIxWFKUElZxPhTC3RmwA2agPe
	 d6Y/0Dc+kA8FEFcGjdS7luydSGPqiyvruRIOKz6Wmye/J038GlJoL8qJOrsvHqzeCn
	 aV/7Ly8/ACY++18BVg2RiLkEWwO16yky477kEbucqj67+Xn6BByOsZtmYDnjgG4RVZ
	 L6sLnsYIAlhUQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sasha Levin <sashal@kernel.org>,
	joey.gouly@arm.com,
	peterx@redhat.com,
	yangyicong@hisilicon.com,
	ioworker0@gmail.com
Subject: [PATCH AUTOSEL 6.14 172/642] arm64/mm: Check pmd_table() in pmd_trans_huge()
Date: Mon,  5 May 2025 18:06:28 -0400
Message-Id: <20250505221419.2672473-172-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_152113_203877_A48DFEA1 
X-CRM114-Status: GOOD (  11.67  )
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

From: Ryan Roberts <ryan.roberts@arm.com>

[ Upstream commit d1770e909898c108e8c7d30ca039053e8818a9c9 ]

Check for pmd_table() in pmd_trans_huge() rather then just checking for the
PMD_TABLE_BIT. But ensure all present-invalid entries are handled correctly
by always setting PTE_VALID before checking with pmd_table().

Cc: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Link: https://lore.kernel.org/r/20250221044227.1145393-8-anshuman.khandual@arm.com
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/include/asm/pgtable.h | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 0b2a2ad1b9e83..abf990ce175b1 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -548,18 +548,6 @@ static inline int pmd_protnone(pmd_t pmd)
 #endif
 
 #define pmd_present(pmd)	pte_present(pmd_pte(pmd))
-
-/*
- * THP definitions.
- */
-
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-static inline int pmd_trans_huge(pmd_t pmd)
-{
-	return pmd_val(pmd) && pmd_present(pmd) && !(pmd_val(pmd) & PMD_TABLE_BIT);
-}
-#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
-
 #define pmd_dirty(pmd)		pte_dirty(pmd_pte(pmd))
 #define pmd_young(pmd)		pte_young(pmd_pte(pmd))
 #define pmd_valid(pmd)		pte_valid(pmd_pte(pmd))
@@ -724,6 +712,18 @@ extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 #define pmd_leaf_size(pmd)	(pmd_cont(pmd) ? CONT_PMD_SIZE : PMD_SIZE)
 #define pte_leaf_size(pte)	(pte_cont(pte) ? CONT_PTE_SIZE : PAGE_SIZE)
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+static inline int pmd_trans_huge(pmd_t pmd)
+{
+	/*
+	 * If pmd is present-invalid, pmd_table() won't detect it
+	 * as a table, so force the valid bit for the comparison.
+	 */
+	return pmd_val(pmd) && pmd_present(pmd) &&
+	       !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
+}
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+
 #if defined(CONFIG_ARM64_64K_PAGES) || CONFIG_PGTABLE_LEVELS < 3
 static inline bool pud_sect(pud_t pud) { return false; }
 static inline bool pud_table(pud_t pud) { return true; }
-- 
2.39.5


