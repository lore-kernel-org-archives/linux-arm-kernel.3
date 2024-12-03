Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A769FE69EA6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 10:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9JsvIEZXCS7Jr+kmsJzau1fLfSngv5TQOi1bKyxyJ0=; b=vIchlmUTAxSGGzPzwontxOYUy5
	KMr8shrc7XhbmBQFCDmjcMHP3x3oTAHx+t9wLQYqn9txtPUG/xi7i8u3eJV8WXnfHexZX6QIrr0M8
	La4eQAHyhgli4m9JJ5toFLsFjAR5rEQeDJrAx1gPbvs+opruNKr25IqPNwbIyro0x4yO9BJ7xQDbD
	GEeVKd7aGpb/Bnzc+tzp9NWQdBWYetN5BOxxdVkswBoI3/NMXO8nDhGfSCmi58wa3NPXS9UIbQu09
	d2Br7p8GDWMRU8y+O7MTTdXndB+dYhSBes+G4WbUbCM1VeICaK+1YsqwAMfVD1R0ilzxUmWrtB0UO
	ihOOfjEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQWP-000000099FS-0KPP;
	Tue, 03 Dec 2024 10:52:49 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQIC-000000095j1-43VT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 10:38:10 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-5d0bcd51932so3777888a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 02:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733222287; x=1733827087; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=I9JsvIEZXCS7Jr+kmsJzau1fLfSngv5TQOi1bKyxyJ0=;
        b=mcJ0sqcgs7YdxeX/s2z0z3l3UyqW10ZMYk3BeZscQoltuGT0m6H4wFzDcRnzrVXz/0
         xxswHqddWGtnyFWA9apcHBJg6rioKViPsqyCYAu5S6i2cV3Je9V8IXv5GT68puWEDyQG
         D0MNvEE5f2kQh97eR49OngrRJ0qaH5V/QFTYI26zOh0gCn7j/nUFRudtMFRVcBCUkTg1
         Afyn/6jPR0xOoP7Fkmy1Waug5giKf5cHmFqSlz++kkX0bng47N0y+DA0WI4F0by5YGKC
         NpJ7+YyzrwdMWOJ8tCfo+7mmgmdrKMG+JE4trlU2VosNJZ2PnZHbdzfdzYEBaap/KlEi
         UO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733222287; x=1733827087;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I9JsvIEZXCS7Jr+kmsJzau1fLfSngv5TQOi1bKyxyJ0=;
        b=K8GTLGrFZEN2M+AZ0SawCZSpqR1/5QJOZ1niCNBkjDrMimKlye9SPudtoV90wChLR7
         hasqNeWhL9eykNwjrzLpZSQ9Yr6xKL0oZXFvwAgM/gHNTbWyb59Somzyb2sFRf7ei3dN
         kBv2Dsb0CGLOLWUSYfOCRjZhBGT+28TJs83l8WGwDrn7zcXqm9EDjuiwAsBItS8MWpXg
         U0JEt3qLr2lTMWzwEWtMZ3Kxlmz4BpkT+bN5g9ysM8o5VmxLD/rxRSQmylPFX4c9Q9az
         dCLn6VGr+lZoLP17llWjGOM9Os/izdUdHW/arlYSb8c+xu8gTepw+92eD9DJHunN9pnY
         /VPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTqLXRHQ1I5ecNiAszbGAlBAI4vWgbQgy5PpjV1VweFLWnAUPSejBRlvSSJ9IlVVMZ9/pjyf276tXxHxh8hd/R@lists.infradead.org
X-Gm-Message-State: AOJu0YzgduX1B2mMoZcDGra5hVFOqO5RpbqV/ZLH8U8TsqKB2SsS81jg
	cdczaY+v587b4t6ikh5wPKQLt8cPBbvzTPgQQxZoacfdEa1s+5NGbG7ahsd6aNoFlDrv4UZdr9H
	XjRTj5w==
