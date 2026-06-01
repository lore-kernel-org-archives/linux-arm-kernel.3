Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104E5CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 10:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPZZdv/NbNMHW5NCcV0iaaUZxovjPZu3VG+R2rQdX+U=; b=mqaeuvgpLf1tYBZGvzsqJJIqRv
	dNh+aYpzUr4Iam9oSh91J5xgjf0v56J0JydRLeGDUuptOe/hbtfy/YPRL4z3is9y3eFno7WUMoOx1
	L7Cj3ZMtLwFEkGWRqQb+7wGN5ibSgDY8lZL/HbbhjmwwfFVa/PizmHcMMo3t57LbYQLSajZmITevI
	fHjIsiq2xF19Kl4TaI198gSEKTw+UwgW0M3o1Gf9xM8bi37FE6LoTt5SlBerMdP1jWhVb5hxBFh89
	Qfhdi8eTmd8/BQxcBCrf3vt0loZ749Sxx0oePP7l5SWnybCSVFlccr3Jfd95MLAf6HVqJjHxHPCY+
	h+1IXj7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTznF-0000000Abh9-04n1;
	Mon, 01 Jun 2026 10:22:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTznD-0000000AbgH-3Bx1
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Jun 2026 10:22:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=oPZZdv/NbNMHW5NCcV0iaaUZxovjPZu3VG+R2rQdX+U=; b=pknYAhVvGpRPPBtjFcxPOqB9Og
	meXW+HWeoFJuhNloCBH4wYwg9gy9e3/FMD+p9p/N/uXC7gHhV/z7wDDcsPfUDBvs3G55rEogD1HTy
	gKYkkoQd+31cC5jz8Uq+HmxtGA6bKnmVbthPhntQGb1kraC7UTjYRYiRKNpD36dPd5SslTmSYyFN+
	5Kp3CYwK+ujgBVYV9l5y9Kn4vrWk1utvHEIBDwDolrjZZRMaYikEOXLS7UDiWBid8tTB5RmHPJLHP
	lsWQQWTz5jafScunXuaZHqm+h0jRj/ePRf1BBWjcOTt7n12OndTUjFbPBLRlFPMTPszChVXZCCvNF
	iD6/U6nw==;
Received: from out-174.mta0.migadu.com ([2001:41d0:1004:224b::ae])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTznA-00000006NCO-2OBI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 10:22:46 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780309352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oPZZdv/NbNMHW5NCcV0iaaUZxovjPZu3VG+R2rQdX+U=;
	b=p7dsjWCHL7EpFMCaLyQrf7JLU/eEAG83YHK41hodap461fEKBTCpvHcg6QaMvbIVabbEuD
	rDXBjEqPL6/pOhxj51YoHh1WwSj5xBhRRt9AWX50DXF6rv3q1XKIBhQBBSGoDKv6cg4/fP
	JZs/KGtesM/+F98iHSLMIvREohG76CM=
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	willy@infradead.org,
	ryan.roberts@arm.com,
	linux-mm@kvack.org
Cc: pfalcato@suse.de,
	r@hev.cc,
	jack@suse.cz,
	Andrew Donnellan <andrew+kernel@donnellan.id.au>,
	apopple@nvidia.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	brauner@kernel.org,
	catalin.marinas@arm.com,
	dev.jain@arm.com,
	kees@kernel.org,
	kevin.brodsky@arm.com,
	lance.yang@linux.dev,
	Liam R. Howlett <liam@infradead.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ljs@kernel.org,
	mhocko@suse.com,
	npache@redhat.com,
	pasha.tatashin@soleen.com,
	rmclure@linux.ibm.com,
	rppt@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	Al Viro <viro@zeniv.linux.org.uk>,
	ziy@nvidia.com,
	hannes@cmpxchg.org,
	kas@kernel.org,
	shakeel.butt@linux.dev,
	kernel-team@meta.com,
	Usama Arif <usama.arif@linux.dev>
