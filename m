Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095CACAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 21:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2g20CiixGKavOGLKNyQ2qkYwlpIzcS1YH+nuvzs7O38=; b=k+rdnCHpHlRpZZyP74QH08T3//
	t6z7nxIm76qheXImziJcHbxMJYmYGILYrrzTQEs3pOj6bUlN1LabWEl8Uhg0HuB5zTxkrQCOH1Lx0
	2Xcqcd3PnEesQ4ZCmU7FBBCEflbm0jJAM6/OHJmKpPasDQL6E3GhEoT5iEZIBpqHgg2nkBEaCwF+C
	ZvEQKkQY9+4HTRKEQHB6pMVan0iXbPa5LvFdmFAGuUTcNRQudH0Lruxwk5Vf/1/8DtB4Q7YgvfHQe
	ZJ/OUzRuxnAF3dV+0CUuNwUNuT7SsSibjqMlkqCzRhU4DDdUQIvp9zvcWMkghiYeSmQIhk/24OSXu
	vKgBMsYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzbU-0000000EsPp-2Xqd;
	Wed, 17 Sep 2025 21:22:16 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzbO-0000000EsFn-2Tjk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 21:22:13 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758144127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2g20CiixGKavOGLKNyQ2qkYwlpIzcS1YH+nuvzs7O38=;
	b=RkhveltuCLEdr/Ea1r66lo+1t+ofYHmhkUWjdn+WV1GH0eTmPX3/Q3jt8Rg2KNjstoG2tF
	lMITCTvZQeOs1Afui8HT2h9Twd9tubC166CFfLRR2+aG6+t6BMmeqloHd+RS1CoS8sBt3l
	VB4mtgsKvAXlpI/ehZUNXk9TLx5KLAY=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [PATCH 12/13] KVM: arm64: selftests: Enable EL2 by default
Date: Wed, 17 Sep 2025 14:20:42 -0700
Message-ID: <20250917212044.294760-13-oliver.upton@linux.dev>
In-Reply-To: <20250917212044.294760-1-oliver.upton@linux.dev>
References: <20250917212044.294760-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_142210_818615_BAB450B6 
X-CRM114-Status: GOOD (  10.80  )
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

Take advantage of VHE to implicitly promote KVM selftests to run at EL2
with only slight modification. Update the smccc_filter test to account
for this now that the EL2-ness of a VM is visible to tests.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 tools/testing/selftests/kvm/arm64/smccc_filter.c   | 14 +++++++++++++-
 .../selftests/kvm/include/arm64/processor.h        |  1 +
 tools/testing/selftests/kvm/lib/arm64/processor.c  | 12 ++++++++++++
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/smccc_filter.c b/tools/testing/selftests/kvm/arm64/smccc_filter.c
index a8e22d866ea7..1763b9d45400 100644
--- a/tools/testing/selftests/kvm/arm64/smccc_filter.c
+++ b/tools/testing/selftests/kvm/arm64/smccc_filter.c
@@ -22,8 +22,20 @@ enum smccc_conduit {
 	SMC_INSN,
 };
 
+static bool test_runs_at_el2(void)
+{
+	struct kvm_vm *vm = vm_create(1);
+	struct kvm_vcpu_init init;
+
+	kvm_get_default_vcpu_target(vm, &init);
+	kvm_vm_free(vm);
+
+	return init.features[0] & BIT(KVM_ARM_VCPU_HAS_EL2);
+}
+
 #define for_each_conduit(conduit)					\
-	for (conduit = HVC_INSN; conduit <= SMC_INSN; conduit++)
+	for (conduit = test_runs_at_el2() ? SMC_INSN : HVC_INSN;	\
+	     conduit <= SMC_INSN; conduit++)
 
 static void guest_main(uint32_t func_id, enum smccc_conduit conduit)
 {
diff --git a/tools/testing/selftests/kvm/include/arm64/processor.h b/tools/testing/selftests/kvm/include/arm64/processor.h
index f037c1bb8e63..b6b86e2cd59c 100644
--- a/tools/testing/selftests/kvm/include/arm64/processor.h
+++ b/tools/testing/selftests/kvm/include/arm64/processor.h
@@ -303,6 +303,7 @@ void wfi(void);
 void test_wants_mte(void);
 void test_disable_default_vgic(void);
 
+bool vm_supports_el2(struct kvm_vm *vm);
 static bool vcpu_has_el2(struct kvm_vcpu *vcpu)
 {
 	return vcpu->init.features[0] & BIT(KVM_ARM_VCPU_HAS_EL2);
diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
index 4339de2fc482..74324915b41e 100644
--- a/tools/testing/selftests/kvm/lib/arm64/processor.c
+++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
@@ -267,11 +267,23 @@ void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 	}
 }
 
+bool vm_supports_el2(struct kvm_vm *vm)
+{
+	const char *value = getenv("NV");
+
+	if (value && *value == '0')
+		return false;
+
+	return vm_check_cap(vm, KVM_CAP_ARM_EL2) && vm->arch.has_gic;
+}
+
 void kvm_get_default_vcpu_target(struct kvm_vm *vm, struct kvm_vcpu_init *init)
 {
 	struct kvm_vcpu_init preferred = {};
 
 	vm_ioctl(vm, KVM_ARM_PREFERRED_TARGET, &preferred);
+	if (vm_supports_el2(vm))
+		preferred.features[0] |= BIT(KVM_ARM_VCPU_HAS_EL2);
 
 	*init = preferred;
 }
-- 
2.47.3


