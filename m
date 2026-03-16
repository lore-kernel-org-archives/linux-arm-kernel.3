Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781EAF53D7E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cfzLIsn2Q20JghpCHqLQPcreo5Zv/pRgRX5lZKoPSE8=; b=DShOBHI2+tKPhyy8tkaTCkjRHI
	Y16oBZz7AQr7TI8ReajqxRgpIjskQHFD8x/lzZiwWv9eivTZ8YhjWmeYdhYLOkQ+/623joVYbTpcT
	4QUAIAVvUomJPl8XmzWhuXtxFjL8eVcov7IMME6ZHVT/7jl5k5bzfCVmIRgQEBITE1cY0cT+DJ+Ag
	9mE9JUNHYOFWw0jFfkfU/I0Bhxf8bCqTjRR0gyFPUG2fi8k8kb94dYsxzpN7pqRwovCaO3N7qXrMo
	QjfdvILeemqv9303xilWtYHgiUPb1nRbzg/4HOb/tUTYFCe53njmYW4Yzso4bEm1CAGqwDBfhmOEA
	36ek1miw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Br6-00000004ZyM-3rLq;
	Mon, 16 Mar 2026 17:35:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bqv-00000004Zqv-3lVQ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 17:35:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cfzLIsn2Q20JghpCHqLQPcreo5Zv/pRgRX5lZKoPSE8=; b=mFGH4o49ST7/JLDCMCXvKH2JPF
	1ECs0b4Q6pyVYpw1xMQOHXYdjrLWEG+ClMq9P6lfRr+hAUW7+IyznGqgr8xtETCGBQXXF8wGbr/qH
	gyAAP+PycfVSB9Y05KkQRPrCpkI70PIno1+Q8E6nhTC8/ZZlBWPRP7vLtVhffPixQYgr+chCaCMjs
	GXF8dTGFqpoEHR67hP1D6Cb7GKbrOQcePWo0iZG8pEi/5b+oxM7geN/62acYfgRmpivbqPzTgcdT5
	0Dfhih4wPqCoq3axLmKSyopN+24ZF7rv8R2P9fZDzZfoRHy+1ooD9FvhPv1iJYzz/7eeZCF2qZfI0
	179diWdQ==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bqs-00000007LtD-3aD2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:35:40 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4852d27f473so23932215e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 10:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773682537; x=1774287337; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cfzLIsn2Q20JghpCHqLQPcreo5Zv/pRgRX5lZKoPSE8=;
        b=SE3uNVxJTgIeTngJOVreIiLO7iUAQls5nlu0QV2pOsgk4T9D9sSciW2yghXtEXcVkd
         rR2xbGaA2lXvmV2YyD3Y3X+Eu1fNW1RkHNYS7HtizzxAyOEVK4TRzWcc5L/tnObmt8ry
         HRqf1TkVG3TYh05BlTQTqCYnhBU/WNPrk9+SdoXM2WKdRpyEomRZV4DuAdPLfVBqTQke
         J3TM8TTDWQtTt7lTLUbh1ukUVGsRf4aOWfDtnEmxxG5RT5mL3oh1g+HUK19b8v0VTYlA
         gWzVw4rqLGoOw+AiPo4ybYKOumk74N89yCpsDJ/urJJswVfgqWdvoq0kQJiPixBha//0
         hMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773682537; x=1774287337;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cfzLIsn2Q20JghpCHqLQPcreo5Zv/pRgRX5lZKoPSE8=;
        b=P+h+1Ow+Szl0rLwVcCFQOu2aMkktddtCkNqwFB5aipVP54zYvjXzndZ/73bzyjy12p
         VoDXqP9MRDIKW1dZO6/JD0cXP2bj/xLYNWJjnBPwP8vB75z+gU+te6/rrI8ve2eMZ68J
         ak9hVtMjN3KO/rUoNdatW6yQBla73I/VgOE44sOkX8M1wem3C9L3cw/TORv9hy0YsFL/
         5bHpclmLxLczLVcBjC/aWpsWke+SJHzg7PYi/JBuxs+gD/Tb8FKsMJEXEgMzJe8EXpfj
         QSrTWzoyUFG2djyFII/Jrfx3zlpQSxip6Tq3vtVHKZ+1FvIhc4d4PzC3JclvyZBckGkf
         4JyA==
