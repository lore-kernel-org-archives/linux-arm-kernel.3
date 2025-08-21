Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB26ECA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 00:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlD9YGSFbsAaeSHrs+lmfmp3eNVZAqkWDWaUN3GbxpI=; b=uFQu3g8QA8J3H4kd0zxCcpO/UI
	/J8rZZFoUs+KdhBSmA+l86aH4Z+mphfdFvoQHlslU+0adUWOoRZdBOX12xvccB+sCcCIV/D+kIvzF
	D9kue0Oh998P5edKtj/ggoZn/iJlGgRE7tNEQSoDYvKFbLcXFkwYBBZTrQ/Tm7hXMsXuHRVL3Tije
	Tzk3Xa4+RViOcGapPkjjhAil9xQk6ah0AiHsWfhhj1CnXf0Jkum2X2RIx0uKzLtqcGZLG9+oqaaLD
	Vfu+i4K4ZmJbsBXCBJt6hWoBZXW7oz+iN6boa29ygGdVT8WUrvYjuslVONc753+4ZV71LGLS5niuK
	bOJ0E/EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFuh-000000014BX-2chI;
	Fri, 22 Aug 2025 00:45:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBa7-00000000Nwu-1Rt0
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 21 Aug 2025 20:08:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OlD9YGSFbsAaeSHrs+lmfmp3eNVZAqkWDWaUN3GbxpI=; b=mRWp+x4zz+EhPirBjjrDW/qOTT
	HqPAyrwz6p2rcG0GVSjZh2cscgu2PKQ7oMDT2jKHKqLNkR9U4V2QKzXw3YkDM7CR3wxxAqjSDgKTU
	0NEcnAxPkBbABtyBTU/vh8ewjI5ozoj51ZMRaNKGwE3c8rdx2XEz/BHS+DzLSASOCrnmybX2xaT8n
	Xl2WFiLKmanWScB/FytDuLY2v/quQOD1VwvGvc9CHSv9t9zPAFKuCqK4CTPVLG87CH9Fsn/+42pKP
	HLwsmsRl4IfyWPkUbHqSdthef7vrl4XEzYY0ITZUFT83bLdpu7PDCS6X38azF19DALrNxSnijmKbF
	2JqPEIwQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBa2-00000000eyJ-3QPD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OlD9YGSFbsAaeSHrs+lmfmp3eNVZAqkWDWaUN3GbxpI=;
	b=AGznkjssI3QK1LTzwMPL++NcqnscimgrLuQjZKNIo6ZmJAjPNUxK6W3ensE3/Cf8IyiiuZ
	GJTYPXY1yLFqM14vIw42LDb6aej9YUUD7Dlq34Tf+Ywh/L4deu9yWTyl5msjKu4org+RJW
	9pQBp+IXoZvKlLum1csv+j8TFOQpa5o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OlD9YGSFbsAaeSHrs+lmfmp3eNVZAqkWDWaUN3GbxpI=;
	b=AGznkjssI3QK1LTzwMPL++NcqnscimgrLuQjZKNIo6ZmJAjPNUxK6W3ensE3/Cf8IyiiuZ
	GJTYPXY1yLFqM14vIw42LDb6aej9YUUD7Dlq34Tf+Ywh/L4deu9yWTyl5msjKu4org+RJW
	9pQBp+IXoZvKlLum1csv+j8TFOQpa5o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-ftCBQK_cOeC8pV-91Cj9tg-1; Thu, 21 Aug 2025 16:08:07 -0400
X-MC-Unique: ftCBQK_cOeC8pV-91Cj9tg-1
X-Mimecast-MFC-AGG-ID: ftCBQK_cOeC8pV-91Cj9tg_1755806886
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b9e4146902so562389f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 13:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806886; x=1756411686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OlD9YGSFbsAaeSHrs+lmfmp3eNVZAqkWDWaUN3GbxpI=;
        b=w5MfpTLtj/PRBwygv8Gnp+g2LdjF4bFcD6eI/xwDCIIgep+h6UwKsCaElqlUy3b3zK
         H6ebiD4vdFnCumTCR1sOwcAAqvVGG8x9JLVYmqDCHJLyvYPnfRUcECGw1zByco28C8dp
         eMWRWWXf9cFt5N9MNPLsbUgcxJoxjoLcYifsE8v7gR7zXltFWUN7exiImHl4TKDdyGON
         algyzfGVl56mm+1dHkit0+x+kFJUvptT7NVcwKVQ8XIECahZChu5cKeNaVSkGwSSIFA9
         B95lqJ6527H15RBjziEuFJpl2f0cHy4Rlq9sEcP+O6Rxt+pCrY7L6p+89YZM0ZkQdjLK
         mssg==
