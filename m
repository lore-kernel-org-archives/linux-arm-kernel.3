Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A845E69E9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 10:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Smbxsi8PbLTPu6HhJ3ZtrU1gOE8VT3JZi9oskB4fii8=; b=0l4tGpToRuxSyD9HMr7CJxI2pE
	/u/b27DON7J5a3PZup/yNaFqu02n9PNNSExXJT2ejXPdewOqSvd31BnipNaG+ThDSnCvYmirdglEI
	ICJna7H4gqWxMUsjvYrntXNBnVc24S14NSTOUvNim/WtqGaEtarPHd2o+ni0Dd8D292yuL2veU3Cp
	4DeqfyN9qDQhxvfv0PwMR3qtrvrFwv0cgxrpreDarq7zij3F7SOyl6PXzjg5Rz5bTpDzzwu+V/2M/
	dFO75lLRIVPphxJcAbAQHq/qiPJpDyQw+O4DtFLAVIk50xpa5lQX/LR6DDYZ5gex0rzj+pwxD3HxM
	drrMTcLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQTU-000000098f9-0MZD;
	Tue, 03 Dec 2024 10:49:48 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQI6-000000095gH-3AOH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 10:38:03 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-5d0c64ce365so2795642a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 02:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733222281; x=1733827081; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Smbxsi8PbLTPu6HhJ3ZtrU1gOE8VT3JZi9oskB4fii8=;
        b=dso4iIozjPZZY6HKkYQjVISU9l+reuqtj127Y0lFnt9WExyYO+7QE7yvwYW35RgGVo
         GlTmklaWdXfdjaB/Oom6WSZ3yWwtWHjQwb2SJuXk87j2DgkIM3SvF4JbRwVZIYS2um5U
         Gf6xXZtvgP9urnMsE+3Kor3YDTzyTgqJ8TWGMer0qAHb2gcRqsV72i4U9XgnNJTUAwua
         w8RTLu91pqASYNY6nB8l7AT+8NKPrrpIgeMp0In8tBEdjW4DNOx/c3ORG5mPUo8AF30d
         wC2P2IWRHz3e5xzdYmojTouDQkhrM+dWBnzKLsYXqgsVeoe+tA12cbd8XbPCd8fsFX8F
         Kexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733222281; x=1733827081;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Smbxsi8PbLTPu6HhJ3ZtrU1gOE8VT3JZi9oskB4fii8=;
        b=ahRkd0M5dS2p/4LiDvUAj7B5Z5+s25g4lbggruZAxL/ivQtUUUDEL6q9in38fEm5tT
         4NYYDVqNNoPTkq2fKaDSX05M3Ty3vH6iaejwg001DVJrJH5lpec5Wm3WXxSUhiBUZb/9
         HgdhEaZOwENUFAYc3DbVhpFjBlj12CWyBH91LxosbSDBPIk9SINhyB5v3Z27UVn9Codt
         sD8RmOFjBE0gOF3a7pt4b/hN4lOxmwYr+WCU3MrH2xTIn5RyGOR6iyeU8FTIiMtrANgL
         nxP0Wp7OsglJSzj+Z5N3GuoCcTL8/7H/bCSlqGXtYSC+K9zQ+TOrGujN85OPbG+aeK6O
         4JHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXe0YlYSNx8Vqovm7F2QQBYCf0sF0WBBxALhmRqiW23y13e6pltbGiiq2zJc4SyL0fZInRwX3UkHiJLOzux2lw@lists.infradead.org
X-Gm-Message-State: AOJu0YwYo3GQOtwxs7rpHw+/9XbirlfT3P06g4C6JuQOn+rAXLAIA3ux
	6InTj+oDLm8JeEL2efeIJLb5OTCfcJreyEEJHzEfPln0l2QdHNt9hSee15jUzryz+ceXJ0xpWFf
	DDOZtSA==
X-Google-Smtp-Source: AGHT+IFpsely1W9hENzdoh4l+A3Db67CgMYOTTsCiRDVa8ZG99eLdQ3hckne6J6ZI5aiGA5XghWwWkBg4p9o
X-Received: from edql13.prod.google.com ([2002:aa7:c30d:0:b0:5d0:2139:dedd])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:4301:b0:5d0:e243:8c57
 with SMTP id 4fb4d7f45d1cf-5d10cb5568dmr1255645a12.9.1733222280831; Tue, 03
 Dec 2024 02:38:00 -0800 (PST)
