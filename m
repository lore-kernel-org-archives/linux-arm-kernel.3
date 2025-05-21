Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1242C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 13:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7Oq5jwZK0pb08xH59h8gdjNoJEBEnOv69ZeonvXBfg=; b=RfLAVSj+JbE4p0RnXYslh0NTFs
	2YkpO0GAr2o4of/oc/ZWj8jhAsFJi27CPZQoT+BM3RXUJpWGxGz8FN/iUuy4TdEKF6xarqGOPOj3e
	6FwJb5zRs0uJjldkjjBfMiiGOMJ5I8rtVQCcVma3fXf7GHNvgIjHYWWOeOxYXWUr5kd7JttT2TEs9
	XMLKs6x/pcXSVRrI6TT8nAHrIOmVI3K9nq7MA79Qrv/xySFHM5nLMpni9vXw8hFhLKajxfUIAduHX
	K5DPkmb7ljL56McZxJ7zbL15UpnFQTrmqYOH9sfZHK9owAq9HRIHSPIjVVArtVpO5J1DD1lCWZtje
	snkYXTZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHj8m-0000000FsNh-2spU;
	Wed, 21 May 2025 13:05:48 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHiui-0000000Fpeh-22fW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 12:51:17 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3a34f19c977so3280672f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 05:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747831875; x=1748436675; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=h7Oq5jwZK0pb08xH59h8gdjNoJEBEnOv69ZeonvXBfg=;
        b=chVxVOSRNyDgzRDllupaey0CC35h/LUpFWrw9eJ3UOjwAYkHGK2vOFkfwtA0HI+Vs4
         k3sEzeRRjjCEojNFBuyWmBvh3lDJ4MInv1VTY11SIXWFGvn5FIZWdDJrrUTyynUns5zn
         IAPR0aEmzICnNDK6ZVsugafazB1daTcvRQtagyMNRe6i1A95ixDOKAKdAOuuG2BkWT0T
         VNSuwFmdYEN9qCuPd2BF3rs1hRKBz2l5yn0Jr3eVEpjY4D9WkIcqBTAV5W2Mp3cqlwZZ
         pe/BeK6aupguXevIOZZWXUDEKf5uRWihp+A3g1dxfJStq651e8ZNtdk8dJpRWM6EFPQE
         POMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831875; x=1748436675;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h7Oq5jwZK0pb08xH59h8gdjNoJEBEnOv69ZeonvXBfg=;
        b=l5MVRRRp52OCPlVakaVqR9AFDHIlA49F1bnScr/FrRGsAH6qJBlBRIe7XcLfMZlam8
         zXDTsKFhrs4z4dID3qs+V4JqO29jvmla3ePsKnuzet67coRPO4zau0AIJwry+Fu6BjXr
         7YqbnJUUDLjbcsXynEuq23Xyjirj7IaQSqye6iWIDsJ3NFMpW/AJMEqHLTvo5+8F/t1x
         AbTFXD/BMKYKSXiLY44bWrSQh1LIRKWlr4k8B8eBPZhl1dhoBOJDC+mUv9cxhNwUCm+p
         7lpkAlVeM02QVNlYTsiTCcYEcTdEdSfok7dJxJG9rQ9MfHXQhpkF+zLb55SIlt9jS04f
         WDWA==
X-Forwarded-Encrypted: i=1; AJvYcCUa/jsc1QjR6XaXYZe9E7Gf9ci5wmfzR8RTIqFvb/oupjxFfBMhwOkD2PMPHggDoFYtSnOfo6bqYwK/hsam1K9N@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9E+sBRuo63/fY+0PHwLIZ5SwhOEBbzxE+qwK1S6tin5uujQbY
	k00MUNjDAUuaxsAcd7/gJkvmLvd+xRK/6eEHgEKxvKz5dsdg6I9EQ/njDgdr3RUtphof9/AE6vI
	QV9sO3ARY4uqRRbUm3QWC2A==
X-Google-Smtp-Source: AGHT+IG2h60jELokLEU/h5uhC0DSsHsKCsOBofWotQOOeFuSTUQx51WyDXB/rj32MRC8kvwd+rTI6s1Fodm9S1qj
X-Received: from wmbhj14.prod.google.com ([2002:a05:600c:528e:b0:442:f9ef:e460])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2582:b0:3a3:6915:33a6 with SMTP id ffacd0b85a97d-3a369153515mr12239550f8f.23.1747831874642;
 Wed, 21 May 2025 05:51:14 -0700 (PDT)
Date: Wed, 21 May 2025 13:48:30 +0100
In-Reply-To: <20250521124834.1070650-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250521124834.1070650-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250521124834.1070650-7-vdonnefort@google.com>
Subject: [PATCH v6 06/10] KVM: arm64: Add a range to __pkvm_host_test_clear_young_guest()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_055116_525928_FA19F20D 
X-CRM114-Status: GOOD (  10.46  )
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
index 569adeaa0869..e08c735206e0 100644
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
2.49.0.1112.g889b7c5bd8-goog


