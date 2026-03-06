Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEC1F0183C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qBDvUPOUvZlIighyaRp+5oG5fBA2IhyoxKOHVs/vQh8=; b=U5Ff17hIRaxdt6YQQuqY37s4YJ
	3q9DqDsoLmUqf2lm6TdY0YMZxT0i4VlYPxVKBM02YFbkVr3pphsH11XH4R49+qeCGcB+7CKt21usS
	bkDUc222Qfdsq3Dzdogs6GYEIKqiOxq/xb/PhS51IRKgWe3bh3yDi6RpexEwxRSArfXxWmEYIFoLq
	nFsylMLWvXGNVZb7/v7TMwMtRgoWx+7Hvnpw7TpIO6vbwytqSXC64w50LKEx9pXlRVUdx1fGV77He
	9rqyeL7mW0Pj7kxDsvzv8L29HpjPtmpMUp/n/c7Z+yY5cW93W68WfFIQjeJAQOhErEVUHsFpveqIo
	j0k1V5MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVlR-00000003qEk-3Swj;
	Fri, 06 Mar 2026 14:02:49 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVlO-00000003q8N-1FCf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:02:47 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-661565d30e8so2828961a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772805764; x=1773410564; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qBDvUPOUvZlIighyaRp+5oG5fBA2IhyoxKOHVs/vQh8=;
        b=znmoknJI4kMTBIwvfqqZbPhlmI+nie1YuuDtdLULf53i/kqsmKB66iQAUj8E9NvBog
         AmLQ7v0Dmvy0nNZ80SqqB4qJZnNk3ES4z/dMUf3SFX8L83+YfGpYJt4JIuk5no2Md/jZ
         z2NDjUn9G/X+0dRxy8hs4tozeBYuAlGHAJb3akb48Zpc0t8B9Xz4fs18DJaRPG5T7+Kr
         b0EBhMIylPL21AhlvVHAw8FVz0lLTChabP6zeA7zFOQ26iEhE327S7eaAoYY2MCXl0JI
         UdQARfz4csoeFnU6R3hCixx5/F0j+SfwpLlO8Wlwc4cDIZNkLAlsmcSdkFjfeUQlhVeX
         SGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805764; x=1773410564;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qBDvUPOUvZlIighyaRp+5oG5fBA2IhyoxKOHVs/vQh8=;
        b=Vop7v8iMX9G4pBHglRPxryK7hZVRWa4iUax4wK/uMd1q0S9nc2XZ1pm3Xs2+tgVpJz
         RoEnFOJAB/wytlyo1ByAdTAHhDk2dSXPz7jXFV6dpXQT2C6gWNY+MlxGc6FdYEL/EqXh
         2gGrbEhCBGSOR21F+QIddU2qvUlVTWqP53P4DbL0wMUo7yTdKKJrEjmHrxbR8md7rv3k
         ZxuR/p1WAtt2TDAt7Qw+VEuF9UJqoh1kk5fJmUrWGym5Fy+aPHxGD6vuAp/XKRtwXH24
         4rzZTF/9QFloOHX9Lsi2NPKkf2beapud3t9enqgPNH9ZAiAo2XWE0Ry8eiYGJL2qisD9
         TfVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcK4utcfhQ47HFggvgVsQL27XILLtjhxFuAFWzZy+EV2Xll9ZMXVTsxA6VRf2Xc0A1NVMVBcpSiPah/m7WTIVy@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7pmTUwJflUqldsCqArJ+cY7TIK2gvE7xkqfxPgE64N9K5sxc7
	6ufANoYmabh8z7smbMaew+S5UP1h6B2Y75z7by8TTZPyahXwPeitASbtP/VL4vpOzwT/aQac+0b
	lXA==
X-Received: from edev7-n2.prod.google.com ([2002:a05:6402:a2c7:20b0:660:afb7:89d6])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:1d4c:b0:658:e665:766c
 with SMTP id 4fb4d7f45d1cf-6619d46826dmr1250580a12.8.1772805763972; Fri, 06
 Mar 2026 06:02:43 -0800 (PST)
