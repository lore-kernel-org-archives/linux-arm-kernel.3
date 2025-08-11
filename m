Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D109C87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 10:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mMMEW4m9zgxGaWpPF/szQjkmQKnYcw2JK1bAC39QMM=; b=VgwY2Y+39ujHXuGGpeSgwjSmXV
	5hmnK5Il+F2/4sbN3EXVvmT23tX9Nfd57QGb7TNlZv+F9tUYFFk0AuQGjlSeG3eyXEKn4fBqJxNvZ
	lfa243wf47Q7SUE/Inm7CAQn6KTen9OlTlS1TmDdzJQfzxJ1Xsd+bRBpwNbv3Fpmb17IsGHBcBJx6
	0wCmcu5580zDhdmQi6G4Os0De+/mN6v1RpHYwl50Nup+1mMK4CaUa9hS6flKoPCCOp46lyW2XHxmN
	Cfj+SSiBC+enXcwpCzIEPwxxgvmx/I3qzGm2rRqy5ukZc8e/SpLQ6FetrGbs6Y82tcjqgIVtXuJzy
	WaJ/LAHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPiP-00000007JW5-3c01;
	Mon, 11 Aug 2025 10:25:17 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPd9-00000007Ilo-020E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 10:19:52 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-459de8f00cfso17192985e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 03:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754907589; x=1755512389; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7mMMEW4m9zgxGaWpPF/szQjkmQKnYcw2JK1bAC39QMM=;
        b=KoucnANOMU8/dHv+PEzWmxW9jHIeUj9ZWShk7J2IF5i8PRBgMdQMoR9s6DwTheQF4p
         3f9gELwouVpTTIodPBjlRb3ChI581EWmaDBAXfL5hZ7wtxSa2BM9a+c7yesezmgy+LCK
         c2lzheBCXMDUowOzEqnFcmZVeX3rPKBLTYMgeyiHM/dpwvLhKMvFn+sdP0IPB9Rh/Wvx
         vT8SN/eooPr0MNMwb5Dys5/RRauqeKA0FERqozpOuKnDsGX8tmPLAF6ae1tNC9suyMC8
         i6cCVK7zoZXvOp5MrfzENUX614iczuPWr+qQQ3HQwzcK8cITAyJyszgmJDemwAQckLST
         V33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754907589; x=1755512389;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7mMMEW4m9zgxGaWpPF/szQjkmQKnYcw2JK1bAC39QMM=;
        b=hiLMJvbzVWK6yAaYUVS1tpaNMOrF58NT5p6y/1tzck98vjjfmIcRaBdcahUXk2I/uT
         OjInBpbFkuTLUh+JhjpPtA2K18wyVz7DXEITuAI8KVF3RY/U5eO4bzDkujdK8PReVulf
         tokaH7++uEP01lut0lRCgrIBE0tlzxew5a3MveWHREB1QS/mO5HLUCp3X8oX8ISgyg9b
         s+PyzO26OywUhectv00D207PdxfYF9aAJKyB4mShddNu3X6e92QCBXIcuqPjwpdfpDCe
         B/IJtYrQbHLZfSKKbjidXcwuh0EysP2a04L6XK4EZ4qqT03yBEGBV0G/9yFLanJ3q+b+
         C8/g==
X-Forwarded-Encrypted: i=1; AJvYcCUnVHimqrEIHeUZ0pzlCrwDDvZQLPpLW2e8d3Z2dJM08bPJ8We8xpmZAx67SNYTfte/tZh93hLa2FRcpUWdrFIX@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ4zDw7/728+2OaFJYVTLdFgXYZ8kwdT2//VpLlruBRWtrsuM/
	4rh7njPQqdzt6LkksZd2sLHltWC8EAyo7VIIHRIS4x+FWDXhU09MJ1eQSZ/rBgDsON5dLMdNiVq
	dXQ==
X-Google-Smtp-Source: AGHT+IHjhS6ytMaXVNJ7Du5d3Tnuyl5IqlbWdUPN0Qe/yqUE5wuMU08eLueRWtToK/GsWuj6EncVLrrZ1A==
X-Received: from wmbei22.prod.google.com ([2002:a05:600c:3f16:b0:459:e0a8:599b])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4ec7:b0:458:a850:f857
 with SMTP id 5b1f17b1804b1-459f4f48b6amr119732475e9.31.1754907589158; Mon, 11
 Aug 2025 03:19:49 -0700 (PDT)
Date: Mon, 11 Aug 2025 11:19:40 +0100
In-Reply-To: <20250811101947.3637632-1-tabba@google.com>
Mime-Version: 1.0
References: <20250811101947.3637632-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.703.g449372360f-goog
Message-ID: <20250811101947.3637632-2-tabba@google.com>
Subject: [PATCH v2 1/8] KVM: arm64: Rename pkvm.enabled to pkvm.is_protected
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	vdonnefort@google.com, qperret@google.com, sebastianene@google.com, 
	keirf@google.com, smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_031951_075410_F3A83BBA 
X-CRM114-Status: GOOD (  14.78  )
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

The 'pkvm.enabled' field in struct kvm_protected_vm is confusingly
named. Its purpose is to indicate whether a VM is a _protected_ VM under
pKVM, and not whether the VM itself is enabled or running.

For a non-protected VM, the VM can be fully active and running, yet this
field would be false. This ambiguity can lead to incorrect assumptions
about the VM's operational state and makes the code harder to reason
about.

Rename the field to 'is_protected' to make it unambiguous that the flag
tracks the protected status of the VM.

No functional change intended.

Reviewed-by: Kunwu Chan <kunwu.chan@linux.dev>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 4 ++--
 arch/arm64/kvm/hyp/nvhe/pkvm.c    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 2f2394cce24e..a4289c2f13f5 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -252,7 +252,7 @@ struct kvm_protected_vm {
 	pkvm_handle_t handle;
 	struct kvm_hyp_memcache teardown_mc;
 	struct kvm_hyp_memcache stage2_teardown_mc;
-	bool enabled;
+	bool is_protected;
 };
 
 struct kvm_mpidr_data {
@@ -1548,7 +1548,7 @@ struct kvm *kvm_arch_alloc_vm(void);
 
 #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
 
-#define kvm_vm_is_protected(kvm)	(is_protected_kvm_enabled() && (kvm)->arch.pkvm.enabled)
+#define kvm_vm_is_protected(kvm)	(is_protected_kvm_enabled() && (kvm)->arch.pkvm.is_protected)
 
 #define vcpu_is_protected(vcpu)		kvm_vm_is_protected((vcpu)->kvm)
 
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 338505cb0171..6198c1d27b5b 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -406,7 +406,7 @@ static void init_pkvm_hyp_vm(struct kvm *host_kvm, struct pkvm_hyp_vm *hyp_vm,
 	hyp_vm->host_kvm = host_kvm;
 	hyp_vm->kvm.created_vcpus = nr_vcpus;
 	hyp_vm->kvm.arch.mmu.vtcr = host_mmu.arch.mmu.vtcr;
-	hyp_vm->kvm.arch.pkvm.enabled = READ_ONCE(host_kvm->arch.pkvm.enabled);
+	hyp_vm->kvm.arch.pkvm.is_protected = READ_ONCE(host_kvm->arch.pkvm.is_protected);
 	hyp_vm->kvm.arch.flags = 0;
 	pkvm_init_features_from_host(hyp_vm, host_kvm);
 }
-- 
2.50.1.703.g449372360f-goog


