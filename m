Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CCFCD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 05:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4nDVPNvDGaaEdnxQatYVMpRpD4mqtQtLPJNe5AMUKI=; b=NymfQxY4IXa5Rc4GIlwh80INHS
	RIbKVMpVEGjnxVzrjth9+Hcl/aAeIvh8iJA0yjZytii+23qHzSG3nKoT50p1nhwhx05mSZPWZ0VKk
	d2QDNMG+pVB9Gi+6blXr8V82CTEwK5/id0ULl0hATHMCHhtt9zqxnLJnIS/+AbvQwoBDq5YwEZRyX
	LOaGu5HTZIqQh4xbgNsrv4+drMapknY/irEhBE0/TOYRTBtN2fig71TipNr5mJwxm6TS9kHbI2sUo
	Epk8WGMEM1u0LV/Jy4FclFJ/eN+dc1j4PkZUKE/6M1mPTwpBNJ0FIZHx1HTVVKB2NBEtpbrmeqaab
	lGFCp8Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQIUg-00000009rk0-26EF;
	Fri, 22 May 2026 05:32:22 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQIUa-00000009rev-3Qi4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 05:32:17 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2b45cb89f7eso47119235ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 22:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779427936; x=1780032736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4nDVPNvDGaaEdnxQatYVMpRpD4mqtQtLPJNe5AMUKI=;
        b=YebuFrrYOQiW0byWQL88b5eivmE92pXk5h0kXqQ2vjInswEJ031JeGB+Tp8H45tBwK
         C658mhh0f48mbbKFZEwt5nJsCETwNf8kqpiHwGs+T/6Ob54Dp6AT6/WZs+FcitQ9UFhu
         kFaM23La0oXGbJQGf+9zzhYuy85vYbf+zCnP7ytdjGscJpF3X6hXrjzrcXK8sjpmdKSj
         8n0SuVYh/J+c9KxCH20ugOOE+8jRzP3KOL2cJuzOb7DY2mN4p4MSmlfvKXLJHoHM97iD
         F3AhYGZeVSTk78qPggRzwjO8ilwgdjt+CqOeck8mNRgH0kq+uH0CEcRaxUpYPVp8YoEF
         BLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779427936; x=1780032736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G4nDVPNvDGaaEdnxQatYVMpRpD4mqtQtLPJNe5AMUKI=;
        b=LbfSpFTSCLff4IgA2XkqMjWaFlGBVJ5SetXiA8VmJ6fe9tzcU8p/LaAQK4vCfpai2t
         DnOuhQxyrQwHF45x6rcvRk1pKvA+IiTkrbtmhUKA2D4iblj+IbXRX/Oxoi1ke94EERAI
         BzVEgRlRiE21cGKrLBzm+8TctG//RyNecmDayt5CHf6iHww4wb20+YJwr0JwpTYfOk7q
         taLe7xHf9wFl7fOKk5b7zYqJz3+wkqAfGIEqdPNfj2/XfcByQ3w6NebNfmh6XK1JowfI
         zJlEXuHnokydC7/ypcoqZVdLjpudbXFSeShtheUTctv/As9kcOD7zL54NSnLcNCFNtIX
         Kg9g==
X-Forwarded-Encrypted: i=1; AFNElJ9EDRrLO+SuZEiqh+Io6jspM82yFamfxWJS12yB4pGngiJAtziFAKsf3mpq/0O04gDUqiyK1zpHvUwRCy2Mf9aV@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj2xuFOSZU5QM+G7XLArJLKOBlzYW6lerg9C/CMTmTKcEngjVq
	cEld30ns+llJJxekNzLCrcqif0dguLO3cidSIiuiB4mVGG6gedr4GZk7
X-Gm-Gg: Acq92OFyZWhdUBDbdhRpCekIPMnIAFqdNmQRNQWmUWY1cTwBliQK4q/B/x20GAz142Y
	OGc0Y1rSpJdOe9Nqhe6/7YQcevE9dz9+P5+PbpHzLMjmJYUWnp2owx/l4vYrsjjqy06UcB5Posh
	nvvE+1WWNDQ8OvNzch3SuU7/Hxsc1PT6L5DEwh8fOwhJX+6AiX0cP0kQEVPIRIg5xPPgYFVfVja
	/f6vmGk7aT8m2k64q/G0dhR4H84/rd9lZKO4IQLe1A3sEIw2wT7dCjxZVDRWPoIMVlf/5umtoIc
	LzlPvt/Vmp80C1ITh0Z2lRD91imfH8IHNTDvs12p1UrPSvA1AG6YPR8doaSxHC5dn/hCqbMeZQY
	THe9nXuUIefVu/us1zo2kck/+itwxmq8622LTTuFhC5PLM+yEX3x16YRB9FpvdC19bqUzPLWlT7
	ZfLt9xdK7rQhqHFWMc+gdTX/4XgMDLwQCi/mttmUUGGd9PCVBVQ+8o1uVOGfhYIw==
