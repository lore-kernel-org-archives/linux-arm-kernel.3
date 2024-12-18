Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEE4E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 13:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qA0mhWnXo6upWemI3POPEc6VJyAkyxFJggkOB6WNq2k=; b=fQxfwvdfLluDs+z0GeQ5T5GdzP
	UbJoMJzuhmmZ566uA2EYlOHRmRiFGHsE/m5EXx4XBBK9PgGpsCyNx2gId0v9Ls3d+KAeyClieZ1av
	XHh+u4e7VUTC64FA0x3ns+bW1D81+bnYERJTW0sut6L5hnc0gjqZs5Dx12pDe/ncKS5hIYMFLiVgh
	ASj1IIE2wmoFHy0jCzWTVhiQLzZL+W/Ma6atW4Zx5gEwcm9BMcfWjbBAFO/EjxGKMeo/6SKqsaj0Z
	O8JdKw67idmd2XK0aQApgLaDfM6gciXoyJIfyFfs4NlGXqVYnOxUKdAfnipL5PO+EUca784XBVszB
	DwNfLaug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNtmE-0000000Gg6F-1iao;
	Wed, 18 Dec 2024 13:07:46 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNtkO-0000000GfXv-2eBV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 13:05:53 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2163b0c09afso57214305ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 05:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734527152; x=1735131952; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qA0mhWnXo6upWemI3POPEc6VJyAkyxFJggkOB6WNq2k=;
        b=M5QqjEAhefXNTprv4JTnbEwTcAApd0sUcEVldqSHy1Y0euYTt7ngdYMJCTR+oA0QPD
         UR5ryzfTHNT1uomZypYAfg53zrr0340s9dZi/5+MP4N4OA9/gHJ7JrzKAbva6N3xos8Z
         9Bq/8R2lg0TeUE3ACemB2GMvfluS4vQO6w82vEy6em2yyZ97Vk2ZxM0iJofE3ZTn1Fk0
         oU1qVbI0CE0voLu1ZgI+KIYt6aRGftwxI/SlaSUEebmolbws0drefW144yZRgCXyauFh
         OT6yxdVg+3QrBlrW+Qb8oG6V805065jAJU3ZGr8l8QJrIc/7Q8Li8HvampeHlXim1rpZ
         Czqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734527152; x=1735131952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qA0mhWnXo6upWemI3POPEc6VJyAkyxFJggkOB6WNq2k=;
        b=rAkahHjF4genzUm1MFLYyc+aBXYmRKK3rOK9fs22KGQLJyKgA3RAKVcTTCiXzpiqgn
         1nvAqMU8MQMJX88A8i38BJbyrEi40xY4aCDepCWwyHkcNS51Vjycsv7tYFb0iq8d1oQH
         csatssRnc8Exfkfnr68k0QWpZeu9NB0zKTBWO0cVK5bCy0WsWz36bZMlllAVscml5xmf
         G1qljErbjmdydmf0U5mQBq5p6WccJXROc/RQw7lrqRyf9Ak791gC1kFZVbY5LqOghWJM
         PriSSLq/eUFCSC16VIlF4wmjQ2AAeU9PQPFDEn2Wx94yStOryq2kHjLgYy+hx0+M6pAl
         mnoA==
X-Forwarded-Encrypted: i=1; AJvYcCVBxX8hriGJuOMsGDElTFN/wg81+JlvbQEPNHTqQ3bBG0OykjEXIQd+yDLw8gAG/nAXqslnpJT5Z3uXWLsvT+n+@lists.infradead.org
X-Gm-Message-State: AOJu0YzzvWZEAFjWjuk6NfkgaBdiHxfYTXJvjH4/Qm3TKCb0nqv4fPmD
	h+fd7h/6hSv/tew7n6lNA/Q5D5omP5rK6Af4vbIU82uRh5idw6wVtB52ZIx8zzM=
X-Gm-Gg: ASbGnctQDen/akihVbrKLlm7duLuOg6pR1rqyXJZnr79pNFZ2z315GCO+MOpA/wR4x6
	BbhaDJowgHB28bUFHIRTM9XtkaqleOkD8KuMgHFaNRhvHOMAcrqmiRDkup3QWBV9lGbSNFOqapP
	m/fvaBXrS7zEuugNl6vJ0hm/jH91JTMOVDOJoAdwPIr+8i/4FhcDOb6+h9aWJJUdT8x1UQMmpcA
	sGoxUKNGsehfj8ot5pphFrpCdaLO/sWNMavRHY29FKbVzdpGB5pmD9/569IMGq0aa5NSRsZvRJY
	e6GRk4DhS/CqrlXAs6qZRQ==
X-Google-Smtp-Source: AGHT+IFdeNYkaToIEDdUvkBTd8lP/0QrRZpL4HARu9WlaN/FvfyhXaaWSW9JhSu0jLr2tRkQ6EUdVw==
X-Received: by 2002:a17:902:f68d:b0:215:b058:289c with SMTP id d9443c01a7336-218d70fe050mr36430515ad.8.1734527152123;
        Wed, 18 Dec 2024 05:05:52 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.238])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1db755dsm75751825ad.42.2024.12.18.05.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 05:05:51 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
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
	vishal.moola@gmail.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 06/15] arm: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Wed, 18 Dec 2024 21:04:42 +0800
Message-Id: <dd9808c1a850a0b9974355b51182e2c98fe29c91.1734526570.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734526570.git.zhengqi.arch@bytedance.com>
References: <cover.1734526570.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_050552_666377_DF83683B 
X-CRM114-Status: GOOD (  11.61  )
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


