Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA29FC982D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 05:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJbFWtXzdjoxqLLRP1e19uuFJMa1NhU30c4WN8jSX0Q=; b=orW7+PApnbZaqOOEQMlNKYcEn/
	NxG5LmeBhaG9+YDUcRZe7XWHj+e1g/jsj88uLRqcqRMj82ZCpe5RSpM9wZV4xaUC5TgyLihxAqCqM
	mJFacfdrfFEkEdZcTrbwWQdB+nWoKrkzxcMroshC6b0zt6Vla5YrbPp9J5/KQ8Hajxj8PwUkA/Bkh
	hYzO2RUH7IdWEeUJ8jt3v3sZomkevmc+aXYEKjZyEAUuBzBGYKnvEw9YjFsXoaV1XzMeaKvvASjvC
	9Zh+oXhl1SgSxLsJq5BprsBZ9YA6bO9yEjk5fXNbUK7rle/I5HupkHSgt1XJnVNtAgTetcw4GfRzI
	BoTTDrsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74hu-0000000AbXJ-1Bsh;
	Thu, 17 Sep 2026 05:30:50 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74hp-0000000AbT1-3ALr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 05:30:47 +0000
Received: by mail-pz2-x0f.google.com with SMTP id 41be03b00d2f7-cc4c08393dfso340048a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 22:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789623045; x=1790227845; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yJbFWtXzdjoxqLLRP1e19uuFJMa1NhU30c4WN8jSX0Q=;
        b=FKQCCwQYKxf2bfP5/dIIZv5eVWwlRlq5eYaeDaN+DxdSjhrKTziCoMKVQCFVwXqiyb
         +Gf/XMdPRG1H1wI8zA8FBEZigY4oHSFzKOlLQAlryR1QO/55a0F0R7a2Ew+deU30Do6u
         c7m135tH0qlcSSuD1X3ps3f8OMSfRxKWp5rJXj8RaRv4XcdtFtDAWz8P6wrvf7cRIwbX
         d0CZy0o8f+yjldTBKDAs+ttiuUGIN8+o48sXyWAx7BmxOVLiZa7Q046VFXVKNSJN4bym
         D0Bb+gazzFcKGQnVBhCsl/y884MWzVIP3PWEfQ9th2VKUdPjwWrZH9JjxGFfCic1xbvU
         VXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789623045; x=1790227845;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yJbFWtXzdjoxqLLRP1e19uuFJMa1NhU30c4WN8jSX0Q=;
        b=CSgloofdIBabZiblEmfd5UaFpcaeDic+o+rJ4Fx8Awt3S7B/Oj2+AiKdR/mnEirDVD
         NhBoAyxBxF+jC4LVaXuAWihoo/njc+sStae3Ya9stx3nmU0AmOad1m3/GIwaUvnK66tY
         LSkCEZsnfL0U35v9kA/8GIr0OZIzmD7vEJpn4Kfemp8oNVIM1mqP4/SxU6krAgSVIZm/
         XfL1PzMxJghuE0wKttVZxc1n+EzurSmqsj9Yag4ZqOF8+fnu/kppV1a0NBqj++93arI5
         YPZreNO83kjPENQouhIIAwrnRZNw/ej4Co4nA6L3dos7JKb1gYZQRbbI5St2TFo2qpGv
         IKmw==
X-Forwarded-Encrypted: i=1; AKwUvBzfl3N0gWBgDBxJKLFp0yUqIK2jzSesKcrVCbf37wOO9Ey0QeBe5fp4InQbUdF5zfF0GmkImyJTsfBI6w+fnHjY@lists.infradead.org
X-Gm-Message-State: AFuF++mv/5Xfo3oVKXwVh0RGLcts+5GfSn5PNM1Oa3+yuc9u801WBwF4
	UPiAOVF01Y4VVQymvA9VxevkGh2HK5QmC2Zpf50sKYwVGtxAznuohqDg
X-Gm-Gg: AYBFou3umn7kMRi4RcMyft/zRUEvHh7MGF+WvZy4pZ8uKC7FlXyR1hoa7imt4Y+Vl9S
	q9FpBcFpkNzYBmEWloPpZ4wx1VP5x+AB2AKFe4FDIogLOMAn//2rOw4wBeaOO6pSiQ/0D6RvpLC
	LDPAcrjLSZwW67cDy9k5hqJcVXEQRDPgYGgpAZe8Ydtn02VnWhZK971rUp8f9gTDedPkjvgW2SW
	ebGZs4ciK6EKdRgBaHtBJnHYHSgu3oHmwKU/8m5HI0b3tdFb84cJzD0rK0rSdAcesdMUXCzebHp
	cRx0Ce7i4i+XdetB1NpVLWX2tcAdXySwVGcJ0Qs5vwcbfvEA1vpl2qlQEbSs02HeHP4wucOEFI+
	SntV1o6q81rrXyrXTurHon+SMAfNn/ZPSayBdHP0MsAAlYf6Kyjw/OOKce/jx3raj7YY88Hxz6C
	u+q2DTCb4sPwvuKohd3m1nlFV3548zGVyyTDoGO/8jPMyWCXrpyZSsPjT+PfVeOHWc/23KkNgvs
	DTx1RcbxiiAKwWU3RhKWFMds/8=
X-Received: by 2002:a17:90b:4d07:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-39e1e2ee113mr11267726a91.9.1789623044645;
        Wed, 16 Sep 2026 22:30:44 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3abada87sm1955836a91.14.2026.09.16.22.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:30:44 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
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
	ryan.roberts@arm.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v8 09/10] mm/vmalloc: map contiguous pages in batches for vmap() if possible
Date: Thu, 17 Sep 2026 13:29:32 +0800
Message-Id: <20260917052933.188679-10-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_223045_831427_802BE023 
X-CRM114-Status: GOOD (  19.17  )
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
---
 mm/vmalloc.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 80 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index ed868afd8194d..bce2d2c09f546 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3540,6 +3540,85 @@ static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
 	return arch_vmap_pte_supported_shift(size);
 }
 
+static inline int get_vmap_batch_order(struct page **pages,
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
+			get_vmap_batch_order(pages + i, prot, nr_pages - i);
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
@@ -3583,8 +3662,7 @@ void *vmap(struct page **pages, unsigned int count,
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


