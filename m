Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55605C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93J8dJ31kBsJOKH3R1rbCLn8YwyTsJsj4AeCzglR+bg=; b=yCqcsibS9MabvO4lPob522bmZ9
	0essPsuNCnEHUGZOqG5J7s9kEJ4MsBj4J7H57qjwVGViftK2Pr/yc6rxO3df9v2UTpFsW9p67XdCm
	3e5gOi6vwfDhiC07XlpF/Jd7Szvj9+qUqwy70wkUzTvOFm6XQwFUyKyRk9Q81ZGAWjOMLcvieCtys
	H5S4ugJyVASO8EXE4yhXQMRGAkmNKkZj9bVjEQdK/6rvagF0odxv6MJnWSrsKVfulrnvVJhWECp0N
	BrbnYKooEgIn/mlZj/4JSkVH2hXSXDRBlhbAUIzkTetvb6B7Z4orPYTK5xxvg+I4/rb2GxaAYHzLW
	PJEKkaUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyQA-0000000Eii2-2cJR;
	Wed, 15 Jul 2026 12:09:02 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyQ5-0000000Eich-0foK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:09:00 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ceab75934dso48185475ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 05:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784117336; x=1784722136; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=93J8dJ31kBsJOKH3R1rbCLn8YwyTsJsj4AeCzglR+bg=;
        b=hy5KGSZ9aeJnSXSVS0o6fSIdeflBsC5pTM+ETf7wWZRt1Mym8IZToxQnKXmQkLwX7O
         81/ml+0MIBF1wN10qyyROgYQVyA4ZHWiVI2LcebxFqwbY2lnQyplqvkkp540sZs9oh5R
         oo0hz76Y0P/ryp68pbL/5S6/nDxJQpDc3vOLBNHLx//K2xYURUz4Oa5Ef6klcHalyqYh
         gdx55lyTYYUqqK6ZcQnGgdPNN0IKYhQ8NdxEtEloT5Zx2OOysPSaCmxAJ/KZeQYjg7pR
         dyoX9NXJOHzuYmm3CSaTEEdytHN5PqlSAs8uhyy4bMrFgBiv6HE9u7u6AvZzGggkLKCu
         g4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784117336; x=1784722136;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93J8dJ31kBsJOKH3R1rbCLn8YwyTsJsj4AeCzglR+bg=;
        b=U7ot1LsFtMMHb59R8qHXbL1FYQjuyVprtmrEyg2aF1Ze3TCwm8W6LMNw1cpPjaNua3
         pZTRUg8uK4eSBcdLsrnTpG1JfduPs1ZakJYnpUCFPLOwDEVvq0rZjvrrf0TU0vyZ6ZBk
         mGQY48L/X3TfB24ugmNPy1N9A+BoRc7HUoFYGYGb1K+ctevpSaWNzNdtRRle8R/Wmk0z
         6sKK3kJJgV/g26eDHdZEc8omZV5IBZXSONWkZg7ji7QgvphqOB1u2dP71xIh83CFxUw+
         24F5PgSWJkbzWnWz1KxYpOwsBANpVnF1nt4DNRUav99XZMWUILjsb9R8P9vpICiflKbk
         Mdbg==
X-Forwarded-Encrypted: i=1; AHgh+RpNblXYgYZUZdhtyFYH3K0KqkbHkiz5oXtffyTXpBLzZSP5MwQ4VylI4WDBaR9C5ZzKEMesfLsDxmWKaGYgEx2L@lists.infradead.org
X-Gm-Message-State: AOJu0YzLtyBdNwKXOwj4lTI50Y2OOgPfo0rtwGGnd3ww7kxfXMdKfuJy
	cNu+9r9VBxV7xjAJyX1O4tFv8lg+ognVATm3/bsUDhqBTKiDVPJgqObB
X-Gm-Gg: AfdE7ckJUdwkvA/tE6v/OvcBs1X9lkqD7aeim1Jmqk+2lJ9m8e58PDpp5I567EYZgRZ
	sN7arkbFa3haHYvEzm/AbbwIZTiv3v2VB0JMms4IEjLLuzt9nXkhKhdHvqkz6pHmT5ytennaw5d
	JKPlqwjvW/tUXyKUpseY/tup/VWXY0zyZ+TgKpBWRQlHr1Ytn2sd/UUPEI8tyTkXtuqgkaKwk5q
	wdZKLlqsCRImmfiIniFk6lwSMbDuTkUCLNVYDiloTmgeoXMqMmYpLTrKe3WSXFjwY83cS75EEKF
	B+stz1foaBj3LHBIZIYnrx+TDyobwjK0gI3DpiwiFsOFAoM+J3bGCSCPg/DOsVXCrRQCiFJaq4D
	l2qH5DZTuxLGJ2V5b6jDBTUsYouw71PSOeEAvrteVej7HUxIycwl2qtA7PGNRlbIB2GviEYXg7J
	+TldBZsA6CpzqLa/egKR77OBDtr7UTOEu2zVU=
X-Received: by 2002:a17:902:f686:b0:2ca:3df2:919a with SMTP id d9443c01a7336-2cf03dca19fmr22554225ad.33.1784117336405;
        Wed, 15 Jul 2026 05:08:56 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf105bc642sm1216325ad.63.2026.07.15.05.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:08:56 -0700 (PDT)
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
	Wen Jiang <jiangwen6@xiaomi.com>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>,
	Leo Yan <leo.yan@arm.com>
Subject: [PATCH v7 6/7] mm/vmalloc: map contiguous pages in batches for vmap() if possible
Date: Wed, 15 Jul 2026 20:08:12 +0800
Message-Id: <20260715120813.3609949-7-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715120813.3609949-1-jiangwen6@xiaomi.com>
References: <20260715120813.3609949-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_050857_252575_22F15F9F 
X-CRM114-Status: GOOD (  18.97  )
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
Reviewed-by: Dev Jain <dev.jain@arm.com>
---
 mm/vmalloc.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 80 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index a1e025120e9df..92f9cd5e9def5 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3557,6 +3557,84 @@ static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
 	return arch_vmap_pte_supported_shift(size);
 }

+static inline int get_vmap_batch_order(struct page **pages,
+		pgprot_t prot, unsigned int max_steps, unsigned int idx)
+{
+	unsigned long pfn;
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
+	pfn = page_to_pfn(pages[idx]);
+
+	/* Limit order by pfn alignment */
+	if (pfn > 0)
+		order = min_t(int, order, __ffs(pfn));
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
+					     PAGE_SHIFT, GFP_KERNEL);
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
@@ -3600,8 +3678,8 @@ void *vmap(struct page **pages, unsigned int count,
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


