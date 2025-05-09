Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86D0C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 14:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJXlEdEAMlkb2qBBm9toZJ5sXPbHKi+X7VZ3IC/AQeA=; b=Ch+CVoWDtnlECTElFdlhNewK0s
	XwPAdZmAWgsEyTWvkNqk8eMnu59m5n6vCLIWkUVa9UcR3Fq2VLP7soSX5whKsPoe61I2VcAFh8KzL
	W6XXtfMXdGqOWobUgNRZwRoIdW25enQ5x/PJkxUKKYdYGd5g5/U9Ss/KhFgN7+wUE6sdLzGUpPwIQ
	6PTSvuVBlifdT7SfdAxNXxcq0uloFcNNf+uQtahu+++eLmjftX/MEX2RhGCy9LgWBiefBl1HEtXVm
	FMs17g3ORLSI6NN8qqogLmdZcbeBAY2MtH9jn6yU9nA2PJDhHWH72CUKeVVOqxUNhUbYq98oTq5Xm
	r9UHczYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOrM-00000003xth-1YqG;
	Fri, 09 May 2025 14:37:56 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNbQ-00000003j12-1c43
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:17:25 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-441d438a9b7so13574945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 06:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746796642; x=1747401442; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sJXlEdEAMlkb2qBBm9toZJ5sXPbHKi+X7VZ3IC/AQeA=;
        b=aNyVdruEZW1YUFcSptOYxohTygRjjDJay/5zsuYfdtivmqkTynKrJ9t7WcfDIVvxR2
         XU9Z3DO8ViHtEV3cB6ywd014sDOO4T+xBhf1yzxELOoKSqJ7IQU2gOtNqUPYF0/397nK
         VHo9oJ/Fk8ePTjF8LS4cgl2wp1sWZIpZZZ1qDh/UZmQivsj2fd7jIIdzeVSPE32/5Tm2
         NZCmHYSjlukMpSRfd9t/2jUmSXnJItTXN1V3jtqvtc50YFLJyhzFzKVB9AJjRIRPXEhI
         GDDlJC1/odUFS3ej0cLCP5+WK+a+S9wG+EPqYM5XUynaxI0R8PUuVxmmXLG0Rr/csafl
         OnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746796642; x=1747401442;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sJXlEdEAMlkb2qBBm9toZJ5sXPbHKi+X7VZ3IC/AQeA=;
        b=FfcwtFuoStcsdwHU3e/Q1AUNPVQAs1eekr/TLjfrs9ngHoCU+bikPpGd8W3S492Wrj
         hrYlv8/FOpFlm422GE/uhhX8sfWC5CxHumzDQFnHqXibMpn82wkIBOydA8X7xQVYd8/K
         MSOIeRgk6qhJDzNkNbAbv7QN+7m4YaN9cMr1NTv/hLPw1GSWeyDICmV2cg8sz/kgZdMI
         2LIyc6mgUNea3TChcIVfpBAqnceMlRwocyVN5ak7H4nRjxnLAwa+/3EIzGKMMS1nngQH
         jyFtAnUHWL6P+UyiF9y4TBKDnKx5sf7c7mIrZK8b9/OOvPRQvXyaEFyF/+GZNRWI+JaW
         5N0g==
X-Forwarded-Encrypted: i=1; AJvYcCW22E1dS2zDVa16vjxlkTm6Y1UQxfoZtNRn9VoaR1BZJ/XSMsZpmkw7G6VECIv/VgetUnSXcc+AaKRB+2lZQ8zE@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq68tFbtKPeBlt7ElwPLpqScEFfS6wTORR7FWiRORZfrgub5wg
	1sl5cZP7g88wOKZg75qdjT+0DcijqtOLc8kcnR3iZUPFUgA82wp8WoFIos6crqHqvH66B85fy9H
	fWEyVeTWrpQyhiBJSDQ==
X-Google-Smtp-Source: AGHT+IGHjgfBBQziUExP1MPI5PB38ZTGtxeEqo5dEeOPRz5XOW0PWp3aLbHOfSRkKDKmFhtCkoq6HHA3Mb4iDMfv
X-Received: from wmbdr16.prod.google.com ([2002:a05:600c:6090:b0:43d:4ba5:b5d6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8716:b0:441:b3eb:570c with SMTP id 5b1f17b1804b1-442d6d9c266mr30919685e9.6.1746796642493;
 Fri, 09 May 2025 06:17:22 -0700 (PDT)
Date: Fri,  9 May 2025 14:17:02 +0100
In-Reply-To: <20250509131706.2336138-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250509131706.2336138-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509131706.2336138-7-vdonnefort@google.com>
Subject: [PATCH v4 06/10] KVM: arm64: Add a range to __pkvm_host_test_clear_young_guest()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_061724_420228_7090895E 
X-CRM114-Status: GOOD (  10.59  )
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
index 887848408e1b..78fb9cea2034 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1123,17 +1123,21 @@ int __pkvm_host_wrprotect_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm)
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
2.49.0.1015.ga840276032-goog


