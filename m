Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47826C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 09:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1sUrkER67WLT4JN0Ut8NvS0zcoI4PCXbQaK2Om0Kxk=; b=PQbGGDNlgK5ma2jNqA3p9cy0fC
	cEhGuxXL8MsQBBwpD06Sd4yKR80jXENtkuwjzkZX33oYO/SrJSFdiVt4KHCGXmI8RpAqo4Y5kVNdT
	pBprtZWf/OqgYFFZKT9VUXxnd5zIpLFAJRRBXF/+RLGJlQjvSAm1afW1QaeLlNYhnWKpQbV55oMLn
	v5bD1gkn+a8b3kL2Vrjy+sAihL6MeMMWwa3qjOJLGjPh6lfxvo9cmMUrm81ENVVNymT9tVRqYsrXg
	/ZcGeEHTyoZ1z0aT0xQWOvV6Mhn5VyMTpYgFNTnYJiBrRtINqGSupQ1rcRodGtruwpS1Z40Ju/xyB
	IGeFQ0BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJkp-0000000CGsO-335R;
	Tue, 20 May 2025 09:59:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJOs-0000000CDRW-1cjn
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 May 2025 09:36:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=U1sUrkER67WLT4JN0Ut8NvS0zcoI4PCXbQaK2Om0Kxk=; b=CXtUpcqBl2xB/w7e4aU41BK1Kc
	+hxAjLpLAAM9hOQryuHt4012WG7TPJHugHalWIGozQqV3iY4pRwJOwP3hS+WPx3SaE27m8kpyk6Y5
	MqwaVhKlAWlzRmG0nwAANG1sLTuusA4i2+6pA4AP2EdePp4B147qGvrec05KIwwaWzslrHXNYpiHg
	muJ8DPh+ufPWbhC9pQ0TkGIwqnSLt2piUEzqeilNxCeoDe8DICxI/UAr4yFYBpz+IR2AM+igTdQSG
	GLcWTznV9N42K6moYz61hV/tjgJzviXeDR/Ssld9AF53iTN6psAFSHobliayJJN40s4i/2dAd2ahB
	3Scvb+nQ==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uHIim-00000000jq4-2GvW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 08:53:15 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so37844625e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 01:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747731191; x=1748335991; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=U1sUrkER67WLT4JN0Ut8NvS0zcoI4PCXbQaK2Om0Kxk=;
        b=0mUnI1Nv4+Ckt82ESOtwf4GPu4nW9QDVV1JL1NAJlUsefF3PXVRP6G4jTIsZ8grw2M
         RwydcIPARuTt3gF5yXRSYYXh+tmCymgboNB77NV2jOZzI4Uid7zAlVVFp4+Vr3DCDHgX
         tNUF43YeJ2EEju18c9M+lq7gPNH5Q6rSU/yULGfNUEXHuZ26DUDF8OP16QePzCfvsAvA
         BLYOPVhPRviBMtz8Gbz7S9DJVtamfiJZsxC3j6e3jxFvz4ufiVMCpojPPadoeIFykFp3
         tXnI9LNM5kz1swqlG1x4nJip5Khqu/pQrBkdOgNbYe6uU0edqh6aZxW84JAoSqIQ5wJp
         1cHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747731191; x=1748335991;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U1sUrkER67WLT4JN0Ut8NvS0zcoI4PCXbQaK2Om0Kxk=;
        b=jdU/Nx90pI/dBwguObAR03rJo88+1/MGxljem461PObcF77bWTi8pDE3cCe9fxTUSD
         kzQRDUBMihW4UitIglLGQQ8VMurxe+/98fb7iAE7zYIg4T2YdCPRA3vrB9rW7M2/QMRJ
         oQVo4XeTPBUiDZee3dlCaY7Lf1mbNttN7+uc2c4S+qMYhQYpKmjbSg+Fa32MDEyT8S9n
         9Njs/ZimcsTgp5nOVEc0G21nnz05e2CjCcm/IzWRXQhvnN8G8/gxEExkppzYG/gfWrfc
         T+EHqhK0aJal8P+etnD9/rFFcUK5hvt7vLp9UQd7d2Q6r556i/nyS+4DFy5QbQHyhgks
         2cbA==
X-Forwarded-Encrypted: i=1; AJvYcCWmMcSM1d3XL3YwEZlU3qz8l86SZ9GNB7GHoW9dTsUiEbGGdGjkqstTSHKJ84maOxJRkQXQRpAS5I/fZnJMo1vU@lists.infradead.org
X-Gm-Message-State: AOJu0YyZSHjdkRPRTeUgW47ObtoTBL+IFpLpzEzgkhmHRPAK50ih+Wa9
	iFPoYORCB8XFqQHozoAOnmlP9oZqAa5dgkVeWxYM3HqEFHUV+dShsyBVskPu6y+M7Vnhqdtm4l0
	X6+X/zdhKUxtmkIJ2Qaft5Q==
