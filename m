Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EEECD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 08:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9Am4qJqS/MfI7jTQw49PX1QkIeiHV3cGmQD98EHd9U=; b=dDgtCsf9wEUW1NGXfvKPVl0fRU
	zvN5MiQzWTdu1MZ7u/rgKhrzrRS4i4yQGvZaAr9Nj3EPUycStUwdfSA/y4nDA+ZG4mu3EDAssvwSM
	Ya+hAzeZ8ySC2NlnR9PkCDPtSikQ1Bfnsxlb7o+7IWXA06lhnQbo9MPLgmGUJk2VPeVz0FM2LKxD/
	H8dFy1nbKAIbWIU+UA+KGrBWfjVF8LOLyOja+Uot4FFGJkdRSFBP2UXTFt3iO3XKJ2mekXTO6lFha
	3YMHR0qDT4jNJDLbXnX3DG0SW16eCBlFcIU49884pCiro1pZ/KCxvS5RktI3vKDbkdG5Ij0lhFCfa
	1D2po2Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8Pw-00000000sCf-1XZk;
	Thu, 18 Jun 2026 08:48:08 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8Pt-00000000sAQ-48Bn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 08:48:07 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-36baeec21dcso345161a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 01:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781772485; x=1782377285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9Am4qJqS/MfI7jTQw49PX1QkIeiHV3cGmQD98EHd9U=;
        b=G6Y6M9s8OzIlTvKQ4C7hnURYMvnGyeovGqy8WiZYzb5E5n9XxKmeVdWNUM15pDEKt+
         AHtUebJsi+SFksFw+Sz7LBRWnyqsXd3YL4wD90aXKPbGRmZPGwOQYGphAiTjETot87Ij
         wRim/VwP3QLnnTXOljm37AF2ReABRjbnUN49QuwslJ+dpr37XlfLejyu8GkcVJmdhpvR
         bLhUfJJbyzFRNnWkCJiAq2O8bfc59ocF+f2CZdTityK+yro7oCW6VAejBiG9zfTHqTZk
         fSE1TlhBdJaG2rVSvToTZ8d7AbCGetqgkSHR0J/nYEjg3xSGZAMnlDi90G8hXwUHsX2y
         VQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781772485; x=1782377285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O9Am4qJqS/MfI7jTQw49PX1QkIeiHV3cGmQD98EHd9U=;
        b=SUwlNctZFrc8g6Uj44EGKfbs2ebf8e8GcddtdZ11+jt839//YbAdhmnFVekZvOqmSX
         uZV+AwvqobnKCOQsQ9xoA/jmRffgy96OYAQRKVQWxrAhbEIg8KfaZpUz+1XVIJrijwZj
         9sd6Pon1UTFSbHQB3PHYizgzaHRTYqACkvaUoF/RzgRJWytlhD/SUUfBRl3x6ZTtZyjg
         RzBE6evAVuzZ/lrpJ13Ny0eQvvC3vvZrzzYjvZczgk34zkkVIBxsNx4gxLjUGS2eUyke
         kZz/5qGmQ4Vlls+RlLzclLZMGnl6sN6n91y3+enZ2C+UW5/NuIgccBn2qZXPFGGjBDVM
         RIUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/IW3nA6KzjA6KsIPV7cKS3SPtHqQGF/aroVwHUXxUDXqUL1crx7jD5Svaz9cZbYgh0zaJZ/JdLWwVC+m1SPLJt@lists.infradead.org
X-Gm-Message-State: AOJu0YxxLfD6JOgpv9ECNkHRpa57rZM6UPEtOea7FyNuSYFG6bAmY1lV
	ZvZlHEPiv2lqRywdGN3/DOHIaZJvj4p7KDEsUjWZyqA5xlmpW3yY7ZAW
