Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56605CA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+brmQ4g6fgo5Njbplw2vRXkj0/5uqGmn7J2kABfLu4=; b=5FhURxi8tO1gno8ZHRq12gECbM
	gv2aMXqhnLl1O6ELgYYnxB/rYw6xZJILoBApPVhBMzeMNWf3rh42lNwJj9FoL8Nc1F8RxLmg1VFA+
	zOWtvHHp0ILkufxtpbmlG65lDiG3h1HEzls/BxAilvRDG4+7cXaLb+D1PHfxj2sbyBglKZfiQy8R0
	HntH7Te5K8WaccpSX0Sx/sJAOM2GiSYiExY6gM151dUsMAyhMHJ+EiY07x4+Z0aUQofyK7eHncaX8
	vFcizWQc7EXXqlWA5ueEL3QxWIn5F4uNlPPoCR6fyjGpYx0eOCDtil6uAPDAXl3D6yxEcXngtTB2T
	NhtVqeFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZHl-0000000B4pa-0BMa;
	Fri, 02 Oct 2026 09:10:33 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZHe-0000000B4jh-2Ukd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:10:31 +0000
Received: by mail-pj2-x0f.google.com with SMTP id d9443c01a7336-2d747ee1f38so33707705ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 02:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932226; x=1791537026; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+brmQ4g6fgo5Njbplw2vRXkj0/5uqGmn7J2kABfLu4=;
        b=lHa/JjzXjz/A6xhpWQwwlDgCtjFH+hBJ9lDkNb8Z0fnqjE2ZsJuYP54VBh057ZG/uf
         A5j6nU10UAsoPHKEu4zF4qb0p4D+/o1aetvH21hKDu+DHnfP1LYC8Uxc+uF1noE76RF2
         YgS8ZK0C0ew00WH5ngY2jp7SxHan7qIqq8Kcga8ETNZA7NCyN419I61Y0b+syroSBTD6
         PwNWynkR1nCqceLcrf3rx8wOd+UhodlVkSCYJ9akBx47573AcfQqpplWuH6ext33Nlp9
         ODgjQU9zhGrUsSJywmAymW4CzgJXDXHWehZHpk1EaC+jh3s+lhxEGugLkjLKNU4tY9Or
         5k1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932226; x=1791537026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K+brmQ4g6fgo5Njbplw2vRXkj0/5uqGmn7J2kABfLu4=;
        b=IodsD96nNf2Hi3Cxn4MKuy5jJRn3CVJ9liXvOpiEgnA/61p1YLeW/Ar60I7IS6WgOf
         jNc3g6EhQI/mUnU5THqx7KJJrOAx0CUFXKsKa7+7IFTK9gu2GPJFTDJ4kOLmtajtyeAd
         CF1VJWTpmlN5/L++iExJJEBe6foaaKBwv9di/KxAUW7iiFnnNneySEGK0pT50m3s3bP5
         Oc6q3t+3o++Qxf+VCktsDEYfiKYuAL4gOFj3OSX2oxQhY+A2nutr4R3e5pxQtdcsXBf9
         OdRUCsh/kdsSYKeMVxvSB4I4TapdQMuPFaIf0BKaekio9Z+YIF913QviJzq0hNeqU1IN
         tJ3w==
X-Forwarded-Encrypted: i=1; AKwUvBz/xHT5teq9K65jtqo2dT9VrZ/FGho/Kn7Ffr5oSuNBoOVRxj+RxtunCgiIjm9FIOwjlVAiqvKmLpAcE4NtNWwR@lists.infradead.org
X-Gm-Message-State: AFq9FYKcPq8Vqp/LVw6BnoA7YKk3CuHLbWJRcbQOOdS9IDyFLgYkUg/W
	UCYPgyMVy6GR24Qe3U7lV9qbqfU2v82Aaax3xji7fAUo9Av84UBYQnsP
