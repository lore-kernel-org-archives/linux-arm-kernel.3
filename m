Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9D3CA5FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 00:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVvjhrnHN0xVzOU1sGetn/TIp5Cpe7kDHcSDZkewKqc=; b=dv/npLh6ChUk6fmli0g7XJFMWB
	PGPhwipV/wZMJXxT9cw3ZOuoiNfCZ0/m+g3/KRnEWbKMnFuc/nApj0p41FJDiKNinmW2W8N9/IYNL
	k1lfN+Lpjd5ec6cmFuugOeHgAvN5ihO8TCmL8+QlVZuibQAqjIjVhbFPg+PPky0dJaEGBcX+Quvmj
	gxIU4yHwKGhm7DAosJ/tCFAqLkelP+0dDzQJZ8doFSBMxT+urbhDgv5PDSOLY18ArYvbRxOaJqdh3
	giqj4G/ilCVfHOEzZM42WlGw4I8SDNP82ZFOqgQfDK70ikJUFHdmBiRkYl2a9UV+5BhjgBYtRbQK0
	9EoeANtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVk-0000000CnNT-0G12;
	Sat, 03 Oct 2026 00:21:56 +0000
Received: from mail-pf1-x448.google.com ([2607:f8b0:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVb-0000000CnBA-3XCQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 00:21:49 +0000
Received: by mail-pf1-x448.google.com with SMTP id d2e1a72fcca58-86261e66700so49225b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 17:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986906; x=1791591706; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EVvjhrnHN0xVzOU1sGetn/TIp5Cpe7kDHcSDZkewKqc=;
        b=DfC/ITpWtTgrFezZnvJwIHVpeiuRdqZX94e5YZL6/s8W2kpFSc5QjEQrLzb0HsCtjv
         kEFBQruZLtu71BUWdkiUou4UvNwrz+lKhazdvc4Dzg3JjPHdP6T0UcJaKFbhTU02+P9B
         Nz8SysmfJ0P7RqGjVDFK34iknUyRQ74W9Ho4CNiwKuWyjbzSQjcgmQ5fEN4ybZlbHKjw
         CCqVDYHOXpCktFqItKbbfFZPWvyPyLgVZRv4yVB6OVhkNDpCYw/T1A6t2tkF70PLNmjp
         7NSmbfwM1NXBkKH3iVwutrl8QXftTa84mxx3ZKhVjXDMDgNbdYmgyeLaLplHagVIfYnA
         BUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986906; x=1791591706;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EVvjhrnHN0xVzOU1sGetn/TIp5Cpe7kDHcSDZkewKqc=;
        b=YJn95ZrBKtEqtYIDW2vsGNNKHHZM41/vX8Om0bDb1h7+/fLZYJmNzGB0+Y41bheTw3
         4PaMe5QMbKHOWiYb3+CpQ31Vq5QfdGB2Yg8g3GRPdQZ+rdAb3DOM1+7KxuY6yiNQEUTb
         3lrdrtVxzqWS+bZJtdGdJ8BzwfQB74L3rKGc0FGa9uZ25eYvsZzpIPcQqT2WWeRfKRLT
         K7GJ2m4gADvnr8uR5SiZ0TaQk9EiSeuBLE5Fn9XHnCeS+61WQJ///eNWkWZ5ipDpQlz0
         W+kR863hNtdSznuEJPJxlxQUruMR0zlJSgb30kupq+7dxEfnjYaEQasPaDAKw1acjmNA
         BLvw==
X-Forwarded-Encrypted: i=1; AKwUvBxGaehhDMcpqd4gJda5uCpIDGTs3cRcdsJjICBwNjAoZE1oyYkDfbeXYDiV7zCmUL3o3ipOrkBwwzV1AopIvFLg@lists.infradead.org
X-Gm-Message-State: AFuF++lT5NYDcAwotehbuXA38CO+YLr9e2kuHV+KRWsoalHphSrDEk0+
	T1bLgT+75NTVw8YHJxg9KU24XOVIge9LOlt1/vKay0seOLfFUU44UuLs5wSPElZyH3taH/aTrAh
	fR1SKioP4267QrlrYkru3IA==
X-Received: from pfbf1.prod.google.com ([2002:a05:6a00:ad81:b0:872:9706:205a])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:138f:b0:878:3783:8a4d with SMTP id d2e1a72fcca58-88af5ac19ccmr4135678b3a.53.1790986906132;
 Fri, 02 Oct 2026 17:21:46 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:16 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-14-jthoughton@google.com>
Subject: [PATCH v2 13/20] arm64: Support hugetlb vmemmap optimization
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_172147_903965_438478E0 
X-CRM114-Status: GOOD (  14.01  )
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

Support HVO if HW AF and BBML3 are supported. These are the required
features for the vmemmap to be modified in place.

On arm64 systems that do not have the required hardware features to
support HVO, the HVO sysctl will not appear, and any attempts to enable
HVO (either via the command line or via
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON=y) will have no effect.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/Kconfig               | 2 ++
 arch/arm64/include/asm/hugetlb.h | 7 +++++++
 mm/hugetlb_vmemmap.c             | 4 ++++
 3 files changed, 13 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b51d23a62c92..e4c87487bc7f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -92,7 +92,9 @@ config ARM64
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
+	select ARCH_WANT_HUGETLB_VMEMMAP_RO_AFTER_INIT
 	select ARCH_WANT_LD_ORPHAN_WARN
+	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP if ARM64_HW_AFDBM
 	select ARCH_WANTS_EXECMEM_LATE
 	select ARCH_WANTS_NO_INSTR
 	select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index d038ff14d16c..938d7896a31e 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -11,6 +11,7 @@
 #define __ASM_HUGETLB_H
 
 #include <asm/cacheflush.h>
+#include <asm/cpufeature.h>
 #include <asm/mte.h>
 #include <asm/page.h>
 
@@ -65,6 +66,12 @@ extern void huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
 					 unsigned long addr, pte_t *ptep,
 					 pte_t old_pte, pte_t new_pte);
 
+#define __HAVE_ARCH_HVO_SUPPORTED
+static inline bool arch_hugetlb_vmemmap_optimization_supported(void)
+{
+	return system_supports_bbm_through_af();
+}
+
 #include <asm-generic/hugetlb.h>
 
 static inline void __flush_hugetlb_tlb_range(struct vm_area_struct *vma,
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index c1c736dd08b9..fabf2b25fe59 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -85,6 +85,10 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 
 		/* Make pte visible before pmd. See comment in pmd_install(). */
 		smp_wmb();
+		/*
+		 * On arm64, this requires BBML3. Its support has already been
+		 * checked.
+		 */
 		pmd_populate_kernel(&init_mm, pmd, pgtable);
 		if (!(walk->flags & VMEMMAP_SPLIT_NO_TLB_FLUSH))
 			flush_tlb_kernel_range(start, start + PMD_SIZE);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


