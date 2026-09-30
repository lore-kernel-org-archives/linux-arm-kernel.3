Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13992CA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 12:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rrydI9pf9cK+AJl39+/vvALQk2OmJjdV6B6P+JVL0u8=; b=pR9mq1gfjsm3GwYyz5as+GXgwn
	a2WnRQDy1pLYq/LGxNRk+CNk31jFu8hDoIVOZQC1ksD8LynjRL0Z9uojX52g3b0/P3wM+o3cwKb1D
	cmEIIB7GNWtRK5QGMJR6A/JjwkWbN1bRU8Z6g6C12FJ97XM9TXvwvSjVHeBxZY/kakDR8+VHkd8sL
	6izmyEyrZv5BhPOAMKn5jIdMDmgAN/RxHPD8d9CC6CF+3CcXihkK4iS+XeKCkn3BJ7sroHo3k1CM7
	pTwmvK27Y5JGxnLi73GqkP0bfx1JKHj3CnYzV1tAVEJcb8yKBS6QH0+c3Zaf9AUYDDRPbz5WQxSMK
	fmaXGuwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtAc-00000005yfd-2FgA;
	Wed, 30 Sep 2026 12:12:22 +0000
Received: from out-244.mta1.migadu.com ([95.215.58.244] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtAZ-00000005yeq-2Nn5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 12:12:21 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=giJ5+atcfObBREk4HV3phD5/1wpIpixiJ0GDdg7jwGk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790770337; v=1; x=1791375137;
 b=bWfF7enjh709eVOEO0twdRO5xBSdVFalHnZFTFCjH6yKkFytlel+AONjao6kqtgKdJdNrw6D
 sHBj8MyLo6+vOoGbSagTBMsOvX8zGMms5D2/BZqKfJ6Dk4aY2O0m/rd6oL5yprLzBtN7iOL8jTW
 Hq8EQ+RDdQ3hDBv0ol7Ga6Tk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e8ef16dae118072c;
	Wed, 30 Sep 2026 12:12:17 +0000
X-Mizu-Trace-ID: e8ef16dae118072c
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
Date: Wed, 30 Sep 2026 13:12:12 +0100
Message-Id: <20260930121212.3101361-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_051219_885501_D1009C1E 
X-CRM114-Status: UNSURE (   8.88  )
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

On a CPU with FGT2 and an IMPLEMENTATION DEFINED PMU (PMUVer 0b1111),
__init_el2_fgt2 sets the PMUv3p9 bits in HDFGRTR2_EL2 and HDFGWTR2_EL2,
which are RES0 there. The macro only checks that PMUVer is at least
PMUv3p9, and 0b1111 passes.

Exclude 0b1111 before the compare, as __init_el2_debug does.

Fixes: 858c7bfcb35e1 ("arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/el2_setup.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 87560d8b254e6..1da277baacf78 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -421,8 +421,9 @@
 	mov	x2, xzr
 	mrs	x1, id_aa64dfr0_el1
 	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMUVer_SHIFT, #4
-	cmp	x1, #ID_AA64DFR0_EL1_PMUVer_V3P9
-	b.lt	.Lskip_pmuv3p9_\@
+	cmp	x1, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF
+	ccmp	x1, #ID_AA64DFR0_EL1_PMUVer_V3P9, #8, ne
+	b.lt	.Lskip_pmuv3p9_\@		// Skip if < PMUv3p9 or IMP_DEF
 
 	orr	x0, x0, #HDFGRTR2_EL2_nPMICNTR_EL0
 	orr	x0, x0, #HDFGRTR2_EL2_nPMICFILTR_EL0

base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.39.5


