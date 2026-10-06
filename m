Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F9FCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 09:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bq2Zd4FEd+reyPiRN7kTRwXnMuIiFrgQ/RnbujYfkYI=; b=D+z3DzSYbDes/I/yRhH81U/BGL
	M/1zd3BF1B+j41vgx8Gk2e4VvbXONtCGxLde5LkRaAr6kqZhUauhrPaDrdJFi3hTpruLwO0m/0oLj
	tZI8yj17I3n0VV+3al2jEl5fLQn0V5qqH5PP9ozU0F99ROoCADc5WW7zSRcyX5GpnrnO4dn2pKNTo
	tZXCsJujuEUrGjNMjUK/KlLqXH1KZIziX3QZn1Lo7SxnTD2Fh1NYKKM9jxVHfTolFX5eZZXuEfTZA
	rBkMny9M1lwUbgRvDpddAA5ZsaIFuzMc9b5JeWcyJWGM3D6gfHMT35O7u0wP7OdpnACZQpg71qM5C
	JehHn5vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1TS-00000000Nmb-2tC5;
	Tue, 06 Oct 2026 09:28:38 +0000
Received: from out-142.mta0.migadu.com ([2001:41d0:1004:224b::8e] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1TP-00000000NlB-2zAw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 09:28:38 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=v3T3fBb11/yU7ppCqF5TMod7CuvBDECZxjrjNXI8Y9o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791278911; v=1; x=1791883711;
 b=PsL7JxdfWqBr55wQ/rfIOw4yeUv7YZfEcRTuZv6UWuOkukydRyHYSD4gkVKv7DQiedOLNLOz
 z2q2qFK5yPord/fz9SKjajpvJNe5mUsb5ZM5ysIYnWJyCRFF4wL+HfWBbyELn+muClp7s4R6Uza
 OvUfE6wlMvQzBZ5N4MTC+/rc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 913d3b9294e19705;
	Tue, 06 Oct 2026 09:28:30 +0000
X-Mizu-Trace-ID: 913d3b9294e19705
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
	vdonnefort@google.com,
	qperret@google.com,
	mark.rutland@arm.com,
	tabba@google.com
Subject: [PATCH v2] KVM: arm64: Mask SErrors in a protected vCPU's host copy at first run
Date: Tue,  6 Oct 2026 10:28:26 +0100
Message-Id: <20261006092826.2201763-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_022835_890852_525A70B3 
X-CRM114-Status: GOOD (  10.65  )
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

The host's copy of a protected vCPU has SErrors masked from reset, so a
host-injected SError is pended through HCR_EL2.VSE and the guest takes
it when it unmasks SErrors. However, the VMM can unmask SErrors in that
copy before the first run, through PSTATE.A or SCTLR2_EL1.NMEA. KVM
then emulates the SError's entry on the host copy, and the guest never
takes it as an SError. Exits that copy PSTATE out set PSTATE.A again,
but nothing clears NMEA. With NMEA set, an SError injected after a
KVM_RUN that completes an MMIO access but returns before entering the
guest also trips WARN_ON(INCREMENT_PC).

Mask SErrors in the host copy when the first run creates the hyp vCPU,
after which KVM_SET_ONE_REG is rejected. An SError injected before then
is still emulated, but only writes registers the VMM can set itself.

Fixes: 872383bd12e11 ("KVM: arm64: Add per-EC entry/exit state marshalling for protected guests")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20261001142109.794CA1F000FF@smtp.kernel.org/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
v2:
 - Set PSTATE.A and clear SCTLR2_EL1.NMEA in the host copy when the hyp
   vCPU is created, instead of testing vcpu_is_protected() in
   kvm_inject_serror_esr() (Marc).

Applies on kvmarm/next. A follow-up to "KVM: arm64: Confine protected VM
vCPU state to EL2" [1], from Sashiko's review of its v4 patch 12.

v1: https://lore.kernel.org/r/20261005050352.836980-1-fuad.tabba@linux.dev/
[1] https://lore.kernel.org/all/20261001135711.1640520-1-fuad.tabba@linux.dev/

 arch/arm64/kvm/pkvm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index d4822d8bb16b8..49973c689789f 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -191,12 +191,18 @@ static int __pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
 	/*
 	 * Mirror EL2's seeding of power_state from mp_state. The hyp vCPU is
 	 * published, so take mp_state_lock against kvm_psci_vcpu_on().
+	 *
+	 * EL2 never reads the VMM's PSTATE or SCTLR2_EL1: undo any unmasking
+	 * so that a host SError is pended through HCR_EL2.VSE.
 	 */
 	if (vcpu_is_protected(vcpu)) {
 		spin_lock(&vcpu->arch.mp_state_lock);
 		if (kvm_arm_vcpu_stopped(vcpu))
 			WRITE_ONCE(vcpu->arch.mp_state.mp_state, KVM_MP_STATE_UNINITIALIZED);
 		spin_unlock(&vcpu->arch.mp_state_lock);
+
+		*vcpu_cpsr(vcpu) |= PSR_A_BIT;
+		__vcpu_rmw_sys_reg(vcpu, SCTLR2_EL1, &=, ~SCTLR2_EL1_NMEA);
 	}
 
 	vcpu_set_flag(vcpu, VCPU_PKVM_FINALIZED);

base-commit: fa22cd9947fc245d71bc40482f7f78eb0d5a4af0
-- 
2.39.5


