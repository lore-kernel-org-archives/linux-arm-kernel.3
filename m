Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF4AD132CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 14:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0O9w3V8+9zARf3Lj4YZXmAy+l2Op+F1G9lpGS1sACo4=; b=B0rXxg7sxV/qE/2XpJusETO2Ib
	JsrCFUvxnQYTQbzd4+9LkPnNmA+th7emo0L6GbNZuQvy6iIkCpJZW4KVg0dWPmLsVHmONdI8/WHft
	XwpaJ1HzLH/QQ5x3KNGOagIJfpK4iTZv4xeG47FH8eJSVQaY8Pqdsl+4NCm+gf6TnQKz+zhYv/ZFh
	8M9+7f73cQ5YnOR3K2zab8gHqCnJ/W4Je7aKjjt1Qxq6/UxTI9sB1i3W6PtBTS4t0qtQqHAHR2aEW
	ZGVYVhmLLqCI2A/W4IzyOlfroO1jBP7yrQRCNuaejBQB5XbElcZKwa/vKFIxJGmGTpTe9TKmWZQFr
	mPF6rlrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xiw-0000000DzCh-1S2g;
	Mon, 04 Nov 2024 14:06:30 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xCH-0000000DsRX-2X2g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:32:47 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e32ff6f578eso4836213276.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 05:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730727164; x=1731331964; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0O9w3V8+9zARf3Lj4YZXmAy+l2Op+F1G9lpGS1sACo4=;
        b=bqwURE0vr+L+QIxUjT44dYwWB3N9rsbS0zUJTzlqzWXjkEscF3wHVb4xh5dp4Dl3vA
         b+ZCBccmSwYRkjvHnDTrhrIZ4DiGNGKbuXeuc5LV7s5Zq5r+kEgg3UiTeMJWVwtmS9C0
         agcOEkOrXwgJVFy5511qN3VoFhQhyHwsgspoP2Fg4qxY6JduTHW+wYYy4UCYRvB6CfDO
         HP1VCOiQEL3wZlRSLfzSWbhDq5f7+1jisVHumt1i2AMWYJw8wiMt+cZIMlKniSdJGwNI
         taen+MGQNasOryp4ut3VcNuIhLqBabPsDy8DT0BWG1XmbNmv1RwYTmtzQqDVwUpSjQFB
         b0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730727164; x=1731331964;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0O9w3V8+9zARf3Lj4YZXmAy+l2Op+F1G9lpGS1sACo4=;
        b=rvgPdJb1Ull6AXWRaDLAtKiunkzhRCZyxavnU2OLTaATUfDPVDn0XXJzW8e1ycrhkd
         1Gb87M/8xmVYXfaZJx18WI6DCzhhxdN6VO62bIX6xgrglHos8TqmMZe7nkQID3/+d+0b
         3ZYRhbCu4KofRnuKJBMDK8EqB+Prh0HzfDd9PfNhB202wkblZdfICo2hUtikXesIgb4Q
         4jMDkst4avyXfKuF6PjqJmjvFvVxkuKFMmAUm0mBEsikQxD8ZcFWWee7Z1/TdKXF8FeX
         d5DvJGbOjj9VkBlDA3AfTxFIr3MYtLMlcfG88WwSPQzfVJvm0QYbzsrsVygY++qIlcbF
         GRaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXImfFEF2Y2j/Z9XrfUlpkzoab7SYgKwbt3CTRxqGjBu6k8XuRl5Pb3EQAN9kbiwo0NJO9A2fH89rrDmjiPKjtE@lists.infradead.org
X-Gm-Message-State: AOJu0YwYK73EvovyPrSJotyhcyfQGKN2o28k4azaSF6QoRJ9uOBDttmX
	Ai85W2t7dhCIfjJDK2KxeS2p0rfS6rVZkhBuHQDEbnAvRCwXU39VvLbFrFrQ+eNUFJPX3SBkH8D
	dmppTVA==