Date: Fri,  6 Mar 2026 14:02:27 +0000
In-Reply-To: <20260306140232.2193802-1-tabba@google.com>
Mime-Version: 1.0
References: <20260306140232.2193802-1-tabba@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306140232.2193802-9-tabba@google.com>
Subject: [PATCH v1 08/13] KVM: arm64: Remove redundant state variables from
 struct kvm_s2_fault
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, qperret@google.com, vdonnefort@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_060246_363245_B4EF907C 
X-CRM114-Status: GOOD (  12.36  )
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

Remove redundant variables vma_shift and vfio_allow_any_uc from struct
kvm_s2_fault as they are easily derived or checked when needed.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 090a906d3a12..01f4f4bee155 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1721,10 +1721,8 @@ struct kvm_s2_fault {
 	bool mte_allowed;
 	bool is_vma_cacheable;
 	bool s2_force_noncacheable;
-	bool vfio_allow_any_uc;
 	unsigned long mmu_seq;
 	phys_addr_t ipa;
-	short vma_shift;
 	gfn_t gfn;
 	kvm_pfn_t pfn;
 	bool logging_active;
@@ -1749,9 +1747,9 @@ static int kvm_s2_fault_get_vma_info(struct kvm_s2_fault *fault)
 		return -EFAULT;
 	}
 
-	fault->vma_shift = kvm_s2_resolve_vma_size(vma, fault->hva, fault->memslot, fault->nested,
-						   &fault->force_pte, &fault->ipa);
-	fault->vma_pagesize = 1UL << fault->vma_shift;
+	fault->vma_pagesize = 1UL << kvm_s2_resolve_vma_size(vma, fault->hva, fault->memslot,
+							     fault->nested, &fault->force_pte,
+							     &fault->ipa);
 
 	/*
 	 * Both the canonical IPA and fault IPA must be aligned to the
@@ -1764,8 +1762,6 @@ static int kvm_s2_fault_get_vma_info(struct kvm_s2_fault *fault)
 	fault->gfn = fault->ipa >> PAGE_SHIFT;
 	fault->mte_allowed = kvm_vma_mte_allowed(vma);
 
-	fault->vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
-
 	fault->vm_flags = vma->vm_flags;
 
 	fault->is_vma_cacheable = kvm_vma_is_cacheable(vma);
@@ -1796,7 +1792,7 @@ static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
 				       fault->write_fault ? FOLL_WRITE : 0,
 				       &fault->writable, &fault->page);
 	if (fault->pfn == KVM_PFN_ERR_HWPOISON) {
-		kvm_send_hwpoison_signal(fault->hva, fault->vma_shift);
+		kvm_send_hwpoison_signal(fault->hva, __ffs(fault->vma_pagesize));
 		return 0;
 	}
 	if (is_error_noslot_pfn(fault->pfn))
@@ -1874,7 +1870,7 @@ static int kvm_s2_fault_compute_prot(struct kvm_s2_fault *fault)
 		fault->prot |= KVM_PGTABLE_PROT_X;
 
 	if (fault->s2_force_noncacheable) {
-		if (fault->vfio_allow_any_uc)
+		if (fault->vm_flags & VM_ALLOW_ANY_UNCACHED)
 			fault->prot |= KVM_PGTABLE_PROT_NORMAL_NC;
 		else
 			fault->prot |= KVM_PGTABLE_PROT_DEVICE;
@@ -1978,7 +1974,6 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		.logging_active = memslot_is_logging(memslot),
 		.force_pte = memslot_is_logging(memslot),
 		.s2_force_noncacheable = false,
-		.vfio_allow_any_uc = false,
 		.prot = KVM_PGTABLE_PROT_R,
 	};
 	struct kvm_s2_fault *fault = &fault_data;
-- 
2.53.0.473.g4a7958ca14-goog


