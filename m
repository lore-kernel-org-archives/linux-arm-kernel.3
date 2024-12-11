Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC0DE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 23:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCptMPgkqno2A/YzE5Va18QE7zdNUHtEUd5zzpUozKw=; b=c0lRAni0wcN0j62JbV9FzTGCso
	FUxPbCCtGd6/VqlEkfAOsppMO0S1VNIUiHC7Cvc0bUkEGstOGJR+czG1lHc7XG03etF72kYR20KoG
	j4125r2tx25f4WkaIg54so5avpRxIg0tEc363+ZuK/kxuSWAuS4wh5HLKo2B7QoYr0j3d810hAVyp
	8T4af63K10nFaX1H9M71bIF4uPEKXcOuxlNVhjvNNXJfPxCVMKN9mJmKX40+Qhcg9yVh9aynFB7nW
	v0/cup88lNvWwimYNI23Y55OcEzSxWA8GzsAoZCmVhFvQ67TtNrkl5+te0EX1d+gLlSAQYjaPSlZ1
	7XpEsaqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWFu-0000000GUSC-44U1;
	Wed, 11 Dec 2024 23:36:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW7w-0000000GSZa-39yY
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Dec 2024 23:28:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SCptMPgkqno2A/YzE5Va18QE7zdNUHtEUd5zzpUozKw=; b=F0QP4rlntVg1znDPeKri6rEIIv
	a3gZmPkEZquIKhaDXfOLYOTNNDLuGdCeyQW6l/dXBsZ/9yWEjuI2UdsHgd8pCJM052/vTMUVTcfgV
	93nHZV/smrltQ2+AgyEMjwABmZgVmHvIneDQ3mG33QySCE+nw30zO7sg4dadEAw6oN+mTUzveC0zJ
	ifcb5iYSHmmHz5YPb3PGov6vKuamIyJDwL6TzNeU45PTtb3rQuJ6Gic7xZ3aujL48xhItz6W0aJUO
	C7V49IEYXRkJPl/q8+Gg2PIWqiE21x2COfSUeK1E4zmL3tUwBL49L1IwLHBHvwymsLGrt8aq/4dtp
	w6xH0xdg==;
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW7s-00000001eOR-3SsL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 23:28:19 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7f3e30a441aso28425a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 15:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959691; x=1734564491; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SCptMPgkqno2A/YzE5Va18QE7zdNUHtEUd5zzpUozKw=;
        b=Vj71ayoTWtBWlC+lCrC2SoVgdluwIfEsca4SSxfY7rV3Vjy0mqBCb4Jp0sMJGKo4SE
         o4NbpExBndzrCUYHsZZcGNz236cwmTPmu9PCELHPFH7x5H+jgBvBR4LhbnFQMS2oMpgF
         CR2x1iO1DceBi+nuqvs7mbRQQqPPUUkpBgfWXzyGStDsLO9IdM/07OyryIVjaH6lyzBr
         qfGkK0lgtWlE7THjV6FB1JL1Ko41sCA1sp1QP8yRyShyeB6JlYewLFPxnhokoR9G3Vi1
         U+wub+Hwdx/h5WBfD8pXCU6LA6mGH7K2f8xC3hsV3hADALvxhpbixvx7sWEnd8EYVj1o
         Q2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959691; x=1734564491;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SCptMPgkqno2A/YzE5Va18QE7zdNUHtEUd5zzpUozKw=;
        b=YiONUrAX7sV4DlTOCnGOeoT0jP++B5MiSnSPlsjQCLbM0AuPix/bru4Sdwjtt91Fiq
         im1WtQ6YK9K+iddBF3rRrlLFB8gQwnrTEBt/8ldFtZYIeXqe7rBX8J4rlfvsiMHAkItT
         An8V+CgEAGfDegc8kCMpvAs1CEbrUbfvFmkofJt4fealv9ZK25s1BWKfdxOQa1jx+V3L
         Ip9AF8JNnxkTrYyRVYBkgq9xBScvj8jGS+sN/cXeVzS7eV0iGktlRE3oZza4BV6CzLTw
         enyz1jOlocxkZi9qGH05qc5yysM/DFVmW9GZIqG5h0R8a+ib52ulZk56xPDwumhy5/6A
         FHIg==
