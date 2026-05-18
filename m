Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151DCCD4F56
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 08:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OfwkogOixf5GMwu+2dp6NmTbHKTViLblOsXgNerkr74=; b=j3aaRHQYEa1i14xVs8yNTAnKKK
	O5d0TcOq71vfdAaBxxYsfTgNPTAmrW7FOLVzwZLKHh6Hyar8okz13ZanROLSoYXDccoWPmOl0S6ZR
	VzcJNCd3Myl0NF13q0PF+N8/awOty7owOcljr0NPbkD4E72RTBiEQ5lNtM8/Gx6gxYjnPCHBVmeMz
	93wEulEeDhwDK91Oz5lEI9EYh1IrCnaYL5/aDV4J6843eGYJpj1JYY28Ja4JD22X/pdNzegKEXqnf
	pjqRdfLtri3GoZluFC7t9x3ahnBY7+7TocEMImZ78X78AXIMymwk2OTUBtI8G9zRe3jTqb1ua6bj7
	pDm+qfKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtgB-0000000EsiX-03Xz;
	Mon, 18 May 2026 08:50:27 +0000
Received: from out199-14.us.a.mail.aliyun.com ([47.90.199.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtg8-0000000EsfF-0OYS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 08:50:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779094220; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=OfwkogOixf5GMwu+2dp6NmTbHKTViLblOsXgNerkr74=;
	b=JeGyITrfoP8WxvDyVxQM/m89vS+24GQQ4BDf03JwstQKEReLOxzIhW1VtIrf4A8MV5VgyQLmutx5cgrZ460sBog6JyXTxv1uulIV1ImRM5En+fWdV5WAPqDatCJ8pQTBFCh967oJ5kGJqSBtrydtnwUOjjBPN3Y97X+oQL+9IsA=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=tianruidong@linux.alibaba.com;NM=1;PH=DS;RN=30;SR=0;TI=SMTPD_---0X3647Lr_1779094212;
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0X3647Lr_1779094212 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 18 May 2026 16:50:13 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	rafael@kernel.org,
	tony.luck@intel.com,
	guohanjun@huawei.com,
	mchehab@kernel.org,
	xueshuai@linux.alibaba.com,
	tongtiangen@huawei.com,
	james.morse@arm.com,
	robin.murphy@arm.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	ryabinin.a.a@gmail.com,
	glider@google.com,
	christophe.leroy@csgroup.eu,
	aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com,
	tglx@linutronix.de,
	mingo@redhat.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	tianruidong@linux.alibaba.com,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v14 4/8] mm/hwpoison: return -EFAULT when copy fail in copy_mc_[user]_highpage()
Date: Mon, 18 May 2026 16:49:48 +0800
Message-ID: <20260518084956.2538442-5-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260518084956.2538442-1-tianruidong@linux.alibaba.com>
References: <20260518084956.2538442-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_015024_445506_BC84EC0C 
X-CRM114-Status: GOOD (  18.07  )
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

From: Tong Tiangen <tongtiangen@huawei.com>

Currently, copy_mc_[user]_highpage() returns zero on success, or in case
of failures, the number of bytes that weren't copied.

While tracking the number of not copied works fine for x86 and PPC, There
are some difficulties in doing the same thing on ARM64 because there is no
available caller-saved register in copy_page()(lib/copy_page.S) to save
"bytes not copied", and the following copy_mc_page() will also encounter
the same problem.

Consider the caller of copy_mc_[user]_highpage() cannot do any processing
on the remaining data(The page has hardware errors), they only check if
copy was succeeded or not, make the interface more generic by using an
error code when copy fails (-EFAULT) or return zero on success.

Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 include/linux/highmem.h | 8 ++++----
 mm/khugepaged.c         | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index af03db851a1d..18dc4aca4aa1 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -427,8 +427,8 @@ static inline void copy_highpage(struct page *to, struct page *from)
 /*
  * If architecture supports machine check exception handling, define the
  * #MC versions of copy_user_highpage and copy_highpage. They copy a memory
- * page with #MC in source page (@from) handled, and return the number
- * of bytes not copied if there was a #MC, otherwise 0 for success.
+ * page with #MC in source page (@from) handled, and return -EFAULT if there
+ * was a #MC, otherwise 0 for success.
  */
 static inline int copy_mc_user_highpage(struct page *to, struct page *from,
 					unsigned long vaddr, struct vm_area_struct *vma)
@@ -447,7 +447,7 @@ static inline int copy_mc_user_highpage(struct page *to, struct page *from,
 	if (ret)
 		memory_failure_queue(page_to_pfn(from), 0);
 
-	return ret;
+	return ret ? -EFAULT : 0;
 }
 
 static inline int copy_mc_highpage(struct page *to, struct page *from)
@@ -466,7 +466,7 @@ static inline int copy_mc_highpage(struct page *to, struct page *from)
 	if (ret)
 		memory_failure_queue(page_to_pfn(from), 0);
 
-	return ret;
+	return ret ? -EFAULT : 0;
 }
 #else
 static inline int copy_mc_user_highpage(struct page *to, struct page *from,
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index b8452dbdb043..cf1b78eed3c3 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -810,7 +810,7 @@ static enum scan_result __collapse_huge_page_copy(pte_t *pte, struct folio *foli
 			continue;
 		}
 		src_page = pte_page(pteval);
-		if (copy_mc_user_highpage(page, src_page, src_addr, vma) > 0) {
+		if (copy_mc_user_highpage(page, src_page, src_addr, vma)) {
 			result = SCAN_COPY_MC;
 			break;
 		}
@@ -2143,7 +2143,7 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 		}
 
 		for (i = 0; i < nr_pages; i++) {
-			if (copy_mc_highpage(dst, folio_page(folio, i)) > 0) {
+			if (copy_mc_highpage(dst, folio_page(folio, i))) {
 				result = SCAN_COPY_MC;
 				goto rollback;
 			}
-- 
2.39.3


