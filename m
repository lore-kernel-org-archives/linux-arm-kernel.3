Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C793E77197
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 03:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPcqXqaTIBo3x10L2Zu0olCr3NMK/mAmrBeyqDgRKcc=; b=ehpzhDC3bpkW8kIPU1KlPdIEcv
	fxwz3TPWPxoLWxFZUlbcByYc6eZlDFSuZKyr1QjKoopLhBXTWWUCNNK6mcGJBUd3q2chV8aZdBPOC
	UAOh5NI/tNLeeo3uWLhxYvBIUu7AuzO3tmYJu6Z7eokQrqcEsr4b+lA3tLMteeq1l5hNNlzn6D/sB
	FTgjpXkAlsrGoRF3AjRgVUXDpiDbvz9kGaNCRQk/RPtmTedLk+S96U1dOcgLIGGlLoe4NLeh7pJb+
	DkhXqJZbft5WdPKbexxiigoZh96CkAG+ODDatSr9IJDOfTMeBkIaQSxvwUhxd7weY9xZ8Yfjmr1mh
	8amUeJpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdeg-000000007u2-1bkE;
	Mon, 06 Jan 2025 03:19:50 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdcQ-000000007ao-0rzw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 03:17:31 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2166022c5caso174118965ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 19:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736133449; x=1736738249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPcqXqaTIBo3x10L2Zu0olCr3NMK/mAmrBeyqDgRKcc=;
        b=lHF9QdUQftIqekxZCDYbD+e2sWHy4LNL0Thy7Mf3L7BYdwXZ4LUV/TSFe5lqNhKpwI
         1NL7U92T5fdD2SJiaiMx5/OG3aSeB3bYTo4zlmT1C6S0+fD4Z6tYOBoiUoY/mh3+hCKn
         npCez4w1H5XocQ9Piv0jNWD7gRB04fyEKzdLUzeJp+W0vpBd4Cpl2cMwVLtP5HcJvan3
         R/RVg1fFz0Vrwg9o1Lb35NNgYNPyhkdJJnK3qvawyhDVLv9zLvaWID43I7KGsvBj/ZrQ
         oM/pbbGs4k2mv1kct7T2YB4Du+TORtC1BRgHmn4rBBcfCph1XqucRLfPVknMzRkEAqTQ
         zddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736133449; x=1736738249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IPcqXqaTIBo3x10L2Zu0olCr3NMK/mAmrBeyqDgRKcc=;
        b=qbM8lLpLPSDILqIAGkOTLY/v7Fm+dbGzYD6uNUn0k4KU3Bof+dAWYJrB9VbO4BrTAu
         EgyTnZOtxb62rr+a6kgZ77Nz8kEkS71pX0WtsKcnV9VW7scPNT1/mxw7eyArpnsS7HbS
         WDphAZXQMU2q7tokQZVini9DJ/qnp+kvksxz1NaYVZdTrf7MHujDUpp3vUJ2X/lElFF7
         57KLa+lgI3uxuE/B/y/EZXc+ANjZEiKRTmZjjcOe5GAZTBQelUuyxl8Bsm3hsYY2qZrb
         cf1bWimIyjkSNIVDGTRl6Ydok3JNHl7gGHN/Panhyz2HKsqBrnSZJTt8vNUxZDOfbZAB
         Aasw==
X-Gm-Message-State: AOJu0Yyx35vE1XN8jdBcfV0qeFmtjb7ADrg5XfNT5cNPWKWp9W/kvBuQ
	BbSRkXN9fKDHtghPS46wlU33LDPBQIfFJRRi2hrTKZxwSyIkE34W
X-Gm-Gg: ASbGncsgeLRnLvD5BpcEcK/AT2qhQfTOIEc8B4q1b29zD1k5f7hv9/wjpWxQiZMdSRB
	ko0ZhuB4mg+0ikWN9hCJJ+imYhVD5j5SSbg/BukK62GnEoQle9xsJJU0kmT7AAxOTopUZl4Le2l
	7R7Jfwk3V5Xda0XdQzu7l1cZ8iFXUKPOxqc9pcvX969TRb4ntvWhSCxP3wnNN/CKx+BpLZwAWKC
	PNWW2w/MGS8TqHHawumVabOE/qiJZaviVPOCsxW3n3X9KhRfZMB2bxbQhi/gBVbECKE4suifGGa
	rN09BTwq