X-Forwarded-Encrypted: i=1; AJvYcCXNwAri0pSM2Tze4N9T18u+wyjLw/HA/BUmlmGjpkfTYv7NKO7DbhjaLKLHIgk7b32QGC9mAcpQmQPhVSm5qX4A@lists.infradead.org
X-Gm-Message-State: AOJu0YzgOEfGYPfZfkrRnEAQx2jl4m9U/XRMZekXnnQK+dgRjHZALU6N
	kGdECZZCjFdo960QeTfSqb0nzKF1sC6oKrYO7vWUkBk3LnUx2ulabqjN2LoWiEH1YQPVc5R6Mn0
	emvwnE9kEGwe5yMukGS3WjA==
X-Google-Smtp-Source: AGHT+IFbvN9gPDak20G0G+YmM9pMBv8oAuiEUiRl+GFZxjvR/H2lZBtc+wP+WVSCEq90xAWHwKXzIcf2MC+rzJKWTA==
X-Received: from pfxa2.prod.google.com ([2002:a05:6a00:1d02:b0:725:c7de:e052])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:e306:b0:1db:e922:9eaf with SMTP id adf61e73a8af0-1e1ceb2e4dfmr1374719637.27.1733959691453;
 Wed, 11 Dec 2024 15:28:11 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:45 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-8-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 07/16] mm: loongarch: Introduce arch_mmap_hint()
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
X-CRM114-CacheID: sfid-20241211_232816_963124_3B2AC307 
X-CRM114-Status: GOOD (  15.45  )
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

Introduce loongarch arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/loongarch/include/asm/pgtable.h |  1 +
 arch/loongarch/mm/mmap.c             | 49 +++++++++++++++-------------
 2 files changed, 28 insertions(+), 22 deletions(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index da346733a1da..326a6c4b7488 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -624,6 +624,7 @@ static inline long pmd_protnone(pmd_t pmd)
  */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* !__ASSEMBLY__ */
 
diff --git a/arch/loongarch/mm/mmap.c b/arch/loongarch/mm/mmap.c
index 914e82ff3f65..9e57bb27642f 100644
--- a/arch/loongarch/mm/mmap.c
+++ b/arch/loongarch/mm/mmap.c
@@ -17,15 +17,11 @@
 
 enum mmap_allocation_direction {UP, DOWN};
 
-static unsigned long arch_get_unmapped_area_common(struct file *filp,
-	unsigned long addr0, unsigned long len, unsigned long pgoff,
-	unsigned long flags, enum mmap_allocation_direction dir)
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
 {
-	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
-	unsigned long addr = addr0;
-	int do_color_align;
-	struct vm_unmapped_area_info info = {};
+	bool do_color_align;
 
 	if (unlikely(len > TASK_SIZE))
 		return -ENOMEM;
@@ -45,22 +41,31 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 		return addr;
 	}
 
-	do_color_align = 0;
-	if (filp || (flags & MAP_SHARED))
-		do_color_align = 1;
+	do_color_align = filp || (flags & MAP_SHARED);
+
+	if (do_color_align)
+		addr = COLOUR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
+static unsigned long arch_get_unmapped_area_common(struct file *filp,
+	unsigned long addr0, unsigned long len, unsigned long pgoff,
+	unsigned long flags, enum mmap_allocation_direction dir)
+{
+	struct mm_struct *mm = current->mm;
+	unsigned long addr = addr0;
+	bool do_color_align;
+	struct vm_unmapped_area_info info = {};
 
 	/* requesting a specific address */
-	if (addr) {
-		if (do_color_align)
-			addr = COLOUR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
-
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
+
+	do_color_align = filp || (flags & MAP_SHARED);
 
 	info.length = len;
 	info.align_mask = do_color_align ? (PAGE_MASK & SHM_ALIGN_MASK) : 0;
-- 
2.47.0.338.g60cca15819-goog


