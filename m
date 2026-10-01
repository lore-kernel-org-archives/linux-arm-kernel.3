Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4ADCA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dS8kcFeT7WwhBNtwOFIZE2GiPRPgBMWaLfDSKZ2G048=; b=eelk5wzSyj/Ej07Rb6OEUCNbY+
	bz2njxDD6zKSuGHfF4kG076gIaz8Zy1dIwft6sTrBOVtaWmKJaeVwjCdAb2xCFr28pm2clRsIY6vu
	VGBXgZ3cQ+mPJugJSCjVeg9reWu5pkNnAQN+ASYi9rynBV3oLSQ3ALGUB+pBPbJ7HOkd5csG4lZS4
	EfEoD1Nb1T+ibxbV8mvkf17xAFBHUWTBqlBfkAhVcDwpb1Y2iX4FBFJsFCheD/TcZGkYzOSDxhvqI
	+toIm2qi3WK5+d4WP+5k1HBIRwPES+OVJsQVw9khrdnNY/iDcjeJxctYdnlgvXveyiFY90d+lRxop
	qgN3ILhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHJe-00000009JSF-1uYZ;
	Thu, 01 Oct 2026 13:59:18 +0000
Received: from out-133.mta0.migadu.com ([2001:41d0:1004:224b::85] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHJb-00000009JNs-35jD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:59:17 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=p44B2BrDojBCRz+tjD81PjPiPKtQk1pR/rHcbdJhCeI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790863152; v=1; x=1791467952;
 b=UUabbByZJjha9S3YZSUkh+EyP3Z2nrX0s8eMOWEafcaDoAC4DRbU3JfZgZptCqlfQyLykykr
 l3sREGsJCDO6g2rse4lNR1x9N7RDDJis/DuxLLGDretS60feiBR79rKajTnQpjaZCcgpf7zuY5N
 aco35Emsz5/EAX9ffs8TGyRA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 1b44149f56f7e390;
	Thu, 01 Oct 2026 13:59:12 +0000
X-Mizu-Trace-ID: 1b44149f56f7e390
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	mark.rutland@arm.com,
	steven.price@arm.com,
	vdonnefort@google.com,
	qperret@google.com,
	tabba@google.com
Subject: [PATCH v4 15/18] KVM: arm64: Reject host access to protected VM private state
Date: Thu,  1 Oct 2026 14:57:08 +0100
Message-Id: <20261001135711.1640520-16-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261001135711.1640520-1-fuad.tabba@linux.dev>
References: <20261001135711.1640520-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_065915_916144_B8EFB7B8 
X-CRM114-Status: GOOD (  18.41  )
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
the host, and the host ioctls that would reach it fail instead:

  - KVM_GET_ONE_REG and KVM_SET_ONE_REG return -EPERM once the vCPU has
    run: the host copy then holds the boot state the VMM wrote plus
    what the exit handlers copy out, which the VMM can't tell apart.
    Pre-run access still builds the guest's boot state.
  - KVM_ARM_VCPU_INIT returns -EPERM once the vCPU has run: it would
    reset the host copy alone and rewrite mp_state, which EL2 reads
    only at hyp vCPU creation, so a vCPU the guest powered off would
    come back RUNNABLE.
  - KVM_SET_VCPU_EVENTS rejects external-abort injection with -EPERM;
    SError injection is forwarded and stays permitted.
  - KVM_SET_GUEST_DEBUG returns -EPERM: a protected guest's debug state
    is hypervisor-owned.

The KVM_{GET,SET}_ONE_REG and KVM_ARM_VCPU_INIT checks are one filter
on the ioctl number in kvm_arch_vcpu_ioctl(), the only caller of the
three functions they were in. Its -EPERM now precedes the cases'
-EFAULT and the ONE_REG case's pending-reset handling, which the next
KVM_RUN performs. The external-abort check reads the payload, and
KVM_SET_GUEST_DEBUG has its own case in kvm_vcpu_ioctl(), so it never
reaches kvm_arch_vcpu_ioctl(): those two stay in their handlers.

KVM_CHECK_EXTENSION returns 0 for KVM_CAP_ARM_INJECT_EXT_DABT and
KVM_CAP_SET_GUEST_DEBUG on a protected VM: kvm_pkvm_ext_allowed()
returns false on every capability it doesn't list, and the patch that
advertises the capabilities protected VMs support leaves these two
out. The two ioctl checks stay for a VMM that doesn't query
KVM_CHECK_EXTENSION.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/arm.c   | 22 ++++++++++++++++++++++
 arch/arm64/kvm/guest.c | 11 +++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index ca6e109b3e5d6..14fe4e7275796 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1865,6 +1865,24 @@ static int kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
 	return __kvm_arm_vcpu_set_events(vcpu, events);
 }
 
+/*
+ * Once a protected vCPU has run, the host copy holds the boot state the VMM
+ * wrote plus what the exit handlers copy out, and EL2 has read mp_state,
+ * which it does only at hyp vCPU creation.
+ */
+static long pkvm_filter_vcpu_ioctl(struct kvm_vcpu *vcpu, unsigned int ioctl)
+{
+	switch (ioctl) {
+	case KVM_ARM_VCPU_INIT:
+	case KVM_SET_ONE_REG:
+	case KVM_GET_ONE_REG:
+		if (vcpu_is_protected(vcpu) && vcpu_has_run_once(vcpu))
+			return -EPERM;
+	}
+
+	return 0;
+}
+
 long kvm_arch_vcpu_ioctl(struct file *filp,
 			 unsigned int ioctl, unsigned long arg)
 {
@@ -1873,6 +1891,10 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
 	struct kvm_device_attr attr;
 	long r;
 
+	r = pkvm_filter_vcpu_ioctl(vcpu, ioctl);
+	if (r)
+		return r;
+
 	switch (ioctl) {
 	case KVM_ARM_VCPU_INIT: {
 		struct kvm_vcpu_init init;
diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index b01d6622b8720..d5e2e08f05461 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -786,6 +786,13 @@ int __kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
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
@@ -883,6 +890,10 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
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


