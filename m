Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568F2C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 23:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOrBCjVl+Gsil1QM8OKlKDVjeh9PhasgM5tVDAHOOrA=; b=nvI4gGlpDrfSQYuSKKE9jalvB+
	kpLmBDKL9x/E8YPa/eZto6l03zI59mNru7HGqy+yS2HB3d+Vevi/YwihT1kvdpOBjrC4qOlfSkJEH
	MLI8v8OhkGPbl9zOwUbybxmToFLD1145GsyfwyXqUQkT6j/KH9g9z9f+ZjapJmUrWGg1rlA8whqEh
	ZVbspgIDBSTkZrOUtRU4QOJY2GCcmFAFDyqmmWsVmDU5+N57/scFXyxqsDgpx2iI46HRDCaRJZrS7
	yEMv/gcGBjSHSNfbR71zEB/h7QdKkeeruI+B4Y5houa3zbTwHGt/xYg91XxvAlgSb8LqzES9AP9Y/
	8RQOb5Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzjZN-00000004uDh-1V5y;
	Thu, 27 Aug 2026 23:31:41 +0000
Received: from mail-pj1-x1045.google.com ([2607:f8b0:4864:20::1045])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzjZG-00000004u7i-3uSU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 23:31:40 +0000
Received: by mail-pj1-x1045.google.com with SMTP id 98e67ed59e1d1-39640eebc57so1034507a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787873484; x=1788478284; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LOrBCjVl+Gsil1QM8OKlKDVjeh9PhasgM5tVDAHOOrA=;
        b=PMKL6HLQW4ajLmwiBbsWc2lWmzw2zt9UfOK9++GFzK26Gde6c44gdxznNIp0YzQw6X
         F68JerxFvEBgRl/kNl2mKbps9+IrNLynwAZfZaUKyhPPdfRJ6TUtPN+xnlmYeThv4WXK
         5bpDIS76B6n67/IIbgNhmqiz3i2ixq2dPPPZTmnn9bf+927wnW5jghFuaclYH+xi5Ozh
         EldEPDkBMMlvgZ/qdRaYsHR/0yuY4EDGh7MlofBjWpUDpipq+k6xJjJswWrB7e/E/aPj
         8x+SYk+3XwN+wTTPNfhwus5gx1gosKKOP9aryWQfHWelS9rDMneJbyfZmx6HzP4DVOrM
         /+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787873484; x=1788478284;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LOrBCjVl+Gsil1QM8OKlKDVjeh9PhasgM5tVDAHOOrA=;
        b=SEt4aN6Dd9KVVdkzdu0XVZLzhtLHKTDhPDvjkq20w2TpwV+NeQsfMCL7nMqZ82PIXr
         rmiO0/BTSPNei9Oaf+aK1lmx9xxtarcBaujWMfEhsoezotedmmFIhp41KskSDqOSyIyp
         iLftzL24guZ0wfk4j5D3fxAvBje1e0iUm0pWn0pLRpqQgIuRPP2U0FSIvzy9kopEBEtn
         3nkwikoFMpZlM6NJrhbuXEc9UIEmCxkpB1AWpsODlzYJbV3GKmZ52Vckzt8iTLWsmvyN
         b94VsYHEwsSm8VYThRjwd8IVOIomQb1Lqxey3xrprMmkMgRgebPVETZiuhZ2I2mUrvyD
         hbtg==
X-Forwarded-Encrypted: i=1; AHgh+RpNJItOPRU1kpw188ckGZPJwJyxvR/gxnrbNlm+QXgdewmlGDCHhQ8U8upbYSZ4EgfKGZS5wqvTPtoh+NB5DIj8@lists.infradead.org
X-Gm-Message-State: AFuF++nWGsI8IbqIujfhkiRRHsdsGIGomBU4VR/P7DdMCtlD49hTWEqp
	3QyODzCqO1uUuQasjGJb7MiEJ5h2q8RnSoOaS7DsSy4Ctcg1YJVRAdFuR4G9FgiqMz9TTvv0uRm
	SwPBOoseNxv0SqQ==
