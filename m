Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A77C61DB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 09:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnCwx03JgQXwioyFfEoHMY4nfzS6MdCelCe2YAVbHP0=; b=rlnXZdbVMyhgH/ofstxXuZszYD
	C8nYvvBZo/dOaTHvtiFbZ8jLIF7jutO9u8qr01f+hJkvPqyU9feK0hf0ULrBU0INuXbYMjsm0T5Jm
	eFnjw1GVFdRd2c/a+oiIU+bDTIYnqmGvlJXDByPBsfPOUUUc2tKcPcuCFBzIH323suY1st2+qCHTv
	mZgWj33AtojNTzQCtLp5D3945jLA90jfNXMpv1eRYCrLo14ux7yZRIjydMBtpYb9HHM4QH/Tic7f3
	uKWWCyqeCVK2XItTQYGl3z/a0I8G05lWO/Z0un0M+PyYosNL/RDOY6qI7ngY3/a2KJSBo/P7EVQcK
	89UOjZ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyn0o-00000000RS2-0Tpr;
	Tue, 25 Aug 2026 09:00:06 +0000
Received: from out-146.mta0.migadu.com ([91.218.175.146] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyn0l-00000000RQU-0frl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 09:00:05 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=k4w2yytoDHZE0wCz7242BNWe7ZWxIERicnhL5Vmij0I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787648400; v=1; x=1788253200;
 b=l0jglARLlnQBxD+OijYoGIoFq9pxQ9aQlpAkcAHwS56fR1guDG4LBWY7cl9Cxf++2Oto5K4E
 EChzzSdPqNQ+6+Qyp9MrrvoGO1F9LEl8EKXH2TdIzWTAxgNVN2Moer3fBbKQrCe5JoQpc3pzyXx
 NyhCz91AjJkgTDeTacU75inw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from claudy.local (2a01:4b00:ad36:1d00:3a05:25ff:fe33:35a9)
	by smtp.migadu.com with ESMTPS id c08eced77c6b2cfb;
	Tue, 25 Aug 2026 09:00:00 +0000
X-Mizu-Trace-ID: c08eced77c6b2cfb
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
	Quentin Perret <qperret@google.com>,
	Stefan Teodorescu <fane@google.com>,
	tabba@google.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] KVM: arm64: Derive GUEST_HAS_SVE from the SVE feature bit at EL2
Date: Tue, 25 Aug 2026 09:59:48 +0100
Message-Id: <20260825085948.1674721-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260825085948.1674721-1-fuad.tabba@linux.dev>
References: <20260825085948.1674721-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_020004_198552_96794454 
X-CRM114-Status: GOOD (  10.75  )
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

pkvm_init_features_from_host() takes KVM_ARCH_FLAG_GUEST_HAS_SVE and
KVM_ARM_VCPU_SVE from the host separately, but pkvm_vcpu_init_sve()
tests the bit while vcpu_has_sve() reads the flag. A host that sets the
flag without the bit gets a vCPU with a NULL sve_state that the world
switch loads the guest's SVE state from.

Derive the flag from the bit, and drop the protected path's copy of the
host's flag, which is dead code since protected VMs are not allowed SVE.

Fixes: 41d6028e28bd ("KVM: arm64: Convert the SVE guest vcpu flag to a vm flag")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 1d8cc984fb88c..6efca70e5f5a9 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -360,7 +360,7 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 		if (test_bit(KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS, &host_arch_flags))
 			hyp_vm->kvm.arch.midr_el1 = host_kvm->arch.midr_el1;
 
-		return;
+		goto out;
 	}
 
 	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_MTE))
@@ -379,13 +379,14 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_PTRAUTH_GENERIC))
 		set_bit(KVM_ARM_VCPU_PTRAUTH_GENERIC, allowed_features);
 
-	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_SVE)) {
+	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_SVE))
 		set_bit(KVM_ARM_VCPU_SVE, allowed_features);
-		kvm->arch.flags |= host_arch_flags & BIT(KVM_ARCH_FLAG_GUEST_HAS_SVE);
-	}
 
 	bitmap_and(kvm->arch.vcpu_features, host_kvm->arch.vcpu_features,
 		   allowed_features, KVM_VCPU_MAX_FEATURES);
+out:
+	__assign_bit(KVM_ARCH_FLAG_GUEST_HAS_SVE, &kvm->arch.flags,
+		     kvm_vcpu_has_feature(kvm, KVM_ARM_VCPU_SVE));
 }
 
 static void unpin_host_vcpu(struct kvm_vcpu *host_vcpu)
-- 
2.39.5


