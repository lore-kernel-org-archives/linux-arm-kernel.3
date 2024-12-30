Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710FEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 09:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SyzxI6H4ZAISLyWZ1lhQ49SW3wSD1SDR6GIh5AHA3wQ=; b=Kr1JwplmdnMSxNOW3zEGb7BqL3
	lXwSnTEF7IiTpuJNU+O6hvkeTdcPuRbYf7nW1Kwc7TCnqxPzuKSdicpCz5dv/EZ2Hicg3u4MTCu9U
	20ZooeUwOL0pJr4BkM1owof0UF+rUWnjNc3Op60StAjfxN3oG8UE8gCwieELhzRkpENp9FxpDwHPH
	cC/mcQcahT9I+i43xKyapA5aABTnr8fOeHETniYcO7OYzcuMz+oUQ+9/VqljKYXAaf+Mrn8dx23Q5
	Bu3phQJobx35yUhyj/fOZ1mVZmHdlNXU46MnAGDnAxLSWApSWGuVyvbq0rS93YCueL+mjuCxHOljE
	CAy7UzTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBnq-00000004t15-1etr;
	Mon, 30 Dec 2024 09:11:10 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBld-00000004rgk-1LG7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 09:08:54 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2162c0f6a39so123632205ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 01:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549732; x=1736154532; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyzxI6H4ZAISLyWZ1lhQ49SW3wSD1SDR6GIh5AHA3wQ=;
        b=PUb5qIK/wdPrie/U48LFpnX0LQnFQGBSyr3iHQ5plEYuqQ6tOPoV5EONARmRhbkJH8
         msQhIciUBTTb1bbTxD7br7pRN7Qw2E53zs8+P/L+LBPB8K9Kn7DbZSrudku8t/eyRjU+
         7yMAy8IwYTxdFl5QL+YqOYOgndQU9occAI9LP2USlLkCu+gqNZWv1TN8p4OrN0BsPqBt
         kcfUk5j1bq7g6lOmZubwoRzUSP+x2wUD5h2qe0nN2gXNWUfW/X2l8ZZ0K6xOFMo3OeAE
         7WBRMIJndiP++0CMwuGxi+DD9YeGbdKsi5cPaLB86UqK+ZscwfG4wyNuEGkXKfvfoJFu
         P7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549732; x=1736154532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SyzxI6H4ZAISLyWZ1lhQ49SW3wSD1SDR6GIh5AHA3wQ=;
        b=jrfl3qmTAwWQRviarDJUfTj9fJsF2KLcsPh6wNeUfv+PZLnp6lkc0Po4PtTRFC8hus
         t1jiOk9Y+5CoMJ8aUUBCaYsdTL94h5BrJ7TrQKR6gF5RWNF990+9bluu8cdqvPBfCS7+
         GL/U4LRjpfCojmVgl7D0iu4kvw+Kbqj4ZVkUpUooNWL43t7eYvwST1CCqkgoIUL645Wl
         RsYqVUs7PrcwP/H8GI15+dt4dVNVzdugMT+Hijo3aKgWyULxeUgGBjM68D3KIKgxNirj
         kFRfNoPJa0oizQXGB1Yns4xADFTPBzANb3H5sWM9emsst2C7i1qsIJ/g1BvyliEH5+N9
         cqwA==
X-Forwarded-Encrypted: i=1; AJvYcCXTcwjT+O+YzFlITdlBSjSVVo/yW/wY/V25tPftHVZr0hSdn8yttVEbLKxKPYHGL4ZfXVS6SekQylpBxOtXIdd6@lists.infradead.org
X-Gm-Message-State: AOJu0YzkEsnECdf83ggwXmWtrWKjVUx51BrauFrphGM3RbfwebiefQ6+
	iG4WSNAfud5Iv+cxDR7TtK0l/9qzW0Vh7qoEl69HGB/rdWhuXwNEU5O21kui0hs=
X-Gm-Gg: ASbGncuxBmn9rxik8AdcMPhXuLO4sUwucaZHkhshlhZ93C5qM49Hn1mihfzYZc8/kep
	O3SxbBrQI5hD3qRaxuS4LqZuzGBq5djUABTs8xOiiVO2v2E+6Zy7IGj8RtXQEcrparpTfsEztpa
	UAkHamNidv/pM/xWD+tAGl3IyYPazuYUVWRdEfm3xKgS9besx1Jy7SRGFchUq0eDYbmqyXL66qD
	XhUDsT++iIt6Nf4gWYxIIqRjzkpP2AuL4kS3949yRLdF1piX2ILlwc4wdPvsin1dc806Dtjg/ym
	5Om8QHSnuFfITFCPuc1tuA==
