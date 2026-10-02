Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3FFCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SdFF897J19vB9gXlitk0PJAT4sCzBncom/C0yG9+Zg=; b=fqO4tYrb2QNEgU0By4zJTFTXIx
	/deFETyaCpG6wStAmVBBxXcZLCpAKJbRiF1W0nqPNdaSlO+MfMHEKXep+Mm4AZ+S/jZapjxsVB6fA
	J0dJv16h5VbBfPPl/WNF/EDizmFgrGYDCDF7NvrRKkkj79JLoyl/o+XorQCtAVzGSeQtRO6+OyRjg
	pHHlCEtme5onkSdVdUbSN5WnV/BVXtCzB1+afDQiOgismyanqxuV7J2jUxvIHH5Kk28N4MlZD2Ovw
	ot3AwXE4Ufyy2NogxWh+owHLfzCL68WnAWXr/AuC02ft5fQasdHUnnXlUw9XO0OvGZznbYRpVLR5v
	VNvASd4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZI6-0000000B5CO-1avO;
	Fri, 02 Oct 2026 09:10:54 +0000
Received: from mail-pj2-x2b.google.com ([2607:f8b0:4864:39::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZI1-0000000B56z-3Glw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:10:53 +0000
Received: by mail-pj2-x2b.google.com with SMTP id d9443c01a7336-2e2c7eb3b8cso18761095ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 02:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932249; x=1791537049; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5SdFF897J19vB9gXlitk0PJAT4sCzBncom/C0yG9+Zg=;
        b=qSWV55ChLa4bgnU7uvfn/xDKW7QBCBxnHvH36RL5iRnzhmcgpRH+sFPY+FXiMn0BKx
         PvJQuYKRYhXavSPA7cHHMUgzU50eaw97Fo3cdX7fQY2oBR/fnNkRTvs6H8fOn/RSIGU5
         vXTE+3SzV02rC8jaVQx2v36KtB+y7KZyn5GxMtB3tSZFdRhQ1xaOqbyLkEGLkskt+ArC
         R0QCuWdtkxjUUQ9bcEwZKmu4wR7DNCXBo9hSh0fEOXKvr0prIhhho3ItEaNvNYG/mZZy
         +EbG+tw8g9lEcL8GamfkXx9ZSUJQBqjFb1ECServYPX+fMAQpps8JXavqbBPUaQZU8bc
         2tCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932249; x=1791537049;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5SdFF897J19vB9gXlitk0PJAT4sCzBncom/C0yG9+Zg=;
        b=q30PpVCRX9CIKz8yLVSQ8DrojqmE2o1FMUL2Xbd20jr0jHL/dHCbee4UFXvxewf893
         6/ZbJKZ3eLUoQBoQMawUGbxXWFbnXNZy6dm2O8tcsf7gr3CkSvIgtBXnLUYAIDz/FzM5
         FX3HRmd+W1oa5Jux+hxpTrEWF7KIHpHe2I+nt3VTlSHrw25bN1COdnF1RivVP3b8tC3H
         EVkBgWTF9lTqYv4MhJeQuVMk1FwKP1Gcdv8OQuTYiIkAqkZj7h8MZ5omk1yerEQulQwT
         qrdqIexONqea8qiLrY+8F17ny+e4VQJAGXOOD7RESyD6mQmegN7qvUi2T48e0jYVemL8
         vm0w==
X-Forwarded-Encrypted: i=1; AKwUvBxz/E/6M9deaiDqa8h1OzYd88KhHdaxVM+2I67mIP9r1p6GEqsE7r6kJqW+wrPYNQY2fAmQKT/E8uwoahTRHz1M@lists.infradead.org
X-Gm-Message-State: AFq9FYKO8L+bV0i5tV2JlxWLg7FAvbI7uzMGWzJeoCi3WqD2S8iKwy88
	1nCA8BaEsky22Xs5dFklnkrE14ejIniKobSVEOm+1V/L+wzbMq7jE0rH
X-Gm-Gg: AYBFou01EXssmO/w+nfR3F4kzYRVpOWqIG4Czq1lfuVBT+jhIXvqy0pxhr7XPlkdRCB
	yQ+nv1NXqHyG1fsjKvufXzyx70O2zfhtPFoqhrVy6EeMhHA7yyAu40q8cYB70zi4ufLbBZodC/7
	E59YQIA8hzjo7uJUNHiclTXJmxXTz/j5v6B8A8WwaLVGX2sc0oq87oBpVZv1T9UAEgW0oZuNEv4
	PHPSJ3w+2NnPiC51BrRFZOndP4lzgzTQNUN3D9wwamyHGgqmLUf7hhr607c8El7xbltDAz+/IHC
	/on79TWxnlu2hgl5UKV6p/4S/myTpgrlBoFKSRyamXFsNCrokn/rq6gCuVR26+snuwtvKJ3aMLj
	Oybf3ZvDrOALfUuNPjxDIhkoNk/ruVcbYaGbJIUrBluxYlyUm1QV5kzskPn4xVeZhYZYcbYgrr4
	zQa43hh2Pp94QLV/7LQPLnKTC5gUgnoPtUa7lEH997HF//kVS+Wt8pwtoSHojGE9tLjvU5SmQz3
	FI95LoJEyveUpIt2xK5mw==
X-Received: by 2002:a17:903:b87:b0:2e2:f379:82b9 with SMTP id d9443c01a7336-2e49b821f87mr17258575ad.61.1790932248559;
        Fri, 02 Oct 2026 02:10:48 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ab2b9sm5480555ad.36.2026.10.02.02.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:10:48 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	baohua@kernel.org,
	chleroy@kernel.org,
	david@kernel.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Subject: [PATCH v10 09/10] mm/vmalloc: map contiguous pages in batches for vmap() if possible
Date: Fri,  2 Oct 2026 17:09:46 +0800
Message-Id: <20261002090947.869220-10-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002090947.869220-1-jiangwen6@xiaomi.com>
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_021052_515504_EDFFE261 
X-CRM114-Status: GOOD (  19.49  )
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

From: "Barry Song (Xiaomi)" <baohua@kernel.org>

In many cases, the pages passed to vmap() may include high-order
pages. For example, the systemheap often allocates pages in descending
order: order 8, then 4, then 0. Currently, vmap() iterates over every
page individually—even pages inside a high-order block are handled
one by one.

This patch detects physically contiguous pages (regardless of whether
they are compound or non-compound) by scanning with
num_pages_contiguous(), and maps them as a single contiguous block
whenever possible. The mapping order is determined by taking the
minimum of the contiguous page count and the pfn alignment, allowing
graceful degradation when pfn alignment is less than the contiguous
range.

Pages with the same page_shift are coalesced and mapped via
vmap_pages_range_noflush_walk() to avoid page table rewalk.

As users typically allocate memory in descending orders (e.g.
8 → 4 → 0), once an order-0 page is encountered, we stop scanning
for contiguous pages since subsequent pages are likely order-0 as well.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Co-developed-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 80 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index aae6141aaebf5..4acd1ec27604b 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3576,6 +3576,85 @@ static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
 	return arch_vmap_pte_supported_shift(size);
 }
 
+static inline int get_vmap_mapping_order(struct page **pages,
+		pgprot_t prot, unsigned int nr_pages)
+{
+	unsigned long pfn;
+	unsigned int nr_contig;
+	int order;
+
+	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
+		return 0;
+
+	/* Limit nr_pages by pfn alignment */
+	pfn = page_to_pfn(*pages);
+	if (pfn > 0)
+		nr_pages = min_t(size_t, nr_pages, 1UL << __ffs(pfn));
+
+	nr_contig = num_pages_contiguous(pages, nr_pages);
+	if (nr_contig < 2)
+		return 0;
+
+	order = ilog2(nr_contig);
+
+	if (vm_shift(prot, PAGE_SIZE << order) == PAGE_SHIFT)
+		return 0;
+
+	return order;
+}
+
+static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
+		pgprot_t prot, struct page **pages)
+{
+	const unsigned int nr_pages = (end - addr) >> PAGE_SHIFT;
+	unsigned int prev_shift = 0, batch_idx = 0;
+	unsigned long batch_start = addr, batch_end = addr;
+	int err;
+
+	err = kmsan_vmap_pages_range_noflush(addr, end, prot, pages,
+					     PAGE_SHIFT, GFP_KERNEL);
+
+	if (err)
+		goto out;
+
+	for (unsigned int i = 0; i < nr_pages; ) {
+		unsigned int shift = PAGE_SHIFT +
+			get_vmap_mapping_order(pages + i, prot, nr_pages - i);
+
+		if (!i)
+			prev_shift = shift;
+
+		if (shift != prev_shift) {
+			err = vmap_pages_range_noflush_walk(batch_start, batch_end,
+					prot, pages + batch_idx, prev_shift);
+			if (err)
+				goto out;
+			prev_shift = shift;
+			batch_start = batch_end;
+			batch_idx = i;
+		}
+
+		/*
+		 * Once we fail to batch pages, we expect to fail batching
+		 * for all remaining pages, so just give up.
+		 */
+		if (shift == PAGE_SHIFT)
+			break;
+
+		batch_end += 1UL << shift;
+		i += 1U << (shift - PAGE_SHIFT);
+	}
+
+	/* Remaining */
+	if (batch_start < end)
+		err = vmap_pages_range_noflush_walk(batch_start, end, prot,
+				pages + batch_idx, prev_shift);
+
+out:
+	flush_cache_vmap(addr, end);
+	return err;
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -3619,8 +3698,7 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;
 
 	addr = (unsigned long)area->addr;
-	if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
-				pages, PAGE_SHIFT) < 0) {
+	if (vmap_pages_range_batched(addr, addr + size, pgprot_nx(prot), pages) < 0) {
 		vunmap(area->addr);
 		return NULL;
 	}
-- 
2.34.1


