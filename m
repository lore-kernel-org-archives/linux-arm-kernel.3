Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E516FD5D689
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 20:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kshc+5TecBnElfjUZu5d6HS1cvMCCmL1E/fnjesi6Ow=; b=DZA9TZ2cj1v3XwRyg1tUsO/Xym
	hbLAXe0dZ258Vx+HSXC6K+EKORu/P0UyNPgjwIrEptqtZeR1FM1EghInafjSklnq+lks6d4ljV65M
	kauQ1vi3eQH3o+JYWvp9AZYnm/jbL68D4l9jMLtzssPgZLyG4G10RWZ2fDxbsMM3mhwd82F6s77g8
	EJkaYS4e4gxAe5xu7siSjNG6P4lhOm630toma8M6rV2actzmQCq3hMzDKQxdOOLIrBP0/nt2uUI5R
	kB6MNJI5NaQC7aTWfjpRWD0luR5GHplDoQpoq95Mp31VUVTpcClafqmLsOu5IPJ4mQkI3RcrfDPqc
	w5c2g/0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t99A2-00000008FQJ-1tPb;
	Thu, 07 Nov 2024 20:31:22 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t98zq-00000008E5t-4491
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 20:20:52 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e35199eb2bso28090347b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 12:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731010849; x=1731615649; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kshc+5TecBnElfjUZu5d6HS1cvMCCmL1E/fnjesi6Ow=;
        b=eUJAki2yL7LrAB0/WVprJpyI6Psv43CnA0Tu2DaD2kHrfIkzAtkODvS1lyXr5ztMqb
         qo4GeItZxthkCS/y2Qb7LJYNJV2aHtyV/RUzlpxzC4GtkmXUO9CVjL2fUNX4YeV+V7Pm
         gtVOcKu2LTHGDIV5kiyKB4xUKEiCFkbp+Hy+yByhNJCTOuTwfIeVSZIgzhASzfVLccUV
         x1fbWl1y5ukAwD7bnLvXzCYT6H9UWmpZKrvNC9RTBDiFs4gte/R7bjU0XwEjqQ/y/w22
         7iC7XiynSkotRr8tXSvCfaEir/gU9T4hIsN6RLxQt9lAvfIzgSpy/n12SytTV7wbu2mW
         M9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731010849; x=1731615649;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kshc+5TecBnElfjUZu5d6HS1cvMCCmL1E/fnjesi6Ow=;
        b=UwC/jPfoWETmcJHYWAhh6GWdaNh6fso/7bbm1JHxKScY29a1jK9ro7lh4Zmb3IEM2i
         0FThO0V/ek9+GSUgy9GbyIkeRi/EtmTiVjlGlqWQPfIcY8zjHpVM+1O01cBoDFDyfCjj
         t0XJ7GQ9n3rWFoZfwigFJK3zy1AVw+kA4QMvO2XndVfGEAio8ukprNDqFhXIaS+m3wWu
         mmhDa49wymGIhokLwq/iVkAcgBaH4HZx7On48T1MSZVocqZxcLuGOQttA2j1vv5Ep6xm
         RNBHv6KbKHfaCboVfGVrGzr8FrrmhbVOhHpkVeG6jbyGv1XPjGV3OeW60wuRj58abIlQ
         MWyg==
X-Forwarded-Encrypted: i=1; AJvYcCWOJHl0z0BH55WSojqvCUOgOmlDCyKmhq6CvnbjiXMNQuuReSa6By603GTbswSJwyyn339Q+y0x9Pa6qIUcNZXf@lists.infradead.org
X-Gm-Message-State: AOJu0YwvXDZaHqFfsnl81I7WQJ9WJlUGo7kpPhuj19F5QZd/88mpE/6p
	6yFPOLhoWSIf1sE2PexVigRuGzSSQDxm78LC8fzgmE9zlcLZSDSMNTgtsws1Z+RrPYkUEszDwem
	agg==
X-Google-Smtp-Source: AGHT+IEjIv/a3qKWak4A1Vn18DXvCmBDzVmrxwgOEzTP/K9OGHGZiWxXZlnHtaXBKDC55f0LUGtreAyzNRE=
X-Received: from yuzhao2.bld.corp.google.com ([2a00:79e0:2e28:6:a4c0:c64f:6cdd:91f8])
 (user=yuzhao job=sendgmr) by 2002:a05:690c:c08:b0:6c1:298e:5a7 with SMTP id
 00721157ae682-6eaddfb88bcmr33137b3.5.1731010849660; Thu, 07 Nov 2024 12:20:49
 -0800 (PST)
