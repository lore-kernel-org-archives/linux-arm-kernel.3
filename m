Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D212CEFCE4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 17:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9v2zSVNhGh0879lcjq26W3+3WXrFPqbhfXum8a+f64=; b=lFB9dxEiN6lpZ0w8eJH9e8tC6A
	r5vgWJpc4uIwCHeTHxY4Y6JVxXKDgW74MeU+Pfh/3AvFrTBWQgDEpIlc+dIvRcUbLpa42XA4vID68
	MCv6qa7212AfNe017eZsEkctFG+5+f4uQ6Nw+ax0irzVgV6xshajNUdi+0JcoVq4Bwusu2raPSPOs
	tQsji4wSW8V0N+2m4hijGDb0ut7+cdK5VjmqddYoDt5cJYn71iIkexFU9TCbfdPP7Od/ymUsoO597
	3fZsMDId/ALLgP04mJKdakvpxpVg162Z3eCaluUrSZoOHRrYFIIk75+RdseUzn2v89gWmt8RoHr4F
	JZ+WUsCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAzr-0000000Da7R-1kPY;
	Tue, 06 Jan 2026 17:37:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAzo-0000000Da5O-1sqp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 17:37:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D67BA497;
	Tue,  6 Jan 2026 09:37:20 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 257753F5A1;
	Tue,  6 Jan 2026 09:37:26 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	tabba@google.com,
	will@kernel.org
Subject: [PATCH 3/3] KVM: arm64: Remove ISB after writing FPEXC32_EL2
Date: Tue,  6 Jan 2026 17:37:07 +0000
Message-Id: <20260106173707.3292074-4-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260106173707.3292074-1-mark.rutland@arm.com>
References: <20260106173707.3292074-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_093729_092243_B061EBBE 
X-CRM114-Status: GOOD (  10.83  )
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

The value of FPEX32_EL2 has no effect on execution in AArch64 state, and
consequently there's no need for an ISB after writing to it in the hyp
code (which executes in AArch64 state). When performing an exception
return to AArch32 state, the exception return will provide the necessary
context synchronization event.

Remove the redundant ISB.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 8dce3da85da35..91aa1862349cb 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -59,10 +59,8 @@ static inline void __activate_traps_fpsimd32(struct kvm_vcpu *vcpu)
 	 * If FP/ASIMD is not implemented, FPEXC is UNDEFINED and any access to
 	 * it will cause an exception.
 	 */
-	if (vcpu_el1_is_32bit(vcpu) && system_supports_fpsimd()) {
+	if (vcpu_el1_is_32bit(vcpu) && system_supports_fpsimd())
 		write_sysreg(1 << 30, fpexc32_el2);
-		isb();
-	}
 }
 
 static inline void __activate_cptr_traps_nvhe(struct kvm_vcpu *vcpu)
-- 
2.30.2


