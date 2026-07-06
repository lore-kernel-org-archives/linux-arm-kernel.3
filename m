Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984D0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNFWYR624JFwBh3ljKITvAxXKlpnZsp/crLLuga7jzU=; b=OYxYKs8Kzu8jTVj17Cxlydj6ks
	Y0XtW9PqlZLsc3rsJ/t/KW5b8D0EFDqRkpHScIH8gkZ64NiMTNXz3efcbARng55RmCVJ6K4o/ulNe
	pT3hfzwNiIooJahGL3OAYilzSHQZarSRJ+1sR4k8DISvIvIA5fwXQ0wCK4cgr1w0ckW3LQy9myR7l
	J3d38iw/F0dEV5npg+AGwwYXfc1IvifpBL4mtTP3NtgblxFhlk7vs1Lcoa7lviXjN7KNNB56Yti9V
	SARzJn2YkAAjAARamC1sB3fPHgNFb1OD0heVVp+VdMIyxtxyPgD6eYLtFTnuS6yrQ3giIZhcXuUYb
	sU75b/AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgewC-0000000BsGC-3YSM;
	Mon, 06 Jul 2026 08:44:24 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgew6-0000000BsBM-1vcD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 08:44:22 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so1441925a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 01:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783327458; x=1783932258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNFWYR624JFwBh3ljKITvAxXKlpnZsp/crLLuga7jzU=;
        b=jErVtYMIaPOXv6CVIs/iPT3k4nWAVGEJ69gB9lX+mtZ8ljImRCtqaG4ChccvzE++OS
         O4CUQ9UgPyFjHVoxiAGz905bW8stkQ5d/CmrVWyqPau967/PtOqqxGj9NFSVh03t/jR5
         razrskX3VGemZ/lwoh/Lgw9VPemeIol3xZ+QPFFuG5aDNpCXJuYFXuaW3JOV0NTJwhoA
         ZXDERqwOa09oSePY/zchOUa57UpJ9925KCiv5jO1gBWXQk3O7U4BVf4Kw8d3gFdg0PL+
         1aRdKyn2ccKGAzNRfLtYOl8aDXyDQ2f2DXFTsagcacFeCskMDvcoY27GW9PTSB2uxtP4
         ntPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327458; x=1783932258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CNFWYR624JFwBh3ljKITvAxXKlpnZsp/crLLuga7jzU=;
        b=g0c2DaTqrGFBTHYfJGFgwYZooBjPJ2yB8ClemdmXgkIiUm+1P4YCo7tGlqrbs1aYw0
         /5uShPWT25+3rD4q8zqcLl0Dkm3ksm/DsOEDhAgR6EcdvNj2L4CgNA3l9TWntgdIf7Ps
         kg/jLI6a6oHFoYFY3M3DHJTpoghmFSnv/YlTtE31xeZ95DK9BC1+dKYB1VHSx+Top+Np
         3udu3fX4EFa4rl+HRyE2WrC4oKAiVw2KaiUG85ABH62rwas/HhiN11uMLURdYQO9fGsd
         fjtPcyuLBXYmp8AIuThT+6mPpeMykdX3Sk4pPc5PmmSlhJvwu1R5YTprmSg4VXmXQzGt
         oSWA==
X-Forwarded-Encrypted: i=1; AHgh+RoGAcE8uBw792sggZGyGArXN1lHdv+uoosNJiXZuU5u9NP1GdWbNkcvDz7MTmwYvfYniKcTabK1WYc7VIPlZv9R@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/tpYrU2x187PMNywcAKllVUxTLbXD7fP7oZmt+/p/tOpMhHUl
	PlRImsEm02B+IFzOIJmk49lhqq+MC+5AJGMIF0RQQ0+P8pQ8otI/ZOdB
X-Gm-Gg: AfdE7ckFGw8dTysD6vssfzwA1D3Etyi2M1KVKNkbOsmZxpCR76qNej+ccZJ+4g5iRl7
	hCGhkQwlXf2j2ir+LcUIRsbM47kC69Ns/nguwgs4aoLVYPx5WUHWrFz1qMj1nVFtE7o93jn4AR1
	zU7f8/26oJMwmIOMPJg6pWhQ3zq0DKkx5N+iMrd7yHe8+LvyaMO66UEhC1LP3jxoN/zVRJBiaII
	TqMrr7KXvIhWsEZKNzWVOb0aPOKiDb09zlovjtGh+9N+3xpe8EOFGiK+/ElQ6MdfK++qu/fErI/
	cXN4az1Whscm7Yvqy5iBRmMeAeyiCdb6vPDGzPoFXkReibCv62uiC/7Lo8N7oV1qXL8LfUEcmG0
	5yqVTAZjOFvBgAfW15Xsrz7khL4pL26wzOVNrtvtbba05eda92cUUyMzowHUHuT2LwkToXFf8SD
	vYc3YyeQmRlhg6FZj6fCN7QPQ6RH7tbBZlDGg=
X-Received: by 2002:a17:90b:5790:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-38280e98009mr8945925a91.14.1783327456426;
        Mon, 06 Jul 2026 01:44:16 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3812815c10fsm4524635a91.13.2026.07.06.01.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:44:15 -0700 (PDT)
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
	david@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	shanghaoqiang@xiaomi.com,
	Wen Jiang <jiangwen6@xiaomi.com>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v5 5/6] mm/vmalloc: map contiguous pages in batches for vmap() if possible
Date: Mon,  6 Jul 2026 16:42:31 +0800
Message-Id: <20260706084232.177786-6-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706084232.177786-1-jiangwen6@xiaomi.com>
References: <20260706084232.177786-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_014421_521578_B4A23D0E 
X-CRM114-Status: GOOD (  17.66  )
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
index d2a4d649af549..db0492151ad08 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3543,6 +3543,89 @@ void vunmap(const void *addr)
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
+static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
+		pgprot_t prot, struct page **pages)
+{
+	unsigned int count = (end - addr) >> PAGE_SHIFT;
+	unsigned int prev_shift = 0, idx = 0;
+	unsigned long map_addr = addr, batch_end = addr;
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
+			err = vmap_pages_range_noflush_walk(map_addr, batch_end,
+					prot, pages + idx, prev_shift);
+			if (err)
+				goto out;
+			prev_shift = shift;
+			map_addr = batch_end;
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
+		batch_end += 1UL << shift;
+		i += 1U << (shift - PAGE_SHIFT);
+	}
+
+	/* Remaining */
+	if (map_addr < end)
+		err = vmap_pages_range_noflush_walk(map_addr, end,
+				prot, pages + idx, prev_shift);
+
+out:
+	flush_cache_vmap(addr, end);
+	return err;
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -3586,8 +3669,8 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;
 
 	addr = (unsigned long)area->addr;
-	if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
-				pages, PAGE_SHIFT) < 0) {
+	if (vmap_pages_range_batched(addr, addr + size, pgprot_nx(prot),
+				pages) < 0) {
 		vunmap(area->addr);
 		return NULL;
 	}
-- 
2.34.1


