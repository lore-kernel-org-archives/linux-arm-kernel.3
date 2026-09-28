Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE90CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 17:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7XOG6J7aO3z9jj4htZ8vsmTX5Bj+aw1I6NLY6zP7oo=; b=Ci0j2RAKtpgJSIn7QDJUbjznnR
	Xg8B/b1vKg/18UbIvRUzJhagu9Rfk7bxzDuuglNgr29oyeHsaNM0GhHFAdn/mBv614ddd5LhcX/yC
	q0UKQ5ZkUMV1JfM69Z4DfV48iCKiM+I6T9MHwMvcx1P1vxUpvZmM4i7Hv8KJNS31LAiM3sNskUR7Q
	4zOheh7vokFR5IdTxVQG1TA4ezIhh4jmQ7jX7d1BH5meH8ZKejWJot+6t4RoxeGOFwfzNBi9pnbhc
	iA+3BNbmX2nVDe/ZAbsSpNG0oMkDdnfZUWPk4MKIqbfn+8LXu1NdAFqwPSndhuc9w4m89Y4UqYQfl
	LDJTA0BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFNh-00000001DOC-2DmP;
	Mon, 28 Sep 2026 17:43:13 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFMY-00000001CcH-11pZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:42:03 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4a0053eb950so9056335e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 10:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617320; x=1791222120; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7XOG6J7aO3z9jj4htZ8vsmTX5Bj+aw1I6NLY6zP7oo=;
        b=FNM8t63aPlljZWqMMutdmJ/2jcNdpP8bEWXzw6uW4E1Fwhsf5ObF02wOHEaYMrG4f+
         nh70eigejzQ1LQUCslInyvVPwEOBZV+qUl2PUD0LPEnw7HEfTNW3Cqsb/IcwLsB7IFG1
         MCIybVnZ00pHVLP6lqYAvj1XLwJ0s1tIPjrj2vaJfJx+BEMDL8eLd460GuQZsP5tTKXV
         HyftmP8i/dnXqIc0xWMr8YBk7cJ6GNPb/k41xCg30RmLAyylIABtvbLN+jRp7+I8E000
         S/mvCbX0SwZFkMbrDwEjM+T3vuc0SBB5obMAUcQgFN04yVt5sjMpDyc1PjicKDJMhIKx
         iKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617320; x=1791222120;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M7XOG6J7aO3z9jj4htZ8vsmTX5Bj+aw1I6NLY6zP7oo=;
        b=jS8QfBkMj2uR2I5Or17xFvvDOV/zXVV/27AHIY1Yr7ouNpVFLmtT17s9LzNacPwrth
         fQf/BENOhn1gI0MWo8N+7fw2B6dIyFcW4clIAB9V99xGCX8drR/E9D+7pJy5IT7cFpzJ
         gXROinPaW+YqT5vJKpiLdywzgRywWh0dlOVRS+iii7nUvV71gGH+AuVROpqH14D7jC8s
         51y5RJi9OL4+uqXjTOs0wQNdmf4h+Xu5uPGwZJ+HiC60qRCQpIww8rBb/ovedLqRzFIe
         PSqxfWMQmnVedMkI8SpnqnsQRScOsRaYYR93U/9QGx4fpkZJ0IwVKCrFRYcqfruB9LBh
         FO0A==
X-Forwarded-Encrypted: i=1; AKwUvBzoVEDD8fD20Vv6WK5k/x2z5vHz//K87S7I6a80rhf2YJ7Dkr3e9ctoOGk7Z33Q8R12awStmBE7LUK61jrjaJ2F@lists.infradead.org
X-Gm-Message-State: AFuF++n4YWJBYMoHGwLXRyqUsDw+YQFbrm4knCJnAXQrHpTs53xsj/9S
	5zNVV2bfvBbX++EW9yA79pfkjvywuj0xTy6RIRW2t9yUEfXsLgwoUhhfDUl2aTUZIxveZcRAGK3
	eqfv0Uqblqd762A==
X-Received: from wmpj18.prod.google.com ([2002:a05:600c:4892:b0:4a0:264:76ac])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6388:b0:4a0:1d2:1a8a with SMTP id 5b1f17b1804b1-4a001d21b90mr75432355e9.16.1790617319925;
 Mon, 28 Sep 2026 10:41:59 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:17 +0000
In-Reply-To: <20260928174122.3380703-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260928174122.3380703-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174122.3380703-11-smostafa@google.com>
Subject: [RFC PATCH 10/15] mm/vmalloc: Add a get_vm_area_node()
From: Mostafa Saleh <smostafa@google.com>
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linux-rt-devel@lists.linux.dev
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	akpm@linux-foundation.org, urezki@gmail.com, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, kees@kernel.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, gustavoars@kernel.org, 
	bigeasy@linutronix.de, clrkwllms@kernel.org, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Linus Walleij <linus.walleij@linaro.org>, 
	David Stevens <stevensd@google.com>, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_104202_315001_278A40E0 
X-CRM114-Status: GOOD (  17.85  )
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

From: Pasha Tatashin <pasha.tatashin@soleen.com>

get_vm_area_node()
Unlike the other public get_vm_area_* variants, this one accepts node
from which to allocate data structure, and also the align, which allows
to create vm area with a specific alignment.

This call is going to be used by partially populated stacks in order
to allocate the VA space for the kernel stacks that might be larger
than the memory mapped behind it.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
[Switched to vmap_pages_range instead of noflush variant, fix typos]
Signed-off-by: David Stevens <stevensd@google.com>
[vmap_pages_range() already in the header, and remove the export as it
 was not needed, update commit msg]
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 include/linux/vmalloc.h |  3 +++
 mm/vmalloc.c            | 24 ++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index aed121d729b0..e6a9c1bbe789 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -250,6 +250,9 @@ extern struct vm_struct *__get_vm_area_caller(unsigned long size,
 					unsigned long flags,
 					unsigned long start, unsigned long end,
 					const void *caller);
+struct vm_struct *get_vm_area_node(unsigned long size, unsigned long align,
+				   unsigned long flags, int node, gfp_t gfp,
+				   const void *caller);
 void free_vm_area(struct vm_struct *area);
 extern struct vm_struct *remove_vm_area(const void *addr);
 extern struct vm_struct *find_vm_area(const void *addr);
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index bea9f76ed7e7..9f4634c7977e 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3301,6 +3301,30 @@ struct vm_struct *get_vm_area_caller(unsigned long size, unsigned long flags,
 				  NUMA_NO_NODE, GFP_KERNEL, caller);
 }
 
+/**
+ * get_vm_area_node - reserve a contiguous and aligned kernel virtual area
+ * @size:	 size of the area
+ * @align:	 alignment of the start address of the area
+ * @flags:	 %VM_IOREMAP for I/O mappings
+ * @node:	 NUMA node from which to allocate the area data structure
+ * @gfp:	 Flags to pass to the allocator
+ * @caller:	 Caller to be stored in the vm area data structure
+ *
+ * Search for an area of @size/align in the kernel virtual mapping area and
+ * reserve it for our purposes. Returns the area descriptor on success or %NULL
+ * on failure.
+ *
+ * Return: the area descriptor on success or %NULL on failure.
+ */
+struct vm_struct *get_vm_area_node(unsigned long size, unsigned long align,
+				   unsigned long flags, int node, gfp_t gfp,
+				   const void *caller)
+{
+	return __get_vm_area_node(size, align, PAGE_SHIFT, flags,
+				  VMALLOC_START, VMALLOC_END,
+				  node, gfp, caller);
+}
+
 /**
  * find_vm_area - find a continuous kernel virtual area
  * @addr:	  base address
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


