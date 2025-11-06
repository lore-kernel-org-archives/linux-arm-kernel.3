Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57C2CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 14:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6V0v3j8Mz2X1AHdZWLdDkByJ6raAe2lJ4W82Bregkg=; b=jvDRdJ7ERh9hNzi9oZPo7ALqRa
	XDp6ex1U4PVzs0TWxrynx5bl13BDZzwp1o/Qxw0hIAMfHmLeSekdtGn+rsJKrOP0VKeq6a6SyKFv7
	kvkPYLKFKsN6ur1D0ssWr5BalFBD4E+yiZJgVknaS/DTE6nRT6mfRL06D51FkYti2HiRc8L1F5xxa
	sdjzNrghE8zpohnzaEiQAUxu9gJopkcBj5ifpVIRBtwy20K6HAjH4h28mvznKAbEmi/+mu4ubwi51
	+w4ks79s/FIAsM4wD/GEcLRNI6WKZxXCj/eiycicILguT2CX5nBBmhdzmOC3bzdm5GfbxGyk927VS
	wrjGJCnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1Dv-0000000FiW2-438C;
	Thu, 06 Nov 2025 14:44:27 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1Dr-0000000FiS8-2RQP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 14:44:24 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-640b8087663so2343133a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 06:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762440261; x=1763045061; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B6V0v3j8Mz2X1AHdZWLdDkByJ6raAe2lJ4W82Bregkg=;
        b=jxiq+fHrlI51wJ6BhY5FdxzO86aQ9f/5mnSEWqItFo+FTjkX5J1MmQfn6xJouQgFof
         UcpmBJR3OP9KZWJjF+rifsEge/kCDytOn+W+Vvh2bnY6XdaBmpqCHpC4bSZCrfq3wdlJ
         uYYg5wfBiSBKD0bsujAxBqqbxqZH47gK/rijctkAsdyBns8hJNP7E3mBZdWYP+cztmXZ
         RtiGJUxmhxm+/hgvB/0RgEjvdZdKvUm4R+aWz8Mbkhg3KLp7niXfigZDc96dE3cyN2uL
         WFLgDEpSElwkA2OuknAv5qCQr8TGqhXS8I0lbkN141ZZ2xcf1vs9S2QjCq52INBjHwte
         Exnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762440261; x=1763045061;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B6V0v3j8Mz2X1AHdZWLdDkByJ6raAe2lJ4W82Bregkg=;
        b=f0bkQwm7NOWB7FN2hQDDtq1cbzlBrs24BfKh74DQ/oglMPBMfKB8slowzfH28LGwH8
         oguQCh1nnKe6R/X3Y9lpd4bkrn4hf0zA53YWXXWH9xgmiaTLO76Pkfli4SPgETKWpROa
         SFHmXc8t2bIEMHZa55jfLByg41CrVTtlGugDvLIfOUPeFB0AU2HUEHbbNwKeqOt5w0nR
         bpVUTaI/RZvcE45XvZjWXwdi2oS6W+jQyMUv4cg3ksHlNh3RHtWxiipR3HxlrThy6GKu
         jflJ+ztBdVC2ezpZvQMWvFSPx3l4gtTMRzFQHwAf/H/p5iL2zoOOeCtkmr0F9OefXTDQ
         Wmfg==
X-Forwarded-Encrypted: i=1; AJvYcCWM9tYssU9zjl0sBlFQVF8a69Obz0wuA/R3unKU10eL0gmSFyFwh+pWXa0oV8mJKTmwtwAcZbETO9wiglMcnfb+@lists.infradead.org
X-Gm-Message-State: AOJu0YxXC3BNPMXCHBJ03U4eYu+GrmONSIGOOgIPz21gmm5H7KMcOiej
	hJVIgAniOTVIb0XuN6DzebKYctNiD8upbuaBn0ddM1/Gzq6u8k6KbTQtth1r+V95p5+jLcDbigN
	UXg==
X-Google-Smtp-Source: AGHT+IHvoHQ7Go2/sf4QjRXMlPxZiNl756S8QdLN7jBThmOA368JNIG1jhs5or169fXZHCaxFBZEiInFQQ==
X-Received: from eddp24.prod.google.com ([2002:a05:6402:46d8:b0:63e:1c6d:cc6e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:3489:b0:640:cea9:6752
 with SMTP id 4fb4d7f45d1cf-64105a578e9mr6621279a12.25.1762440261436; Thu, 06
 Nov 2025 06:44:21 -0800 (PST)
Date: Thu,  6 Nov 2025 14:44:15 +0000
In-Reply-To: <20251106144418.2847443-1-tabba@google.com>
Mime-Version: 1.0
References: <20251106144418.2847443-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251106144418.2847443-4-tabba@google.com>
Subject: [PATCH v2 3/5] KVM: arm64: Fix MTE flag initialization for protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_064423_642847_55807208 
X-CRM114-Status: GOOD (  15.94  )
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

The function pkvm_init_features_from_host() initializes guest
features, propagating them from the host. The logic to propagate
KVM_ARCH_FLAG_MTE_ENABLED (Memory Tagging Extension)
has a couple of issues.

First, the check was in the common path, before the divergence for
protected and non-protected VMs. For non-protected VMs, this was
unnecessary, as 'kvm->arch.flags' is completely overwritten by
host_arch_flags immediately after, which already contains the MTE flag.
For protected VMs, this was setting the flag even if the feature is not
allowed.

Second, the check was reading 'host_kvm->arch.flags' instead of using
the local 'host_arch_flags', which is read once from the host flags.

This patch fixes these issues by moving the MTE flag check to be inside
the protected-VM-only path, checking if the feature is allowed, and
changing it to use the correct host_arch_flags local variable. This
ensures non-protected VMs get the flag via the bulk copy, and protected
VMs get it via an explicit check.

Fixes: b7f345fbc32a ("KVM: arm64: Fix FEAT_MTE in pKVM")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index f6f8996c4f97..7e370e31260d 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -337,9 +337,6 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 	/* CTR_EL0 is always under host control, even for protected VMs. */
 	hyp_vm->kvm.arch.ctr_el0 = host_kvm->arch.ctr_el0;
 
-	if (test_bit(KVM_ARCH_FLAG_MTE_ENABLED, &host_kvm->arch.flags))
-		set_bit(KVM_ARCH_FLAG_MTE_ENABLED, &kvm->arch.flags);
-
 	/* No restrictions for non-protected VMs. */
 	if (!kvm_vm_is_protected(kvm)) {
 		hyp_vm->kvm.arch.flags = host_arch_flags;
@@ -372,6 +369,11 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 		kvm->arch.flags |= host_arch_flags & BIT(KVM_ARCH_FLAG_GUEST_HAS_SVE);
 	}
 
+	if (kvm_pvm_ext_allowed(KVM_CAP_ARM_MTE)) {
+		set_bit(KVM_CAP_ARM_MTE, allowed_features);
+		kvm->arch.flags |= host_arch_flags & BIT(KVM_ARCH_FLAG_MTE_ENABLED);
+	}
+
 	bitmap_and(kvm->arch.vcpu_features, host_kvm->arch.vcpu_features,
 		   allowed_features, KVM_VCPU_MAX_FEATURES);
 }
-- 
2.51.2.1041.gc1ab5b90ca-goog


