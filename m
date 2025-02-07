Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06327C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 14:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVbHfeOZZeQwuwJHSY7djFz56cmMNDUZpBf4HXbLLoc=; b=PIBhWNoaq6oIoneAAzoQOpa+9v
	Qf+D4uF/d4wI2UM9VJ5VXGpMI03PfsV4U0ztgpmsnXl7kCf6OeJNq1F5nCbfXtj3MAtON3FMQyxkw
	H5TQU0HwPLDQwAkerSf9CJv29ceMz6PokxBgqzsjhlOoxC9jL14g2Bj8WI5jUdr/baymPvwimj8sU
	c4WOpvwQN8FxTWaXM1D7LceqrG7JYu0KnG2WYs4ZymqsfLYlo7oW43Lm2OiJSt/lW+E+MZG/F1FuV
	rv+K21wP90Arc8u0yNsRBMnyDVuXvVDbqvLOAFI2owqjVWfxVk91v6baTuw39LvlokKXVqTW3GaNg
	cxN3DcsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPoo-00000009yiS-0xVl;
	Fri, 07 Feb 2025 14:58:58 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPkl-00000009y5X-23Am
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 14:54:48 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-5d89a53fc46so2684129a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 06:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738940086; x=1739544886; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EVbHfeOZZeQwuwJHSY7djFz56cmMNDUZpBf4HXbLLoc=;
        b=q1URoJGl+FNjhfy8dSHKgQ3n7DtzT4Y6TOLx7gfijAMOTtADuS2dtX74io8rLvHrf9
         VT17ToYJ+fKiCmMvy8OxTHpVG8W8V9ZFrDfRK38SvPqQs9pBCe8HrMK7QrG++bSPjYWd
         cpd9MQSPv5corR1SntNsn7aw+IyFghzIdyUYG7x3BeVUwaP8ua0vkxyBxUklTe12hpaV
         S1tIjmGyPxVtZ5OuuMw7aTuVm3Uks6xYIAvq/EjwTHht2ckLChzzGZ3DkA2uSwYAiP9g
         zqc9SYl8IYkGYyftzwTE5KHO+HdeWV0jQgnqRzH8CQBLBmtkk4zHhDXBoymX13kDNGcm
         Gn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738940086; x=1739544886;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EVbHfeOZZeQwuwJHSY7djFz56cmMNDUZpBf4HXbLLoc=;
        b=P25v9yTvqg2zRngoT9OKfobtIBbkFFbwVvcBjEkYd+EyjXk6NlV2HLx/Ip9hnxSO0k
         KMuj2i+LgXd5beKb+PhhYF4XJro6lMZxKULEO56dpgYdJ9kKmzeAyQ+gXJsHrhWqTWg6
         wH5WAIlDp/B68L71A9tKPJEYxr8vIrL/QUq0E6jzqEh8l20TyXB2rAKNmxZi6ZnVBL6L
         E8VcVlTPcXBJyAIjbI9/D9RHa4inuZTP+YY9Co6Yoi9woC+SCM4NfxOawzVSLuxInoLW
         4YVzShAF4dnMcx4IZj7gOvIqu/Jwt7xGqgTJahYIBC9f4SNw0VarIxMWHFK5TX6OUalX
         8WPA==
X-Forwarded-Encrypted: i=1; AJvYcCVykH/dpJ8LLtyw0LYFP2zOD7EOnps+YuykQDXZw0PqVMplzbNN8qTkwGPN9231Hr8x8OpPR4ZhTxbTwvmFA+nj@lists.infradead.org
X-Gm-Message-State: AOJu0Ywlneq5XUVCysQ8Fxb1Ed9xmzD+m1Ro2d+5Y9lvQSrvoDqA8k4g
	1jupHevkobF5PjOpUlmiu7facNIL3Wn5Ud5iLVMWSnJbOrgNog+fcaPdnDZPlOC2Vv3Va1Vv1do
	gl+SzLA==
X-Google-Smtp-Source: AGHT+IHcADnZ88ZDBPcCM/6Viy+F4eISrGE+uNYHO/bQ+LOgCwyU9X5ytoU17kork4MbEbCQlQqyCizNz+Zl
X-Received: from edbio9.prod.google.com ([2002:a05:6402:2189:b0:5dc:22e2:2325])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:35c6:b0:5de:5263:ae79
 with SMTP id 4fb4d7f45d1cf-5de5263af0bmr1071447a12.12.1738940085850; Fri, 07
 Feb 2025 06:54:45 -0800 (PST)
Date: Fri,  7 Feb 2025 14:54:38 +0000
In-Reply-To: <20250207145438.1333475-1-qperret@google.com>
Mime-Version: 1.0
References: <20250207145438.1333475-1-qperret@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250207145438.1333475-3-qperret@google.com>
Subject: [PATCH 2/2] KVM: arm64: Simplify np-guest hypercalls
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_065447_528401_D2C928E7 
X-CRM114-Status: GOOD (  16.51  )
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

