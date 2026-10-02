Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247C5CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nr+lcidngyc0ulTQrlYku4smM8GtiOinATZrrJ6f6Ao=; b=Ocrq14Upzxdifo4w/qZdt+ely2
	ND3kzRiudgAgO1q+YlJYS4JBZxGwY4zydtk/Md2L3EbH1Ef+tMbqtgYFclwvDEEAcnOQEfbLQn6KO
	9fNFaEgVYauGkGkkGeBlsz0hzLc2kv/js6bs46LOQIB2/rovNTMN0QyBc//Agqcw5EtHWx1dqf7uL
	21kKUNTYDvooT2hz3mBjn+CNJsBkgrC2BnPu74Nup1oYCRq6Fzf7pgBUBdG6KrfadgMzU378v1mtP
	sjMqRczngXUxuHauIfnKy4eOdpUVydbZ5wet5eKRTQUMbLGJPsugioZ+ebcHnpEs5hCwBMHszt9v1
	H0k1497A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZIA-0000000B5Hn-3bCp;
	Fri, 02 Oct 2026 09:10:58 +0000
Received: from mail-pj2-x26.google.com ([2607:f8b0:4864:39::26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZI7-0000000B5Cj-0vfq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:10:57 +0000
Received: by mail-pj2-x26.google.com with SMTP id d9443c01a7336-2d747eb79f7so33799005ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 02:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932254; x=1791537054; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nr+lcidngyc0ulTQrlYku4smM8GtiOinATZrrJ6f6Ao=;
        b=iEjzu1/cta/vcGrzxrYSYqcfAKyHGERPYkMC+nAM8u4iWK2bHjLVRug2jrQQhUrLml
         H2iF6tHaGd18cEOtCOMwitWvrpuMXu9hj6V0gWL2LDT+6VXFF7I5ylOAPlKianA6CI4P
         wfkpwnTLMwaNrz607hiLW+bmxNQ+fhGY7q6RcFj7WMzGJicV0dVsGDvN8eLDOBxoCm3+
         1mN+LqK9uhioM0Nk3CKX98V1XMtbR05N9Vvr+HfWWA1ZCyX3xCrjjqC2EVB2or1n1cTc
         cdEUChlr/YTPzFbcFHTH5iBh2NM4+xL/3iRBOouzBAQkwdCGsWMQVNtfW/N8++gSodUH
         4V6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932254; x=1791537054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nr+lcidngyc0ulTQrlYku4smM8GtiOinATZrrJ6f6Ao=;
        b=SaJC2xXvyLzQyP3QFllQ/NwZx3KT0UmxkjZk7Xbv5rMqKJqeH/73yMw2j3f/boY7Dd
         1NeJt+TlvPkqsPxOa8son+q9v6sDey6Kj11DaQibZPLt7URhVo++2W6wbT8ImXj9Fzo3
         B8/5zEbcw8zSFFuOqTevaWKyz/FT6OIml6HmmiF4AbFIHYruTHAAHq/nsK5YI01DSx5U
         Wa4zaymLUdgyDKLUIhu2yk/WLsX1nGaCUovU5OjP69RPS8GiffrO5oXyZmnjzICY5k3p
         xHKNQ0ulhpGrlgcq6Dm/Tn1ozzTxfonvu/E36+283oUPOQOtG4pWVaMJiV8VaHhJkG/E
         o7MQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiu3eAfz5HrVdGU9QZm0JUPbZXCMIyFTKsFr8QU0rg9vQJqTC+oye2YRx0kulmBFPjAS19CepCNYlUPUE1kLrr@lists.infradead.org
X-Gm-Message-State: AFq9FYIP7nIhZ47J8jg6viSi1iO7in0i+Toep3UXCmH4eDM88+V4br+i
	uKHeWYZztF/E4vGu35pCaOqbvtRCqLbOaU1XX/l1WTbHNyTxWl5JpC42
X-Gm-Gg: AYBFou26/FvQp5t3FC57lc5YLcItBi3LZXWrvuThvRx/xndKNtGr7NsonCOse68wShN
	UtG4y69azzFdfhr/C1tdVmsJ0pHc9/Dwi1y/wQBEzsmI0/yuod+fX7tA3W7EU6qZzJhFkDSp3X9
	a7LcSwKULDa/k2ISSIRf5s1v6C/x1IlgbO913h9M3IMI290sRr5kuqfsEHv3Obb9KRid6aoYf7q
	QUTjJvHu5lUN26rdKnXPsb50GdGEAdELObwyhQWVwrdUI97Oqcnll1POzGXmqsONupg+jREHr6X
	VaHbTmYPZtL9oOoYLya1zr5iz9RxgzVUlTax4OEaSbedxhNojm3SepmKKvozOIr46pfRseYbwBB
	MUrJ2ZqRgtbV7jCr8NrgOyZjs7CDsudtp+sj6Cv0pBPpk0eYXcBEteMirc/oihh87TLz8FZ1BNn
	JJiiMFhjdl+pyltqzvKShwOOl50BpHPw5DUaTf9k+w1vHRmRmKGxqUn+aMp3m875og0T0NVm32e
	cLDcm8T3nDKqNaG8cH7UFn9hOdnjts9
X-Received: by 2002:a17:902:d98c:b0:2dd:5363:3219 with SMTP id d9443c01a7336-2e49b4e303cmr20733295ad.20.1790932254082;
        Fri, 02 Oct 2026 02:10:54 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ab2b9sm5480555ad.36.2026.10.02.02.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:10:53 -0700 (PDT)
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
Subject: [PATCH v10 10/10] mm/vmalloc: align vm_area so vmap() can batch mappings
Date: Fri,  2 Oct 2026 17:09:47 +0800
Message-Id: <20261002090947.869220-11-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002090947.869220-1-jiangwen6@xiaomi.com>
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_021055_301204_5B025F6B 
X-CRM114-Status: GOOD (  13.25  )
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
PTE entries. We do not expect any significant overhead for
this.

Add __get_vm_area_node_aligned_caller() as a wrapper over
__get_vm_area_node() to simplify repeated calls with fixed
arguments.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
---
 mm/vmalloc.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 4acd1ec27604b..3555dc3794e4c 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3328,6 +3328,14 @@ struct vm_struct *get_vm_area_caller(unsigned long size, unsigned long flags,
 				  NUMA_NO_NODE, GFP_KERNEL, caller);
 }
 
+static struct vm_struct *__get_vm_area_node_aligned_caller(unsigned long size,
+		unsigned long align, unsigned long flags, const void *caller)
+{
+	return __get_vm_area_node(size, align, PAGE_SHIFT, flags,
+				  VMALLOC_START, VMALLOC_END,
+				  NUMA_NO_NODE, GFP_KERNEL, caller);
+}
+
 /**
  * find_vm_area - find a continuous kernel virtual area
  * @addr:	  base address
@@ -3655,6 +3663,30 @@ static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
 	return err;
 }
 
+static struct vm_struct *vmap_get_aligned_vm_area(unsigned long size,
+		unsigned long flags, pgprot_t prot, const void *caller)
+{
+	struct vm_struct *vm_area;
+	unsigned int shift;
+
+	if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE) {
+		vm_area = __get_vm_area_node_aligned_caller(size, PMD_SIZE,
+				flags, caller);
+		if (vm_area)
+			return vm_area;
+	}
+
+	shift = arch_vmap_pte_supported_shift(size);
+	if (shift > PAGE_SHIFT) {
+		vm_area = __get_vm_area_node_aligned_caller(size, 1UL << shift,
+				flags, caller);
+		if (vm_area)
+			return vm_area;
+	}
+
+	return __get_vm_area_node_aligned_caller(size, PAGE_SIZE, flags, caller);
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -3693,7 +3725,8 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;
 
 	size = (unsigned long)count << PAGE_SHIFT;
-	area = get_vm_area_caller(size, flags, __builtin_return_address(0));
+	area = vmap_get_aligned_vm_area(size, flags, prot,
+				__builtin_return_address(0));
 	if (!area)
 		return NULL;
 
-- 
2.34.1


