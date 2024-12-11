Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503BCE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 23:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3IQSr9A1qLdVskR9rEe7ppqc2lFkJy3Q6Qw5iPRaPE=; b=2k4GRScHLHsRNDvrMVBaRi6KoS
	u7JGMPx4WF4xCIXhEX7kuMzAjIWnt+lF3tyhLnVjTNvmXpZnAIDvBQBHYcpyQG0XOAQMv71QilqHG
	JV5uD7APVY1NbBJ+skyZgAfm2kFT9HkcLEU8u0QoJrCS5aM9yKueN/SVhR5o5wqzHiyugmLJ2HFNp
	Igd9n0b9BUgoTsfoVn8ZYfl7w39v98EbRCcFG/dHL/l7AGzsDD2sowtSNl2hL/UW9sAAjH/YiT/Dm
	DgkogYi5BMycRfd+ghGgfQwoKvauwHLUVMSkl9o+Qz7zQK3aHuoqYAj9iEvkKnBXBeQDyI6gJhzCN
	JSNzyxVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWAl-0000000GTcR-22Ym;
	Wed, 11 Dec 2024 23:31:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW7l-0000000GSVl-1gKf
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Dec 2024 23:28:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=C3IQSr9A1qLdVskR9rEe7ppqc2lFkJy3Q6Qw5iPRaPE=; b=bjxAGLAijpOGeSBg8+QHgKgl7n
	oP6/PignGEJ8I/Jdz4PTaCMzRlc1v94fyh1MJmLuBfNvH3UECOsLBHLT6aNAlgHjZN266k/I32rMC
	xpDnbjuc2hQTJbE+SfkC4YhaoayM/IQQwAz0nCrHYt/zxz06FRj71SRtwQ50qFan9z1nu8T+vm5dw
	+n/CQOuqy7nxvuWqG67Y4/XZX/45W79dJxTbbx/y0Y6a4T47GepwIcRxzd2k9Xk7jR/sW4zqpIODH
	UQLs3mGfSfwztzJtUYP0GpkowO2NfspkZBma1vR2nrM20Ccf93B9DotU06XAwv5uSJJzROLXyfNxy
	1sWDjmeQ==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW7g-00000003vyf-48YT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 23:28:06 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-725cab4d72bso19304b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 15:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959682; x=1734564482; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=C3IQSr9A1qLdVskR9rEe7ppqc2lFkJy3Q6Qw5iPRaPE=;
        b=00F0bz5e+gNvXHk4Kq2xxctR6EeaQvHU6ZIZ06lX92r95IhpdNJ1XZQumZ/LmVNPhQ
         szIpcXSJ2LGy6Wi9Ce0wbtMRLhsKqulXtThUXLfW4m3i0ZpcVjJNSyq0b8LurwHulWJ/
         XMnwGa04NczRlqRFjYXmjYe6WZ7q1eovryEMS44ETTQ6UyP1GpWJGNuFolJfN7pYiawK
         DQKzDDebJyWbbRd++Jql1HS0gH29dRkpzKZj7xzXABHxlaSYcdyKUknrEbl5MFDUacHM
         ATM2yQ5wl1e5fvKMNjrIEi90crqr5w2qqxCqjnA8HkTU7SPKDQ9i0gryFw0lMuPQ/+Mc
         QffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959682; x=1734564482;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C3IQSr9A1qLdVskR9rEe7ppqc2lFkJy3Q6Qw5iPRaPE=;
        b=I5n1HdqmHL1URkk1FeMxtU8RlS/BQ8yOp/MJ8847yRfQbNufLo4hZRIRH+H4w7XNCN
         MyQjcshZqGTasKZeDwVGYYWZS/hJhgVlc4Kb9R7myNS8ozsahe150/9IwamZuMyfT4R7
         M/cVS4HRZ/IdF3YXr/A3VmybiAsyMmzHYnJ6GAIXDvs6amYzI4mNdUr/OQ4X9rvtp8ie
         HrALeKF7AlVJ5F9aGYRzJ94iV+uMh7BF344GLsDtS6x1bLZWWi9EOLih31ZSbZjpmcAA
         /8D5otwjAA/wDX5Mq2btl3G49Z273vvyFmeSLMYj4FG5xU9t2hlnAJA+RQDAjo9XKBKS
         njcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyyEwXdZ9i2KeHpEyKKvLDiyTE6CXXhluiP8w8bqHthYaUO5vDc9sUB3lBIGo3mcTCtDqe+bOaRs4YSGh+l2v1@lists.infradead.org
X-Gm-Message-State: AOJu0YzlzOZuByEz9Fk809nzJSTRMW5S+Q47e8KtLV3FnN9bPAp+Fvk6
	IXT4WAOwXHiOfJNApOllH9u6V2frmLtVzpEfYUsobm9bqc77HXBOTpCBWPx3J0+CeY1Hg6wSjFH
	Ka3NKfQr7K+Wn6btn+7JQOw==
