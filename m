Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F09EC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 15:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkmgYVJsYjfY1eQJPhDEotjXCZNcuY4MKyNB9p34TVU=; b=ZydXon1skvhfk9kL6HoHYQD/Ii
	nHf06uGpVwby8teTdIlW8wghioTzJt6TqGjU5e/DVnHtx48lpaG63w+Mcw9nK/EwN8EwZvZ8YooCZ
	oJKMlAw4YKOc+cxMxae6TlZHqDMg94vgVKZ+gjwVytADXKBJeqKa5Bqp+3CEBRypTYBpVwsb8J1ik
	tLH2HeEG8zoH4gfoLj/yyZTVkcNy28xBCWeBqp9ivdlZbJi9pMgvOg/O/z7bu/tUMAyaT4u6c+iuj
	L7lyIphXw5ahbKY6tZBGI6XagdCTSf/Q1qhQN0ShrNzHx0AHNZE9+xDxozSY99yvl+oLrNOQOD2iF
	ZL0qXG7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhEy-00000003kUJ-3IZt;
	Wed, 05 Feb 2025 15:23:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfh3C-00000003iFP-0LUb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 15:10:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B6AD1063;
	Wed,  5 Feb 2025 07:11:13 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F23B3F5A1;
	Wed,  5 Feb 2025 07:10:47 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Steve Capper <steve.capper@linaro.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 08/16] arm64/mm: Hoist barriers out of ___set_ptes() loop
Date: Wed,  5 Feb 2025 15:09:48 +0000
Message-ID: <20250205151003.88959-9-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205151003.88959-1-ryan.roberts@arm.com>
References: <20250205151003.88959-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_071050_168950_144D3E68 
X-CRM114-Status: GOOD (  11.69  )
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

___set_ptes() previously called __set_pte() for each PTE in the range,
which would conditionally issue a DSB and ISB to make the new PTE value
immediately visible to the table walker if the new PTE was valid and for
kernel space.

We can do better than this; let's hoist those barriers out of the loop
so that they are only issued once at the end of the loop. We then reduce
the cost by the number of PTEs in the range.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 3b55d9a15f05..1d428e9c0e5a 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -317,10 +317,8 @@ static inline void __set_pte_nosync(pte_t *ptep, pte_t pte)
 	WRITE_ONCE(*ptep, pte);
 }
 
-static inline void __set_pte(pte_t *ptep, pte_t pte)
+static inline void __set_pte_complete(pte_t pte)
 {
-	__set_pte_nosync(ptep, pte);
-
 	/*
 	 * Only if the new pte is valid and kernel, otherwise TLB maintenance
 	 * or update_mmu_cache() have the necessary barriers.
@@ -331,6 +329,12 @@ static inline void __set_pte(pte_t *ptep, pte_t pte)
 	}
 }
 
+static inline void __set_pte(pte_t *ptep, pte_t pte)
+{
+	__set_pte_nosync(ptep, pte);
+	__set_pte_complete(pte);
+}
+
 static inline pte_t __ptep_get(pte_t *ptep)
 {
 	return READ_ONCE(*ptep);
@@ -647,12 +651,14 @@ static inline void ___set_ptes(struct mm_struct *mm, pte_t *ptep, pte_t pte,
 
 	for (;;) {
 		__check_safe_pte_update(mm, ptep, pte);
-		__set_pte(ptep, pte);
+		__set_pte_nosync(ptep, pte);
 		if (--nr == 0)
 			break;
 		ptep++;
 		pte = pte_advance_pfn(pte, stride);
 	}
+
+	__set_pte_complete(pte);
 }
 
 static inline void __set_ptes(struct mm_struct *mm,
-- 
2.43.0


