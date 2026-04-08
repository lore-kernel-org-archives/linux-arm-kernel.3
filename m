Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F59105D99B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 02:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3GOUPD44qg/7UajdPdeaivaRafFbx9Izl3BJI07ZEA=; b=r+TyXVktmEkxyKGQk3pk9/D685
	wKu5p7RTX8/X/zDZJ87UcYo/ArC2GxiybNLVcNFSqqiCaBHsEmp0tBLlg2oP/Z2rY55dTkJKJmwMK
	b/I9djyy3IgVGqfrwZo5s8a1m+qzUdwMRjc3ItqDQe6VRM6bHydKXzufAvA4i1kFgCJnS9uVU12Vm
	PakJKAo6rYnf4No17pyG7bQRjFivRWjVFN4WoOfWyEFknPhsU51BRyTVRRTWwZb0cq+QN6L99MReD
	xRa5MYlvJg4hqXmhrRbOVcqOxJitMpt8lEF2fLuMTOAOw6vsBev/dXTs1t7ipKGiYn1ebGttzG/gx
	/idXLvBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJ1H-000000089Is-1Gwd;
	Wed, 08 Apr 2026 02:51:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJ1E-000000089GM-3DVv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 02:51:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A2656013C;
	Wed,  8 Apr 2026 02:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F42C19424;
	Wed,  8 Apr 2026 02:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775616711;
	bh=PKtItPJH+nSfbPKiSnTVSIKouqPIOVzmyf2uKcpw7Ds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K+u/rD5azpr8es305v/KMUlewCknD5c7RdCe2Nv1fnif5jdekzR5z72uB0XVvbhf8
	 559XCvpf2ujN+0v055UU2ailQuyIx4O6fsijGq5EdqomDTipii0OPoSxYhGpq83F5W
	 +rOF9PK/XyLmm5YdJdA/KzBtgDWtqgJajiWkLyeFGrWvjf/4uRD9T4CLtVAdP/j1HP
	 3mbPUWakkrUQrYOcK+XwBqka08Q9f0V3Wa3Y6fCFXD3rvsfAfFgLrhP8ONEC8QPSkO
	 6tC4+Bad8HvLf3ZLhkkMBega2S2viD1f4xf6bzgx5hAabqvbCniwxYN+CDTpaHsD4V
	 IuL2CUt5ClpWA==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	urezki@gmail.com
Cc: linux-kernel@vger.kernel.org,
	anshuman.khandual@arm.com,
	ryan.roberts@arm.com,
	ajd@linux.ibm.com,
	rppt@kernel.org,
	david@kernel.org,
	Xueyuan.chen21@gmail.com,
	"Barry Song (Xiaomi)" <baohua@kernel.org>
Subject: [RFC PATCH 6/8] mm/vmalloc: align vm_area so vmap() can batch mappings
Date: Wed,  8 Apr 2026 10:51:13 +0800
Message-Id: <20260408025115.27368-7-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260408025115.27368-1-baohua@kernel.org>
References: <20260408025115.27368-1-baohua@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Try to align the vmap virtual address to PMD_SHIFT or a
larger PTE mapping size hinted by the architecture, so
contiguous pages can be batch-mapped when setting PMD or
PTE entries.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmalloc.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index e8dbfada42bc..6643ec0288cd 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3576,6 +3576,35 @@ static int vmap_contig_pages_range(unsigned long addr, unsigned long end,
 	return err;
 }
 
+static struct vm_struct *get_aligned_vm_area(unsigned long size, unsigned long flags)
+{
+	unsigned int shift = (size >= PMD_SIZE) ? PMD_SHIFT :
+				arch_vmap_pte_supported_shift(size);
+	struct vm_struct *vm_area = NULL;
+
+	/*
+	 * Try to allocate an aligned vm_area so contiguous pages can be
+	 * mapped in batches.
+	 */
+	while (1) {
+		unsigned long align = 1UL << shift;
+
+		vm_area =  __get_vm_area_node(size, align, PAGE_SHIFT, flags,
+				VMALLOC_START, VMALLOC_END,
+				NUMA_NO_NODE, GFP_KERNEL,
+				__builtin_return_address(0));
+		if (vm_area || shift <= PAGE_SHIFT)
+			goto out;
+		if (shift == PMD_SHIFT)
+			shift = arch_vmap_pte_supported_shift(size);
+		else if (shift > PAGE_SHIFT)
+			shift = PAGE_SHIFT;
+	}
+
+out:
+	return vm_area;
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -3614,7 +3643,7 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;
 
 	size = (unsigned long)count << PAGE_SHIFT;
-	area = get_vm_area_caller(size, flags, __builtin_return_address(0));
+	area = get_aligned_vm_area(size, flags);
 	if (!area)
 		return NULL;
 
-- 
2.39.3 (Apple Git-146)


