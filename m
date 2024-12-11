Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED1FE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 23:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qH5hFVlZb/xpQlMxAKu7QZtletX8CELYGGCCA+g77Tw=; b=zweAl+wqXR8PWI1sf53fr5m0AG
	0pECjjUC/KqKDIvEQScwGnLA6LhtNtXpDYDBZ4XF7ws8fPawljlyGcxvEM2OBUjruyS1+WqOYHjVb
	lrOoP6JoNGcgaeV4ICDBdgOoxYvIkrCZWQ31QQ4igCu2bd9HEaHWtAXPDNdcFAc6oCX5Wp1+4xTy1
	rMDd9d5lRdNCoz1LIy3tiKYl9r8svaR6kTSBsxRTzR+g3GDeBDIY75VFIAAuEYtjenPpi+StGrP0n
	QG7jFZ6HWYyGQM5+WZqO1rxEoLI3X4vDRYS+a6+2nsmAhjosPwjSSIixr1QsQsAntgj/u8uXk45e8
	S6eDSb7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWJ0-0000000GUoy-3mfT;
	Wed, 11 Dec 2024 23:39:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW81-0000000GScP-3baD
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Dec 2024 23:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qH5hFVlZb/xpQlMxAKu7QZtletX8CELYGGCCA+g77Tw=; b=m+DORXdQMRvEm9gBjn4f2p9rQa
	r0/EGFrVXLzYSkzHzMbDP68pz0wNbYvaJjPdvY/4jpGIVolGjxNP9fB3ZHYY84rVadAnUW9AxOc65
	yuPkgLJN41eLfcsTSTUklj/61ErMwgE2azBiUoGhpRyVS25Iu73DNgHsoanRDwfrZeYffqFtidXyp
	mywwPWPyNcmmLm93w+CsZwVYYpGTiSyD4eg01qDtsMrmZEU1l/p5XevV9jbRx9Z9b2+DZMvXOXJzK
	9eJRJ4TWBATii9l4G+FXP/l4FfdzMbw3jLUhEfpw2VS2p5Q6HbI5IpnZ37b2JZdC2cXdrsQfz67Hl
	DeM/deNQ==;
Received: from mail-pf1-f202.google.com ([209.85.210.202])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW7n-00000003w1G-1zoc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 23:28:22 +0000
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-728e3d9706dso17885b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 15:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959687; x=1734564487; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qH5hFVlZb/xpQlMxAKu7QZtletX8CELYGGCCA+g77Tw=;
        b=tt6Ksu8CL3hdhJYb2Vo6vL/VLpP/kibOH/YQs++rErt6GFvTAQ8PZtxkeDd7Sxb2xH
         0IrGPc6GZ90whuP0tYN6RO1LLFRmZwUJDHzutpMPK+qX6rhOtlINI6s02Uz2NcFJOnVd
         RG1pHsWyYCU6D7OWzUV2V1rGMGUe9hSeEV/bSz+lnvsRiAqEPE/dE6TkLmA9WoF5E/vl
         iCg3oLsJZNYv2jwWAtR8V20PkoEsZ5UBy0pFhXlVImn4xm4EuhuJIOiV/dg1Ipax7gNK
         zzWbtzv1duvpmf2xvqYTdlnpnBTJcYwVNWGM5sFRXsJ6bFY9/9/u480/NY8m5WsljmKm
         txSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959687; x=1734564487;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qH5hFVlZb/xpQlMxAKu7QZtletX8CELYGGCCA+g77Tw=;
        b=UiG91n6MuRrlB62FryFroixWxhnzrXfs8Tpkh5VHnhqAXR/xtB7XQW1RmoGtdxXp6j
         jtMXt09yiAWZ+Vy7q3V0HCeaHxWiCfYXQNwNlIBcY7qaL59zFTbo6ZtadjEouU2FMdd/
         GYkk1SdSzM9zmSu1UABliiqWxk1ZKgwxAIarB9rEAXi7Z1LOMjcVcUxJaHq621yxrEiR
         RnancV9NfTFQ8+lvm8POdppM42sb603TS9Hw0hFXgNQkfHvLK8DBb+Iy2xTEcV5KFNDQ
         B9YnJwO4he2IhvPcCadxhEHpPs1sBL0UWfT7QWlHOrZEDzi8BLBtoJNAo56istOGJhbr
         GyjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9xG/vntUguMrBMRQbqlkwQF3lOf10LpzGgR4wcRgEgD+3qd4PrwB3NCwIx3eFYOMXqyM4+mObZwnq9hs23aR0@lists.infradead.org
X-Gm-Message-State: AOJu0YyO3S5C/lHtdaIn0pTO8LX/5/CnH7wxRTRL7SPdcJCfNuaw1R1q
	iKFAOl/GXBCGabL3Feqll6kAQ87eAsrqndgnSEgKyaUaOK2CFAsUv7IINuyj3zswfpU0diw97PQ
	t2ehmO3i+YwI3/X363G8vfw==
X-Google-Smtp-Source: AGHT+IE2HKYkuc89mtKU0bTUEVS1IdL7Se1Uvka0+Ku7HObHaGYamVyFYxuD0miLaBxiy9U265ART8wkxAXV/hrgFQ==
X-Received: from pgbct5.prod.google.com ([2002:a05:6a02:2105:b0:7fd:356a:ef35])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7288:b0:1e0:d848:9e83 with SMTP id adf61e73a8af0-1e1ceb1006dmr1536938637.25.1733959687513;
 Wed, 11 Dec 2024 15:28:07 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:43 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-6-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 05/16] mm: arc: Use generic_mmap_hint()
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
X-CRM114-CacheID: sfid-20241211_232820_940756_80CB9527 
X-CRM114-Status: GOOD (  15.68  )
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

Introduce arc arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/arc/include/asm/pgtable.h |  1 +
 arch/arc/mm/mmap.c             | 43 +++++++++++++++++-----------------
 2 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
index 4cf45a99fd79..af3210ea4888 100644
--- a/arch/arc/include/asm/pgtable.h
+++ b/arch/arc/include/asm/pgtable.h
@@ -28,6 +28,7 @@ extern pgd_t swapper_pg_dir[] __aligned(PAGE_SIZE);
 
 /* to cope with aliasing VIPT cache */
 #define HAVE_ARCH_UNMAPPED_AREA
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/arc/mm/mmap.c b/arch/arc/mm/mmap.c
index 2185afe8d59f..df01d4d9964b 100644
--- a/arch/arc/mm/mmap.c
+++ b/arch/arc/mm/mmap.c
@@ -14,6 +14,26 @@
 
 #include <asm/cacheflush.h>
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	if (len > TASK_SIZE)
+		return -ENOMEM;
+
+	/*
+	 * We enforce the MAP_FIXED case.
+	 */
+	if (flags & MAP_FIXED) {
+		if (flags & MAP_SHARED &&
+		    (addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1))
+			return -EINVAL;
+		return addr;
+	}
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 /*
  * Ensure that shared mappings are correctly aligned to
  * avoid aliasing issues with VIPT caches.
@@ -27,30 +47,11 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
 	struct vm_unmapped_area_info info = {};
 
-	/*
-	 * We enforce the MAP_FIXED case.
-	 */
-	if (flags & MAP_FIXED) {
-		if (flags & MAP_SHARED &&
-		    (addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1))
-			return -EINVAL;
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
 		return addr;
-	}
-
-	if (len > TASK_SIZE)
-		return -ENOMEM;
-
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
 
 	info.length = len;
 	info.low_limit = mm->mmap_base;
-- 
2.47.0.338.g60cca15819-goog


