Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A68ECD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 09:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ug5dkzDgJ2Vn9RO/6uwBXc0123ip/xCq3qTJ4G4/vnU=; b=pcQQydskGM56Y5/ik91Ss2FY+O
	luk+c6y2RcDYVDPm7heKj+VO1Ji/klA0zWNoWaUvA81jaVxIDCLv3rKB3kcswvlb/7omhU1JxnEiX
	o/UuwzMmJQVLCuRGNc/ihdXCK+HWOhvBgYNlL8FCu+RT0yhc+/WvxCvEsOLDEYbcwiOZGqjBNT3Kr
	C1EMmyki8TGZrgdMQPULr93ddi/rGfuRkplByixG/76mwhpWPi9F8Y1e5acssaxlRQliX+wAhnMWL
	hl3629mwwAzu+5WqlwAea4oaiLReeWdkQxtZKHdsPnLBRg0aqJcFLDuRrSJP7rgN/Ep1Jr7EOhyy6
	NgM+udsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSa4-000000056Hl-35EA;
	Thu, 14 May 2026 09:42:12 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSZw-000000056Bs-1UmF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 09:42:06 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c80167f56cdso3250657a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 02:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778751724; x=1779356524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ug5dkzDgJ2Vn9RO/6uwBXc0123ip/xCq3qTJ4G4/vnU=;
        b=KV5KrQl9v7EO/CInF1mRUKqpqWs1aBy8+5g3RV06zaX4HmBBxZoxRSaOJ9JvFPTzko
         9oFLZFuA6dKG5sesz8iKEeGM6QV0YcQhPpiUbgKXMc0HBMFFmpbHjNdxueUKUYWbABhv
         pr67Iar9MSMqdALFfFWbLne2MPTsc19hZi6amwu29N9El0ejqrLYheJiRMJmkkwSBRYj
         U4mRW6LCaqE+e2NQUzFYAbgHob1jV1XllTQjI/clhKOYXdi7Hr50TVCurEoS5aeicrVg
         Wrbzp4lopgOg3bW0HmJgUg27DdrZbGr8U7+titia85MUvhh2gg/sA+6MxSHnG+r2nbCo
         SO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778751724; x=1779356524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ug5dkzDgJ2Vn9RO/6uwBXc0123ip/xCq3qTJ4G4/vnU=;
        b=liYLdsQttqWT+psgxVIBUK8adCnCtgsIGuoFRt1eHjPGw0OL1ryUqhUmGVJZbpD9K9
         miboql4uk7I0FkNp4aIvRXUoDExMMUqgPeRVGoyjAxZpy0hQv0P1rr+ngz8swCVWWW95
         4yp0HX0lbclhK51+DwrudAdqyRfagjP7mQ0PhLs5+6FUa5i8yqK79vKZFZzWknv0pSH+
         O2920zACona2gkrGaoS4t/ABUJEpgbQCBSQboZJI1elQDl//L5yDQnXuyDAoQkG4+FEm
         /6bhrPTsuWPd9qVG0rYg++LCI9oGvNLUxs8mwv59iqmISNaWEjfSIH7UrYkuMjq9rM8L
         cTjA==
X-Forwarded-Encrypted: i=1; AFNElJ+54qRo4HkMdHRG7Rai9uek7uuKaKhfPpbCOzSzQdfKDPF+UydAqLQrC5oZmlI9fu3+2oCehsIApaM0WA08e6RZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzryybkhnI4rNpLD3tuPuzSCtpS07doLN/si9/PcvtThc/4jRpA
	HgG/FWtfi/NJdmFeZzJNhAltkWxjMYoRqRBjVtdHNpG49JcKxlIC+q6y
X-Gm-Gg: Acq92OEgt4j+xco0o3iB481b6O1u//Qu8F2CM1yOcCaihgR/y64CjuDuyTY16O3jbmv
	1nYffdOFISOs6uLkMeK6UnFgDY1HJ+zaeRBd16lhhPF2PCwI/nwraZ1QSZY7IPKZoucPY/3AJ1d
	aAkXA8AiHTcDqQuNYoxE4E6qqJ3yDlWHZJISksuRTCWiSdaOxCUgyTR9elSxrJZSHe77XIp/5x9
	VGl8IARccDUGZcFsmx/ZDsWc9VpCB5AbS2AR54UgaGtQZJEEM4tCp3b4iG1e1LfvNt0FXteWHQB
	9d38LNt8bWgOH4aJwN8D0A4NeFXtLgh0LSfjmZeEw+M6W4WgI5+BB3/Ccz+H44pDEQFhtREp28S
	StonpHL1SXNkYzeCXyjq2qw/XPf4tv7rxvtD5Uo/kCLD2oFhbZjRwW6B+kXGZAIdYECAeXP+Npe
	ySf+tJNnAB5dr2u9/PG17EC7a0ru59+sSq9XHts4dnmaPjyg==
X-Received: by 2002:a05:6a20:3c8e:b0:39b:da83:91aa with SMTP id adf61e73a8af0-3afb2342a48mr7860002637.51.1778751723547;
        Thu, 14 May 2026 02:42:03 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb114a70sm2351244a12.22.2026.05.14.02.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:42:03 -0700 (PDT)
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
	Wen Jiang <jiangwen6@xiaomi.com>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v2 5/7] mm/vmalloc: map contiguous pages in batches for vmap() if possible
Date: Thu, 14 May 2026 17:41:06 +0800
Message-Id: <20260514094108.2016201-6-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514094108.2016201-1-jiangwen6@xiaomi.com>
References: <20260514094108.2016201-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_024204_415634_5247064C 
X-CRM114-Status: GOOD (  18.44  )
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

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Co-developed-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 mm/vmalloc.c | 75 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 73 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 516d40650..c30a7673e 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3520,6 +3520,77 @@ void vunmap(const void *addr)
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
+static int __vmap_huge(unsigned long addr, unsigned long end,
+		pgprot_t prot, struct page **pages)
+{
+	unsigned int count = (end - addr) >> PAGE_SHIFT;
+	unsigned int prev_shift = 0, idx = 0;
+	unsigned long map_addr = addr;
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
+	flush_cache_vmap(addr, end);
+	return err;
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -3563,8 +3634,8 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;
 
 	addr = (unsigned long)area->addr;
-	if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
-				pages, PAGE_SHIFT) < 0) {
+	if (__vmap_huge(addr, addr + size, pgprot_nx(prot),
+				pages) < 0) {
 		vunmap(area->addr);
 		return NULL;
 	}
-- 
2.34.1


