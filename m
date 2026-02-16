Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BC2E7BD8C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 10:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k8soCiw0yPZ5FvM6uZ6IB+oR4BTFJ2YyLTokzJ5tj5w=; b=SyIxXeF977WKF4nsIQI+HVsFY3
	9ODiz3UghjFT2DkCIYBv9MCvmgDy49RvPtDW+Qno7/ePubvjEKAuYkwBeiJvfr97C+CNA+1BmTTNP
	JFgbndtpE2fghlEZ1or9It4Nw9f4h1iAFjebEm92GtwCKdzFJObydVQ29KEFaXT835lf21lBHv52x
	ZmCrgmy1w7DsP2b4eLq17QepRbFZRdU8ev6/LzG6KSTmhehKJW3uvuWyYrt+zCM+tUIDS3mRNyFir
	vUCmIj3pkCMmLACQizSvAiNUo0Qs+W2272OPq23nMwQ34FtvI/4sTdf5nJV9DgsT0J99qvYLoCNMl
	RdWxtoPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwFV-00000006OAl-0Say;
	Mon, 16 Feb 2026 10:54:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwFT-00000006OA3-0qKs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 10:54:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 205E6402B0;
	Mon, 16 Feb 2026 10:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5784AC116C6;
	Mon, 16 Feb 2026 10:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771239278;
	bh=OcCCo/1gRKB3YHar1Lc1ULAMl9R2PY7ytURVC/zC2sg=;
	h=From:To:Cc:Subject:Date:From;
	b=R+X5w6GYEGRtaLWwCzk55Gjti+NnLuiEHjJr5f+8arFJw5httlIYr0Cs/5Znih7AC
	 K21j3MdM0wiOa+qnfTLLG2icKmQ1AB7BNy5JkoMEeu85Hn72M2OsSZd1lmq7u0MQ8X
	 NddiN0F5DN20asATZiSMV9cLq5YL5He+sgthp797qbugLkdK08iorKeJPjLVhTpR02
	 3ZRgOncoyXR92VKcHTfRTeG4y8PgAejqFLktiaPgV+Fp/b5h80qZuB+ULIoUwqjQrG
	 93sniiQ9g8bhyEmvnUC3wYw9F8OJoWPcg0Zo9fhqux6jmR5su2n+z4n/vfa4SqYXC8
	 mdOmsXpYw5b1g==
From: Arnd Bergmann <arnd@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Rohan McLure <rmclure@linux.ibm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [v3] arm64: hugetlbpage: avoid unused-but-set-parameter warning (gcc-16)
Date: Mon, 16 Feb 2026 11:54:21 +0100
Message-Id: <20260216105432.2381873-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_025439_268363_BA86B672 
X-CRM114-Status: GOOD (  12.38  )
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

From: Arnd Bergmann <arnd@arndb.de>

gcc-16 warns about an instance that older compilers did not:

arch/arm64/mm/hugetlbpage.c: In function 'huge_pte_clear':
arch/arm64/mm/hugetlbpage.c:369:57: error: parameter 'addr' set but not used [-Werror=unused-but-set-parameter=]

The issue here is that __pte_clear() does not actually use its second
argument, but when CONFIG_ARM64_CONTPTE is enabled it still gets
updated.

Replace the macro with an inline function to let the compiler see
the argument getting passed down.

Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v3: rephrase changelog text
v2: replace my original patch with Catalin's suggestion
---
 arch/arm64/include/asm/pgtable.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index a17eb8a76788..b3e58735c49b 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -144,8 +144,6 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
 	__pte(__phys_to_pte_val((phys_addr_t)(pfn) << PAGE_SHIFT) | pgprot_val(prot))
 
 #define pte_none(pte)		(!pte_val(pte))
-#define __pte_clear(mm, addr, ptep) \
-				__set_pte(ptep, __pte(0))
 #define pte_page(pte)		(pfn_to_page(pte_pfn(pte)))
 
 /*
@@ -1284,6 +1282,13 @@ static inline bool pud_user_accessible_page(pud_t pud, unsigned long addr)
 /*
  * Atomic pte/pmd modifications.
  */
+
+static inline void __pte_clear(struct mm_struct *mm,
+			       unsigned long addr, pte_t *ptep)
+{
+	__set_pte(ptep, __pte(0));
+}
+
 static inline int __ptep_test_and_clear_young(struct vm_area_struct *vma,
 					      unsigned long address,
 					      pte_t *ptep)
-- 
2.39.5


