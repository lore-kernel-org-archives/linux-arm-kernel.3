Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4989AC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJXfNsewMtLeFnLJ7bmWocyu9UQcX6Ca0Z8isc9W34U=; b=lc+kp6i7iey7ppL0lnkyNPSv//
	j+V+Ti5DJILlvUT9qj7qx5FMlT8k42UW3POzVW2hY5A9xrDLCu2kH3PcjrCTEm2Vy48RO1cxW47bE
	jbpAjg7BplVp4jNc7PnrEYV1QE9ACB+9jIMaG46A8rJgcr+mm8b94LdWaTnxNQFmYj2+6r9PYCgwN
	/0oxTDGQCmMl8ceEHeb1qv3ukTzuMuy9i0vw7AeQ/PiLfqtHvjXq5kCgrRpJxChhV+0j9fSBLpyv+
	nRRKIIQKXq4ynic6Q6Xu/nxoVe2bryLxUuj2b229JweTVJsSMxBb/u+53H3CetFgYUZojZKoVH4yr
	QchcyxPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyPs-0000000EiTM-3Wao;
	Wed, 15 Jul 2026 12:08:44 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyPo-0000000EiQx-2ulz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:08:41 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so61730775ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 05:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784117320; x=1784722120; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJXfNsewMtLeFnLJ7bmWocyu9UQcX6Ca0Z8isc9W34U=;
        b=EAPUfMOf4Ygd0XTysCehBrx+g+bTpE2fFQBd8xD1yXMEWU1yMPyp/5J2Ghi/o/LDoh
         phYSiPwaL+A2TQGChZKc5G8C1jvr5qDn9ofJUKoSUZI5J79PaIaVmR623xg+V5XVBkXR
         kcf3UZcvXcijRcGUP2r8/MPWhydsuP2azNO5AHhFeKwyhJqG6Z//u4aQv7uKSAzwxDOn
         qUFij7Ah/DovKexYWCQExB1WvfTP+1uPwNLrq8QkJc8V3RL+rWjYvSvAo4PSAUOvLMa9
         D90PlON2g/x6FzQ6UROxvP6w8wgkxw9gsLVAi6escSSMOyKcH5pbGv/CZi17GakXtBTR
         wWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784117320; x=1784722120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gJXfNsewMtLeFnLJ7bmWocyu9UQcX6Ca0Z8isc9W34U=;
        b=SSP7mDUCtfhnSmDvBA+4j6AbGS5E9FSQvpdi2ViMrvPpy0tISmKvKTQ4Ugk2pWL4L0
         0VREJyEyul74wd4bt97qFqsnnD+YiuQIOX5IWMaV31Bplnh0+3w5utxduPNlR0N2Fb0Q
         EQRR/k3j1WhvbBX2f5pUenpWC1p7e9XZ4UqnYQToJx0Q2N1dryqH7uO5YAjZp+8aiq4i
         xcS8FgSJ4HggWTOgYoWCuKlR3Fbof3zfPZ6X/EY0OBmsUHhHdJMyfli/TgIZ7m41Jn6u
         piXX/sZQ2EA4MgflujIavYlcycXqV24hifNAYkunaE0UirkJo9yUK5IC5XsgTDyuve2l
         fWlg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9SuGzPF17kGZ7qKSxfc0LlG+WNmq6EbEBuXhhSpF/yTEd2Kk0qLGUhzJwlrSFv6u3S91LZq60lKYtOYIWDTjQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxR3Mtn+aucfp0c4hNdyWIH0o7Kp8xvd9DGtAUEwUe+i6opPd/V
	hQqLdxlTS49jZkTM2wU9bBYgpmcAwI1PBcrTPpITn5ooDbnjh3DEikuO