X-Received: from dlbqi2.prod.google.com ([2002:a05:7022:ebc2:b0:13f:bdf3:f58])
 (user=stevensd job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:4cc2:b0:396:d27b:89b9 with SMTP id 98e67ed59e1d1-396d27bb20emr3178120a91.10.1787873484126;
 Thu, 27 Aug 2026 16:31:24 -0700 (PDT)
Date: Thu, 27 Aug 2026 16:29:42 -0700
In-Reply-To: <20260827232948.2520558-1-stevensd@google.com>
Mime-Version: 1.0
References: <20260827232948.2520558-1-stevensd@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827232948.2520558-5-stevensd@google.com>
Subject: [RFC 04/10] mm: vmalloc: support creating aligned vm areas
From: David Stevens <stevensd@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Uladzislau Rezki <urezki@gmail.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, suleiman@google.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev, 
	David Stevens <stevensd@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_163138_783429_9F1F8320 
X-CRM114-Status: GOOD (  14.64  )
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

Expose a get_vm_area_node() function that supports passing an alignment
when allocating a vm area.

Signed-off-by: David Stevens <stevensd@google.com>
---
 include/linux/vmalloc.h |  2 ++
 mm/vmalloc.c            | 24 +++++++++++++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index d87dc7f77f4e..5ed9c5b25026 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -246,6 +246,8 @@ static inline size_t get_vm_area_size(const struct vm_struct *area)
 extern struct vm_struct *get_vm_area(unsigned long size, unsigned long flags);
 extern struct vm_struct *get_vm_area_caller(unsigned long size,
 					unsigned long flags, const void *caller);
+extern struct vm_struct *get_vm_area_node(unsigned long size, unsigned long align,
+					  unsigned long flags, int node);
 extern struct vm_struct *__get_vm_area_caller(unsigned long size,
 					unsigned long flags,
 					unsigned long start, unsigned long end,
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index d39897300f29..059cd0748514 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3280,7 +3280,7 @@ struct vm_struct *__get_vm_area_caller(unsigned long size, unsigned long flags,
  * @flags:	 %VM_IOREMAP for I/O mappings or VM_ALLOC
  *
  * Search an area of @size in the kernel virtual mapping area,
- * and reserved it for out purposes.  Returns the area descriptor
+ * and reserved it for our purposes.  Returns the area descriptor
  * on success or %NULL on failure.
  *
  * Return: the area descriptor on success or %NULL on failure.
@@ -3301,6 +3301,28 @@ struct vm_struct *get_vm_area_caller(unsigned long size, unsigned long flags,
 				  NUMA_NO_NODE, GFP_KERNEL, caller);
 }
 
+/**
+ * get_vm_area_node - reserve a contiguous kernel virtual area
+ * @size:	 size of the area
+ * @align:	 alignment of the area
+ * @flags:	 %VM_IOREMAP for I/O mappings or VM_ALLOC
+ * @node:	 node from which to allocate data structures
+ *
+ * Search an area of @size in the kernel virtual mapping area,
+ * and reserve it for our purposes.  Returns the area descriptor
+ * on success or %NULL on failure.
+ *
+ * Return: the area descriptor on success or %NULL on failure.
+ */
+struct vm_struct *get_vm_area_node(unsigned long size, unsigned long align,
+				   unsigned long flags, int node)
+{
+	return __get_vm_area_node(size, align, PAGE_SHIFT, flags,
+				  VMALLOC_START, VMALLOC_END,
+				  node, GFP_KERNEL,
+				  __builtin_return_address(0));
+}
+
 /**
  * find_vm_area - find a continuous kernel virtual area
  * @addr:	  base address
-- 
2.55.0.897.gb25b4bd76c-goog


