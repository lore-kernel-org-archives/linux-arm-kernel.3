Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60785E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 19:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VDPUkbv296iWYan9Z5++FJBPBOfCRdoKnkMuk2JBHhs=; b=kO09SO81rK8LMEfWUZD0rooa/q
	RIAjeyUxde4JBVsjmdiarDxgIALO2PQxGAntnIT3hKki13PXSGgvWFFX2plyLuGFY2c2N6aH9xUnD
	vO1FQbnQNbz8SGiOYnez9yOcNsn5AcOBgCNP2Vuqcl5cfB/Grz/XNceJiwrwC7IrAOAFh8HBcoEOb
	Fx3QywHzYaD1HWMp7Bvib99apPUeUAam/qUfqY3FFX1ZIo7rTvvP5fs+/zTaYjjxEt5FrwcYL2ZQO
	yTy4vSKHjfpBtrz6J8h8hDaaSizINoslco+Vru11jPN6nGRb9B44v/qTYtWyJbJ6N6Fn7qLrxCNzU
	ZOBWECIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO08q-0000000Hb3S-1tug;
	Wed, 18 Dec 2024 19:55:32 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNzvG-0000000HYOg-25VG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 19:41:31 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-5d3ded861f5so6276315a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 11:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734550889; x=1735155689; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VDPUkbv296iWYan9Z5++FJBPBOfCRdoKnkMuk2JBHhs=;
        b=W82kSmOkcF6Dq+wTtyeiczbyV7hMHVomi2FcpByXNfIxwC7XolpqMROQw+L9qQossR
         83d/LWHV4ZrsIK0P1IGX6Sh0Dds0e5l9cacQF/o5KezEg/Lx0V4eOrIH4nL2/Yh2gEvq
         vPk4+RG2pzsNQ7ONWvTk6DfPiOGeea2DdECp7oAEk0cEyz0H/fXUhj7zXKJKKUuSY8iw
         1yt/ZjVLu5q1Vd5k2ag9TRsyQaswjV3zj3fnae+lztAMGGsWNmLWBIfE58N7eI6zuuQC
         nliyz6zLOWS+jKGZYqtxKwLBZISNnPdgGC+iphgrbOfcKSsri3Xvyv4DEFTjWtz5D7Qf
         iCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734550889; x=1735155689;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VDPUkbv296iWYan9Z5++FJBPBOfCRdoKnkMuk2JBHhs=;
        b=PLpQDD5aPFleHpV04m8sLgwIp4Hadx/E6dmyPcuqRNUDO8Am7odpdJG3AJ0OBo+Mii
         FcFAUngm0x7qlW7B5TyXl6YbGP49/D6kvoqKma2/Uwr9DsEhpdBOKQpnoYP3Knp96Pxk
         qZdYDzQaH9GgufwowJuZrVwUNqEYu9kv8mbY+JatWdQ4qNPDoVowzy6F+nboHb7LEGla
         ZkXlTF9oruYQD4yM2sGRPIjudnBXYmPv6pZp5WQofY2BnK85BShSkwbUzQCKq6/BcbpA
         1tS5Ipeiy/K3m1Vqj4Fr7gBjS+m3TMt7cO/WRs4hqyxDSHuFAprPn3GXHtfCjEeEtFiX
         b1XA==
X-Forwarded-Encrypted: i=1; AJvYcCWlVq+lsJJgFdf25b8UMd3TTK4QNKJPk5Ulv7CUs0Tan8maLl3upxZFhSADqHPvNe3cO8vvZV/SlfrL536cqu8m@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi/19eQ8PZrV3jzCOmFcoHpGXLZMt5J27QOokCPl7LojPFq/Bo
	E61C5TU6yodm+/D5KSctumNs1YxTqdsp7wux5xWSDLZyvgJSbQ3pZv9jk6Qgmn7kGWUB2d7X63I
	oF2VQAg==
X-Google-Smtp-Source: AGHT+IE7/e9KoTrxRJDGtgOfqDEtYC47rptGi8yOrodHJhAQ85i/v+sfJS1qFdI61ia7HmO/sjzRCdIREpzo
X-Received: from edb1.prod.google.com ([2002:a05:6402:2381:b0:5d0:2a58:40c4])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:524d:b0:5d0:d183:cc05
 with SMTP id 4fb4d7f45d1cf-5d7ee3a2948mr4239362a12.5.1734550888759; Wed, 18
 Dec 2024 11:41:28 -0800 (PST)
Date: Wed, 18 Dec 2024 19:40:53 +0000
In-Reply-To: <20241218194059.3670226-1-qperret@google.com>
Mime-Version: 1.0
References: <20241218194059.3670226-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241218194059.3670226-13-qperret@google.com>
Subject: [PATCH v4 12/18] KVM: arm64: Introduce __pkvm_host_relax_guest_perms()
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
X-CRM114-CacheID: sfid-20241218_114130_534422_9AD69333 
X-CRM114-Status: GOOD (  12.69  )
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

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_asm.h              |  1 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 20 ++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 23 +++++++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 0b6c4d325134..66ee8542dcc9 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -67,6 +67,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_relax_perms_guest,
 	__KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
 	__KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
 	__KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index e6d080b71779..181aec2d5bc1 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -42,6 +42,7 @@ int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
 			    enum kvm_pgtable_prot prot);
 int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
+int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
 
 bool addr_is_memory(phys_addr_t phys);
 int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 3c3a27c985a2..287e4ee93ef2 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -264,6 +264,25 @@ static void handle___pkvm_host_unshare_guest(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 1) =  ret;
 }
 
+static void handle___pkvm_host_relax_perms_guest(struct kvm_cpu_context *host_ctxt)
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
+	ret = __pkvm_host_relax_perms_guest(gfn, hyp_vcpu, prot);
+out:
+	cpu_reg(host_ctxt, 1) = ret;
+}
+
 static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
@@ -475,6 +494,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_host_unshare_hyp),
 	HANDLE_FUNC(__pkvm_host_share_guest),
 	HANDLE_FUNC(__pkvm_host_unshare_guest),
+	HANDLE_FUNC(__pkvm_host_relax_perms_guest),
 	HANDLE_FUNC(__kvm_adjust_pc),
 	HANDLE_FUNC(__kvm_vcpu_run),
 	HANDLE_FUNC(__kvm_flush_vm_context),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 30243b7922f1..aa8e0408aebb 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1488,3 +1488,26 @@ int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *vm)
 
 	return ret;
 }
+
+int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot)
+{
+	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
+	u64 ipa = hyp_pfn_to_phys(gfn);
+	u64 phys;
+	int ret;
+
+	if (prot & ~KVM_PGTABLE_PROT_RWX)
+		return -EINVAL;
+
+	host_lock_component();
+	guest_lock_component(vm);
+
+	ret = __check_host_shared_guest(vm, &phys, ipa);
+	if (!ret)
+		ret = kvm_pgtable_stage2_relax_perms(&vm->pgt, ipa, prot, 0);
+
+	guest_unlock_component(vm);
+	host_unlock_component();
+
+	return ret;
+}
-- 
2.47.1.613.gc27f4b7a9f-goog


