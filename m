Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3162ECCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 12:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MzfKs1meZcxc8aIEgTcF+NFofqdV4KwxCeiYS7QeFos=; b=IY9NJBTIXmASYOe/B+8FWSvwZP
	7gzYc4T4bmeSc9LJtZFkC72pfA3gNnLgKcMbGaCK588cMBi9fByYU2Epu5Hcy3JbRQlJ4EEKlDxMQ
	Y0VeilaEGWbzS/dM3tcy1lYHXO7fk1ecjjc/hMvSzdlXCVEQ9F/PLcGY8I3F8MB570FkuVL8N1qIh
	ha5gelMOKPSPVlGz7eVqWURzlZ68abo+zzDFSZfQYY4fobDsk8Vta5ehNSDv+LvaePudfb9MFTsu5
	tQ0lvaJ0FWiq9zDX8We4DzvAK0tf21WsU9sEeh7LNrOA4nv5CcLDDPReOuWVwCABgR6NCGVHk9SJz
	utiRCEMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGd7-0000000BpC6-1CAU;
	Tue, 04 Nov 2025 12:59:21 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGd3-0000000Bp62-2K63
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 12:59:18 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4711899ab0aso47820595e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 04:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762261155; x=1762865955; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MzfKs1meZcxc8aIEgTcF+NFofqdV4KwxCeiYS7QeFos=;
        b=m6bta3RbtXIg9dEwaX3mBW6w7WgEnPAtuzJXA4c36y31kGWhv1RlR4dScRMft94DiT
         dWakGCs7QUxzKPJK9z97N8BaT9s4tcD3JFKToIyrIm+dYom85v7UAGIMq8BfAnL3lEoW
         q0/SlYnEHQJ7inxu/hB/6fiHdz/MIbabQdl3wpP8u3yVNgbZGLEQnSlgiMIPJscAnV96
         8GaJg0/yimCBZPt7mN0SOyBXMtJzxOt6LtvlBmNvMarbUgLbCKZaN5gmSMROBDALDFZL
         Mz2XDPxrjAJHyRxQWbVUyaHXK6xwX9wxOdYMQGuFfneWH273d7jqMjnmCsGGODsLsyzV
         OduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762261155; x=1762865955;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MzfKs1meZcxc8aIEgTcF+NFofqdV4KwxCeiYS7QeFos=;
        b=foy8I3Rx5O9RiVVbXIwYlI2hAPwLwXAnyssoOtJbBMtj/86zgJ5FJuCHr9gMsZOoPN
         ieJjfB4U79UuGAX8t3H4kKzBdeCOCCl5xtxcVUzldLiQTMQ89TFUtdsHSCnQtV3lVfwJ
         OruiipqqALpYmzMF4p8+jh3Z0+6gzypNhBIhaGmAc7Afkg56m7UZAHsR0shihDpi2x8a
         NzZiWLJkJYENsBUl/af45wHSujKZ7aTCnHnfR/zV51POOuVUgmuEGjL36TnIOhuqO262
         KPeXdlylvis6w8nuVyvKU3qIa9T2rkktYX3kPVQyhPWluD5s3TzJ+DNTIO63GiMR/Yex
         e53g==
X-Forwarded-Encrypted: i=1; AJvYcCU4Dh2AbVtxhQKWw0HyILAkrzWc1YIA7hk1raJcNT8Cv5BR48L8MoAKVUrKPwi0HTGtsZqKZMe9IRrDtzXJIhKA@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7Vq18Zpoxh8ydg7ed49l3XNKXrfP8kajqRioJT2DlyETz4aDV
	a4nJlRPlh6hrz8G70/i82Y5qHB7uCK31krtros8qdPwjQVfnkArhZ3nx8vr75k6lsVoxpvdnAHB
	Smg==
X-Google-Smtp-Source: AGHT+IHRYkO1/tIR1WAYAGStfsC6IBdc1crqUFMXQPt0Cl2jnlOTPv06xz5lhIxv8lUeuZzRrMw74GcB9g==
X-Received: from wmbg22.prod.google.com ([2002:a05:600c:a416:b0:477:14b8:19f6])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e52:b0:471:734:53c3
 with SMTP id 5b1f17b1804b1-477308a0e33mr131579625e9.24.1762261154822; Tue, 04
 Nov 2025 04:59:14 -0800 (PST)
Date: Tue,  4 Nov 2025 12:59:06 +0000
In-Reply-To: <20251104125906.1919426-1-tabba@google.com>
Mime-Version: 1.0
References: <20251104125906.1919426-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.997.g839fc31de9-goog
Message-ID: <20251104125906.1919426-9-tabba@google.com>
Subject: [PATCH v1 8/8] KVM: arm64: Define FAR_MASK for faulting IPA offset
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_045917_628937_D95ACD1D 
X-CRM114-Status: GOOD (  14.52  )
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
to reconstruct the full faulting IPA.

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
2.51.2.997.g839fc31de9-goog


