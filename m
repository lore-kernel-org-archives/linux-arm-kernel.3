Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B01EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 02:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W037QFwQwDkWHcZvi+vCGXAo+VgbLsKXkRwr/v8EjsU=; b=ZyTDe1KOGZfmvEHOuHDVa67yj0
	69JGfwr99unmL6wxsptPSwpPhe49cvXMrKfjHh6vHGXgq88dN2fdje/llGveEEe48kpuzYYf+OXlb
	XFvYUzJdkfIZVW7Cz50dyyVFciRr0i9gtRw2TLizH7d+WV4t/EKvsk0BQGSnmK3BSFBEGCbgWQM48
	TMqF6Zzul46v5MOruDoZlCM0RC7vSMqoJbzbL1tJTbyg1kFxLVhjTnvWaRTPe2XjKb2WM9oFRgosM
	O2mt4aC5GEuDcUmdK3o4ku7DIHdu2o+xDNeAxEdC6ZTKlFAOBqeqPqO20yvCP7ndy4lJ5TSVJJ38o
	PJn6gcSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUzNi-00000003DI5-0TMx;
	Tue, 07 Jan 2025 02:31:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUzMU-00000003DDV-2JmG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 02:30:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6AEF8143D;
	Mon,  6 Jan 2025 18:30:57 -0800 (PST)
Received: from a077893.arm.com (unknown [10.163.54.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A50D73F66E;
	Mon,  6 Jan 2025 18:30:26 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/mm: Rename pte_mkpresent() as pte_mkvalid()
Date: Tue,  7 Jan 2025 08:00:16 +0530
Message-Id: <20250107023016.829416-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_183030_640705_E1C3AFF4 
X-CRM114-Status: UNSURE (   9.98  )
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

pte_present() is no longer synonymous with pte_valid() as it also tests for
pte_present_invalid() as well. Hence pte_mkpresent() is misleading, because
all that does is make an entry mapped, via setting PTE_VALID. Hence rename
the helper as pte_mkvalid() which reflects its functionality appropriately.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v6.13-rc6

 arch/arm64/include/asm/pgtable.h | 2 +-
 arch/arm64/mm/trans_pgd.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index e20b80229910..f0ba0f47f61a 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -273,7 +273,7 @@ static inline pte_t pte_mknoncont(pte_t pte)
 	return clear_pte_bit(pte, __pgprot(PTE_CONT));
 }
 
-static inline pte_t pte_mkpresent(pte_t pte)
+static inline pte_t pte_mkvalid(pte_t pte)
 {
 	return set_pte_bit(pte, __pgprot(PTE_VALID));
 }
diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
index 0f7b484cb2ff..19c67ed1a21f 100644
--- a/arch/arm64/mm/trans_pgd.c
+++ b/arch/arm64/mm/trans_pgd.c
@@ -57,7 +57,7 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
 		 */
 		BUG_ON(!pfn_valid(pte_pfn(pte)));
 
-		__set_pte(dst_ptep, pte_mkpresent(pte_mkwrite_novma(pte)));
+		__set_pte(dst_ptep, pte_mkvalid(pte_mkwrite_novma(pte)));
 	}
 }
 
-- 
2.30.2


