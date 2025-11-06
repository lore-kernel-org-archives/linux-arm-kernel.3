Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BDCCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 14:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7EffVnVauLlhDfmlQCcv2Y3+uVzlHVp+gu1a0fxy8E=; b=REERf08rscbqCkP0ZDTBlIvBWq
	0LssYEhAof1TfIpplj8qNVLbttFlIGPwLUhZUzvjAfTKzkEnTAmNl753XHBDiUcaGrwG33bW4Wxr1
	J2NUVhO3kFePMIhQPshpsTBpxhhpkP2jeLP2R+AhA7ogBzpX2BmNbOgkfRyXx9qlAz0Vx09iPF+uz
	kiZDQ6YRyxdHX0cOdm47MXaLOieM83bm2No6i1oACiz7I8E8dsats1LT6VRgn+WeJ9LVs+VH2XDo9
	R6ESISEB6ZoT9pMsrDfa14FI08u43wxPVEJjjqOR4/mpIWFZ9Prd9rGkgm20Rq0z/otyBhTxCy+bu
	wiRvEv0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1Dx-0000000FiXO-1gqf;
	Thu, 06 Nov 2025 14:44:29 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1Du-0000000FiTH-1PUd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 14:44:27 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-429c5da68e5so1154329f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 06:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762440263; x=1763045063; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P7EffVnVauLlhDfmlQCcv2Y3+uVzlHVp+gu1a0fxy8E=;
        b=u6xTnfbxNfPXVNW9lGe6MwwcqbEF7b4+EDOiWZCgMH9Xo2z2c8s3IomI6f1O5XtIew
         rbYZMDcxCYBsm858qXZkQedZdowaJN1l+Ar82j+Giy3oF8x65V0hmli8TeOnP9eKlMFP
         XyOATmoJbP2IbA1MtD7lp0jbb1Qk67h6Icf//93031N8vAZmEE1RO/Lb+etbDlDwP1Ee
         r/xBEahnX/h6pbQFRHh89dkPR77fmPCaWvHAHwZnaejSvvYbYgG77lnrSVCHeYcCPhbB
         HiRDhnw7zo2U5ht8wfdZkPwiRf80/h6WOISfqxoZ5tMXuOCcdVdCQ3jBlaTyTC8PJ2Pu
         DlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762440263; x=1763045063;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P7EffVnVauLlhDfmlQCcv2Y3+uVzlHVp+gu1a0fxy8E=;
        b=xNSdEdmxPRxRxBuoyf56/srqR3e71W/Oi6Xy3gfP4tKqwXMsdfDIX8y8sWPX0lErWL
         0HSF47Me+ixvmcUhugdSPkJCANIHNGMEKVMr0djXIMQwZuuof2gsn8YR4lQk8MbqA/di
         OOEdb22uVHdJdm9LxZL+X6ik+K/97DQZIAtaa5zuKNZyfMsB3djRvvTBMguLe6/m4+3L
         D8P1Gao4+I7uv5YETHbJxo+Cgz/JS+UlfQb0El++3ZftojiuCA+SFhSuDVKJHbA6zLdG
         eMRUDOv+VSqSnQG3MIr0xSb4/1Pg/kcz3Gn6YggLDdrHCbVK0jIN/ipZKemDHMzB11tv
         DLRA==
X-Forwarded-Encrypted: i=1; AJvYcCVrdLnfCNcDevLxIeuuUcON1Kk8pNYeLegjMHpccYr2RgNmGzDINN2IYVoWwVQsV8y/Zpje2jp7YbtMd6n4TjAK@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2MyL5YQr8mgkeWEqh+MdtdKOC+T5LSjHHFlsOeg5m+FVbetXw
	XRZ9XGsCb0mwTf6k46k2bpX6qFlgR8i7vi8Uqu/+/aUTAJ2ugTc5OFcjUco1dvUddo8+bGOebv7
	ATg==
