Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98A8E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 03:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7OiWBktXHvnpSQLcvIs2hf981HtU8PP2N6UjUFZYaM8=; b=qTBJnyRJrU4YOkrrnJ+CuO/WDr
	dAC5gHo3Mg480V8s/AK5CvZh8nsgh50z+wNmAvL6HuObds7+S8wPChFVJDDj9xsAE4KgTq3HyrLg1
	+sfr7BisaBOKzpOFL1dRBlxfTlu8kcE3EKoEgAFBb2auDaEzkaLMqchKgh+YsrXU/B3w6EIUYw9cY
	ZzEBBfz06q1yFaUvIMgOWoID37DLG8kSWBzdEaCenJR/9J1oeR5v5jL5a+pW6db1zYB8STIOPYaj8
	yOr3SSHrrcuf5pXoSqcFfvlp8f9az6AOcbRNwf+rWWudOQE/pTzgaP93LcdSDUa/ZZB/eek4elEFt
	MD5xcu2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqU3-0000000A3bo-3NHf;
	Tue, 10 Dec 2024 03:00:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqCU-0000000A05r-2Vt9
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Dec 2024 02:42:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7OiWBktXHvnpSQLcvIs2hf981HtU8PP2N6UjUFZYaM8=; b=Johhfwgwdkyx7yixXCezcGCCT5
	fwvnB31JTTNeC/mJDExIXWF57uf7OrufDQyRvb8N60tjgYVMOqN/kgdBPPuziuS0XHP6A50O9gFFZ
	iSnedmfdv4gezy06ke9jVfCaca4pRmgQeRNSMqWBCsl1mz3p1hL1BiH10PiaGBsuiYvq/v0TXBuhD
	WTj4wsetX3b7Yb+3es59Ooy2gn1dHVPpEbccQA5RD7WyUcOn+zLlKcEro/kyALsdajjFTPqgHLEes
	UAK5RISG12B84K9UvzHSN05yvqvaxz2uDmugKXUd/jmzbcYu/U2fLmbxKX7lFMKsuYymb0Tqfh1me
	R7ThAlxA==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqC2-00000003blb-2QHp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 02:42:08 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ee6dccd3c9so4514888a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 18:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798502; x=1734403302; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7OiWBktXHvnpSQLcvIs2hf981HtU8PP2N6UjUFZYaM8=;
        b=4X/JB0rnCQiRDk1w+JWUvhndqKjIEz/WH2bgTfM7IRiRCUJsXEOiLqjKcQFDxaVVRg
         xv1m+1lQdfOq7MioBtTQUhnn3ne9htertPDm1+vkzSy5VLc6RKdw+y4abtk3iAg4K/lX
         Ueyvjg1TMdjWuegJVtxP5NRDcBnqjxXApypMWkRJM+22QkwqKWldkYjJMF6TojR4Lmiw
         QDGV8y2SOmNNJH0NSzZlK29rCsq+nNH/cmzTvgaKWM80prhOrXNmxPNhIT/1IuuMrDc6
         eLTf7BEcIE/eKhgVtNWrITJrQ7mbppFwgtxFaBzbfYxZdZlKYp5bME92Wu4ioKo4JN2S
         iVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798502; x=1734403302;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7OiWBktXHvnpSQLcvIs2hf981HtU8PP2N6UjUFZYaM8=;
        b=jeCGyBKZ2fmADb/GNMP/hiSmt9Nedgel+hZ+/L8vIkkPsoxn5lSEMgOXj8840qvjjx
         6T6bWTzjvK9JtzhgCUy6tyOW3vyRue/Z9fWuZJh8eOLnnS2ZGMq60w6io+v2ZXBYjCeX
         2dVLo3496OHmLD/5wa7ZWbL4+mE9QA61fDQejBxxqNOSbWNM0K9UmS013IS3A3npqbEw
         Cn9JLeVpUh0JBg7W0EjhElfDKg2IjOOHBhb0idGVGmMA31DZ2SMVV5Ujxq2QCQtMWsqW
         kYX2FLPQzH947PAHYnr4cL1wSyVV0cflSVghUC2VFrHlojPT4CE/aniTQr+iIyjgBGJ8
         k5TA==
