Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A19CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k5RPYj2govdLgAJsVUJ2S305q8KB/kIKY0e8R/KfmxA=; b=kyJgJxQrz5+brnst93rvpjjPdo
	4ZyHzet53bG5LNyjlhnYrkf4rTsIG/WLkn+w9tnCCjcc/0yE1TQJGlm6O7NSxMWB12OmiwnqSGx+q
	jNv/jF8htDdK7umw8fwtEjtFas4GVBhOVXVE2XxMn9x1ChnAqznt6cZjw2z/hJJIk+GvVn4Dh3Xay
	nimCFKyxHytiB2hrBsrmZw7Hj02Y+CqLG7k8HGvDxTk8SWC/+TgDBxXRvhh++g4gT4u/qDehRZ8ay
	iLp0631l+Kq0aceW8JJQAdMdjaKFUa15z2I0ats5txAq4aYCRC1LjoRv+jmTtwtX2Vli0vMWBQn+V
	K+bS+AQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuOa-0000000Cs8h-3hPI;
	Wed, 17 Sep 2025 15:48:36 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuOY-0000000Cs7B-3s8U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 15:48:36 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-25669596921so71304425ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 08:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758124114; x=1758728914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k5RPYj2govdLgAJsVUJ2S305q8KB/kIKY0e8R/KfmxA=;
        b=i2KB9S52gpV6J6rKQxDHwl2JO219+SY6l5xO9i1aoG6Svej8UmFmSa8W1wN4JKhsVf
         xABS7/JUHz18mxTzv3vv+hjYOYO8Y0n2BHvjLDiMXnWLL3s23/Z01NWXH2X7XzGEagtf
         tjer2dRgQEE35Hgusz4LMzJ5Xa5j1gVDCEV4Chb0kvJyJymjhYc2eNG3VgLBfqEeRTeU
         kyYKBRQf/PUAmT2NogpNtJGuJypPu8OwK9s7c2ilWksZo6BtVqAG9UIfeUwcu1gqWGH0
         PBQyACensGoQB2u2b0F3/A53nP1uEXz7iv6nB4NkbIvOsenz4wqAKI/+MuL+LVJCaCID
         Bp7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758124114; x=1758728914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k5RPYj2govdLgAJsVUJ2S305q8KB/kIKY0e8R/KfmxA=;
        b=L3EcRZDjiAs/lqjlbHAbuXA4n7wyY6O7MJ8rZzcVvBu2dUrw4kpDPxa/rC4iX7L+2s
         77LllE8AwB2+wMngLDOpb/9QGdKLv9aNUJ5pAStwGfhRtEpuf2GWZOrrifT9v37UOZOa
         Iaq3rkPWpZOVbIIkUvXBGxGkJvrCu3wPB3TZ+ybfPbt7jPCIDGfAtppeJRoIApg4g2Aj
         +vrlwqy3bshUh63QC0ABKROFg8nZ9EjJgUoxu0+8K+mbItreiWwvCmEdBMO0ylMisDLV
         nEIjKJ5T2uJhYiyGk8lIn1ZYJUD6pJVGVd7piJttepl2Fi0AJbiDE9PB3iWYYZk/0QAZ
         YEsA==
X-Forwarded-Encrypted: i=1; AJvYcCXsP22WdYL8CThloiF48MKfgBRMSfjdTTtoNB85hbZlDqTPxn7QFa4kGK7Xesw7g4uqIWuC/lKRlnriLnrIulH4@lists.infradead.org
X-Gm-Message-State: AOJu0YxzBtHkr3auiLD1VGx/DsxExvrmmZt59lcHbdiNs41OMPFO1LVj
	RU5DmRsm2CDltsT8XRfzjzd2xAHllXhj2eZq1BABPtPZ6D/4TAb8tr5G
