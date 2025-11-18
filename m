Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF7DCED27B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEzrs1bcMGvMfGKWugW2xWeP/+eyY67q4E3S5ZrMLoc=; b=KUh4HziNM7jjotkzZf2L8CmUnJ
	RLKBhmRjPkLbtafv20//rp+jHUAHvkECBw6SyC0jzAeVaSG2AdVi7ILeSJAuCPmj2W1+Civg6nhCg
	lzZTr3csQYsxw3gxv2ROqhvUPXmcOiP2elhGkKdJzf5AN9rn+sqHKCGf31hzCNkG/WUSAqK0Ppa70
	62fQSnUmz4AwhTFaOcTI96K2yL4d4Yv6WHtWMeqNhmB4H9PCLTEhT4rWoKCLMtM8EKYvaVffFzCJ+
	BgfrRCZkzhrUcwrXM6r7fF6WV2jQhK6/bM8Fu865I8pQLSu3/cA1tWAMzJp4Fo02eWAm5YCNe//4X
	Op4Nizrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJ6K-00000000FlU-3NQS;
	Tue, 18 Nov 2025 10:38:20 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJ6E-00000000FhE-0rWn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:38:15 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-477a027877eso24134485e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 02:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763462292; x=1764067092; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hEzrs1bcMGvMfGKWugW2xWeP/+eyY67q4E3S5ZrMLoc=;
        b=gmi3kYob/LhZpgbMFbrh9DSD/171/voVk+nqSS6Uj9vnAJbT5bwBj+ewdbiAzACsHO
         m9+GLnYxSwL7WY8uWonwObqHBX4LRUAtqh3lf8I5ZlMil8OPhBFzMct7OTiqTqc5Kopr
         8O8tp9j5ZNBhCqwmCj15A7tqVNqPNsJ1ALwpAeF2aQj32pIxw548baE6Z/bExYPhtbCQ
         ylWlAhW+WOrfpLwfCIneu1Jg6IAppjO6fOWW8kCVOK+nkf8EORh4HLY4XN4BsFi6hhuJ
         fXG75FmVwOb7sj/4kaswtMEYxI2GZmRNED00Fw3/GwcuqFq4VWdJDAtxHGOHOsMcD6YS
         ZLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763462292; x=1764067092;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hEzrs1bcMGvMfGKWugW2xWeP/+eyY67q4E3S5ZrMLoc=;
        b=Y2TN4yKA0HGHhQM8OTYVW7YVGRdoiC3OOlQ5FCiFSMJ1qFlWrdyycbyXRmNevPWfxj
         0TZuA2tT7wocei5w2l0ydC27CqRcCo/TLeGGXkucEVx+LW/Ygkbn4GBG4ShpYjBIvzqi
         2ZoCNITTotKXIyn7ueqgULWTphPWqn5iX/Xjl1EfVUpAeWRh1+rBdHts3VkcjsjS5AM8
         GZMKUDCyYIgsdHHCdUHmopdY6B4eIWhKV/x5tn9Fwo7g4jyXKQQ19e8Zzf66S29Lb+xx
         DzpgsYE2wFBdNw9sCXk4FndvqBtfj00naVI8JEbi/8WW2FsEvMZzolpl4SfeIjVUE28B
         95AA==
X-Forwarded-Encrypted: i=1; AJvYcCUz71aoC3SE2bKjcaU9+ko6vkESd2bM57WttzToP1iYg0e7nfZsNXDab9wXHqJxrcXOrtSSAcDAv2XmprkHL/5b@lists.infradead.org
X-Gm-Message-State: AOJu0YzaFxFqRikxOB6T9AHQBBVLbVet48I5YsKocH8fhkT2VxIduakk
	mDQr93MelfdOFRnFWcOrwOWq26hthFXi4oqRP5go/jT/zb/YBeIA6AhHa/EpxtLzbWKuIrGv4dH
	mtQ==
X-Google-Smtp-Source: AGHT+IHFQDgqPSt+i42V89C82dLqTbY2fbZFbYSCIA/ML32nRVS15POSV+9Zopnaba7Rh3hzgq1EmMF8PQ==
X-Received: from wmbay36.prod.google.com ([2002:a05:600c:1e24:b0:477:7893:c737])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4453:b0:477:55ce:f3bc
 with SMTP id 5b1f17b1804b1-4778fe95e33mr139318735e9.19.1763462291876; Tue, 18
 Nov 2025 02:38:11 -0800 (PST)
Date: Tue, 18 Nov 2025 10:38:01 +0000
In-Reply-To: <20251118103807.707500-1-tabba@google.com>
Mime-Version: 1.0
References: <20251118103807.707500-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251118103807.707500-5-tabba@google.com>
Subject: [PATCH v5 4/9] KVM: arm64: Introduce helper to calculate fault IPA offset
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_023814_257704_150C7C82 
X-CRM114-Status: GOOD (  13.77  )
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
2.52.0.rc1.455.g30608eb744-goog


