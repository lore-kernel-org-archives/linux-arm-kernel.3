Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943F8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 07:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8Oygze3XzRb05aYksCWsf/9oFhF4JAfcwkhh/Ls9Y4=; b=rOMyk7obCxoxEaZT1G2I8/N9gh
	pKny3MmwLv22VAD361avjc0oJ2v86YXRSxg0lJ1RnRiwywATW5x8grTcZQ8IKEHByWEWQZBIkSuCG
	ryUm++0reL0iioWPPOIsja/Cpq6f/7erUJL0xCJwN3oMMypSX89tNuGJGvnEGnKclWNKJiyvf1uQx
	Ln31/M1zNdZjIb2tpwNQqkX+jGFEFFagwH6x2d2PTXaIaAcc3y/mvtDS4iC398bRbILUPOzLTECD/
	fO5isLzFviNTCLexSL92WEQ4yfx6UECaqfXTB0AL+dF96W5Z2UtQjM/WJUvSg2wW7CFR9VZNnIrsX
	TYBi+vmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjLe-00000001KDh-0W5d;
	Thu, 09 Jul 2026 07:39:06 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjLb-00000001KBp-2iGw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 07:39:04 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so408717a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 00:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783582743; x=1784187543; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X8Oygze3XzRb05aYksCWsf/9oFhF4JAfcwkhh/Ls9Y4=;
        b=gUgVdL5eVYVUPYTyOkg0WhMuhJSlqYP+TFL2mC6inAUbuEuq5TTLMNHGBookQq2NCx
         W05ZNYaC9/wn5K8uw9PHhRS4h4rrcw4AbI5EO14bjqGXtTZ7kqjPWQcYHlc3409FLCqC
         awceLe101KTYgv4IdFYT66vzSLKkrg6S/OxxAIamFXzLBDLl1vFrVzhDHOAxkjL6A4Sj
         9An5vMNOxI2GcONW8GBCHoILhk1dckbS/ipccfYB8MWlseUGlush+LGumGz41XEME4xa
         giV12rWyblUJg80DJWXV6rPGCw0yUInmC5do3+nvNRn6f7SRUoLSn9yqXrufwFSnTbhk
         cCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783582743; x=1784187543;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8Oygze3XzRb05aYksCWsf/9oFhF4JAfcwkhh/Ls9Y4=;
        b=VRdvQDtbu2Gh8ysqDSnLiYBENWrt7NJ4rLm/2gvMfUV89r2BC6kntkoEEUAeOqnCJy
         g2ccKrATsd29/8FXQ0nrZDsZ1jQTrojn8qsubXOXCNluH3W5AJw94dZh8XZxHuxmEzqh
         sWI8P8z5K/8RCVQWm18cK2SyN+eDHy0ZohO4UKye4pcsP9oxMJiX6yjFq0potVnM7nK/
         3dROoaFcnopZTWtfMaJcjYCK+pRZaWEoSw/t7NTa1qJq41vaFEFQ00g77qQw/22lL8kt
         1t16dxNqlWTyxLHVYrF+sr5TAfb89MQ8yBkoOvatCXYGDgEl/8LQ7jnsrSyYjICODZaM
         bbrQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrkf+7eZPPFGNiEj3vibIIBla7paqN+XufHLh+d49nBhXWFjFSGosgHecuZnoq1GgFToDAbNoUao+S6JCcbbE6p@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6Ehpzd+xAEDGvJFyZyMl9BMr9BaweTugGtVLTnl4qztP0/Ncy
	SP5EEU/6dcLT/O90tiGpR5OuCOgQVYoe98eD6Gk2uPySW+iZyKVBDxkL
X-Gm-Gg: AfdE7cmNYPu/+9M2EyDsa3q+zHHkuXD8q/VM2VGgpl8fN5N1+V6BylLWAE+AZS5UNj2
	wv7Q2V7ohYk0SkosfxFYxGCaqehrYJ63k4PFAT/mWkE95D0X75t9FFeoMmQa1dGgVl0H4tamt0V
	gjmpW1zrWALvf1Ak1PUhqeZNbssUrD2554dYmFcaNsiTUiwfAXZMILC3wKM1WeE4vyhpxJx6FdJ
	uG0MdCR51pBMidLoyWagIj7S8UMKTI43j6WW1Xnafom7/YVjwKcaQguPEdHGlVkx/b7qh1LBEWW
	Fv22QefMEfTFy2qJaI7shGlU7wxrG3aYlFXmbQLHnUCk4u2VJj4ty0nWws7jODGWH2FgzRZ84O3
	aYaowh8vZzBkSz4lzNaL6GxQtBPFp3CKbfjHmTQt+wyLvZFo62DI1r/mBNBO/L5lDR5zIlX5dn7
	AhSun4cASRI0Ww7fQd2jpjG3JsMSe2dmCY77Z19AExcRHAzg==
X-Received: by 2002:a05:6300:2189:b0:3bf:98d3:f185 with SMTP id adf61e73a8af0-3c0d67a2905mr1940598637.14.1783582742678;
        Thu, 09 Jul 2026 00:39:02 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3162a49sm3334902a12.15.2026.07.09.00.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:39:02 -0700 (PDT)
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
	"Barry Song (Xiaomi)" <baohua@kernel.org>,
	Wen Jiang <jiangwen6@xiaomi.com>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>,
	Leo Yan <leo.yan@arm.com>
Subject: [PATCH v6 5/6] mm/vmalloc: map contiguous pages in batches for vmap() if possible
Date: Thu,  9 Jul 2026 15:38:22 +0800
Message-Id: <20260709073823.6643-6-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709073823.6643-1-jiangwen6@xiaomi.com>
References: <20260709073823.6643-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_003903_699519_B23D3F5E 
X-CRM114-Status: GOOD (  17.73  )
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


