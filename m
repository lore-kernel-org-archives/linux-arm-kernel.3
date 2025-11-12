Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB56ACCFA1E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 09:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JB5qwwMZxO407X97+Vf/KcwBIUQMngdzvKz1itKcTdc=; b=jL39ETH1dubOYyh9kIhHiNv6Nc
	Fi/iiHguJtyS9kbCuNb4KQH8e2moUo5AF2C96fTOdGU+VHezSb2A6u7hw+S1GefYcpMKo3iX5ox9T
	8+AnKpJawBoebbWIIelJqu/lH4AE30Uwcl5dq1KovrJ15ngZF+zdiWNanRJFZF/s1WRJfJbyBdTAz
	CxILB8jYtdHsydNlS67XRSA9Zy0vOT2x5DuxBNBrmdelUfyhCiXe/9VLeHluLvp65l1iPGj5ST/O+
	KLXMe3hkfSCVfYsXVBzx1bmYocNdxKdk0rVH2pqWC2Du7DqbPI3AUAHNk9n1FZJe8VuJiQZDrXpDl
	QG6JWALQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ72D-00000008Rrk-0yC0;
	Wed, 12 Nov 2025 09:21:01 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ729-00000008Roc-1eDB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 09:20:58 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4775f51ce36so5865435e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 01:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762939255; x=1763544055; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JB5qwwMZxO407X97+Vf/KcwBIUQMngdzvKz1itKcTdc=;
        b=JDIIvjS6ixweEYS2YIPmGFHWXFacVav3+uVFAH6Cf1fPmms91z8/JPPFKzxXvlljfB
         aQjUqkmmNpQfO2x7SX498vwZhhauvXb2Teg1wswdHVUFH3ihVY/ALBzUm5vyejFCh3qc
         rjkHyTy9kDKwVqN6wR5O67geszwLfa1HcJUkx/XrO40mUG9ppLDBpcyYm30B5fLNEuvk
         nybTTezXfUwhU0CwZXYfEN0LBhWH9k7I07Z9AHTHbMYaYDdvkpFZBfStoJsgpS4dy7O/
         /MC6kfuaweLrLkKpAuNqaAjslLqnvZiFavESLIpft97dP/Vse16DVqQkkS3vBaALZCu1
         mFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762939255; x=1763544055;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JB5qwwMZxO407X97+Vf/KcwBIUQMngdzvKz1itKcTdc=;
        b=vCs7eA0sptNMjioui0m0DLQ+Ztlexo43tmkjEKUdiNa4GcmyizlZAc9QDux8SLP4vP
         rivfOcel74FZRavYsmXf9AXLBHzWFQggE1CawNX2gXFabJhqgdWPClrXV2QVQirBr9w6
         i9OvFnZYDl6tEDrhIe8LYwHn08BKtAGlHUKLzpf0xl2zlo31EV6obeMDp7UlM4+Z+6ab
         sDVFz3tEH6KfpRrykfFnhIzBi5gJwFD8WkHvdIW60tbVkQXIzoDOJIipQqvsCcA6aZXT
         00Rql9p2JkV3rSjBwdyRNCRAdEarspPTfNvvVP4YzYcpRS/OmI8GiXuzZwYJ2L1OBIHc
         eN8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVep4X6h9+UZP4szFC+wyrU+VpsWhMf2dp0YOZvFVNwg7RqAR0bZzBi37RqUN/tf8JHvA9BW5GGMaYKAoxhmXrl@lists.infradead.org
X-Gm-Message-State: AOJu0YzNgfauFr1MoLvXfgqrBvLG+0nYi0h7ZI/8tWIyQANDYeVzqrBG
	VCQ1SxU7dN/RJH2O/Q3GrMdqlnXvxI+p2+bF6G2IkP+F0GlNIqXQulIRrKumPgXQxX4YemBO1on
	aIQ==
