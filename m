Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9439DEB105A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 14:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Koap7c4nmBUn1jQcRs2TKnT3RilQxG9yZc8gbf4yHA=; b=HFjZ9XkCkkzhm+fvVGNn7Wfysn
	AtKBsBTeWK78AhWMqpBJDWvkbT1NPIvzsHZQjUXVRCXOfeBgMgtwo7pRtmzQIOcJ3qFPp03s7qqB/
	KiZloVfu9X2VT17dan3jB6fvmufMLdr04q7Wd5kj5DPcHjkiXOtUi2rhbpOuZAAakcqdZwxUpk6jl
	tGbq9ZF5umvdOKqZzBTUwHfDIaE8UeuEKyKUvfP9LTqmXSagKLyhqqTIw9VStUmGRokQL+dpGj0mr
	E5VWb6q1gAGv0qRTNPWtXl5J9gyNf2NBr/APY74L9MROmUVe339SaSNktWAQIe50oDNC2u0Nm//jA
	HvsFwbug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyUC-00000009jjx-13jz;
	Tue, 10 Mar 2026 14:55:04 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyUA-00000009jhk-2hmc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 14:55:04 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773154499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Koap7c4nmBUn1jQcRs2TKnT3RilQxG9yZc8gbf4yHA=;
	b=Q7J9Xayb3tuq1RwczoR+kkYcwmbHr2IBdva+1kWyUfpOmeUqFxY8p3HhUG0VvkvFVRO7cq
	rcbAym+WsHWFr//SsTKMXbfjnthBN1AVMJKC4S1BQIu+Y4f+asu6YqEK9FjMKM6HNAuqFg
	o+kIhQjL1lj8wyLdBd5OI3jV01FKMB4=
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
Subject: [PATCH 4/4] mm: align file-backed mmap to exec folio order in thp_get_unmapped_area
Date: Tue, 10 Mar 2026 07:51:17 -0700
Message-ID: <20260310145406.3073394-5-usama.arif@linux.dev>
In-Reply-To: <20260310145406.3073394-1-usama.arif@linux.dev>
References: <20260310145406.3073394-1-usama.arif@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_075502_846992_B6DA5A9C 
X-CRM114-Status: GOOD (  12.91  )
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

thp_get_unmapped_area() is the get_unmapped_area callback for
filesystems like ext4, xfs, and btrfs. It attempts to align the virtual
address for PMD_SIZE THP mappings, but on arm64 with 64K base pages
PMD_SIZE is 512M, which is too large for typical shared library mappings,
so the alignment always fails and falls back to PAGE_SIZE.

This means shared libraries loaded by ld.so via mmap() get 64K-aligned
virtual addresses, preventing contpte mapping even when 2M folios are
allocated with properly aligned file offsets and physical addresses.

Add a fallback in thp_get_unmapped_area_vmflags() that tries
PAGE_SIZE << exec_folio_order() alignment (2M on arm64 64K pages)
when PMD_SIZE alignment fails. This is small enough that shared
libraries could qualify, enabling contpte mapping for their executable
segments.

This applies to all file-backed mappings (not just exec). Non-exec
file-backed mappings also benefit from contpte mapping when large
folios are used. Aligning all file-backed mappings ensures that any
large folio in the page cache can be contpte-mapped regardless of
the mapping's protection flags, reducing dTLB misses for read-heavy
workloads.

The fallback is gated by exec_folio_order() which returns 0 by default,
making this a no-op on architectures that don't define it.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 mm/huge_memory.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 8e2746ea74adf..1c9476a5ed51c 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1242,6 +1242,23 @@ unsigned long thp_get_unmapped_area_vmflags(struct file *filp, unsigned long add
 	if (ret)
 		return ret;
 
+	/*
+	 * If the arch requested large folios for exec memory, try to align
+	 * to the folio size as a fallback. This is much smaller than PMD_SIZE
+	 * (e.g. 2M vs 512M on arm64 64K pages), so it succeeds for mappings
+	 * that are too small for PMD alignment. Proper alignment ensures that
+	 * the hardware can coalesce PTEs (e.g. arm64 contpte) when large
+	 * folios are mapped.
+	 */
+	if (exec_folio_order()) {
+		unsigned long folio_size = PAGE_SIZE << exec_folio_order();
+
+		ret = __thp_get_unmapped_area(filp, addr, len, off, flags,
+					      folio_size, vm_flags);
+		if (ret)
+			return ret;
+	}
+
 	return mm_get_unmapped_area_vmflags(filp, addr, len, pgoff, flags,
 					    vm_flags);
 }
-- 
2.47.3


