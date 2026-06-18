Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C8CCD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 08:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OaoSxKyClWE3jnYRtJaf7Jb5FKch1UvGKeE4Hl6seUo=; b=SgRMrpkBn6eiq2hEePRw76HFt0
	dPy9cBFsqZP0q8Fvd3FpHu1DBo8WAKBWiLp6FZstGjr2l3KCXgH0gvq9NV4HXhVWO/nvpysuUB0Ns
	AXKfsZ8tw+L3a0vOowpoQUNRCvvfeYgvTykxrJ/XvNi75TcMOswo/kmORvQAq8TNE6w+j4YBkGDIR
	9N4cW7QRvur7M8BDemnJDV+IM0zvxEyptz9MgGvBDWAVSN7JLwOxAW+3hGTFpaXLlDKdRQHFVWCin
	nZjdVdRFTFW3Ygouq2E2ySFEI0+f6GJwF89j9CvinZusrZSXA0R5GkDuU1ew+3rpX2ZJdVPWIPcxj
	rVVpfo6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8Pr-00000000s8K-13yE;
	Thu, 18 Jun 2026 08:48:03 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8Po-00000000s5i-3Twn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 08:48:01 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-36bcbd7821fso221882a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 01:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781772480; x=1782377280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaoSxKyClWE3jnYRtJaf7Jb5FKch1UvGKeE4Hl6seUo=;
        b=ACfnOdVHjz5ePFqX04eoz3FTaVKH/5QuNzKcO1U2wj4806IGbG+SHZ1nD41fNOaGcT
         QTyC3DU0lOEGH3Wd8gk1mzaK6/XTPNwePWaSnNQ9HVpJe6a8C4voZcbAR9B+VYx7zvmo
         Ki8KEkn17BfpI7Aa+t1uk5+4ZC0NiH3qcmmJSX27XoRoe9xLWYRZOqV5AkTVkzSR4rOF
         xBy7c0KrYvY6bdoxeGNRqhg/emSdp+dTdntz8jTrJvGh4bRdifbHXSDBO2AbpUMU8nIq
         sJF7f3z0yItqmmHQRPLti2Coz0y0lk/3gShnLS3NA62mBnGC3sAPMF66y57DU5KX92Ux
         2Qxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781772480; x=1782377280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OaoSxKyClWE3jnYRtJaf7Jb5FKch1UvGKeE4Hl6seUo=;
        b=In7u7HGC9wkgBzKDAgMqWz+oIAeJnyIyW1lUrFrGy1NzJJ2d+qPwuKtKIeVqwhe08G
         lLPtJj9hQtlmdHE7XxC0nJMgh65YUqYt64ybAOXhLPjWUaZdjmY6JR2askQz6MNYKwcf
         KldwH0jghek2UNXss8DvVURXlRgcog6ttNBZJsvZxRwsSBwRUfhet4rGsm4hdbH0tbCA
         G6o5dTfap3JqyEoscWgkzyApLes/yXK9FSWQs7WNncxs7W2a5xBJujvqlGaL0eO1JMWu
         kNIvx41ZoY2wGNgFSlofeBf7xfWEBBvtfQAt9NZkhT/AX13uoPUser+FAQ714WZevdWh
         Vcag==
X-Forwarded-Encrypted: i=1; AFNElJ8Bzesz3JJ7yN2OZbWLHz07bgzpRm9TxpdjeIUJPVsPjSWbcM1IR20v4mnLQWKyhNDFgNfZO9XkWeiiUhANKePV@lists.infradead.org
X-Gm-Message-State: AOJu0YzKYs4DY4E6ZG5k8686uHEO4A/AjRVBhviUO0TepV6U5GZbTdnf
	BwuNeXEYBnqdTFkli5hPxdajzUM2cx2V/30odeBwZhbVnOfH578Xr+Z0
X-Gm-Gg: AfdE7cma7Wpellh0iFRvzTjt/f5We7aXedyZpmmoFPoLupyI/iV+j3t0RJOKg7BeyzZ
	AreYQHwH/oiwyzp0WtgY+IqUgVZoTXPfHEL2aYLU1DMZDo/oKd/Ev8d8TS+yXYe3N0DPvGEY/Eu
	EPCKfRAOn2J5RwPR/hqNaE62mGjmCh+bwApwseKbaYoW1HxJD1weFTo+sfmHa8/ehXyrzwRYyAj
	U60nqVvL2LGk1TrttrnAW/9SSLcZQsjQZgF2k8nUawEdYtgA1CKYwb8bAANf73b6Jsrcpw4TKyv
	2pwKs7MSL004BF0LPhuxLQtRPSrFRuRMSWnA4IEoj3vnc/SUVpZ4Al16N0+7p8qWrA+ZrKWKNo7
	rIIgdT9FSaNRQXlVxCYm1rJ7BjtT0qAIbCvb/Tk/Yv1opIH0VKn4W4xnksTsgNCP7lF0Mjha/dX
	DoUWEto87Fk8fG71A2CaN/2IyI9/fZ0xyKuSQ=
X-Received: by 2002:a17:90b:1dcd:b0:36d:f28a:c5ee with SMTP id 98e67ed59e1d1-37c9ed08579mr7793228a91.25.1781772479946;
        Thu, 18 Jun 2026 01:47:59 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521d8e7bsm8628856a91.5.2026.06.18.01.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 01:47:59 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
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
	jiangwen6@xiaomi.com,
	shanghaoqiang@xiaomi.com
Subject: [PATCH v4 5/6] mm/vmalloc: map contiguous pages in batches for vmap() if possible
Date: Thu, 18 Jun 2026 16:47:25 +0800
Message-Id: <20260618084726.1070022-6-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
References: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_014800_874887_ED99430A 
X-CRM114-Status: GOOD (  17.76  )
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
---
 mm/vmalloc.c | 87 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 85 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 253e017130e09..fffb885cb2158 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3545,6 +3545,89 @@ void vunmap(const void *addr)
 }
 EXPORT_SYMBOL(vunmap);
 
+static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
+{
+	if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
+		return PMD_SHIFT;
+
+	return arch_vmap_pte_supported_shift(size);
+}
+
+static inline int get_vmap_batch_order(struct page **pages,
+		pgprot_t prot, unsigned int max_steps, unsigned int idx)
+{
+	unsigned int nr_contig;
+	int order;
+
+	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
+		return 0;
+
+	nr_contig = num_pages_contiguous(&pages[idx], max_steps);
+	if (nr_contig < 2)
+		return 0;
+
+	order = ilog2(nr_contig);
+
+	/* Limit order by pfn alignment */
+	order = min_t(int, order, __ffs(page_to_pfn(pages[idx])));
+
+	if (vm_shift(prot, PAGE_SIZE << order) == PAGE_SHIFT)
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
+			get_vmap_batch_order(pages, prot, count - i, i);
+
+		if (!i)
+			prev_shift = shift;
+
+		if (shift != prev_shift) {
+			err = vmap_pages_range_noflush_walk(map_addr, addr,
+					prot, pages + idx, prev_shift);
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
+				prot, pages + idx, prev_shift);
+
+out:
+	flush_cache_vmap(start, end);
+	return err;
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -3588,8 +3671,8 @@ void *vmap(struct page **pages, unsigned int count,
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


