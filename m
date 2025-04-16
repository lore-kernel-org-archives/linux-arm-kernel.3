Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A579EC369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 16:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uzD2f0rxQ0+kK+W36kLcNjO+gtstze2fsnlGYTmtJfM=; b=UESZEs/SWZosZu3ih9NdRQJtOh
	NcB0KtvCvqoybBaL8xdYX5ep5RHWy/W9x0ogM4srg34sY925Ki6jKlFJKWuZb5GtIS3VTXjtJC5Ij
	zHCbocBZKuHHj5GJ9lmkp4NHdywzGDvpVMy+7I0AfYAy9gGLsLDAzDM/KktYDRuaNjYXEQSGtXjTi
	EW5KqHBD97wrTcUMUftZ80fm6VIjz4uQIva0rwF8aPC4AWDrQNhXAPizMN5TBRgjNYFZLg3gfm1XR
	tDIbd38aHHLxbrLKg+HwUi66hzoB29J1pdXx3lUHymyNSzdAm1XLQhn2q+78oyAYeG+W4/Rsb04JM
	w8z+q+tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55NJ-0000000ACiR-17K1;
	Wed, 16 Apr 2025 16:12:33 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54fB-0000000A4S7-3Tyx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 15:26:59 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-5e5d9682f53so5918889a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 08:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744817213; x=1745422013; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uzD2f0rxQ0+kK+W36kLcNjO+gtstze2fsnlGYTmtJfM=;
        b=wdFJme0tl1tmNDckct2qmkHPxveUehHkQrH6jVcf0iq6sWGJ1mDIWfc0rwffthI3Gs
         sNM/uURVlNEJt2kUJJm0Yp8HSlvT9ksyLAx7YHHiMZZhV8sIP4mV5bK1mD7LCdJUl300
         sGg+tdKWUjDFSAWlz7Wdy4+YQQaCIVCPuroWPZr5Ss6W0YRzIUR+33Kc/pX8lfemwXSx
         GCKt57ar71FiaYUICCtY70U4MZCcTHRyANwHy0Wy+3OwYPHnXR1WfqZAcZQJ6TRAUciy
         tmy/Mw3YzwGQQUSJDO6Mx35tvFrTo9RKDgxd/wDFFHE+ld3BbmEJa9cAyfKR5Rbc7lMs
         Kwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744817213; x=1745422013;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uzD2f0rxQ0+kK+W36kLcNjO+gtstze2fsnlGYTmtJfM=;
        b=OYjgVp4HdJoilhYvvtHmHytRdG8vs6IY6evZBvAQnNuEwbPIe7xyuVk3YY7NIDwtwv
         7Bm4tLb22ac3xFQ3ouaEwGj31q+5gbvise2yyMSUnLSAbnug0tBe2ABhwaREg82/36j3
         ZsyMZ0Peso2IQdVrnGFzyBVOWdGcig8kjsjqz8iaVZe8Wx/H7loPMLfifhH5CUj1yd42
         08mYHlWC19mpRSm6fibf+4gZcEMqYX0dRf258o9yxUvSYQcf7cWgXRO3CTrosm+ESeiQ
         GSGpudAik7WYNXWE+iRojIbBJKkk5jvPWcEaIQMdTHzgkit6sMBdJWaom58+DLMoHJ6E
         r8Cg==
X-Forwarded-Encrypted: i=1; AJvYcCW2cNdLKWS8yBh+8UpMKn/E19zoC2dy4/Gday2wjdiKUKkDtuEBcyX0syJCoZ+riWUvnNdoZoPO0emtvKltdBHc@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1xF3OgWc36xPaSh47NPMhRL/jTB2emprB6wbVh9nbsSjQ2/9t
	iVsG4UtG4V5MR2eHhsgOiH6XPLzi47wra2GIBsKAh4aBbZNVU9E5j5YtllgVg6pkgGlGMwDQejv
	c1vBc5Q==
X-Google-Smtp-Source: AGHT+IHeDz4onV1W2s/vfCOCzAITZ8Cgy1MgbHMQ8Bx0jNC7ijt2U2LknXq2pGOSmZDw3fZM7GLT6soOihnk
X-Received: from edsu15.prod.google.com ([2002:aa7:d98f:0:b0:5f4:ade4:88fd])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:35c2:b0:5e5:bbd5:676a
 with SMTP id 4fb4d7f45d1cf-5f4b75b2ce3mr1715528a12.22.1744817213096; Wed, 16
 Apr 2025 08:26:53 -0700 (PDT)
Date: Wed, 16 Apr 2025 15:26:41 +0000
In-Reply-To: <20250416152648.2982950-1-qperret@google.com>
Mime-Version: 1.0
References: <20250416152648.2982950-1-qperret@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416152648.2982950-2-qperret@google.com>
Subject: [PATCH v2 1/7] KVM: arm64: Track SVE state in the hypervisor vcpu structure
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>, 
	Quentin Perret <qperret@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_082657_868969_B832AC6B 
X-CRM114-Status: GOOD (  16.98  )
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
 arch/arm64/include/asm/kvm_host.h  | 12 ++++----
 arch/arm64/kvm/hyp/nvhe/hyp-main.c |  4 ---
 arch/arm64/kvm/hyp/nvhe/pkvm.c     | 47 ++++++++++++++++++++++++++++--
 3 files changed, 51 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index e98cfe7855a6..931011b68819 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -971,20 +971,22 @@ struct kvm_vcpu_arch {
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
index 5a335a51deca..338505cb0171 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -372,6 +372,18 @@ static void unpin_host_vcpu(struct kvm_vcpu *host_vcpu)
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
@@ -384,6 +396,7 @@ static void unpin_host_vcpus(struct pkvm_hyp_vcpu *hyp_vcpus[],
 			continue;
 
 		unpin_host_vcpu(hyp_vcpu->host_vcpu);
+		unpin_host_sve_state(hyp_vcpu);
 	}
 }
 
@@ -398,12 +411,40 @@ static void init_pkvm_hyp_vm(struct kvm *host_kvm, struct pkvm_hyp_vm *hyp_vm,
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
@@ -432,7 +473,7 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
 	if (ret)
 		goto done;
 
-	pkvm_vcpu_init_sve(hyp_vcpu, host_vcpu);
+	ret = pkvm_vcpu_init_sve(hyp_vcpu, host_vcpu);
 done:
 	if (ret)
 		unpin_host_vcpu(host_vcpu);
-- 
2.49.0.604.gff1f9ca942-goog


