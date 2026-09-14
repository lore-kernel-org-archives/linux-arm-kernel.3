Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94624C88E70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvR7yrUSwk1xcghd++XGcB+fD9fDR6mY3VUkLEOBRnU=; b=MslPnPcAT4R+B9Gwrup4hNZs4U
	evwnfZ1GjMEwJJfPpbfJ75N12mg4ptzP6a10kI9FCl5jmdWw8SWJhPVAdXSPD8fI1cWfafPBMFser
	LrCpsmlnQU240ogohW3AcnGge3jvwpZWEXVqXTvtrY70U/EiQWDJezUKUFs1zitxrbn+JeYqCv0t6
	Fa+QH0oM0lBCwwlZoAe5hJPBZDTU9Ka97vAQK4ZG30n53XnDhBYhxCPpq0h/QzOlQ7qoyrQsqBHy9
	eENjIBZD6w7WNekaNHk4LXmLj9JBir5rm7SKXLBNyAfOp2BTm6i0EYpEJrNGH53LhH98NlR4vpG4R
	ht4ARIgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x676g-00000003rpv-0wWn;
	Mon, 14 Sep 2026 13:52:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x676W-00000003rio-2RZs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:52:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 544C41576;
	Mon, 14 Sep 2026 06:52:12 -0700 (PDT)
Received: from [127.0.1.1] (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B236F3F882;
	Mon, 14 Sep 2026 06:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789393935; bh=yv6552mFvvf13JAoUBxhYSH5LMmG+s9tUQsoS51fbNQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gzbKM8Ca28zZ5K6P5ERV+/fCGpEVK/cv9jlKFw2gr9//PfYHgZprGWfo191uCCc6z
	 Cf7m0v8/apWMpqmmgMHBA6J9VkXnoRe1GIpcuZ12FSGnPYjHDPuGZmC5Cob7BBesv6
	 pyrAeo+x1fR1GNNgGI02k3iSQRVZhxr9ZAy5zTgQ=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Date: Mon, 14 Sep 2026 14:51:33 +0100
Subject: [PATCH 3/6] arm64: convert between HW PTEs and SW PTE values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-pte0_arm-v1-3-bb53b663e396@arm.com>
References: <20260914-pte0_arm-v1-0-bb53b663e396@arm.com>
In-Reply-To: <20260914-pte0_arm-v1-0-bb53b663e396@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-efi@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
 Muhammad Usama Anjum <usama.anjum@arm.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_065216_725903_12D385A0 
X-CRM114-Status: GOOD (  12.95  )
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

__ptep_get() returns a SW PTE value, and __set_pte_nosync() accepts one.
When HW PTEs use a distinct hw_pte_t, directly reading or writing *ptep
as a SW PTE value no longer satisfies those interfaces.

Use __pte_from_hw after READ_ONCE() to obtain a SW PTE value and add
__hw_pte before WRITE_ONCE() to form an HW PTE.

Define __hw_pte for both the wrapper and alias configurations so the
same accessor code works in either case.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 4 ++--
 include/linux/pgtable_types.h    | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 4768ec59de555..67c4a6179e154 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -360,7 +360,7 @@ static inline pte_t pte_clear_uffd(pte_t pte)
 
 static inline void __set_pte_nosync(hw_pte_t *ptep, pte_t pte)
 {
-	WRITE_ONCE(*ptep, pte);
+	WRITE_ONCE(*ptep, __hw_pte(pte));
 }
 
 static inline void __set_pte_complete(pte_t pte)
@@ -381,7 +381,7 @@ static inline void __set_pte(hw_pte_t *ptep, pte_t pte)
 
 static inline pte_t __ptep_get(hw_pte_t *ptep)
 {
-	return READ_ONCE(*ptep);
+	return __pte_from_hw(READ_ONCE(*ptep));
 }
 
 extern void __sync_icache_dcache(pte_t pteval);
diff --git a/include/linux/pgtable_types.h b/include/linux/pgtable_types.h
index ee4eace5c3e1c..b5862a16aa497 100644
--- a/include/linux/pgtable_types.h
+++ b/include/linux/pgtable_types.h
@@ -9,11 +9,13 @@
 #ifdef CONFIG_ARCH_HAS_HW_PTE_T
 typedef struct __hw_pte_t { pte_t __pte; } hw_pte_t;
 #define __pte_from_hw(pte)	((pte).__pte)
+#define __hw_pte(pte)  ((hw_pte_t) { (pte) })
 
 #define hw_pte_val(x)  pte_val((x).__pte)
 #else
 #define hw_pte_t pte_t
 #define __pte_from_hw(pte)	(pte)
+#define __hw_pte(pte)  (pte)
 
 #define hw_pte_val(x)  pte_val(x)
 #endif

-- 
2.47.3