X-Google-Smtp-Source: AGHT+IHwoWCnSZAFhgfRGzh0vJKMetndx4pRL/iGA/i3q5lPp5GtpRRmcU9xCr75DNYXJvBdH8Wl1Hh5YkFK8klCiw==
X-Received: from pge13.prod.google.com ([2002:a05:6a02:2d0d:b0:801:9432:2d6d])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:cf83:b0:1d9:18af:d150 with SMTP id adf61e73a8af0-1e1ceafb16amr1741157637.21.1733959681795;
 Wed, 11 Dec 2024 15:28:01 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:40 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-3-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 02/16] mm: x86: Introduce arch_mmap_hint()
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
X-CRM114-CacheID: sfid-20241211_232805_351304_F71A1BC8 
X-CRM114-Status: GOOD (  18.17  )
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

Introduce x86 arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Fallback to generic_mmap_hint() if an architecture doesn't
provide HAVE_ARCH_MMAP_HINT.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate most of the error handling in arch_mmap_hint().
  - Fallback to generic_mmap_hint() if arch_mmap_hint() is not provided.

 arch/x86/include/asm/pgtable_64.h |  1 +
 arch/x86/kernel/sys_x86_64.c      | 64 +++++++++++++++----------------
 include/linux/sched/mm.h          |  5 +++
 mm/mmap.c                         |  9 +++++
 4 files changed, 45 insertions(+), 34 deletions(-)

diff --git a/arch/x86/include/asm/pgtable_64.h b/arch/x86/include/asm/pgtable_64.h
index d1426b64c1b9..4472fd0040c3 100644
--- a/arch/x86/include/asm/pgtable_64.h
+++ b/arch/x86/include/asm/pgtable_64.h
@@ -245,6 +245,7 @@ extern void cleanup_highmap(void);
 
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 #define PAGE_AGP    PAGE_KERNEL_NOCACHE
 #define HAVE_PAGE_AGP 1
diff --git a/arch/x86/kernel/sys_x86_64.c b/arch/x86/kernel/sys_x86_64.c
index 776ae6fa7f2d..008c6d19bd02 100644
--- a/arch/x86/kernel/sys_x86_64.c
+++ b/arch/x86/kernel/sys_x86_64.c
@@ -123,31 +123,44 @@ static inline unsigned long stack_guard_placement(vm_flags_t vm_flags)
 	return 0;
 }
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	unsigned long begin, end;
+
+	find_start_end(addr, flags, &begin, &end);
+
+	/* requested length too big for entire address space */
+	if (len > end || len > TASK_SIZE)
+		return -ENOMEM;
+
+	/* No address checking. See comment at mmap_address_hint_valid() */
+	if (flags & MAP_FIXED)
+		return addr;
+
+	addr = PAGE_ALIGN(addr);
+
+	/* Fallback to VA space search? */
+	if (!mmap_address_hint_valid(addr, len))
+		return 0;
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 unsigned long
 arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len,
 		       unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
 {
-	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
 	struct vm_unmapped_area_info info = {};
 	unsigned long begin, end;
 
-	if (flags & MAP_FIXED)
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
 		return addr;
 
 	find_start_end(addr, flags, &begin, &end);
 
-	if (len > end)
-		return -ENOMEM;
-
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-		vma = find_vma(mm, addr);
-		if (end - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
-
 	info.length = len;
 	info.low_limit = begin;
 	info.high_limit = end;
@@ -168,34 +181,17 @@ arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr0,
 			  unsigned long len, unsigned long pgoff,
 			  unsigned long flags, vm_flags_t vm_flags)
 {
-	struct vm_area_struct *vma;
-	struct mm_struct *mm = current->mm;
 	unsigned long addr = addr0;
 	struct vm_unmapped_area_info info = {};
 
-	/* requested length too big for entire address space */
-	if (len > TASK_SIZE)
-		return -ENOMEM;
-
-	/* No address checking. See comment at mmap_address_hint_valid() */
-	if (flags & MAP_FIXED)
-		return addr;
-
 	/* for MAP_32BIT mappings we force the legacy mmap base */
 	if (!in_32bit_syscall() && (flags & MAP_32BIT))
 		goto bottomup;
 
 	/* requesting a specific address */
-	if (addr) {
-		addr &= PAGE_MASK;
-		if (!mmap_address_hint_valid(addr, len))
-			goto get_unmapped_area;
-
-		vma = find_vma(mm, addr);
-		if (!vma || addr + len <= vm_start_gap(vma))
-			return addr;
-	}
-get_unmapped_area:
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index edeec19d1708..f4143703f234 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -205,6 +205,11 @@ unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
 				unsigned long len, unsigned long pgoff,
 				unsigned long flags);
 
+/* See generic_mmap_hint() */
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags);
+
 unsigned long
 generic_get_unmapped_area(struct file *filp, unsigned long addr,
 			  unsigned long len, unsigned long pgoff,
diff --git a/mm/mmap.c b/mm/mmap.c
index 382b4eac5406..76dd6acdf051 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -705,6 +705,15 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 }
 #endif
 
+#ifndef HAVE_ARCH_MMAP_HINT
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+				      unsigned long len, unsigned long pgoff,
+				      unsigned long flags)
+{
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+#endif
+
 /*
  * This mmap-allocator allocates new areas top-down from below the
  * stack's low limit (the base):
-- 
2.47.0.338.g60cca15819-goog


