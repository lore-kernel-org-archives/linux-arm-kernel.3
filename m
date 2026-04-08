Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B123105D996
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 02:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWACzn/NB4zivog5DClhDDv8kbwG7s7bDTftmwtAbDY=; b=ePPPh1WNFujnDR6DBmg1uG+o3q
	GIZ9voOr0yksckj/KIgV3+LliC+UYfoT5s53Oj5QCdBOZfCb1kmLj0rbD0msED0pw82zz6Nw4aKST
	Ku/fSI9eMC2yjJiQfBuHP6cXcI+B13GjUR5YPBapQtcQV+xKTkM5DnWaqRhDvvBCKsMMKUOYo6C7z
	37C6CfSe2183w/k3mNSiq6idQzHQ7DTBDp7ZGtUixFy6pnPHMoR4OZ+64ydBP6sqteKXu8qbMS87J
	VMk+aj5CVB4f9yAIoYmxrlggDUfbQGL3ba1pxPzbsW7kQPSmYp40W5nFoel0SoIzY5ZDsSA9oar0S
	r5lg+rsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJ1E-000000089Ga-23Rf;
	Wed, 08 Apr 2026 02:51:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJ1B-000000089ED-1SN5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 02:51:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D816D4452C;
	Wed,  8 Apr 2026 02:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F78C2BC9E;
	Wed,  8 Apr 2026 02:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775616708;
	bh=ADjBqE0C1KfIyVTZP4SAf0I43MDC/OSOfU23K3IWy+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j51XMXfvi+Uxqq+1/UvQP3n+KERV+0p0XtWw/Uhmkna6BimHQotLAW11I6s5QRSr6
	 0crdor5UZv60wH48QovXiIHoA36Ujapw2ywR0srgEx4fVQ7Fqbt6OmZxnp6yUB6G6k
	 yyJoygwMMFIBaxuWQf3aKwv45lImLjGwWMafowo0YFHZ2LA3rHAM7XvizQqptwU20H
	 eIFEaq9hRfJZgAwFlcEzyVGomeRJMEllO2maK95kgCj7wAE8eD59Jw21DAkW1vTxgJ
	 CNFnpjcC2b94Zz11qOIM2c7yZz83pxIpgYbRw45w3/fAQZV/2ksIOpJPQ505DPR8tg
	 aTa0X/Be3f8cA==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	urezki@gmail.com
Cc: linux-kernel@vger.kernel.org,
	anshuman.khandual@arm.com,
	ryan.roberts@arm.com,
	ajd@linux.ibm.com,
	rppt@kernel.org,
	david@kernel.org,
	Xueyuan.chen21@gmail.com,
	"Barry Song (Xiaomi)" <baohua@kernel.org>
Subject: [RFC PATCH 5/8] mm/vmalloc: map contiguous pages in batches for vmap() if possible
Date: Wed,  8 Apr 2026 10:51:12 +0800
Message-Id: <20260408025115.27368-6-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260408025115.27368-1-baohua@kernel.org>
References: <20260408025115.27368-1-baohua@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_195149_433240_7F845FFB 
X-CRM114-Status: GOOD (  13.43  )
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

In many cases, the pages passed to vmap() may include high-order
pages allocated with __GFP_COMP flags. For example, the systemheap
often allocates pages in descending order: order 8, then 4, then 0.
Currently, vmap() iterates over every page individually—even pages
inside a high-order block are handled one by one.

This patch detects high-order pages and maps them as a single
contiguous block whenever possible.

An alternative would be to implement a new API, vmap_sg(), but that
change seems to be large in scope.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmalloc.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index eba436386929..e8dbfada42bc 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3529,6 +3529,53 @@ void vunmap(const void *addr)
 }
 EXPORT_SYMBOL(vunmap);
 
+static inline int get_vmap_batch_order(struct page **pages,
+		unsigned int max_steps, unsigned int idx)
+{
+	unsigned int nr_pages;
+
+	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP) ||
+			ioremap_max_page_shift == PAGE_SHIFT)
+		return 0;
+
+	nr_pages = compound_nr(pages[idx]);
+	if (nr_pages == 1 || max_steps < nr_pages)
+		return 0;
+
+	if (num_pages_contiguous(&pages[idx], nr_pages) == nr_pages)
+		return compound_order(pages[idx]);
+	return 0;
+}
+
+static int vmap_contig_pages_range(unsigned long addr, unsigned long end,
+		pgprot_t prot, struct page **pages)
+{
+	unsigned int count = (end - addr) >> PAGE_SHIFT;
+	int err;
+
+	err = kmsan_vmap_pages_range_noflush(addr, end, prot, pages,
+						PAGE_SHIFT, GFP_KERNEL);
+	if (err)
+		goto out;
+
+	for (unsigned int i = 0; i < count; ) {
+		unsigned int shift = PAGE_SHIFT +
+			get_vmap_batch_order(pages, count - i, i);
+
+		err = vmap_range_noflush(addr, addr + (1UL << shift),
+				page_to_phys(pages[i]), prot, shift);
+		if (err)
+			goto out;
+
+		addr += 1UL << shift;
+		i += 1U << (shift - PAGE_SHIFT);
+	}
+
+out:
+	flush_cache_vmap(addr, end);
+	return err;
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -3572,8 +3619,8 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;
 
 	addr = (unsigned long)area->addr;
-	if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
-				pages, PAGE_SHIFT) < 0) {
+	if (vmap_contig_pages_range(addr, addr + size, pgprot_nx(prot),
+				pages) < 0) {
 		vunmap(area->addr);
 		return NULL;
 	}
-- 
2.39.3 (Apple Git-146)


