Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A78BC83F05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 06:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=idczaAZJdouhBjxU9XtiFZ9H20b5Ae/9/zYGwYsxGlA=; b=bACtJr8PsWtj78sYF5t+vhyzdn
	gu2N0oAUbM0rgHpEo7KzFOUir2Ita52Y/4xKQkNjoQT+QumjM2uGoW/BPQOQKWV0Lw4EADrKhvuxg
	vwO4ij1IAO3LtEaML5bTvu06cRAfU+QHx1ltwGilkLpvK/jow6GLnOiGdz6EBOu2aCwHINpuRZgel
	uWdUhTNRido+O5IJyyEAUbbdNb8602lOdQkdiEh1Q189+4PdjOgDAYGihkpWRinYcX7L/ZLs8jiAP
	CCCas/ctSO+VyMpCxaafRt2v96q7QPEXt1Jm4lu9cRkVF6QfujI3YeSltqeXrJaUB4VDo70tevgEV
	K5X71YBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXa6u-0000000DRZs-42TN;
	Fri, 04 Jul 2025 06:41:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXa40-0000000DR9J-13cn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 06:38:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0CFF152B;
	Thu,  3 Jul 2025 23:38:08 -0700 (PDT)
Received: from a076716.blr.arm.com (a076716.blr.arm.com [10.164.21.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 471EA3F63F;
	Thu,  3 Jul 2025 23:38:20 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] arm64/mm: Drop wrong writes into TCR2_EL1
Date: Fri,  4 Jul 2025 12:08:12 +0530
Message-Id: <20250704063812.298914-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_233824_343048_3C2C7032 
X-CRM114-Status: GOOD (  12.03  )
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

Register X0 contains PIE_E1_ASM and should not be written into REG_TCR2_EL1
which could have an adverse impact otherwise. This has remained undetected
till now probably because current value for PIE_E1_ASM (0xcc880e0ac0800000)
clears TCR2_EL1 which again gets set subsequently with 'tcr2' after testing
for FEAT_TCR2.

Drop this unwarranted 'msr' which is a stray change from an earlier commit.
This line got re-introduced when rebasing on top of the commit 926b66e2ebc8
("arm64: setup: name 'tcr2' register").

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Fixes: 7052e808c446 ("arm64/sysreg: Get rid of the TCR2_EL1x SysregFields")
Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v6.16-rc4 and tested with and without FEAT_S1PIE
enabled.

Changes in V2:

- Added information about the rebase error in the commit message per Marc
- Updated the commit message a bit

Changes in V1:

https://lore.kernel.org/all/20250703050453.136871-1-anshuman.khandual@arm.com/

 arch/arm64/mm/proc.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 80d470aa469d..54dccfd6aa11 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -518,7 +518,6 @@ alternative_else_nop_endif
 	msr	REG_PIR_EL1, x0
 
 	orr	tcr2, tcr2, TCR2_EL1_PIE
-	msr	REG_TCR2_EL1, x0
 
 .Lskip_indirection:
 
-- 
2.25.1


