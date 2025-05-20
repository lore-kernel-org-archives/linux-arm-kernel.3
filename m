Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2186C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 10:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6RhcZhtCDaS8NkJIeedFdZ107qBBIN26D1SVsvDpNZ8=; b=3IS4u7CA/aAEOWRBULdm/2RL6M
	gtVArETXQCNEtVzg3qMjg4DRmu+quBfnnQv10+1N17jFJ3tLkyWP1FBvoeKPxc9BSOiwdcl/xTy1v
	RVkblhdBTTnuGrzoL9LEZaaTindHqJdu6AnQESsJtmB1vH3n99nzfkKfip2GnvfQ8NI8tW8cvd9kf
	vDrsk/TW+oQb+eb4SQMaY1qeGmsrQ4j1URU4kIKJ/g7zcE0ahTgHHjNfC5Tr/shZof93WYgKX8vXx
	SeApML+Lq7uJBy8Q+FUjiOJyhYC3J7hVWvzIfQf8oZtGsE4vAAtLpUynbhSLPMUuxUDe6YiKbaJf4
	R/mvxGeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJox-0000000CHQB-0lOd;
	Tue, 20 May 2025 10:03:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJP1-0000000CDTW-3MLk
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 May 2025 09:36:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6RhcZhtCDaS8NkJIeedFdZ107qBBIN26D1SVsvDpNZ8=; b=bMVI623JLzxQ+aWpkRwB80Mk5Y
	D51G8aeUNxjKvzkmEN3jXZF7vzYSgmiTrG4xV5jwmQGVtBmyQq/V+ssTi/5Sdz1Okgc6uHtV1Lf8a
	0X5+UglaaCQmkRO//GdV/y4BwUv7o/JUReq2THldGb94qtrFeV69Z0JcUoeo6iqhLmWALwo63WEOJ
	LoGefGaQM6rc29nBCU1SsL/R5qcFYTxw4fAIwBH1lgId6R0GGTjXlTE+ji0apojC7vckX2/qN7ery
	q3gHCYVZ+QOnOnunubdQSAOoPU3RfWU5gHW2V4usF0ip3oamESuXmRpjK35BxJs06ZlpbvzvbMUj5
	xxoHNFdQ==;
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uHIit-00000000jrq-1pui
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 08:53:21 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3a370309dcbso973440f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 01:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747731197; x=1748335997; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6RhcZhtCDaS8NkJIeedFdZ107qBBIN26D1SVsvDpNZ8=;
        b=ezNb4cyN4hbVaaLoHehz613wfl0n3Oec8T8pZhRttUp8brcnssE5PUfDtvjWcF6x1b
         IPCFLD7SzOmxDhPZag/2VzXzo72TN09Lec5/3sCapeZkhCDr05NJv3+sDcQUjv61geDr
         LjD++PZ7SG/8WMoQbixIn/60npv/Ik+JGDVbVyoLfvAGS1bEDz635qBvg24MZcf2MV85
         3L2iWWsQ4QZwKkGTS4ZmJlnS0hRn7xyByXCg5HSoD1v/DT9I0HzK1sPSE4HaSFu2Kxgt
         l/7AaT8GyHqtG4HgfefkhR2Nt5d8lg0IC5GvWDV4mi1kfrDsUXxGwfiAOVhtJaAD90ZR
         2/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747731197; x=1748335997;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6RhcZhtCDaS8NkJIeedFdZ107qBBIN26D1SVsvDpNZ8=;
        b=XwcIKJge+pODhfXo8xzdasrh3odXfQ/JPlPoKnrMggyCvmG97cMNM19dFSBOv1+LlK
         OUc68xP6X3ktIbGpar48z+zvmALkCZvAUY5hQjocrE/Q+aXyurKILYsytbhXPM2rcf6Y
         HOOLfikehzdP1CZssNMHbCiSm9CdIVo4W7/eWXsPfz6KiG7mXBa97rzanXHNnuzo+WwI
         FIYcbMzQ87kAbdX1DsrXEv2LnjFj+cIs69VVmDvdhrHNbll+9hxXgSb3EQoDgggk8HOD
         0U+LolfrogakoER/R8ZlyIcLAVv/0YQB46/OZUEcfRETNKS3RGBvtyJBV4gulbRkokYg
         AS7w==
X-Forwarded-Encrypted: i=1; AJvYcCXOfKAJczCFbF3c+gUdKu45XukpPZb6FDBDnGN18G0xZgneJZL0DZxFthTd8MA6wrWBUAPD/hjSLirk0Z6uKK3b@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh37ism4myaXzhssJmZGy+LQaCXrW989qOKeShgyeORivvweWd
	wtP3DNlPULShah+haaj05rSSqAzaTm+6cnB0fdF8MWQeseWUclyKM11nisDswpAIbCWSigOqZzr
	ma81QqpZyPZHzxzgDa0En+Q==
