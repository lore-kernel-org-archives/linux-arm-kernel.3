Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F1AC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 13:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7OAzeOBYbf0VmVmkRR6LkWP8XatuESOVgm+rB54+ZaY=; b=FO/NsKFLKtNefErq97b5sa7OL5
	W6tAHGkujGfAi0kXyCNzqMJJSskN4j3UjHgEadrqmSpgvcxBaP6AGfaEmhP1kfiztLxA3zxSLJ33E
	m9YKOj/N52L3S0wXqxN6uhxRKs576sfKz2E4gOakw7ux9SXedA2vlisFkny2PEQmTBr7vxMZPe0AC
	S5ZSvHefF/FjAz6v4o8XY/ETxGndMDI7+DgfygTkkqKJbzvHVFbArv7xKu03MjbTNqR6DRpgIgiuE
	yS2nYR2At1hTnsxAxP3SeIyphaNlkKpFIcOl6kl21I8B7N+xrng5RK+ydy9oT1LpMqvZWCWGqTo4l
	HJdjsHMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWow-00000007Rme-23H6;
	Tue, 17 Jun 2025 13:57:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWVS-00000007NxY-1P8n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 13:37:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A0901596;
	Tue, 17 Jun 2025 06:37:21 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 50D3E3F673;
	Tue, 17 Jun 2025 06:37:40 -0700 (PDT)
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
Subject: [PATCH 5/7] KVM: arm64: Remove ad-hoc CPTR manipulation from kvm_hyp_handle_fpsimd()
Date: Tue, 17 Jun 2025 14:37:16 +0100
Message-Id: <20250617133718.4014181-6-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250617133718.4014181-1-mark.rutland@arm.com>
References: <20250617133718.4014181-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_063742_498268_A0C56C7B 
X-CRM114-Status: GOOD (  14.51  )
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

The hyp code FPSIMD/SVE/SME trap handling logic has some rather messy
open-coded manipulation of CPTR/CPACR. This is benign for non-nested
guests, but broken for nested guests, as the guest hypervisor's CPTR
configuration is not taken into account.

Consider the case where L0 provides FPSIMD+SVE to an L1 guest
hypervisor, and the L1 guest hypervisor only provides FPSIMD to an L2
guest (with L1 configuring CPTR/CPACR to trap SVE usage from L2). If the
L2 guest triggers an FPSIMD trap to the L0 hypervisor,
kvm_hyp_handle_fpsimd() will see that the vCPU supports FPSIMD+SVE, and
will configure CPTR/CPACR to NOT trap FPSIMD+SVE before returning to the
L2 guest. Consequently the L2 guest would be able to manipulate SVE
state even though the L1 hypervisor had configured CPTR/CPACR to forbid
this.

Clean this up, and fix the nested virt issue by always using
__deactivate_cptr_traps() and __activate_cptr_traps() to manage the CPTR
traps. This removes the need for the ad-hoc fixup in
kvm_hyp_save_fpsimd_host(), and ensures that any guest hypervisor
configuration of CPTR/CPACR is taken into account.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 9b025276fcc8e..ce001a2b6421c 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -617,11 +617,6 @@ static void kvm_hyp_save_fpsimd_host(struct kvm_vcpu *vcpu)
 	 */
 	if (system_supports_sve()) {
 		__hyp_sve_save_host();
-
-		/* Re-enable SVE traps if not supported for the guest vcpu. */
-		if (!vcpu_has_sve(vcpu))
-			cpacr_clear_set(CPACR_EL1_ZEN, 0);
-
 	} else {
 		__fpsimd_save_state(host_data_ptr(host_ctxt.fp_regs));
 	}
@@ -672,10 +667,7 @@ static inline bool kvm_hyp_handle_fpsimd(struct kvm_vcpu *vcpu, u64 *exit_code)
 	/* Valid trap.  Switch the context: */
 
 	/* First disable enough traps to allow us to update the registers */
-	if (sve_guest || (is_protected_kvm_enabled() && system_supports_sve()))
-		cpacr_clear_set(0, CPACR_EL1_FPEN | CPACR_EL1_ZEN);
-	else
-		cpacr_clear_set(0, CPACR_EL1_FPEN);
+	__deactivate_cptr_traps(vcpu);
 	isb();
 
 	/* Write out the host state if it's in the registers */
@@ -697,6 +689,13 @@ static inline bool kvm_hyp_handle_fpsimd(struct kvm_vcpu *vcpu, u64 *exit_code)
 
 	*host_data_ptr(fp_owner) = FP_STATE_GUEST_OWNED;
 
+	/*
+	 * Re-enable traps necessary for the current state of the guest, e.g.
+	 * those enabled by a guest hypervisor. The ERET to the guest will
+	 * provide the necessary context synchronization.
+	 */
+	__activate_cptr_traps(vcpu);
+
 	return true;
 }
 
-- 
2.30.2


