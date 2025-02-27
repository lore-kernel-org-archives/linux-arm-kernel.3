Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C03C19776
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 00:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnSi0QZnCKAvL+73Iyi2doPe04c0Ox90ZdzmLMLkEvI=; b=Dd84l/iypGJljnORk8DQafv73M
	URDqVXkb3hjgfyUVCB9pk2nVjRzR2yvwSuOXYAMnanU4yKVeEkDtH4M47OSxX5+ako5O9p4yV0bZu
	oPLkbG/mjCXcCKpsainjRtI7mXkhEywIRDIsq48s9FSX1EB65OtBIW/CsPAIHOTP39i3yzqULll0N
	3JpMigoGFQlT9mio+RyWxcU2WgrXmNxFqkD+h37RRNJ6sJTpyhWWX0cD0kZuiTGaDNfR9TeR4GpzB
	QSRX75j+drdQpSwCt23nXHV5ugsUkpBf+eTzFjosoCZXRQqVkXU1TE0/GM7/Q8fqPVkHWkH1T8ZYx
	BnLwEmLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRt3-00000005paf-0eKz;
	Thu, 27 Feb 2025 00:36:25 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRq1-00000005orA-0EeK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 00:33:18 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-abef9384a3bso26960966b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 16:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740616394; x=1741221194; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cnSi0QZnCKAvL+73Iyi2doPe04c0Ox90ZdzmLMLkEvI=;
        b=PNE+KgNf1suZTKWGIWj7cbWGlNy9lUx5sBvHHiIRgWG50iRYRCnYiSLMIQQTIIjLdo
         uPr36o7vux1NzTS4q884kTb1jtODbSQqIL4cjx6Sw+PoiuIVmxaXRV5/+8BDTFjvmsnu
         sdYdCSEWeqc97h2VwBo0pDkGFJaEwxmVowpiJMbx3mxH50otlIes2XQ4wSxoq+oHWv4x
         iC7G6BKB8/RiuW/eJztXuaBctPj1dVeJX9aaRlfa/zMkEmqmgspmB0whrJHYFv7Vq7i0
         FVAaM8qNy2RTyJyOF1RF8mDu6fLS8aOVcW6Eg4tUUzmm7/Gk9Lba97owSByLCmGPBN8I
         6H6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740616394; x=1741221194;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cnSi0QZnCKAvL+73Iyi2doPe04c0Ox90ZdzmLMLkEvI=;
        b=snu/sWRYvUQqiQUzbkMLv5aEe3fri6zb9TfdcJUVvKxciu9SFIadvXf3XqI7495Cjf
         CKil9F9EPIItO0mNEGCYKy+R0dzevRfq4IIl4G7wzKg2b+PxIc4lyoalsfD+u9vL2akO
         dwn+uclXByBS/qlnKcibMUv4lPljDyc/csiX0SqzUDPYr9SpQNvSvDLGBsTO13BmrtIH
         ZTn02G2DVscXc9qy74p0GUlQOGvz6LFcSDo76by5/6XTlnpFdPADyy+MwExC1a1hbJ5r
         +lhTQ0f4RI/hAMRgrauGykv/a7SsqqBf8rQsWpq+47ALNZbnaBxkaqKNvjvV/OJrjYBc
         8xzA==
X-Forwarded-Encrypted: i=1; AJvYcCXOnptmzuCQ3aVEATT0xVh9gDbw4YKaGOZLW3tWV+Utr4yJo9CL7LVoKoA2iKlG0DrX81anlONuijCmhFE/1mHU@lists.infradead.org
X-Gm-Message-State: AOJu0YyE5zSKa3ZVhdAzrqqE+4BUt9JQaECKo4qyhqxlmEYqE30EZLtR
	OnA1ffBaOU+L+i40yFm1ymeD2PGEhqea4QNPTdc6wxVDInZzO90OhEiJ+zBkLGxHSTtdPK1EJjD
	3uQxnoA==
