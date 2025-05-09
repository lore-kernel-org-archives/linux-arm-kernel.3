Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BDFC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 14:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iY9xHEFUpTNbpzkbkz6w6fJAjv29kAFcmljY+gYvWx4=; b=2smY5yjL/hVT20vUwEg0fqRUo5
	niSnOfrY050pwMUSw++nX0bED5b8pcldMxELBCtEB52RKbkX2uEMeD+V+TTX3f6NlhLz2ncEuYWZC
	sLeXttCPPD13EjXmNH/zetnteXpmI+6VVAXIWPrcSPbb1JcTAIBi9TdEL732TKtfe+SQGW7eb8ht8
	gIX20MlU34SQygzywkVBQL/1sycH19rSfzzTqpaIDGORBdZV+JcDS1QlSCb2phOD099bdF/j2P69O
	9M6f939ro15f0wWEX5jXwTC9mR6y32bd44cLh4+OnQoYsLTIWYcEJrS27grsfFxUFBVyB4+6NM/xo
	hTFnqr0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOxA-00000003yO9-2CPH;
	Fri, 09 May 2025 14:43:56 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNbV-00000003j33-2M7p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:17:30 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-442ccf0eb4eso16095325e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 06:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746796648; x=1747401448; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iY9xHEFUpTNbpzkbkz6w6fJAjv29kAFcmljY+gYvWx4=;
        b=Uw+fPOSlESt6fq8jEMyneykS8U85faV4FAjVz4wRH4h3di3We17M4wYYan4PuiAk2i
         qNdH1jqjNcxr0t2Rw969T0UXd/zvgo3x6tK8xIYDaQYoHHRon/xV0U/A2pTn8GorHP0r
         mynu60pNJmoxgP7kneTIzXKT9iY5m+wwNVJge8vAtFscQL5M+jbPTVwXedHE4NWa6FA+
         ERud6tIiXNYx00BWHVLQ3jlOTG6p7L35sdVVNkXW16BXcbSY/8o3Aj4vqqQvASBmTiGm
         r84I7Xp0jhmNIyGR/WGSmC1OZzpk5buvp8lZNQHbEjRs2msjz4Am3fX77OOdIPkflsjl
         rEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746796648; x=1747401448;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iY9xHEFUpTNbpzkbkz6w6fJAjv29kAFcmljY+gYvWx4=;
        b=OdzRGefWYRC/FUZCsUqw6dz/eMBGdHz2HxgbcILvdIYTnDDxvi6Z+AgBbg3Qks7aZ3
         DSz5ROgW3PvQDXFucGJghrwlM2M8TjrDNfZAok4gETwefBOOJm6cmKjt6d04sJEAphq7
         mRrCmjuz8/an9IEolBm+bLld0bYRv/mHYO4wXc4P0G6VwoUxBF/ex85vmF9/F615h7g7
         9baMqpDg5tRGomt6ggS6pmIeHiLcATI0K3SQuTfE7D6Z3JsUxW+DHeCAqtKvRFu/x9cQ
         9Ail68JOKhQDRm8lBrVrvaHHqVa4wLoCFTpbhhlHsaGx+beFq6mEJCoRcxVktYI81pwD
         UBxg==
X-Forwarded-Encrypted: i=1; AJvYcCVN9BUeVMHkZ1/4mJh3jEz8Tfx14UzppNPH1FJXBmPyzNH0ugoqsAwE9jjmz38QF2046yCTLJNaiRDRRRmZyhmR@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/G0LLugDHcuwMk22gPE3XeW7UiROPllrfRD+ndwcdsyVY2aC+
	AtFyJPRqx9h0+xBR3FUQ7+TR27p/9rUcjWNznX5bitN4tQUUtGenbWv9jGLPE3juLpDrQSEmjC8
	qxx7hX2pE1af1I/rrvw==
X-Google-Smtp-Source: AGHT+IEF+XO6uPZe1MEto7eLqAL+0iiIrzIwhxZbJdzOlJd1PeGxlk1/ZzYpvt4tHE4RjgjMniLCrdsLZfZB2R8i
X-Received: from wmbdq15.prod.google.com ([2002:a05:600c:64cf:b0:441:bf4e:899c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e8c:b0:43c:f969:13c0 with SMTP id 5b1f17b1804b1-442d6ddec16mr29442225e9.29.1746796648033;
 Fri, 09 May 2025 06:17:28 -0700 (PDT)
Date: Fri,  9 May 2025 14:17:05 +0100
In-Reply-To: <20250509131706.2336138-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250509131706.2336138-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509131706.2336138-10-vdonnefort@google.com>
Subject: [PATCH v4 09/10] KVM: arm64: Stage-2 huge mappings for np-guests
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_061729_607534_A37EAC62 
X-CRM114-Status: GOOD (  10.26  )
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
index 78fb9cea2034..97e0fea9db4e 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -167,7 +167,7 @@ int kvm_host_prepare_stage2(void *pgt_pool_base)
 static bool guest_stage2_force_pte_cb(u64 addr, u64 end,
 				      enum kvm_pgtable_prot prot)
 {
-	return true;
+	return false;
 }
 
 static void *guest_s2_zalloc_pages_exact(size_t size)
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 754f2fe0cc67..7c8be22e81f9 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1537,7 +1537,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 * logging_active is guaranteed to never be true for VM_PFNMAP
 	 * memslots.
 	 */
-	if (logging_active || is_protected_kvm_enabled()) {
+	if (logging_active) {
 		force_pte = true;
 		vma_shift = PAGE_SHIFT;
 	} else {
@@ -1547,7 +1547,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	switch (vma_shift) {
 #ifndef __PAGETABLE_PMD_FOLDED
 	case PUD_SHIFT:
-		if (fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
+		if (!is_protected_kvm_enabled() &&
+		    fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
 			break;
 		fallthrough;
 #endif
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 0e30f16149d5..9504169fb37f 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -328,7 +328,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	u64 pfn = phys >> PAGE_SHIFT;
 	int ret;
 
-	if (size != PAGE_SIZE)
+	if (size != PAGE_SIZE && size != PMD_SIZE)
 		return -EINVAL;
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
-- 
2.49.0.1015.ga840276032-goog