X-Google-Smtp-Source: AGHT+IENthKzsKHv/HWcWQeB37Nikyn/qGeaUXDh4XyhJ9RJ8A2GBmHwwF7MrDhhpwbzghTBNva0zDUScLc85koj
X-Received: from wmbej13.prod.google.com ([2002:a05:600c:3e8d:b0:440:673c:ce2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5008:b0:43c:ef55:f1e8 with SMTP id 5b1f17b1804b1-442fd622ce5mr160161355e9.13.1747731191322;
 Tue, 20 May 2025 01:53:11 -0700 (PDT)
Date: Tue, 20 May 2025 09:51:57 +0100
In-Reply-To: <20250520085201.3059786-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250520085201.3059786-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
Message-ID: <20250520085201.3059786-7-vdonnefort@google.com>
Subject: [PATCH v5 06/10] KVM: arm64: Add a range to __pkvm_host_test_clear_young_guest()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_095312_955840_8FDCFA06 
X-CRM114-Status: GOOD (  10.51  )
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
nr_pages argument to the __pkvm_host_test_clear_young_guest hypercall.
This range supports only two values: 1 or PMD_SIZE / PAGE_SIZE (that is
512 on a 4K-pages system).

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 64d4f3bf6269..5f9d56754e39 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -43,8 +43,8 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu
 			    enum kvm_pgtable_prot prot);
 int __pkvm_host_unshare_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
-int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm);
 int __pkvm_host_wrprotect_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *hyp_vm);
+int __pkvm_host_test_clear_young_guest(u64 gfn, u64 nr_pages, bool mkold, struct pkvm_hyp_vm *vm);
 int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu);
 
 bool addr_is_memory(phys_addr_t phys);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index fa7e2421d359..8e8848de4d47 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -331,7 +331,8 @@ static void handle___pkvm_host_test_clear_young_guest(struct kvm_cpu_context *ho
 {
 	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
 	DECLARE_REG(u64, gfn, host_ctxt, 2);
-	DECLARE_REG(bool, mkold, host_ctxt, 3);
+	DECLARE_REG(u64, nr_pages, host_ctxt, 3);
+	DECLARE_REG(bool, mkold, host_ctxt, 4);
 	struct pkvm_hyp_vm *hyp_vm;
 	int ret = -EINVAL;
 
@@ -342,7 +343,7 @@ static void handle___pkvm_host_test_clear_young_guest(struct kvm_cpu_context *ho
 	if (!hyp_vm)
 		goto out;
 
-	ret = __pkvm_host_test_clear_young_guest(gfn, mkold, hyp_vm);
+	ret = __pkvm_host_test_clear_young_guest(gfn, nr_pages, mkold, hyp_vm);
 	put_pkvm_hyp_vm(hyp_vm);
 out:
 	cpu_reg(host_ctxt, 1) = ret;
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index a6c45202aa85..5a7a38c5d67c 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1111,17 +1111,21 @@ int __pkvm_host_wrprotect_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm)
 	return ret;
 }
 
-int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm)
+int __pkvm_host_test_clear_young_guest(u64 gfn, u64 nr_pages, bool mkold, struct pkvm_hyp_vm *vm)
 {
-	u64 ipa = hyp_pfn_to_phys(gfn);
+	u64 size, ipa = hyp_pfn_to_phys(gfn);
 	int ret;
 
 	if (pkvm_hyp_vm_is_protected(vm))
 		return -EPERM;
 
-	assert_host_shared_guest(vm, ipa, PAGE_SIZE);
+	ret = __guest_check_transition_size(0, ipa, nr_pages, &size);
+	if (ret)
+		return ret;
+
+	assert_host_shared_guest(vm, ipa, size);
 	guest_lock_component(vm);
-	ret = kvm_pgtable_stage2_test_clear_young(&vm->pgt, ipa, PAGE_SIZE, mkold);
+	ret = kvm_pgtable_stage2_test_clear_young(&vm->pgt, ipa, size, mkold);
 	guest_unlock_component(vm);
 
 	return ret;
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index daab4a00790a..057874bbe3e1 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -420,7 +420,7 @@ bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
 		young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest, handle, mapping->gfn,
-					   mkold);
+					   1, mkold);
 
 	return young;
 }
-- 
2.49.0.1143.g0be31eac6b-goog