X-Gm-Gg: AYBFou2P5rFsRPQjiWAk/as0OHFnPSsn2FnJ/63Ujc7iIawLOF7gplFw9KufQg49pIl
	taHVC0UZTQMG2Aodvf40hYebxUXQLjyCDd1idMCc55ThjR/tBBE4rLBvkWLnUC9mNx1pw8ax4mP
	FNmDVOYuVmjEupEOmqEBiMbRrqIHz/6My6vSN9Up5I7t0E7ms3qQW92eldRW5oCTl31mfFLfTYb
	yKHbtpwejuhoSH8KGLNlBngrxxEM0DDWMxEI0W9KwRRHPE+cT5X+Df567ykkcDGsYrBkkK/RMzF
	GFpQa4N5XJaIseG5wmOIq9WfubPenZetzyi0ZQViMeJ3gNcLVT8dPHxlH2TJuSNMmoghPOvcoRh
	zrBDDbSHr5IOm4hq9TMdCjPQfuDON6NW+0qWgt/uNeGgtg9l724Z0XMTdYIy8LUUFqKkxCz/f7t
	nFwaMS5vyELpVvjbHj2aSSbp2t8demVRgN0fzO5Q2iiJrxcQSz8nrjh3ghX8FtEQty4/Yf/z2OC
	Lbyb96bxBPNKMvJlwexMg==
X-Received: by 2002:a17:903:228e:b0:2dd:c100:7cb6 with SMTP id d9443c01a7336-2e49b6b662dmr16609685ad.50.1790932225869;
        Fri, 02 Oct 2026 02:10:25 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ab2b9sm5480555ad.36.2026.10.02.02.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:10:25 -0700 (PDT)
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
	ryan.roberts@arm.com
Subject: [PATCH v10 05/10] arm64/vmalloc: allow arch_vmap_pte_range_map_size() to batch multiple CONT_PTE
Date: Fri,  2 Oct 2026 17:09:42 +0800
Message-Id: <20261002090947.869220-6-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002090947.869220-1-jiangwen6@xiaomi.com>
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_021027_251519_5B7BE269 
X-CRM114-Status: GOOD (  14.51  )
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

Allow arch_vmap_pte_range_map_size to batch across multiple CONT_PTE
blocks, reducing both PTE setup and TLB flush iterations.

Previously the function returned a single CONT_PTE_SIZE for an aligned
range, so the caller mapped one CONT_PTE block per iteration. Now, for a
CONT_PTE_SIZE-aligned range, it returns the largest CONT_PTE-aligned size
that fits within both the remaining range and the caller's max_page_shift,
so a single pte_set_huge() call installs several CONT_PTE blocks at once.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
---
 arch/arm64/include/asm/vmalloc.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
index 4ec1acd3c1b34..c29704a19e276 100644
--- a/arch/arm64/include/asm/vmalloc.h
+++ b/arch/arm64/include/asm/vmalloc.h
@@ -23,10 +23,12 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 						unsigned long end, u64 pfn,
 						unsigned int max_page_shift)
 {
+	unsigned long size;
+
 	/*
-	 * If the block is at least CONT_PTE_SIZE in size, and is naturally
-	 * aligned in both virtual and physical space, then we can pte-map the
-	 * block using the PTE_CONT bit for more efficient use of the TLB.
+	 * If the range is at least CONT_PTE_SIZE and naturally aligned in both
+	 * virtual and physical space, return the largest CONT_PTE-aligned size
+	 * that fits, for more efficient use of the TLB.
 	 */
 	if (max_page_shift < CONT_PTE_SHIFT)
 		return PAGE_SIZE;
@@ -40,7 +42,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
 		return PAGE_SIZE;
 
-	return CONT_PTE_SIZE;
+	size = min(end - addr, 1UL << max_page_shift);
+	size = round_down(size, CONT_PTE_SIZE);
+	return size;
 }
 
 #define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size
-- 
2.34.1


