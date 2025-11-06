Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14718CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7e79lIR0MUUagRf25jA//CylembXpgfk5oULi2Sh4yk=; b=ZNj8971gB4x1/bKu422A02Rblo
	pO/uWxo01hnef3nF3D+oOWPTNbbH9RBtt9kIbHOAbuFNv7JbIVWxt2zKWFJ/pV6QRY8ip38XTi0m7
	bqPAPlA0xCqB4fAHBmz5Y6qfJCJrn4FuN42em6n0d54ZS6e4gYIgVWO5GrupeLEYtSLiUJnlnt769
	Ix695MsTnkrIJ6t5fTlB0W0FDZK1By9h3QFlHBmkb/pE93IiTEi3iN+IiODDvozO1m9hSMC2Eq9kP
	3vGf3T+TDhsOrDtM9fVToC6SAUaIUK114xsRgZUd55tTkRgRl2cQ9zWZ+a/7jWPwljQNMdM+5i2xo
	YxggtlWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2Yo-0000000Fsr9-3zPi;
	Thu, 06 Nov 2025 16:10:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2Yj-0000000FsmF-0cze
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:10:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8D7C15A1;
	Thu,  6 Nov 2025 08:09:52 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E69B3F66E;
	Thu,  6 Nov 2025 08:09:59 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	yang@os.amperecomputing.com,
	david@redhat.com,
	ardb@kernel.org,
	dev.jain@arm.com,
	scott@os.amperecomputing.com,
	cl@gentwo.org
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <david@kernel.org>
Subject: [PATCH v2 3/3] arm64: mm: Tidy up force_pte_mapping()
Date: Thu,  6 Nov 2025 16:09:43 +0000
Message-ID: <20251106160945.3182799-4-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106160945.3182799-1-ryan.roberts@arm.com>
References: <20251106160945.3182799-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_081001_327235_962B8811 
X-CRM114-Status: GOOD (  17.50  )
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

Tidy up the implementation of force_pte_mapping() to make it easier to
read and introduce the split_leaf_mapping_possible() helper to reduce
code duplication in split_kernel_leaf_mapping() and
arch_kfence_init_pool().

Suggested-by: David Hildenbrand (Red Hat) <david@kernel.org>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/mm/mmu.c | 43 +++++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 652bb8c14035..2ba01dc8ef82 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -710,12 +710,26 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
 
 static inline bool force_pte_mapping(void)
 {
-	bool bbml2 = system_capabilities_finalized() ?
+	const bool bbml2 = system_capabilities_finalized() ?
 		system_supports_bbml2_noabort() : cpu_supports_bbml2_noabort();
 
-	return (!bbml2 && (rodata_full || arm64_kfence_can_set_direct_map() ||
-			   is_realm_world())) ||
-		debug_pagealloc_enabled();
+	if (debug_pagealloc_enabled())
+		return true;
+	if (bbml2)
+		return false;
+	return rodata_full || arm64_kfence_can_set_direct_map() || is_realm_world();
+}
+
+static inline bool split_leaf_mapping_possible(void)
+{
+	/*
+	 * !BBML2_NOABORT systems should never run into scenarios where we would
+	 * have to split. So exit early and let calling code detect it and raise
+	 * a warning.
+	 */
+	if (!system_supports_bbml2_noabort())
+		return false;
+	return !force_pte_mapping();
 }
 
 static DEFINE_MUTEX(pgtable_split_lock);
@@ -725,22 +739,11 @@ int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
 	int ret;
 
 	/*
-	 * !BBML2_NOABORT systems should not be trying to change permissions on
-	 * anything that is not pte-mapped in the first place. Just return early
-	 * and let the permission change code raise a warning if not already
-	 * pte-mapped.
-	 */
-	if (!system_supports_bbml2_noabort())
-		return 0;
-
-	/*
-	 * If the region is within a pte-mapped area, there is no need to try to
-	 * split. Additionally, CONFIG_DEBUG_PAGEALLOC and CONFIG_KFENCE may
-	 * change permissions from atomic context so for those cases (which are
-	 * always pte-mapped), we must not go any further because taking the
-	 * mutex below may sleep.
+	 * Exit early if the region is within a pte-mapped area or if we can't
+	 * split. For the latter case, the permission change code will raise a
+	 * warning if not already pte-mapped.
 	 */
-	if (force_pte_mapping() || is_kfence_address((void *)start))
+	if (!split_leaf_mapping_possible() || is_kfence_address((void *)start))
 		return 0;
 
 	/*
@@ -1039,7 +1042,7 @@ bool arch_kfence_init_pool(void)
 	int ret;
 
 	/* Exit early if we know the linear map is already pte-mapped. */
-	if (!system_supports_bbml2_noabort() || force_pte_mapping())
+	if (!split_leaf_mapping_possible())
 		return true;
 
 	/* Kfence pool is already pte-mapped for the early init case. */
-- 
2.43.0


