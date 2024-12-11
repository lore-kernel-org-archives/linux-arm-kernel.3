Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1503BE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 23:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=My9IlOPq9ns5P/NZxzKqYlKU2U5PkE8SqDXKTXIHc1k=; b=s2cd9Ccff1wJ4YJqIcuWAYeqxZ
	s6o2fIoH0/hzJeKCcxSs5HPFFcY+Jeq85Y0yTHkwWWrL2LiY2rgAL1jezlZTkfGto4MrbtnMxgrSa
	W1ytDj96noaME6M+JQP3UZABjSOwwyi1dzrU2+tZQllfVusFQyl2kdCQTO6FEc+dvCKLGCv1sEkLd
	YPKSkZ27SmqJdl4bE4W25OsRyxDj3MczMLCEViWoDurAGyFutkvQMN568FahPZxaB7eaKLXU7mqs6
	xuGdDwITnNesHTEzgUqc6xFRY5LtCWtxqkNyGsiMI9TUNdBBusTRZefHSt9d5ItleS/34lEsMkYvJ
	g2jBMJdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWDq-0000000GU2S-2p6c;
	Wed, 11 Dec 2024 23:34:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW7r-0000000GSXk-0NWo
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Dec 2024 23:28:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=My9IlOPq9ns5P/NZxzKqYlKU2U5PkE8SqDXKTXIHc1k=; b=iFQO87zwjdyVTF7uLetQ2XJXfk
	DduXJIaKEM0k8tu6C+9hQIrcNAyRPjsdyz7GbrYsJALXpo0k0/PhsVCN+uQ+pamQ5A3DP497foL4B
	9W3Ue7kXlfyEzSwET1RXacn+D2ZTJPquNmMQvzCIl14BjEUBomIkthSCXfoZ0LBCnWWhEWa4hgAZC
	LmI5wxMf2lqNl7L+qD5/R3FxVEqknDhN4AFTwRvWjiINDoftlzZ4Bs3PzCV3qlC/D5X9WmItzvnOZ
	khtPSEmGh1VCWRfqtoP9YwQU2lx+zd0ACc/it3tQmAnGN73CabOUnYrKuODYk0Yr82m+dvwcC3mxJ
	Dvlm/DIw==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW7n-00000001eLu-3xiO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 23:28:14 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-728eda1754eso26696b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 15:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959689; x=1734564489; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=My9IlOPq9ns5P/NZxzKqYlKU2U5PkE8SqDXKTXIHc1k=;
        b=Ig3zHH/lTutfYhaOLX46aZk5Aco99mDskmKb8BZxejwrFaR6f2WehuNeDw5FRSyuiO
         AqZ00JvhVvzuCfVR0uTcKYUEf7mtx6pKgsGgsB16C/YC6XCpCsdiMD9pwvFIRgP+7ktQ
         +uWKfV0FZnMM/jYOCxvjfxrneN8nZg+hp0WoAAPbktCT9Pi427QLm8Th7RgWYGdhATKD
         3H3SvanTVCQ1WvwHRJRF4PSQsHIcn0Z56JaRM0ROX7iffqTJIBW3eX0YL5lFqrfWF7mH
         aSySmEQ4RWvGb29/q9T9Y8sRjOjlrN8X6UZ6czStoeFolnPGF7UPpmHcEzKut4XryH14
         TN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959689; x=1734564489;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=My9IlOPq9ns5P/NZxzKqYlKU2U5PkE8SqDXKTXIHc1k=;
        b=QsZhDW0ptVlraxWhsNEQaE1hxylVcyVfd1Dt8hZ0le0L1PjXHWR0y2vbVFUmdOe7A5
         Us4AwjdzpvLO5b2tBsdFj4S1J4R6SmPq5lxvcK9qRdYlm89oos8uPK16mRgGCnVBMECD
         SFRIv2nDqPH+3e9W+6qVKyXK9J29oL+DAger3hY1FmnMhGtvmux+VEJrLjcusGeL2z7Z
         lQMA+LJmGvR1cYEDTI+ZTYJeBsDsGL9wrEY0xVUj0zejBCnUwEy64xmk6j8cFc50pHX1
         KfPBGhKTcdeAItCsOg1wwu8cEUIp131PZnXmUi82bItiulKbWDlB3DwMpa8T3p5oHjD8
         2RmA==
