Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E327AC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 09:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OegFB2xZXjNRTpgqJuU8fAt2lqPaGMfs1sk3PznjF78=; b=0/1A28/ImKHN4W/6KFBLOAYRkN
	t+MgklJJHtNrDb5VeKX+QTnO7igITQVqDEvBrW3kC3eqvhftuYSlFEU4ZYL6MjXSY1f///D61OaY6
	BIdw2Ggh1cIyGCT/3TM2eP1NRMU79UfZPyFBbpdXAyxvk9qScKeJWgw2rWmowID909GSDdwfdZa7x
	WG7cfNbbjVI/6TMRvCJNfqeMQj1KC3zSVqdyWqKc+/m1qGY5cpfW2HzVe/FTyiiDhSzbS2fwyp1yL
	2NRyI2JhWxK+jBZE1iq73k0Fd2etzsPuL/eExW1ypoyarYH2z+1gkxp3W8y0EU+fJanFcH6iUw0v/
	EFRI1dPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHIrG-0000000C7qd-2d85;
	Tue, 20 May 2025 09:01:58 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHIip-0000000C59N-2PXD
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 May 2025 08:53:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OegFB2xZXjNRTpgqJuU8fAt2lqPaGMfs1sk3PznjF78=; b=hg/M6k6YWq8M0Dpt/stpMaG9k4
	xvZ4mJIhL8GqHtdYu1Q7L75TgoeFR6kX69mGFK2ss27ABV3tCzMqx2ZYDmBQwyeFsOVqVnO07sgX+
	1aUzd1yM3nKtU3jCs98OHZTLj9wvZEgP8wk4zAywFc7utiLywoCs91Mqt2JvObuBKEN25VsCcRdg3
	MmZDSIjkrqxOyAf8TnXB2sSnkOrmd2b/H2S/+QZFGdOxh0XwfVutyuhcTW1egNjlW0KjyV17LsOdv
	eVZum6NavMy122895ZqqZHwctrk9unbxgMyYLhSpiC0DgdAUFxq4eZKFiKis8RzDTwXwP7pEkw0IC
	USdpxRzg==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uHIil-00000000jpl-2FGY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 08:53:13 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so35416495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 01:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747731189; x=1748335989; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OegFB2xZXjNRTpgqJuU8fAt2lqPaGMfs1sk3PznjF78=;
        b=krBCrHEoFq8hLU7SsJxyaD7b5jNqJJVEcQ7Y5YkBGNuNVSau16Z6G6VVdOvRC8UOcD
         b069P772V990hVD2jSbDi3iKmhiyitKJndcKDBBHtuaMVViZNwrlk011emfqB27eI9Y+
         kms4n0OkdCHnXdb/5yKjxreW5tFTZD+sRBtVBP2MtyJdd74WqyJKZMoR3JD8dGzTEyR6
         58zZslYpjX6JFMdwdHJ05T1dGXh52RFLmsiB7+RpStzc6GPpdT3ZyuPTqPKVWizupfGM
         8WiOwvp0RWlQ9/aGd76U2q7zAspTGAbs3E/vspMu6IDYlYdA7alizo3ye/zaGAilygcm
         nJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747731189; x=1748335989;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OegFB2xZXjNRTpgqJuU8fAt2lqPaGMfs1sk3PznjF78=;
        b=pYOpz+lt0Fg7dehg2MeJluAQazPV4jPPZX7v8QyQkdZ/y6GNNTphk8ngLwpOQcgC17
         BRXTCFWTfxhZwQDdWwOht6IpUwOJAstee6StqFH6Mde4L4uBZ8QiqXicv8fSuXgDg95c
         Amr3tFbGhWmc1WyGfMCO0wLAixq9LpYUJOY/yE2XHUARje40KtXjVPeIgu3iY352TVya
         bq57qbs5DW11izLicI6HKHPpsRVdbfZ70EF4QA2xIC0FrND0qfgPFZ/9Nw8S2Bodeg8J
         RH5V/g1SyPzVyeEMgCfB2ybYMlxJqpwyNDJ69240wpoPi3jes4aHjm0+SbOLyTiskL2F
         aUuA==
X-Forwarded-Encrypted: i=1; AJvYcCUHEB0pkpuJYEVdQ++Xnz8YnhLlvJmf3GugxVGS381iUUL3UUMErylZHlEWfJa/JyunZ/nW90vkP35HfTdN7YQL@lists.infradead.org
X-Gm-Message-State: AOJu0YysWLK7yD5sfiPcVToX8qWDYZwCQUhVz6Lrl2ZVROsLjCP9/0GY
	EiOx41VSYd3hluN8+P/mZ5lioC/473ZfY2Mt9WqMommj3dcVEQswk1JfCKZ0/2h7vMbO+hXB90S
	8Mlkco+IYGQnVhhZeKuXYXQ==
X-Google-Smtp-Source: AGHT+IGQHeSBunGL47W5QD9E9xMgLZTOeuSsbb54RHxgkrHxgCbNat3eBa4S5Z5uYiT9jJa6EmhQXbPkxTpqYWjr
X-Received: from wmbfm26.prod.google.com ([2002:a05:600c:c1a:b0:442:f8e9:a2ac])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f42:b0:442:dc75:5625 with SMTP id 5b1f17b1804b1-442fd60cb7bmr141176955e9.5.1747731189303;
 Tue, 20 May 2025 01:53:09 -0700 (PDT)
