Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620E5CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 10:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qDdgNw3wr59AMPU8l8T1ufu00uEQQhbsgv+u5LQwMk=; b=GMzlYQPwYRNpOhk25p2XBmrsv0
	gUxXCrzn/P5ultG9AuY9Nak8cN5kBg68lUnQkIyElhaaw9SZQcVIrr4Y6zlmRzP+tVpFqNGF/HgMe
	gGI+XgEb0O3lK67nXlFgqiVPo3EzjkKl4lgBncypslb5jEM3NEefb1tE+5RyZA82yNn4uZm/JdtSC
	b7EB3mOFGSterJtwEZ8nF28rQqMWNzHXjYV/9AHesGLrBvoMptJszyDZNBtrS1MmjbXhP/nODiosm
	ba3cf3AMo5Jg9UFETjehj0hR7P3PUTdhuNJAnDwp2Udwjxv4Zt8ELxwfy+UyThDzXsScnIMFiggrK
	k8J8LuJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdkv-00000004GVv-0TNd;
	Wed, 20 May 2026 10:02:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdke-00000004GMt-2OPZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 10:02:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 25035442F1;
	Wed, 20 May 2026 10:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B8BD1F00898;
	Wed, 20 May 2026 10:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779271328;
	bh=7qDdgNw3wr59AMPU8l8T1ufu00uEQQhbsgv+u5LQwMk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hDdglb5FMkREUIUuC5ulzHP5LkovcZ0CMp2WDgvGOBEw7S1OB/TZ53E3dyT2BN6sz
	 1XXeweotQbOtJiwgFeAKrcTvZZzlmq7ywk5TDISLtdYIZfL82gmJ0RhcsVP1l7v0zA
	 GmqgtknJXbULTJdueyevhqwlUiGkvWtZ6cEY69NHDCyBCmumm7+GFCH1UF3Hx9mX+5
	 /+ANckf3ZfV8l5ufpKt7KR629iwpHPxmvJQ4BSx9Zjf6uovRX41R986OrNoxymjinI
	 8JkGuQlaZaoa1JK0KZaz4iWCIq7NqvCLId82wgp6Zuj8gUZRA4i3+OlElrpRKaq/PP
	 U3XZPnuhYnz+Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPdkc-00000004Jio-15Vo;
	Wed, 20 May 2026 10:02:06 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Deepanshu Kartikey <kartikey406@gmail.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v3 4/6] KVM: arm64: pmu: Kill the PMU interrupt level cache
Date: Wed, 20 May 2026 11:01:58 +0100
Message-ID: <20260520100200.543845-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520100200.543845-1-maz@kernel.org>
References: <20260520100200.543845-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kartikey406@gmail.com, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_030208_635998_0FEE25AE 
X-CRM114-Status: GOOD (  12.84  )
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

Just like the timer, the PMU has an interrupt cache that serves little
purpose. Drop it.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/pmu-emul.c | 13 +++----------
 include/kvm/arm_pmu.h     |  1 -
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 31a472a2c4881..edb21239478a9 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -396,19 +396,12 @@ static bool kvm_pmu_overflow_status(struct kvm_vcpu *vcpu)
 static void kvm_pmu_update_state(struct kvm_vcpu *vcpu)
 {
 	struct kvm_pmu *pmu = &vcpu->arch.pmu;
-	bool overflow;
 
-	overflow = kvm_pmu_overflow_status(vcpu);
-	if (pmu->irq_level == overflow)
+	if (unlikely(!irqchip_in_kernel(vcpu->kvm)))
 		return;
 
-	pmu->irq_level = overflow;
-
-	if (likely(irqchip_in_kernel(vcpu->kvm))) {
-		int ret = kvm_vgic_inject_irq(vcpu->kvm, vcpu,
-					      pmu->irq_num, overflow, pmu);
-		WARN_ON(ret);
-	}
+	WARN_ON(kvm_vgic_inject_irq(vcpu->kvm, vcpu, pmu->irq_num,
+				    kvm_pmu_overflow_status(vcpu), pmu));
 }
 
 bool kvm_pmu_should_notify_user(struct kvm_vcpu *vcpu)
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 3e844c5ee9174..b5e5942204fc6 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -32,7 +32,6 @@ struct kvm_pmu {
 	struct kvm_pmc pmc[KVM_ARMV8_PMU_MAX_COUNTERS];
 	int irq_num;
 	bool created;
-	bool irq_level;
 };
 
 struct arm_pmu_entry {
-- 
2.47.3


