Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C87E69E9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 10:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s38xN9T/XvfaM/79S4sHcPd1Nmgpw0fQ7Wk8TWQP3tM=; b=ZmR3Vg6Y6v0wllomh9SpTM4LEH
	pnQ9UiGN3iYXvre+2wVE1FrF3RtFyi4mT7l1TDc80i/sgJ02IwuOcz9IwCstCqjVAM6ZsmTfTpP/+
	7rnsczlU5jGE98pRGpUdkzO75vpRg1J6R0xGSkbRX8vzE/xPuX1+YGlstfqSeS2tkxCBfN2fwjM07
	r1z3z6nIMG+CRa0fbCL4vjnoW8eqqIMrg/gPRcC3nQgHusow362ILFz6S9TAKmn4rkR5tdeK0P/uW
	YDyA17AKuG8jkdITnoPgvZU0u6tTqgiwH4Ckmnc7pCSFhKixZwi8pked7nANh0Abs+imonByWOv2p
	Zfj13ObA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQUS-000000098sv-377x;
	Tue, 03 Dec 2024 10:50:48 +0000
Received: from mail-lj1-x249.google.com ([2a00:1450:4864:20::249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQI8-000000095hD-3xMx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 10:38:06 +0000
Received: by mail-lj1-x249.google.com with SMTP id 38308e7fff4ca-2ffd1bb0f13so33248061fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 02:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733222283; x=1733827083; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=s38xN9T/XvfaM/79S4sHcPd1Nmgpw0fQ7Wk8TWQP3tM=;
        b=D5Whdxpfsl0BhcS8rWEiPmQ5UBw6j+9bLSLgaPJ7NSlwb4nNUgB1xVyFdkqtcFI6WJ
         yvQppJ5kHUIbY9/Oldh4kdIKwTUCutd08duTRDTwAZHZeq6iZN9BkTL6ekZHX0PcoA5s
         r+DZn1xbs29lNLgVjBsQIW9L2+QOt9I2SbYFTI0PcRA4oqAGXEc/8zimVMdtbgdRsdnC
         gTIEiSZDXH24FAqxH9Af1+IwSkWOVOyZOgez1Ut2A1R8vNL+iCIDCWrBrs9BFzQy0YW6
         UiLUw5umXWoOQx48mJdNd19mMDkxHHsWEw4KNilL6K1QgvxiS88hbpQY0Xxbqoshrivw
         It7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733222283; x=1733827083;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s38xN9T/XvfaM/79S4sHcPd1Nmgpw0fQ7Wk8TWQP3tM=;
        b=u2fZiTbP70Dl64zsrxNYVOdWw8EpQEKV84AtUhcTc4DtTgmGLNYQqVMQFRWfQhyKN6
         +GIsb//YC4Qwogq75DM6Q1bu4vsInffEyCKTjnA8XDpvhR7PaiWT+9pVcY814bpC0Hib
         5DAJowYXxfUjxR9U4CG6DvhelXu/wC8tZyWnmJirIA9CXy7X7rCKa6Yk3mx7AKwIk70z
         zXCnwyyXndVB3PYygH+42p1slT9KGZboMTsSO1yBV8dlIoWfr7qKq06Qy0TB+ccJo5Qv
         M8rPXtMriv1yruOoj7zS0yoGkeEbwC1wNMYPIOA8Ggf78tISyDdh/Cwh2gOsT/HSTS7h
         EpLw==
X-Forwarded-Encrypted: i=1; AJvYcCXjj2VbmvqoX3aDctvUCD7EN1ZCaErt2V7+CncR/xH0BUXYIoQJytEWsRy3V5VNyZv0uHNb6QxiHkaNSqiaO/Rj@lists.infradead.org
X-Gm-Message-State: AOJu0YyGW34vXcqED67WPcJLLnxbc/whcIxIMBInpuF5iXxZJN/m1MHC
	J+faBK/xJeNqu2lxJPgbIsrIgEqiGXIxhm/FTF8uws4oHF1slgW27+wFFZdRq3f+bPKj6PLhCmb
	GMP5BxQ==
X-Google-Smtp-Source: AGHT+IFntBO/LOmyiPo2CB6E6Ns8WVjgPpUfexcNVdqJeQs2dulJCxuyV2C/KpfJwaEPASs3j3n/XtaL2mEj
X-Received: from edbin8.prod.google.com ([2002:a05:6402:2088:b0:5d0:83a0:b479])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6512:3181:b0:53d:ab12:fbbd
 with SMTP id 2adb3069b0e04-53e12a2e966mr1206040e87.51.1733222282794; Tue, 03
 Dec 2024 02:38:02 -0800 (PST)
Date: Tue,  3 Dec 2024 10:37:29 +0000
In-Reply-To: <20241203103735.2267589-1-qperret@google.com>
Mime-Version: 1.0
References: <20241203103735.2267589-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241203103735.2267589-13-qperret@google.com>
Subject: [PATCH v2 12/18] KVM: arm64: Introduce __pkvm_host_relax_guest_perms()
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
X-CRM114-CacheID: sfid-20241203_023804_981717_8BE62035 
X-CRM114-Status: GOOD (  12.96  )
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

Introduce a new hypercall allowing the host to relax the stage-2
permissions of mappings in a non-protected guest page-table. It will be
used later once we start allowing RO memslots and dirty logging.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_asm.h              |  1 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 20 ++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 23 +++++++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 0b6c4d325134..5d51933e44fb 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -67,6 +67,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_relax_guest_perms,
 	__KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
 	__KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
 	__KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index e528a42ed60e..db0dd83c2457 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -41,6 +41,7 @@ int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
 int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
+int __pkvm_host_relax_guest_perms(u64 gfn, enum kvm_pgtable_prot prot, struct pkvm_hyp_vcpu *vcpu);
 
 bool addr_is_memory(phys_addr_t phys);
 int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 04a9053ae1d5..60dd56bbd743 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -267,6 +267,25 @@ static void handle___pkvm_host_unshare_guest(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 1) =  ret;
 }
 
+static void handle___pkvm_host_relax_guest_perms(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(u64, gfn, host_ctxt, 1);
+	DECLARE_REG(enum kvm_pgtable_prot, prot, host_ctxt, 2);
+	struct pkvm_hyp_vcpu *hyp_vcpu;
+	int ret = -EINVAL;
+
+	if (!is_protected_kvm_enabled())
+		goto out;
+
+	hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
+	if (!hyp_vcpu || pkvm_hyp_vcpu_is_protected(hyp_vcpu))
+		goto out;
+
+	ret = __pkvm_host_relax_guest_perms(gfn, prot, hyp_vcpu);
+out:
+	cpu_reg(host_ctxt, 1) = ret;
+}
+
 static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
@@ -478,6 +497,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_host_unshare_hyp),
 	HANDLE_FUNC(__pkvm_host_share_guest),
 	HANDLE_FUNC(__pkvm_host_unshare_guest),
+	HANDLE_FUNC(__pkvm_host_relax_guest_perms),
 	HANDLE_FUNC(__kvm_adjust_pc),
 	HANDLE_FUNC(__kvm_vcpu_run),
 	HANDLE_FUNC(__kvm_flush_vm_context),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index aa27a3e42e5e..d4b28e93e790 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1480,3 +1480,26 @@ int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm)
 
 	return ret;
 }
+
+int __pkvm_host_relax_guest_perms(u64 gfn, enum kvm_pgtable_prot prot, struct pkvm_hyp_vcpu *vcpu)
+{
+	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
+	u64 ipa = hyp_pfn_to_phys(gfn);
+	u64 phys;
+	int ret;
+
+	if ((prot & KVM_PGTABLE_PROT_RWX) != prot)
+		return -EPERM;
+
+	host_lock_component();
+	guest_lock_component(vm);
+
+	ret = __check_host_unshare_guest(vm, &phys, ipa);
+	if (!ret)
+		ret = kvm_pgtable_stage2_relax_perms(&vm->pgt, ipa, prot, 0);
+
+	guest_unlock_component(vm);
+	host_unlock_component();
+
+	return ret;
+}
-- 
2.47.0.338.g60cca15819-goog