X-Google-Smtp-Source: AGHT+IFdWegGcOuq4VNlCrIIkQlpyo4Z++Lp+kcClHAhjJ/QKpJll2AcCbmRcGxxqa+FPKwZaF2FsSqM5zPQ
X-Received: from edsw18.prod.google.com ([2002:aa7:da52:0:b0:5d0:6d5c:d4e4])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:1ecf:b0:5d0:b4ea:9743
 with SMTP id 4fb4d7f45d1cf-5d10cb57048mr1964875a12.8.1733222287044; Tue, 03
 Dec 2024 02:38:07 -0800 (PST)
Date: Tue,  3 Dec 2024 10:37:31 +0000
In-Reply-To: <20241203103735.2267589-1-qperret@google.com>
Mime-Version: 1.0
References: <20241203103735.2267589-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241203103735.2267589-15-qperret@google.com>
Subject: [PATCH v2 14/18] KVM: arm64: Introduce __pkvm_host_test_clear_young_guest()
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_023809_009988_1D07D266 
X-CRM114-Status: GOOD (  12.17  )
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

Plumb the kvm_stage2_test_clear_young() callback into pKVM for
non-protected guest. It will be later be called from MMU notifiers.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_asm.h              |  1 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 25 +++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 19 ++++++++++++++
 4 files changed, 46 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 4d7d20ea03df..cb676017d591 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -69,6 +69,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_relax_guest_perms,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_wrprotect_guest,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_test_clear_young_guest,
 	__KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
 	__KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
 	__KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 8658b5932473..554ce31882e6 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -43,6 +43,7 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum k
 int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_relax_guest_perms(u64 gfn, enum kvm_pgtable_prot prot, struct pkvm_hyp_vcpu *vcpu);
 int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
+int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm);
 
 bool addr_is_memory(phys_addr_t phys);
 int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 3feaf2119e51..67cb6e284180 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -309,6 +309,30 @@ static void handle___pkvm_host_wrprotect_guest(struct kvm_cpu_context *host_ctxt
 	cpu_reg(host_ctxt, 1) = ret;
 }
 
+static void handle___pkvm_host_test_clear_young_guest(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
+	DECLARE_REG(u64, gfn, host_ctxt, 2);
+	DECLARE_REG(bool, mkold, host_ctxt, 3);
+	struct pkvm_hyp_vm *hyp_vm;
+	int ret = -EINVAL;
+
+	if (!is_protected_kvm_enabled())
+		goto out;
+
+	hyp_vm = get_pkvm_hyp_vm(handle);
+	if (!hyp_vm)
+		goto out;
+	if (pkvm_hyp_vm_is_protected(hyp_vm))
+		goto put_hyp_vm;
+
+	ret = __pkvm_host_test_clear_young_guest(gfn, mkold, hyp_vm);
+put_hyp_vm:
+	put_pkvm_hyp_vm(hyp_vm);
+out:
+	cpu_reg(host_ctxt, 1) = ret;
+}
+
 static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
@@ -522,6 +546,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_host_unshare_guest),
 	HANDLE_FUNC(__pkvm_host_relax_guest_perms),
 	HANDLE_FUNC(__pkvm_host_wrprotect_guest),
+	HANDLE_FUNC(__pkvm_host_test_clear_young_guest),
 	HANDLE_FUNC(__kvm_adjust_pc),
 	HANDLE_FUNC(__kvm_vcpu_run),
 	HANDLE_FUNC(__kvm_flush_vm_context),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 89312d7cde2a..0e064a7ed7c4 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1522,3 +1522,22 @@ int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *vm)
 
 	return ret;
 }
+
+int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm)
+{
+	u64 ipa = hyp_pfn_to_phys(gfn);
+	u64 phys;
+	int ret;
+
+	host_lock_component();
+	guest_lock_component(vm);
+
+	ret = __check_host_unshare_guest(vm, &phys, ipa);
+	if (!ret)
+		ret = kvm_pgtable_stage2_test_clear_young(&vm->pgt, ipa, PAGE_SIZE, mkold);
+
+	guest_unlock_component(vm);
+	host_unlock_component();
+
+	return ret;
+}
-- 
2.47.0.338.g60cca15819-goog


