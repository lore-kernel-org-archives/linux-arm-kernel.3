Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D11CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 00:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IknqNTIsHKbd3rNmjw8CK8YPBxZ+fEB6aLcpbnkHyKI=; b=niOYfOIYuN2hpvNFuLtGPjOrsi
	dR1OsCi/fQOkCA1KphnAIB6WGoiJhScgc6QuOsbyyR3Em3dLWCooeFHJ4Gv99O1CLb1XsN9ekG1+C
	Yu5yeFEVf/wrAnvhFW9zrRP5pV5bWzJMG8ZHqWoQumYhv9UDKj3b+6Q5Aq0mm8FnWyJIjOkJtVUwm
	QTXsWV6GHd9dMbjItqFRb6LSekkTtwK+2bf4fi2FGHboCcBdvB2woAQbh2gP4rbWILWKzWHZvNQcH
	cUmTF86SVcrmpfnth6MXnVpC2KmhR9ZjDMiVNQqEodO6MhJlTMESDliwdgrgH98tf3nJCqccoIgRc
	/W3I8yuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v08Ka-00000006AM9-0aMC;
	Sun, 21 Sep 2025 00:53:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v08KV-00000006AJU-2ogY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 00:53:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACD0C1655;
	Sat, 20 Sep 2025 17:53:18 -0700 (PDT)
