Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD75C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 06:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qz31YaIUZL0HkPkLOInD8YA56WfSRIuJpUh6x60MqwE=; b=AddATjg79mZTIzAfX7DkCUT1ly
	9lHA90l+v8NV5IS4iWe8iAGMJQ8XgKQQfTkfHpm53t0sx3l8OaPrmPbMz7XOLoZYGK/HJpvic1mHh
	eUbdFGkih9cYCPb3c9lKz5rhzpSMAx05gdGO94XTCYApi91Xvb5up7kwNl93wfyy0IdlsUJTt9iIk
	0OuTMjdVS4BoUzoPRQWbqWNKJ3aILToKU6tjZwRrRxmLZCl3zPeTlHbWwnnRClRxhGpEYOXC4PgWz
	Mcy3hZOGSHnAF/S0rhlv5fu88Dmj8Oc+EP8p3cIHasR3ihUKU0InjPhNof3qIuIpMmhrGqdr2U5o3
	byQPeucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GUP-00000007Hr5-1yt3;
	Wed, 23 Sep 2026 06:29:57 +0000
Received: from mail-pj2-x12.google.com ([2607:f8b0:4864:39::12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GU6-00000007HgA-3EUs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 06:29:40 +0000
Received: by mail-pj2-x12.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so2908035ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 23:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790144978; x=1790749778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qz31YaIUZL0HkPkLOInD8YA56WfSRIuJpUh6x60MqwE=;
        b=Hyap+4KKS1/euWQQ0kdrIu07C2kwoKSDb4lJ0qW+ZWcbyT089DbyPD6EBn5uyrN63b
         rGNZ3TINtT3Rlh8y2Z/PLuW0RRbBMc6mbNU0eKqvqbk/hQM5oRlsNA1DTh1V5DaEpYow
         Ou8mBKd8AT3+lY1g449bvFWZwehTzQ7kBckKjvhuH5fEGt9kS1KxKsDxsf0L9KHYwxUA
         sO/wSTNxBnVgCjsfp9SAw4kYwKqLS50kuQQOzo1oxAZCncll7hW6l0xhPNs7Ue7sF9rG
         znjKzwfuGg752V8NHplfhtxZtNSTnooclonhBmmGgOXq+X4AQZn3qbq0t7E8IuOE9j4u
         sD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144978; x=1790749778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qz31YaIUZL0HkPkLOInD8YA56WfSRIuJpUh6x60MqwE=;
        b=brKf79ZzfYJ1X3oljxBv/63uBY2wOze7NtnlLtxczYvv3qbVdcBlG+5GsMEetIB1vu
         ym/r6UA5y/iMWdGs48ZGhN5f9O/oc5Kag7rngm96AOROhq0tv9/sin5eyVfL5QdrQrSQ
         tsMPcyA/92klbj71Yf0YQlZJm/Ij7xbm22Md7QpbBG/G2iM/SeLybiOM+hDyPnsTA2ri
         /+gMY8K15fagoJQTTzqFNoc/RF0D+8OkxuMXmcwes9gjKbDZEv2fwfTiIzohaGgK2uX8
         aT/1hMz0xLghZexlu3Gs+kfAAzhVCr3N9Kkpeuc+5VQZ3pVvz4nz0izamazyTovqGwvB
         EU9A==
X-Forwarded-Encrypted: i=1; AKwUvByteLkTsCHCruqZHPu+qSUJmT255Iygy2sWg6WhpcQTTSr3SJRlHg9sbPwTqYmkm8HdKd8t458j/9O7GLNQ5qyp@lists.infradead.org
X-Gm-Message-State: AFuF++nUgDzvQzQfiV3asXKpL95azF+5MmILqeeXCYdVAiBwzWBYrvt9
	YX7xK2nR3DlQ/LXPOSIH3t/PFkR4dKAPN+cg6H+8nFsBCf9zeGB7Ha5O
X-Gm-Gg: AYBFou2RpuTDfbGlUTbtSzcvtQjcm/EM6PY+yu475ZSRwmnGmlA9HVKd7pxuqAGm7P0
	hrnkDU0W9C+IcjoFVH/HmDsfABBYuZxX3j/446O7A0F/Cx6K7xlspR0c4mXLMWse8KLGe5HXKrJ
	2KrXTFEDHkkbrfDBvPD5i25zQdK4GwDcAIZscpo737OrApSSWtN2WuIZUmUb0ZaXELArilb0jY8
	7gKQLVfpFfU76iPyqrBwSODVPdhI86BLfNoA8mcJ4NUbFxHoN81fqUY9tDZRXnWsSWw/eLg5IH9
	2NAX6vAInDMi9/R/frTnM9qU2IDiQ7fknNUqsz8luVF/VXSSn+6QUT7B0RYioDfwCZlB3UWt474
	GG4iA+2j8wquKfw5OHSmxa4QI4HbiINgxdnOw9AfIgTx16n6wz1+s2cdLw4n7NBqV+zdhE7xxU5
	Vhq1PZnAG4aErYWqCN8TbbjCeOBDFrMd0qh3lxWzs2JHgl6cIfakLhDqS9YHJhWhR3nKWWftw5Y
	Z9JqfbJK+JJh43jXuRROA==
X-Received: by 2002:a17:902:d483:b0:2dd:c053:c20b with SMTP id d9443c01a7336-2df69ddf0cbmr15391165ad.39.1790144977728;
        Tue, 22 Sep 2026 23:29:37 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516bfdsm5620465ad.5.2026.09.22.23.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:29:37 -0700 (PDT)
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
Subject: [PATCH v9 10/10] mm/vmalloc: align vm_area so vmap() can batch mappings
Date: Wed, 23 Sep 2026 14:28:32 +0800
Message-Id: <20260923062832.479455-11-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923062832.479455-1-jiangwen6@xiaomi.com>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_232938_902346_CB61AD39 
X-CRM114-Status: GOOD (  13.69  )
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
index 37cddb7f45a4f..1a3b191885024 100644
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


