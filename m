Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F91EB1054
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 14:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGWvFNNHbAVQyTUs3YvCDY0GyMiml7VfROhcweab0g8=; b=Azi9XeEoPRH12jWAFLtuvid64B
	zh9lQv/LpUib/bLewOQcIq53BJ3fJsq0y7/0ZXZfGEAL9GhDPap+SARcVNNTyssL6W5g/G6tBT7j3
	GoPrmKW3qSn/hrrpAkS5LuL3vZyPTfw8whITsePxKguymUK2S9euFjLrD+K8DuPJmUXIeJqGBw6rA
	1GKhx6P4DzOYPfr5RFuTSAcZ9Z77Ik5lMhs9syTVyrcVCibf7qR3JeLw4apA9XVf3aUaEQ4N+3CUI
	0xEecgoPda5WDdXldzcb+xPAJDlE8NTJLbBWxdTHUZYQjIB/EIcVjV8/Otto5CLcZnTJCVxgujLnc
	VuVY9iSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyTv-00000009jbK-284F;
	Tue, 10 Mar 2026 14:54:47 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyTs-00000009jaK-1600
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 14:54:46 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773154479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EGWvFNNHbAVQyTUs3YvCDY0GyMiml7VfROhcweab0g8=;
	b=taHmAdo34oCwjQFIaRdmRojINXQm081BWLVpiG89JRPghIcpldJ2rwOWU0KURRrhy5yjpf
	19sWjb7mkMYRCePOGCQXpG9Wc5IKYu1fi/V6HuLIH/qnuv0qdwjurQ0tE2yqYewmgWxhBS
	i69FLwkpsJPKnJP2wwNrpkeBXTBIoAo=
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	ryan.roberts@arm.com,
	david@kernel.org
Cc: ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	apopple@nvidia.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	brauner@kernel.org,
	catalin.marinas@arm.com,
	dev.jain@arm.com,
	jack@suse.cz,
	kees@kernel.org,
	kevin.brodsky@arm.com,
	lance.yang@linux.dev,
	Liam.Howlett@oracle.com,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	npache@redhat.com,
	rmclure@linux.ibm.com,
	Al Viro <viro@zeniv.linux.org.uk>,
	will@kernel.org,
	willy@infradead.org,
	ziy@nvidia.com,
	hannes@cmpxchg.org,
	kas@kernel.org,
	shakeel.butt@linux.dev,
	kernel-team@meta.com,
	Usama Arif <usama.arif@linux.dev>
Subject: [PATCH 1/4] arm64: request contpte-sized folios for exec memory
Date: Tue, 10 Mar 2026 07:51:14 -0700
Message-ID: <20260310145406.3073394-2-usama.arif@linux.dev>
In-Reply-To: <20260310145406.3073394-1-usama.arif@linux.dev>
References: <20260310145406.3073394-1-usama.arif@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_075444_463785_B432FF92 
X-CRM114-Status: GOOD (  12.53  )
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

exec_folio_order() was introduced [1] to request readahead of executable
file-backed pages at an arch-preferred folio order, so that the hardware
can coalesce contiguous PTEs into fewer iTLB entries (contpte).

The current implementation uses ilog2(SZ_64K >> PAGE_SHIFT), which
requests 64K folios. This is optimal for 4K base pages (where CONT_PTES
= 16, contpte size = 64K), but suboptimal for 16K and 64K base pages:

Page size | Before (order) | After (order) | contpte
----------|----------------|---------------|--------
4K        | 4 (64K)        | 4 (64K)       | Yes (unchanged)
16K       | 2 (64K)        | 7 (2M)        | Yes (new)
64K       | 0 (64K)        | 5 (2M)        | Yes (new)

For 16K pages, CONT_PTES = 128 and the contpte size is 2M (order 7).
For 64K pages, CONT_PTES = 32 and the contpte size is 2M (order 5).

Use ilog2(CONT_PTES) instead, which directly evaluates to contpte-aligned
order for all page sizes.

The worst-case waste is bounded to one folio (up to 2MB - 64KB)
at the end of the file, since page_cache_ra_order() reduces the folio
order near EOF to avoid allocating past i_size.

[1] https://lore.kernel.org/all/20250430145920.3748738-6-ryan.roberts@arm.com/

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 arch/arm64/include/asm/pgtable.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index b3e58735c49bd..a1110a33acb35 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1600,12 +1600,11 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 #define arch_wants_old_prefaulted_pte	cpu_has_hw_af
 
 /*
- * Request exec memory is read into pagecache in at least 64K folios. This size
- * can be contpte-mapped when 4K base pages are in use (16 pages into 1 iTLB
- * entry), and HPA can coalesce it (4 pages into 1 TLB entry) when 16K base
- * pages are in use.
+ * Request exec memory is read into pagecache in contpte-sized folios. The
+ * contpte size is the number of contiguous PTEs that the hardware can coalesce
+ * into a single iTLB entry: 64K for 4K pages, 2M for 16K and 64K pages.
  */
-#define exec_folio_order() ilog2(SZ_64K >> PAGE_SHIFT)
+#define exec_folio_order() ilog2(CONT_PTES)
 
 static inline bool pud_sect_supported(void)
 {
-- 
2.47.3


