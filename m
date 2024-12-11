Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30E3E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 23:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4sLwXeXnZGwZmaOI+TJwHO8calXr1XpV7HCaSQYyYY=; b=sZuyilUnKKGtDaqMtw/4//3K72
	jANRywOgxi7rq5Z27rOs4Lsl1YGuFEcG9G+28/vRiHK8pcyYBAXTlQolWPDWXfJYjRSXV3n4S6eHN
	zTMP+MqSusMlFjgzqYyT9WvHgqfJOecimoKZNEfmnycXF8jCp5FgjN2cx76N8ym1boxEyC6iI+nQs
	6ss45yB4etMcCvI3GMZdRHEHdjdSWTh0A8PewHBj3c9CVvf2gkprFlYDhMGOpBX7UAFjR3P6w9bIk
	KoXuudQISeAloULeWTqpLo1Y/zZCg78UH7SaYDgj3GwBHu4/5RRwcS6uaFc4h7P7env5PpYCW9p0O
	uu0wl1iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW9i-0000000GTJv-3l7u;
	Wed, 11 Dec 2024 23:30:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW7j-0000000GSV4-0SxM
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Dec 2024 23:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=i4sLwXeXnZGwZmaOI+TJwHO8calXr1XpV7HCaSQYyYY=; b=cRRCOX7vzTXZ7ZXnqpL1rQYWGL
	n1G7yJtFb7whZGHEDx7HX82tNuJ1RpyiPYgMmcaoNvLWi1DSYBOjMk1FrFOAKZ8OQI85BK/7lzrdD
	LLMEPiaGT6y8XpLg3j9YNmd8DgjXVLjwtjdymsBuMOQXF5OLdX/ju1q5UZ7obSM1UZHJhy24I40yP
	pnSjVLLCsbONiGAnf+VHi58MvGjZQ5xndvCRqY1EoBwkgv1eL/x1BrlkXLhDc3UFDMf4VesEu1+b7
	slHikvpKry7+ThKXsRYwc07lGycmttYG4UFj5CTafi0a0LcCLBaau6VgNhg72wUC+yisRDrDMEvBl
	mFMFnh0A==;
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW7f-00000003vyN-0lEA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 23:28:05 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-8019f05c61aso33874a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 15:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959680; x=1734564480; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=i4sLwXeXnZGwZmaOI+TJwHO8calXr1XpV7HCaSQYyYY=;
        b=Vwkch71garP1ztd0OeRBOfZPpNrMMQtpeknY3QduBjmWKZgnMOxaXr3jtZh6PoBX2f
         DtepdVsC+FlfO/w6+tXxVfoy7jTH1T8UG++qRK0eyINGA4HNZIBATnB9DRAmcIYYoU2j
         OLh9HfEBgAPCZEj+KmRknRqFLbzWdKNPJh7l8TjWjHP8PfD5t6wiBbN5Kw3lyHz72rLY
         QZBlj62d68qp/lScsO0vdXM9w3/ZmT68dQcGd+d5wiWJsB+YhLuV/WtFMrBo8bvnV5a0
         p8niwVIvoKCbUIKDbjGA+IQT+aLJJH9byAsstTTDt8ClaJkJMTRg4jQfd+CdU3qpeWob
         Wzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959680; x=1734564480;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i4sLwXeXnZGwZmaOI+TJwHO8calXr1XpV7HCaSQYyYY=;
        b=WcIxQiO936tlpIZpv3vJIUIBneEMNBmIoqA0qn8SgNdaEuvH7+3TF5xkbALP95gPBu
         QaIuXarBw/RBrAvblZ1rkfn4Wy1BrMLMEjf8Cen0C2xouEOPSBfit23wPNBIxXJuZYYw
         k1+lRQ4n6YXgHSpvTV3/kc/8J/5dXuaMiFFFqQMMADMSubzJ4n7RTtHLL4IGg2DJfRs3
         bunopWVmEdfRI/95O7rOmQEZLqSOEOitgfFD7Qw+Enzt2i0V+/gAxgokMcK+bBB9wiAA
         mIiDhvyG7jG387WEZHjRy8wCX/HBw6o/bA7RkgyaLjsWvuPxuNCco2q4pvlB4DoSHmlT
         WKaA==
X-Forwarded-Encrypted: i=1; AJvYcCWzUXVHChyXac77xA4ZS6NOLh2dCkHt/SYHOovW7ExlE2aPP8R5rhsKNM0gbonAXqE2jiBchWsWGlJ2xyz/YCNE@lists.infradead.org
X-Gm-Message-State: AOJu0YyuHhTAhCb31Q3N+DGnBDJiebOCXy2iSicNEmfBeqYwmUnHIKt9
	pT1B+WMdnwAQ4XBRiNo6VGsdNSq5yB7WIALgs4VLR2eU1f4BdlYJ1lDmWRSPjNGEGgMbLimtQYU
	V2Km9dhv5CPsq0cPCs+2aSw==
