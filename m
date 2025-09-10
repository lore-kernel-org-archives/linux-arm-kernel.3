Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7399ACA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 09:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3vn6PSgl/mr0sMmi9/Ua5wGgFfCymeEDaAVR/5gAnlM=; b=3WHvEzAAvfK4UBSFSSG/SsuaLS
	/Y6EkwrqK1QtTQpRhsPrwarymNGXhz0IAuYhz9OM8o+FFxFSwpKbyQ/KzOPWv4A4ehgBKSp0mVsNR
	k++eHNztqlTv0lJzu+eVaYvMRrKlT42DKJZij+2PdWx7lQmj1vEpfzrefbUhsE/s1jfl+KUUpcspF
	prNXpUpaUwTwkvnDWryxEd57nZ16zzHhn83Wsm9yXOcBV3W071dNACenO8WixXRp00QXhi+9uur8O
	5SevrYZ1Pntx1ONIuUHJur0Vads5Y4Kfi3VAGIQIf31G87TWH+BcOm4eCxQBZX/7NRPfa/y/zhxud
	GRsqlT8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHQm-0000000DKfi-1gtz;
	Wed, 10 Sep 2025 09:48:00 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHQj-0000000DKdB-3cHc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 09:47:59 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-55f6f7edf45so6182407e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 02:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757497675; x=1758102475; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3vn6PSgl/mr0sMmi9/Ua5wGgFfCymeEDaAVR/5gAnlM=;
        b=rfaYCawVTd9pepFUtWLERVT7T+wjIRqiK2LLPk1gpkKFoTGr2WgufnoGkmsHpqajFe
         JmzmSphrwFvWuXDy6A0RpKM/P3OkTdMAqz5E4fFp5n82xMnCkowA3k7O1VjVqQtenN/M
         qcNfsOb83SVxlj5FY6yRWiVMEQAOgN73yYAA2D/MU580QN1JFtST/ALW4gqDS4h1DoU1
         ObWRmnRfqJkc7eWTErvVh48BYsNTv2zsTkucLS+m+GHjkYBStNVfzZcIthWiWqh2hcKe
         Bh3CKhBRNVYZcWJ/mggybiuWlwCrOPprnzGsivkNnJg7htMmpxSxogjwhumleBdf3hoY
         pOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757497675; x=1758102475;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3vn6PSgl/mr0sMmi9/Ua5wGgFfCymeEDaAVR/5gAnlM=;
        b=lZ95jHX9UsQ0mzwsEFuP440BNPQLrA5fTlUdEx2GQvlPtNj3ZFw4JtwYnNxDvAnf29
         vYHSEJBY2m9qnPPjQkQX92oD6MaRMs0FMWcJdD3qiwmRXNt/iczjvT8E+/IYFMU6DLpw
         6A6HUmlyZLXzZm33yQswAa7digOXNXA9nTIAGHOtSSAv93OCJPtONNGKWPq9vfLMNVB9
         tb7A3XkFWDTzT7sR5aT06zf1Fvo4jtaSUjRcWENYqzEWLRrD5D8ydeXi9dNcKkcplo0f
         wibJC6fgMG7IlQdJA5eaSscepxdrzQ0Zfit7sY+ryrCoPUeplGf2MH9vPAeIf1H3gx1m
         4c6Q==
X-Gm-Message-State: AOJu0Yx6MqoTYuhbSuIyXpIm8DK2AcMXj9lBY1LSVICI/RA6MgZzUYwr
	oPQwWB9JP+y5ZHhmklb4oanJa8MDmZmrnNHju6A05UhUb5uU2sdm/4l8Kx0hXVuQDCU=
X-Gm-Gg: ASbGncsLm57dEIE7hWtTP89vU5/XrDFrqUerSIfhOqjFJ1qzbThSMvUsPxYGtJ8c1WX
	sQfwkRzM0MhA/wEnemHgEE8DP7K7ej6L7BYhGYd3Uc1rDkQmqN6109zypuNDuiz2vwGDyaRsNp2
	C8u6zYZlkKohbyKIAmXhRUcck1tv68gUWNCjFRgstAYpgeoUi7PNlzmut7gvx8AbKTkL+POKwmz
	ou/1hIhEbCoLPnQ2uq1zLQE+prExEm6eoKiZfkTWiPhgxpGYlfWUoUipu7t1KnQl2fzFJPo/wcn
	nF/w/nYUPAH7o17jyU0IocMO+oO5sGKI8cI7YS+ETOslf04v7bv8RcyrtX9CG3HtckqrRZKxVj0
	CISdsHNkahV0yqGKZaYWLXPhm56Rl5GDc
