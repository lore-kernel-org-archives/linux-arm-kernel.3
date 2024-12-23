Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDBBE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 10:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qA0mhWnXo6upWemI3POPEc6VJyAkyxFJggkOB6WNq2k=; b=BHmTQM2O1TaFK8XkAOqcOfUiyN
	JrmAiD4FmyPEzD6Hw68M5h0seElEoFW3N0bHtYFphE14DHMZaojChI7cTkcBymXe1Q42MRCe3fe/h
	VaMBY7fY4mNkR0JkRhAXtH6dCT60px0iOUVI/QG3VqBjFf4xTePzZDz43i8whhiAD4ziCAhb2IitC
	XnAl+qv5SU8rjlVUQsnaXXy8rGw/AKBaYwfy7bOdzTkvXBZwajmVZXeb9NY7F0cW4kYoj3o8pSHi5
	arD3yOKCABbswGNC82iRIwEqpHvMX8Se8BcMttesiwDwPL0S0aN3SIMzz0vuZaxdAGslwEHYXDpmg
	PJq87mOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPfHJ-00000009kmc-231J;
	Mon, 23 Dec 2024 10:03:09 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPezW-00000009gq6-0JgP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 09:44:47 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-72764c995e5so2420719b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 01:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947085; x=1735551885; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qA0mhWnXo6upWemI3POPEc6VJyAkyxFJggkOB6WNq2k=;
        b=FE452Oqusb0rgBr6YngBczaIZtEjQK09AFdFZIxckz6Xr+PLf+KBXxu4GjmlQdbcD5
         MnwMxLVk8A2O13eLCuT1rD6LzHnfa3icb5t2bHmQ7jaU6XeqImTR+arkQ6Gma9oZBIpZ
         PyBLtSj0xITvtIpAszE8FkLmnqBtcaLkygNZ6f3KU9X3tXXbdKxMfCmUvVAsBZ7JrcX9
         jSRBaoz8CWnotjj2fOpzzV9r+RTVSguntC/dC44O+E2ceeTEoex2Ds9n8bruAdbfo9hX
         ItgWksMMWSENZmlPmTGXxggqUFfLoOF895Sj+FSe1cHC8wR9Mv/6RhCTVy686hB/8mqg
         NV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947085; x=1735551885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qA0mhWnXo6upWemI3POPEc6VJyAkyxFJggkOB6WNq2k=;
        b=Eddi6t07Qj90yb43TJlETJYDbdat6I2iZQQTK2Z7hxCfpDcXpwREypqbngW2NYUyz8
         /kk7Ir2m+WuwigkET4Iy2MSKhulxhgMBD8P9AzIMODwfQSeEcchSe1DPAoRYPIX0wzE0
         QSznU9ttBDKwNJ3f/MYx2E/HCnhtiJS6WDUiX+J9EyHOJDeJHxrphFvZslcELmqukztf
         4JMgF4f4sPODtB9Mj5SGWNnmB23EghrUKotMKRYlYxdf8vasKRLCMzlkunnhzPvZLtv1
         xrVc00RYhgUOZ9EngHD10tNhsXHGBJvoD5w4n3/tRze5fbHAl0T0nflR3iGrkggM156E
         kL0w==
X-Forwarded-Encrypted: i=1; AJvYcCUQcm5wwq7L7v1kkFjRkYxAiIR2yBoN6/cXs3hbrkJ0ETypyOUvMIxmcsbin/iPFTEx+tAI9P5GYEY46U5SwCwV@lists.infradead.org
X-Gm-Message-State: AOJu0YzI85hkmI658j4tv5YrSVU5ht1RosaC/UneRWc8CuLCU2iAetiK
	+SlMmYauMZYo5Z8N/8PjnDBo7GMiu2ZYkwgvFnk1TJ7n5mZuJ5cgcm7Ua2Tkbkg=
X-Gm-Gg: ASbGncujxYI14rSX+72RzCiDItQ6x/lM+HpP1+tHwS8jG5+naB+JdBfNoqtaXFgRx+W
	nVuFDVvkLtoq5z6pdGujqfCyhZkLMCcX24i2kWzCLmLPhF+CZdfZZo9uaK+smDWTWAkySHTmGw+
	e7zU8q/1IOFuMPOlymufzfT1/8+gQLJJHsLHjgvJFo0k3ivbGLJ+1uZEjmpJpAfOS6zDlmGCt7S
	fFXGeUXKE0B7qMW3xde4xpIpWblxahPhPkfCSj6P3SLptX4AwW7XiVQvxcRr7i21C5zPQiUHxw3
	atOXPyIjR+Afb5QKO3vFGg==
X-Google-Smtp-Source: AGHT+IEwnxNRxjpY566VNLJW6lRIrSoOOApqv/9DKS3yUbVNE+/391+nOnqyFIwO+T3gR5XgQach6A==
X-Received: by 2002:a05:6a00:330b:b0:728:e382:5f14 with SMTP id d2e1a72fcca58-72abdd7bae3mr14443469b3a.9.1734947085429;
        Mon, 23 Dec 2024 01:44:45 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:44:45 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v3 08/17] arm: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Mon, 23 Dec 2024 17:40:54 +0800
Message-Id: <955162bfbbcd9fbb3b074e1fe2aef4f64b61d6f9.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734945104.git.zhengqi.arch@bytedance.com>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_014446_166630_D5BC294B 
X-CRM114-Status: GOOD (  11.60  )
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

Move pagetable_dtor() to __tlb_remove_table(), so that ptlock and page
table pages can be freed together (regardless of whether RCU is used).
This prevents the use-after-free problem where the ptlock is freed
immediately but the page table pages is freed later via RCU.

Page tables shouldn't have swap cache, so use pagetable_free() instead of
free_page_and_swap_cache() to free page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/include/asm/tlb.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index ef79bf1e8563f..264ab635e807a 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -26,12 +26,14 @@
 
 #else /* !CONFIG_MMU */
 
-#include <linux/swap.h>
 #include <asm/tlbflush.h>
 
 static inline void __tlb_remove_table(void *_table)
 {
-	free_page_and_swap_cache((struct page *)_table);
+	struct ptdesc *ptdesc = (struct ptdesc *)_table;
+
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 #include <asm-generic/tlb.h>
@@ -41,8 +43,6 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
-	pagetable_dtor(ptdesc);
-
 #ifndef CONFIG_ARM_LPAE
 	/*
 	 * With the classic ARM MMU, a pte page has two corresponding pmd
@@ -61,7 +61,6 @@ __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp, unsigned long addr)
 #ifdef CONFIG_ARM_LPAE
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 #endif
 }
-- 
2.20.1