X-Received: by 2002:a17:903:2c04:b0:2b4:61cc:37a8 with SMTP id d9443c01a7336-2beb037a5ebmr22161795ad.17.1779427936265;
        Thu, 21 May 2026 22:32:16 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56d68adsm4782665ad.32.2026.05.21.22.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 22:32:15 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	urezki@gmail.com
Cc: baohua@kernel.org,
	Xueyuan.chen21@gmail.com,
	dev.jain@arm.com,
	rppt@kernel.org,
	david@kernel.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	ajd@linux.ibm.com,
	linux-kernel@vger.kernel.org,
	jiangwen6@xiaomi.com
Subject: [PATCH v3 5/6] mm/vmalloc: map contiguous pages in batches for vmap() if possible
Date: Fri, 22 May 2026 13:31:45 +0800
Message-Id: <20260522053146.83209-6-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
References: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_223216_863936_D27F12A0 
X-CRM114-Status: GOOD (  18.75  )
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
whenever possible. The first page's pfn must be aligned to the
mapping order for the batched mapping to be used.

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
---
 mm/vmalloc.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 80 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index deb764abc0571..50642246f4d40 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3542,6 +3542,84 @@ void vunmap(const void *addr)
 }
 EXPORT_SYMBOL(vunmap);
 
+static inline int get_vmap_batch_order(struct page **pages,
+		unsigned int max_steps, unsigned int idx)
+{
+	unsigned int nr_contig;
+	int order;
+
+	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP) ||
+			ioremap_max_page_shift == PAGE_SHIFT)
+		return 0;
+
+	nr_contig = num_pages_contiguous(&pages[idx], max_steps);
+	if (nr_contig < 2)
+		return 0;
+
+	order = fls(nr_contig) - 1;
+
+	if (arch_vmap_pte_supported_shift(PAGE_SIZE << order) == PAGE_SHIFT)
+		return 0;
+
+	/* Ensure the first page's pfn is aligned to the order */
+	if (!IS_ALIGNED(page_to_pfn(pages[idx]), 1 << order))
+		return 0;
+
+	return order;
+}
+
+static int vmap_batched(unsigned long addr, unsigned long end,
+		pgprot_t prot, struct page **pages)
+{
+	unsigned int count = (end - addr) >> PAGE_SHIFT;
+	unsigned int prev_shift = 0, idx = 0;
+	unsigned long start = addr, map_addr = addr;
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
+		if (!i)
+			prev_shift = shift;
+
+		if (shift != prev_shift) {
+			err = vmap_pages_range_noflush_walk(map_addr, addr,
+					prot, pages + idx,
+					min(prev_shift, PMD_SHIFT));
+			if (err)
+				goto out;
+			prev_shift = shift;
+			map_addr = addr;
+			idx = i;
+		}
+
+		/*
+		 * Once small pages are encountered, the remaining pages
+		 * are likely small as well.
+		 */
+		if (shift == PAGE_SHIFT)
+			break;
+
+		addr += 1UL << shift;
+		i += 1U << (shift - PAGE_SHIFT);
+	}
+
+	/* Remaining */
+	if (map_addr < end)
+		err = vmap_pages_range_noflush_walk(map_addr, end,
+				prot, pages + idx, min(prev_shift, PMD_SHIFT));
+
+out:
+	flush_cache_vmap(start, end);
+	return err;
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -3585,8 +3663,8 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;
 
 	addr = (unsigned long)area->addr;
-	if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
-				pages, PAGE_SHIFT) < 0) {
+	if (vmap_batched(addr, addr + size, pgprot_nx(prot),
+				pages) < 0) {
 		vunmap(area->addr);
 		return NULL;
 	}
-- 
2.34.1


