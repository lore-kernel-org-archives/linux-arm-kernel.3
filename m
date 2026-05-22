Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 149EDCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 05:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HydODzhJG5OH95FA088njE0U9Wx1Okn+yobhn9IOhgQ=; b=PD+xgMq+k2I6/vhGGM38SCXXLS
	bJkBPUn2HON1ibk6QOvN2N02F+EqMXR7v/LamffXKbZ4ezSoSVrPSDdd28X/H3HxFq35tK+Pffg1L
	o7/Gzu1KK2WZJ8+52HP4suKNKyuP1JEG2HnTNovdeqhuoJZzFEr1ve3FF7AqcgER8izdwTjhGri2z
	aGpp75VCUZ67J6OACwg/mk4+LG0ppVuei+4UCHiu4eLoRv+Tgxj4iES+cpwvxDAQAYzKbJxYc9qKM
	NRkUffiFeMuF3dISQpoaB/urT67EzguZ1QsoBgJ3r5lv2hTtVQglpx5tI3ZiT2saEE/fWJon5MNMu
	q7ahfNTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQIUY-00000009rcd-0Muy;
	Fri, 22 May 2026 05:32:14 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQIUR-00000009rYq-3wEN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 05:32:09 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2bd80b3aa13so44939515ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 22:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779427927; x=1780032727; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HydODzhJG5OH95FA088njE0U9Wx1Okn+yobhn9IOhgQ=;
        b=J8bIF/rb/U+JjXwF2IfQ9yi8qhkInLyIMPedgos4jWOUgzambkXuNI0BVzgIBWSsuq
         3kgUL7cyiTqd4x81RWtn6I7ffU2Bsdmv141bcu+Uus3wEDKR+TMl4PszVUzNL+ILbpLK
         IdtSi5hXPnb2/4gy/eJ91JIzAjj97xY6l50ADBPQkDKNxXxVMhHTi85TfZMH/veIgjuD
         um2RLJE0bIVCVw5TCcrLeXnNE2Yr+j3z2d6nBFOBMPfVDuxVy+EX2vTHvuhixXjx+w74
         bjV2r2ZANN6peGom6QzQmU8uNjn0WogzAJLO0RgIsiHn7kbD/25KxYSD0E+/lfKRq3H5
         s++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779427927; x=1780032727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HydODzhJG5OH95FA088njE0U9Wx1Okn+yobhn9IOhgQ=;
        b=BT+Rp2mwy8adH+y7tx5//VLOjWZR8Wu7kNZi4fprvYfu7jYhL2zrJfi+Acmbcre0po
         FN041jtsqy4KfMiehrfbjsgSDk3fOAHq537/KLfNwpifBp9QItf+J6m5hi/VXHkKnZPw
         cxlZkQYSHfubqALKMKleQq4U8SOeJr9adeYT6oPcwzj7kGD86sjgdBZV20uWKYcigyqi
         YrVi/gfVMM914jVOP/jz3ZXZ3PuObT1ipV+vx6H1ulkCeYgVW8lSv0ndW6vp4Vjs1R6O
         08Jj02cVSRY0eaO4npq3v/1aiGXu04bBk/K2GSVTXIX7HjTLgqqR7APvw7xMuKKGYdVo
         stvg==
X-Forwarded-Encrypted: i=1; AFNElJ9tZ6H1unb4iXUGAKDWbXzJ6C/jGGf3XO1dYivh45O0v+QOiYZiqmiqhURmZwWG4sNsB6DqOZO5n9f8jAHXajCr@lists.infradead.org
X-Gm-Message-State: AOJu0YxePZfl9MxBNHhkM82BVn7Zm+4XMlkrqLThswkiwpbwaAS+7/QH
	UZOj/cFs6FHJfoK2ELlCY+GTkBKb2OEEgQ5Nw2rfQXvyvJ6usKffmUEF
X-Gm-Gg: Acq92OFH/r7GMGJjfLcjtwCucViYnbYcsCzPfqL82fzTatDrRT17RYlNtXt7u5cjkSD
	05Y+kqPIGtYfkS3zHpPuwc5YaiyUDUfRw3hp9nURarEm6+p5KKcb0ycjet41bx0/DU5qrlN8F2g
	rGZH0vFBYktBJKTXbcUnu0uNI+Dg2eeDX+Rhnz9xBlGbdZld7A7CrjTrIKB901L5y5Xp1MBvI+f
	HhaVLFLHddsfp6w4vOqBIhf0B8N4YeUSZeJHD92RFFDIBpwOdfsxEa6leBXkk/eTBA31c6WLeA7
	mm6SyFCTTNlCcfhZUtfAU548pBYb29eBDF9VLhYQcVMU5ljLThBGY64ttr39txOrxpZlI7OKXg0
	Dv2ACbtYuAVBpqzQ3U2q6/+91GvU+w57FUMaGQ74mMIHqceNmkgcLLQ8mvFvyxUOffg16IfTgGm
	SXQy7U6ywuqlMmgB20loYwFRO0PSQ8gbFf3k4edjdbSC+oso8o3Pc=
X-Received: by 2002:a17:903:f8b:b0:2bd:5026:ca11 with SMTP id d9443c01a7336-2beb06ea84cmr20575295ad.2.1779427926999;
        Thu, 21 May 2026 22:32:06 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56d68adsm4782665ad.32.2026.05.21.22.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 22:32:06 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
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
	jiangwen6@xiaomi.com
Subject: [PATCH v3 3/6] mm/vmalloc: Extract vmap_set_ptes() to consolidate PTE mapping logic
Date: Fri, 22 May 2026 13:31:43 +0800
Message-Id: <20260522053146.83209-4-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
References: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_223207_985464_D782256D 
X-CRM114-Status: GOOD (  13.66  )
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

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 mm/vmalloc.c | 49 ++++++++++++++++++++++++++++++++++---------------
 1 file changed, 34 insertions(+), 15 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 2c2f74a07f396..53fd4ee460ea4 100644
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
@@ -98,7 +127,8 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	pte_t *pte;
 	u64 pfn;
 	struct page *page;
-	unsigned long size = PAGE_SIZE;
+	unsigned long size;
+	unsigned int steps;
 
 	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
 		return -EINVAL;
@@ -119,20 +149,9 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
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


