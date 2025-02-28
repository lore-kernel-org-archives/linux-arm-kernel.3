Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767C8C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 10:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJ8YKtq6hiI77A4ivZTnaB9Ne+xlMbNHdkfYD+3eEfk=; b=X9UqMYAI2q5yJwwmr05tGjJguf
	AIsa97BqTn1tB1UtbFLI/uv6lEZKRRQk8JvnynwzKa6YSGeg6jAjbxubV4vI7HZwbbD6JSuRsM+B7
	JZcIG7R3AgFbBJOuyvP2Kvxb6GUVh2cpPm1VRNkzUllZcjjuOYpPlz5q+xlEm9tcFTMGLnKWYFTmC
	KXuy5wJx5vzXydpKBa/iB1WHXucBUmDm68jUZHahCqle+467rq4m/69nXxtJ1TU7fmS9TM/+L4yt8
	ia6HGtZQBiXRw8qtlXC3akrmWl0CEAPiYcSBwZiPv1bxI9q6v/bkxoYVw45r59oDb4jduZODR68UD
	Nz+RHAiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxy3-0000000Aek2-0Tnw;
	Fri, 28 Feb 2025 10:51:43 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxZF-0000000AaXX-3Thy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 10:26:06 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4399a5afc72so10234725e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 02:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740738364; x=1741343164; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FJ8YKtq6hiI77A4ivZTnaB9Ne+xlMbNHdkfYD+3eEfk=;
        b=md3jLt3+sEyOrf5QZcyfCAVhyeXg7zpMPcdHJ1rnsvFuvRd3xF/rsdzBJutMb/9RyZ
         K0jluX/WWSKg9+mW/D9TU2/2HPjsrZzxJ1ZmtR78xX6Q8PNNtsQbQQJEI1TN49zXvQ6C
         aekZ6S5qpxjimlY1WtCa7UHe5bjwZgJ+S5yjRG3i3HoSSCsraOE73Jv1imSq8FA1vHlk
         9UUssiO7McjNlhYeX+MyjcqzEmxjBkf+7WZiKLCEEHhhgC5Yt5V9SLqpsFG+NUp6+Y/R
         +BMQwoUk0sp3LbpOYuK7L/qGXDmjIGi87THwTm/Wc1T+FRnb/GSHLD3anwdTEKWCws6J
         B85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740738364; x=1741343164;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FJ8YKtq6hiI77A4ivZTnaB9Ne+xlMbNHdkfYD+3eEfk=;
        b=X6/OtiAFWjvNXCXE+xVKY705Dcf3jDFpWd0FDCzoQmp+wa9YNFTsFGwy89mvhvlrzr
         axBw+9u9SkXofwo86EIrC4zEBXb39AJI09AThxCBfCDjuYxdGdL8qcKUNc8towdCVLbr
         j6v6tyjVpVyR7yLDjwuG9vvq/Tpoc1jyG7DfUHjcLzqwpw68DS38VUWJfvlF/2HFBPlg
         qEtzu1OUY5pfoU0Y4zFHrrXhsoBJff1m/66s7xK/X2TosF+61X414XmQsLmHpbBSdRHE
         MUOC7q3kURPMFYVv2eXNQkOh05GxwSrtJhV1yIBJS7FDovn74jZK4ROw+UHpMQ513GWe
         bJ2g==
X-Forwarded-Encrypted: i=1; AJvYcCUje8FfhyCSzyL4L8F/U7Ab0uMDWFfEcncKSuNUvrKji0YlQB63BEaWKwX2G4VD5iTP849ejLYEqW9f0+1B24ls@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx95+uLV3MBrLlYgfBDa3WLcAIENsU0nPLtwaxsYyTyjj2x2Ll
	qQxeoge/cORKdsh6DKIcCFSQ0fKWAFGNDIQaaKEy8oE9lT+7Hd+GnCtLy/iVbNfAYBprqsZTXee
	h8sPhCgbDAN0TQcChSg==
X-Google-Smtp-Source: AGHT+IF7RliymnqyVqI2LxMXafp0QAO3saYMD0WdzwsnhK9hIXHApQBnwQLte7rc3DZHMIaauPQxquwj982tRnHP
X-Received: from wmbfm22.prod.google.com ([2002:a05:600c:c16:b0:439:5636:735f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5123:b0:439:9274:81d0 with SMTP id 5b1f17b1804b1-43ba66da2a9mr17359265e9.1.1740738364175;
 Fri, 28 Feb 2025 02:26:04 -0800 (PST)
Date: Fri, 28 Feb 2025 10:25:25 +0000
In-Reply-To: <20250228102530.1229089-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250228102530.1229089-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250228102530.1229089-10-vdonnefort@google.com>
Subject: [PATCH 5/9] KVM: arm64: Add range to __pkvm_host_test_clear_young_guest()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_022605_865289_3DE9FE12 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index ad6131033114..0c88c92fc3a2 100644
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
index c273b9c46e11..25944d3f8203 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1110,17 +1110,21 @@ int __pkvm_host_wrprotect_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm)
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
index 3ea92bb79e8c..2eb1cc30124e 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -434,7 +434,7 @@ bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
 		young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest, handle, mapping->gfn,
-					   mkold);
+					   1, mkold);
 
 	return young;
 }
-- 
2.48.1.711.g2feabab25a-goog


