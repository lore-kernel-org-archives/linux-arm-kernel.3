Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD56C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 14:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=teG0SSnPPX1SxgkqY6ZO3Cr5eNx/iaSrC2+Lh9W0La0=; b=bLW92jS6PSgPMqdN7qWO6q9uis
	by+LqeCrI6XHB2FX/cC2mMADcBryM5ZISxZv7QPuFxSGW6Bpxk3Ny0APBogsM/cLDZ1W6E3mVrKw7
	yitSdJrIH1+F4k25T2xgeHwqrKuWVtgAeLLWVYERllMQ1UuHolOblUBbHqNdW6JOdViD0juuK7jx3
	nje5BgDzZeWlnYxb98+uUrt+yIU1OIPuMjdiKzVySyadMru9yjDMauaqcIq3PPsmSK7IVK3Uyihem
	HlL0fQ0lDAjRvguEPirDrGbQkO5m9qq7sQgbHdMblP1JaRz5Xswm5EeEcgYBM4zshHipqb8+KCE+A
	JhNU/iaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWr9-00000007SNK-1NNa;
	Tue, 17 Jun 2025 14:00:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWVW-00000007Nyo-11w2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 13:37:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7664A1595;
	Tue, 17 Jun 2025 06:37:23 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BD3B83F673;
	Tue, 17 Jun 2025 06:37:42 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	kvmarm@lists.linux.dev,
	mark.rutland@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	stable@vger.kernel.org,
	tabba@google.com,
	will@kernel.org
Subject: [PATCH 6/7] KVM: arm64: Remove cpacr_clear_set()
Date: Tue, 17 Jun 2025 14:37:17 +0100
Message-Id: <20250617133718.4014181-7-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250617133718.4014181-1-mark.rutland@arm.com>
References: <20250617133718.4014181-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_063746_324492_8F25AA58 
X-CRM114-Status: UNSURE (   7.25  )
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

We no longer use cpacr_clear_set().

Remove cpacr_clear_set() and its helper functions.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/kvm_emulate.h | 62 ----------------------------
 1 file changed, 62 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index bd020fc28aa9c..0720898f563e9 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -561,68 +561,6 @@ static __always_inline void kvm_incr_pc(struct kvm_vcpu *vcpu)
 		vcpu_set_flag((v), e);					\
 	} while (0)
 
-#define __build_check_all_or_none(r, bits)				\
-	BUILD_BUG_ON(((r) & (bits)) && ((r) & (bits)) != (bits))
-
-#define __cpacr_to_cptr_clr(clr, set)					\
-	({								\
-		u64 cptr = 0;						\
-									\
-		if ((set) & CPACR_EL1_FPEN)				\
-			cptr |= CPTR_EL2_TFP;				\
-		if ((set) & CPACR_EL1_ZEN)				\
-			cptr |= CPTR_EL2_TZ;				\
-		if ((set) & CPACR_EL1_SMEN)				\
-			cptr |= CPTR_EL2_TSM;				\
-		if ((clr) & CPACR_EL1_TTA)				\
-			cptr |= CPTR_EL2_TTA;				\
-		if ((clr) & CPTR_EL2_TAM)				\
-			cptr |= CPTR_EL2_TAM;				\
-		if ((clr) & CPTR_EL2_TCPAC)				\
-			cptr |= CPTR_EL2_TCPAC;				\
-									\
-		cptr;							\
-	})
-
-#define __cpacr_to_cptr_set(clr, set)					\
-	({								\
-		u64 cptr = 0;						\
-									\
-		if ((clr) & CPACR_EL1_FPEN)				\
-			cptr |= CPTR_EL2_TFP;				\
-		if ((clr) & CPACR_EL1_ZEN)				\
-			cptr |= CPTR_EL2_TZ;				\
-		if ((clr) & CPACR_EL1_SMEN)				\
-			cptr |= CPTR_EL2_TSM;				\
-		if ((set) & CPACR_EL1_TTA)				\
-			cptr |= CPTR_EL2_TTA;				\
-		if ((set) & CPTR_EL2_TAM)				\
-			cptr |= CPTR_EL2_TAM;				\
-		if ((set) & CPTR_EL2_TCPAC)				\
-			cptr |= CPTR_EL2_TCPAC;				\
-									\
-		cptr;							\
-	})
-
-#define cpacr_clear_set(clr, set)					\
-	do {								\
-		BUILD_BUG_ON((set) & CPTR_VHE_EL2_RES0);		\
-		BUILD_BUG_ON((clr) & CPACR_EL1_E0POE);			\
-		__build_check_all_or_none((clr), CPACR_EL1_FPEN);	\
-		__build_check_all_or_none((set), CPACR_EL1_FPEN);	\
-		__build_check_all_or_none((clr), CPACR_EL1_ZEN);	\
-		__build_check_all_or_none((set), CPACR_EL1_ZEN);	\
-		__build_check_all_or_none((clr), CPACR_EL1_SMEN);	\
-		__build_check_all_or_none((set), CPACR_EL1_SMEN);	\
-									\
-		if (has_vhe() || has_hvhe())				\
-			sysreg_clear_set(cpacr_el1, clr, set);		\
-		else							\
-			sysreg_clear_set(cptr_el2,			\
-					 __cpacr_to_cptr_clr(clr, set),	\
-					 __cpacr_to_cptr_set(clr, set));\
-	} while (0)
-
 /*
  * Returns a 'sanitised' view of CPTR_EL2, translating from nVHE to the VHE
  * format if E2H isn't set.
-- 
2.30.2