X-Forwarded-Encrypted: i=1; AJvYcCUFoRUDINOxJZc3rf0Cwb/4UQ9ZgmHbMoY0c/cr3Xf4t09Qgrgqs4xW/h707PU1pE58fz2494y2Np5EHkDLVhuM@lists.infradead.org
X-Gm-Message-State: AOJu0YxijeXLpPYrXrfHvy9cVyY9QTlWu6UYEakOdCO/s/s1LfywxbXG
	KUtROqFCoTPotN0OTUS28klj55YcCo0Z7a5sVqPVoHULwn5/ECmqnw1jjmOiSmyrmw0+ZVE8uhV
	QzT34iiswsC29fyukl4rM2w==
X-Google-Smtp-Source: AGHT+IHGYo+0xZ93dmqZHCUo2fH2lASnlYW3/982jLUqUj3uy5rS3NmT8SEwDvEmCBiRAIKAMZxd1Te/85r8WkWevA==
X-Received: from pjbqi10.prod.google.com ([2002:a17:90b:274a:b0:2ea:3a1b:f493])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a91:b0:2ea:a9ac:eee1 with SMTP id 98e67ed59e1d1-2efcf127449mr4419672a91.10.1733798501710;
 Mon, 09 Dec 2024 18:41:41 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:12 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-11-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 10/17] mm: s390: Introduce arch_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com
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
X-CRM114-CacheID: sfid-20241210_024147_147526_240BC94D 
X-CRM114-Status: GOOD (  13.80  )
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

Introduce s390 arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/s390/include/asm/pgtable.h |  1 +
 arch/s390/mm/mmap.c             | 32 ++++++++++++++++----------------
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 48268095b0a3..eaecb558ab9b 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -1997,6 +1997,7 @@ extern void s390_reset_cmma(struct mm_struct *mm);
 /* s390 has a private copy of get unmapped area to deal with cache synonyms */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 #define pmd_pgtable(pmd) \
 	((pgtable_t)__va(pmd_val(pmd) & -sizeof(pte_t)*PTRS_PER_PTE))
diff --git a/arch/s390/mm/mmap.c b/arch/s390/mm/mmap.c
index 33f3504be90b..3f82401b77cd 100644
--- a/arch/s390/mm/mmap.c
+++ b/arch/s390/mm/mmap.c
@@ -83,12 +83,21 @@ static int get_align_mask(struct file *filp, unsigned long flags)
 	return 0;
 }
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	if (len > TASK_SIZE - mmap_min_addr)
+		return 0;
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 				     unsigned long len, unsigned long pgoff,
 				     unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
 	struct vm_unmapped_area_info info = {};
 
 	if (len > TASK_SIZE - mmap_min_addr)
@@ -97,13 +106,9 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	if (flags & MAP_FIXED)
 		goto check_asce_limit;
 
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr && addr >= mmap_min_addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			goto check_asce_limit;
-	}
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		goto check_asce_limit;
 
 	info.length = len;
 	info.low_limit = mm->mmap_base;
@@ -123,7 +128,6 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp, unsigned long ad
 					     unsigned long len, unsigned long pgoff,
 					     unsigned long flags, vm_flags_t vm_flags)
 {
-	struct vm_area_struct *vma;
 	struct mm_struct *mm = current->mm;
 	struct vm_unmapped_area_info info = {};
 
@@ -135,13 +139,9 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp, unsigned long ad
 		goto check_asce_limit;
 
 	/* requesting a specific address */
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr && addr >= mmap_min_addr &&
-				(!vma || addr + len <= vm_start_gap(vma)))
-			goto check_asce_limit;
-	}
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		goto check_asce_limit;
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
-- 
2.47.0.338.g60cca15819-goog


