Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6F6D132CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 14:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZKgkOXED2gTnPKJGzc+iVeFIN1NowIl4QRyN7m6aZA=; b=sJuIcQPHLu1uEhkBTPsptKYEu/
	eTO1RHfD8jg/2YzxH37Id4DjtyoBLsC3yL982tfy8aOFMerGlSD7JzTDyR/fdtRtO/YujUfm3PE9o
	6nGC4GnGaSdDrPk55sEcM/0sI4MaVCKHqCPecOKc0awvNmwW+UZ9PLUnrk+m5P6y8lrT//NkFIZvN
	28jh5lV9UDZsiajdd32Bdu7LRoWxNKj5VUJc7/3GYceFOCL9GwDVELqXsUUy50h4Ms56euM6xFS/W
	wXVBhn7GQNeDj7JYxmpUWbFn/VWyQc9zjpjDvnZd553d1FUyiMgLlLqXBR38Fjh970HBEPbsUmo4s
	XrxQhNJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xe0-0000000DyaH-1H5o;
	Mon, 04 Nov 2024 14:01:24 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xCA-0000000DsPy-3zOe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:32:40 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e30df208cadso5630709276.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 05:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730727157; x=1731331957; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZKgkOXED2gTnPKJGzc+iVeFIN1NowIl4QRyN7m6aZA=;
        b=s4wjbD9DRpwvu8GJ5YZUFi7ur+LiFJy321vN/X9W730GPButI1DNA68vwg0KxvfCAZ
         93VXdpP0qC2/bT0+YkgqxpBuuWy6l7ksToOGXH8Q97/axFLt0xgljj99eg8VrqUUQ8TU
         0l+CZ+hVqUp/oDLm5qL0Dj0OHYMxYsT6KN+aO6kYZsT9fDfiOecFNur8Af02X+J4IgED
         rOmZtA7sGZqQHJPDUELf5cV5AgCGYSzjtLI4918kxlw2H292gwAoMML1DEc+cS1IR1RN
         3QiexhsDmu4N4iGJVy6RSqCtzYISdlAJHgj0dDT92fAfNb86gjpBiYb20Df6DEPf9YaB
         cCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730727157; x=1731331957;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZKgkOXED2gTnPKJGzc+iVeFIN1NowIl4QRyN7m6aZA=;
        b=tjpM0yeZleLhG5D+oJ76Jq+MzkcSWHIH4JFdDrs/rYVYPAZ+rREZDX5U7XGeFRnxvV
         CNnS5awcnDx76b0G7HL5uPxpC9wz75su86n0YC1pTvvRFCBdRNOs54No7A4pOlM4vN7d
         VeCAJWo0sqdjGlzFObcvoAIQx/VkJl2waomKwNi3VIdnm59YHK6txx/YgoXQjRftSBSu
         BB3qqT8T3Mm/hhZqP/Poi131ewoXwPAD9wfs60zYvAKxpBObCUQhaBj3kpu9KR2mLnQJ
         QGzCT3P2GYOrkR61qOYhiQbKjcKHaNkEVJliGUOm5NeMAApUpUKTTylIBfVER+8tRUuI
         fg1A==
X-Forwarded-Encrypted: i=1; AJvYcCUamjlAsUqBjqdP97Ne9hI11dVXcc8NV1wP1VOCUXhafR0LDJ8mR/aV8JKmm3j21Ms1PZJDV7YCT91V/T0UeEWx@lists.infradead.org
X-Gm-Message-State: AOJu0YzdsOHWxcCeCVJEAuzl6bvLComa0lN+AINMTVgdt1dE+QE+o4tw
	a2ydRyWr9I3aBA+6V7aB819RTkWi+qTOzTcTpNNgTR2WPCmA4fsTi5/1Sd4S939s4qrY2FnYUUy
	RNv+W8g==
X-Google-Smtp-Source: AGHT+IEdndu9c8L5M9LMgNH5yUWxnOXjnairdpcGEJ+HkfnHM8iJ67/17rm/DHBApYmZlQ7LHV+rdMkopkCC
X-Received: from big-boi.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:129])
 (user=qperret job=sendgmr) by 2002:a05:6902:1801:b0:e30:b89f:e3d with SMTP id
 3f1490d57ef6-e3328a15f4emr19583276.1.1730727157377; Mon, 04 Nov 2024 05:32:37
 -0800 (PST)
Date: Mon,  4 Nov 2024 13:31:58 +0000
In-Reply-To: <20241104133204.85208-1-qperret@google.com>
Mime-Version: 1.0
References: <20241104133204.85208-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241104133204.85208-13-qperret@google.com>
Subject: [PATCH 12/18] KVM: arm64: Introduce __pkvm_host_relax_guest_perms()
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
X-CRM114-CacheID: sfid-20241104_053239_017154_5093F02C 
X-CRM114-Status: GOOD (  13.11  )
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
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 20 +++++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 25 +++++++++++++++++++
 4 files changed, 47 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index e67efee936b6..f528656e8359 100644
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
index 68bbef69d99a..d3210719e247 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -265,6 +265,25 @@ static void handle___pkvm_host_unshare_guest(struct kvm_cpu_context *host_ctxt)
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
@@ -483,6 +502,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_host_unshare_hyp),
 	HANDLE_FUNC(__pkvm_host_share_guest),
 	HANDLE_FUNC(__pkvm_host_unshare_guest),
+	HANDLE_FUNC(__pkvm_host_relax_guest_perms),
 	HANDLE_FUNC(__kvm_adjust_pc),
 	HANDLE_FUNC(__kvm_vcpu_run),
 	HANDLE_FUNC(__kvm_flush_vm_context),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index f7476a29e1a9..fc6050dcf904 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1491,3 +1491,28 @@ int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm)
 
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
+	if (ret)
+		goto unlock;
+
+	ret = kvm_pgtable_stage2_relax_perms(&vm->pgt, ipa, prot, 0);
+unlock:
+	guest_unlock_component(vm);
+	host_unlock_component();
+
+	return ret;
+}
-- 
2.47.0.163.g1226f6d8fa-goog