X-Google-Smtp-Source: AGHT+IFEFnMn+5WqEzWmxQGG8vmhM7+5mi+63YjdjHfeO/BUWq/ciG944KxWrfJB4c3YAkUdS5M6ZuY5i48SqhBo
X-Received: from wrbfu10.prod.google.com ([2002:a05:6000:25ea:b0:3a3:659e:161])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f4a:0:b0:3a3:6c61:9d52 with SMTP id ffacd0b85a97d-3a36c619e19mr6952768f8f.18.1747731197095;
 Tue, 20 May 2025 01:53:17 -0700 (PDT)
Date: Tue, 20 May 2025 09:52:00 +0100
In-Reply-To: <20250520085201.3059786-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250520085201.3059786-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
Message-ID: <20250520085201.3059786-10-vdonnefort@google.com>
Subject: [PATCH v5 09/10] KVM: arm64: Stage-2 huge mappings for np-guests
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_095320_295979_25A59E58 
X-CRM114-Status: GOOD (  13.16  )
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

Now np-guests hypercalls with range are supported, we can let the
hypervisor to install block mappings whenever the Stage-1 allows it,
that is when backed by either Hugetlbfs or THPs. The size of those block
mappings is limited to PMD_SIZE.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 5a7a38c5d67c..1490820b9ebe 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -166,12 +166,6 @@ int kvm_host_prepare_stage2(void *pgt_pool_base)
 	return 0;
 }
 
-static bool guest_stage2_force_pte_cb(u64 addr, u64 end,
-				      enum kvm_pgtable_prot prot)
-{
-	return true;
-}
-
 static void *guest_s2_zalloc_pages_exact(size_t size)
 {
 	void *addr = hyp_alloc_pages(&current_vm->pool, get_order(size));
@@ -278,8 +272,7 @@ int kvm_guest_prepare_stage2(struct pkvm_hyp_vm *vm, void *pgd)
 	};
 
 	guest_lock_component(vm);
-	ret = __kvm_pgtable_stage2_init(mmu->pgt, mmu, &vm->mm_ops, 0,
-					guest_stage2_force_pte_cb);
+	ret = __kvm_pgtable_stage2_init(mmu->pgt, mmu, &vm->mm_ops, 0, NULL);
 	guest_unlock_component(vm);
 	if (ret)
 		return ret;
@@ -908,12 +901,24 @@ int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages)
 
 static int __guest_check_transition_size(u64 phys, u64 ipa, u64 nr_pages, u64 *size)
 {
+	size_t block_size;
+
 	if (nr_pages == 1) {
 		*size = PAGE_SIZE;
 		return 0;
 	}
 
-	return -EINVAL;
+	/* We solely support second to last level huge mapping */
+	block_size = kvm_granule_size(KVM_PGTABLE_LAST_LEVEL - 1);
+
+	if (nr_pages != block_size >> PAGE_SHIFT)
+		return -EINVAL;
+
+	if (!IS_ALIGNED(phys | ipa, block_size))
+		return -EINVAL;
+
+	*size = block_size;
+	return 0;
 }
 
 int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 754f2fe0cc67..e445db2cb4a4 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1304,6 +1304,10 @@ static bool fault_supports_stage2_huge_mapping(struct kvm_memory_slot *memslot,
 	if (map_size == PAGE_SIZE)
 		return true;
 
+	/* pKVM only supports PMD_SIZE huge-mappings */
+	if (is_protected_kvm_enabled() && map_size != PMD_SIZE)
+		return false;
+
 	size = memslot->npages * PAGE_SIZE;
 
 	gpa_start = memslot->base_gfn << PAGE_SHIFT;
@@ -1537,7 +1541,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 * logging_active is guaranteed to never be true for VM_PFNMAP
 	 * memslots.
 	 */
-	if (logging_active || is_protected_kvm_enabled()) {
+	if (logging_active) {
 		force_pte = true;
 		vma_shift = PAGE_SHIFT;
 	} else {
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index b1a65f50c02a..fcd70bfe44fb 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -332,7 +332,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	u64 pfn = phys >> PAGE_SHIFT;
 	int ret;
 
-	if (size != PAGE_SIZE)
+	if (size != PAGE_SIZE && size != PMD_SIZE)
 		return -EINVAL;
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
-- 
2.49.0.1143.g0be31eac6b-goog