When the handling of a guest stage-2 permission fault races with an MMU
notifier, the faulting page might be gone from the guest's stage-2 by
the point we attempt to call (p)kvm_pgtable_stage2_relax_perms(). In the
normal KVM case, this leads to returning -EAGAIN which user_mem_abort()
handles correctly by simply re-entering the guest. However, the pKVM
hypercall implementation has additional logic to check the page state
using __check_host_shared_guest() which gets confused with absence of a
page mapped at the requested IPA and returns -ENOENT, hence breaking
user_mem_abort() and hilarity ensues.

Luckily, several of the hypercalls for managing the stage-2 page-table
of NP guests have no effect on the pKVM ownership tracking (wrprotect,
test_clear_young, mkyoung, and crucially relax_perms), so the extra
state checking logic is in fact not strictly necessary. So, to fix the
discrepancy between standard KVM and pKVM, let's just drop the
superfluous __check_host_shared_guest() logic from those hypercalls and
make the extra state checking a debug assertion dependent on
CONFIG_NVHE_EL2_DEBUG as we already do for other transitions.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 69 +++++++++++++++------------
 1 file changed, 38 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 41847c04b270..4c2f6a6a2efe 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -998,63 +998,73 @@ int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *vm)
 	return ret;
 }
 
-int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot)
+static void assert_host_shared_guest(struct pkvm_hyp_vm *vm, u64 ipa)
 {
-	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
-	u64 ipa = hyp_pfn_to_phys(gfn);
 	u64 phys;
 	int ret;
 
-	if (prot & ~KVM_PGTABLE_PROT_RWX)
-		return -EINVAL;
+	if (!IS_ENABLED(CONFIG_NVHE_EL2_DEBUG))
+		return;
 
 	host_lock_component();
 	guest_lock_component(vm);
 
 	ret = __check_host_shared_guest(vm, &phys, ipa);
-	if (!ret)
-		ret = kvm_pgtable_stage2_relax_perms(&vm->pgt, ipa, prot, 0);
 
 	guest_unlock_component(vm);
 	host_unlock_component();
 
-	return ret;
+	WARN_ON(ret && ret != -ENOENT);
 }
 
-int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *vm)
+int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot)
 {
+	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
 	u64 ipa = hyp_pfn_to_phys(gfn);
-	u64 phys;
 	int ret;
 
-	host_lock_component();
-	guest_lock_component(vm);
+	if (pkvm_hyp_vm_is_protected(vm))
+		return -EPERM;
 
-	ret = __check_host_shared_guest(vm, &phys, ipa);
-	if (!ret)
-		ret = kvm_pgtable_stage2_wrprotect(&vm->pgt, ipa, PAGE_SIZE);
+	if (prot & ~KVM_PGTABLE_PROT_RWX)
+		return -EINVAL;
 
+	assert_host_shared_guest(vm, ipa);
+	guest_lock_component(vm);
+	ret = kvm_pgtable_stage2_relax_perms(&vm->pgt, ipa, prot, 0);
 	guest_unlock_component(vm);
-	host_unlock_component();
 
 	return ret;
 }
 
-int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm)
+int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *vm)
 {
 	u64 ipa = hyp_pfn_to_phys(gfn);
-	u64 phys;
 	int ret;
 
-	host_lock_component();
+	if (pkvm_hyp_vm_is_protected(vm))
+		return -EPERM;
+
+	assert_host_shared_guest(vm, ipa);
 	guest_lock_component(vm);
+	ret = kvm_pgtable_stage2_wrprotect(&vm->pgt, ipa, PAGE_SIZE);
+	guest_unlock_component(vm);
 
-	ret = __check_host_shared_guest(vm, &phys, ipa);
-	if (!ret)
-		ret = kvm_pgtable_stage2_test_clear_young(&vm->pgt, ipa, PAGE_SIZE, mkold);
+	return ret;
+}
 
+int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm)
+{
+	u64 ipa = hyp_pfn_to_phys(gfn);
+	int ret;
+
+	if (pkvm_hyp_vm_is_protected(vm))
+		return -EPERM;
+
+	assert_host_shared_guest(vm, ipa);
+	guest_lock_component(vm);
+	ret = kvm_pgtable_stage2_test_clear_young(&vm->pgt, ipa, PAGE_SIZE, mkold);
 	guest_unlock_component(vm);
-	host_unlock_component();
 
 	return ret;
 }
@@ -1063,18 +1073,15 @@ int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu)
 {
 	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
 	u64 ipa = hyp_pfn_to_phys(gfn);
-	u64 phys;
 	int ret;
 
-	host_lock_component();
-	guest_lock_component(vm);
-
-	ret = __check_host_shared_guest(vm, &phys, ipa);
-	if (!ret)
-		kvm_pgtable_stage2_mkyoung(&vm->pgt, ipa, 0);
+	if (pkvm_hyp_vm_is_protected(vm))
+		return -EPERM;
 
+	assert_host_shared_guest(vm, ipa);
+	guest_lock_component(vm);
+	kvm_pgtable_stage2_mkyoung(&vm->pgt, ipa, 0);
 	guest_unlock_component(vm);
-	host_unlock_component();
 
 	return ret;
 }
-- 
2.48.1.502.g6dc24dfdaf-goog


