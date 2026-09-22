Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2B0C98307
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 17:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6uBN0ZQwvtsGp1jKgpj+hxjeJ464MZfPKqor1IPMdG4=; b=pA0UKspVHxNMRVRIL7c+ru9eR6
	pw5AVSyPuu3Uf/u436WW7IZuvkgk4xR5ivEI+RSr5gScQkB9DoPm/Oqyy/K7rSb71PjC8O9Wumzmc
	ORUf7VsBljpKTAud1Nnbz2UhSrKlSwuC2yAy/RgWrWfw7M/TEs/cAsi0JtFlZ6KaA99pr8hB0nj1k
	Ur3ysD8N5aMKMNns9nUKR6DVKK1GoTKby1KGnQg7unBVK4bLjHPRhLN5iGmYJjG9+Z/5U0EhuGF7r
	qBXExaPr6DNqajHB0C3EUrvOdZ73F4omGWyss6LgFeDflTpONa4EZ+fB1zqzqpvsiZMReAaBP5Crj
	OKkGQDyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94Mt-00000006DBE-2EmQ;
	Tue, 22 Sep 2026 17:33:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94Mc-00000006Czf-0bp4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 17:33:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4C601595;
	Tue, 22 Sep 2026 10:33:01 -0700 (PDT)
Received: from [127.0.1.1] (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD49E3F86C;
	Tue, 22 Sep 2026 10:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790098385; bh=shLHKCHn3ZdXre7hsjCS5Jwr6cqRreukZfraeH8Cy3s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SgM0Qx+n9SIyEwK6aMAq6Ppwz1dhcVVmU+Lr/ToZEX+hmzKievt4rrjFlrNonyWHj
	 Kx0OuVjhvw7BEYioGKvMfa7FL7lAcKc8dmLMmbyM40JqkH/qOYzITwD4t/d5FVCOgL
	 ym3nNFw6xAU08NSMAjwa2v6IMkLgy4NQLbeBKLcY=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Date: Tue, 22 Sep 2026 18:31:59 +0100
Subject: [PATCH v2 4/6] arm64: use hw_pte_t for fixmap HW PTEs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-pte0_arm-v2-4-a3f1ddff0a8a@arm.com>
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
X-CRM114-CacheID: sfid-20260922_103306_238375_36A7DB08 
X-CRM114-Status: GOOD (  11.74  )
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

fixmap_pte() returns a pointer into bm_pte, and early_fixmap_init_pte()
installs those arrays as page tables. Their elements are therefore
HW PTEs.

Change the element type of bm_pte to hw_pte_t so it matches the HW PTE
pointers returned and passed to the accessors. This is needed before
ARCH_HAS_HW_PTE_T makes HW PTEs and SW PTE values distinct types; the
array dimensions and placement are unchanged.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
 arch/arm64/mm/fixmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index 237a9136bc73b..709a97fe327d8 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -31,7 +31,7 @@ static_assert(NR_BM_PMD_TABLES == 1);
 
 #define BM_PTE_TABLE_IDX(addr)	__BM_TABLE_IDX(addr, PMD_SHIFT)
 
-static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __bss_pgtbl;
+static hw_pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __bss_pgtbl;
 static pmd_t bm_pmd[PTRS_PER_PMD] __bss_pgtbl __maybe_unused;
 static pud_t bm_pud[PTRS_PER_PUD] __bss_pgtbl __maybe_unused;
 

-- 
2.47.3


