Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048C6C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 09:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8ymBgUSA5ZN0KXL1mRdo7aKval8NgY94GI7dvST/r4=; b=fKM9WlNybNEav6ZM8L7H5wA+47
	gUa0N9DLuv9RV3VxxEMKFr5+S2HLfUkoJ5cZJYIEjzGlxekSId2my1ZqtWhh93acPnEOEtYVzFz58
	UqzycVFsgLhay2g7XVsoxLqJNk7F9XvmEt3PuRV9VnvdtKZnTg64xySYIQiJNerliKZCF7MXH8vse
	7eLjH5WTGmd9X2IrTzJj7SpnCamlRMmPHUV4ECGeoLqZDOGGijHnU6Z95Vpy6zDwCBDC+SEtGnfve
	1wmbPL8TVYvGRv7GxsdUJLVQW+SA58ar390aacRbRiHsEXSWBJ2EtlVmtl6vnZswo/vE/dUl+tmo0
	TpvvQjtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WOv-00000009xit-2uZB;
	Wed, 23 Apr 2025 09:28:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7VJc-00000009goR-2XV8
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Apr 2025 08:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=X8ymBgUSA5ZN0KXL1mRdo7aKval8NgY94GI7dvST/r4=; b=bzRNUMuChOzbFAH8S7qC9tNmhC
	CIlHhZ7LuV418WmWzA7dWK7LtPbTHUO5x+uwHyVe0fBqEluh74Bj2oF8f9nV3ZGMyXsLqCzSh7nM+
	5XzAGnmgdqk1NUpe1dztvjf4ruAkXFrvZ92PhGQiS9AXOcfLT91vOWRIscbdVaAKCBpmWjk6u0zYG
	2Pq7RHsR2aXU4piqfHOSQqnqzU/zswY0gynnv7WGJYItq0WD1AeVoBVArXIhO/3Ph8ZKnG7yLlePa
	sr0gFSgo1A7Ty/QUAfGAVZmtCEvnZwo6H8NEaGOwYwXyBYZcd0HzoFEox1hJoGvF7DfhDt92xgdM4
	CKV4ZNIA==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7VJR-0000000BOie-1aho;
	Wed, 23 Apr 2025 08:18:33 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7VJO-00000002YNq-1401;
	Wed, 23 Apr 2025 09:18:30 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Sauerwein, David" <dssauerw@amazon.de>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Hildenbrand <david@redhat.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	kvmarm@lists.cs.columbia.edu,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Ruihan Li <lrh2000@pku.edu.cn>
Subject: [PATCH v3 2/7] mm: Implement for_each_valid_pfn() for CONFIG_FLATMEM
Date: Wed, 23 Apr 2025 08:52:44 +0100
Message-ID: <20250423081828.608422-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423081828.608422-1-dwmw2@infradead.org>
References: <20250423081828.608422-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
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

From: David Woodhouse <dwmw@amazon.co.uk>

In the FLATMEM case, the default pfn_valid() just checks that the PFN is
within the range [ ARCH_PFN_OFFSET .. ARCH_PFN_OFFSET + max_mapnr ).

The for_each_valid_pfn() function can therefore be a simple for() loop
using those as min/max respectively.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/asm-generic/memory_model.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/memory_model.h
index a3b5029aebbd..74d0077cc5fa 100644
--- a/include/asm-generic/memory_model.h
+++ b/include/asm-generic/memory_model.h
@@ -30,7 +30,15 @@ static inline int pfn_valid(unsigned long pfn)
 	return pfn >= pfn_offset && (pfn - pfn_offset) < max_mapnr;
 }
 #define pfn_valid pfn_valid
-#endif
+
+#ifndef for_each_valid_pfn
+#define for_each_valid_pfn(pfn, start_pfn, end_pfn)			 \
+	for ((pfn) = max_t(unsigned long, (start_pfn), ARCH_PFN_OFFSET); \
+	     (pfn) < min_t(unsigned long, (end_pfn),			 \
+			   ARCH_PFN_OFFSET + max_mapnr);		 \
+	     (pfn)++)
+#endif /* for_each_valid_pfn */
+#endif /* valid_pfn */
 
 #elif defined(CONFIG_SPARSEMEM_VMEMMAP)
 
-- 
2.49.0