Date: Tue, 20 May 2025 09:51:56 +0100
In-Reply-To: <20250520085201.3059786-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250520085201.3059786-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
Message-ID: <20250520085201.3059786-6-vdonnefort@google.com>
Subject: [PATCH v5 05/10] KVM: arm64: Add a range to __pkvm_host_wrprotect_guest()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_095312_062435_CB6F5671 
X-CRM114-Status: GOOD (  11.25  )
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

In preparation for supporting stage-2 huge mappings for np-guest. Add a
nr_pages argument to the __pkvm_host_wrprotect_guest hypercall. This
range supports only two values: 1 or PMD_SIZE / PAGE_SIZE (that is 512
on a 4K-pages system).

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 19671edbe18f..64d4f3bf6269 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -43,8 +43,8 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu
 			    enum kvm_pgtable_prot prot);
 int __pkvm_host_unshare_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
-int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm);
+int __pkvm_host_wrprotect_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu);
 
 bool addr_is_memory(phys_addr_t phys);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 5c03bd1db873..fa7e2421d359 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -310,6 +310,7 @@ static void handle___pkvm_host_wrprotect_guest(struct kvm_cpu_context *host_ctxt
 {
 	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
 	DECLARE_REG(u64, gfn, host_ctxt, 2);
+	DECLARE_REG(u64, nr_pages, host_ctxt, 3);
 	struct pkvm_hyp_vm *hyp_vm;
 	int ret = -EINVAL;
 
@@ -320,7 +321,7 @@ static void handle___pkvm_host_wrprotect_guest(struct kvm_cpu_context *host_ctxt
 	if (!hyp_vm)
 		goto out;
 
-	ret = __pkvm_host_wrprotect_guest(gfn, hyp_vm);
+	ret = __pkvm_host_wrprotect_guest(gfn, nr_pages, hyp_vm);
 	put_pkvm_hyp_vm(hyp_vm);
 out:
 	cpu_reg(host_ctxt, 1) = ret;
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 884e2316aa48..a6c45202aa85 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1052,7 +1052,7 @@ int __pkvm_host_unshare_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm)
 	return ret;
 }
 
-static void assert_host_shared_guest(struct pkvm_hyp_vm *vm, u64 ipa)
+static void assert_host_shared_guest(struct pkvm_hyp_vm *vm, u64 ipa, u64 size)
 {
 	u64 phys;
 	int ret;
@@ -1063,7 +1063,7 @@ static void assert_host_shared_guest(struct pkvm_hyp_vm *vm, u64 ipa)
 	host_lock_component();
 	guest_lock_component(vm);
 
-	ret = __check_host_shared_guest(vm, &phys, ipa, PAGE_SIZE);
+	ret = __check_host_shared_guest(vm, &phys, ipa, size);
 
 	guest_unlock_component(vm);
 	host_unlock_component();
@@ -1083,7 +1083,7 @@ int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_
 	if (prot & ~KVM_PGTABLE_PROT_RWX)
 		return -EINVAL;
 
-	assert_host_shared_guest(vm, ipa);
+	assert_host_shared_guest(vm, ipa, PAGE_SIZE);
 	guest_lock_component(vm);
 	ret = kvm_pgtable_stage2_relax_perms(&vm->pgt, ipa, prot, 0);
 	guest_unlock_component(vm);
@@ -1091,17 +1091,21 @@ int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_
 	return ret;
 }
 
-int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *vm)
+int __pkvm_host_wrprotect_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm)
 {
-	u64 ipa = hyp_pfn_to_phys(gfn);
+	u64 size, ipa = hyp_pfn_to_phys(gfn);
 	int ret;
 
 	if (pkvm_hyp_vm_is_protected(vm))
 		return -EPERM;
 
-	assert_host_shared_guest(vm, ipa);
+	ret = __guest_check_transition_size(0, ipa, nr_pages, &size);
+	if (ret)
+		return ret;
+
+	assert_host_shared_guest(vm, ipa, size);
 	guest_lock_component(vm);
-	ret = kvm_pgtable_stage2_wrprotect(&vm->pgt, ipa, PAGE_SIZE);
+	ret = kvm_pgtable_stage2_wrprotect(&vm->pgt, ipa, size);
 	guest_unlock_component(vm);
 
 	return ret;
@@ -1115,7 +1119,7 @@ int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *
 	if (pkvm_hyp_vm_is_protected(vm))
 		return -EPERM;
 
-	assert_host_shared_guest(vm, ipa);
+	assert_host_shared_guest(vm, ipa, PAGE_SIZE);
 	guest_lock_component(vm);
 	ret = kvm_pgtable_stage2_test_clear_young(&vm->pgt, ipa, PAGE_SIZE, mkold);
 	guest_unlock_component(vm);
@@ -1131,7 +1135,7 @@ int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu)
 	if (pkvm_hyp_vm_is_protected(vm))
 		return -EPERM;
 
-	assert_host_shared_guest(vm, ipa);
+	assert_host_shared_guest(vm, ipa, PAGE_SIZE);
 	guest_lock_component(vm);
 	kvm_pgtable_stage2_mkyoung(&vm->pgt, ipa, 0);
 	guest_unlock_component(vm);
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index f77c5157a8d7..daab4a00790a 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -390,7 +390,7 @@ int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
 
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
-		ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn);
+		ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn, 1);
 		if (WARN_ON(ret))
 			break;
 	}
-- 
2.49.0.1143.g0be31eac6b-goog


