Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAC0C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 07:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YP8hECvLf0VFdTgXyfwOkmpasw6njJUzhvWHXNhHk60=; b=kVHWNBWK6mLhZ3baBWPINLNKVm
	A6vsOiFP4kzF17QboH6WgnuZoT3mx0twgSB0WpIN4aeoTHTb5vkzWLJRnZkAB3OaoFVt1+USZK4a+
	TTVSy3GYy0UeJmehMoX+oC285dDk3MFxa+NtjoPyecOsiyTINZDxwWCiNoMXFUoqw8ct53c7rLtg/
	rR7ufLrD5HIJin/3aHjFY47yRazBqnDW5DKAJuwcw2FUHggygjBnh9ob5lPXNJo36J7uMit2+FvZe
	ahtOQV7lfzT8YRSrIKSFmOevQYz2LT+oMv4GWpKa2IwUpwihMO3ZTHizsofThQ5VWYbrQghSnP5R/
	M539qWyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TMU-000000066e2-3RiM;
	Mon, 07 Sep 2026 07:01:50 +0000
Received: from out-14.mta0.migadu.com ([2001:41d0:1004:224b::e] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TMO-000000066Wy-2Bgq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 07:01:50 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=K+Cw1Rhs/pIXecXIjGAEGbyJhwCxhPQM371NHFscWfw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788764502; v=1; x=1789369302;
 b=p8fNQnYuVsFPhdAhPxr5iNDsAmcuAMoCKemaon+6vgdDeWzMd3SgfbLHHsReo1SazQqmPFUQ
 G6XsECqPrraRiSH+Ev8xUFHy6VOLDQKqyKiNvee3gKb8rAj9gBLGnabzf3t75eh0xftsbSURpzd
 a3tahqUpAkalCaOFzIan1hyA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d6bcb7f9e1bd0ff6;
	Mon, 07 Sep 2026 07:01:42 +0000
X-Mizu-Trace-ID: d6bcb7f9e1bd0ff6
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 14/17] KVM: arm64: Reject host access to protected VM private state
Date: Mon,  7 Sep 2026 07:59:59 +0100
Message-Id: <20260907070002.3333525-15-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260907070002.3333525-1-fuad.tabba@linux.dev>
References: <20260907070002.3333525-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_000144_719142_F4FFAB8C 
X-CRM114-Status: GOOD (  16.89  )
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

A protected vCPU's register and debug state is no longer exposed to
the host. Host ioctls that would reach that state now fail rather
than operate on a copy that is not the guest's:

  - KVM_GET_ONE_REG and KVM_SET_ONE_REG return -EPERM once the vCPU has
    run: the copy then holds reset values plus what the exit handlers
    marshal out. Pre-run access still builds the guest's boot state.
  - KVM_ARM_VCPU_INIT returns -EPERM once the vCPU has run: it would
    reset the host copy alone and rewrite mp_state, which EL2 reads
    only at hyp vCPU creation, so a vCPU the guest powered off would
    come back RUNNABLE.
  - KVM_SET_VCPU_EVENTS rejects external-abort injection with -EPERM;
    SError injection is forwarded and stays permitted.
  - KVM_SET_GUEST_DEBUG returns -EPERM: a protected guest's debug state
    is hypervisor-owned.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/arm.c   |  7 +++++++
 arch/arm64/kvm/guest.c | 19 +++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 5c2587da815ab..37a260b139795 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1750,6 +1750,13 @@ static int kvm_arch_vcpu_ioctl_vcpu_init(struct kvm_vcpu *vcpu,
 	bool power_off = false;
 	int ret;
 
+	/*
+	 * Re-init would reset the host copy alone and rewrite mp_state
+	 * after EL2 has read it. Pre-run init stays allowed.
+	 */
+	if (vcpu_is_protected(vcpu) && vcpu_has_run_once(vcpu))
+		return -EPERM;
+
 	/*
 	 * Treat the power-off vCPU feature as ephemeral. Clear the bit to avoid
 	 * reflecting it in the finalized feature set, thus limiting its scope
diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index ab659795d4b2f..abab580a659d4 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -701,6 +701,10 @@ int kvm_arm_copy_reg_indices(struct kvm_vcpu *vcpu, u64 __user *uindices)
 
 int kvm_arm_get_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 {
+	/* Once the vCPU has run, the host copy is not the guest's state. */
+	if (vcpu_is_protected(vcpu) && vcpu_has_run_once(vcpu))
+		return -EPERM;
+
 	/* We currently use nothing arch-specific in upper 32 bits */
 	if ((reg->id & ~KVM_REG_SIZE_MASK) >> 32 != KVM_REG_ARM64 >> 32)
 		return -EINVAL;
@@ -718,6 +722,10 @@ int kvm_arm_get_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 
 int kvm_arm_set_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 {
+	/* Writes build the boot state; once run, EL2 owns the registers. */
+	if (vcpu_is_protected(vcpu) && vcpu_has_run_once(vcpu))
+		return -EPERM;
+
 	/* We currently use nothing arch-specific in upper 32 bits */
 	if ((reg->id & ~KVM_REG_SIZE_MASK) >> 32 != KVM_REG_ARM64 >> 32)
 		return -EINVAL;
@@ -786,6 +794,13 @@ int __kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
 	u64 esr = events->exception.serror_esr;
 	int ret = 0;
 
+	/*
+	 * EL2 injects an external abort only to complete a forwarded abort.
+	 * SError injection is forwarded.
+	 */
+	if (vcpu_is_protected(vcpu) && ext_dabt_pending)
+		return -EPERM;
+
 	/*
 	 * Immediately commit the pending SEA to the vCPU's architectural
 	 * state which is necessary since we do not return a pending SEA
@@ -883,6 +898,10 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
 {
 	trace_kvm_set_guest_debug(vcpu, dbg->control);
 
+	/* A protected guest's debug state is not exposed to the host. */
+	if (vcpu_is_protected(vcpu))
+		return -EPERM;
+
 	if (dbg->control & ~KVM_GUESTDBG_VALID_MASK)
 		return -EINVAL;
 
-- 
2.39.5