Received: from a076716.blr.arm.com (a076716.blr.arm.com [10.164.21.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8726A3F66E;
	Sat, 20 Sep 2025 17:53:23 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	will@kernel.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V5 4/4] KVM: arm64: Move inside all required TCR_XXX macros
Date: Sun, 21 Sep 2025 06:23:00 +0530
Message-Id: <20250921005300.2535994-5-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250921005300.2535994-1-anshuman.khandual@arm.com>
References: <20250921005300.2535994-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_175327_793439_278A7621 
X-CRM114-Status: UNSURE (   8.59  )
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

Move all required TCR_XXX macros into KVM header (asm/kvm_arm.h) for their
continued usage in KVM.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/kvm_arm.h       | 43 ++++++++++++++++++++++++++
 arch/arm64/include/asm/pgtable-hwdef.h | 43 --------------------------
 2 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 1da290aeedce..236e828c69cc 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -107,6 +107,49 @@
 
 #define MPAMHCR_HOST_FLAGS	0
 
+#define TCR_T0SZ_MASK		TCR_EL1_T0SZ_MASK
+#define TCR_T1SZ_MASK		TCR_EL1_T1SZ_MASK
+
+#define TCR_EPD0_MASK		TCR_EL1_EPD0_MASK
+#define TCR_EPD1_MASK		TCR_EL1_EPD1_MASK
+
+#define TCR_IRGN0_MASK		TCR_EL1_IRGN0_MASK
+#define TCR_IRGN0_WBWA		(TCR_EL1_IRGN0_WBWA << TCR_EL1_IRGN0_SHIFT)
+
+#define TCR_ORGN0_MASK		TCR_EL1_ORGN0_MASK
+#define TCR_ORGN0_WBWA		(TCR_EL1_ORGN0_WBWA << TCR_EL1_ORGN0_SHIFT)
+
+#define TCR_SH0_MASK		TCR_EL1_SH0_MASK
+#define TCR_SH0_INNER		(TCR_EL1_SH0_INNER << TCR_EL1_SH0_SHIFT)
+
+#define TCR_TG0_SHIFT		TCR_EL1_TG0_SHIFT
+#define TCR_TG0_MASK		TCR_EL1_TG0_MASK
+#define TCR_TG0_4K		(TCR_EL1_TG0_4K << TCR_EL1_TG0_SHIFT)
+#define TCR_TG0_64K		(TCR_EL1_TG0_64K << TCR_EL1_TG0_SHIFT)
+#define TCR_TG0_16K		(TCR_EL1_TG0_16K << TCR_EL1_TG0_SHIFT)
+
+#define TCR_TG1_SHIFT		TCR_EL1_TG1_SHIFT
+#define TCR_TG1_MASK		TCR_EL1_TG1_MASK
+#define TCR_TG1_16K		(TCR_EL1_TG1_16K << TCR_EL1_TG1_SHIFT)
+#define TCR_TG1_4K		(TCR_EL1_TG1_4K << TCR_EL1_TG1_SHIFT)
+#define TCR_TG1_64K		(TCR_EL1_TG1_64K << TCR_EL1_TG1_SHIFT)
+
+#define TCR_IPS_SHIFT		TCR_EL1_IPS_SHIFT
+#define TCR_IPS_MASK		TCR_EL1_IPS_MASK
+#define TCR_A1			TCR_EL1_A1
+#define TCR_ASID16		TCR_EL1_AS
+#define TCR_TBI0		TCR_EL1_TBI0
+#define TCR_TBI1		TCR_EL1_TBI1
+#define TCR_HA			TCR_EL1_HA
+#define TCR_HD			TCR_EL1_HD
+#define TCR_HPD0		TCR_EL1_HPD0
+#define TCR_HPD1		TCR_EL1_HPD1
+#define TCR_TBID0		TCR_EL1_TBID0
+#define TCR_TBID1		TCR_EL1_TBID1
+#define TCR_E0PD0		TCR_EL1_E0PD0
+#define TCR_E0PD1		TCR_EL1_E0PD1
+#define TCR_DS			TCR_EL1_DS
+
 /* TCR_EL2 Registers bits */
 #define TCR_EL2_DS		(1UL << 32)
 #define TCR_EL2_RES1		((1U << 31) | (1 << 23))
diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
index 2c0ba17ed1a3..5059abda78d8 100644
--- a/arch/arm64/include/asm/pgtable-hwdef.h
+++ b/arch/arm64/include/asm/pgtable-hwdef.h
@@ -231,49 +231,6 @@
 #define TCR_T0SZ(x)		((UL(64) - (x)) << TCR_EL1_T0SZ_SHIFT)
 #define TCR_T1SZ(x)		((UL(64) - (x)) << TCR_EL1_T1SZ_SHIFT)
 
-#define TCR_T0SZ_MASK		TCR_EL1_T0SZ_MASK
-#define TCR_T1SZ_MASK		TCR_EL1_T1SZ_MASK
-
-#define TCR_EPD0_MASK		TCR_EL1_EPD0_MASK
-#define TCR_EPD1_MASK		TCR_EL1_EPD1_MASK
-
-#define TCR_IRGN0_MASK		TCR_EL1_IRGN0_MASK
-#define TCR_IRGN0_WBWA		(TCR_EL1_IRGN0_WBWA << TCR_EL1_IRGN0_SHIFT)
-
-#define TCR_ORGN0_MASK		TCR_EL1_ORGN0_MASK
-#define TCR_ORGN0_WBWA		(TCR_EL1_ORGN0_WBWA << TCR_EL1_ORGN0_SHIFT)
-
-#define TCR_SH0_MASK		TCR_EL1_SH0_MASK
-#define TCR_SH0_INNER		(TCR_EL1_SH0_INNER << TCR_EL1_SH0_SHIFT)
-
-#define TCR_TG0_SHIFT		TCR_EL1_TG0_SHIFT
-#define TCR_TG0_MASK		TCR_EL1_TG0_MASK
-#define TCR_TG0_4K		(TCR_EL1_TG0_4K << TCR_EL1_TG0_SHIFT)
-#define TCR_TG0_64K		(TCR_EL1_TG0_64K << TCR_EL1_TG0_SHIFT)
-#define TCR_TG0_16K		(TCR_EL1_TG0_16K << TCR_EL1_TG0_SHIFT)
-
-#define TCR_TG1_SHIFT		TCR_EL1_TG1_SHIFT
-#define TCR_TG1_MASK		TCR_EL1_TG1_MASK
-#define TCR_TG1_16K		(TCR_EL1_TG1_16K << TCR_EL1_TG1_SHIFT)
-#define TCR_TG1_4K		(TCR_EL1_TG1_4K << TCR_EL1_TG1_SHIFT)
-#define TCR_TG1_64K		(TCR_EL1_TG1_64K << TCR_EL1_TG1_SHIFT)
-
-#define TCR_IPS_SHIFT		TCR_EL1_IPS_SHIFT
-#define TCR_IPS_MASK		TCR_EL1_IPS_MASK
-#define TCR_A1			TCR_EL1_A1
-#define TCR_ASID16		TCR_EL1_AS
-#define TCR_TBI0		TCR_EL1_TBI0
-#define TCR_TBI1		TCR_EL1_TBI1
-#define TCR_HA			TCR_EL1_HA
-#define TCR_HD			TCR_EL1_HD
-#define TCR_HPD0		TCR_EL1_HPD0
-#define TCR_HPD1		TCR_EL1_HPD1
-#define TCR_TBID0		TCR_EL1_TBID0
-#define TCR_TBID1		TCR_EL1_TBID1
-#define TCR_E0PD0		TCR_EL1_E0PD0
-#define TCR_E0PD1		TCR_EL1_E0PD1
-#define TCR_DS			TCR_EL1_DS
-
 /*
  * TTBR.
  */
-- 
2.25.1