X-Google-Smtp-Source: AGHT+IGSzKv9Qpoz2yI1N6uU2pBwYKoPNwxfrgPxGJ57M4rsQcHsKYhNgr+gdljJbqvoaektBGzCN8Huow==
X-Received: from wmcq24.prod.google.com ([2002:a05:600c:c118:b0:477:74f4:31c])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1f0d:b0:45d:f83b:96aa
 with SMTP id 5b1f17b1804b1-47787045016mr18090705e9.7.1762939255548; Wed, 12
 Nov 2025 01:20:55 -0800 (PST)
Date: Wed, 12 Nov 2025 09:20:47 +0000
In-Reply-To: <20251112092051.1376245-1-tabba@google.com>
Mime-Version: 1.0
References: <20251112092051.1376245-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251112092051.1376245-5-tabba@google.com>
Subject: [PATCH v4 4/8] KVM: arm64: Introduce helper to calculate fault IPA offset
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_012057_442477_550F7DD1 
X-CRM114-Status: GOOD (  14.12  )
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

This 12-bit FAR fault IPA offset mask is hard-coded as 'GENMASK(11, 0)'
in several places to reconstruct the full fault IPA.

Introduce FAR_TO_FIPA_OFFSET() to calculate this value in a shared
header and replace all open-coded instances to improve readability.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_arm.h         | 2 ++
 arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c | 2 +-
 arch/arm64/kvm/inject_fault.c            | 2 +-
 arch/arm64/kvm/mmu.c                     | 4 ++--
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 1da290aeedce..73abe697bc2d 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -343,6 +343,8 @@
 #define PAR_TO_HPFAR(par)		\
 	(((par) & GENMASK_ULL(52 - 1, 12)) >> 8)
 
+#define FAR_TO_FIPA_OFFSET(far) ((far) & GENMASK_ULL(11, 0))
+
 #define ECN(x) { ESR_ELx_EC_##x, #x }
 
 #define kvm_arm_exception_class \
diff --git a/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c b/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c
index 78579b31a420..43d7dfa2c517 100644
--- a/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c
+++ b/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c
@@ -44,7 +44,7 @@ int __vgic_v2_perform_cpuif_access(struct kvm_vcpu *vcpu)
 
 	/* Build the full address */
 	fault_ipa  = kvm_vcpu_get_fault_ipa(vcpu);
-	fault_ipa |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
+	fault_ipa |= FAR_TO_FIPA_OFFSET(kvm_vcpu_get_hfar(vcpu));
 
 	/* If not for GICV, move on */
 	if (fault_ipa <  vgic->vgic_cpu_base ||
diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index dfcd66c65517..c9bbce017dee 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -258,7 +258,7 @@ void kvm_inject_size_fault(struct kvm_vcpu *vcpu)
 	unsigned long addr, esr;
 
 	addr  = kvm_vcpu_get_fault_ipa(vcpu);
-	addr |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
+	addr |= FAR_TO_FIPA_OFFSET(kvm_vcpu_get_hfar(vcpu));
 
 	__kvm_inject_sea(vcpu, kvm_vcpu_trap_is_iabt(vcpu), addr);
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 7cc964af8d30..5b159cf0d203 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1959,7 +1959,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 
 		/* Falls between the IPA range and the PARange? */
 		if (fault_ipa >= BIT_ULL(VTCR_EL2_IPA(vcpu->arch.hw_mmu->vtcr))) {
-			fault_ipa |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
+			fault_ipa |= FAR_TO_FIPA_OFFSET(kvm_vcpu_get_hfar(vcpu));
 
 			return kvm_inject_sea(vcpu, is_iabt, fault_ipa);
 		}
@@ -2059,7 +2059,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 		 * faulting VA. This is always 12 bits, irrespective
 		 * of the page size.
 		 */
-		ipa |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
+		ipa |= FAR_TO_FIPA_OFFSET(kvm_vcpu_get_hfar(vcpu));
 		ret = io_mem_abort(vcpu, ipa);
 		goto out_unlock;
 	}
-- 
2.51.2.1041.gc1ab5b90ca-goog


