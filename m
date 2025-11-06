Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF2ECCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/CYVWkdDZGtRQRhFehi9aOOX3xvbt9P8Z4jUxH40cI=; b=nPfwdEe+bS2yPpi9XLcirk+CU5
	sK20DdYjbp2MWysIxj2VJBfhACNWAA+wyAP5GLxmgCD4MBUh86KdbOiirQiCGh0bB7hzcyiQKlClI
	XlxYhhdpydHbQF9sQVQsS9GZghCfpMpvU8SUmtMS19KNm812C3NVXx+fq2Dm7fODDAiLHFoqN2G3g
	T5zheDEqZGReaOK+v9OKn2uPMbTSTkdvHXLeSkQny8G+E6ERJmTBniLrk4W8PMdmMwLn1H78hHQpZ
	94QmObKsu82RTyHmGT18GS5d1jnpsmsZd25WMDjiJ/R1KhfjrRxRr+Ak3WJYeN2UOT/Wqmw1ZzDnV
	RaMmz9ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2Yk-0000000Fsnq-2Hlg;
	Thu, 06 Nov 2025 16:10:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2Yh-0000000Fsl4-2l6t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:10:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26FE3169C;
	Thu,  6 Nov 2025 08:09:51 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B1433F66E;
	Thu,  6 Nov 2025 08:09:57 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: mm: Optimize range_split_to_ptes()
Date: Thu,  6 Nov 2025 16:09:42 +0000
Message-ID: <20251106160945.3182799-3-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106160945.3182799-1-ryan.roberts@arm.com>
References: <20251106160945.3182799-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_080959_740285_F29BA22C 
X-CRM114-Status: GOOD (  13.21  )
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

Enter lazy_mmu mode while splitting a range of memory to pte mappings.
This causes barriers, which would otherwise be emitted after every pte
(and pmd/pud) write, to be deferred until exiting lazy_mmu mode.

For large systems, this is expected to significantly speed up fallback
to pte-mapping the linear map for the case where the boot CPU has
BBML2_NOABORT, but secondary CPUs do not. I haven't directly measured
it, but this is equivalent to commit 1fcb7cea8a5f ("arm64: mm: Batch dsb
and isb when populating pgtables").

Note that for the path from arch_kfence_init_pool(), we may sleep while
allocating memory inside the lazy_mmu mode. Sleeping is not allowed by
generic code inside lazy_mmu, but we know that the arm64 implementation
is sleep-safe. So this is ok and follows the same pattern already used
by split_kernel_leaf_mapping().

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/mm/mmu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index a364ac2c9c61..652bb8c14035 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -832,8 +832,14 @@ static const struct mm_walk_ops split_to_ptes_ops = {
 
 static int range_split_to_ptes(unsigned long start, unsigned long end, gfp_t gfp)
 {
-	return walk_kernel_page_table_range_lockless(start, end,
+	int ret;
+
+	arch_enter_lazy_mmu_mode();
+	ret = walk_kernel_page_table_range_lockless(start, end,
 					&split_to_ptes_ops, NULL, &gfp);
+	arch_leave_lazy_mmu_mode();
+
+	return ret;
 }
 
 static bool linear_map_requires_bbml2 __initdata;
-- 
2.43.0