X-Google-Smtp-Source: AGHT+IEXAwBIqSClrkb4EYoc2OhmhpgilmCz/IsEh6Chc/FsWIzsRB3p/FpLbUSGkXAy0ZMKjVVExg==
X-Received: by 2002:a05:6a20:4320:b0:1e6:50a0:f982 with SMTP id adf61e73a8af0-1e650a0fa30mr7283235637.20.1735549732420;
        Mon, 30 Dec 2024 01:08:52 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:08:51 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	palmer@dabbelt.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v4 01/15] Revert "mm: pgtable: make ptlock be freed by RCU"
Date: Mon, 30 Dec 2024 17:07:36 +0800
Message-Id: <b59adb960b2075822a6e57efc7a52e7eb7780068.1735549103.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1735549103.git.zhengqi.arch@bytedance.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_010853_358330_1046135D 
X-CRM114-Status: GOOD (  12.86  )
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

This reverts commit 2f3443770437e49abc39af26962d293851cbab6d.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/linux/mm.h       |  2 +-
 include/linux/mm_types.h |  9 +--------
 mm/memory.c              | 22 ++++++----------------
 3 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index d61b9c7a3a7b0..c49bc7b764535 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2925,7 +2925,7 @@ void ptlock_free(struct ptdesc *ptdesc);
 
 static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
-	return &(ptdesc->ptl->ptl);
+	return ptdesc->ptl;
 }
 #else /* ALLOC_SPLIT_PTLOCKS */
 static inline void ptlock_cache_init(void)
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 90ab8293d714a..6b27db7f94963 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -434,13 +434,6 @@ FOLIO_MATCH(flags, _flags_2a);
 FOLIO_MATCH(compound_head, _head_2a);
 #undef FOLIO_MATCH
 
-#if ALLOC_SPLIT_PTLOCKS
-struct pt_lock {
-	spinlock_t ptl;
-	struct rcu_head rcu;
-};
-#endif
-
 /**
  * struct ptdesc -    Memory descriptor for page tables.
  * @__page_flags:     Same as page flags. Powerpc only.
@@ -489,7 +482,7 @@ struct ptdesc {
 	union {
 		unsigned long _pt_pad_2;
 #if ALLOC_SPLIT_PTLOCKS
-		struct pt_lock *ptl;
+		spinlock_t *ptl;
 #else
 		spinlock_t ptl;
 #endif
diff --git a/mm/memory.c b/mm/memory.c
index b9b05c3f93f11..9423967b24180 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -7034,34 +7034,24 @@ static struct kmem_cache *page_ptl_cachep;
 
 void __init ptlock_cache_init(void)
 {
-	page_ptl_cachep = kmem_cache_create("page->ptl", sizeof(struct pt_lock), 0,
+	page_ptl_cachep = kmem_cache_create("page->ptl", sizeof(spinlock_t), 0,
 			SLAB_PANIC, NULL);
 }
 
 bool ptlock_alloc(struct ptdesc *ptdesc)
 {
-	struct pt_lock *pt_lock;
+	spinlock_t *ptl;
 
-	pt_lock = kmem_cache_alloc(page_ptl_cachep, GFP_KERNEL);
-	if (!pt_lock)
+	ptl = kmem_cache_alloc(page_ptl_cachep, GFP_KERNEL);
+	if (!ptl)
 		return false;
-	ptdesc->ptl = pt_lock;
+	ptdesc->ptl = ptl;
 	return true;
 }
 
-static void ptlock_free_rcu(struct rcu_head *head)
-{
-	struct pt_lock *pt_lock;
-
-	pt_lock = container_of(head, struct pt_lock, rcu);
-	kmem_cache_free(page_ptl_cachep, pt_lock);
-}
-
 void ptlock_free(struct ptdesc *ptdesc)
 {
-	struct pt_lock *pt_lock = ptdesc->ptl;
-
-	call_rcu(&pt_lock->rcu, ptlock_free_rcu);
+	kmem_cache_free(page_ptl_cachep, ptdesc->ptl);
 }
 #endif
 
-- 
2.20.1


