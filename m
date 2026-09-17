Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39C4C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 05:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8iXtJFaILHaNQYB7TRtsKAUY5yHxckNGkamGztIiuQ=; b=G5v/Tbxs//W7I565hT/4HjQP9x
	e0m+zm/4FtOry2ujs3b0SEXOp5/c4G70BRvWkVq17qQ0RE6TVnksFpvtAEVtGBqStVe9pWBVIRXm7
	RMzn/Lpq5Hb/tCbQDTrVORDRy6XnpV/ry9NREs1wX7DS8WVAwg4ddyFeggpQnfbeBBpBbvGU6ro8r
	GfHV31cCow42uA1ahrmG6rfQtgcSX7fAHibNvaFhxTIEDlqzEu65wHbhX50hnkJRyHYorCOopcT1L
	h19t+2u5zRfUh5e8ZPvhsTc0vgztxJzsS7rxsI5qMpFoVWe+Pf5R/S2qrlfDfbwFLcbP1pSBhAVWz
	HZ+qs6Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74ha-0000000AbIu-2WDE;
	Thu, 17 Sep 2026 05:30:30 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74hX-0000000AbGx-35We
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 05:30:28 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so412248a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 22:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789623027; x=1790227827; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8iXtJFaILHaNQYB7TRtsKAUY5yHxckNGkamGztIiuQ=;
        b=hFXsQohH3JWObFNBu89NdmjRKJjCl9VdqvwDzSZaS/RAIlF5TEzL4Bbny8Z3G7j8t4
         XyKgpWuGGL3MmZTQ3sqX4XehvD6ZNhaAbRG02kdrdsmnoT56kh2f7TcmSDHXsExpZ6dG
         Si3gVjEFHmfbkmJn1y8IOj9eS6wF/0elrMAHxDxFmwgFIa2WurWDdKE9zEeONxZJkTU3
         hciMiUFfgVwVraw4Cr0iXX6+nbXuyQ1sgomGWT6pxTqJZmR59AXZ9ryMPEj/mw3e0ezm
         G7ikYbObwYB7XOkaToxOJmWYP0irn3XJU904J/oXVi5/qF4QXC8cqSd+J3/R+fCcNOGD
         +dTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789623027; x=1790227827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G8iXtJFaILHaNQYB7TRtsKAUY5yHxckNGkamGztIiuQ=;
        b=r1/aWdNqc1kAdnYx4eRdj48uhAKP9C0QsvJXWXa16GK+cY6WkG8bRPG3TAC1DPYsfi
         t2cRyGAIuhcEXlCIPSSfuRy0l51JnzvWWLV0T4gl800VvqHHY/5qay7MJG2FYPHrLZ9B
         H4toxox7htkHh2FyVmL7XLg8VsBIPjv3gw+ztWxclwOX6co8YlR7/uKe1HL6sP9uPsH8
         c3gHcVtuyupqonfw16/4rUU+LG0h7E5r6YzYismzWOoSmapDasWGHFDw4ZSQLpyHtWfL
         JROcMzWmKZGkCEbNsqroHFv8BZOPYWnEkDWylzN8fK9VLrq2Jgj6SPTsc+fS98+Yj8gP
         L5Lg==
X-Forwarded-Encrypted: i=1; AKwUvBzlLDmtUppoTy5uLvlL+51T2XhxXA2WDgFboWNvBYxbUcbVcj6FRHiQAyMy0E4wNwsoVf4+ixqVRqPrM1X8H2p0@lists.infradead.org
X-Gm-Message-State: AFuF++mMF0DMjff2dx89gtkiRMPoQ/2qZTJurrnPUU7nYtV+FbWKCgyY
	wZEObIQN95sNKbV5EXFrqFNnVx2CWvHG0+JoiqRRu/mH1BYIkDKJygRg
