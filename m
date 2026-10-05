Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9253CCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPenIixNxeo/RZZYYRWBFbMM7vTNg8wPpLI436ns0nM=; b=KFdlAqC5fPPhjqVAJoGxn+1LSY
	+NkX4ubn1FcMbGGrelLltdY+9CTXMCeXy1FFcCESxiCfbV26Q0cKQS4jM2r8CtVk3/4qmf096rs4r
	6Xz7/kzKLfbl9vpbs0GCKOk5kErkEpflSxeVHGly/xf8eQ+A3VjR3KUPUMnWvf8MqRZCQ+Xd7YhMM
	cS052Xkz2cCWLIYBZCgghNwYcviSEYaJQEOYK+4BXksYQnR078+aceETDuHdrm5qpyVheHzwzxBTA
	vgApDEqTJ7Ez4zmzMmUEd4+/OzYreQkSHxLavaNSr9A8Q9Lbss+Mu8tXg4vOBpyUZalOS6XQu6SMr
	k6YvXPZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDegA-0000000FwM9-13nA;
	Mon, 05 Oct 2026 09:08:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDeg7-0000000FwKp-1IRd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:08:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 611831576;
	Mon,  5 Oct 2026 02:08:06 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BEE4A3F66F;
	Mon,  5 Oct 2026 02:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791191289; bh=VEvLdkz1eGObHkr5aPI59l9BjDBAJ/q4k8m4P7yH6kc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VTekPLpml7vv33SnmoRUcJNZV8KWAJ6Jr9TOi847zCOM+o4aL1oI/SgkU2KIXQYGF
	 6fn619PCfEi0acgEGmCmg7/FsXfnwtUDkqqPJtai3oaroPwGoHtWj5+Khzi/VvUGCZ
	 QOAP4i9ET+l5oUkd45PTJwYJj9pC2jJsm2ec/9aM=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	sudeep.holla@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v22 01/23] KVM: arm64: protected VM: Handle user writes to CNTVCT_EL0/CNTPCT_EL0
Date: Mon,  5 Oct 2026 10:07:32 +0100
Message-ID: <20261005090754.2140522-2-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005090754.2140522-1-suzuki.poulose@arm.com>
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_020811_436836_4BE736E4 
X-CRM114-Status: GOOD (  16.80  )
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

Protected VMs doesn't allow setting offsets for virtual and physical
counters, as the offset is always fixed to 0. The VM ioctl is filtered
out based on the cap. However we don't prevent the userspace from trying
to write to the CNTVCT/CNTPCT registers. This would lead to KVM triggering
a WARN() in timer_set_offset() as the vm_offset pointer is set to NULL.

Fix this by always "fixing" the timer offsets to 0 and marking that the
timer offset is set in the kvm->arch.flags at KVM init time for protected
VMs. This prevents the access to the VM specific vm_offset at low cost.
A userspace writing to the CNT*CT_EL0 would observe success, without
any real effect. This is cleaner over spilling "*_is_protected()"
checks and "matches" what we really do in practise. i.e., always run
with "fixed counter offset of 0".

Reported by Sashiko

Link: https://lore.kernel.org/all/20260908164641.416911F00A3A@smtp.kernel.org
Fixes: f7d05ee84a6a ("KVM: arm64: Prevent host from managing timer offsets for protected VMs")
Suggested-by: Marc Zyngier <maz@kernel.org>
Tested-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 Changes since v19:
  - Fix typos in commit description and explain why we choose the approach.
  - Improve comment in the code
 Changes since v18:
  - Retain NULL vm_offset for protected VMs to avoid host tampering with the
    offset.
  - Moved the flag setting into kvm_timer_init_vm(), where it should have been
    in the first place
---
 arch/arm64/kvm/arch_timer.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 6ac3321f4c575..a45845f4ae4ea 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -1110,8 +1110,7 @@ void kvm_timer_vcpu_init(struct kvm_vcpu *vcpu)
 		timer_context_init(vcpu, i);
 
 	/* Synchronize offsets across timers of a VM if not already provided */
-	if (!vcpu_is_protected(vcpu) &&
-	    !test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags)) {
+	if (!test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags)) {
 		timer_set_offset(vcpu_vtimer(vcpu), kvm_phys_timer_read());
 		timer_set_offset(vcpu_ptimer(vcpu), 0);
 	}
@@ -1133,6 +1132,15 @@ void kvm_timer_init_vm(struct kvm *kvm)
 	 */
 	for (int i = 0; i < NR_KVM_TIMERS; i++)
 		kvm->arch.timer_data.ppi[i] = get_vgic_ppi(kvm, default_ppi[i]);
+
+	/*
+	 * Protected VMs don't allow the userspace to set counter offsets,
+	 * either set via counter register writes or the dedicated ioctls.
+	 * Pretend the offset has already been set and rely on the default
+	 * offset being 0.
+	 */
+	if (kvm_vm_is_protected(kvm))
+		set_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &kvm->arch.flags);
 }
 
 void kvm_timer_cpu_up(void)
-- 
2.43.0


