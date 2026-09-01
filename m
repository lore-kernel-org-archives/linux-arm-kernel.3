Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F74AC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcnqIGbKAVtdyFI4AnAxKNCEqkoHQsPJ+QMG1G+XIUo=; b=QZXijWdtsNq4Jrhyh+WmQ1paLx
	8+e/vXMoHpgCZUKQObyw2OaZb+xZXXiqQFVaEEKdoniObuAjNFWDLzuJIIh273eij/S3fVyWvXGfY
	mdYyaWKV6ILiEW1K+9+NYf365C9cUMGqjBnt5sNnK8AsFQJpx7zUD7x3hnI2wXIeEYDALsfS0Tttt
	N3AvdIoaWh0G3rxmFfYweUdNpdCQldke15Qs7REj1khWN4PWO5a3ifuDFQ+OpBnXP0BATILI30wHR
	2c0C3MvxJE4t0t86EBUE28h9omz3r998N5d+tTduOGshicM8W8M9/ayEaQAERSukDTfekPBge4OPw
	5+aGURhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QG1-0000000CT2h-0S9M;
	Tue, 01 Sep 2026 15:18:41 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QFz-0000000CT1s-00B1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 15:18:40 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-85237ffb172so202348b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 08:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788275918; x=1788880718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EcnqIGbKAVtdyFI4AnAxKNCEqkoHQsPJ+QMG1G+XIUo=;
        b=P18kxRCVYoE28VnuAgtQGsW/vHGDSFBwvG0VvvHPKa/C7yzq9T88A5U7YqdrbzI49W
         XW76ASUUTPaF35e//plyMGnU93dYS8MYWuYCdH61ddrvE1Tc66PMBG/mnWIi0RHNdka/
         r1CbXKb4aIlxhURYIp4QUBXE9ANYtikA1kp/BNJW8UgGjzX6Hjfk7WLEvC4Sm76YLTN9
         51pS0vMZHM6VxYqdIvsrFkL/BoMHp6JzgtoJ+9TT6pj9/MkZADN/ZmMueLZiNiewT/ZW
         xROjhEvPM6GqjXwVz0lq41KMGLu9t3eLqbohRW4Anv+5ZLvJ96sv7ZPHqvEyM32cFq0N
         K6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275918; x=1788880718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EcnqIGbKAVtdyFI4AnAxKNCEqkoHQsPJ+QMG1G+XIUo=;
        b=PSuIGTpZkL3n5lZnBbwfThLFSdfjwfE1/r6dX2orJmIor3pj5q7sgyA1dpOaeRPx9V
         bHVpqKgGDO3ePn3veEmHa6jkNteydKvf6vPD8ndCJp1btLOseJIrSPRMZz5O8uEXU3aw
         ClgVTkWSVxFDChN8dY/DN/ZeaC/FQcxXkgt9wDd9puNyW4Y3kgNGWBqLxx5fUHa7q9Oh
         ecv4qVgz6ao2SOqJKFDQqXw/BCKlQPhpDNvkJ1WPagjF01DZOackmoMCy8qEEyHSxaoz
         8ng+twt0/8pGPzb5KVt5iCS+4ctq/dGX5BbPdy5KLd2s9D22fjH1uEdfI5g0dWfLC8Pz
         FQow==
X-Forwarded-Encrypted: i=1; AHgh+RpyKlKuKTmYownMt+nEYsQHESVrXcacs4LLr5cczJ9Z0hzwP67Pu05xJIq80SSeYmFL8Z9jMs+ZSItG2+MvjT+3@lists.infradead.org
X-Gm-Message-State: AFuF++lOFiW6VX48zSpSgSZ43oeg2QOD61BiBvooSYU8R1aqM8ryBtTD
	1wGS86Zf551lh9Xi/DjyLeYD/S1pt0toVuZ9/G0mZQyzh+54+U3k3UB9
X-Gm-Gg: AR+sD10rVMF+j42Nd361QPOafjK7IzX3IwM0vZXKkPvQJ4BcjBEmV40HfdMWKAOI5YR
	MLcQGT0+geKcGjaj8CK7Ka0XRLrKV8e5LQmjLhlbVVuk2SHUbCZUXwdhKnDq8MB+BSVLZlp84/C
	tSgO+Ia7/k/6i3qeAaX0qCXzF9P4Le7PyZbypU59XDY9zLDZkX6n+o5VaJkMZ3nwgcRA/qeA3FK
	HH+YUF7DAIgzRg9818FmFKvB5ZksTOd4pJM6UadR8BTaV/mr8wi2UZ8qQUf8E0J5P8VXJu8sn9l
	TFt/JXzbumoeV0A0tARehedp0sG+CqG9t2zp0G4imGgj+7hDcce4Tad3VAEGTFZP+/TbspAhk/L
	tQmY49bzCdOaJwk4QitG9NFUw2lKBv5ZNWqcmGFEQPKymjB14IMQjMzFmU6TdD/M9rbx9uu0ej2
	qMEOc4lXJ/uLdc4y68Z7vi1/X2ZyGI4MBw8k0NUNInCArn8Bhtq0y4X8P6Kdgw3mDMDUPXVCLMu
	cms8cs8Ry+BJW5z4YIQLFb3zl/sgyoEGSqn
