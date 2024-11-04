Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C4CD111A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 04:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UntElZfhDKdSjo1GzVLAC4HW5YRATJdwzXoebXhyGOE=; b=FuTATT4cd6ADX+NMJcsZvxizn2
	TjoZNhfnn8M+c0HgO3yMrxEamKLFWpzo47/q1VAWhM8vEye28C/ZRiGv+65ik+DIQmF7gtC8wfsNj
	6ljGgPpOuEm+EewB1n7vKY/lKg8254ypCqinHX6W9INkUCsELId51Yh5+2kZyUS0O92CIYB4XgXGr
	WXQANTjYn8ncPhiDcf4VhegFINgi1eCP77TtPSyV2kXrauKGGE2TApLVEBD5gx0bawphF3eyqyrrR
	sHKsiDnbPrNgLRsYj3YEg3aCY5pgECPJhwmdIortkR6/i/SGKllRjCLhAVztdJiEGQRAngWJX7n7Y
	uxZP82fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7oXe-0000000CccZ-1SxT;
	Mon, 04 Nov 2024 04:18:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7oVx-0000000CcWI-10Yp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 04:16:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FD4CFEC;
	Sun,  3 Nov 2024 20:16:55 -0800 (PST)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.16.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2F78F3F6A8;
	Sun,  3 Nov 2024 20:16:22 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/mm: Drop setting PTE_TYPE_PAGE in pte_mkcont()
Date: Mon,  4 Nov 2024 09:46:17 +0530
Message-Id: <20241104041617.3804617-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_201629_342787_0D49ABD8 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
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

PTE_TYPE_PAGE bits were being set in pte_mkcont() because PTE_TABLE_BIT was
being cleared in pte_mkhuge(). But after arch_make_huge_pte() modification,
which dropped pte_mkhuge() completely, setting back PTE_TYPE_PAGE bits are
no longer necessary. Hence this changes pte_mkcont() to just set PTE_CONT.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This applies on v6.12-rc6 after applying the earlier arch_make_huge_pte()
re-organization patch.

https://lore.kernel.org/all/20241029044529.2624785-1-anshuman.khandual@arm.com/
 
 arch/arm64/include/asm/pgtable.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index fa4c32a9f572..17f7fb05e79e 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -265,8 +265,7 @@ static inline pte_t pte_mkspecial(pte_t pte)
 
 static inline pte_t pte_mkcont(pte_t pte)
 {
-	pte = set_pte_bit(pte, __pgprot(PTE_CONT));
-	return set_pte_bit(pte, __pgprot(PTE_TYPE_PAGE));
+	return set_pte_bit(pte, __pgprot(PTE_CONT));
 }
 
 static inline pte_t pte_mknoncont(pte_t pte)
-- 
2.30.2


