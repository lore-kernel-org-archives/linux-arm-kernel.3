Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D329FE69E9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 10:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yheeE+t2hfFO7oe3GWstJ0qpUPIfuz1IZC6MMTVFSoE=; b=CjixvTm8CUuNM19/qo0cx/Vzo2
	1xrXUhwSW1tnf041IKf2T5gDxBV4KDDJ8MCGgG98YuRF0JrIiqJO4AJNNnbHqB7Z/d+bxufe7vd9I
	SUt26dyRZKYtFFObCLxCzfTe0r8KRmYtCypWxDSFwNKeu1EqDRm3/s/iMNbAnaCgBRSpLmMxPFpI5
	c9ss0upsnT9NwNfy+AymfrwUPky3gZQ9z46CjdJ0NXWKsTAyJ3pulPC+8nOdSiIAq9bEI2RUuOB0p
	re8EDdxQZOFzrhgbV4cMdL6o2pVOVFWIkLXyD+pIBynxCRmdCuUL6C1vMu9ESCVbijoKTI46+s5Yy
	wW4/Iqzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQVQ-0000000990V-1Ztk;
	Tue, 03 Dec 2024 10:51:48 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQIA-000000095iB-2Rts
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 10:38:07 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-5d0e78fb68aso2354397a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 02:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733222285; x=1733827085; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yheeE+t2hfFO7oe3GWstJ0qpUPIfuz1IZC6MMTVFSoE=;
        b=LkfC6xzWSgZ7Oln3TiH6rwYUliqvfjc/tsynd6Wviu+fuzU2KU4KBpEfQpmGS6I+vU
         FDslItwWC7qOB+n8QT2ubY3H1650I0xhl8R2+j0SVNBp90PwPiNPxof9IkcEhjPBz9ky
         nurqrUDVCPXqv6/K33dLBATN+9tWo9kaayOWY3IkoAiPSseXCk/FxfkoYExDyCD1VUtM
         f6+nOv0dDe2+T3o4u83KAcvglEV6FRfv1gqOX8LFGgBkB3GoZnabDLI5mr7nE8x7/T8d
         OdLHW+ppflX9fL+QL2+WHcvQ5uUwkFQpTiIlBt/N6OkCzq7+m0g3mTkXnC1H1NAflmQo
         0aqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733222285; x=1733827085;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yheeE+t2hfFO7oe3GWstJ0qpUPIfuz1IZC6MMTVFSoE=;
        b=gPcKfdPPwBusOw3RYi/eRQR53xK4Z2khEQs5BRU/DvHH8ekAvq8fogZw9Y+pojErL1
         qT7ssAGkESK7+XBPJHtpH4kpkSic+eVwDojuXWmK0snQ9jM5yyOyjaA8p9Z00niXB1ae
         JKrsDJQ3pQ2KRRAhmK5Kzwd2LQyQ6/5EalZeZJmtgWV1UjNjyxL4Ovw61faSJEJJGGue
         CKHfWuodh+IMp3HauQpv/o9zXNiOVmOa5VkPgDdavi4G1tgQ/6ZbhBS/Q5OK8agz3E2h
         z7BeupA+tHaVfWzcchpczj1rB+pVe6VaCf1/yZ8Z40In3x8BIOziLzXTj8kCwt7+rNny
         IQUw==
X-Forwarded-Encrypted: i=1; AJvYcCXY7bDqj1cQ0YaxKD5Z1RKaXQan5GmOnpkUiTZc0rn5mKHG3OSuHqO9mOLhC1ELhtf6D028GVqn5g/2FcaU2spq@lists.infradead.org
X-Gm-Message-State: AOJu0YyydCkLcYsYYBzst5GX1BckVgvZymRKNc9gWHwk4qXfllBdVUQW
	k/X2EidKL4VnMOE7+HJBnj8Vv2etkB8olLYyBZPOOeE4Va+OEx99C0dseMgZE08nCpfDLieGx5/
	9pT8WgA==
X-Google-Smtp-Source: AGHT+IExVeQtcYGpfAepPbJDg3yiYredE0DKYzNxlYui1UocLOJSueSs8b8zmvT5eRKNrveJMBgk42mIYHn3
X-Received: from edyp8.prod.google.com ([2002:a05:6402:748:b0:5cf:bcbb:8179])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:3456:b0:5d1:1064:3274
 with SMTP id 4fb4d7f45d1cf-5d11064369fmr408490a12.16.1733222285093; Tue, 03
 Dec 2024 02:38:05 -0800 (PST)
Date: Tue,  3 Dec 2024 10:37:30 +0000
In-Reply-To: <20241203103735.2267589-1-qperret@google.com>
Mime-Version: 1.0
References: <20241203103735.2267589-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241203103735.2267589-14-qperret@google.com>
Subject: [PATCH v2 13/18] KVM: arm64: Introduce __pkvm_host_wrprotect_guest()
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
X-CRM114-CacheID: sfid-20241203_023806_620078_340337B8 
X-CRM114-Status: GOOD (  11.98  )
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

Introduce a new hypercall to remove the write permission from a
non-protected guest stage-2 mapping. This will be used for e.g. enabling
dirty logging.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_asm.h              |  1 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 24 +++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 19 +++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 5d51933e44fb..4d7d20ea03df 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -68,6 +68,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_relax_guest_perms,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_wrprotect_guest,
 	__KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
 	__KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
 	__KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index db0dd83c2457..8658b5932473 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -42,6 +42,7 @@ int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
 int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_relax_guest_perms(u64 gfn, enum kvm_pgtable_prot prot, struct pkvm_hyp_vcpu *vcpu);
+int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
 
 bool addr_is_memory(phys_addr_t phys);
 int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 60dd56bbd743..3feaf2119e51 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -286,6 +286,29 @@ static void handle___pkvm_host_relax_guest_perms(struct kvm_cpu_context *host_ct
 	cpu_reg(host_ctxt, 1) = ret;
 }
 
+static void handle___pkvm_host_wrprotect_guest(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
+	DECLARE_REG(u64, gfn, host_ctxt, 2);
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
+	ret = __pkvm_host_wrprotect_guest(gfn, hyp_vm);
+put_hyp_vm:
+	put_pkvm_hyp_vm(hyp_vm);
+out:
+	cpu_reg(host_ctxt, 1) = ret;
+}
+
 static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
@@ -498,6 +521,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_host_share_guest),
 	HANDLE_FUNC(__pkvm_host_unshare_guest),
 	HANDLE_FUNC(__pkvm_host_relax_guest_perms),
+	HANDLE_FUNC(__pkvm_host_wrprotect_guest),
 	HANDLE_FUNC(__kvm_adjust_pc),
 	HANDLE_FUNC(__kvm_vcpu_run),
 	HANDLE_FUNC(__kvm_flush_vm_context),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index d4b28e93e790..89312d7cde2a 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1503,3 +1503,22 @@ int __pkvm_host_relax_guest_perms(u64 gfn, enum kvm_pgtable_prot prot, struct pk
 
 	return ret;
 }
+
+int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *vm)
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
+		ret = kvm_pgtable_stage2_wrprotect(&vm->pgt, ipa, PAGE_SIZE);
+
+	guest_unlock_component(vm);
+	host_unlock_component();
+
+	return ret;
+}
-- 
2.47.0.338.g60cca15819-goog


