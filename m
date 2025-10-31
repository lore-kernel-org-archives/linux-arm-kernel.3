Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693F3CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 07:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6b1RG7pJvE8cHJJeuor/E0/cP3dnOOeeJPuH+hFvpqk=; b=IR4JcyPhYrELeuto47WBj5gWwG
	A+JX54Hp9Bp/vA00Df6Lp6fWgtV2G240ZgoX3kYv3v7FZCrpB0MZx52jV0E5jVNPd5h4MoVv+LNGv
	n56csrKE44sJQRUfPRRWQ5lW/gTjcGQzeCPYvyHeMXStagFD1ALjmSlh+PZLG2lZaYuwfbm9IQp6b
	2+/Ht9b7aAa3j781Razxit3EDuF1UPy17qMmqGSpPqB6BZ2j+eYclXu5kIy9JqMhm2t/jMJ3nMDCx
	GnD1WpU1ZK/HKqjAkxw9Jd3peHwcFQdu8Gp5jtnKlLOts+1iNxfRDtKyiRsbsZTF/CfKVtczm7PSU
	8qTwYdpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEjJt-00000005W1n-12Yy;
	Fri, 31 Oct 2025 07:13:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEjJq-00000005W1F-0Hg6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 07:13:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C4E81595;
	Fri, 31 Oct 2025 00:12:53 -0700 (PDT)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 54DC73F63F;
	Fri, 31 Oct 2025 00:13:00 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/mm: Ensure PGD_SIZE is aligned to 64 bytes when PA_BITS = 52
Date: Fri, 31 Oct 2025 07:12:55 +0000
Message-Id: <20251031071255.3335501-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_001306_162099_669B4DB4 
X-CRM114-Status: UNSURE (   9.23  )
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

Although the comment clearly states about PGD table's alignment requirement
(when PA_BITS = 52) but the subsequent BUILD_BUG_ON() tests size comparison
to 64 bytes instead. So change it as an actual alignment test.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/mm/pgd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/mm/pgd.c b/arch/arm64/mm/pgd.c
index 8160cff35089..bf5110b91e2f 100644
--- a/arch/arm64/mm/pgd.c
+++ b/arch/arm64/mm/pgd.c
@@ -56,7 +56,7 @@ void __init pgtable_cache_init(void)
 	 * With 52-bit physical addresses, the architecture requires the
 	 * top-level table to be aligned to at least 64 bytes.
 	 */
-	BUILD_BUG_ON(PGD_SIZE < 64);
+	BUILD_BUG_ON(!IS_ALIGNED(PGD_SIZE, 64));
 #endif
 
 	/*
-- 
2.30.2


