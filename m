Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D532BC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 13:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kga7G3Y01CuQspvIaZUkRBEey32ORAMdulB8ZTspFI=; b=jj6E0ieTaiSWZRUO/EiISvxlSZ
	FNRl9/XtjIMYa0lDvVqJ8ViOMt/8WM1FO6YKcAIjJIjSKCJ5cjMClRyjdwHZdDo2WxFb/u0zfa1wz
	5Jn12KubXVyGHOYoWLsJBd3xzntDKoOEHLz/WDOgh3UHNVTPUPwNlP8mKyJrkSX32ZXBznDPxpRHE
	0GVnnW7KYYo4ffvgeIObnKSOceRtqXpDrk638qHs6F8S31xQie6N4n4OcMYd3ocfzg8S5/8ytnQ++
	67e0RpRPkXX4j5VTwFeAl/UjQWa/wyIK2P/ACRZa5qXv++1B30g+uJtFKk5tLdDpAuClS2GV24A3F
	sjHEpJ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWmk-00000007ROI-3LxO;
	Tue, 17 Jun 2025 13:55:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWVQ-00000007NwM-1Tre
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 13:37:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDE061595;
	Tue, 17 Jun 2025 06:37:18 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2001B3F673;
	Tue, 17 Jun 2025 06:37:37 -0700 (PDT)
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
Subject: [PATCH 4/7] KVM: arm64: Remove ad-hoc CPTR manipulation from fpsimd_sve_sync()
Date: Tue, 17 Jun 2025 14:37:15 +0100
Message-Id: <20250617133718.4014181-5-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250617133718.4014181-1-mark.rutland@arm.com>
References: <20250617133718.4014181-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_063740_432267_5EB30A41 
X-CRM114-Status: GOOD (  10.14  )
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

There's no need for fpsimd_sve_sync() to write to CPTR/CPACR. All
relevant traps are always disabled earlier within __kvm_vcpu_run(), when
__deactivate_cptr_traps() configures CPTR/CPACR.

With irrelevant details elided, the flow is:

handle___kvm_vcpu_run(...)
{
	flush_hyp_vcpu(...) {
		fpsimd_sve_flush(...);
	}

	__kvm_vcpu_run(...) {
		__activate_traps(...) {
			__activate_cptr_traps(...);
		}

		do {
			__guest_enter(...);
		} while (...);

		__deactivate_traps(....) {
			__deactivate_cptr_traps(...);
		}
	}

	sync_hyp_vcpu(...) {
		fpsimd_sve_sync(...);
	}
}

Remove the unnecessary write to CPTR/CPACR. An ISB is still necessary,
so a comment is added to describe this requirement.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index e9198e56e784b..3206b2c07f82a 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -69,7 +69,10 @@ static void fpsimd_sve_sync(struct kvm_vcpu *vcpu)
 	if (!guest_owns_fp_regs())
 		return;
 
-	cpacr_clear_set(0, CPACR_EL1_FPEN | CPACR_EL1_ZEN);
+	/*
+	 * Traps have been disabled by __deactivate_cptr_traps(), but there
+	 * hasn't necessarily been a context synchronization event yet.
+	 */
 	isb();
 
 	if (vcpu_has_sve(vcpu))
-- 
2.30.2