X-Gm-Gg: AfdE7clU5zAgERM5DzmVvJYjtstZs2aZngzWm3yC74uxip1CPov6kSyMqrwwfSdSDUU
	4NleK3i+GxtKeF5RCloFRp/Bmglkk39vREhQXtg7hzioRk926SGQx+7Ctqk4ze92jiifzV9s0c2
	zA1Cp17Eb9jQMvWl73ZaF/cll4n3R/fysQIy9flnr36KZcozMBTrgoQhB+NypGdhmnlssL9yuh7
	yBSjLkwUfbh4qt0rp1tZ3Ds8B4TShH+B8Ox9pE3MMAjlJEwwMqtOsrQB4BIV5i7Kvv1znrAXqCb
	FSgszbwuBgvFSCWKx8qBj9Dd3Z25slj1PIC3Z+ccj2vIrvrird1bUsLht5GsBitxFcNzTnYq/03
	KRgpnnouJicCDP38bJulVt5+8NspvSZ1TIllUp8j5E6O3zrfPTJR4y1Om9giq30Q/eh3v5tztba
	ujj001gTUi8AQ+HqjN72brvJUP6zAbBTxa58s=
X-Received: by 2002:a17:90b:2fd0:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-37c9be73275mr6808218a91.0.1781772485070;
        Thu, 18 Jun 2026 01:48:05 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521d8e7bsm8628856a91.5.2026.06.18.01.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 01:48:04 -0700 (PDT)
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
Subject: [PATCH v4 6/6] mm/vmalloc: align vm_area so vmap() can batch mappings
Date: Thu, 18 Jun 2026 16:47:26 +0800
Message-Id: <20260618084726.1070022-7-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
References: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_014806_042256_D7020E2B 
X-CRM114-Status: GOOD (  13.86  )
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

From: "Barry Song (Xiaomi)" <baohua@kernel.org>

Try to align the vmap virtual address to PMD_SHIFT or a
larger PTE mapping size hinted by the architecture, so
contiguous pages can be batch-mapped when setting PMD or
PTE entries.

Add __get_vm_area_node_aligned_caller() as a wrapper over
__get_vm_area_node() to simplify repeated calls with fixed
arguments.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 mm/vmalloc.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index fffb885cb2158..bc9fa93e2bdc6 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3628,6 +3628,41 @@ static int vmap_batched(unsigned long addr, unsigned long end,
 	return err;
 }
 
+static struct vm_struct *__get_vm_area_node_aligned_caller(unsigned long size,
+		unsigned long align, unsigned long flags, const void *caller)
+{
+	return __get_vm_area_node(size, align, PAGE_SHIFT, flags,
+			VMALLOC_START, VMALLOC_END,
+			NUMA_NO_NODE, GFP_KERNEL, caller);
+}
+
+static struct vm_struct *vmap_get_aligned_vm_area(unsigned long size,
+		unsigned long flags, const void *caller)
+{
+	struct vm_struct *vm_area;
+	unsigned int shift;
+
+	/* Try PMD alignment for large sizes */
+	if (size >= PMD_SIZE) {
+		vm_area = __get_vm_area_node_aligned_caller(size, PMD_SIZE,
+				flags, caller);
+		if (vm_area)
+			return vm_area;
+	}
+
+	/* Try CONT_PTE alignment */
+	shift = arch_vmap_pte_supported_shift(size);
+	if (shift > PAGE_SHIFT) {
+		vm_area = __get_vm_area_node_aligned_caller(size, 1UL << shift,
+				flags, caller);
+		if (vm_area)
+			return vm_area;
+	}
+
+	/* Fall back to page alignment */
+	return __get_vm_area_node_aligned_caller(size, PAGE_SIZE, flags, caller);
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -3666,7 +3701,7 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;
 
 	size = (unsigned long)count << PAGE_SHIFT;
-	area = get_vm_area_caller(size, flags, __builtin_return_address(0));
+	area = vmap_get_aligned_vm_area(size, flags, __builtin_return_address(0));
 	if (!area)
 		return NULL;
 
-- 
2.34.1


