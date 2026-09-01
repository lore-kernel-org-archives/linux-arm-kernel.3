Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB866C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 13:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hYZ9mTkKbflVQt98jHbC/mLce8oRUM09qM0H6dktBA8=; b=HP+1M8aF61zHq57/TyKAormA2b
	Ot9wo/LIaaV8qoTOhpYcU7OFuSlfsKydgLdlXsLy31E9KOvJJBKsXZs/+n/iZBcRWIVh1w3bjcGuz
	0lTpqlI/0d3LEIGFDdFg4/LJJnW026EBorAU+Mb9+5hcnwJx6WhrO9YUg4gf/FAeX0s6fvBdF2LZ2
	6VvJJOQCJZFvFob9ZsZQZRnwhk/IUzg/IdPBbwMGHa7QvqcO0wBc12xpAVMHCGcjQ9Hys0UU/Urzt
	m3JnAiOWHiazC+Ulsgyq2Bxj8yF12N9/adKFIe0SuTSy9hKVcjn+nMi5eH2S5WXVIlRrJi+w13dJc
	X9PyhgvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ONk-0000000CCAe-3Sux;
	Tue, 01 Sep 2026 13:18:32 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ONi-0000000CCA3-2TAx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 13:18:31 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so1111413f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 06:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788268709; x=1788873509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hYZ9mTkKbflVQt98jHbC/mLce8oRUM09qM0H6dktBA8=;
        b=sLfCm8fr2xbO9TQ9FZtBFkeH1LA5byggbKN05osgqxHWljvfcsCVifFwbTgLsvjRE6
         iSegskL2ICocHLa6S/LUVoe5D7pz0QJMUFNQPr5cnm9K7IuPPfP+tkPlDlxTLo+PjdG+
         4eBh2vU1WRPabWu1s3wDNYnqVAsVYWLvPOQKY4m4ivfVw9LBY30FimA+lxmME5STuLp6
         auIz1Le/YldawlyXKESNaj360VTomKx8m3fVxIkAbOznlG6oRbuknwmNj410dcxDdek4
         7FpjeeEbQS+JsZZWKssydmywR+h0fdKn41lWu39aa9CJw3kg9fUyYMXrgHozdMtyI3X/
         seUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268709; x=1788873509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hYZ9mTkKbflVQt98jHbC/mLce8oRUM09qM0H6dktBA8=;
        b=ZdyC/jwiu1C57///MBMARp8+5pjGR3GVoYX/1cpiYCRVfqFwuBZ4Xu4M6JxWq6NuhS
         BxKlZvhznW0oIlwaQ5dnrve+bfQ7+bQI3112xjNFMRrO8lo/xGxPEXeMNLKYdG2Fqeld
         6bLmlGPJJMpdWXk4d0imp+MwcQjdBjQe3Xd6s0H8+2p2sbGAoA1qPjqiS3rDzyYzRSIf
         wQprwDDrEcMxW3K+IoIxMSo7NRGVaoZEA0vFdZEokioltbkcZD++vNJBcR5rWRN4WXJ3
         tf1HJrsyLcSSFPwwqRO75nl76la8CbGH6caLqRuIk5jT+0hHd1F5vsXrkBaSAhjxYP2a
         rZuQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1BAkg4MvTRRkMPd+2Uk8++QNG5vGjk+uY0bKDZUOa3OPQWnCWi9VN2+JP/Di6Od4eTwpbjF5NthCiVtr0A6K0@lists.infradead.org
X-Gm-Message-State: AFuF++kD88fYeWoz4DA2QqvELdhD9xxAPzyu2R2cCO7XvmrxQksRrGki
	QTxO0GkWpk3mtubF92MlzkUeKjGfQQAAN1ii9DDRtZt3WKDot5R58rII
