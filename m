Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B96C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 05:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I52fvXvE6iftmG7WZ/4raKFdz3yu5NBeVylZNu7Arkg=; b=nRcxgSRxqRnYnBDNQhI+uml/p+
	zzPdUL4erfC5Drg6EQV4gU7twQ3Axggl3We/cUzQh32rTQLo69e7xxRwU8F5CO7f0T0O2icuVfn7M
	9feBs1symDwqcD9FgMyCXpE72G9JveTYZpnGjGc6SG1b5gHmhtJohogWtnjFsS2rSnVRYSizO/pTD
	Tx0jbzDWA+tgGhk6AM6baT/6t/lJc7EzJBJr4lPnNPRmCRbqIfGy9PwnWwEuqQ2If0R2kRppKByo8
	3nbPm2LAdfNMenwPhZCTa/6Vr4pFA1nonT2yYjRNQPuuKdyvuWVtlnqaNfQoy83CDz1BPjACbl8km
	PP9wWetw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXCAU-0000000AFUu-3E5r;
	Thu, 03 Jul 2025 05:07:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXC88-0000000AFLP-2fIZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 05:05:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F6C81655;
	Wed,  2 Jul 2025 22:04:46 -0700 (PDT)
Received: from a076716.blr.arm.com (a076716.blr.arm.com [10.164.21.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 585FD3F6A8;
	Wed,  2 Jul 2025 22:04:58 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/mm: Drop wrong writes into TCR2_EL1
Date: Thu,  3 Jul 2025 10:34:53 +0530
Message-Id: <20250703050453.136871-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_220504_713018_5E0AA434 
X-CRM114-Status: UNSURE (   9.61  )
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

Register X0 contains PIE_E1_ASM and should not be written into REG_TCR2_EL1
which could have an adverse impact otherwise. This has remained undetected
till now probably because current value for PIE_E1_ASM (0xcc880e0ac0800000)
clears TCR2_EL1 which again gets set subsequently with 'tcr' after checking
for FEAT_TCRX.

Drop this unwarranted 'msr' which is a stray change from an earlier commit.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Fixes: 7052e808c446 ("arm64/sysreg: Get rid of the TCR2_EL1x SysregFields")
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v6.16-rc4 and tested with and without FEAT_S1PIE
enabled.

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