X-Google-Smtp-Source: AGHT+IGzPIs4yUyp+6UXJhAzMkFp36VtzGI2h7GEa6J21ujrjoiWaogpRDCbFX9snCJSgthaq9rVJA7/qQ==
X-Received: from wrbfr8.prod.google.com ([2002:a05:6000:2a88:b0:425:57c9:52a0])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1848:b0:429:cb8b:b58e
 with SMTP id ffacd0b85a97d-429eb1a2b33mr3770171f8f.28.1762440263044; Thu, 06
 Nov 2025 06:44:23 -0800 (PST)
Date: Thu,  6 Nov 2025 14:44:17 +0000
In-Reply-To: <20251106144418.2847443-1-tabba@google.com>
Mime-Version: 1.0
References: <20251106144418.2847443-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251106144418.2847443-6-tabba@google.com>
Subject: [PATCH v2 5/5] KVM: arm64: Define FAR_MASK for fault IPA offset
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_064426_411210_3116DF7E 
X-CRM114-Status: GOOD (  14.03  )
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

This 12-bit FAR mask is hard-coded as 'GENMASK(11, 0)' in several places
to reconstruct the full fault IPA.

Define FAR_MASK for this value in the shared header and replace all
open-coded instances to improve readability.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_arm.h         | 2 ++
 arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c | 2 +-
 arch/arm64/kvm/inject_fault.c            | 2 +-
 arch/arm64/kvm/mmu.c                     | 4 ++--
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 1da290aeedce..e995e9b3a0c4 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -343,6 +343,8 @@
 #define PAR_TO_HPFAR(par)		\
 	(((par) & GENMASK_ULL(52 - 1, 12)) >> 8)
 
+#define FAR_MASK GENMASK_ULL(11, 0)
+
 #define ECN(x) { ESR_ELx_EC_##x, #x }
 
 #define kvm_arm_exception_class \
diff --git a/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c b/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c
index 78579b31a420..22898ed4dd6f 100644
--- a/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c
+++ b/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c
@@ -44,7 +44,7 @@ int __vgic_v2_perform_cpuif_access(struct kvm_vcpu *vcpu)
 
 	/* Build the full address */
 	fault_ipa  = kvm_vcpu_get_fault_ipa(vcpu);
-	fault_ipa |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
+	fault_ipa |= kvm_vcpu_get_hfar(vcpu) & FAR_MASK;
 
 	/* If not for GICV, move on */
 	if (fault_ipa <  vgic->vgic_cpu_base ||
diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index dfcd66c65517..8ef3453696a2 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -258,7 +258,7 @@ void kvm_inject_size_fault(struct kvm_vcpu *vcpu)
 	unsigned long addr, esr;
 
 	addr  = kvm_vcpu_get_fault_ipa(vcpu);
-	addr |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
+	addr |= kvm_vcpu_get_hfar(vcpu) & FAR_MASK;
 
 	__kvm_inject_sea(vcpu, kvm_vcpu_trap_is_iabt(vcpu), addr);
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 7cc964af8d30..21a9442f9b1e 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1959,7 +1959,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 
 		/* Falls between the IPA range and the PARange? */
 		if (fault_ipa >= BIT_ULL(VTCR_EL2_IPA(vcpu->arch.hw_mmu->vtcr))) {
-			fault_ipa |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
+			fault_ipa |= kvm_vcpu_get_hfar(vcpu) & FAR_MASK;
 
 			return kvm_inject_sea(vcpu, is_iabt, fault_ipa);
 		}
@@ -2059,7 +2059,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 		 * faulting VA. This is always 12 bits, irrespective
 		 * of the page size.
 		 */
-		ipa |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
+		ipa |= kvm_vcpu_get_hfar(vcpu) & FAR_MASK;
 		ret = io_mem_abort(vcpu, ipa);
 		goto out_unlock;
 	}
-- 
2.51.2.1041.gc1ab5b90ca-goog