X-Gm-Gg: AYBFou23OBBOnSXJpdEaQ1fT1hsdlvc10f/vJOGlFahPDGNi9RV+04em79xbjwjbGfq
	MVzlKTChLaUDkzxaCYwMdo8MFHoTK4vWKvuOlBmTJeDULBi9nQJ3pbErfMbO6aOzRx+m7d5v73N
	6PKJ2NGnYqJ63S+FMDmMMR41cM+n+0oz1IFTt3rW3TOwuWAvUsE7LiLwXZ38E6l+SfOs7BMM1ik
	tw1Tx1HvQ8uATI45e/ZmgBR4Ur4dFivio7ADGn2mNpQziUaFynRoW552OBwjxhplVErkr3ST99K
	itHSdXWrGwXB3M/BWbyAstrAoldyXx7GZIjNyamfZGVcmROHsiLnXE3YpAA4cei02qbBS3PM/7o
	iC1jw9LIFTO+F2zqhi/qr7Ve3Vdjm5rzFurs3nFl8VxO0TqDawwAxPIVcoD8pe3g0K8LrJdSnj2
	1glPFRwDYBceoB+gsbNCHHPK3v6otMTLxA5OCHc5+RnwE513ZVug9uCnjrH4UjSIrW4YtW8R212
	I3y9DhEdeoz0tjkafe9lYCKxPg=
X-Received: by 2002:a17:90b:4e88:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39e1e30ba45mr13210240a91.11.1789623025225;
        Wed, 16 Sep 2026 22:30:25 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3abada87sm1955836a91.14.2026.09.16.22.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:30:24 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	baohua@kernel.org,
	chleroy@kernel.org,
	david@kernel.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v8 06/10] mm/vmalloc: extract vmap_set_ptes() to consolidate PTE mapping logic
Date: Thu, 17 Sep 2026 13:29:29 +0800
Message-Id: <20260917052933.188679-7-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_223027_790663_84619B33 
X-CRM114-Status: GOOD (  13.38  )
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

From: Wen Jiang <jiangwen6@xiaomi.com>

Extract the common PTE mapping logic from vmap_pte_range() into a
shared helper vmap_set_ptes(). This handles both CONT_PTE and regular
PTE mappings in a single function, preparing for the next patch which
will extend vmap_pages_pte_range() to also use this helper.

No functional change.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
---
 mm/vmalloc.c | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 025b3a848d564..a0508bdb7d36f 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -90,6 +90,29 @@ struct vfree_deferred {
 static DEFINE_PER_CPU(struct vfree_deferred, vfree_deferred);
 
 /*** Page table manipulation functions ***/
+
+/*
+ * Try contiguous mappings at the PTE level for arches which support them, and if
+ * requested by the caller. Fall back to PAGE_SIZE mappings otherwise.
+ *
+ * Return: mapping size.
+ */
+static __always_inline unsigned long vmap_set_ptes(pte_t *ptep,
+		unsigned long addr, unsigned long end, u64 pfn,
+		pgprot_t prot, unsigned int max_page_shift)
+{
+	unsigned long size;
+
+	size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
+	if (size != PAGE_SIZE) {
+		pte_set_huge(ptep, addr, PFN_PHYS(pfn), prot, size);
+		return size;
+	}
+
+	set_pte_at(&init_mm, addr, ptep, pfn_pte(pfn, prot));
+	return PAGE_SIZE;
+}
+
 static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
 			unsigned int max_page_shift, pgtbl_mod_mask *mask)
@@ -98,6 +121,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	u64 pfn;
 	struct page *page;
 	unsigned long size;
+	unsigned int steps;
 
 	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
 		return -EINVAL;
@@ -118,15 +142,9 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			BUG();
 		}
 
-		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
-		if (size != PAGE_SIZE) {
-			pte_set_huge(pte, addr, PFN_PHYS(pfn), prot, size);
-			pfn += PFN_DOWN(size);
-			continue;
-		}
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