X-Gm-Gg: AR+sD11ccOqgBP6WpKwxs/iFfUJA6eT2pbPiG7w2SECNK5wgHPs35fntqZy3DBqvLJ/
	PHofhc4rVCCv2c/kmDiZd1d/8NtZ9ujPYCB9zV1ykSdJJM2R/dkRUtGirCQxgOi3Zt8RVOVQpQk
	DiExcVY9DP+su0Z0iRe/A0/6zesSyJrz42tr9mbFWJ58duNDlM+GYCQU5s7O8tY5CXj3x9kTWoI
	p0VIfNZwUl8x1F6j1rdSP6FB2AQWScNjUHZQy5dKY+b8fMKCQNLQhESZrJ8kM3GpcsVegdtFqK0
	PrYTKfxKsnXpkSh35U3iKKq8GCBr3uyLLDa2PRvCvCJueNrU84NbPmQRpp1lUfsaRUzMQ/s2Rk2
	X7UfHWr/adLkVxrlD2uhaunqVXZ6kP49e+pkJ0PkyQav7Mm7Fdd6X8oy9Lgam1dLxYXWSItkPsK
	T6o6pw92OqRWH9+FDigX9gUt/Z7NyF2fF/6rfi4KnqPLTOixMzx70tWk8FBl+FdONryM1uHdAMO
	q1iRdXiEVrPjlSA9M0cVJYSUO4LHmtECMQq2seEoP+WCQQv1YnzhG075VtCsJbW3TK4VL65pC3w
	cEaETcM2qjcAvv2kuX4QBpNvDcZkLNhhx277jgo1J0k97cNX92BIy6tKsp8sxjxvHg2d2SeeZGh
	KzeOt4g==
X-Received: by 2002:a05:600c:4f0e:b0:49b:9433:ea44 with SMTP id 5b1f17b1804b1-49cdc40ff56mr178836565e9.4.1788268708319;
        Tue, 01 Sep 2026 06:18:28 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a16a-7801-fd8c-4b37-36b4-e53a.310.pool.telefonica.de. [2a02:3100:a16a:7801:fd8c:4b37:36b4:e53a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b926874fdsm356104405e9.4.2026.09.01.06.18.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 01 Sep 2026 06:18:27 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: hugetlb: fix BBM for mprotect() on contiguous PTEs
Date: Tue,  1 Sep 2026 15:18:23 +0200
Message-Id: <20260901131823.15799-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_061830_645252_55993D59 
X-CRM114-Status: GOOD (  16.81  )
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

huge_ptep_modify_prot_start() clears a hugetlb entry before changing its
permissions. For contiguous PTE mappings, break-before-make (BBM)
requires a TLB invalidation after clearing the set and before making any
entry valid again.

Commit fb396bb459c1 ("arm64/hugetlb: Drop TLB flush from
get_clear_flush()") removed this invalidation, relying on the deferred
flush from the core code. Commit 410982303772 ("arm64: hugetlb: Restore
TLB invalidation for BBM on contiguous ptes") restored it for
huge_ptep_set_{access_flags,wrprotect}(), since a deferred flush is too
late for the break step. The modify-prot path has the same problem.

Use huge_ptep_clear_flush() for contiguous entries so that the TLB is
invalidated during the break step. Leave huge_ptep_get_and_clear()
unchanged because it is also used by teardown paths, where the deferred
flush is sufficient.

Fixes: fb396bb459c1 ("arm64/hugetlb: Drop TLB flush from get_clear_flush()")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
An instrumented QEMU detected the missing break-step TLBI on an unpatched
kernel and none with this change. A fork() control exercising
huge_ptep_set_wrprotect() remained clean. No user-visible failure was
reproduced.

The QEMU checker was exercised with 4K and 64K base-page kernels. The
patched kernel passed the LTP hugetlb tests with both -cpu max and -cpu
cortex-a72 (16 TPASS and no failures).

Testing on Neoverse N1 hardware would be welcome, as it can use the
contiguous hint and can be configured to report TLB conflicts.

 arch/arm64/mm/hugetlbpage.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 8e799c1fe0aa..bb53a04b73b2 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -517,6 +517,11 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
 pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
 {
 	unsigned long psize = huge_page_size(hstate_vma(vma));
+	pte_t pte = __ptep_get(ptep);
+
+	/* The break step for contiguous PTEs must include the TLB flush. */
+	if (pte_cont(pte))
+		return huge_ptep_clear_flush(vma, addr, ptep);
 
 	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_2645198)) {
 		/*
@@ -524,7 +529,7 @@ pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr
 		 * when the permission changes from executable to non-executable
 		 * in cases where cpu is affected with errata #2645198.
 		 */
-		if (pte_user_exec(__ptep_get(ptep)))
+		if (pte_user_exec(pte))
 			return huge_ptep_clear_flush(vma, addr, ptep);
 	}
 	return huge_ptep_get_and_clear(vma->vm_mm, addr, ptep, psize);

base-commit: 786262be6048deab760f68c8acc2c85607165894
-- 
2.53.0