X-Google-Smtp-Source: AGHT+IFnzWlAoWfe7gVv/3yG2kJPIQ7pfQ+/eZHRD7MANnsJ1+erytT4JEEh5E6KoQuNIQGX7Bdb2AUdqKfL
X-Received: from ejcsk13.prod.google.com ([2002:a17:906:630d:b0:abe:e921:5690])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:cf86:b0:ab7:ec8b:c642
 with SMTP id a640c23a62f3a-abeeecf6f79mr771155666b.5.1740616394645; Wed, 26
 Feb 2025 16:33:14 -0800 (PST)
Date: Thu, 27 Feb 2025 00:33:05 +0000
In-Reply-To: <20250227003310.367350-1-qperret@google.com>
Mime-Version: 1.0
References: <20250227003310.367350-1-qperret@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250227003310.367350-2-qperret@google.com>
Subject: [PATCH 1/6] KVM: arm64: Track SVE state in the hypervisor vcpu structure
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_163317_097793_08AE4D13 
X-CRM114-Status: GOOD (  18.26  )
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

From: Fuad Tabba <tabba@google.com>

When dealing with a guest with SVE enabled, make sure the host SVE
state is pinned at EL2 S1, and that the hypervisor vCPU state is
correctly initialised (and then unpinned on teardown).

Co-authored-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_host.h  | 12 ++++---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c |  4 ---
 arch/arm64/kvm/hyp/nvhe/pkvm.c     | 54 +++++++++++++++++++++++++++---
 3 files changed, 56 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 3a7ec98ef123..90b58f87b107 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -930,20 +930,22 @@ struct kvm_vcpu_arch {
 #define vcpu_sve_zcr_elx(vcpu)						\
 	(unlikely(is_hyp_ctxt(vcpu)) ? ZCR_EL2 : ZCR_EL1)
 
-#define vcpu_sve_state_size(vcpu) ({					\
+#define sve_state_size_from_vl(sve_max_vl) ({				\
 	size_t __size_ret;						\
-	unsigned int __vcpu_vq;						\
+	unsigned int __vq;						\
 									\
-	if (WARN_ON(!sve_vl_valid((vcpu)->arch.sve_max_vl))) {		\
+	if (WARN_ON(!sve_vl_valid(sve_max_vl))) {			\
 		__size_ret = 0;						\
 	} else {							\
-		__vcpu_vq = vcpu_sve_max_vq(vcpu);			\
-		__size_ret = SVE_SIG_REGS_SIZE(__vcpu_vq);		\
+		__vq = sve_vq_from_vl(sve_max_vl);			\
+		__size_ret = SVE_SIG_REGS_SIZE(__vq);			\
 	}								\
 									\
 	__size_ret;							\
 })
 
+#define vcpu_sve_state_size(vcpu) sve_state_size_from_vl((vcpu)->arch.sve_max_vl)
+
 #define KVM_GUESTDBG_VALID_MASK (KVM_GUESTDBG_ENABLE | \
 				 KVM_GUESTDBG_USE_SW_BP | \
 				 KVM_GUESTDBG_USE_HW | \
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 2c37680d954c..59db9606e6e1 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -123,10 +123,6 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 
 	hyp_vcpu->vcpu.arch.ctxt	= host_vcpu->arch.ctxt;
 
-	hyp_vcpu->vcpu.arch.sve_state	= kern_hyp_va(host_vcpu->arch.sve_state);
-	/* Limit guest vector length to the maximum supported by the host.  */
-	hyp_vcpu->vcpu.arch.sve_max_vl	= min(host_vcpu->arch.sve_max_vl, kvm_host_sve_max_vl);
-
 	hyp_vcpu->vcpu.arch.mdcr_el2	= host_vcpu->arch.mdcr_el2;
 	hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE);
 	hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) &
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 3927fe52a3dd..3ec27e12b043 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -356,13 +356,29 @@ static void unpin_host_vcpu(struct kvm_vcpu *host_vcpu)
 		hyp_unpin_shared_mem(host_vcpu, host_vcpu + 1);
 }
 