X-Google-Smtp-Source: AGHT+IFtd/N2pCFnI2u1d5m96JgTZmL7tbAt9a9u3MHy4m9H51vxoRQ9F2QC80/CNULE+uh+FoVAQHYq51Gg3PfRrg==
X-Received: from pjf11.prod.google.com ([2002:a17:90b:3f0b:b0:2ea:29de:af10])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2790:b0:2ee:f80c:688d with SMTP id 98e67ed59e1d1-2f12802a503mr6866191a91.25.1733959679820;
 Wed, 11 Dec 2024 15:27:59 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:39 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-2-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 01/16] mm: Introduce generic_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com
Cc: linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@HansenPartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_232803_563094_07AC9367 
X-CRM114-Status: GOOD (  16.62  )
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

Consolidate the hint searches from both directions (topdown and
bottomup) into generic_mmap_hint().

No functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 include/linux/sched/mm.h |  4 +++
 mm/mmap.c                | 76 ++++++++++++++++++++++++----------------
 2 files changed, 50 insertions(+), 30 deletions(-)

diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 928a626725e6..edeec19d1708 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -201,6 +201,10 @@ unsigned long mm_get_unmapped_area_vmflags(struct mm_struct *mm,
 					   unsigned long flags,
 					   vm_flags_t vm_flags);
 
+unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
+				unsigned long len, unsigned long pgoff,
+				unsigned long flags);
+
 unsigned long
 generic_get_unmapped_area(struct file *filp, unsigned long addr,
 			  unsigned long len, unsigned long pgoff,
diff --git a/mm/mmap.c b/mm/mmap.c
index df9154b15ef9..382b4eac5406 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -620,6 +620,47 @@ unsigned long vm_unmapped_area(struct vm_unmapped_area_info *info)
 	return addr;
 }
 
+/*
+ * Look up unmapped area at the requested hint addr
+ *
+ * NOTE: MAP_FIXED is also handled here since it's a special case of
+ * enforcing the hint address.
+ *
+ * Returns:
+ *    ERR_VALUE: If the requested mapping is not valid
+ *    0: If there isn't a sufficiently large hole at the hint addr.
+ *    addr: If sufficient VA space is available at the hint address;
+ *          or MAP_FIXED was specified.
+ */
+unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
+				unsigned long len, unsigned long pgoff,
+				unsigned long flags)
+{
+	struct mm_struct *mm = current->mm;
+	struct vm_area_struct *vma, *prev;
+	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
+
+	/* requested length too big for entire address space */
+	if (len > mmap_end - mmap_min_addr)
+		return -ENOMEM;
+
+	if (flags & MAP_FIXED)
+		return addr;
+
+	if (!addr)
+		return 0;
+
+	addr = PAGE_ALIGN(addr);
+	vma = find_vma_prev(mm, addr, &prev);
+	if (mmap_end - len >= addr && addr >= mmap_min_addr &&
+	    (!vma || addr + len <= vm_start_gap(vma)) &&
+	    (!prev || addr >= vm_end_gap(prev)))
+		return addr;
+
+	/* Fallback to VA space search */
+	return 0;
+}
+
 /* Get an address range which is currently unmapped.
  * For shmat() with addr=0.
  *
@@ -637,25 +678,13 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
 			  unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma, *prev;
 	struct vm_unmapped_area_info info = {};
 	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
 
-	if (len > mmap_end - mmap_min_addr)
-		return -ENOMEM;
-
-	if (flags & MAP_FIXED)
+	addr = generic_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
 		return addr;
 
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-		vma = find_vma_prev(mm, addr, &prev);
-		if (mmap_end - len >= addr && addr >= mmap_min_addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)) &&
-		    (!prev || addr >= vm_end_gap(prev)))
-			return addr;
-	}
-
 	info.length = len;
 	info.low_limit = mm->mmap_base;
 	info.high_limit = mmap_end;
@@ -685,27 +714,14 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 				  unsigned long len, unsigned long pgoff,
 				  unsigned long flags, vm_flags_t vm_flags)
 {
-	struct vm_area_struct *vma, *prev;
 	struct mm_struct *mm = current->mm;
 	struct vm_unmapped_area_info info = {};
 	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
 
-	/* requested length too big for entire address space */
-	if (len > mmap_end - mmap_min_addr)
-		return -ENOMEM;
-
-	if (flags & MAP_FIXED)
-		return addr;
-
 	/* requesting a specific address */
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-		vma = find_vma_prev(mm, addr, &prev);
-		if (mmap_end - len >= addr && addr >= mmap_min_addr &&
-				(!vma || addr + len <= vm_start_gap(vma)) &&
-				(!prev || addr >= vm_end_gap(prev)))
-			return addr;
-	}
+	addr = generic_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
-- 
2.47.0.338.g60cca15819-goog


