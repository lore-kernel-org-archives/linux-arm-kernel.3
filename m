Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F5ACA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 15:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzNlJmhEZlyu1GH7NLwMq2rZh9xZgpmERsV/TJK4Tpg=; b=SCkPT8wECCklV1KalmcJ8P3v/h
	9Mv8PsrrPXLfYDnvDOxA11nPIGC6nCswYyMgl2PFcS2sT7xFhs4olZVBhZr26VEluP2zwgBqk/rhq
	z2nILBe9Us35i2FkXzID8qKYqKMmntw6b44kTEA9rBwdhDkR7voMjW7vacb6kXGvQL+qAkLNYW97l
	jeuS/08WbgcUkXIzO056Wwi0cW2qTyVV09zxsywoFAywJPJAe0iXxY+/zZc2zwG1U0VdvnFs1gscS
	ElDgdsNaSiMUbom8H4W73jw+XOUmUzQY4xtoMuC3gRTfgHZGjPuvq64A7m0faZGX2roAN6G9Xudm4
	hI1QzelA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1GB-00000006FIN-2WGF;
	Fri, 29 Aug 2025 15:43:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urxfO-00000005XcY-17KM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 11:53:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9999819F0;
	Fri, 29 Aug 2025 04:53:05 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E687F3F694;
	Fri, 29 Aug 2025 04:53:11 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	scott@os.amperecomputing.com,
	cl@gentwo.org
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v7 4/6] arm64: mm: Optimize split_kernel_leaf_mapping()
Date: Fri, 29 Aug 2025 12:52:45 +0100
Message-ID: <20250829115250.2395585-5-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250829115250.2395585-1-ryan.roberts@arm.com>
References: <20250829115250.2395585-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_045314_343067_2501D026 
X-CRM114-Status: GOOD (  15.77  )
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

The common case for split_kernel_leaf_mapping() is for a single page.
Let's optimize this by only calling split_kernel_leaf_mapping_locked()
once.

Since the start and end address are PAGE_SIZE apart, they must be
contained within the same contpte block. Further, if start is at the
beginning of the block or end is at the end of the block, then the other
address must be in the _middle_ of the block. So if we split on this
middle-of-the-contpte-block address, it is guaranteed that the
containing contpte block is split to ptes and both start and end are
therefore mapped by pte.

This avoids the second call to split_kernel_leaf_mapping_locked()
meaning we only have to walk the pgtable once.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/mm/mmu.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 114b88216b0c..8b5b19e1154b 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -740,9 +740,21 @@ int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
 	mutex_lock(&pgtable_split_lock);
 	arch_enter_lazy_mmu_mode();
 
-	ret = split_kernel_leaf_mapping_locked(start);
-	if (!ret)
-		ret = split_kernel_leaf_mapping_locked(end);
+	/*
+	 * Optimize for the common case of splitting out a single page from a
+	 * larger mapping. Here we can just split on the "least aligned" of
+	 * start and end and this will guarantee that there must also be a split
+	 * on the more aligned address since the both addresses must be in the
+	 * same contpte block and it must have been split to ptes.
+	 */
+	if (end - start == PAGE_SIZE) {
+		start = __ffs(start) < __ffs(end) ? start : end;
+		ret = split_kernel_leaf_mapping_locked(start);
+	} else {
+		ret = split_kernel_leaf_mapping_locked(start);
+		if (!ret)
+			ret = split_kernel_leaf_mapping_locked(end);
+	}
 
 	arch_leave_lazy_mmu_mode();
 	mutex_unlock(&pgtable_split_lock);
-- 
2.43.0


