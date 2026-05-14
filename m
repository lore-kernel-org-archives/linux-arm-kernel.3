Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F778CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 09:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F795Xv5J46ljVi2+6iHBT2O82gjybUH4psWzRnSB2TA=; b=dW34yYxuCFyIO9o0RvHG4pW9I6
	k2G+cZcVqS6FMBMmk2IesfgzrWDZgFPv3SOGbaedRCr8Se3JLZ5cJf1bY+7pWZcQnmuXqBjI5VAcM
	RfD/vBR1WlMznkcSk51sRMhnUtnrdSNzUsWb9/GvRpRe7V4ipC/6+dCsDFl6B8h1EqSBmzu/oN+R+
	IokYuKf/VlloyjAU90RIucpV7xOFfSxM6B4hYSpmbMWlAk8BJL4zK9zeMdQqqw0gS00z7S+hva+t7
	63TcBeYb/WdIoEIvGyiU6GgUr5LteWthH+XWU552csAQGpjDaPpaYS3pAZ8R+lTTx6cnq1eMeTvyB
	33/PiJKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSZs-0000000569V-3WTT;
	Thu, 14 May 2026 09:42:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSZr-0000000568K-1FWv
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 May 2026 09:41:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=F795Xv5J46ljVi2+6iHBT2O82gjybUH4psWzRnSB2TA=; b=p2FmvsmDi/tvQ7QJTS/5rA0LB8
	vXytOG/tPMFVktyYyorQIa6LVvaqNkSietSfVSbTsdqklnmxDs6lM/44JPMj2UN2hJDpwDOaxIhG9
	P/qAxWKvjy1fo5AfmuQdeeikbvCp9JVGL3iruWX3/7aNqxz1IoU8ysdg+1bjKNKovvFfr1B3DQxPe
	dn0rF2/WRJQXhKjqreGLC2K5ZwPT3MTrIjCH55eE7rLWTIlfINE5Ua+KKfk+AirGSqd+YPNskWbLv
	WJRWuIxFyijbzJm63TDPBm4LId0s8Op5+eQZ/AoRnDzbq9fBqBUj6CgyqAOQDiYJTJn6XtP3MbXl0
	M0Ztd2Ew==;
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSZn-00000002ZlL-0a8i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 09:41:58 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c8173b2af32so5703240a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 02:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778751713; x=1779356513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F795Xv5J46ljVi2+6iHBT2O82gjybUH4psWzRnSB2TA=;
        b=qb1lnXxg3WlsD8m3JJG/N34INvaSzI8t1PgaA0DvjWFF8yLykta2EwktUfZGaWLbCN
         pSpKyhKoCqJZPrMPFNcFQeXlt5DISdSg34LVSHSYo8lpr9wwvG4mAasjk6mIN1x1x9bz
         r0ap59WAcVcIizHM3yaN7tGiHemo0rG319qFqTX+stQomEEG5VLZOsu02j5STfdQQO1u
         GIIdhTAKG3JHAmOu0eoR9igzyTpwFOOkoMOCyoJcfLaywHTS6NC8CJIyqsUgW5XQzVAQ
         E7L+Vfl+WCU36bQ/jk/+Z1NGumCk6/h/Miy+Tcq5E4EBTFV20tJMf3edjPOrcpJIXOut
         ff7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778751713; x=1779356513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F795Xv5J46ljVi2+6iHBT2O82gjybUH4psWzRnSB2TA=;
        b=PljF96LUYGGLojK8Wq/fRGh8KHSYpK9uP8P+nHmgynh1PcK0WN3LnxIJBo1+mVmFfV
         jDXSgw3pBh6mYLNzUQx9Qjk7muNVx0F9AttfMDvd3mZzItI+WiEtszmhUsE+wNhq6wnu
         Qk3OBEUtR+o8t+PI3t2iG1J3ebTc/d+kGBcqIVZmUAF2qew0ZhWzN9XfUUYPJ6t+3gWp
         mxC4TU01WTIVTjPqjLPP2nQ8Re1wvkliJZj3exjXPBkEmVoqyqNxUSwKjT/Rd+TlMECz
         zVIn65YIW3A+s2uuuBwnmOm6tk9NhwkWOnUv6O1DYqFaFXtQrlPZF4h9lPIDUfrn3aAH
         Vpww==
X-Forwarded-Encrypted: i=1; AFNElJ8LgPK8ydSGI8GbhkC3uLozo1VjF63xj2nK4m8dYL0ddfM4WPq60pv+HQeF7qKAMuSRedALcq95oVRLiE69Fh5T@lists.infradead.org
X-Gm-Message-State: AOJu0YzOkNoj1wYm4UUHRLs0MF756+qi9K25AhrrbLJBVldou6+I0FIs
	/838LqWzkTE4UOiMlx0pSOeGupa14eoRh1d6m+r1mpEUE1IAKNlB5wUb
X-Gm-Gg: Acq92OH8qVNbi5ApafsLEUKQkE/sDGTA5Bl0yVDKtZshQF4+QSpZDeAJTRRh6KVi3jf
	Ffdse2QhpM4XJ7NkaNTXtrxRgI/eWZ5x3vIW8c94FYyWs942F58xbURSJRkp9I3zWvRkCFBg9m2
	8zQxhVw33Lrj4Acc6dSluUlQ6tQUkfoYGIfuQkg/gucxVZL2TBlo2OgAVMoTD9T0ACaHPWTIQRf
	rRa6kBgotqPntWDVEpJDkaU9eV0lKru/RzqHskkiNIr/fgnIZRmp/kDIyf7r//K9XtKo+saIzu8
	rszQsXvzRiogtrKVdCGIB6P0+pMOjqXy4+91pAcMFhuLBEXayxjb2LYxQaMyEcwM+yK10zIGh3u
	JhL7rYcM+lgiPOUgN93Fx1pvkufq8OuSSBjapLO3bhvdSDJ2YWB+5Rd1DEHDHBxb93sK0IykXNI
	aeO2tT8W/7mEDO9bVzagw4Y/IvZSdX22kYWx9cFDJoUcI3VxIOdqUJDdCd
X-Received: by 2002:a05:6a20:2589:b0:39b:d937:8010 with SMTP id adf61e73a8af0-3af83289f88mr8096707637.45.1778751712910;
        Thu, 14 May 2026 02:41:52 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb114a70sm2351244a12.22.2026.05.14.02.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:41:52 -0700 (PDT)
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
	Wen Jiang <jiangwen6@xiaomi.com>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v2 3/7] mm/vmalloc: Extract vmap_set_ptes() to consolidate PTE mapping logic
Date: Thu, 14 May 2026 17:41:04 +0800
Message-Id: <20260514094108.2016201-4-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514094108.2016201-1-jiangwen6@xiaomi.com>
References: <20260514094108.2016201-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_104155_632135_E13222E0 
X-CRM114-Status: GOOD (  13.57  )
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
index 3e9e5156f..9bfd0aa34 100644
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