X-Google-Smtp-Source: AGHT+IEDxrAcP3xldoLSP2+yxUBuV6Ttuyw9HdeltMFShnVNq/HJr7ENXf3J/L5hnJ5D4xci+Np8Djaz59df
X-Received: from big-boi.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:129])
 (user=qperret job=sendgmr) by 2002:a5b:24f:0:b0:e0b:f6aa:8088 with SMTP id
 3f1490d57ef6-e30e8d353edmr30619276.1.1730727164243; Mon, 04 Nov 2024 05:32:44
 -0800 (PST)
Date: Mon,  4 Nov 2024 13:32:01 +0000
In-Reply-To: <20241104133204.85208-1-qperret@google.com>
Mime-Version: 1.0
References: <20241104133204.85208-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241104133204.85208-16-qperret@google.com>
Subject: [PATCH 15/18] KVM: arm64: Introduce __pkvm_host_mkyoung_guest()
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
X-CRM114-CacheID: sfid-20241104_053245_679320_B982FAA8 
X-CRM114-Status: GOOD (  13.46  )
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

Plumb the kvm_pgtable_stage2_mkyoung() callback into pKVM for
non-protected guests. It will be called later from the fault handling
path.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_asm.h              |  1 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 19 +++++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 24 +++++++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index acb36762e15f..4b93fb3a9a96 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -70,6 +70,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_relax_guest_perms,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_wrprotect_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_test_clear_young_guest,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_mkyoung_guest,
 	__KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
 	__KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
 	__KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 554ce31882e6..6ec64f1fee3e 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -44,6 +44,7 @@ int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_relax_guest_perms(u64 gfn, enum kvm_pgtable_prot prot, struct pkvm_hyp_vcpu *vcpu);
 int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm);
+kvm_pte_t __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu);
 
 bool addr_is_memory(phys_addr_t phys);
 int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 21c8a5e74d14..904f6b1edced 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -331,6 +331,24 @@ static void handle___pkvm_host_test_clear_young_guest(struct kvm_cpu_context *ho
 	cpu_reg(host_ctxt, 1) = ret;
 }
 
+static void handle___pkvm_host_mkyoung_guest(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(u64, gfn, host_ctxt, 1);
+	struct pkvm_hyp_vcpu *hyp_vcpu;
+	kvm_pte_t ret = 0;
+
+	if (!is_protected_kvm_enabled())
+		goto out;
+
+	hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
+	if (!hyp_vcpu || pkvm_hyp_vcpu_is_protected(hyp_vcpu))
+		goto out;
+
+	ret = __pkvm_host_mkyoung_guest(gfn, hyp_vcpu);
+out:
+	cpu_reg(host_ctxt, 1) =  ret;
+}
+
 static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
@@ -552,6 +570,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_host_relax_guest_perms),
 	HANDLE_FUNC(__pkvm_host_wrprotect_guest),
 	HANDLE_FUNC(__pkvm_host_test_clear_young_guest),
+	HANDLE_FUNC(__pkvm_host_mkyoung_guest),
 	HANDLE_FUNC(__kvm_adjust_pc),
 	HANDLE_FUNC(__kvm_vcpu_run),
 	HANDLE_FUNC(__kvm_flush_vm_context),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 7c2aca459deb..a6a47383135b 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1558,3 +1558,27 @@ int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *
 
 	return ret;
 }
+
+kvm_pte_t __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu)
+{
+	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
+	u64 ipa = hyp_pfn_to_phys(gfn);
+	kvm_pte_t pte = 0;
+	u64 phys;
+	int ret;
+
+	host_lock_component();
+	guest_lock_component(vm);
+
+	ret = __check_host_unshare_guest(vm, &phys, ipa);
+	if (ret)
+		goto unlock;
+
+	pte = kvm_pgtable_stage2_mkyoung(&vm->pgt, ipa, 0);
+unlock:
+	guest_unlock_component(vm);
+	host_unlock_component();
+
+	return pte;
+
+}
-- 
2.47.0.163.g1226f6d8fa-goog


