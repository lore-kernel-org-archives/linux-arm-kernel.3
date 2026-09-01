Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542F5C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g6gNF1L2W2DbFnprEAmekbeKiRyxpCj5ws+3FN1RDWk=; b=zKA9bcjMONlx/9yLMso2GlFcC+
	0JcL4XAZV1Sp7RmmAiPilCBCd+rvh1D6qw3y3Vc2QY1HY4B2uRNE3hH3pwphlG/qEHDc5j0xFuXci
	jLy33V5JxDsFOvyVolEImx/UncSiJSZRHW1PupFsqrb/YYXEKrFMCDjvjSMLMgO8A9w/MSUJiKM1W
	12Y92664CRe8wgb/1NzjGzXN3702lv0atx8bqkjN6S+3Vk5ORWFDTx4WgCLKr6Q2zqnoijdhFoVFK
	VFOAKKwf0h34QQWjiS3B8+9FINBV/Sf8JW61+79t2KG3HaiEBDobZz7fIE5K4pcb/p+bfFiCbD35w
	nLqFGtMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KJS-0000000BLwH-1bHw;
	Tue, 01 Sep 2026 08:57:50 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KJQ-0000000BLvs-29uh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:57:49 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-482e067e908so3362978f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788253065; x=1788857865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g6gNF1L2W2DbFnprEAmekbeKiRyxpCj5ws+3FN1RDWk=;
        b=RZWMS6PmWMuO9ORDVLDf7deTY3U19eGj4oL56rT81m4rLBMs+6pGDKOnt0nPjYal6E
         gspVMqK5lIEqrQ95B2CzIWT8+hiYI3nBFm9QQo59V969qGNapv9ov7rN8q4TR5em8cFF
         we9PsgeleoXeRarMYbZn3LRwCgHarj50Qyd3jgKSK5cbK+apcsjrMEFnF5WMHAnIh3qu
         i27qTmYtNf/qkpr3K85MceSMCz/IpvKc57kqvwlTbxqeS5fCe750m2lgDFuVGksdT43H
         suN+GcxWF7tb2fKU3MoxVfp9rTqAyiC9/Yx+vYqYwoDZcvU9+1ZrcW62fl+M0sSwrE8E
         CXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253065; x=1788857865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g6gNF1L2W2DbFnprEAmekbeKiRyxpCj5ws+3FN1RDWk=;
        b=JLCdSDnyyuqJbOhdNNVZpHBDeZYalR3G1uIwv6d4Ka1aQbhkn3ApByNp+2uKqj5rqr
         9HOUsuL6dlHFsuNb1ojcebHzpik2scBsyX+UClreKBLq+BWHylUiyhXgZmcfRYI+ud4N
         zwgRd/4QBPlWLm5kDw8bEtMZElyEo/IQ6PwRqOcstgtRxPxsDbk8v4ScK+0FMP4+Q2M+
         zySsfrGPSmO4XYt4GrPtkSeSLlH82hel8AfiFcqpCgpHh/oMrlnzAMfdZnQtJ6C8ym+N
         I6jNRAj+uMNOY/vIXMU7xRILC03PxSANi/qnYOXC5UQhzGkuuVRCINBvgb8eOpqRbkyv
         YpVw==
X-Forwarded-Encrypted: i=1; AHgh+RqXsT8m38iO8G+oeiwQVLBOxExoq7cjiUESD6qj0Rt0bsvsX0YYL12bZoJk2A+Ee0oBHC4x1fy5EHVNSEVMFfAw@lists.infradead.org
X-Gm-Message-State: AFuF++mVnlL4bydrlukYNn0vVIJecJrRjoXGq5YjwfqCv94UoX3YtgjW
	X7DxKRQMe6Q8fWlE6buTHt9W/t/rSQ4zp5ohrYcORvuxulSTxnf0JxLq
X-Gm-Gg: AR+sD13+8Fe10HHnwExcuymt3bJVPY0fm2RGuaEmt64fx53WR77qiAjfYOqD5rNcpIv
	EFqLNFTbX4cAZ3ixFIEyRBUHe2dujEMvFX8pQMCdq0yI2EHXxd6mGe5FQSoFz8vbaPy7GzF1H8w
	ZuJFpy+oOoEEG5Nnw8iUDEDwn/VFzC1QUzruBMySUnhizXAJninaSxQ5E1DfOq6f4n3FoXPMvm8
	Izn+540AFzMxFYLWTeFjh/O4jpzIZM2F2f48GZdai63svrUJbrXhS4ODyS7wFGosRuiLABVBOUA
	XbJ9czR6BgGMKO5slRKSeKXD1R2+MpFWlCzd01gp5ZYAXQbIkZg996KVZ3/u84yldqs7IT2CteX
	VfCQTVBZN/8Dx2dtXG+cN2Epefdk4crd5LQYEYhMmR7deNl1M8Ut8fD1Rs82w3pconq+6aG0OWY
	vEOECIYv7KiI1Xe6Cj/VKEutMDri5guTK7AFVBtsTpxlyS7RY+RwCwtxyuLMOK2gCxqcn1uUA8Q
	wwXKNUEPVznfrcE1QyPina1pLx0Y/pzPHFD6nPwbrxwJBZIWulxTbw38u1Tic85HsBRkCcETOFP
	IK7Tr0pR+uwLxDyx64vtrYJl2zcsNENDdg8yyUXfPVvYRDE/hFUGZk0B+Rwuttm1bK4=