Subject: [PATCH v7 2/2] mm: use mapping_max_folio_order() for force_thp_readahead order
Date: Mon,  1 Jun 2026 03:21:18 -0700
Message-ID: <20260601102205.3985788-3-usama.arif@linux.dev>
In-Reply-To: <20260601102205.3985788-1-usama.arif@linux.dev>
References: <20260601102205.3985788-1-usama.arif@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_112245_001918_ABEFA255 
X-CRM114-Status: GOOD (  18.84  )
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

The force_thp_readahead path in do_sync_mmap_readahead() is gated on
HPAGE_PMD_ORDER <= MAX_PAGECACHE_ORDER and always requests
HPAGE_PMD_ORDER / HPAGE_PMD_NR. On configurations where HPAGE_PMD_ORDER
exceeds MAX_PAGECACHE_ORDER, notably arm64 with a 64K base page size,
VM_HUGEPAGE mappings cannot use this path and fall back to the non-forced
mmap readahead path even when the mapping supports useful large folios.

Enable forced readahead for mappings that support large folios and request
the max folio order supported by the mapping, capped at 2M.
2MB is chosen as the cap because it matches the PMD size on x86_64
and on arm64 with 4K base pages, so the size/memory-pressure tradeoff
for folios of that size is already well understood. On arm64 with 16K
and 64K base page sizes, 2MB is also the contiguous-PTE (contpte)
block size, so the resulting folios coalesce into a single TLB entry
and reduce TLB pressure on the readahead path. This will result
in 32M folios not being faulted in with 16K base page size for arm64,
but with contpte, the performance difference should be negligible.

The final allocation order may still be clamped by page_cache_ra_order()
to the mapping and request geometry, but this gives VM_HUGEPAGE mappings
on such configurations a large-folio readahead request instead of
dropping back to base-page readahead.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 mm/filemap.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index a16b33e0fc71..9cf89efaf3f1 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3312,14 +3312,26 @@ static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
 	struct file *fpin = NULL;
 	vm_flags_t vm_flags = vmf->vma->vm_flags;
 	bool force_thp_readahead = false;
+	unsigned int thp_order = 0;
 	unsigned short mmap_miss;
 
 	ractl._max_index = vmf->vma->vm_pgoff + vma_pages(vmf->vma) - 1;
 
 	/* Use the readahead code, even if readahead is disabled */
-	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
-	    (vm_flags & VM_HUGEPAGE) && HPAGE_PMD_ORDER <= MAX_PAGECACHE_ORDER)
-		force_thp_readahead = true;
+	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && (vm_flags & VM_HUGEPAGE)) {
+		/*
+		 * Cap max THP order at 2MB: this is the common PMD-sized
+		 * hugepage size, and it avoids memory pressure from very
+		 * large forced readahead when mapping_max_folio_order() is
+		 * high (for example, 128MB with 64K base pages on arm64).
+		 */
+		if (mapping_large_folio_support(mapping)) {
+			force_thp_readahead = true;
+			thp_order = min_t(unsigned int,
+					  mapping_max_folio_order(mapping),
+					  get_order(SZ_2M));
+		}
+	}
 
 	if (!force_thp_readahead) {
 		/*
@@ -3354,17 +3366,19 @@ static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
 	}
 
 	if (force_thp_readahead) {
+		unsigned long folio_nr_pages = 1UL << thp_order;
+
 		fpin = maybe_unlock_mmap_for_io(vmf, fpin);
-		ractl._index &= ~((unsigned long)HPAGE_PMD_NR - 1);
-		ra->size = HPAGE_PMD_NR;
+		ractl._index &= ~(folio_nr_pages - 1);
+		ra->size = folio_nr_pages;
 		/*
-		 * Fetch two PMD folios, so we get the chance to actually
+		 * Fetch two folios so we get the chance to actually
 		 * readahead, unless we've been told not to.
 		 */
 		if (!(vm_flags & VM_RAND_READ))
 			ra->size *= 2;
-		ra->async_size = HPAGE_PMD_NR;
-		ra->order = HPAGE_PMD_ORDER;
+		ra->async_size = folio_nr_pages;
+		ra->order = thp_order;
 		page_cache_ra_order(&ractl, ra);
 		return fpin;
 	}
-- 
2.52.0