X-Google-Smtp-Source: AGHT+IGUcWPca8wiecs9NrdPulrIQkPrhd7bNDv5OvIdHp7U8jnY2abuTVpzr1KXpxDPDL37Vp5CVw==
X-Received: by 2002:a17:902:e852:b0:216:386e:dbc with SMTP id d9443c01a7336-219e6ea1d22mr898673135ad.13.1736133449268;
        Sun, 05 Jan 2025 19:17:29 -0800 (PST)
Received: from Barrys-MBP.hub ([2407:7000:af65:8200:a54c:5ad3:ad27:edb7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed62cde6sm38471399a91.13.2025.01.05.19.17.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 05 Jan 2025 19:17:28 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	ioworker0@gmail.com,
	david@redhat.com,
	ryan.roberts@arm.com,
	zhengtangquan@oppo.com,
	ying.huang@intel.com,
	kasong@tencent.com,
	chrisl@kernel.org,
	baolin.wang@linux.alibaba.com,
	Barry Song <v-songbaohua@oppo.com>
Subject: [PATCH 1/3] mm: set folio swapbacked iff folios are dirty in try_to_unmap_one
Date: Mon,  6 Jan 2025 16:17:09 +1300
Message-Id: <20250106031711.82855-2-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250106031711.82855-1-21cnbao@gmail.com>
References: <20250106031711.82855-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_191730_269963_BC99D83F 
X-CRM114-Status: GOOD (  16.99  )
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

From: Barry Song <v-songbaohua@oppo.com>

The refcount may be temporarily or long-term increased, but this does
not change the fundamental nature of the folio already being lazy-
freed. Therefore, we only reset 'swapbacked' when we are certain the
folio is dirty and not droppable.

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 mm/rmap.c | 49 ++++++++++++++++++++++---------------------------
 1 file changed, 22 insertions(+), 27 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index c6c4d4ea29a7..de6b8c34e98c 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1868,34 +1868,29 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				 */
 				smp_rmb();
 
-				/*
-				 * The only page refs must be one from isolation
-				 * plus the rmap(s) (dropped by discard:).
-				 */
-				if (ref_count == 1 + map_count &&
-				    (!folio_test_dirty(folio) ||
-				     /*
-				      * Unlike MADV_FREE mappings, VM_DROPPABLE
-				      * ones can be dropped even if they've
-				      * been dirtied.
-				      */
-				     (vma->vm_flags & VM_DROPPABLE))) {
-					dec_mm_counter(mm, MM_ANONPAGES);
-					goto discard;
-				}
-
-				/*
-				 * If the folio was redirtied, it cannot be
-				 * discarded. Remap the page to page table.
-				 */
-				set_pte_at(mm, address, pvmw.pte, pteval);
-				/*
-				 * Unlike MADV_FREE mappings, VM_DROPPABLE ones
-				 * never get swap backed on failure to drop.
-				 */
-				if (!(vma->vm_flags & VM_DROPPABLE))
+				if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPABLE)) {
+					/*
+					 * redirtied either using the page table or a previously
+					 * obtained GUP reference.
+					 */
+					set_pte_at(mm, address, pvmw.pte, pteval);
 					folio_set_swapbacked(folio);
-				goto walk_abort;
+					goto walk_abort;
+				} else if (ref_count != 1 + map_count) {
+					/*
+					 * Additional reference. Could be a GUP reference or any
+					 * speculative reference. GUP users must mark the folio
+					 * dirty if there was a modification. This folio cannot be
+					 * reclaimed right now either way, so act just like nothing
+					 * happened.
+					 * We'll come back here later and detect if the folio was
+					 * dirtied when the additional reference is gone.
+					 */
+					set_pte_at(mm, address, pvmw.pte, pteval);
+					goto walk_abort;
+				}
+				dec_mm_counter(mm, MM_ANONPAGES);
+				goto discard;
 			}
 
 			if (swap_duplicate(entry) < 0) {
-- 
2.39.3 (Apple Git-146)


