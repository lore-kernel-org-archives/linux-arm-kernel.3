Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C86105F7AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6sfx0BeCK4o2PZRm2XbT6L66llJyNvYMEO46iAjdFYg=; b=RkdAJ9J9609EpsfT7W3aFEmawk
	PtfcTCObSnXf+wSCoBb0LOCmolj+weViGOeBtwsUZk+9O77qM5hd0Nu/pE7s0tlQA5CpIO9oik5BP
	fNQNn2O82GYZBNUVlzFpb/iChDinmm+ZpY65gzLl3dplb0zYW5nKJwz97lVi3dRc6H2AqK/b+vTIq
	EzPpPiYvY415TaBbMbkKGfL+TIGfB2O/ML0a6mpcbvK2CkDkOuwPuehoulgYDOpf1OWK4Eu1OB77o
	AkQ/lW29O5aNBSrZdu9auEBtGI7pISloW8ALAHWHRjEm+KGO5u8Me1BbCJXX1V0YkAO1/7dTdpgaQ
	1zqx+62g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13nX-00000000QyL-26m1;
	Fri, 13 Mar 2026 14:47:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13nU-00000000QvA-0FaP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:47:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9C141E7D;
	Fri, 13 Mar 2026 07:47:20 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EAE403F7BD;
	Fri, 13 Mar 2026 07:47:22 -0700 (PDT)
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	carl@os.amperecomputing.com,
	dave.martin@arm.com,
	david@kernel.org,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com,
	reinette.chatre@intel.com,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	kvmarm@lists.linux.dev,
	zengheng4@huawei.com,
	linux-doc@vger.kernel.org,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: [PATCH v6 13/40] KVM: arm64: Force guest EL1 to use user-space's partid configuration
Date: Fri, 13 Mar 2026 14:45:50 +0000
Message-ID: <20260313144617.3420416-14-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313144617.3420416-1-ben.horgan@arm.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_074728_223665_1519E52D 
X-CRM114-Status: GOOD (  10.43  )
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

From: James Morse <james.morse@arm.com>

While we trap the guest's attempts to read/write the MPAM control
registers, the hardware continues to use them. Guest-EL0 uses KVM's
user-space's configuration, as the value is left in the register, and
guest-EL1 uses either the host kernel's configuration, or in the case of
VHE, the UNKNOWN reset value of MPAM1_EL1.

We want to force the guest-EL1 to use KVM's user-space's MPAM
configuration. On nVHE rely on MPAM0_EL1 and MPAM1_EL1 always being
programmed the same and on VHE copy MPAM0_EL1 into the guest's
MPAM1_EL1. There is no need to restore as this is out of context once TGE
is set.

Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Tested-by: Zeng Heng <zengheng4@huawei.com>
Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Reviewed-by: Zeng Heng <zengheng4@huawei.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since rfc:
Drop the unneeded __mpam_guest_load() in nvhre and the MPAM1_EL1 save restore
Defer EL2 handling until next patch

Changes since v2:
Use mask (Oliver)

Changes since v4:
Explicitly set the mpam enable bit
---
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
index b254d442e54e..be685b63e8cf 100644
--- a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
+++ b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
@@ -183,6 +183,21 @@ void sysreg_restore_guest_state_vhe(struct kvm_cpu_context *ctxt)
 }
 NOKPROBE_SYMBOL(sysreg_restore_guest_state_vhe);
 
+/*
+ * The _EL0 value was written by the host's context switch and belongs to the
+ * VMM. Copy this into the guest's _EL1 register.
+ */
+static inline void __mpam_guest_load(void)
+{
+	u64 mask = MPAM0_EL1_PARTID_D | MPAM0_EL1_PARTID_I | MPAM0_EL1_PMG_D | MPAM0_EL1_PMG_I;
+
+	if (system_supports_mpam()) {
+		u64 val = (read_sysreg_s(SYS_MPAM0_EL1) & mask) | MPAM1_EL1_MPAMEN;
+
+		write_sysreg_el1(val, SYS_MPAM1);
+	}
+}
+
 /**
  * __vcpu_load_switch_sysregs - Load guest system registers to the physical CPU
  *
@@ -222,6 +237,7 @@ void __vcpu_load_switch_sysregs(struct kvm_vcpu *vcpu)
 	 */
 	__sysreg32_restore_state(vcpu);
 	__sysreg_restore_user_state(guest_ctxt);
+	__mpam_guest_load();
 
 	if (unlikely(is_hyp_ctxt(vcpu))) {
 		__sysreg_restore_vel2_state(vcpu);
-- 
2.43.0


