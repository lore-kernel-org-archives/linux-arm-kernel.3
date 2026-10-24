Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BB3606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 16:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=el+1Pcvs;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X2Q+YVI4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=W27aSalgzv2Xbhoow/lwveUu1WS93+h0c2znFzv+Gb4=; b=el+1PcvsB2p4UBNT9A3zYtIhdC
	ZLRSPIVU7MUf627pHvK9e+YsTZQK2bB684PznNivOK+VFnhgpkPAvrrbB89MNvUu1u1VwaH4bvsQb
	rZWd++xbfvJM8Pj6neHRFKeggZmnCV2kv56jiOaPiswxIe2SKP6NPnqcYgxzCJTErVFn9JFZfUqlL
	N4sZlz1qKs2DpC538cc8E0pHXnIXjZngtQ10n+gqGgd51EDeFWQAfdo5uLq5VGaPSdSrLP3TH7K80
	lIeRwCzDa8/2BVVrccdCmFsF632yuwQtbe3GrxrN3odpvbNnv0f4fwpGnQ3BBShZ1+2Z3cUwdiMJa
	vfmniPcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKeL8-00000000MRJ-1v9I;
	Sat, 24 Oct 2026 16:11:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKeL5-00000000MQS-1kZw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 16:11:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B0339601DB;
	Sat, 24 Oct 2026 16:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA6BC1F01825;
	Sat, 24 Oct 2026 16:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792858281;
	bh=W27aSalgzv2Xbhoow/lwveUu1WS93+h0c2znFzv+Gb4=;
	h=From:To:Cc:Subject:Date;
	b=X2Q+YVI4JJRsEhbQrDjwlDFBW1bkYeTfu/NVkgbhJQosNuEypKZGkOILmN4DthdpU
	 a3kSC4CnRyy5nN+5jfVJz41vPvG+dT6kP8mgSUPKgwb8cbE7xy2KKYj08Vm5/VC74W
	 wA0ChyCgi01R2pmgS1rKMS7h2P8QISkKN503K3nNbXBSXrQspvLjVPEsSwMR/y6lhM
	 XOrpsP2NLCJZfh4X7yGbhr13dUhSA0bfC2izzxeFrFfcvmvJ+JdlGhBkGpxRPpwQ4s
	 rnOnK451RgnTRfzf06YzPhkq5uQrEcBKD5B844ux7BDfWjWdJaDz9LGbIX8wZMX/Sn
	 Lj7xBvatHsN1Q==
From: Sasha Levin <sashal@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: arm64: selftests: Skip ignored AArch32 ID regs in the failed-run test
Date: Sat, 24 Oct 2026 12:11:18 -0400
Message-ID: <20261024161118.1007472-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

test_idreg_frozen_after_failed_run() checks that changing a feature ID
register after a failed first KVM_RUN is rejected with -EBUSY, and does
so for every register in test_regs.

On a host without AArch32 support at EL0, KVM treats the AArch32 ID
registers as RAZ/WI: aa32_id_visibility() returns REG_RAZ | REG_USER_WI,
and kvm_sys_reg_set_user() ignores the write and returns 0 before
set_id_reg() checks whether the ID registers are final. The test then
fails on the first such register:

  arm64/set_id_regs.c:870: r < 0 && errno == EBUSY
  ID_DFR0_EL1_PerfMon write after failed first run: r=0 errno=16

KernelCI hits this on every run on an AArch64 only GB300 host.

An ignored write leaves the register unchanged, so the ID registers are
still immutable and only the test's expectation is wrong. Skip the
AArch32 ID registers that KVM_ARM_GET_REG_WRITABLE_MASKS reports as not
writable for this VM, which is decided by the same
kvm_supports_32bit_el0() check as the write path. The aarch64_only flag
that test_vm_ftr_id_regs() uses is not a good fit here, as it comes from
the EL0 field of another VM's vCPU, which reads as AArch64 only whenever
that vCPU has EL2 enabled, even on hosts that support AArch32.

Fixes: 00e309933879 ("KVM: arm64: selftests: Check ID regs are immutable after a failed run")
Link: https://d.kernelci.org/test/maestro:6adcad0c55fda50760800a00
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Tested on an AArch64 only GB300 (Neoverse V2) running KernelCI's arm64
build of mainline 5b0764a53235: set_id_regs fails as above without this
change and passes with it (104 pass, 4 skip, 0 fail) in three runs.

This does not change the AArch32 ID register readback issue under nested
virtualization that Itaru reported:
https://lore.kernel.org/all/as8x38o9taXgKZym@sm-arm-grace07/

 .../testing/selftests/kvm/arm64/set_id_regs.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 10849d21c0dd2..c8c9aaf9d7e86 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -815,6 +815,10 @@ static void test_idreg_frozen_after_failed_run(void)
 		SYS_REVIDR_EL1,
 		SYS_AIDR_EL1,
 	};
+	u64 masks[KVM_ARM_FEATURE_ID_RANGE_SIZE];
+	struct reg_mask_range range = {
+		.addr = (__u64)masks,
+	};
 	struct kvm_vcpu_init init;
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
@@ -831,6 +835,7 @@ static void test_idreg_frozen_after_failed_run(void)
 
 	vm = vm_create(1);
 	vm_enable_cap(vm, KVM_CAP_ARM_WRITABLE_IMP_ID_REGS, 0);
+	vm_ioctl(vm, KVM_ARM_GET_REG_WRITABLE_MASKS, &range);
 	kvm_get_default_vcpu_target(vm, &init);
 	init.features[0] |= (1 << KVM_ARM_VCPU_PMU_V3);
 	vcpu = aarch64_vcpu_add(vm, 0, &init, guest_code);
@@ -852,8 +857,18 @@ static void test_idreg_frozen_after_failed_run(void)
 	 */
 	for (int i = 0; i < ARRAY_SIZE(test_regs); i++) {
 		const struct reg_ftr_bits *ftr_bits = test_regs[i].ftr_bits;
-		u64 reg = KVM_ARM64_SYS_REG(test_regs[i].reg);
-		u64 val = vcpu_get_reg(vcpu, reg);
+		u32 reg_id = test_regs[i].reg;
+		u64 reg = KVM_ARM64_SYS_REG(reg_id);
+		u64 val;
+
+		/*
+		 * KVM ignores writes to the AArch32 ID registers when it can't
+		 * expose AArch32 EL0, and reports them as not writable.
+		 */
+		if (sys_reg_CRm(reg_id) < 4 && !masks[encoding_to_range_idx(reg_id)])
+			continue;
+
+		val = vcpu_get_reg(vcpu, reg);
 
 		for (int j = 0; ftr_bits[j].type != FTR_END; j++) {
 			u64 ftr = (val & ftr_bits[j].mask) >> ftr_bits[j].shift;
-- 
2.53.0