X-Received: by 2002:a05:600c:4f8b:b0:49a:2c4b:403f with SMTP id 5b1f17b1804b1-49b91c46494mr428394385e9.13.1788253065376;
        Tue, 01 Sep 2026 01:57:45 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a16a-7801-fd8c-4b37-36b4-e53a.310.pool.telefonica.de. [2a02:3100:a16a:7801:fd8c:4b37:36b4:e53a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdd73f7a4sm45023365e9.12.2026.09.01.01.57.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 01 Sep 2026 01:57:44 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: mm: align hugetlb mappings to the huge page size
Date: Tue,  1 Sep 2026 10:57:40 +0200
Message-Id: <20260901085740.66283-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_015748_593282_71354369 
X-CRM114-Status: GOOD (  17.36  )
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

mmap(MAP_HUGETLB) on 32-bit Arm can return an address which is not
aligned to the huge page size. In a QEMU virt guest, unmapping the VMA
then hits the alignment check in __unmap_hugepage_range():

  kernel BUG at mm/hugetlb.c:5213!
  Internal error: Oops - BUG: 0 [#1] SMP ARM
  PC is at __unmap_hugepage_range+0x540/0x584
  LR is at __zap_vma_range+0x13a0/0x1410

Commit 7bd3f1e1a9ae ("mm: make hugetlb mappings go through
mm_get_unmapped_area_vmflags") made hugetlb mappings use the
architecture's arch_get_unmapped_area(). The generic implementations
handle hugetlb alignment, but the Arm implementations only account for
the optional SHMLBA cache-colouring constraint. A 4 KiB-page kernel can
therefore align the mapping to 4 KiB or 16 KiB instead of the required
2 MiB.

Set the alignment mask from the file's hstate for hugetlb mappings in
both Arm implementations. Huge-page alignment also satisfies the
SHMLBA constraint.

Fixes: 7bd3f1e1a9ae ("mm: make hugetlb mappings go through mm_get_unmapped_area_vmflags")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested an LPAE multi_v7_defconfig kernel on QEMU virt with
-cpu max,aarch64=off and -cpu cortex-a15, using both the default and
legacy VA layouts. The LTP hugemmap01/04/05/06, hugefork01/02,
hugeshmat01, hugeshmget01, and hugefallocate01 tests gave 16 TPASS and
no failures on either CPU model.

Also tested on a Raspberry Pi 400. The unpatched kernel returned a
misaligned address and became unresponsive while touching the mapping.
The patched kernel returned an aligned address, touched the full mapping,
and unmapped it cleanly.

 arch/arm/mm/mmap.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mm/mmap.c b/arch/arm/mm/mmap.c
index 3dbb383c26d54..dbb3f07a77852 100644
--- a/arch/arm/mm/mmap.c
+++ b/arch/arm/mm/mmap.c
@@ -11,6 +11,7 @@
 #include <linux/io.h>
 #include <linux/personality.h>
 #include <linux/random.h>
+#include <linux/hugetlb.h>
 #include <asm/cachetype.h>
 
 #define COLOUR_ALIGN(addr,pgoff)		\
@@ -72,7 +73,10 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	info.length = len;
 	info.low_limit = mm->mmap_base;
 	info.high_limit = TASK_SIZE;
-	info.align_mask = do_align ? (PAGE_MASK & (SHMLBA - 1)) : 0;
+	if (filp && is_file_hugepages(filp))
+		info.align_mask = huge_page_mask_align(filp);
+	else
+		info.align_mask = do_align ? (PAGE_MASK & (SHMLBA - 1)) : 0;
 	info.align_offset = pgoff << PAGE_SHIFT;
 	return vm_unmapped_area(&info);
 }
@@ -123,7 +127,10 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 	info.length = len;
 	info.low_limit = FIRST_USER_ADDRESS;
 	info.high_limit = mm->mmap_base;
-	info.align_mask = do_align ? (PAGE_MASK & (SHMLBA - 1)) : 0;
+	if (filp && is_file_hugepages(filp))
+		info.align_mask = huge_page_mask_align(filp);
+	else
+		info.align_mask = do_align ? (PAGE_MASK & (SHMLBA - 1)) : 0;
 	info.align_offset = pgoff << PAGE_SHIFT;
 	addr = vm_unmapped_area(&info);
 
base-commit: abdf623ddb75b24659018d3952d8f61937306ae5
-- 
2.53.0

