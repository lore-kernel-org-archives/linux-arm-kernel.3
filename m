Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A986C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 16:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjSmlPzbNn9GLSswmtoFKNUKTOvPNFADmysBpgIskMA=; b=Vnk/WUHe0OTuRFcPpV3aL0RuMx
	WpGuYDZmadmxIvrcUWE5keu469jFU0F1ddWX5KGexo7uiFj1ZEnJu8YqaTELZwa6gToQ0nV9JQwWM
	YbteCmaZLRq9lyEWuUESyIlhPy0h9waj2kGe226g98vuByIiRN9OP+M5IOMxZb9Gdsw32YZ24EhAt
	33to8bCBkh6YO2mP6iXBj0oeH/02zVLyVl+MsY2+4/+g0vDeNqYxr70EYxVuYUTmdoxCsGqjp5XRH
	rUDYHSAUFi6DXtoH59bGHvd6KLWO+j4n2nvfQ6C+8lPYTbhlzpGE49Ji4bHz7/c59cDE4RP7LZ56j
	nhCAVjeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14y5-0000000A3gI-3uJe;
	Mon, 31 Aug 2026 16:34:45 +0000
Received: from out-195.mta1.migadu.com ([2001:41d0:203:375::c3] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14y2-0000000A3cK-2N99
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 16:34:44 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=2sbto41tBk300tVzgzcERGaOKg9olZAVUAA+XHNTpvk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788194080; v=1; x=1788798880;
 b=JnfKgDgOy7sepHNRkXUMQcVjDb6eTxmR/OcA10Gr3plpf7Jo5aCZMFmFEKxJx6UGAm9eHSie
 4318OCxDGxN/wiDqgoamY40xpZZud98D0D0FAu7VVKOJrnfquaQvelzwsuowm2NxvCEbu0ojxkm
 3TZZ8+TF21WbFQhxJaz8Mm4I=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a1d3c5d0688f5f6d;
	Mon, 31 Aug 2026 16:34:40 +0000
X-Mizu-Trace-ID: a1d3c5d0688f5f6d
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
Subject: [PATCH 06/17] KVM: arm64: Add {flush,sync}_hyp_timer_state() primitives
Date: Mon, 31 Aug 2026 17:34:10 +0100
Message-Id: <20260831163421.272420-7-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260831163421.272420-1-fuad.tabba@linux.dev>
References: <20260831163421.272420-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_093442_759678_BA4A86A0 
X-CRM114-Status: GOOD (  12.82  )
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
the state and read back there, so the host cannot change the guest's
deadline. cntvoff_el2 is zeroed, so the guest's virtual time is the
physical time.

The flush also preserves the guest's CNTV and CNTP CVAL/CTL across the
host's full-context copy into the hyp vCPU.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Co-developed-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 39 ++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 14e847b122abf..d4b0f69ff130c 100644
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
@@ -249,7 +276,17 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 		hyp_vcpu->vcpu.arch.iflags = host_vcpu->arch.iflags;
 		flush_debug_state(hyp_vcpu);
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
@@ -264,6 +301,7 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 	hyp_vcpu->vcpu.arch.vsesr_el2 = host_vcpu->arch.vsesr_el2;
 
 	flush_hyp_vgic_state(hyp_vcpu);
+	flush_hyp_timer_state(hyp_vcpu);
 
 	hyp_vcpu->vcpu.arch.pid = host_vcpu->arch.pid;
 
@@ -313,6 +351,7 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu, u32 exit_reason)
 	host_vcpu->arch.hcr_el2 |= hyp_vcpu->vcpu.arch.hcr_el2 & HCR_VSE;
 
 	sync_hyp_vgic_state(hyp_vcpu);
+	sync_hyp_timer_state(hyp_vcpu);
 
 	hyp_vcpu->exit_code = exit_reason;
 }
-- 
2.39.5