X-Forwarded-Encrypted: i=1; AJvYcCUJd7uq27WYC9b3W0UsiZRyPUliBaEIrORkWfbkstcdCZo3K2PdR2E9c5vNvIRM6X88YAOxGfQ8VZn6H+NrTLsU@lists.infradead.org
X-Gm-Message-State: AOJu0YzslaRaRGk0TqA4ACPi5pV0raRXIOkdxajt3wzR0ytznEOk+vdF
	GMuB7QXwxqV0Mbi41QHShZMmCGxB6CB+5jWT85pKiuWTugUygpVDH+KXGFrIKEDCi3f+txyiFe6
	3Sxwqz/tUpCiif32vhE6Th+AFDKtzNlKA7MdwKa+kJBO2RqfHURQ+oqy25Od6uBf48puSxlAUB5
	ys
X-Gm-Gg: ASbGncsBw9xEBe0sULEHaIVHTN97bet+RVtnAE/Z7Erq9Wl/EBgbKzd/W9QMaIwUbIV
	SioVKVQgFhxRYxkSq8c5Uny/xvUCV/WjjfNRwyeL109pBETe+JYixpm6SNDSdEFs/ZR7XHTOqUF
	RD6r3Z+W5QTL4g7QFyzqcQN/JXsQSBCHklkmW5NFYVsu61P4MBcWvh/VIj4+/pVP+uJpJluUFQT
	zsxcyjctCks+5MfZFHZy4QhZTBR9eMKNHGzO6E+sKbtK00lS1vOCm0yjKaR2ajOmuwHVcGRX5io
	b/XGMu+yclARI5LSSY/hwHS5s+W253hdHInMd02o3qi+R4N38QUMR3iYHCQcCX3TdrhsOFAAlw/
	dw2nWMjyfJy1c1ii4WCKOsQ==
X-Received: by 2002:a5d:5849:0:b0:3b7:94c6:7c9 with SMTP id ffacd0b85a97d-3c5db4ca226mr187801f8f.27.1755806886177;
        Thu, 21 Aug 2025 13:08:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEN2zPHDTqkDZIT/HT3QVvSDWvKglll+HTpAUltvzBh+S3AYz2M0rKfptvzXjL7aLPeFpS91Q==
X-Received: by 2002:a5d:5849:0:b0:3b7:94c6:7c9 with SMTP id ffacd0b85a97d-3c5db4ca226mr187788f8f.27.1755806885705;
        Thu, 21 Aug 2025 13:08:05 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c077789d1dsm12697993f8f.49.2025.08.21.13.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:08:05 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>,
	Dennis Zhou <dennis@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	iommu@lists.linux.dev,
	io-uring@vger.kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>,
	Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>,
	kasan-dev@googlegroups.com,
	kvm@vger.kernel.org,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@axis.com,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev,
	Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com,
	x86@kernel.org,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH RFC 21/35] mm/cma: refuse handing out non-contiguous page ranges
Date: Thu, 21 Aug 2025 22:06:47 +0200
Message-ID: <20250821200701.1329277-22-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: waC4VXFPsSEiXvspgDaxyekrXOs34m22EV7CsVB0ppM_1755806886
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_210815_107710_2D91B843 
X-CRM114-Status: GOOD (  28.54  )
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

Let's disallow handing out PFN ranges with non-contiguous pages, so we
can remove the nth-page usage in __cma_alloc(), and so any callers don't
have to worry about that either when wanting to blindly iterate pages.

This is really only a problem in configs with SPARSEMEM but without
SPARSEMEM_VMEMMAP, and only when we would cross memory sections in some
cases.

Will this cause harm? Probably not, because it's mostly 32bit that does
not support SPARSEMEM_VMEMMAP. If this ever becomes a problem we could
look into allocating the memmap for the memory sections spanned by a
single CMA region in one go from memblock.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h |  6 ++++++
 mm/cma.c           | 36 +++++++++++++++++++++++-------------
 mm/util.c          | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 13 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index ef360b72cb05c..f59ad1f9fc792 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -209,9 +209,15 @@ extern unsigned long sysctl_user_reserve_kbytes;
 extern unsigned long sysctl_admin_reserve_kbytes;
 
 #if defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
+bool page_range_contiguous(const struct page *page, unsigned long nr_pages);
 #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
 #else
 #define nth_page(page,n) ((page) + (n))
+static inline bool page_range_contiguous(const struct page *page,
+		unsigned long nr_pages)
+{
+	return true;
+}
 #endif
 
 /* to align the pointer to the (next) page boundary */