Date: Thu,  7 Nov 2024 13:20:32 -0700
In-Reply-To: <20241107202033.2721681-1-yuzhao@google.com>
Mime-Version: 1.0
References: <20241107202033.2721681-1-yuzhao@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107202033.2721681-6-yuzhao@google.com>
Subject: [PATCH v2 5/6] arm64: pause remote CPUs to update vmemmap
From: Yu Zhao <yuzhao@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, Yu Zhao <yuzhao@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_122051_074321_DC09B740 
X-CRM114-Status: GOOD (  12.41  )
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

Pause remote CPUs so that the local CPU can follow the proper BBM
sequence to safely update the vmemmap mapping `struct page` areas.

While updating the vmemmap, it is guaranteed that neither the local
CPU nor the remote ones will access the `struct page` area being
updated, and therefore they should not trigger kernel PFs.

Signed-off-by: Yu Zhao <yuzhao@google.com>
---
 arch/arm64/include/asm/pgalloc.h | 69 ++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
index 8ff5f2a2579e..f50f79f57c1e 100644
--- a/arch/arm64/include/asm/pgalloc.h
+++ b/arch/arm64/include/asm/pgalloc.h
@@ -12,6 +12,7 @@
 #include <asm/processor.h>
 #include <asm/cacheflush.h>
 #include <asm/tlbflush.h>
+#include <asm/cpu.h>
 
 #define __HAVE_ARCH_PGD_FREE
 #define __HAVE_ARCH_PUD_FREE
@@ -137,4 +138,72 @@ pmd_populate(struct mm_struct *mm, pmd_t *pmdp, pgtable_t ptep)
 	__pmd_populate(pmdp, page_to_phys(ptep), PMD_TYPE_TABLE | PMD_TABLE_PXN);
 }
 
+#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+
+#define VMEMMAP_ARCH_TLB_FLUSH_FLAGS (VMEMMAP_SPLIT_NO_TLB_FLUSH | VMEMMAP_REMAP_NO_TLB_FLUSH)
+
+#define vmemmap_update_supported vmemmap_update_supported
+static inline bool vmemmap_update_supported(void)
+{
+	return system_uses_irq_prio_masking();
+}
+
+#define vmemmap_update_lock vmemmap_update_lock
+static inline void vmemmap_update_lock(void)
+{
+	cpus_read_lock();
+}
+
+#define vmemmap_update_unlock vmemmap_update_unlock
+static inline void vmemmap_update_unlock(void)
+{
+	cpus_read_unlock();
+}
+
+#define vmemmap_update_pte_range_start vmemmap_update_pte_range_start
+static inline void vmemmap_update_pte_range_start(pte_t *pte,
+						  unsigned long start, unsigned long end)
+{
+	unsigned long addr;
+
+	local_irq_disable();
+	pause_remote_cpus();
+
+	for (addr = start; addr != end; addr += PAGE_SIZE, pte++)
+		pte_clear(&init_mm, addr, pte);
+
+	flush_tlb_kernel_range(start, end);
+}
+
+#define vmemmap_update_pte_range_end vmemmap_update_pte_range_end
+static inline void vmemmap_update_pte_range_end(void)
+{
+	resume_remote_cpus();
+	local_irq_enable();
+}
+
+#define vmemmap_update_pmd_range_start vmemmap_update_pmd_range_start
+static inline void vmemmap_update_pmd_range_start(pmd_t *pmd,
+						  unsigned long start, unsigned long end)
+{
+	unsigned long addr;
+
+	local_irq_disable();
+	pause_remote_cpus();
+
+	for (addr = start; addr != end; addr += PMD_SIZE, pmd++)
+		pmd_clear(pmd);
+
+	flush_tlb_kernel_range(start, end);
+}
+
+#define vmemmap_update_pmd_range_end vmemmap_update_pmd_range_end
+static inline void vmemmap_update_pmd_range_end(void)
+{
+	resume_remote_cpus();
+	local_irq_enable();
+}
+
+#endif /* CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP */
+
 #endif
-- 
2.47.0.277.g8800431eea-goog


