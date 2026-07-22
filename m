Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8FDC4453B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 08:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NkPKMk7MVapNd2zmqS5l8beGNHYpl4HXQlvHxGO4S+c=; b=GbrNRfezjFsOSGQr6vMpqr68P1
	UlVJRg1prbCSS2uVJggIpSLbUBXMVf5eOvrlJEY/MWRPGdMFVC4wYLz8c9pNcvWCg8KFnaRz2fr8p
	stlQqE/p+on0lRVdT5d+GKgqf3Fg8AVkCOQxOYftXcC58sP9965C2mbWS/qTt11+GFQC1SihnsSSq
	Vg8Fcx+lH2Gh9mRN80nRIZxzQewqshdH1yZFnGuTBfzRI44YnxToVoBmOXXErBs1+caRRp3RTQC1F
	JzKj+r2LZN+0tjll4KtNOJ7nDRaTNikQAw4uhDY4DJaTrLcweEEEoOJcn0U+aSehXkH8lzDYaMiAj
	QpM7lffA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSmy-0000000BJYu-2Lu8;
	Wed, 22 Jul 2026 08:58:52 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSmv-0000000BJYV-3Ux0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 08:58:51 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cae1a3a744so92201405ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 01:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784710728; x=1785315528; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NkPKMk7MVapNd2zmqS5l8beGNHYpl4HXQlvHxGO4S+c=;
        b=iV2UJuOpfEz+zF9mq7I+qUAELI923xpYWSqGmDrW1mhKydLVv49+RKd1dRiXvYtDVF
         gcciypfTOgRpoFz/nUhwi9a+UisoHRWVbWGtH+rT++6X8aZ9KbJh2EejOtITKPTOvJPK
         Pk6CY+xs/wT+vXfyCaH/Uy2LIL2x3H1ybRq2tSuJbC1bOFZDw6LcPeP35REFIHRCXgsv
         OaHC2Md9xoyczA5J2ND2HNhOG0fngfTait34rrNZqj0z4djwC9WTc4f6Nr4RZXnI719D
         Grd/nal2Ex2Q3asKvDrEnGHXKFjAWbssIRekzBjktp9ml7yxneQSuxvxHgetW5Xp5hHX
         qJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784710728; x=1785315528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NkPKMk7MVapNd2zmqS5l8beGNHYpl4HXQlvHxGO4S+c=;
        b=heNrGvlFT9BFnOb4iPPFTcotUQ4STKs0oqOU1fvxhRMdSt2Y0lma2CTGsXP7Uqoxc8
         pY9HtobO8dw2v/+2eReJ0skP4rhF/6lPfvaXK6BZMESEnoMQaU6AfVlMUxkKY9fuGArG
         Ita0G/5fAiq2KiSWzrdPYAQF9AeX9YISihGd7Q7FH9R1w0F2MD1GUtOLAJc+Hmod9I1W
         de5xJbdXIw5+v5Njo95jmIKPr2MoXrCgRKF+biRe6NlMjTPAF4XCadmMBl8U1DC5qoyA
         c9WyqiaVr7ttXGA6UXlH9bdaFnDPf9fSYgCvhiEjn109hS7me9kB4NwT+E1diXUUJMdu
         1Uyg==
X-Forwarded-Encrypted: i=1; AHgh+RqekJoM4GtBX97V6frFVg1nyne9AV1EFfVC+u7mlZBUiadDRNiQ/MHI11KRX6R6kP2c3+5SMTMbkPfuS8y97KrX@lists.infradead.org
X-Gm-Message-State: AOJu0YxODpAibdATmtLdAc135QGA2bRMXg16dRtEIoubpfN0xSHI6aIt
	UlFU2Hsz6ZTqva+e/UTeLN8YSWP4L0Mr+5rcWNm741fzoHqSFd212CKpLoYTYQ==
X-Gm-Gg: AR+sD11F8wgaRUkXB5Q4Dlrn0IScoLISoeNymkI+MYzPARu+9BUIWQyQhP6wwV4Sljf
	6bybSwxmJu4tZmkU4WdWEh52asaQBcloVhswtYC2EgFBXMzl1cKRQAy75qKdL3DACnhJMRDd/E9
	PHBTDNjva+Dlg0l2R46sdyKeMk7CUfUcUSaIiK9sEAbPPlBnBpmZw6as8/JAOLI5/vUjLXSEPiv
	MPRKcwouQBYBzCcthW4OaTMXuyN4GAnjHVWTO1fmZBMwvUK21AJfK09eqmmHX6+GfzTk/zYw5PP
	6Ny6cBpdxssXHO09LqIf9xof5t6MuQBjujS5cDJLoC5q5h84sFqwXLa0VQwGZ0lBpm95bqGct2X
	Xel8rPnhTWJTlyScEwVNtxaB8q/e4aQm6gie1xcCuDMYt8WxAuiOdx8pHPLEIuAIU/T+LAvhAV7
	d0ED6ypUBILb29/0ZCCTc0SErA