+static void unpin_host_sve_state(struct pkvm_hyp_vcpu *hyp_vcpu)
+{
+	void *sve_state;
+
+	if (!vcpu_has_feature(&hyp_vcpu->vcpu, KVM_ARM_VCPU_SVE))
+		return;
+
+	sve_state = kern_hyp_va(hyp_vcpu->vcpu.arch.sve_state);
+	hyp_unpin_shared_mem(sve_state,
+			     sve_state + vcpu_sve_state_size(&hyp_vcpu->vcpu));
+}
+
 static void unpin_host_vcpus(struct pkvm_hyp_vcpu *hyp_vcpus[],
 			     unsigned int nr_vcpus)
 {
 	int i;
 
-	for (i = 0; i < nr_vcpus; i++)
-		unpin_host_vcpu(hyp_vcpus[i]->host_vcpu);
+	for (i = 0; i < nr_vcpus; i++) {
+		struct pkvm_hyp_vcpu *hyp_vcpu = hyp_vcpus[i];
+
+		unpin_host_vcpu(hyp_vcpu->host_vcpu);
+		unpin_host_sve_state(hyp_vcpu);
+	}
 }
 
 static void init_pkvm_hyp_vm(struct kvm *host_kvm, struct pkvm_hyp_vm *hyp_vm,
@@ -376,12 +392,40 @@ static void init_pkvm_hyp_vm(struct kvm *host_kvm, struct pkvm_hyp_vm *hyp_vm,
 	pkvm_init_features_from_host(hyp_vm, host_kvm);
 }
 
-static void pkvm_vcpu_init_sve(struct pkvm_hyp_vcpu *hyp_vcpu, struct kvm_vcpu *host_vcpu)
+static int pkvm_vcpu_init_sve(struct pkvm_hyp_vcpu *hyp_vcpu, struct kvm_vcpu *host_vcpu)
 {
 	struct kvm_vcpu *vcpu = &hyp_vcpu->vcpu;
+	unsigned int sve_max_vl;
+	size_t sve_state_size;
+	void *sve_state;
+	int ret = 0;
 
-	if (!vcpu_has_feature(vcpu, KVM_ARM_VCPU_SVE))
+	if (!vcpu_has_feature(vcpu, KVM_ARM_VCPU_SVE)) {
 		vcpu_clear_flag(vcpu, VCPU_SVE_FINALIZED);
+		return 0;
+	}
+
+	/* Limit guest vector length to the maximum supported by the host. */
+	sve_max_vl = min(READ_ONCE(host_vcpu->arch.sve_max_vl), kvm_host_sve_max_vl);
+	sve_state_size = sve_state_size_from_vl(sve_max_vl);
+	sve_state = kern_hyp_va(READ_ONCE(host_vcpu->arch.sve_state));
+
+	if (!sve_state || !sve_state_size) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	ret = hyp_pin_shared_mem(sve_state, sve_state + sve_state_size);
+	if (ret)
+		goto err;
+
+	vcpu->arch.sve_state = sve_state;
+	vcpu->arch.sve_max_vl = sve_max_vl;
+
+	return 0;
+err:
+	clear_bit(KVM_ARM_VCPU_SVE, vcpu->kvm->arch.vcpu_features);
+	return ret;
 }
 
 static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
@@ -416,7 +460,7 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
 	if (ret)
 		goto done;
 
-	pkvm_vcpu_init_sve(hyp_vcpu, host_vcpu);
+	ret = pkvm_vcpu_init_sve(hyp_vcpu, host_vcpu);
 done:
 	if (ret)
 		unpin_host_vcpu(host_vcpu);
-- 
2.48.1.658.g4767266eb4-goog