X-Received: by 2002:a05:6a20:7f82:b0:3bf:b228:10b4 with SMTP id adf61e73a8af0-3d26795f2e7mr31819840637.2.1788275917973;
        Tue, 01 Sep 2026 08:18:37 -0700 (PDT)
Received: from o6.lan ([240e:391:ed0:47d0::1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db24f33a0sm89911b3a.9.2026.09.01.08.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:18:37 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	usama.arif@linux.dev,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	kas@kernel.org,
	rppt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	peterz@infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/3] mm: make persistent huge zero folio read-only
Date: Tue,  1 Sep 2026 23:18:16 +0800
Message-ID: <20260901151818.3191443-2-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_081839_044323_AE55EFFF 
X-CRM114-Status: GOOD (  16.59  )
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

The persistent huge zero folio is shared globally and should stay zero
after initialization. As Jann Horn pointed out [1], kernel bugs have
ended up writing to pages that were meant to be read-only, including in
security-sensitive cases. Making the folio read-only in the direct map
turns such writes into faults instead of silent zero-page corruption.

Add a page-based helper consistent with the existing direct-map interfaces.
Handle TLB invalidation in the architecture implementation; unsupported
architectures retain their current behavior.

Protect the folio after initialization. Skip highmem folios, which have no
permanent direct-map mapping.

Inspired by Jann Horn's read-only zero page work [1] and follow-up
discussion [3] with Yang Shi.

Link: https://lore.kernel.org/r/20260508-ro-zeropage-v1-1-9808abc20b49@google.com [1]
Link: https://lore.kernel.org/r/0e5b23a6-4895-454a-9dfa-6dc21adc2991@kernel.org [2]
Link: https://lore.kernel.org/r/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=jDx9E6dLOULohnhBguvi9A@mail.gmail.com [3]

Suggested-by: David Hildenbrand <david@kernel.org>
Suggested-by: Usama Arif <usama.arif@linux.dev>
Co-developed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 include/linux/set_memory.h | 17 +++++++++++++++++
 mm/huge_memory.c           | 13 ++++++++++---
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index 3fe293cfed8c..ed9ce04b18a1 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -54,6 +54,23 @@ static inline bool can_set_direct_map(void)
 #endif
 #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
 
+#ifndef set_direct_map_ro
+/**
+ * set_direct_map_ro - make a direct-map range read-only
+ * @page: first page in the direct-map range
+ * @nr: number of pages in the range
+ *
+ * Make the direct-map range starting at @page read-only and invalidate stale
+ * writable translations before returning.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+static inline int set_direct_map_ro(struct page *page, unsigned int nr)
+{
+	return 0;
+}
+#endif
+
 #ifdef CONFIG_X86_64
 int set_mce_nospec(unsigned long pfn);
 int clear_mce_nospec(unsigned long pfn);
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 54494c3fa983..742283b36d74 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -42,6 +42,7 @@
 #include <linux/pgalloc_tag.h>
 #include <linux/pagewalk.h>
 #include <linux/cleanup.h>
+#include <linux/set_memory.h>
 
 #include <asm/tlb.h>
 #include "internal.h"
@@ -291,10 +292,16 @@ static int __init huge_zero_init(void)
 	huge_zero_folio = alloc_huge_zero_folio();
 	if (!huge_zero_folio) {
 		pr_warn("Allocating persistent huge zero folio failed\n");
-	} else {
-		huge_zero_pfn = folio_pfn(huge_zero_folio);
-		count_vm_event(THP_ZERO_PAGE_ALLOC);
+		return 0;
 	}
+
+	huge_zero_pfn = folio_pfn(huge_zero_folio);
+	count_vm_event(THP_ZERO_PAGE_ALLOC);
+
+	/* Highmem folios have no permanent direct-map mapping to protect. */
+	if (!folio_test_highmem(huge_zero_folio))
+		set_direct_map_ro(folio_page(huge_zero_folio, 0), HPAGE_PMD_NR);
+
 	return 0;
 }
 
-- 
2.47.3


