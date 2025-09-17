Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F58CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 21:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=heQb+iYD8jR8m/89CClYw8LjpM8o65KodnM7TACOfHw=; b=wxG21NMt2We0v9VWbMZUPijx4M
	m0T2kONk2Z/yfw6jQEW/OlqknD+G+H88TLkFq5hXW2PBvvRTBA6EB5XUq5JQmiZx+O0epXSag22Tt
	zq+ZTLSoaRaNNh+c6pmefmjgsBHXAz1HJOKrLOMUKX/zz6OfahxTWgPeQhNeww1k3FEMjGS8SCzqC
	YLFGaZVhF3VKEH7tOXdynJ0DmLUwZ7ikUZ1JE+Xls6bD+OlvglcMcVvKWmGZmtR5f9BSZ/2N8+YOL
	XOuJp/yeMsVl7i7HDTDWvkj86OkDy4uFqLKgsvDREbFziWWjfhX8IwBDgcnF6MSM0Dx53aTHc/psi
	/Wr8pTXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzb7-0000000ErzD-04O9;
	Wed, 17 Sep 2025 21:21:53 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzay-0000000Erm0-3II0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 21:21:47 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758144102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=heQb+iYD8jR8m/89CClYw8LjpM8o65KodnM7TACOfHw=;
	b=LhtXKQxygwRr6p80+WV16dRNpdzx6/AueMYGQg8fwzM98mzk+48gYIM2korn6AarU7T/pZ
	rbPXAHQsr0y5aYuuNary7mcK107C5eO0VODxtcrZsERoxXwCassFYXqv+6a+r3DG+4N020
	SOnwk1JThiZdjkGZI+aN2hRWmK1XI5A=
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
Subject: [PATCH 09/13] KVM: arm64: selftests: Use hyp timer IRQs when test runs at EL2
Date: Wed, 17 Sep 2025 14:20:39 -0700
Message-ID: <20250917212044.294760-10-oliver.upton@linux.dev>
In-Reply-To: <20250917212044.294760-1-oliver.upton@linux.dev>
References: <20250917212044.294760-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_142145_070595_49F51CDF 
X-CRM114-Status: GOOD (  11.09  )
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

Arch timer registers are redirected to their hypervisor counterparts
when running in VHE EL2. This is great, except for the fact that the
hypervisor timers use different PPIs. Use the correct INTIDs when that
is the case.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 .../testing/selftests/kvm/arm64/arch_timer.c  |  6 ++---
 .../kvm/arm64/arch_timer_edge_cases.c         |  6 ++---
 .../selftests/kvm/include/arm64/arch_timer.h  | 24 +++++++++++++++++++
 3 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/arch_timer.c b/tools/testing/selftests/kvm/arm64/arch_timer.c
index c753013319bc..d592a4515399 100644
--- a/tools/testing/selftests/kvm/arm64/arch_timer.c
+++ b/tools/testing/selftests/kvm/arm64/arch_timer.c
@@ -165,10 +165,8 @@ static void guest_code(void)
 static void test_init_timer_irq(struct kvm_vm *vm)
 {
 	/* Timer initid should be same for all the vCPUs, so query only vCPU-0 */
-	vcpu_device_attr_get(vcpus[0], KVM_ARM_VCPU_TIMER_CTRL,
-			     KVM_ARM_VCPU_TIMER_IRQ_PTIMER, &ptimer_irq);
-	vcpu_device_attr_get(vcpus[0], KVM_ARM_VCPU_TIMER_CTRL,
-			     KVM_ARM_VCPU_TIMER_IRQ_VTIMER, &vtimer_irq);
+	ptimer_irq = vcpu_get_ptimer_irq(vcpus[0]);
+	vtimer_irq = vcpu_get_vtimer_irq(vcpus[0]);
 
 	sync_global_to_guest(vm, ptimer_irq);
 	sync_global_to_guest(vm, vtimer_irq);
diff --git a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
index 5c60262f4c2e..91906414a474 100644
--- a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
+++ b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
@@ -924,10 +924,8 @@ static void test_run(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 
 static void test_init_timer_irq(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 {
-	vcpu_device_attr_get(vcpu, KVM_ARM_VCPU_TIMER_CTRL,
-			     KVM_ARM_VCPU_TIMER_IRQ_PTIMER, &ptimer_irq);
-	vcpu_device_attr_get(vcpu, KVM_ARM_VCPU_TIMER_CTRL,
-			     KVM_ARM_VCPU_TIMER_IRQ_VTIMER, &vtimer_irq);
+	ptimer_irq = vcpu_get_ptimer_irq(vcpu);
+	vtimer_irq = vcpu_get_vtimer_irq(vcpu);
 
 	sync_global_to_guest(vm, ptimer_irq);
 	sync_global_to_guest(vm, vtimer_irq);
diff --git a/tools/testing/selftests/kvm/include/arm64/arch_timer.h b/tools/testing/selftests/kvm/include/arm64/arch_timer.h
index bf461de34785..e2c4e9f0010f 100644
--- a/tools/testing/selftests/kvm/include/arm64/arch_timer.h
+++ b/tools/testing/selftests/kvm/include/arm64/arch_timer.h
@@ -155,4 +155,28 @@ static inline void timer_set_next_tval_ms(enum arch_timer timer, uint32_t msec)
 	timer_set_tval(timer, msec_to_cycles(msec));
 }
 
+static inline u32 vcpu_get_vtimer_irq(struct kvm_vcpu *vcpu)
+{
+	u32 intid;
+	u64 attr;
+
+	attr = vcpu_has_el2(vcpu) ? KVM_ARM_VCPU_TIMER_IRQ_HVTIMER :
+				    KVM_ARM_VCPU_TIMER_IRQ_VTIMER;
+	vcpu_device_attr_get(vcpu, KVM_ARM_VCPU_TIMER_CTRL, attr, &intid);
+
+	return intid;
+}
+
+static inline u32 vcpu_get_ptimer_irq(struct kvm_vcpu *vcpu)
+{
+	u32 intid;
+	u64 attr;
+
+	attr = vcpu_has_el2(vcpu) ? KVM_ARM_VCPU_TIMER_IRQ_HPTIMER :
+				    KVM_ARM_VCPU_TIMER_IRQ_PTIMER;
+	vcpu_device_attr_get(vcpu, KVM_ARM_VCPU_TIMER_CTRL, attr, &intid);
+
+	return intid;
+}
+
 #endif /* SELFTEST_KVM_ARCH_TIMER_H */
-- 
2.47.3


