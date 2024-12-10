Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24CCE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 02:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJfesLSvigtPKLpc5l88d8L2TdNCPAh9XHgD9Aaia2I=; b=aBKavYcHn4fZjgvaCUOi7Rx3J8
	qu8ZN1ZzVBJG/6VP8M+t85u62LcWqRQEV5BMKSdf4Ykq8xZb5lPP+emvh/sHiHaNq0+NVPw4bkfuB
	Be9nxdOBiwiSW+N4P14fP5tQm8cyfxmJHwBYV8KczlT+xrVHQ1RD7RXZTbOfb7++zV8h2mN7s11T/
	Xpfm9jXUGuu4pV86wpmBs5ceCSLTzZJ3vuuCFGPySOVrkAkG4/al0BoH7zPABIXjPHyNw12Yn/glh
	ejUL+8dASgYEmKoQ8dCPHH1GXcmzM96lMx/VwPGFsA0e99P6fJNXRGvkgnUOvzjDO+jcq3o1tNOVx
	knuZf/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqT3-0000000A3Nl-0q08;
	Tue, 10 Dec 2024 02:59:21 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqCB-00000009zvZ-2b40
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 02:41:56 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-725e8775611so1558900b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 18:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798514; x=1734403314; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mJfesLSvigtPKLpc5l88d8L2TdNCPAh9XHgD9Aaia2I=;
        b=kQ3gHxc6QpBoF+im7uWNRWVyGd29eNVIEB6yZvWKOi6PYDN8k9EIXrKAXvyFgPoTc5
         HRrvT+hu9Kdt8IHjNZX1SPpikgsfXCbWFESICDo5fmR9ZlvrHpDMb9O5M0N5CYqlZbFa
         J417HYe/jBBDstNo5CP5HunhTmQrH7g3UhJSBc2myYdgWQ9geZb2dFUy7O5I5OKxvTVy
         thF4a/tt1vL38m/28gvWOIngPD9Bx+Fk0yaQRdZNm4rfWldbJeNtQgQWrQPhIIGkowWz
         aN9zmexkqu9Rz4m4CTC9eN4dqmvJ1dLbaeKGei+u7C7h4bgqrFsUH+J1AF5jGHpGycDS
         i+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798514; x=1734403314;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJfesLSvigtPKLpc5l88d8L2TdNCPAh9XHgD9Aaia2I=;
        b=DQKUECErpM+MFLjJkOf3y8L1Qr+czqUBsEEbFL9hHJjmvHV9PCcnlIMQvIhvoNA3aT
         MnJ0LsOB4kExWYiuv5a0MhHhwQGpXop6+ft264+cvUrLJkAlRxYaoW/iZmF/aFhZoHRF
         cTIbI3JgEwIDcOLI3Mf1uWQneLkulHToHynP7KWZdFxVS5m87XvpyEWCxtLfC5rMdkeE
         fMfWGAx9POVY+FaF5WM7ebk/gG1V3T+nvTWkyYXxiPUUK9YTCEMwOw2XvSIr1WfNFSkA
         NV2YN18O81wxnojTVxzo/6kfM6TWkQyd4A4+gitSgihth8qU1cHxfCfOwX6YF8xvJ9mZ
         aL0g==
X-Forwarded-Encrypted: i=1; AJvYcCXT6j+hgwJL2Tu4KRjeyQGETxDMF6f6vXUmanw6VkV5Bo5dPxWn7lZtGhi8HljTw3BDaMq0TY4m8qnH7gzTvE9t@lists.infradead.org
X-Gm-Message-State: AOJu0YybbTG9lR4gGDSANz+kyViUXVnrEzIeIF0mZiqK3NIaycGTS6xl
	PbR8AXDakgoZ4ACJ06CcOGp6Z0j3/9FFUuwwvyGpghQXcP9onYkYGP2kftbyRQAW6guVtW+7jXQ
	0rjmDCopyBLxXuQVQwK/wUw==
X-Google-Smtp-Source: AGHT+IH7c/kAWkG1dgCDsYvw4E2EH4mgzAeRRpKy/JiEpi/blwtzY1No/+Nej6iG3SIgIjXbM8HkPN0PZclD3pT9zw==
X-Received: from pfbf13.prod.google.com ([2002:a05:6a00:ad8d:b0:725:a760:4c72])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:14d3:b0:725:f097:ed21 with SMTP id d2e1a72fcca58-7273cb1d8c2mr3121572b3a.15.1733798514446;
 Mon, 09 Dec 2024 18:41:54 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:19 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-18-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 17/17] mm: Respect mmap hint before THP alignment
 if allocation is possible
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
X-CRM114-CacheID: sfid-20241209_184155_691177_7599AEDE 
X-CRM114-Status: GOOD (  18.75  )
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

Commit 249608ee4713 ("mm: respect mmap hint address when aligning for THP")
fallsback to PAGE_SIZE alignment instead of THP alignment
for anonymous mapping as long as a hint address is provided by the user
-- even if we weren't able to allocate the unmapped area at the hint
address in the end.

This was done to address the immediate regression in anonymous mappings
where the hint address were being ignored in some cases; due to commit
efa7df3e3bb5 ("mm: align larger anonymous mappings on THP boundaries").

It was later pointed out that this issue also existed for file-backed
mappings from file systems that use thp_get_unmapped_area() for their
.get_unmapped_area() file operation.

The same fix was not applied for file-backed mappings since it would
mean any mmap requests that provide a hint address would be only
PAGE_SIZE-aligned regardless of whether allocation was successful at
the hint address or not.

Instead, use arch_mmap_hint() to first attempt allocation at the hint
address and fallback to THP alignment if that fails.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 mm/huge_memory.c | 15 ++++++++-------
 mm/mmap.c        |  1 -
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 137abeda8602..f070c89dafc9 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1097,6 +1097,14 @@ static unsigned long __thp_get_unmapped_area(struct file *filp,
 	loff_t off_align = round_up(off, size);
 	unsigned long len_pad, ret, off_sub;
 
+	/*
+	 * If allocation at the address hint succeeds; respect the hint and
+	 * don't try to align to THP boundary.
+	 */
+	addr = arch_mmap_hint(filp, addr, len, off, flags);
+	if (addr)
+		return addr;
+
 	if (!IS_ENABLED(CONFIG_64BIT) || in_compat_syscall())
 		return 0;
 
@@ -1117,13 +1125,6 @@ static unsigned long __thp_get_unmapped_area(struct file *filp,
 	if (IS_ERR_VALUE(ret))
 		return 0;
 
-	/*
-	 * Do not try to align to THP boundary if allocation at the address
-	 * hint succeeds.
-	 */
-	if (ret == addr)
-		return addr;
-
 	off_sub = (off - ret) & (size - 1);
 
 	if (test_bit(MMF_TOPDOWN, &current->mm->flags) && !off_sub)
diff --git a/mm/mmap.c b/mm/mmap.c
index 59bf7d127aa1..6bfeec80152a 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -807,7 +807,6 @@ __get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
 	if (get_area) {
 		addr = get_area(file, addr, len, pgoff, flags);
 	} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && !file
-		   && !addr /* no hint */
 		   && IS_ALIGNED(len, PMD_SIZE)) {
 		/* Ensures that larger anonymous mappings are THP aligned. */
 		addr = thp_get_unmapped_area_vmflags(file, addr, len,
-- 
2.47.0.338.g60cca15819-goog