X-Google-Smtp-Source: AGHT+IFtsFoIkWeV0W6TKqeUon3LMVDpZHDcWlfb3zT8ScMuOJij+KRvziNm4yRPVu1pxeCaBRtljQ==
X-Received: by 2002:a05:6512:3d07:b0:55f:4bf6:efed with SMTP id 2adb3069b0e04-562603a10famr4438159e87.1.1757497675329;
        Wed, 10 Sep 2025 02:47:55 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5680c424fa5sm1139655e87.25.2025.09.10.02.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 02:47:55 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Sep 2025 11:47:52 +0200
Subject: [PATCH] RFC: ARM: drop support for HIGHPTE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-arm-remove-high-pte-v1-1-d0899882815f@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEdJwWgC/x3MOwqAMBBF0a3I1A5ExYBuRSyiPpMp/DAREYJ7N
 1ie4t5EESqI1BeJFLdEOfaMqixoDm73YFmyqTZ1a7rKsNONFdtxg4P4wOcFtnBLN1tMTWMpl6d
 ilee/DuP7fg5UmHtlAAAA
X-Change-ID: 20250910-arm-remove-high-pte-6ead9c6eb336
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Russell King <rmk+kernel@armlinux.org.uk>, 
 Matthew Wilcox <willy@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_024757_931989_4D66AD46 
X-CRM114-Status: GOOD (  16.56  )
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

Matthew Wilcox suggests HIGHPTE is a burden for the
kernel MM, and only one ARM system (vt8500) is currently
using it.

This deletes the use of HIGHPTE in ARM32 clearing the way
to remove the feature altogether.

It was introduced in commit 65cec8e3db60 "ARM: implement highpte"
in 2009, so this RFC is intended as a discussion item to
check if it is still a desired feature 16 years later
or if we can get rid of it.

To: Russell King <rmk+kernel@armlinux.org.uk>
To: Matthew Wilcox <willy@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/linux-arm-kernel/aMDYdp3H-yOHU1Pm@casper.infradead.org/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/Kconfig                        | 11 -----------
 arch/arm/configs/vt8500_v6_v7_defconfig |  1 -
 arch/arm/include/asm/pgalloc.h          |  8 +-------
 3 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index b1f3df39ed4068f215a3460d5c4e021136438eaa..5545583946a2433f86a5ba2d6ade34f5e931ae74 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1229,17 +1229,6 @@ config HIGHMEM
 
 	  If unsure, say n.
 
-config HIGHPTE
-	bool "Allocate 2nd-level pagetables from highmem" if EXPERT
-	depends on HIGHMEM
-	default y
-	help
-	  The VM uses one page of physical memory for each page table.
-	  For systems with a lot of processes, this can use a lot of
-	  precious low memory, eventually leading to low memory being
-	  consumed by page tables.  Setting this option will allow
-	  user-space 2nd level page tables to reside in high memory.
-
 config ARM_PAN
 	bool "Enable privileged no-access"
 	depends on MMU
diff --git a/arch/arm/configs/vt8500_v6_v7_defconfig b/arch/arm/configs/vt8500_v6_v7_defconfig
index 41607a84abc85adfc9d8d2d520354576e1e274d2..a91e6547378136b3e1264aaddcac7d6ddb66987d 100644
--- a/arch/arm/configs/vt8500_v6_v7_defconfig
+++ b/arch/arm/configs/vt8500_v6_v7_defconfig
@@ -10,7 +10,6 @@ CONFIG_ARM_ERRATA_775420=y
 CONFIG_HAVE_ARM_ARCH_TIMER=y
 CONFIG_AEABI=y
 CONFIG_HIGHMEM=y
-CONFIG_HIGHPTE=y
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
 CONFIG_VFP=y
diff --git a/arch/arm/include/asm/pgalloc.h b/arch/arm/include/asm/pgalloc.h
index a17f01235c29c0dc619c0929aa761df861a5dd2d..ef6cb3e6d179e63c7edbcaf69e6b21847b354a0f 100644
--- a/arch/arm/include/asm/pgalloc.h
+++ b/arch/arm/include/asm/pgalloc.h
@@ -85,18 +85,12 @@ pte_alloc_one_kernel(struct mm_struct *mm)
 	return pte;
 }
 
-#ifdef CONFIG_HIGHPTE
-#define PGTABLE_HIGHMEM __GFP_HIGHMEM
-#else
-#define PGTABLE_HIGHMEM 0
-#endif
-
 static inline pgtable_t
 pte_alloc_one(struct mm_struct *mm)
 {
 	struct page *pte;
 
-	pte = __pte_alloc_one(mm, GFP_PGTABLE_USER | PGTABLE_HIGHMEM);
+	pte = __pte_alloc_one(mm, GFP_PGTABLE_USER);
 	if (!pte)
 		return NULL;
 	if (!PageHighMem(pte))

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250910-arm-remove-high-pte-6ead9c6eb336

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