X-Forwarded-Encrypted: i=1; AJvYcCXNA6G0819KUbBqFxSNmXM2IZHFmYG4Tc4qjpPbOrvRvx3ucAqHjC6gTRNSKGMK7LyFaOIi1FcsNlSVcw/BGtX9@lists.infradead.org
X-Gm-Message-State: AOJu0YwsWgJBS22HWw2F9nrgEJhtoAd6ryVwg44ER3knA0bbxqiZRf7l
	8bQfBunuV3Umlp1Nm0guspkM6epAYnhTNWedWG9nH+qd6fO8bcoIGFZZQFrLJjIs3hXSKUTEmk6
	YCw==
X-Received: from wmbh3.prod.google.com ([2002:a05:600c:a103:b0:485:343f:9fb3])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f54:b0:485:49c5:8eb7
 with SMTP id 5b1f17b1804b1-485566fd0eamr230387435e9.22.1773682537346; Mon, 16
 Mar 2026 10:35:37 -0700 (PDT)
Date: Mon, 16 Mar 2026 17:35:29 +0000
In-Reply-To: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
Mime-Version: 1.0
References: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260316-tabba-el2_guard-v1-8-456875a2c6db@google.com>
Subject: [PATCH 08/10] KVM: arm64: Use guard(spinlock) in psci.c
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <linux-arm-kernel@lists.infradead.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <kvmarm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Cc: Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_173538_985337_0ABA7AD0 
X-CRM114-Status: GOOD (  11.55  )
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

Migrate manual spin_lock() and spin_unlock() calls managing
the vcpu->arch.mp_state_lock to use the guard(spinlock) macro.

This eliminates manual unlock calls on return paths and simplifies
error handling during PSCI calls by replacing unlock goto labels
with direct returns.

Change-Id: Iaf72da18b18aaec8edff91bc30379bed9dd04b2b
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/psci.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
index 3b5dbe9a0a0e..04801f8b596a 100644
--- a/arch/arm64/kvm/psci.c
+++ b/arch/arm64/kvm/psci.c
@@ -62,7 +62,6 @@ static unsigned long kvm_psci_vcpu_on(struct kvm_vcpu *source_vcpu)
 	struct vcpu_reset_state *reset_state;
 	struct kvm *kvm = source_vcpu->kvm;
 	struct kvm_vcpu *vcpu = NULL;
-	int ret = PSCI_RET_SUCCESS;
 	unsigned long cpu_id;
 
 	cpu_id = smccc_get_arg1(source_vcpu);
@@ -78,14 +77,13 @@ static unsigned long kvm_psci_vcpu_on(struct kvm_vcpu *source_vcpu)
 	if (!vcpu)
 		return PSCI_RET_INVALID_PARAMS;
 
-	spin_lock(&vcpu->arch.mp_state_lock);
+	guard(spinlock)(&vcpu->arch.mp_state_lock);
+
 	if (!kvm_arm_vcpu_stopped(vcpu)) {
 		if (kvm_psci_version(source_vcpu) != KVM_ARM_PSCI_0_1)
-			ret = PSCI_RET_ALREADY_ON;
+			return PSCI_RET_ALREADY_ON;
 		else
-			ret = PSCI_RET_INVALID_PARAMS;
-
-		goto out_unlock;
+			return PSCI_RET_INVALID_PARAMS;
 	}
 
 	reset_state = &vcpu->arch.reset_state;
@@ -113,9 +111,7 @@ static unsigned long kvm_psci_vcpu_on(struct kvm_vcpu *source_vcpu)
 	WRITE_ONCE(vcpu->arch.mp_state.mp_state, KVM_MP_STATE_RUNNABLE);
 	kvm_vcpu_wake_up(vcpu);
 
-out_unlock:
-	spin_unlock(&vcpu->arch.mp_state_lock);
-	return ret;
+	return PSCI_RET_SUCCESS;
 }
 
 static unsigned long kvm_psci_vcpu_affinity_info(struct kvm_vcpu *vcpu)
@@ -176,9 +172,8 @@ static void kvm_prepare_system_event(struct kvm_vcpu *vcpu, u32 type, u64 flags)
 	 * re-initialized.
 	 */
 	kvm_for_each_vcpu(i, tmp, vcpu->kvm) {
-		spin_lock(&tmp->arch.mp_state_lock);
-		WRITE_ONCE(tmp->arch.mp_state.mp_state, KVM_MP_STATE_STOPPED);
-		spin_unlock(&tmp->arch.mp_state_lock);
+		scoped_guard(spinlock, &tmp->arch.mp_state_lock)
+			WRITE_ONCE(tmp->arch.mp_state.mp_state, KVM_MP_STATE_STOPPED);
 	}
 	kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
 

-- 
2.53.0.851.ga537e3e6e9-goog