X-Forwarded-Encrypted: i=1; AJvYcCUjqAUHJx3Aa+Oqw//0o0VZ2bw61TiGuOMVwENtfO7liWu9aExTq68LBvxO+wPtCC9L07BVCbL881El29PUAA4J@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1tspuFgdyZkx3GCl8ox22TyEKrHZoiGcA1Dg9vCgoA/7edK01
	SND7MUgQ/pYj1KY14LPMW4HqiwAa4dib69dFKJUKDfxn93HV3lRNad2te8xtnpFZyFspLNKngeK
	pSL/3biV2jwR8KSgJZ++rGA==
X-Google-Smtp-Source: AGHT+IHgv+hz6lUV53h1smjsDXGUMrAdu+yMyNI0Y1qN6skLJAQw6jBsC8TmY8m6/oNaMxzzcfOLndyqCxWrzR4uSQ==
X-Received: from pgbee13.prod.google.com ([2002:a05:6a02:458d:b0:7fd:4d08:df94])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:7890:b0:1db:e40d:5f89 with SMTP id adf61e73a8af0-1e1cebb5277mr1761320637.28.1733959689528;
 Wed, 11 Dec 2024 15:28:09 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:44 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-7-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 06/16] mm: csky: Introduce arch_mmap_hint()
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
X-CRM114-CacheID: sfid-20241211_232812_073568_0E5F58DF 
X-CRM114-Status: GOOD (  16.74  )
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

Introduce csky arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/csky/abiv1/inc/abi/pgtable-bits.h |  1 +
 arch/csky/abiv1/mmap.c                 | 68 ++++++++++++++------------
 2 files changed, 38 insertions(+), 31 deletions(-)

diff --git a/arch/csky/abiv1/inc/abi/pgtable-bits.h b/arch/csky/abiv1/inc/abi/pgtable-bits.h
index ae7a2f76dd42..c346a9fcb522 100644
--- a/arch/csky/abiv1/inc/abi/pgtable-bits.h
+++ b/arch/csky/abiv1/inc/abi/pgtable-bits.h
@@ -51,5 +51,6 @@
 					((offset) << 10)})
 
 #define HAVE_ARCH_UNMAPPED_AREA
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* __ASM_CSKY_PGTABLE_BITS_H */
diff --git a/arch/csky/abiv1/mmap.c b/arch/csky/abiv1/mmap.c
index 1047865e82a9..0c5c51a081e4 100644
--- a/arch/csky/abiv1/mmap.c
+++ b/arch/csky/abiv1/mmap.c
@@ -13,6 +13,39 @@
 	((((addr)+SHMLBA-1)&~(SHMLBA-1)) +	\
 	 (((pgoff)<<PAGE_SHIFT) & (SHMLBA-1)))
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	bool do_align;
+
+	if (len > TASK_SIZE)
+		return -ENOMEM;
+
+	/*
+	 * We only need to do colour alignment if either the I or D
+	 * caches alias.
+	 */
+	do_align = filp || (flags & MAP_SHARED);
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
+	if (do_align)
+		addr = COLOUR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 /*
  * We need to ensure that shared mappings are correctly aligned to
  * avoid aliasing issues with VIPT caches.  We need to ensure that
@@ -27,8 +60,7 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
-	int do_align = 0;
+	bool do_align;
 	struct vm_unmapped_area_info info = {
 		.length = len,
 		.low_limit = mm->mmap_base,
@@ -36,37 +68,11 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		.align_offset = pgoff << PAGE_SHIFT
 	};
 
-	/*
-	 * We only need to do colour alignment if either the I or D
-	 * caches alias.
-	 */
-	do_align = filp || (flags & MAP_SHARED);
-
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
-		if (do_align)
-			addr = COLOUR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
-
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
 
+	do_align = filp || (flags & MAP_SHARED);
 	info.align_mask = do_align ? (PAGE_MASK & (SHMLBA - 1)) : 0;
 	return vm_unmapped_area(&info);
 }
-- 
2.47.0.338.g60cca15819-goog


