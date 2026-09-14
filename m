Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C15C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OzlBv4LVliN5qNgFK6sUr7g7vdLbZroh00iI5mV/2X0=; b=eR7QyzrSg7vmkQbql44xJfhrvV
	o5nuuFs3PLkPAOONk0+/Wb+E6VddO/gGbDRupbwi4p0iepYDwWNo5sDVvAfGbblMfbk+hGplZk7rz
	56X+3XjtD/DDlkUDJNfM3bbCEqcUAQn7lBjc0sSfm8nBltu9iAbX9/QHDeylou6gJssV+NpVdV4K/
	WfZFBKS+p7tJqeYW4WhJ6EcttOLxWy0Vfn4eZ+Yti5nGXIkoHeyKPcdGkjRRQ7nQZ722rM0bMMzO7
	5yX/1KGtr2mF2TR+QNLAChhcO5EZYAnz8FfoPQFPVPDgitDajL0rA57Z7Qzkt2U58NI86xivqpBq5
	zYw3BV4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64xH-00000003G99-26qF;
	Mon, 14 Sep 2026 11:34:35 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64xD-00000003G4F-2Jar
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:34:32 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=zOptQexS7lDj6c14lPjl14jvIGvWcUYj7AKr6A/egrA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789385669; v=1; x=1789990469;
 b=rblhoPtXxz492wXn2rmC6P3EigsQTY+kthB1QNO12W4cOY+i/ROSi0BXkW4l6TN0YVU3QxoB
 CwMAiUC1wJIbdqe3K5g8Spk52TJYIV1upa47vih3fQe6/XuApALX9QGn7C7n71dxXzpU8oP738J
 BwShJ+0BRmaKJ/bgcHf9dBE8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4c887214f45f674d;
	Mon, 14 Sep 2026 11:34:29 +0000
X-Mizu-Trace-ID: 4c887214f45f674d
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
Subject: [PATCH v3 07/18] KVM: arm64: Add {flush,sync}_hyp_timer_state() primitives
Date: Mon, 14 Sep 2026 12:33:27 +0100
Message-Id: <20260914113338.159227-8-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260914113338.159227-1-fuad.tabba@linux.dev>
References: <20260914113338.159227-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_043431_744777_A1CD3974 
X-CRM114-Status: GOOD (  13.25  )
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

From: Marc Zyngier <maz@kernel.org>

A protected guest's virtual timer is programmed from EL2's own copy of
the state and read back there, so the host can't change the guest's
deadline. cntvoff_el2 is zeroed, so the guest's virtual time is the
physical time.

The flush also preserves the guest's CNTV and CNTP CVAL/CTL across the
host's full-context copy into the hyp vCPU, until the per-EC
marshalling patch removes that copy.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Co-developed-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 39 ++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 229a4877d14f5..9cc8ef16897c1 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -154,6 +154,33 @@ static void sync_hyp_vgic_state(struct pkvm_hyp_vcpu *hyp_vcpu)
 		host_cpu_if->vgic_lr[i] = hyp_cpu_if->vgic_lr[i];
 }
 
+static void flush_hyp_timer_state(struct pkvm_hyp_vcpu *hyp_vcpu)
+{
+	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu))
+		return;
+
+	/* A hyp vcpu has no offset, and sees vtime == ptime. */
+	write_sysreg(0, cntvoff_el2);
+	write_sysreg_el0(__vcpu_sys_reg(&hyp_vcpu->vcpu, CNTV_CVAL_EL0),
+			 SYS_CNTV_CVAL);
+	isb();
+	write_sysreg_el0(__vcpu_sys_reg(&hyp_vcpu->vcpu, CNTV_CTL_EL0),
+			 SYS_CNTV_CTL);
+}
+
+static void sync_hyp_timer_state(struct pkvm_hyp_vcpu *hyp_vcpu)
+{
+	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu))
+		return;
+
+	/*
+	 * Preserve the vtimer state so that it is always correct,
+	 * even if the host tries to make a mess.
+	 */
+	__vcpu_assign_sys_reg(&hyp_vcpu->vcpu, CNTV_CVAL_EL0, read_sysreg_el0(SYS_CNTV_CVAL));
+	__vcpu_assign_sys_reg(&hyp_vcpu->vcpu, CNTV_CTL_EL0, read_sysreg_el0(SYS_CNTV_CTL));
+}
+
 static void __copy_vcpu_state(const struct kvm_vcpu *from_vcpu,
 			      struct kvm_vcpu *to_vcpu)
 {
@@ -255,7 +282,17 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 		hyp_vcpu->vcpu.arch.mdcr_el2 = host_vcpu->arch.mdcr_el2;
 		hyp_vcpu->vcpu.arch.iflags = host_vcpu->arch.iflags;
 	} else {
+		u64 v_cval = hyp_vcpu->vcpu.arch.ctxt.sys_regs[CNTV_CVAL_EL0];
+		u64 v_ctl = hyp_vcpu->vcpu.arch.ctxt.sys_regs[CNTV_CTL_EL0];
+		u64 p_cval = hyp_vcpu->vcpu.arch.ctxt.sys_regs[CNTP_CVAL_EL0];
+		u64 p_ctl = hyp_vcpu->vcpu.arch.ctxt.sys_regs[CNTP_CTL_EL0];
+
 		hyp_vcpu->vcpu.arch.ctxt = host_vcpu->arch.ctxt;
+
+		hyp_vcpu->vcpu.arch.ctxt.sys_regs[CNTV_CVAL_EL0] = v_cval;
+		hyp_vcpu->vcpu.arch.ctxt.sys_regs[CNTV_CTL_EL0] = v_ctl;
+		hyp_vcpu->vcpu.arch.ctxt.sys_regs[CNTP_CVAL_EL0] = p_cval;
+		hyp_vcpu->vcpu.arch.ctxt.sys_regs[CNTP_CTL_EL0] = p_ctl;
 	}
 
 	/* __hyp_running_vcpu must be NULL in a guest context. */
@@ -270,6 +307,7 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 	hyp_vcpu->vcpu.arch.vsesr_el2 = host_vcpu->arch.vsesr_el2;
 
 	flush_hyp_vgic_state(hyp_vcpu);
+	flush_hyp_timer_state(hyp_vcpu);
 
 	hyp_vcpu->vcpu.arch.pid = host_vcpu->arch.pid;
 
@@ -318,6 +356,7 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu, u32 exit_reason)
 	host_vcpu->arch.hcr_el2 |= hyp_vcpu->vcpu.arch.hcr_el2 & HCR_VSE;
 
 	sync_hyp_vgic_state(hyp_vcpu);
+	sync_hyp_timer_state(hyp_vcpu);
 
 	hyp_vcpu->exit_code = exit_reason;
 }
-- 
2.39.5


