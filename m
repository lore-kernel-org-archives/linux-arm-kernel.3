Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505EF606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oRB+pz5A;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=C8wTTWMq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=iqtjYzgu2I1Hylg8Qdsswr/+z0+QJovnigJsnMXHcB0=; b=oRB+pz5ATOkhRTG1Z/L7d+JXpI
	vanP3TMPNoXk0sTxUCXEfNZOSAuKRWHmT2J0sclmmVFdjjgo+fq3dyNP19F2xDWCjf8qbhtGQmY7B
	PKGIhsIl/o1U8L+gESHdggenfe+QMAFvIt6hz10uf3ZCgnPot55grM21inzpV5zC67ckOVnGI2XyC
	48XNqzisr9cxp9QqO30QwKlPBOmGLnoey6bFy6MHMugc/v1Wnk0E/6JRKDD8yYkURstSKGoK9OD7e
	jygpdzhLdUp/XL5hHBsdTjvWu3aY3qRAvk/w8G+9wbgcvtxAEAvDEw50ZULSONDZCBbcOhyhD+zCV
	4X0VlhLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBh4-00000001yOU-3IJg;
	Tue, 03 Nov 2026 10:24:42 +0000
Received: from out-62.mta1.migadu.com ([95.215.58.62] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBh1-00000001yO9-45Bt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:24:41 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=VkGYg50QptEgAf+1QC8qCKNvD4ydGpa/wOII2vh6grI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793701477; v=1; x=1794306277;
 b=C8wTTWMqhQK3fXLRmjnTuBXUHcsLeAAWYNwujf9BzhO5XJbMOl/H5lB8Gqvx3tK+VW7aJUw6
 WueGjPcDi3FGZz/T3fHF6gl942L3J96tg/FrexwkgZdz3AS5fK8UPOzv6TZBUfuRT4zTQEeltRj
 qHgMH4B9/6opc0b01MXJF5ww=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id eca278e05c33fc76;
	Tue, 03 Nov 2026 10:24:37 +0000
X-Mizu-Trace-ID: eca278e05c33fc76
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2] KVM: arm64: nv: Size nested stage-2 MMUs by the NV PARange cap
Date: Tue,  3 Nov 2026 10:24:36 +0000
Message-ID: <20261103102436.1605347-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_022440_517149_6C863ED7 
X-CRM114-Status: GOOD (  15.13  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

KVM caps the PARange it exposes to an NV guest at 48 bits, but sizes
the nested stage-2 MMUs with kvm_get_pa_bits(), which returns the host's
IPA limit.

On a 52-bit host, every TLBI ALLE1IS from the guest hypervisor then has
KVM unmap each valid nested stage-2 across a range 16 times the one the
guest can use. Under QEMU, the KVM init of an E2H0 guest hypervisor
doesn't complete within 20 minutes.

Make kvm_get_pa_bits() return the 48-bit cap for an NV VM, and bound the
walks KVM does on the guest's behalf by it rather than by the host's IPA
limit. Have kvm_handle_guest_abort() inject its address size fault above
the cap too, so that an L2 access above 48 bits doesn't get an SEA from
the smaller nested MMU. If userspace gave the NV VM an IPA size above 48
bits, an L1 access above 48 bits then also gets the address size fault,
instead of normal stage-2 handling.

Fixes: 4f128f8e1aaac ("KVM: arm64: nv: Support multiple nested Stage-2 mmu structures")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    Changes since v1 [1]:
    - Fold in the kvm_handle_guest_abort() change from my reply to
      Sashiko, so that an L2 access above 48 bits gets an address size
      fault rather than an SEA.
    - Bound setup_s1_walk() and setup_s2_walk() by kvm_get_pa_bits()
      rather than by the host's IPA limit (Wei-Lin).
    
    The 48 is written here and in limit_nv_id_reg(). I couldn't derive
    it from the VM's ID_AA64MMFR0_EL1, since the nested MMUs are created
    in kvm_setup_vcpu(), before kvm_reset_vcpu() initialises the VM's ID
    registers. Userspace can also lower PARange afterwards.
    
    Based on v7.4-rc1.
    
    [1] https://lore.kernel.org/all/20261030105139.3543230-1-fuad.tabba@linux.dev/

 arch/arm64/kvm/at.c     | 2 +-
 arch/arm64/kvm/mmu.c    | 4 ++--
 arch/arm64/kvm/nested.c | 3 +--
 arch/arm64/kvm/reset.c  | 4 ++++
 4 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 30d8f062b2c29..69bc621226cc2 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -383,7 +383,7 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 	ps = (wi->regime == TR_EL2 ?
 	      FIELD_GET(TCR_EL2_PS_MASK, tcr) : FIELD_GET(TCR_IPS_MASK, tcr));
 
-	wi->max_oa_bits = min(get_kvm_ipa_limit(), ps_to_output_size(ps, wi->pa52bit));
+	wi->max_oa_bits = min(kvm_get_pa_bits(vcpu->kvm), ps_to_output_size(ps, wi->pa52bit));
 
 	/* Compute minimal alignment */
 	x = 3 + ia_bits - ((3 - wi->sl) * stride + wi->pgshift);
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1db10d8d6db73..620fc6d1674bc 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2440,8 +2440,8 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 	is_iabt = esr_trap_is_iabt(esr);
 
 	if (esr_fsc_is_translation_fault(esr)) {
-		/* Beyond sanitised PARange (which is the IPA limit) */
-		if (fault_ipa >= BIT_ULL(get_kvm_ipa_limit())) {
+		/* Beyond the VM's PA limit */
+		if (fault_ipa >= BIT_ULL(kvm_get_pa_bits(kvm))) {
 			kvm_inject_size_fault(vcpu);
 			return 1;
 		}
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 4d83281a7a28b..a04ba4bf30a40 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -491,8 +491,7 @@ static void setup_s2_walk(struct kvm_vcpu *vcpu, struct s2_walk_info *wi)
 	wi->t0sz = vtcr & VTCR_EL2_T0SZ_MASK;
 	wi->pgshift = vtcr_to_tg0_pgshift(vcpu->kvm, vtcr);
 	wi->sl = FIELD_GET(VTCR_EL2_SL0_MASK, vtcr);
-	/* Global limit for now, should eventually be per-VM */
-	wi->max_oa_bits = min(get_kvm_ipa_limit(),
+	wi->max_oa_bits = min(kvm_get_pa_bits(vcpu->kvm),
 			      ps_to_output_size(FIELD_GET(VTCR_EL2_PS_MASK, vtcr), false));
 	wi->ha = vtcr & VTCR_EL2_HA;
 	wi->be = vcpu_read_sys_reg(vcpu, SCTLR_EL2) & SCTLR_ELx_EE;
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 10eb7249aa9e8..1918837757682 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -220,6 +220,10 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 
 u32 kvm_get_pa_bits(struct kvm *kvm)
 {
+	/* An NV guest's PARange is capped by limit_nv_id_reg() */
+	if (test_bit(KVM_ARM_VCPU_HAS_EL2, kvm->arch.vcpu_features))
+		return min(kvm_ipa_limit, 48U);
+
 	/* Fixed limit until we can configure ID_AA64MMFR0.PARange */
 	return kvm_ipa_limit;
 }

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3


