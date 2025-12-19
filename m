Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CC8D7879F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 18:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0TuubjReZFSRTU5t0ZPpWo6K13gPJgm/zvqJ5US3hfI=; b=Odi1qsJvN2bR/jqz5IWwx9/bg+
	VJDFA5mhoB+EuNMISflGEvkUiQaDudSB0yHfb/Q2LHDlBOzwL1b9MqRE0krJ6K3Vmv8/HQIWaAGi2
	w/d3BJyoiIq5Xi3dWMm1DLqp4soQ7rYyAerImjw+E7HiOT3D09t28ndanF3VE8YxfdI4eFBt1QNg2
	euSfYl3CSBfu86TjPYZm7UEcfGswuHV6h5A+I8xDt6L8SQxQgPzJa1t5Rw0MYI+JzM7FVLF7NcJ0v
	2+JwUoat8U/eaSZALJU/fiZ1ojzr6J7c1faDrbj3ctxZtkdG8rMLEvrTzi2xLYdi1Z9yIADtVYKD+
	zsdFU42Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWeyV-0000000AleH-1xTj;
	Fri, 19 Dec 2025 18:13:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWeyT-0000000Albs-19B0
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 19 Dec 2025 18:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0TuubjReZFSRTU5t0ZPpWo6K13gPJgm/zvqJ5US3hfI=; b=GE3t4VJERTNaQ8i1KdFxF5mi0f
	gghIsZCSGPnsl44HPCDCTg/30xYEpQ824EFnbKy5k2lS6eaEEZCVUCgimXMb5X6VwAfGtA53rhFcU
	JTHatYqBjCJgT5grZrxmKLT0Ryqm3Mus2Vuvl/wRc2W68W+hk/EeHrW/o2qvAAqRFsNmbAKoYwagp
	egp2rtcKWhJ2vwqJUHAjs2RSuD9HNgTcdw19N6tkNXIZ7Ygls58GxCUFdJAe8ZzHnrOL81R1OjQKE
	jsOUc064ILa41tdMOod+OFcwr6/joVCNsH7tuKf6kOcCzDhN1MggBTm/lUQMpgU7roBzZq9dh8jnK
	u0fEd2sw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWe6x-0000000BPf4-3j7G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 17:17:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12F37FEC;
	Fri, 19 Dec 2025 10:12:57 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B875D3F5CA;
	Fri, 19 Dec 2025 10:12:59 -0800 (PST)
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
	kvmarm@lists.linux.dev
Subject: [PATCH v2 13/45] KVM: arm64: Force guest EL1 to use user-space's partid configuration
Date: Fri, 19 Dec 2025 18:11:15 +0000
Message-ID: <20251219181147.3404071-14-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219181147.3404071-1-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_171752_136435_092AC03A 
X-CRM114-Status: GOOD (  10.36  )
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

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since rfc:
Drop the unneeded __mpam_guest_load() in nvhre and the MPAM1_EL1 save restore
Defer EL2 handling until next patch
---
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
index f28c6cf4fe1b..a2e8f6187675 100644
--- a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
+++ b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
@@ -183,6 +183,16 @@ void sysreg_restore_guest_state_vhe(struct kvm_cpu_context *ctxt)
 }
 NOKPROBE_SYMBOL(sysreg_restore_guest_state_vhe);
 
+/*
+ * The _EL0 value was written by the host's context switch and belongs to the
+ * VMM. Copy this into the guest's _EL1 register.
+ */
+static inline void __mpam_guest_load(void)
+{
+	if (system_supports_mpam())
+		write_sysreg_el1(read_sysreg_s(SYS_MPAM0_EL1), SYS_MPAM1);
+}
+
 /**
  * __vcpu_load_switch_sysregs - Load guest system registers to the physical CPU
  *
@@ -222,6 +232,7 @@ void __vcpu_load_switch_sysregs(struct kvm_vcpu *vcpu)
 	 */
 	__sysreg32_restore_state(vcpu);
 	__sysreg_restore_user_state(guest_ctxt);
+	__mpam_guest_load();
 
 	if (unlikely(is_hyp_ctxt(vcpu))) {
 		__sysreg_restore_vel2_state(vcpu);
-- 
2.43.0