X-Gm-Gg: ASbGncvqyHWa+JpSrF5xbpdIvIXAPnNTdXBhD1RtmXZiHdQq2VFY4MmYQOsGgF2so+j
	Y/FPEpBlN8WU8IZxiua74EDKZhlENf1c3WrII2iApLG4f5NWWIELK+x0q6KJMr93yYJS91WCxGF
	qwRVO020ymAAjLpjxfVtFGkh1w01Ry7DaG2Ddv5wUKmPge6jh6x/4dueMOLLXmkNLwRzhFjB4Qw
	uoDtu4nyT+7gjiJYWHH5VlMIJkSMezuaMMPfJ6n1UDdgHUR3lkx3Y5bJv0WltlotKrPUfskWC3g
	4pYnhqZGPuK+k/isMNlTHv6iwqScZIHsx0KMiFPau0ZjeyPlaHbiw6/bAepi7IedXMzGs3mu9GZ
	ycrNi5JWo18shHGSD9CgbOdvN3Y5D1PuPsw==
X-Google-Smtp-Source: AGHT+IG+Qiac11pmTk0tCinNrp10vTINXiw2GLyFTb6yRHVut739dW6S796H6UTFDPxnHEvjt3sMJg==
X-Received: by 2002:a17:903:19eb:b0:266:e8c3:4712 with SMTP id d9443c01a7336-26813f198d7mr36117175ad.58.1758124113638;
        Wed, 17 Sep 2025 08:48:33 -0700 (PDT)