Date: Tue,  3 Dec 2024 10:37:28 +0000
In-Reply-To: <20241203103735.2267589-1-qperret@google.com>
Mime-Version: 1.0
References: <20241203103735.2267589-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241203103735.2267589-12-qperret@google.com>
Subject: [PATCH v2 11/18] KVM: arm64: Introduce __pkvm_host_unshare_guest()
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
X-CRM114-CacheID: sfid-20241203_023802_791283_675532B0 
X-CRM114-Status: GOOD (  13.27  )
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

In preparation for letting the host unmap pages from non-protected
guests, introduce a new hypercall implementing the host-unshare-guest
transition.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_asm.h              |  1 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |  5 ++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 24 +++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 67 +++++++++++++++++++
 5 files changed, 98 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 449337f5b2a3..0b6c4d325134 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -66,6 +66,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_share_hyp,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
 	__KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
 	__KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
 	__KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index a7976e50f556..e528a42ed60e 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -40,6 +40,7 @@ int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
+int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
 
 bool addr_is_memory(phys_addr_t phys);
 int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index be52c5b15e21..5dfc9ece9aa5 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -64,6 +64,11 @@ static inline bool pkvm_hyp_vcpu_is_protected(struct pkvm_hyp_vcpu *hyp_vcpu)
 	return vcpu_is_protected(&hyp_vcpu->vcpu);
 }
 
+static inline bool pkvm_hyp_vm_is_protected(struct pkvm_hyp_vm *hyp_vm)
+{
+	return kvm_vm_is_protected(&hyp_vm->kvm);
+}
+
 void pkvm_hyp_vm_table_init(void *tbl);
 
 int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index d659462fbf5d..04a9053ae1d5 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -244,6 +244,29 @@ static void handle___pkvm_host_share_guest(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 1) =  ret;
 }
 
+static void handle___pkvm_host_unshare_guest(struct kvm_cpu_context *host_ctxt)
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
+	ret = __pkvm_host_unshare_guest(gfn, hyp_vm);
+put_hyp_vm:
+	put_pkvm_hyp_vm(hyp_vm);
+out:
+	cpu_reg(host_ctxt, 1) =  ret;
+}
+
 static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
@@ -454,6 +477,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_host_share_hyp),
 	HANDLE_FUNC(__pkvm_host_unshare_hyp),
 	HANDLE_FUNC(__pkvm_host_share_guest),
+	HANDLE_FUNC(__pkvm_host_unshare_guest),
 	HANDLE_FUNC(__kvm_adjust_pc),
 	HANDLE_FUNC(__kvm_vcpu_run),
 	HANDLE_FUNC(__kvm_flush_vm_context),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index a69d7212b64c..aa27a3e42e5e 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1413,3 +1413,70 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
 
 	return ret;
 }
+
+static int __check_host_unshare_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ipa)
+{
+	enum pkvm_page_state state;
+	struct hyp_page *page;
+	kvm_pte_t pte;
+	u64 phys;
+	s8 level;
+	int ret;
+
+	ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level);
+	if (ret)
+		return ret;
+	if (level != KVM_PGTABLE_LAST_LEVEL)
+		return -E2BIG;
+	if (!kvm_pte_valid(pte))
+		return -ENOENT;
+
+	state = guest_get_page_state(pte, ipa);
+	if (state != PKVM_PAGE_SHARED_BORROWED)
+		return -EPERM;
+
+	phys = kvm_pte_to_phys(pte);
+	ret = range_is_allowed_memory(phys, phys + PAGE_SIZE);
+	if (WARN_ON(ret))
+		return ret;
+
+	page = hyp_phys_to_page(phys);
+	if (page->host_state != PKVM_PAGE_SHARED_OWNED)
+		return -EPERM;
+	if (WARN_ON(!page->host_share_guest_count))
+		return -EINVAL;
+
+	*__phys = phys;
+
+	return 0;
+}
+
+int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm)
+{
+	u64 ipa = hyp_pfn_to_phys(gfn);
+	struct hyp_page *page;
+	u64 phys;
+	int ret;
+
+	host_lock_component();
+	guest_lock_component(hyp_vm);
+
+	ret = __check_host_unshare_guest(hyp_vm, &phys, ipa);
+	if (ret)
+		goto unlock;
+
+	ret = kvm_pgtable_stage2_unmap(&hyp_vm->pgt, ipa, PAGE_SIZE);
+	if (ret)
+		goto unlock;
+
+	page = hyp_phys_to_page(phys);
+	page->host_share_guest_count--;
+	if (!page->host_share_guest_count)
+		WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_OWNED));
+
+unlock:
+	guest_unlock_component(hyp_vm);
+	host_unlock_component();
+
+	return ret;
+}
-- 
2.47.0.338.g60cca15819-goog


