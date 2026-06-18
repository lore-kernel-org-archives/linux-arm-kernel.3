Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F039ECD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 08:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLRuKvFhInROLg4Q8kC57ftYeHhuWOIlgmE1PN84SUM=; b=aGCQ1wmbGtD5Lfc65jDAws52OO
	8ed3Sc2NlOW3bBKgyoSEurV3Zx0Oz6H2R46v9d/2o813etnUllwMJo1cFGtmUXl3yC8pft6cj9JCM
	DUl1ycv0DDjK3gbnwsd0tj9HYXWJM8uIQpqEoaIOJ0o4oHwt+tXQt9MwOe3r+STgBNM79hh0z/xOp
	aVRFxE14L4C0i2CBMfHF+qqfmq2KOn2lUaVFfqbZKmwou4oyBqJf2B6FbkPz71HAJKl1Q6LsaCOdR
	ehEO1NMsHriPXbMC1C1/4TLGQahwBSrEuYefLrLLd4ymrcf6sIuenCiOnZo0wsXxvK+m7AFNpULvM
	soe+IH7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8Pf-00000000s0Z-3x5v;
	Thu, 18 Jun 2026 08:47:51 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8Pe-00000000rzm-20bm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 08:47:51 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-36d98b68d68so361514a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 01:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781772470; x=1782377270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLRuKvFhInROLg4Q8kC57ftYeHhuWOIlgmE1PN84SUM=;
        b=rSO4A9lcdbfC+i77fRaw1LgWd22G06EDexoZXbYA+2Rja+mfJmDvEJSd8agA06pq+b
         CkwQrINfkD3Ei5+6+zMzJS4205a17fW7ETr9Y1yJjSrpAHTfPr+rM050IV5CbE/rbN4G
         SxuD/mJY8A2hABItvHJwuW0t3EKKLpQqESMO4Ae/LbOIL5qLNEv16rFr+yHYnvUI+b9S
         aoCsHUqv9XlQP90ONMrq0xzUCkZOzmATw0ESYPRefz03kPu3Svw9NRawPxi08Vw2/Epb
         47LhLz8S2QaisXlBAB+cy5pbXZwJ7w+zHBfqqX/t+BpaRxrYsBmSEHYsSBpICw74OCrC
         PS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781772470; x=1782377270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kLRuKvFhInROLg4Q8kC57ftYeHhuWOIlgmE1PN84SUM=;
        b=TDIpWAXE6/7dYAka9mBTEeHONgyVkystmQhcvzCRHoGa6ETwU0aypsYIe+Xbp+GQhJ
         9BlsAQ1Q1LeZU93A9miFeBYddTSvYp/pzkelZRIioj+7AfuEapxvAV9qeIVOidUHFXzU
         HFIkboYSALPSgQIAynqoCN7bFi2K8ogH/f99RqTarF09j6TgWz9GYrWUm1AR8n9SSObL
         IsckPHKLH58a7KLGBj6bEsW+PU457p7dB88Q04U5t2II3Ow0dkJ2MqFauXtn40qswSqE
         CZG2SZUjB/5R8qsA8K0izz9KmJrw+JopHFjcI/9YjuULhThQzvueAjk/HsZHp2KgesLR
         vFuQ==
X-Forwarded-Encrypted: i=1; AFNElJ80yaE63VT4xOgWtLU/1CvVP7eGERv23iEQmEK8bAfZ852sov/TEJTRtlS0SUvNfALRsNzIiw6WfOoI9IUrBtkd@lists.infradead.org
X-Gm-Message-State: AOJu0YwutgLDlqANouzr3VNiielV4YkdOhsNikyCZU7lL2FLaYKjhBrq
	vLIeGC1glVfstgNw4b6CTDD9d1/CRqlznhopumgv3g+GHA79cRiI/Lee
X-Gm-Gg: AfdE7cl4lz03iZaJ28mPsVpVDjH2IzjIdZ/anjMuWvk86oT3sXzZUC0BVRddkhAPufx
	0Y+jAc8jtUjarFJgwtkebLa7mMnHkL4/KIllYdyhdDcYOrAl9Sy9qXrgsDARsyPPJ/Hb5mu/vzi
	jfGxzGYzx3+5kY4Zop/GduwffA2OET/90O8T9EH10OF7r04eqT9883/TQ8+vFjZgCVFmYBN0zlw
	cu9qu2UStQ7ac4bhC7lpXhafdfKNyoclGnYNBMaVNXVdyP08xkf+D3snkQrx7WbfyU36FyL6uFT
	y8cjMXmMNn/GEYd2lE9LHEeB9htB0cVX2tTE1bt5gzyQBIiIfKqHAbk+r6dIpzdHB4qFcHcx3Jz
	35PacSyJ9+4IEv05bIktAmuJb1zbEz3DkuTe2oYg3vMe/huRpNsnIzNz4Op0VWruf/+2ZSMDksc
	FOtExp/sG+BEuQ9Q8meRnuKmCeeRBeqKGpC6k=
X-Received: by 2002:a17:90b:1344:b0:37c:607b:2cd9 with SMTP id 98e67ed59e1d1-37ce43c0ed0mr2690740a91.0.1781772469588;
        Thu, 18 Jun 2026 01:47:49 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521d8e7bsm8628856a91.5.2026.06.18.01.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 01:47:49 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
To: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	urezki@gmail.com
Cc: baohua@kernel.org,
	Xueyuan.chen21@gmail.com,
	dev.jain@arm.com,
	rppt@kernel.org,
	david@kernel.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	ajd@linux.ibm.com,
	linux-kernel@vger.kernel.org,
	jiangwen6@xiaomi.com,
	shanghaoqiang@xiaomi.com
Subject: [PATCH v4 3/6] mm/vmalloc: Extract vmap_set_ptes() to consolidate PTE mapping logic
Date: Thu, 18 Jun 2026 16:47:23 +0800
Message-Id: <20260618084726.1070022-4-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
References: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_014750_521661_DBE444A8 
X-CRM114-Status: GOOD (  13.16  )
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
---
 mm/vmalloc.c | 44 +++++++++++++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 2c2f74a07f396..6660f240d27c9 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -91,6 +91,35 @@ struct vfree_deferred {
 static DEFINE_PER_CPU(struct vfree_deferred, vfree_deferred);
 
 /*** Page table manipulation functions ***/
+
+/*
+ * Set PTE mappings for the given PFN. Try CONT_PTE mappings first when
+ * supported, otherwise fall back to PAGE_SIZE mappings.
+ *
+ * Return: mapping size.
+ */
+static __always_inline unsigned long vmap_set_ptes(pte_t *pte,
+		unsigned long addr, unsigned long end, u64 pfn,
+		pgprot_t prot, unsigned int max_page_shift)
+{
+#ifdef CONFIG_HUGETLB_PAGE
+	if (max_page_shift > PAGE_SHIFT) {
+		unsigned long size;
+
+		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
+		if (size != PAGE_SIZE) {
+			pte_t entry = pfn_pte(pfn, prot);
+
+			entry = arch_make_huge_pte(entry, ilog2(size), 0);
+			set_huge_pte_at(&init_mm, addr, pte, entry, size);
+			return size;
+		}
+	}
+#endif
+	set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
+	return PAGE_SIZE;
+}
+
 static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
 			unsigned int max_page_shift, pgtbl_mod_mask *mask)
@@ -119,19 +148,8 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
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
+		size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
+		pfn += PFN_DOWN(size);
 	} while (pte += PFN_DOWN(size), addr += size, addr != end);
 
 	lazy_mmu_mode_disable();
-- 
2.34.1