diff --git a/mm/cma.c b/mm/cma.c
index 2ffa4befb99ab..1119fa2830008 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -780,10 +780,8 @@ static int cma_range_alloc(struct cma *cma, struct cma_memrange *cmr,
 				unsigned long count, unsigned int align,
 				struct page **pagep, gfp_t gfp)
 {
-	unsigned long mask, offset;
-	unsigned long pfn = -1;
-	unsigned long start = 0;
 	unsigned long bitmap_maxno, bitmap_no, bitmap_count;
+	unsigned long start, pfn, mask, offset;
 	int ret = -EBUSY;
 	struct page *page = NULL;
 
@@ -795,7 +793,7 @@ static int cma_range_alloc(struct cma *cma, struct cma_memrange *cmr,
 	if (bitmap_count > bitmap_maxno)
 		goto out;
 
-	for (;;) {
+	for (start = 0; ; start = bitmap_no + mask + 1) {
 		spin_lock_irq(&cma->lock);
 		/*
 		 * If the request is larger than the available number
@@ -812,6 +810,22 @@ static int cma_range_alloc(struct cma *cma, struct cma_memrange *cmr,
 			spin_unlock_irq(&cma->lock);
 			break;
 		}
+
+		pfn = cmr->base_pfn + (bitmap_no << cma->order_per_bit);
+		page = pfn_to_page(pfn);
+
+		/*
+		 * Do not hand out page ranges that are not contiguous, so
+		 * callers can just iterate the pages without having to worry
+		 * about these corner cases.
+		 */
+		if (!page_range_contiguous(page, count)) {
+			spin_unlock_irq(&cma->lock);
+			pr_warn_ratelimited("%s: %s: skipping incompatible area [0x%lx-0x%lx]",
+					    __func__, cma->name, pfn, pfn + count - 1);
+			continue;
+		}
+
 		bitmap_set(cmr->bitmap, bitmap_no, bitmap_count);
 		cma->available_count -= count;
 		/*
@@ -821,29 +835,25 @@ static int cma_range_alloc(struct cma *cma, struct cma_memrange *cmr,
 		 */
 		spin_unlock_irq(&cma->lock);
 
-		pfn = cmr->base_pfn + (bitmap_no << cma->order_per_bit);
 		mutex_lock(&cma->alloc_mutex);
 		ret = alloc_contig_range(pfn, pfn + count, ACR_FLAGS_CMA, gfp);
 		mutex_unlock(&cma->alloc_mutex);
-		if (ret == 0) {
-			page = pfn_to_page(pfn);
+		if (!ret)
 			break;
-		}
 
 		cma_clear_bitmap(cma, cmr, pfn, count);
 		if (ret != -EBUSY)
 			break;
 
 		pr_debug("%s(): memory range at pfn 0x%lx %p is busy, retrying\n",
-			 __func__, pfn, pfn_to_page(pfn));
+			 __func__, pfn, page);
 
 		trace_cma_alloc_busy_retry(cma->name, pfn, pfn_to_page(pfn),
 					   count, align);
-		/* try again with a bit different memory target */
-		start = bitmap_no + mask + 1;
 	}
 out:
-	*pagep = page;
+	if (!ret)
+		*pagep = page;
 	return ret;
 }
 
@@ -882,7 +892,7 @@ static struct page *__cma_alloc(struct cma *cma, unsigned long count,
 	 */
 	if (page) {
 		for (i = 0; i < count; i++)
-			page_kasan_tag_reset(nth_page(page, i));
+			page_kasan_tag_reset(page + i);
 	}
 
 	if (ret && !(gfp & __GFP_NOWARN)) {
diff --git a/mm/util.c b/mm/util.c
index d235b74f7aff7..0bf349b19b652 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1280,4 +1280,37 @@ unsigned int folio_pte_batch(struct folio *folio, pte_t *ptep, pte_t pte,
 {
 	return folio_pte_batch_flags(folio, NULL, ptep, &pte, max_nr, 0);
 }
+
+#if defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
+/**
+ * page_range_contiguous - test whether the page range is contiguous
+ * @page: the start of the page range.
+ * @nr_pages: the number of pages in the range.
+ *
+ * Test whether the page range is contiguous, such that they can be iterated
+ * naively, corresponding to iterating a contiguous PFN range.
+ *
+ * This function should primarily only be used for debug checks, or when
+ * working with page ranges that are not naturally contiguous (e.g., pages
+ * within a folio are).
+ *
+ * Returns true if contiguous, otherwise false.
+ */
+bool page_range_contiguous(const struct page *page, unsigned long nr_pages)
+{
+	const unsigned long start_pfn = page_to_pfn(page);
+	const unsigned long end_pfn = start_pfn + nr_pages;
+	unsigned long pfn;
+
+	/*
+	 * The memmap is allocated per memory section. We need to check
+	 * each involved memory section once.
+	 */
+	for (pfn = ALIGN(start_pfn, PAGES_PER_SECTION);
+	     pfn < end_pfn; pfn += PAGES_PER_SECTION)
+		if (unlikely(page + (pfn - start_pfn) != pfn_to_page(pfn)))
+			return false;
+	return true;
+}
+#endif
 #endif /* CONFIG_MMU */
-- 
2.50.1


