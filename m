Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477B6C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 15:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCfh+MEyEtcot8hd46rxJtRt2vOT5JMsSl8Rt04xEmU=; b=zrWyCPW7RAYZ3526OulbVgEvgB
	uOxxWSBNvtZI+vUNi1GeRds80Jpe5AUdaK/DDPEk3bF/hfN/WPO9wZC7IUQjgxTV4f0uclYNki6Yu
	XjJ6l89s59oSyjo+THJU5NkQSFOFXFVetmnJ1fXF075Lw0a1TPf8heENpI4QotNmQrMLyZ3OssYZc
	G+Uve1srP4fMK/wP3zhhGV16Mj0V+f+w00zz+qH1h5GqLob+A7MSgiQLMrJbcA4CtxFHCtMWOIa86
	Bt1rFCr8HS/yra2dT+sQVpbrcMe8bBRD8zLgRj1YFUNgnwTvdUjd4cqeqosDXVia+0uvDNLn09Rci
	wv/sdo5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjJvq-00000000J4Z-2gOB;
	Sat, 15 Feb 2025 15:18:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjJgD-00000000H2c-2p4m
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 15:02:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 106C05C5415;
	Sat, 15 Feb 2025 15:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323BBC4CEDF;
	Sat, 15 Feb 2025 15:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739631723;
	bh=PpoF2F+1+wn+5ob8I5NtW1ySbrqpV7c5zsFC4HILuKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VW6bEWVhseSajhayzaAGS7lxFOgbpxRKhYnzuy6LNN2/KwoiLKl67/RWj46YH2WWk
	 1JpRW4ZtqPVIE2U45QRcPexbeZFPrtu6wKHe5tq1b6O35UcaWc3IWIQ8IYJPioLi3K
	 TZ0hCiJUAUHQf6Nql2TE9PC35e4QEylPSHLheXCgY1LDsu7hcBhxAEUeIQuLTYIwQB
	 TM4b25Z9BhRT0R3eejKudxMq6P+5zyg3ElMug5RxziE3CkXewLQCZk8B4kNEAKRjt+
	 j3h0/Y8qfJ1IprSiuDABskclpBHx1Pi3mlF0YMTMBtPW8xGeKBWSOq6tjiFARUyKGc
	 OFxGxpw1B05aA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tjJg9-004Nz6-Bw;
	Sat, 15 Feb 2025 15:02:01 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 06/14] KVM: arm64: nv: Don't adjust PSTATE.M when L2 is nesting
Date: Sat, 15 Feb 2025 15:01:26 +0000
Message-Id: <20250215150134.3765791-7-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250215150134.3765791-1-maz@kernel.org>
References: <20250215150134.3765791-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_070205_824485_41F0EB0D 
X-CRM114-Status: GOOD (  18.00  )
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

We currently check for HCR_EL2.NV being set to decide whether we
need to repaint PSTATE.M to say EL2 instead of EL1 on exit.

However, this isn't correct when L2 is itself a hypervisor, and
that L1 as set its own HCR_EL2.NV. That's because we "flatten"
the state and inherit parts of the guest's own setup. In that case,
we shouldn't adjust PSTATE.M, as this is really EL1 for both us
and the guest.

Instead of trying to try and work out how we ended-up with HCR_EL2.NV
being set by introspecting both the host and guest states, use
a per-CPU flag to remember the context (HYP or not), and use that
information to decide whether PSTATE needs tweaking.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h |  1 +
 arch/arm64/kvm/hyp/vhe/switch.c   | 22 ++++++++++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7cfa024de4e34..519023dad3b47 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -619,6 +619,7 @@ struct kvm_host_data {
 #define KVM_HOST_DATA_FLAG_HOST_SME_ENABLED		3
 #define KVM_HOST_DATA_FLAG_TRBE_ENABLED			4
 #define KVM_HOST_DATA_FLAG_EL1_TRACING_CONFIGURED	5
+#define KVM_HOST_DATA_FLAG_VCPU_IN_HYP_CONTEXT		6
 	unsigned long flags;
 
 	struct kvm_cpu_context host_ctxt;
diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index b5b9dbaf1fdd6..3453fb76cf0e3 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -53,13 +53,23 @@ static u64 __compute_hcr(struct kvm_vcpu *vcpu)
 	if (!vcpu_has_nv(vcpu))
 		return hcr;
 
+	/*
+	 * We rely on the invariant that a vcpu entered from HYP
+	 * context must also exit in the same context, as only an ERET
+	 * instruction can kick us out of it, and we obviously trap
+	 * that sucker. PSTATE.M will get fixed-up on exit.
+	 */
 	if (is_hyp_ctxt(vcpu)) {
+		host_data_set_flag(VCPU_IN_HYP_CONTEXT);
+
 		hcr |= HCR_NV | HCR_NV2 | HCR_AT | HCR_TTLB;
 
 		if (!vcpu_el2_e2h_is_set(vcpu))
 			hcr |= HCR_NV1;
 
 		write_sysreg_s(vcpu->arch.ctxt.vncr_array, SYS_VNCR_EL2);
+	} else {
+		host_data_clear_flag(VCPU_IN_HYP_CONTEXT);
 	}
 
 	return hcr | (__vcpu_sys_reg(vcpu, HCR_EL2) & ~NV_HCR_GUEST_EXCLUDE);
@@ -545,11 +555,16 @@ static const exit_handler_fn *kvm_get_exit_handler_array(struct kvm_vcpu *vcpu)
 
 static void early_exit_filter(struct kvm_vcpu *vcpu, u64 *exit_code)
 {
+	if (!vcpu_has_nv(vcpu))
+		return;
+
 	/*
 	 * If we were in HYP context on entry, adjust the PSTATE view
-	 * so that the usual helpers work correctly.
+	 * so that the usual helpers work correctly. This enforces our
+	 * invariant that the guest's HYP context status is preserved
+	 * across a run.
 	 */
-	if (vcpu_has_nv(vcpu) && (read_sysreg(hcr_el2) & HCR_NV)) {
+	if (unlikely(host_data_test_flag(VCPU_IN_HYP_CONTEXT))) {
 		u64 mode = *vcpu_cpsr(vcpu) & (PSR_MODE_MASK | PSR_MODE32_BIT);
 
 		switch (mode) {
@@ -564,6 +579,9 @@ static void early_exit_filter(struct kvm_vcpu *vcpu, u64 *exit_code)
 		*vcpu_cpsr(vcpu) &= ~(PSR_MODE_MASK | PSR_MODE32_BIT);
 		*vcpu_cpsr(vcpu) |= mode;
 	}
+
+	/* Apply extreme paranoia! */
+	BUG_ON(!!host_data_test_flag(VCPU_IN_HYP_CONTEXT) != is_hyp_ctxt(vcpu));
 }
 
 /* Switch to the guest for VHE systems running in EL2 */
-- 
2.39.2


