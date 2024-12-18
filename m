Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC18E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 19:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMqHHJAbkvVqmc+ZvuoP/w2AMJ0PvS+huStDXnV02UA=; b=1KO8FsIyWtTz17jmcQLtKVU4F+
	JM6I8xNWiUSsvNpHqjlLDr2yUwey1PO+mR26UL3S4uvnsNJ2cyQDjRoNojVBytbejwKJqQHQtaivI
	4IkwTWhmjBXq8dENXOXW7VZwHH7RKJTo+ldsoN+7Ni804jmdZwRh52Du8APmGyPJaTGL1wfSkMnYA
	wRbqfrqEVA7PciQTt6Wj/1RD914ACq9I1EyeuGHJ6JKW9uJOWuLuNSl4rBdcnhWkkSY+w7oIL7JIh
	CHIPtDBwRyuUDoTO0wokeLINTSJDh2Bpb3JW6+PVXtmvBrvBFVmOGaTalosRWIqtQEfSJl6CdjF0J
	+Dfz3/yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO09u-0000000007T-0K09;
	Wed, 18 Dec 2024 19:56:38 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNzvI-0000000HYP7-2WGF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 19:41:33 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-aa622312962so703449566b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 11:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734550891; x=1735155691; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sMqHHJAbkvVqmc+ZvuoP/w2AMJ0PvS+huStDXnV02UA=;
        b=0UJ5FHzOGKv6n71N6r28q/7q/NJNZwUK3Ca2b0rAjXmf8BaehA2r1i94uXEtIWPtI/
         3GPTnbC8eNFMf2u3seN+F7mBQ0DzYmJ/caL0qBmWbLsdwIP+ITHiGqj4V5H3VhjG8Oal
         QTrHsVCIYGmy2LgcZyWMmyFUgJ0i5nzlOZGmv7L//XSjBEe6umfEChXxewU7zS2kMsQ3
         bkTOCXOuNvJ95Pz2C0EwU7YpwyrVLPU5tWpTNfZoeNxpNWIwYQcM1p4O2glpivy99JaT
         u7KGbFhhS5uTbUTL9BM69WsNF6OQ1oUGdtJbssGxPibROQH8AJTv0Sd2AOom0hEkAl5c
         tSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734550891; x=1735155691;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sMqHHJAbkvVqmc+ZvuoP/w2AMJ0PvS+huStDXnV02UA=;
        b=OG9cG2av3Brj2lqnfNNGgE+xtxb+7gh/Y1ReVsTQAnK5bZczPl/DBVIzLLppSncPxw
         +gywvgAomx4ose8kX+/Eji+V+QR5NYcxlZR5jajvdUOW5H+NHe0fih6gn3X/BeHCbDJz
         BC/thloVSbEntu7CZQPUbFvmATN7fMwMoAzsspyh2G3jLq2SEA8WJEssouVQjWv6OEwr
         DFTdFuJRCOZdINkUGD92Z4LfhDAYF1HrcPnS22R+ppWsxd/fU6hvZPzGOzhgofz8UnbL
         WsSNN+t1xpKWUdLRWlpPbqaQX2xX4a8KDfO6XmyKuVnkUgnWGqCiUYFJhb57tOIDrq7S
         4s0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+qiA9MsroEwaqYn7wKBiApVD2FRM1AEdbx4sNaLS6qs4Od4rhmkvjpzu/4elZDiyY00Y9jI8Wau7lJSa6cXsi@lists.infradead.org
X-Gm-Message-State: AOJu0YzP3lKNMAqirewKbT+bQT8Jf0rn2GTOT3BZ5p/mlpvppqI7lJ9m
	lH6Nf7Fcgob9gOz5urDJ5knCK+jD7pBWjhDg/8UmsCi3kOM0h9sDfMEnix/hzN+s31uGE2Whij7
	IvruJ/g==
X-Google-Smtp-Source: AGHT+IHbX6RfegUQG4Dmsb1kyEyr86HPklOi6/oJALVsWc4EPf0tNeL14jIjXsZpNMuUN7pNAqXTgRwlD+AP
X-Received: from ejdcw14.prod.google.com ([2002:a17:907:160e:b0:aa6:a21b:2ad])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:6a20:b0:aab:8a24:d5a5
 with SMTP id a640c23a62f3a-aabf47a746dmr378800466b.30.1734550890875; Wed, 18
 Dec 2024 11:41:30 -0800 (PST)
Date: Wed, 18 Dec 2024 19:40:54 +0000
In-Reply-To: <20241218194059.3670226-1-qperret@google.com>
Mime-Version: 1.0
References: <20241218194059.3670226-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241218194059.3670226-14-qperret@google.com>
Subject: [PATCH v4 13/18] KVM: arm64: Introduce __pkvm_host_wrprotect_guest()
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
X-CRM114-CacheID: sfid-20241218_114132_656479_FDC0C007 
X-CRM114-Status: GOOD (  11.89  )
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

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_asm.h              |  1 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 21 +++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 19 +++++++++++++++++
 4 files changed, 42 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 66ee8542dcc9..8663a588cf34 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -68,6 +68,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_relax_perms_guest,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_wrprotect_guest,
 	__KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
 	__KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
 	__KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 181aec2d5bc1..0bbfb0e1734c 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -43,6 +43,7 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
 			    enum kvm_pgtable_prot prot);
 int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
+int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
 
 bool addr_is_memory(phys_addr_t phys);
 int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 287e4ee93ef2..98d317735107 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -283,6 +283,26 @@ static void handle___pkvm_host_relax_perms_guest(struct kvm_cpu_context *host_ct
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
+	hyp_vm = get_np_pkvm_hyp_vm(handle);
+	if (!hyp_vm)
+		goto out;
+
+	ret = __pkvm_host_wrprotect_guest(gfn, hyp_vm);
+	put_pkvm_hyp_vm(hyp_vm);
+out:
+	cpu_reg(host_ctxt, 1) = ret;
+}
+
 static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
@@ -495,6 +515,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_host_share_guest),
 	HANDLE_FUNC(__pkvm_host_unshare_guest),
 	HANDLE_FUNC(__pkvm_host_relax_perms_guest),
+	HANDLE_FUNC(__pkvm_host_wrprotect_guest),
 	HANDLE_FUNC(__kvm_adjust_pc),
 	HANDLE_FUNC(__kvm_vcpu_run),
 	HANDLE_FUNC(__kvm_flush_vm_context),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index aa8e0408aebb..94e4251b5077 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1511,3 +1511,22 @@ int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_
 
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
+	ret = __check_host_shared_guest(vm, &phys, ipa);
+	if (!ret)
+		ret = kvm_pgtable_stage2_wrprotect(&vm->pgt, ipa, PAGE_SIZE);
+
+	guest_unlock_component(vm);
+	host_unlock_component();
+
+	return ret;
+}
-- 
2.47.1.613.gc27f4b7a9f-goog


