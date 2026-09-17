Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B12C982D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 05:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8rYVhg/v6BbsXS7Hdm4I0mlpI54bk8irnJCIlnxFJI=; b=2XxUO7CC4ciGV1XNM1KrqIDbEP
	krdjbzXRX5ZcBDwTjuPg2WyBSN1qBpav1kDSSSTa/LcWW3CZ/rNT0jLaTHQeXo2brjpuDbGL80aAj
	oRUTVNKKPVok+r3/poMvuKjaO/Y0nUfgUFDXKVoKwm02vrcrFUYzfqegACwdLeKCg5NMkFxhV1q3x
	ZGQ7InDpbmyuQ40t8/YOT53e3Vlf0GeSPS+ghGn3toM73oRhKmFwRooLkw8xO7XBM9sfWQ9ivtcCT
	zZHNOJR98pMJKxiOSTElPgLx8vamesnx2djM67vyxqiImXINfnifkpFuf5FxwE0rWtMK+vS1vL9n/
	P5LbjEug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74i2-0000000Abca-3sRY;
	Thu, 17 Sep 2026 05:30:58 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74hw-0000000AbYS-0Brx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 05:30:54 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea34ef3so388047a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 22:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789623051; x=1790227851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/8rYVhg/v6BbsXS7Hdm4I0mlpI54bk8irnJCIlnxFJI=;
        b=dTmkr3EkiAmiureawG2fwde4Nz3fKJJ0nVaf9INGB4UMV5p990jUGTuN8k62AiGsK7
         2Ne2W2GRsjN+FYuWSa6tGAcGZ1BCFnC0es9NqgOfOtB89Gb5ixl5lciyQKs1V8DjhCcC
         ZyjmLKBK9P22hIJLtD0bJSeW1fYhplj4QpNLOmVqdjNrZoR0gJkOYHeVW/t7iijIrG16
         bkTFWAtfbmxN2Q+quj0+Kmvnp/e35wJkaofrvwLU70CuhTj95Osu8/HAUTz7G7pq5wjy
         xJnXBqZUbp4+IIQwmPVW/qySM1NzXjaEaatX78XpcF4PyTIvbbCcosk7BnUJcOtvvLFU
         i53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789623051; x=1790227851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/8rYVhg/v6BbsXS7Hdm4I0mlpI54bk8irnJCIlnxFJI=;
        b=TViEJOeXJHiXbdvZ+Kqo1n9uZ6Ixm/w51oDxQ0XSSeySvOsx3BwT75xlKUjydohyMY
         QgiydP1hDahVunbDmFdulgD2bWfbNKRi15Wp/jJ7bgUef/r2quAtswkALqhrM7SNfo2S
         1UZ1Wn5UUOEbqGWNYLhqwdpyO6vtPms0hqZZa4Ge4rtzcl23xPuyMPi/Ngehm8ov5or/
         exGjikYOWmKIZqzwBxUufZn2ZfKyWbzeySF9tqgIu01SwregVyKHRespTIDq+/LNba0v
         l0oDtOB0qgy6ooWAZ+xwON7JnM82zaV7RWBx7bicMLBdAzzDjBS1bAfnyJQF/0CtBUcB
         i/hg==
X-Forwarded-Encrypted: i=1; AKwUvBz/FSRy5iDHd605/kzwEZFmUXHBqzp0W9MLl/KFwBqtwx8U/fW4sJV1WjY7kgE80pggmTK9VCJmbM8MC1zRPpYW@lists.infradead.org
X-Gm-Message-State: AFuF++nCn5xJbPY2ORDbYOIOeN7ekaT1RhcqT6GRE3W7HJQDcG+3HeWT
	CBKLS6o3y3MLVAAMd9+rC0tn6iVFfMfug+GLK0YaJJG9w1v/f7ot0Sfp
X-Gm-Gg: AYBFou23h9q0tIajWhTzqMzzeCdxdP7zQNugvR5VYqxGS79teqyUTVLRiG6tvKRZpuP
	NA4jjofzo/5keefvHNfwAciwAxHPQCLltHPbp/HVXrA1S1BP4DHn3bpt9hoSbGXYVKnV6V/Gr79
	JbPR1O47fq6sDmX5yZ4sxH+FbxBVW0Fc6GKAnAbqeayv7FA/d7T7sy64bDbbb7EjvehEUlcx5m/
	spKw9+WHQbPeZtPpFgNG9eQMXojma25P030NDN5LcGpYA5h5Z2KO0bLK5pQqTqwxe8GzhsNurJ1
	P6SoyuOMKpUOmrXWsC9JFnKGCQQEOShBapqodvCnzy4MgHCM9k0wMh3rbTf7r6dqacvpfEaRCrs
	6R1DUH/HcE1evA9xrNp9kbYYfuyPH7fhiW3YSJPDIYz7E46evEkOYOF+KjC5HpFXG0u9r5W8rWu
	Rsqi7GIkhRwUO0r1/oHZrsxOHGxnbLxx+kGhvS+TX7XfvYfF0jZ8K61wMDBMqmMRLqkaIq4OHML
	AXAlZ725iN7BRw179dreTZa1yJEffT0eXc9uv4=
X-Received: by 2002:a17:90b:2b4c:b0:39d:f024:c7ec with SMTP id 98e67ed59e1d1-39e1e484b5emr13289860a91.16.1789623051007;
        Wed, 16 Sep 2026 22:30:51 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3abada87sm1955836a91.14.2026.09.16.22.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:30:50 -0700 (PDT)
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
Subject: [PATCH v8 10/10] mm/vmalloc: align vm_area so vmap() can batch mappings
Date: Thu, 17 Sep 2026 13:29:33 +0800
Message-Id: <20260917052933.188679-11-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_223052_177172_AF353504 
X-CRM114-Status: GOOD (  13.28  )
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
index bce2d2c09f546..84413def1d771 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3306,6 +3306,14 @@ struct vm_struct *get_vm_area_caller(unsigned long size, unsigned long flags,
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
@@ -3619,6 +3627,30 @@ static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
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
@@ -3657,7 +3689,8 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;
 
 	size = (unsigned long)count << PAGE_SHIFT;
-	area = get_vm_area_caller(size, flags, __builtin_return_address(0));
+	area = vmap_get_aligned_vm_area(size, flags, prot,
+				__builtin_return_address(0));
 	if (!area)
 		return NULL;
 
-- 
2.34.1


