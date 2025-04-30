Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356EBC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 11:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BY+96U3MUWU5xMA2YW5K+WIC5Q30C4VSmYQy0STYdHU=; b=tewYw1tZ0zb66D9PwQHHqKvB8t
	uNzPfFfEwK6DWLdDbF3kPedqqDi/yJ6HTAQCuzkBK6wMSSW9nZc6brEMs+W5vO3CFHApq4oL9JZ5g
	3vRbjKutzzLw/kP1b5JsJK737wu2AOVRDMZkwuCbZ/ZPGxqycjCud8S4C1KhSZnKTPBSBtSDlZHRs
	nNK/UUUVBin4Jf/mURHDpbq4oNuOdwZVHk5pAZHf8fB0ozXufMX6prpdww5nFYAdJKiX+qNUJHrzd
	Sm3qMm/KDihsaR9C3AMl8A9MDe1hzLRNZL90/2/Bf+yiokVL/1TcDTTR2vN+WpuzneHWv7BNw1Q5o
	t5W3BGog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA5oM-0000000Cipi-3twI;
	Wed, 30 Apr 2025 11:41:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA5A4-0000000CbsI-3gVX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 10:59:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2069843520;
	Wed, 30 Apr 2025 10:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35149C4CEE9;
	Wed, 30 Apr 2025 10:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746010771;
	bh=EvNCdJifATrWMosi0Tutk55nsBoDQ72JnliULEibsHU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bai2WMSraQ78mR2cpZOhd+yrTnBVW0N6PcSt0X4pOHuYMClADl/iBbyD4Y+k7RdKJ
	 xELjRg3fhIWGuQs8z/Fnnw0cds6zIVjeE75yuYoBjInHYFKUvgV6AlyLH+rUS0i3qU
	 R4YgW4mCw02ycVzBgThP6pOsV59awSyiQ1eyufMKu2Jb64nkDqkVCsPmhiF0a8ISKC
	 EJ+LR96UA79JOeto2R9ArZTr30sRIhscDzhEqwYaT+ul6iqIlUmq/6lmeZNDNcwAf6
	 uIadktTESzIH2zZQmLY0HSyDiU36TVDikOM1wHzSRiwMNeEjxEp3lbQtnVIeUINZgs
	 Jr6s+QXQe7HUA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uA5A1-00AFD9-8C;
	Wed, 30 Apr 2025 11:59:29 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] KVM: arm64: Properly save/restore HCRX_EL2
Date: Wed, 30 Apr 2025 11:59:15 +0100
Message-Id: <20250430105916.3815157-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250430105916.3815157-1-maz@kernel.org>
References: <20250430105916.3815157-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_035933_032906_47A17117 
X-CRM114-Status: GOOD (  14.20  )
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

Rather than restoring HCRX_EL2 to a fixed value on vcpu exit,
perform a full save/restore of the register, ensuring that
we don't lose bits that would have been set at some point in
the host kernel lifetime, such as the GCSEn bit.

Fixes: ff5181d8a2a82 ("arm64/gcs: Provide basic EL2 setup to allow GCS usage at EL0 and EL1")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index b741ea6aefa58..96f625dc72566 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -235,6 +235,8 @@ static inline void __deactivate_traps_mpam(void)
 
 static inline void __activate_traps_common(struct kvm_vcpu *vcpu)
 {
+	struct kvm_cpu_context *hctxt = host_data_ptr(host_ctxt);
+
 	/* Trap on AArch32 cp15 c15 (impdef sysregs) accesses (EL1 or EL0) */
 	write_sysreg(1 << 15, hstr_el2);
 
@@ -245,11 +247,8 @@ static inline void __activate_traps_common(struct kvm_vcpu *vcpu)
 	 * EL1 instead of being trapped to EL2.
 	 */
 	if (system_supports_pmuv3()) {
-		struct kvm_cpu_context *hctxt;
-
 		write_sysreg(0, pmselr_el0);
 
-		hctxt = host_data_ptr(host_ctxt);
 		ctxt_sys_reg(hctxt, PMUSERENR_EL0) = read_sysreg(pmuserenr_el0);
 		write_sysreg(ARMV8_PMU_USERENR_MASK, pmuserenr_el0);
 		vcpu_set_flag(vcpu, PMUSERENR_ON_CPU);
@@ -269,6 +268,7 @@ static inline void __activate_traps_common(struct kvm_vcpu *vcpu)
 			hcrx &= ~clr;
 		}
 
+		ctxt_sys_reg(hctxt, HCRX_EL2) = read_sysreg_s(SYS_HCRX_EL2);
 		write_sysreg_s(hcrx, SYS_HCRX_EL2);
 	}
 
@@ -278,19 +278,18 @@ static inline void __activate_traps_common(struct kvm_vcpu *vcpu)
 
 static inline void __deactivate_traps_common(struct kvm_vcpu *vcpu)
 {
+	struct kvm_cpu_context *hctxt = host_data_ptr(host_ctxt);
+
 	write_sysreg(*host_data_ptr(host_debug_state.mdcr_el2), mdcr_el2);
 
 	write_sysreg(0, hstr_el2);
 	if (system_supports_pmuv3()) {
-		struct kvm_cpu_context *hctxt;
-
-		hctxt = host_data_ptr(host_ctxt);
 		write_sysreg(ctxt_sys_reg(hctxt, PMUSERENR_EL0), pmuserenr_el0);
 		vcpu_clear_flag(vcpu, PMUSERENR_ON_CPU);
 	}
 
 	if (cpus_have_final_cap(ARM64_HAS_HCX))
-		write_sysreg_s(HCRX_HOST_FLAGS, SYS_HCRX_EL2);
+		write_sysreg_s(ctxt_sys_reg(hctxt, HCRX_EL2), SYS_HCRX_EL2);
 
 	__deactivate_traps_hfgxtr(vcpu);
 	__deactivate_traps_mpam();
-- 
2.39.2


