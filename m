Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4480CC98309
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 06:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEaCg+SoOuqpLOGmqy1zgShmdKDFtyrROF+HoSyjUpM=; b=kQXzrK2zD7bfjJkdzbhjdZwajY
	gB2LmNv6j1WsnLtUdnCvkydEXl/nKLiOqzG8YwzqFezQwgzPjXSm97Vh+BVnFlkvlton4jAsRZ1E0
	2f9HivCWk1bM1SAc4LxA/LxBPOZvzVqy+0LiU65BZKx1ccvfFLSOUiuGQFEUtk8BpSdxnPh277c8y
	bONerrM+xSSXWkTHvcCGUETRsTBalIY3Cs7qos0x7VJ36WIpYg7965I93eZty5LyrXPTDLGQijwte
	sLl/bqSHrnjynWRDJQhJnfhHGCzebgp44gpVKz7t+RFUdrnSCuVeZ7UMjHkMr4JxOuOtA6lghoW15
	GCUvjaDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GU5-00000007Hf3-0tft;
	Wed, 23 Sep 2026 06:29:37 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GU0-00000007Hc9-3s2F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 06:29:34 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2db18fe433fso2719635ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 23:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790144972; x=1790749772; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dEaCg+SoOuqpLOGmqy1zgShmdKDFtyrROF+HoSyjUpM=;
        b=ZGe7q7eryn3H5AiVtIlwTSaw5LlxRxYPzR9cGFAEU4c29XvKT9/U/E+tRaS38EJekL
         u4sKUJzzRlKXhnmymWmQ/I3hfZoHBzE36ZEM16C7fy+aCvgu08EnEgqEyG0TfbFWoIZD
         jnebP9SygtOXFXUI76Exm+U9agKOhS+OoU4e3TeEXuwpCg5mB4NGIPEZnVUYwl46nbe5
         3JPTWRUQmCxSBZPXD2BleTdrwkWBJs8hgfPwuD5/f/2Y6c7t6OqLMXJpkP16EHg2zGXq
         gx1WwFqTn9+EBqunqVX9pDu+ZD9GXe3Hx107/iXkuYppGLeGxkFOOJfGSlA1wEhWJxdL
         lZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144972; x=1790749772;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dEaCg+SoOuqpLOGmqy1zgShmdKDFtyrROF+HoSyjUpM=;
        b=2e3n9MxLzyaA07g3IS9hAUroJI9SuigfbcVomcPstaZqEsisEbSUs61L9dyIHolw53
         m2xmQoiW6xWXhdIHBsZgk9O+aixQWuYNlsRH6s/apd2RcpUVIQFs0d94CZyXlFb0Q67S
         ngAMf0vcETi4stlqdrl1Yh35+E4PJIPU6B5cwrzUmhK1KncoPrNgCKWb9hXe7vz6lxmn
         Zh+LatYJaRxbhe/BfBSvxSi6EQW+tq7epZ/+0UQrYUJmj4ehiY+GqYAQp5ETL7nWbroi
         sO0gNkacGayt0OQVyiHG/b6zp9OlVEOnnC5Ap9wC3slaCIrO8d4YpiPIQN05pUoRW+gt
         dAUA==
X-Forwarded-Encrypted: i=1; AKwUvBwEphwLJ44PH+Ppv5oXB1dj0fS+sXWoqqj3PCCnum4IeCfylbOGysjvr+8SOWVhcAqVSEwhc+KnIk2CzFomz7Pt@lists.infradead.org
X-Gm-Message-State: AFuF++mvnHLyJd3y3QePcWqrYT5sAJNd5U1F0WmxTCBWhlQ+Y4cqAxnu
	77GGEMqMv1bRDwctthYBLH9ni/CNKwcvOnU+JSSa7pq8mLP6vlVfLekV
X-Gm-Gg: AYBFou0i7TROFE+1pEPnq3oBXtMzxcd8tMlgmf52rQaGqgCWKyGl2yQC/8BkkEAFE/Z
	BPcn50tKFMq/VzgXCLs0Kkv5WfcEAeYO0O5tb6HSRjEbdfqIOMaCO0iiNECy+8ung1VRdzJkiL5
	bseLWcobvTXftyQiE9OJOrcwoxFbcdCVUA+SWgB6Vra47Qt0kAI1YDy7/mUd9Pm7AGmNOBDdq9q
	3wtPl/TmBpgtVh/5jvOObyPjP4lFVnJapxVJq27p8llDGN8Mu2ty1kGrro8e5FxMBtrXG6KiOUg
	QI7tTS93NRdJ9hSZvK9lGTvq4fqDfAEet+1YFTjK96cNuMzfeN0WKbrAeYXkoceqRyw1Wsp24r1
	pqvFozFTIAQZ2tNwO7LmMbY14whalakTnwFLFyidBRt8PzTuTc5yfzKr8E+eSWPk9Sle10wumqI
	U534Dsm8J6mY61WwsYeqn06wfan7S1pNYuzmZZaI3EvtzCltBo+DvHaAMcXCD7XAWEmZk2yeyBO
	uZLrv4mlSkeqJtt3PaBlg==
X-Received: by 2002:a17:902:db0b:b0:2dd:c100:b2c2 with SMTP id d9443c01a7336-2df69e01d0cmr15666125ad.45.1790144972237;
        Tue, 22 Sep 2026 23:29:32 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516bfdsm5620465ad.5.2026.09.22.23.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:29:31 -0700 (PDT)
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
Subject: [PATCH v9 09/10] mm/vmalloc: map contiguous pages in batches for vmap() if possible
Date: Wed, 23 Sep 2026 14:28:31 +0800
Message-Id: <20260923062832.479455-10-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923062832.479455-1-jiangwen6@xiaomi.com>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_232932_996405_49FBC83A 
X-CRM114-Status: GOOD (  19.74  )
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
index a43965016eb4d..37cddb7f45a4f 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3576,6 +3576,85 @@ static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
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


