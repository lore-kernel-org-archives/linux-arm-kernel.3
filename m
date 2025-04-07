Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C5FC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 08:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PlP5tMdol9JVYvP3tzbTEpu6iNcDZijUZqqFs+uoGXU=; b=0qk/ZEW7EKDEq8eyVmT4Z6fIDp
	uuxQxM1BssH7GUlO25LnNI4m6uSOCF9BfXTLtLiePkXrgpGnoGvtS3UQ7T7izlib5CmlP6y0quX5R
	iSk+dB3Knusp8tx/4bkdws4VeRnVLHIJQoVIDQ2n6+9jHYxOHlZiDrTNS1J4aEy4kVk8HVBuBXPVc
	PsduMrhA+IRg36A74YngDnGf0fbQPANPPV0lHHYjVWi+QHjPwZVQNYawWUAfY42Z8DAI7ZhzP2KX7
	EN1oqHw3SuWFAWWpgy3a+MdBZdMV1fXSoswgxroAfR95G7emeFdgwNuL78BdOZelMwPosSiTVOMbg
	3TpHYk5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1i03-0000000H2iN-1pmf;
	Mon, 07 Apr 2025 08:38:35 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hpW-0000000GzyP-1nue
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 08:27:43 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43cf172ff63so23154515e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 01:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744014460; x=1744619260; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PlP5tMdol9JVYvP3tzbTEpu6iNcDZijUZqqFs+uoGXU=;
        b=rKvMW77MiP6P/4xGXJTlu3GvxJCQ91ssOYHi3RNoQ0LaaVgia+wDn10x7MnDkzKHnG
         y/AqLj/mun+sb4eRWc1s4DrjmTcSm9HQDtAAux0xddS1Jns+UVXPITQ3iJpTXDM3ytvm
         gJoUUP/o+GFXbuZXvVKTVNGLjSUP2fcC9cSYpTGX7jaqy6Jj73aGFOJrcXjH3+QO1z4S
         lC47aNG8HOcZ1Nhsdg8HsrQCbzfXRD4pOWsRt/OAY9moie95qQ+LYSJvDv6sUl70d08v
         N+34g6BTaXXitGLz/7VtKxvR4/mIjTU8C6ZhKmM+khFg4AAleaNYtXHelsNfIbt6qAL0
         LfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744014460; x=1744619260;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PlP5tMdol9JVYvP3tzbTEpu6iNcDZijUZqqFs+uoGXU=;
        b=AYwl9ZBcMBbHUhhC0DEFyVYZJCYJZlttqYNgy4LMEvNbg2PGnbww+XrENLfmPAsEVB
         NlgKr9kHFkqojKM3w+JNhNmiTkYk2zQjaRp4m09dW6MI9SDoaJzJYRy1XXrlylppln65
         bNsDErQkKI1tNwMVeF00fuxGctRvfKG9pMLZHFdh0fW3cr3qj3E2wK/0X2/LXHLjLkuA
         YhC4ne2yCJbdIqUkKzdIBN/NKxWrwUl2YQDzMMRKDvqLh0WxfQEUK5CN749MhMtUbmum
         OtNkmhRWRa/DhnAhuGDnEwApDp+6z6OPY64LNmJ11X5MZoEjNglGIR3q27m/t3qrmfXC
         gjxA==
X-Forwarded-Encrypted: i=1; AJvYcCUpXUM7pvWr6Uzjl2M41eOS52Ez7Sll+JvYnThnW9h2m4eorawOuXeYx3uyztS7hsmpJsqnm8fgvAzc4znaLhe4@lists.infradead.org
X-Gm-Message-State: AOJu0YySyU5COEjoWzE3tysEV0NygPmCy/kZFDopqkpT2Yq9x+KUa43u
	aWFJVCW/D1q5w7P0Vq/iAvCf3IwzyiiCXppidyowjErqBVAkCmUTPFguRViqNBEhnFE9Hf61dvI
	9Vna4kvTz0Gy/SmKN1w==
X-Google-Smtp-Source: AGHT+IF1riN2k2nWQ8sgip2B+3pFFoE6XJaoBxY3J2Xr5NYz4pbZRp/K7q/190A9Us4CNkYkJWM9DqTRoGRoo0Cj
X-Received: from wmcq28.prod.google.com ([2002:a05:600c:c11c:b0:43b:c336:7b29])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4443:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-43ecf8d1b10mr116267015e9.17.1744014460436;
 Mon, 07 Apr 2025 01:27:40 -0700 (PDT)
Date: Mon,  7 Apr 2025 09:27:02 +0100
In-Reply-To: <20250407082706.1239603-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250407082706.1239603-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250407082706.1239603-6-vdonnefort@google.com>
Subject: [PATCH v3 5/9] KVM: arm64: Add a range to __pkvm_host_test_clear_young_guest()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_012742_465449_63565B01 
X-CRM114-Status: GOOD (  10.89  )
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
index 3393a8ecf243..4404afb7ea2e 100644
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
index e13771a67827..a6353aacc36c 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -335,7 +335,8 @@ static void handle___pkvm_host_test_clear_young_guest(struct kvm_cpu_context *ho
 {
 	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
 	DECLARE_REG(u64, gfn, host_ctxt, 2);
-	DECLARE_REG(bool, mkold, host_ctxt, 3);
+	DECLARE_REG(u64, nr_pages, host_ctxt, 3);
+	DECLARE_REG(bool, mkold, host_ctxt, 4);
 	struct pkvm_hyp_vm *hyp_vm;
 	int ret = -EINVAL;
 
@@ -346,7 +347,7 @@ static void handle___pkvm_host_test_clear_young_guest(struct kvm_cpu_context *ho
 	if (!hyp_vm)
 		goto out;
 
-	ret = __pkvm_host_test_clear_young_guest(gfn, mkold, hyp_vm);
+	ret = __pkvm_host_test_clear_young_guest(gfn, nr_pages, mkold, hyp_vm);
 	put_pkvm_hyp_vm(hyp_vm);
 out:
 	cpu_reg(host_ctxt, 1) = ret;
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 9929fd7e729b..ad14b79a32e2 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1112,17 +1112,21 @@ int __pkvm_host_wrprotect_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm)
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
index 1483136df01f..419902faaf69 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -437,7 +437,7 @@ bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
 		young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest, handle, mapping->gfn,
-					   mkold);
+					   1, mkold);
 
 	return young;
 }
-- 
2.49.0.504.g3bcea36a83-goog


