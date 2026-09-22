Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22536C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 17:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OX3hsGsxEHoq3RKQiW6IXghSMDrWvO/i3oFhfjDRgB4=; b=iy41/TSqPPmZlwBf1R01W8kvuM
	wjbfEfZ9kdF8uUjhNny22c9Q9cEDlvuaQuaktZ5TJCAdpsoYzBKufBSaledFcdwHUAOcFK/yNE/b9
	YsgN5vy1mFFpmsjehrZt0fG29pljHo0nK1x0isTL8JMKtqp+eKK01d/dGHk20HiyjAqoI5dWr2AtW
	1BJd0DiEhe1iQnjT9f3Lxw8079/G+fcyzc6sg/dkimFFFlF/w4NbKuv0UTzPZxAKULpRxYBroKLQQ
	Rug3hJZwuAyMb07y1jobX2yDLct3N4IhT5cZOIovC+NL0cH5o5AGn+auJ3M5AffRQVPB0/Rn0QB+T
	wDbb3nUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94Mb-00000006Cyr-1E8c;
	Tue, 22 Sep 2026 17:33:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94MY-00000006Cwv-0Pun
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 17:33:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F2AC1AED;
	Tue, 22 Sep 2026 10:32:58 -0700 (PDT)
Received: from [127.0.1.1] (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 269643F86C;
	Tue, 22 Sep 2026 10:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790098381; bh=67NvP4PmpCnowWkBeuojZg3SSMqBMwtXDXBIbaFjYiY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DgfsXpYXf+AULhg9SSync9g0KRdJYDwFtPkkElJ/a+wWRq0XRp4XhA/+AQcIjVicE
	 yO9uEDNDRHS6qYUxgDmH4JNy09PlmpfEqfv0MLS+ymlFYbWBDTSK3ieWYmPBLASNUU
	 5DDokOnKTfjJP4/bugtIcH+JIC+awj5G0TJ4BSC4=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Date: Tue, 22 Sep 2026 18:31:58 +0100
Subject: [PATCH v2 3/6] arm64: use hw_pte_val for HW PTE loads and stores
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-pte0_arm-v2-3-a3f1ddff0a8a@arm.com>
References: <20260922-pte0_arm-v2-0-a3f1ddff0a8a@arm.com>
In-Reply-To: <20260922-pte0_arm-v2-0-a3f1ddff0a8a@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
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
X-CRM114-CacheID: sfid-20260922_103302_192611_66A91D90 
X-CRM114-Status: GOOD (  12.76  )
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

__ptep_get() returns a SW PTE value, while __set_pte_nosync() accepts
one. When HW PTE storage uses a distinct hw_pte_t, reading or writing
*ptep as a pte_t no longer satisfies those interfaces.

Use hw_pte_val() to expose the pteval_t stored in either the hw_pte_t
wrapper or its pte_t alias. __set_pte_nosync() writes pte_val(pte) to
that storage, while __ptep_get() reads it and reconstructs a pte_t with
__pte().

This avoids imposing a generic conversion interface between HW and SW
PTE representations, which may require architecture-specific context
in the future.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 4768ec59de555..ce6580ab63128 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -360,7 +360,7 @@ static inline pte_t pte_clear_uffd(pte_t pte)
 
 static inline void __set_pte_nosync(hw_pte_t *ptep, pte_t pte)
 {
-	WRITE_ONCE(*ptep, pte);
+	WRITE_ONCE(hw_pte_val(*ptep), pte_val(pte));
 }
 
 static inline void __set_pte_complete(pte_t pte)
@@ -381,7 +381,7 @@ static inline void __set_pte(hw_pte_t *ptep, pte_t pte)
 
 static inline pte_t __ptep_get(hw_pte_t *ptep)
 {
-	return READ_ONCE(*ptep);
+	return __pte(READ_ONCE(hw_pte_val(*ptep)));
 }
 
 extern void __sync_icache_dcache(pte_t pteval);

-- 
2.47.3