X-Gm-Gg: AfdE7cliLKIKlwo7vJBYwoOPIpMNxYbkI/YWPjQKhBVbmdcJCB1KpZpMnEdz/gUQayR
	dQz3lxR9Qgkvd1vZkTXJks4EVfSymmiWUniZCTaa8JR2oFn2tnBjbWQVCIbuFW2kLye4NoTMmkH
	BskNg/tgMnAD5Nrag/L4ESXX7vzQPrJsWbvn9mFv5c99OBT7e9+Ssg0YdUVhzIDFiwiGXfpkVSs
	1NCitny4BQTBkBWtBRBmUNwDphxHVPsatOXai2Vp521GUPWt/+p8OQ+WqZ1OxFpJwOlux/hDK4X
	h2096E+h3HFN/rzXmNp8xLK8Zn+XTfVAS8QTNrE6TKrqUOQbMSHyhgnfE0dp0GPs8ekZYmTKsS4
	jQYhWIcwceeODfTx1yxxf5oPWpiYNsBB8+Y2bnJGftvOeHP/K6mbA6imvXC+cThhVnKlfzf+S4e
	r+tB5F/uKlP9qUTLza4z1KWGIsPKGOgrJr0rdb1hN86uafgw==
X-Received: by 2002:a17:903:468e:b0:2ca:d7a0:1312 with SMTP id d9443c01a7336-2cf03cef70emr23475045ad.25.1784117319865;
        Wed, 15 Jul 2026 05:08:39 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf105bc642sm1216325ad.63.2026.07.15.05.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:08:39 -0700 (PDT)
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
Subject: [PATCH v7 3/7] mm/vmalloc: Extract vmap_set_ptes() to consolidate PTE mapping logic
Date: Wed, 15 Jul 2026 20:08:09 +0800
Message-Id: <20260715120813.3609949-4-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715120813.3609949-1-jiangwen6@xiaomi.com>
References: <20260715120813.3609949-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_050840_759518_3F6B48B0 
X-CRM114-Status: GOOD (  14.25  )
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

Extract the common PTE mapping logic from vmap_pte_range() into a
shared helper vmap_set_ptes(). This handles both CONT_PTE and regular
PTE mappings in a single function, preparing for the next patch which
will extend vmap_pages_pte_range() to also use this helper.

The #ifdef CONFIG_HUGETLB_PAGE guard is moved inside vmap_set_ptes(),
so callers no longer need to handle the conditional compilation.

No functional change.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
---
 mm/vmalloc.c | 47 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 2c2f74a07f396..b9b29f7857bb2 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -91,6 +91,33 @@ struct vfree_deferred {
 static DEFINE_PER_CPU(struct vfree_deferred, vfree_deferred);

 /*** Page table manipulation functions ***/
+
+/*
+ * Try contiguous mappings at the PTE level for arches which support them, and if
+ * requested by the caller. Fall back to PAGE_SIZE mappings otherwise.
+ *
+ * Return: mapping size.
+ */
+static __always_inline unsigned long vmap_set_ptes(pte_t *pte,
+		unsigned long addr, unsigned long end, u64 pfn,
+		pgprot_t prot, unsigned int max_page_shift)
+{
+#ifdef CONFIG_HUGETLB_PAGE
+	unsigned long size;
+
+	size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
+	if (size != PAGE_SIZE) {
+		pte_t entry = pfn_pte(pfn, prot);
+
+		entry = arch_make_huge_pte(entry, ilog2(size), 0);
+		set_huge_pte_at(&init_mm, addr, pte, entry, size);
+		return size;
+	}
+#endif
+	set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
+	return PAGE_SIZE;
+}
+
 static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
 			unsigned int max_page_shift, pgtbl_mod_mask *mask)
@@ -98,7 +125,8 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	pte_t *pte;
 	u64 pfn;
 	struct page *page;
-	unsigned long size = PAGE_SIZE;
+	unsigned long size;
+	unsigned int steps;

 	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
 		return -EINVAL;
@@ -119,20 +147,9 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			BUG();
 		}

-#ifdef CONFIG_HUGETLB_PAGE
-		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
-		if (size != PAGE_SIZE) {
-			pte_t entry = pfn_pte(pfn, prot);
-
-			entry = arch_make_huge_pte(entry, ilog2(size), 0);
-			set_huge_pte_at(&init_mm, addr, pte, entry, size);
-			pfn += PFN_DOWN(size);
-			continue;
-		}
-#endif
-		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
-		pfn++;
-	} while (pte += PFN_DOWN(size), addr += size, addr != end);
+		size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
+		steps = PFN_DOWN(size);
+	} while (pte += steps, pfn += steps, addr += size, addr != end);

 	lazy_mmu_mode_disable();
 	*mask |= PGTBL_PTE_MODIFIED;
--
2.34.1


