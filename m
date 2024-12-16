Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4012E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 18:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5r7yCnkAiK5kyLrxO0D/txvshFXcnr6nZkeqCQZICw=; b=ulruoldX0YXs6sHCJYuMfklxUU
	R94UhYd+vimd1nWCDoghM0wC7nukaVmhTTcKcbIz/FYNRCkcRXTIsDORRkPqF6GQndJL1qWOs9MpR
	Aw6fWTOPqcH2d0mzocVM0rZ8GtQ/LOKkK0MXVyIbWD06GuAY8nyWVqieHqEaoXmC+prewTa++p0oQ
	roGE67K2FkIg6kEES82HX3cQDXevoWdxWtyjE0fCgMgqRx1sXjLBYOv3N3X095cWihW+eYvieYMk7
	GqgsUnr7RjEmQ7ddXVkAHdocQYjQ1mBrV5fifIphkehkoR8fC8gx6QDTOfgOWaZt6Cb1YHAFIejG/
	jHgtqDcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFdg-0000000AvsC-1CuO;
	Mon, 16 Dec 2024 18:16:16 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFMa-0000000Ar3g-2AEy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 17:58:37 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-aa689b88293so468713966b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 09:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734371915; x=1734976715; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=b5r7yCnkAiK5kyLrxO0D/txvshFXcnr6nZkeqCQZICw=;
        b=S/7kEhxB5FsL8Bok9QEHEJ6jNo+kwddXY8O/INhJKcC43RdohsuzSLY1lbQm7ADnxg
         Bqq8qk2HmejkNUHAs/fc9epZBrn0m+axPyWIxnsBh9GRdZLcFikq8sRzyTqlTj7thU6A
         9Dd1Gb76+73i3VzG6W+8VWDvk+cmL09L9HZYOKyRxzi2Y/ZV+KRWvN3k24aeI5pfWxP9
         TjWOnOGJGeDKVOKjIDu3hJLZwUzHSz5oAK2AfPS5ZmD7/nE9j1NCF2TxeTn3kXeXGJXW
         a2hAmm++s5lh9fZ42EXf/zHrHI6hh7b8jt+kTapw+lu6b8bzSIurfYNWXvP+UZhhaP+W
         v1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371915; x=1734976715;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b5r7yCnkAiK5kyLrxO0D/txvshFXcnr6nZkeqCQZICw=;
        b=oduw5xL/7rIT0Jews4MSFWY2HvEvs+U63QdgXrSy5VEj4tm1WLevjMbXBAFWYhpmP6
         ybUWt4240ThmiScK5Hd+uE5UIkP7OgmpB6GS06TQp2MylkZ8cNq+X6YxWWrCu6OI+N+1
         DusDxdEoJIZmeIqRTGGSugmDWNmV/iryh6ciOiq5E0uQwnBN0F61C0qYophZSvoi0NBO
         qUCj633S0dpSKehDJIkcWfDbU7m/Zw538NkELj/Eb6suE/5JQAWqeE5b/9pp96c0ZamU
         XmoJKR4yO1wbeYjSsrn4/fkJ8rScextNedk+c+nZWFkaN4SxF5h6cE8ctXzph6JOdm1F
         xPew==
X-Forwarded-Encrypted: i=1; AJvYcCXYK6G4t5hl+ISTHLNYao40qh6bC5bauRzveGV3uWmVerlfhY63b7MgfEs8EaruyqHiu9DyZTQWVnPRsX+wVVcL@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8fml0Votn4zCyBNUdJv7jbt7Jn6IlWUeCKx1UlQ/nQRXKmPIi
	eujMucrIJAoI+n19tcgBxwZoHBVQGk76YD5WRmqED7AfLX7ZirhZsbmiDx45bhPpeDhGFG2IBe/
	etYOIxQ==
X-Google-Smtp-Source: AGHT+IETu+O3p1iOBFO9EmhBHTULF9iIkYmes1FbMSi6hvoepqbMqPvqpSwnKmEI7JcKZIr1ZyErBddwlhp2
X-Received: from edbek12.prod.google.com ([2002:a05:6402:370c:b0:5d0:225b:ed39])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:4584:b0:5d4:5e4:1555
 with SMTP id 4fb4d7f45d1cf-5d63c3200acmr13094867a12.19.1734371915059; Mon, 16
 Dec 2024 09:58:35 -0800 (PST)
Date: Mon, 16 Dec 2024 17:57:59 +0000
In-Reply-To: <20241216175803.2716565-1-qperret@google.com>
Mime-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216175803.2716565-15-qperret@google.com>
Subject: [PATCH v3 14/18] KVM: arm64: Introduce __pkvm_host_test_clear_young_guest()
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
X-CRM114-CacheID: sfid-20241216_095836_556916_FD7E63CC 
X-CRM114-Status: GOOD (  11.47  )
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
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 22 +++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 19 ++++++++++++++++
 4 files changed, 43 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 8663a588cf34..4f97155d6323 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -69,6 +69,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_relax_perms_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_wrprotect_guest,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_test_clear_young_guest,
 	__KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
 	__KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
 	__KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index fc9fdd5b0a52..b3aaad150b3e 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -43,6 +43,7 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum k
 int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
 int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
+int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm);
 
 bool addr_is_memory(phys_addr_t phys);
 int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 98d317735107..616e172a9c48 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -303,6 +303,27 @@ static void handle___pkvm_host_wrprotect_guest(struct kvm_cpu_context *host_ctxt
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
+	hyp_vm = get_np_pkvm_hyp_vm(handle);
+	if (!hyp_vm)
+		goto out;
+
+	ret = __pkvm_host_test_clear_young_guest(gfn, mkold, hyp_vm);
+	put_pkvm_hyp_vm(hyp_vm);
+out:
+	cpu_reg(host_ctxt, 1) = ret;
+}
+
 static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
@@ -516,6 +537,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_host_unshare_guest),
 	HANDLE_FUNC(__pkvm_host_relax_perms_guest),
 	HANDLE_FUNC(__pkvm_host_wrprotect_guest),
+	HANDLE_FUNC(__pkvm_host_test_clear_young_guest),
 	HANDLE_FUNC(__kvm_adjust_pc),
 	HANDLE_FUNC(__kvm_vcpu_run),
 	HANDLE_FUNC(__kvm_flush_vm_context),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 94e4251b5077..0e42c3baaf4b 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1530,3 +1530,22 @@ int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *vm)
 
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
+	ret = __check_host_shared_guest(vm, &phys, ipa);
+	if (!ret)
+		ret = kvm_pgtable_stage2_test_clear_young(&vm->pgt, ipa, PAGE_SIZE, mkold);
+
+	guest_unlock_component(vm);
+	host_unlock_component();
+
+	return ret;
+}
-- 
2.47.1.613.gc27f4b7a9f-goog


