Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90105E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 23:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uS3JA6w5wn3oIbxGMB+ie6BxkNausmcv0DhJz9a4fkc=; b=4AjsD0HhM2eWGb+DJFnxifQEV5
	lMSEx4Vzol5WwJH4lvStCdDnCHU12iKtrLEkwqzbk5euC/NHIqIP8Ml/C3UZ2ofZL7oVqww89JNnO
	w5wYrn47a+nAC292o9xZrDA4u/Vl3pZofxcK44dAAxuR2QkG/nGXiqt8BkJBs0DoUTkIUrCK09IQu
	QeGV7DtN5lUlnYEHuDD7YMgpfzTlHPuMK611CvG3OaLPmBdly/lriwzUgCiaJkMIm3tY0HRy6ESP0
	0nu5H/SIpTwWTPcPCr/nRNgN1eqDJUa69SgeIXXO8OOMhuUNgGgN3cxwFyJgw4fp3KtpFx/Envqyb
	CMT0nYnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWL6-0000000GVQ5-2A3M;
	Wed, 11 Dec 2024 23:41:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW84-0000000GSeI-3nMY
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Dec 2024 23:28:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uS3JA6w5wn3oIbxGMB+ie6BxkNausmcv0DhJz9a4fkc=; b=c4T4H/J6QP9yKUKRilKEUJOMC2
	am4fY/dUJ5zpwHlQMr7zlV8hKZ4GmVi8DxXLzg0tJPTCd4PAk1I9T3rJWr4uDav7gDj+/M0Apl2Ae
	O4ncg4fa1f0I0mx2Z3CQfYgxWNvpE8a1vH6urYGuZ6LUdhrZPoFsQFK3FJFbQCWi/KZ3VLC9ZraSI
	LpJVPUgoDkzJWa5oLSZHebb+8I9hl6CdIbcnmlV6pWDt6NaMf5Q8UintiRrbhy1seWQdOLhVGze5H
	4cTCyt8E9XK3HTyo0K9gRgnxnhYY2Olz6ukn6YUrr80bqUU0+cvnXIrRlZ0OOPoskctLimW03Iy79
	MOze9M2g==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW7y-00000001eVL-42mR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 23:28:27 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2178115051dso5245ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 15:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959699; x=1734564499; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uS3JA6w5wn3oIbxGMB+ie6BxkNausmcv0DhJz9a4fkc=;
        b=NRfl6XdYnyaCsg2QZIyNMQBeP8P6KIH3gWt4/rEoO/sKgTGRYs8tXFe9XdRPXRYgAe
         3cebLmRQlS1TPa4eI9UvAeCof3+mEEzS/h5pO3FDzVUcwZirODjpo8uTm59TmfapUlCY
         kcjZYbaPES6mhliQfk/KIYFgfu/9lEurahW8iXUfHqJdrLlnl22ke6GZ46lNskWn4PJ0
         UdV9JFosiwP3ayDd5ljH/hcnuBgUMuW8rvsr5+VjPxmB8citpLyqXXellvPr5uYVl1jl
         vZ429OZVd9FzT9mpscP4UIqNZmQgz7LM/cveNzQVplbNzSGM8lCq76CXyAF+CfEZWCer
         W2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959699; x=1734564499;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uS3JA6w5wn3oIbxGMB+ie6BxkNausmcv0DhJz9a4fkc=;
        b=dNvYawGXMI7lbv4Dc4+G/wTare2aHlWv1/Lcrl/B3Hu/DjJqi1jUorB5fCl1fDGYA6
         JnUW+0vjgC7C/r+Q7yT7aGPBZmZ8OIokBdPagNS0qecrFMfmCYLdI7bktB1ghOpyoGQu
         nJb+dSrhp9gqyzhr9nkl10zstyDuitx30Zo80Mjq5ijO4ihCRFkHpHClrfGkizQQ3OI5
         h6/vLyqiNQAfRvyCjvwX6XPPmcunnA6SENdeGVB57M49fU4Yvf84pcLrmXHhiaFLFhcH
         RJoyOKN3LOVZoy2Jze3+aTlnxBdc6Zd238BDeTETBiYOVrSHrLB6Y/9RIHL3830Bv6vW
         I7Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVAH6KzAkBFGcJKzUY3lbdHcD6i/EO5qkwJqYqBZ2QJeRjemTkICaJhd24G3dsQOgG+U4Qt59Gqk43awNC2Fkbj@lists.infradead.org
