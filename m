Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CF7C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 09:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFbreoMrbREVmzBILAfDNbybt5zLdiHJFA7H6oI4wRk=; b=iSEl8M3mfP9io5aJf6c3xtAiQP
	02JMfOkmDB1h3PklS3sa3TwAdI4P8FbCoTVDZjXWk1FCX47z8+7iSrnxIP2Arfxw6LcArtQ8Spwac
	eSd1kSql4nomAJZMjdZSuc/uYq98XSjEqorW3kkbXaWili1nuzudHMv5Y4XRzEmTmCs+1hYEFQfoF
	2Rq5Yd2J6wWSPK1DXbPdtjHDyz2II5FvDQoU0IN6paA6QpmC0v/dxJ/GmFvAfJoooGUBEAKS1bmT5
	kZWMPAKGzjmtO617haQkU2fZiaNCt+Q96prxTcFNPaU2YcJH6/nVnzulDo9g7DKC6FeUqXM215UY6
	zqphd+rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uchBo-0000000C98n-0rVj;
	Fri, 18 Jul 2025 09:15:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uch0B-0000000C7Pq-0Ml7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 09:03:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58B94176C;
	Fri, 18 Jul 2025 02:03:27 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (unknown [10.164.18.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A93ED3F66E;
	Fri, 18 Jul 2025 02:03:26 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org
Cc: ryan.roberts@arm.com,
	david@redhat.com,
	willy@infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	jannh@google.com,
	anshuman.khandual@arm.com,
	peterx@redhat.com,
	joey.gouly@arm.com,
	ioworker0@gmail.com,
	baohua@kernel.org,
	kevin.brodsky@arm.com,
	quic_zhenhuah@quicinc.com,
	christophe.leroy@csgroup.eu,
	yangyicong@hisilicon.com,
	linux-arm-kernel@lists.infradead.org,
	hughd@google.com,
	yang@os.amperecomputing.com,
	ziy@nvidia.com,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v5 4/7] mm: Introduce FPB_RESPECT_WRITE for PTE batching infrastructure
Date: Fri, 18 Jul 2025 14:32:41 +0530
Message-Id: <20250718090244.21092-5-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250718090244.21092-1-dev.jain@arm.com>
References: <20250718090244.21092-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_020335_157497_AE0359BE 
X-CRM114-Status: GOOD (  12.06  )
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

Patch 6 optimizes mprotect() by batch clearing the ptes, masking in the new
protections, and batch setting the ptes. Suppose that the first pte
of the batch is writable - with the current implementation of
folio_pte_batch(), it is not guaranteed that the other ptes in the batch
are already writable too, so we may incorrectly end up setting the
writable bit on all ptes via modify_prot_commit_ptes().

Therefore, introduce FPB_RESPECT_WRITE so that all ptes in the batch
are writable or not.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/internal.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 5b0f71e5434b..28d2d5b051df 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -208,17 +208,20 @@ typedef int __bitwise fpb_t;
 /* Compare PTEs respecting the soft-dirty bit. */
 #define FPB_RESPECT_SOFT_DIRTY		((__force fpb_t)BIT(1))
 
+/* Compare PTEs respecting the writable bit. */
+#define FPB_RESPECT_WRITE		((__force fpb_t)BIT(2))
+
 /*
  * Merge PTE write bits: if any PTE in the batch is writable, modify the
  * PTE at @ptentp to be writable.
  */
-#define FPB_MERGE_WRITE			((__force fpb_t)BIT(2))
+#define FPB_MERGE_WRITE			((__force fpb_t)BIT(3))
 
 /*
  * Merge PTE young and dirty bits: if any PTE in the batch is young or dirty,
  * modify the PTE at @ptentp to be young or dirty, respectively.
  */
-#define FPB_MERGE_YOUNG_DIRTY		((__force fpb_t)BIT(3))
+#define FPB_MERGE_YOUNG_DIRTY		((__force fpb_t)BIT(4))
 
 static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
 {
@@ -226,7 +229,9 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
 		pte = pte_mkclean(pte);
 	if (likely(!(flags & FPB_RESPECT_SOFT_DIRTY)))
 		pte = pte_clear_soft_dirty(pte);
-	return pte_wrprotect(pte_mkold(pte));
+	if (likely(!(flags & FPB_RESPECT_WRITE)))
+		pte = pte_wrprotect(pte);
+	return pte_mkold(pte);
 }
 
 /**
-- 
2.30.2


