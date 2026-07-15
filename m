Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDD2C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8qJhOk4bnpu1WPc4oSH+kzjjMIN2seacJoWKksNoa0=; b=a0+fco4iyu3jmt7JxXNR3IdI+d
	Wr4EfM8cpZmErZFrm0Al6YYA1Oe9Em4J88AnpSHdwD6FvLIgYb6vNOvPhdsD9dbuNMs/CytZKssLN
	QAmkixAeJvvz5rXS6CldXCJ9x0XtnAkHttnUT0UtNJrWi+3G9xXDnaDeJJJNlKnafo6LqrZCTlwV/
	MkjdZTlHH+LYvU7d2QORiDqGgubrLpWQ3rZAsnN5g49e614l6YvOy0dv8Vfk0KRN2jJeETg8OgyMd
	4EWQmf2kqPyZ70f9QCm7S6vwFCtP+lw9glbX3zWy5uhJRDUD83WtmfAUNmFKI1mffREZlMcDElcGX
	23yr8Diw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyQH-0000000Einx-0Udq;
	Wed, 15 Jul 2026 12:09:09 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyQA-0000000Eihj-30Uh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:09:07 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cab973140bso62233925ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 05:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784117342; x=1784722142; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v8qJhOk4bnpu1WPc4oSH+kzjjMIN2seacJoWKksNoa0=;
        b=iuomgY6N2jWU2v63giR5RN90Yd2OfbOZGYxdNaf8odpbu5IThA7W9hz9Gyt8m1xzoW
         snT7OlwVaSvy/YToAFTskafNqgsxf5PRI8o66X9P/54goFgo9wSNq65l1tb5567IT2AF
         C0BtcpEZC6uNG08fLCQm7ea5btKbmdfqKuUllAjSjok9w1XHF2tJZJNci326HlC2Yra+
         V5o23CLlv7O3X07IIgqSKM6GnmB+AAXu3sraPFQSK67teGivE2Vci3XOvdLdt94xUA4U
         vjX3A6MKECcuQe/nzpH7bUiU/vXUNes1rVjO9NYv5zG1+NZC2nSWCyz11ud0r8UfgQWl
         jnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784117342; x=1784722142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v8qJhOk4bnpu1WPc4oSH+kzjjMIN2seacJoWKksNoa0=;
        b=st0IxMhhgjmaNFxjQx7nCNJry1/hb4wpVtnr68du62r9TdOsXoYDw2vgKGyPWGFc2Q
         1USoQnUawJyAtrzvsxV0IoBcuhg/pJE/Uwsama5zXGangIU48GbH4V6I+OJo/BsAnGCM
         ZNfyerBQcHqFf7X4enIeAMkHX6ZEmrmsbCwBKzHvqo97umKK3puJsCBAdpoe9M7N4yl9
         uVDdXeVQAJDr879WsX0B2gxB+qGWFPNnKHzU3rrAr/atgWXI643Eeorp4DZ9Pb8T+Nnq
         1fw3vjKq61tgeQ7TnSPVn4VAKLRRsjE3DJ0SmnkJay3ty0WzZQoA4bBFShb22T7oQBQl
         yJjQ==
X-Forwarded-Encrypted: i=1; AHgh+RrrsdSa4UXNiipAie+RbXdEZ2H/OU7Chsea0gJTWKoYNue/tlNsWQuIPzJfytHSoIe78H39sRD7aCP14HzC3Aed@lists.infradead.org
X-Gm-Message-State: AOJu0Yzuq/53guOEmVibmc8GOXOw2XKqzjFbEEs4J7N8Wzqu/PUJnSU8
	b9VLgmFwkfHLj42vG6UWBovYPku6dSI2jtZDCk+Mj4/Rn8Pn7S1v9I7v
X-Gm-Gg: AfdE7ckVZuTBHRTgbQlAFPhubcp7cPW3+n8q4ub45LNFfQYJ4GrPmbxTGtqFkrSzp2U
	OtgBzLULoBm+g3NKg0IO9CxV02+WgGSFsDBVqJQS1YLTUmEzTSX58V1CpWQkdxgw256p6m07kqu
	WmL5ao/aEBeaXer9F2Fw4EbEj1e+u5xPHJRPtnSR5sOWKx4nz/xuVMSlEMU16yrLYXKCXpC15h/
	uCb/j33W23aGG5EPMrhcCLA8E+hgGUnkzgD4ahWgrZsqiq9QX8XB0n1jK1UM1f0nH3R5t/Pnc6P
	qP/bAAFPNqg/whfSYKsIykvxEYYBAAHF2DGYa/JcQwtAZNYp47wyJbP0e+iQRtkcQ+LrF0dYZ0Y
	bAV8eQWu26o1Aj9tRYx3o4TZieWwVepFyTqXLF5/IJLAjIxkwh/6orGIzxpplZpsEwfAOT6rQdT
	aO00GMaRbBt6KmJwtlxUaF5U3vNPMQ1gI7q+0=
X-Received: by 2002:a17:902:e5c3:b0:2c9:e6d7:fbb4 with SMTP id d9443c01a7336-2cf03cf6203mr22618325ad.31.1784117341728;
        Wed, 15 Jul 2026 05:09:01 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf105bc642sm1216325ad.63.2026.07.15.05.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:09:01 -0700 (PDT)
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
Subject: [PATCH v7 7/7] mm/vmalloc: align vm_area so vmap() can batch mappings
Date: Wed, 15 Jul 2026 20:08:13 +0800
Message-Id: <20260715120813.3609949-8-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715120813.3609949-1-jiangwen6@xiaomi.com>
References: <20260715120813.3609949-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_050902_892982_F390BAD6 
X-CRM114-Status: GOOD (  13.33  )
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
index 92f9cd5e9def5..7a3aa9e5c885a 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3320,6 +3320,14 @@ struct vm_struct *get_vm_area_caller(unsigned long size, unsigned long flags,
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
@@ -3635,6 +3643,30 @@ static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
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
@@ -3673,7 +3705,8 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;

 	size = (unsigned long)count << PAGE_SHIFT;
-	area = get_vm_area_caller(size, flags, __builtin_return_address(0));
+	area = vmap_get_aligned_vm_area(size, flags, prot,
+				__builtin_return_address(0));
 	if (!area)
 		return NULL;

--
2.34.1