X-Gm-Message-State: AOJu0YxngYK76uzWUsHn4y//tjTGUgWpkGqn4iFUZQgZrq4Z2cPIXOca
	wRzO5yNbFzvIwSzhEhQtHwGy5Enw41XaH2ywrwsRyApBeLBfuqErGY1De5UXabg02DUvQic/8bV
	OsnmCXHj+Gn4KxL3wNKTqsA==
X-Google-Smtp-Source: AGHT+IH7t7zoi6yI0PaPMLOJjSIpLoHx+Um10nYrD7SAuARxjRKOSw8DIf3dxsqs6hFZHoDsSpm8PlX4hDRCbsA6SQ==
X-Received: from pgbcr9.prod.google.com ([2002:a05:6a02:4109:b0:7fd:4e21:2f5a])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d590:b0:216:7ee9:2227 with SMTP id d9443c01a7336-21778505a3cmr82109795ad.36.1733959699175;
 Wed, 11 Dec 2024 15:28:19 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:49 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-12-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 11/16] mm: sh: Introduce arch_mmap_hint()
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
X-CRM114-CacheID: sfid-20241211_232823_053331_90274A7D 
X-CRM114-Status: GOOD (  15.69  )
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

Introduce sh arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/sh/include/asm/pgtable.h |  1 +
 arch/sh/mm/mmap.c             | 83 ++++++++++++++---------------------
 2 files changed, 33 insertions(+), 51 deletions(-)

diff --git a/arch/sh/include/asm/pgtable.h b/arch/sh/include/asm/pgtable.h
index 729f5c6225fb..072dbe038808 100644
--- a/arch/sh/include/asm/pgtable.h
+++ b/arch/sh/include/asm/pgtable.h
@@ -149,5 +149,6 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
 /* arch/sh/mm/mmap.c */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* __ASM_SH_PGTABLE_H */
diff --git a/arch/sh/mm/mmap.c b/arch/sh/mm/mmap.c
index c442734d9b0c..ebda962e8c4e 100644
--- a/arch/sh/mm/mmap.c
+++ b/arch/sh/mm/mmap.c
@@ -51,14 +51,14 @@ static inline unsigned long COLOUR_ALIGN(unsigned long addr,
 	return base + off;
 }
 
-unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
-	unsigned long len, unsigned long pgoff, unsigned long flags,
-	vm_flags_t vm_flags)
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
 {
-	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
-	int do_colour_align;
-	struct vm_unmapped_area_info info = {};
+	bool do_colour_align;
+
+	if (unlikely(len > TASK_SIZE))
+		return -ENOMEM;
 
 	if (flags & MAP_FIXED) {
 		/* We do not accept a shared mapping if it would violate
@@ -70,24 +70,29 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		return addr;
 	}
 
-	if (unlikely(len > TASK_SIZE))
-		return -ENOMEM;
+	do_colour_align = filp || (flags & MAP_SHARED);
 
-	do_colour_align = 0;
-	if (filp || (flags & MAP_SHARED))
-		do_colour_align = 1;
+	if (do_colour_align)
+		addr = COLOUR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
 
-	if (addr) {
-		if (do_colour_align)
-			addr = COLOUR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
 
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+
+unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
+	unsigned long len, unsigned long pgoff, unsigned long flags,
+	vm_flags_t vm_flags)
+{
+	struct vm_unmapped_area_info info = {};
+	bool do_colour_align;
+
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
+
+	do_colour_align = filp || (flags & MAP_SHARED);
 
 	info.length = len;
 	info.low_limit = TASK_UNMAPPED_BASE;
@@ -102,41 +107,17 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 			  const unsigned long len, const unsigned long pgoff,
 			  const unsigned long flags, vm_flags_t vm_flags)
 {
-	struct vm_area_struct *vma;
 	struct mm_struct *mm = current->mm;
 	unsigned long addr = addr0;
-	int do_colour_align;
 	struct vm_unmapped_area_info info = {};
+	bool do_colour_align;
 
-	if (flags & MAP_FIXED) {
-		/* We do not accept a shared mapping if it would violate
-		 * cache aliasing constraints.
-		 */
-		if ((flags & MAP_SHARED) &&
-		    ((addr - (pgoff << PAGE_SHIFT)) & shm_align_mask))
-			return -EINVAL;
+	/* requesting a specific address */
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
 		return addr;
-	}
 
-	if (unlikely(len > TASK_SIZE))
-		return -ENOMEM;
-
-	do_colour_align = 0;
-	if (filp || (flags & MAP_SHARED))
-		do_colour_align = 1;
-
-	/* requesting a specific address */
-	if (addr) {
-		if (do_colour_align)
-			addr = COLOUR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
-
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+	do_colour_align = filp || (flags & MAP_SHARED);
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
-- 
2.47.0.338.g60cca15819-goog


