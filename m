Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C17EC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 14:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmT1bihGrS//iiS75fzOSn6ELkdKnoqnpmEeTg6aJoE=; b=EFWhK9n8vL1ohsC6jbxlXcOb0Q
	3kyY5VKCCPRU7cUAYoAHo2+GJ0POGfr/R6bxjdDEvD6hLArxGndWbUOcxYEJcyJZMrnLzorlkzOBG
	iRkO1bPqCC4DTZHOw//RK1xSZE2wtpgrp9hCbsd7UjTjVZvh9TkO90CF6k30xGNrc2QWa+WxYPVVe
	wVmrPOvXVJnYIthFdBDOp+bBDbhuu5+pw7HfS4f4i0AV3H+zs1UM+O3baETQNbGnTYqWPbDb4nUI1
	VJmkujGdDswRNPJ1gU+ghzV06vwnIrSP066Q3NljqcornYV3bjjrbMz67qVTFOraaD+57vIZiG/L1
	dVbfjoMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0dC-0000000F9Cu-3IQS;
	Wed, 15 Jul 2026 14:30:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0d2-0000000F92q-3zIg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 14:30:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72F14153B;
	Wed, 15 Jul 2026 07:30:23 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2BAA13F93E;
	Wed, 15 Jul 2026 07:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784125827; bh=LrO5HmU/ibLzJRg9BZGCtuLiyBzz5qn2yu+Rs6vdwr0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NgKFafBpcNrozMkY3ZI3/MZOZv9KSw3iCP9c41LG+bwRNeaAbG51H2DB03FRw2JGC
	 xIuEQSWuyIM/P3d9N0EYNrn7jHu6Zjo5aNYzXvK5W3vFaprTARBttRJ1ofUvPV4rtm
	 7ffTpuO8lsRacLCbKDyyrE7IqbLKtmrXu82CFIgw=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH v15 19/37] KVM: arm64: CCA: Activate realms on first vCPU run
Date: Wed, 15 Jul 2026 15:28:21 +0100
Message-ID: <20260715142841.80544-20-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715142841.80544-1-steven.price@arm.com>
References: <20260715142841.80544-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_073029_184641_A97F1328 
X-CRM114-Status: GOOD (  14.33  )
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

Use kvm_arch_vcpu_run_pid_change() to check if this is the first time
the realm guest has run. If this is the first run then activate the
realm.

Signed-off-by: Steven Price <steven.price@arm.com>

---
Changes since v12:
 * Fix commit message
 * Change realm_state checks to be >= REALM_STATE_ACTIVE to avoid a dead
   guest being revived by kvm_activate_realm().
---
 arch/arm64/include/asm/kvm_rmi.h |  1 +
 arch/arm64/kvm/arm.c             |  6 +++++
 arch/arm64/kvm/rmi.c             | 45 ++++++++++++++++++++++++++++++--
 3 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
index 5461c49bea4d..5cb99c187202 100644
--- a/arch/arm64/include/asm/kvm_rmi.h
+++ b/arch/arm64/include/asm/kvm_rmi.h
@@ -96,6 +96,7 @@ void kvm_init_rmi(void);
 u32 kvm_rmm_ipa_limit(void);
 
 int kvm_init_realm(struct kvm *kvm);
+int kvm_activate_realm(struct kvm *kvm);
 void kvm_destroy_realm(struct kvm *kvm);
 int kvm_realm_teardown_stage2(struct kvm *kvm);
 void kvm_destroy_rec(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 534d33b7c67a..df33322b8fea 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1034,6 +1034,12 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
 			return ret;
 	}
 
+	if (kvm_is_realm(vcpu->kvm)) {
+		ret = kvm_activate_realm(kvm);
+		if (ret)
+			return ret;
+	}
+
 	mutex_lock(&kvm->arch.config_lock);
 	set_bit(KVM_ARCH_FLAG_HAS_RAN_ONCE, &kvm->arch.flags);
 	mutex_unlock(&kvm->arch.config_lock);
diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index 94776a9262c9..53b5b18f2275 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -687,7 +687,7 @@ static int realm_set_ipa_state(struct kvm_vcpu *vcpu,
 	return ret;
 }
 
-static int __maybe_unused realm_ensure_created(struct kvm *kvm)
+static int realm_ensure_created(struct kvm *kvm)
 {
 	lockdep_assert_held(&kvm->arch.config_lock);
 
@@ -793,7 +793,7 @@ int noinstr kvm_rec_enter(struct kvm_vcpu *vcpu)
 	return ret;
 }
 
-static int __maybe_unused kvm_create_rec(struct kvm_vcpu *vcpu)
+static int kvm_create_rec(struct kvm_vcpu *vcpu)
 {
 	struct user_pt_regs *vcpu_regs = vcpu_gp_regs(vcpu);
 	unsigned long mpidr = kvm_vcpu_get_mpidr_aff(vcpu);
@@ -893,6 +893,47 @@ void kvm_destroy_rec(struct kvm_vcpu *vcpu)
 	rec->rec_page = NULL;
 }
 
+int kvm_activate_realm(struct kvm *kvm)
+{
+	struct realm *realm = &kvm->arch.realm;
+	struct kvm_vcpu *vcpu;
+	unsigned long i;
+	int ret;
+
+	if (kvm_realm_state(kvm) >= REALM_STATE_ACTIVE)
+		return 0;
+
+	if (!irqchip_in_kernel(kvm)) {
+		/* Userspace irqchip not yet supported with realms */
+		return -EOPNOTSUPP;
+	}
+
+	guard(mutex)(&kvm->arch.config_lock);
+	/* Check again with the lock held */
+	if (kvm_realm_state(kvm) >= REALM_STATE_ACTIVE)
+		return 0;
+
+	ret = realm_ensure_created(kvm);
+	if (ret)
+		return ret;
+
+	/* Mark state as dead in case we fail */
+	kvm_set_realm_state(kvm, REALM_STATE_DEAD);
+
+	kvm_for_each_vcpu(i, vcpu, kvm) {
+		ret = kvm_create_rec(vcpu);
+		if (ret)
+			return ret;
+	}
+
+	ret = rmi_realm_activate(virt_to_phys(realm->rd));
+	if (ret)
+		return -ENXIO;
+
+	kvm_set_realm_state(kvm, REALM_STATE_ACTIVE);
+	return 0;
+}
+
 void kvm_destroy_realm(struct kvm *kvm)
 {
 	struct realm *realm = &kvm->arch.realm;
-- 
2.43.0