Received: from VM-16-24-fedora.. ([43.153.32.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ea0f94005sm2569799a91.1.2025.09.17.08.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 08:48:33 -0700 (PDT)
From: alexjlzheng@gmail.com
X-Google-Original-From: alexjlzheng@tencent.com
To: mingo@redhat.com,
	tglx@linutronix.de,
	jroedel@suse.de
Cc: linux@armlinux.org.uk,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	urezki@gmail.com,
	arnd@arndb.de,
	vincenzo.frascino@arm.com,
	geert@linux-m68k.org,
	thuth@redhat.com,
	kas@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Jinliang Zheng <alexjlzheng@tencent.com>
Subject: [PATCH] mm: introduce ARCH_PAGE_TABLE_SYNC_MASK_VMALLOC to sync kernel mapping conditionally
Date: Wed, 17 Sep 2025 23:48:29 +0800
Message-ID: <20250917154829.2191671-1-alexjlzheng@tencent.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_084834_966451_3A69F99B 
X-CRM114-Status: GOOD (  15.77  )
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

From: Jinliang Zheng <alexjlzheng@tencent.com>

After commit 6eb82f994026 ("x86/mm: Pre-allocate P4D/PUD pages for
vmalloc area"), we don't need to synchronize kernel mappings in the
vmalloc area on x86_64.

And commit 58a18fe95e83 ("x86/mm/64: Do not sync vmalloc/ioremap
mappings") actually does this.

But commit 6659d0279980 ("x86/mm/64: define ARCH_PAGE_TABLE_SYNC_MASK
and arch_sync_kernel_mappings()") breaks this.

This patch introduces ARCH_PAGE_TABLE_SYNC_MASK_VMALLOC to avoid
unnecessary kernel mappings synchronization of the vmalloc area.

Fixes: 6659d0279980 ("x86/mm/64: define ARCH_PAGE_TABLE_SYNC_MASK and arch_sync_kernel_mappings()")
Signed-off-by: Jinliang Zheng <alexjlzheng@tencent.com>
---
 arch/arm/include/asm/page.h                 | 3 ++-
 arch/x86/include/asm/pgtable-2level_types.h | 3 ++-
 arch/x86/include/asm/pgtable-3level_types.h | 3 ++-
 include/linux/pgtable.h                     | 4 ++++
 mm/memory.c                                 | 2 +-
 mm/vmalloc.c                                | 6 +++---
 6 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/arm/include/asm/page.h b/arch/arm/include/asm/page.h
index ef11b721230e..764afc1d0aba 100644
--- a/arch/arm/include/asm/page.h
+++ b/arch/arm/include/asm/page.h
@@ -167,7 +167,8 @@ extern void copy_page(void *to, const void *from);
 #else
 #include <asm/pgtable-2level-types.h>
 #ifdef CONFIG_VMAP_STACK
-#define ARCH_PAGE_TABLE_SYNC_MASK	PGTBL_PMD_MODIFIED
+#define ARCH_PAGE_TABLE_SYNC_MASK		PGTBL_PMD_MODIFIED
+#define ARCH_PAGE_TABLE_SYNC_MASK_VMALLOC	ARCH_PAGE_TABLE_SYNC_MASK
 #endif
 #endif
 
diff --git a/arch/x86/include/asm/pgtable-2level_types.h b/arch/x86/include/asm/pgtable-2level_types.h
index 54690bd4ddbe..650b12c25c0c 100644
--- a/arch/x86/include/asm/pgtable-2level_types.h
+++ b/arch/x86/include/asm/pgtable-2level_types.h
@@ -18,7 +18,8 @@ typedef union {
 } pte_t;
 #endif	/* !__ASSEMBLER__ */
 
-#define ARCH_PAGE_TABLE_SYNC_MASK	PGTBL_PMD_MODIFIED
+#define ARCH_PAGE_TABLE_SYNC_MASK		PGTBL_PMD_MODIFIED
+#define ARCH_PAGE_TABLE_SYNC_MASK_VMALLOC	ARCH_PAGE_TABLE_SYNC_MASK
 
 /*
  * Traditional i386 two-level paging structure:
diff --git a/arch/x86/include/asm/pgtable-3level_types.h b/arch/x86/include/asm/pgtable-3level_types.h
index 580b09bf6a45..272d946a3c7d 100644
--- a/arch/x86/include/asm/pgtable-3level_types.h
+++ b/arch/x86/include/asm/pgtable-3level_types.h
@@ -27,7 +27,8 @@ typedef union {
 } pmd_t;
 #endif	/* !__ASSEMBLER__ */
 
-#define ARCH_PAGE_TABLE_SYNC_MASK	PGTBL_PMD_MODIFIED
+#define ARCH_PAGE_TABLE_SYNC_MASK		PGTBL_PMD_MODIFIED
+#define ARCH_PAGE_TABLE_SYNC_MASK_VMALLOC	ARCH_PAGE_TABLE_SYNC_MASK
 
 /*
  * PGDIR_SHIFT determines what a top-level page table entry can map
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 2b80fd456c8b..53b97c5773ba 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1476,6 +1476,10 @@ static inline void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned
 #define ARCH_PAGE_TABLE_SYNC_MASK 0
 #endif
 
+#ifndef ARCH_PAGE_TABLE_SYNC_MASK_VMALLOC
+#define ARCH_PAGE_TABLE_SYNC_MASK_VMALLOC 0
+#endif
+
 /*
  * There is no default implementation for arch_sync_kernel_mappings(). It is
  * relied upon the compiler to optimize calls out if ARCH_PAGE_TABLE_SYNC_MASK
diff --git a/mm/memory.c b/mm/memory.c
index 0ba4f6b71847..cd2488043f8f 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3170,7 +3170,7 @@ static int __apply_to_page_range(struct mm_struct *mm, unsigned long addr,
 			break;
 	} while (pgd++, addr = next, addr != end);
 
-	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
+	if (mask & ARCH_PAGE_TABLE_SYNC_MASK_VMALLOC)
 		arch_sync_kernel_mappings(start, start + size);
 
 	return err;
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 5edd536ba9d2..2fe2480de5dc 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -311,7 +311,7 @@ static int vmap_range_noflush(unsigned long addr, unsigned long end,
 			break;
 	} while (pgd++, phys_addr += (next - addr), addr = next, addr != end);
 
-	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
+	if (mask & ARCH_PAGE_TABLE_SYNC_MASK_VMALLOC)
 		arch_sync_kernel_mappings(start, end);
 
 	return err;
@@ -484,7 +484,7 @@ void __vunmap_range_noflush(unsigned long start, unsigned long end)
 		vunmap_p4d_range(pgd, addr, next, &mask);
 	} while (pgd++, addr = next, addr != end);
 
-	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
+	if (mask & ARCH_PAGE_TABLE_SYNC_MASK_VMALLOC)
 		arch_sync_kernel_mappings(start, end);
 }
 
@@ -629,7 +629,7 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
 			break;
 	} while (pgd++, addr = next, addr != end);
 
-	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
+	if (mask & ARCH_PAGE_TABLE_SYNC_MASK_VMALLOC)
 		arch_sync_kernel_mappings(start, end);
 
 	return err;
-- 
2.49.0