X-Received: by 2002:a17:902:f786:b0:2ca:caa5:9c04 with SMTP id d9443c01a7336-2cf3495ffccmr251154795ad.23.1784710728213;
        Wed, 22 Jul 2026 01:58:48 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e621dsm11137535ad.48.2026.07.22.01.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 01:58:47 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
To: dev.jain@arm.com
Cc: david@kernel.org,
	akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org,
	Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	baohua@kernel.org,
	leo.yan@arm.com
Subject: Re: [PATCH v7 6/7] mm/vmalloc: map contiguous pages in batches for vmap() if possible
Date: Wed, 22 Jul 2026 16:58:41 +0800
Message-Id: <20260722085841.3047673-1-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAHKocdEeYvdWq2hoot2cbJ1jhKnZbkbayRX841_gdv5gntQ4cw@mail.gmail.com>
References: <CAHKocdEeYvdWq2hoot2cbJ1jhKnZbkbayRX841_gdv5gntQ4cw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_015849_895176_420B6224 
X-CRM114-Status: GOOD (  16.66  )
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

Hi David and Dev,

The updated diff is blow.

Subject: [PATCH] mm/vmalloc: simplify vmap batching helper and limit scan by PFN alignment

Pass the current page pointer directly to the batching helper, and
limit the contiguous scan by PFN alignment before checking for a batch
size. This keeps the helper interface simpler and avoids scanning more
pages than can actually be mapped together.

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>

---
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 92f9cd5e9def5..2f7e6128cbd7c 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3558,7 +3558,7 @@ static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
 }
 
 static inline int get_vmap_batch_order(struct page **pages,
-		pgprot_t prot, unsigned int max_steps, unsigned int idx)
+		pgprot_t prot, unsigned int nr_pages)
 {
 	unsigned long pfn;
 	unsigned int nr_contig;
@@ -3567,16 +3567,16 @@ static inline int get_vmap_batch_order(struct page **pages,
 	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
 		return 0;
 
-	nr_contig = num_pages_contiguous(&pages[idx], max_steps);
+	/* Limit nr_pages by pfn alignment */
+	pfn = page_to_pfn(*pages);
+	if (pfn > 0)
+		nr_pages = min_t(unsigned int, nr_pages, 1UL << __ffs(pfn));
+
+	nr_contig = num_pages_contiguous(pages, nr_pages);
 	if (nr_contig < 2)
 		return 0;
 
 	order = ilog2(nr_contig);
-	pfn = page_to_pfn(pages[idx]);
-
-	/* Limit order by pfn alignment */
-	if (pfn > 0)
-		order = min_t(int, order, __ffs(pfn));
 
 	if (vm_shift(prot, PAGE_SIZE << order) == PAGE_SHIFT)
 		return 0;
@@ -3587,8 +3587,8 @@ static inline int get_vmap_batch_order(struct page **pages,
 static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
 		pgprot_t prot, struct page **pages)
 {
-	unsigned int count = (end - addr) >> PAGE_SHIFT;
-	unsigned int prev_shift = 0, idx = 0;
+	const unsigned int nr_pages = (end - addr) >> PAGE_SHIFT;
+	unsigned int prev_shift = 0, batch_start = 0;
 	unsigned long map_addr = addr, batch_end = addr;
 	int err;
 
@@ -3597,26 +3597,26 @@ static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
 	if (err)
 		goto out;
 
-	for (unsigned int i = 0; i < count; ) {
+	for (unsigned int i = 0; i < nr_pages; ) {
 		unsigned int shift = PAGE_SHIFT +
-			get_vmap_batch_order(pages, prot, count - i, i);
+			get_vmap_batch_order(pages + i, prot, nr_pages - i);
 
 		if (!i)
 			prev_shift = shift;
 
 		if (shift != prev_shift) {
 			err = vmap_pages_range_noflush_walk(map_addr, batch_end,
-					prot, pages + idx, prev_shift);
+					prot, pages + batch_start, prev_shift);
 			if (err)
 				goto out;
 			prev_shift = shift;
 			map_addr = batch_end;
-			idx = i;
+			batch_start = i;
 		}
 
 		/*
-		 * Once small pages are encountered, the remaining pages
-		 * are likely small as well.
+		 * Once we fail to batch pages, we expect to fail batching
+		 * for all remaining pages, so just give up.
 		 */
 		if (shift == PAGE_SHIFT)
 			break;
@@ -3627,8 +3627,8 @@ static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
 
 	/* Remaining */
 	if (map_addr < end)
-		err = vmap_pages_range_noflush_walk(map_addr, end,
-				prot, pages + idx, prev_shift);
+		err = vmap_pages_range_noflush_walk(map_addr, end, prot,
+				pages + batch_start, prev_shift);
 
 out:
 	flush_cache_vmap(addr, end);

