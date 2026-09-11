Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37386C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FmITuOpAyp0txJ9LywM67xGVsoOppp+O+NKFqqQhmo0=; b=l8KmUup+o4EifvLJamqrAGsXLO
	4gymPRFKiIis/gt+SfoJlxBnScNGZ1m5alCZtyt/jyByR6EY/9FO1cJN3+LZ864jBWs5N5CTaLBee
	XGrjnxuNjQILhl1nYfKxsfENdMGtzDCFTqJMlBoR42W11GRjaW76BKa4x9ClHeuphlHkI/LHt0C0e
	/qivMm/hpR/HqLnsRASN1C/Ur4vCFvC+Wsczuuc6I6KJ1SgGrzyzK/muIWpaEyF5MfDsb8vfmm5IH
	1YmhK9ExJJ0LDQaAKwP9tK21g5J2Zu/XHN6Jr+vYoFtpgD8JXFbHpCshrmfS8/ytKIi8OlBNvS+KH
	qpqG68LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51fO-0000000GoJf-0ftU;
	Fri, 11 Sep 2026 13:51:46 +0000
Received: from mail-ej1-x646.google.com ([2a00:1450:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51ex-0000000GnvM-0lcx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:51:21 +0000
Received: by mail-ej1-x646.google.com with SMTP id a640c23a62f3a-c251c140b41so100234166b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 06:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789134676; x=1789739476; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FmITuOpAyp0txJ9LywM67xGVsoOppp+O+NKFqqQhmo0=;
        b=RTnl4DpzfnE88yURexeu9IN9NHiGErGVxPsDcy9ciFVsCpmd6ywMwWWGOzRRNdUHj3
         MfAzv9cXp2lvYTQ55FrLa2DtXeb3sCIrgbr2NNL3UxcG7TEXsgbSzk8iSPdTbFtGk58D
         OHCQFZ4SuPMp2RmmMqs7CN86bxk9d238Flw0yr3YoQYgoyaQ3gimy5WcGRMASqxuhwQ8
         efHJqP/l8aLQ0pXeFIFZdHldZNKBUrSiXB+NmHjFFhROXF3PwkzlxPKJIZkhHcT+L+Ab
         KqFFRlyG16wCP2MXZXiAVEusx1PpjkxACO9UjxZyQ+uGAVTM6Xj1HNIAFOfKvg58XYTm
         5tmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134676; x=1789739476;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FmITuOpAyp0txJ9LywM67xGVsoOppp+O+NKFqqQhmo0=;
        b=IETky+no+vhWX7dPfaK5v7S79aCBvkXVlqPkwVNfPFnRacH2T6r7CeeBH9tGYux9+U
         JsE5IXmiWEzptSkCH0gz4JAiJkfMpOVXq9urB3fFjqGPUULXU1kNomE1cjiKS+bQ9krw
         /JLSWPmOOAdhDI2FrkDbZb43+TBeTe5jZoHRvNuUFwhVFuFLT2pwzXdY6EP9A7PtZ3ay
         FGwxYUgRQVNHJIuj+mOP4G5IAj8vpKV8GuIzViwlC0RbR0/diOmkpTw/Xsrh7VWinOdL
         9+rPrumV4lYZqEW1G22esGN2uoMdst7z6x4CGAIE1bLMAg2921Pkx6cqEYD5bR1OJwME
         oEbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgjJPEPxwN84GQbItYpmiodfzKHVwbmIxk1BrMLdXA9go0KoayZcaCcMcwDGWCQVOIvgBoZ9HGfrEYMGLtaGKa@lists.infradead.org
X-Gm-Message-State: AFuF++kK/imOMkL1GAbYk2Tzl4HgoUZNtr04Wv+kXVa0ax8jS64ASTSz
	RKagg95VcPpV3smo/Scks2GgF94aw56kncOSZsKyd1dTbXVozJX7vk2xRvXmRQJT1/aKELxRgYJ
	3lQzifvnysJFfhmZuDmzCSg==
X-Received: from ejoy6.prod.google.com ([2002:a17:906:4486:b0:c29:4be1:5ff0])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:874f:b0:c26:1649:47a8 with SMTP id a640c23a62f3a-c29666bb6a7mr174063166b.30.1789134675826;
 Fri, 11 Sep 2026 06:51:15 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:50:43 +0100
In-Reply-To: <20260911135053.146435-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260911135053.146435-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911135053.146435-13-vdonnefort@google.com>
Subject: [PATCH v2 12/22] KVM: arm64: Handle huge mappings in __pkvm_host_force_reclaim_page_guest()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_065120_237991_7D748FFC 
X-CRM114-Status: GOOD (  15.45  )
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

In preparation for supporting stage-2 huge mappings for protected VMs,
allow __pkvm_host_force_reclaim_page_guest() to work with PMD_SIZE
mappings.  As this HVC is called from a non-preemptible context, it is
not possible to rely on the host pkvm_mappings tree to get the mapping
size. Instead, use the actual host stage-2 mapping size and compare it
with the guest stage-2.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 33 +++++++++++++++++----------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 7e6882ce51f6..674159736495 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1317,7 +1317,7 @@ static void hyp_poison_range(phys_addr_t phys, u64 size)
 	__apply_guest_page(__hyp_va(phys), size, __hyp_poison_page);
 }
 
-static int host_stage2_get_guest_info(phys_addr_t phys, struct pkvm_hyp_vm **vm,
+static int host_stage2_get_guest_info(phys_addr_t phys, u64 *size, struct pkvm_hyp_vm **vm,
 				      u64 *gfn)
 {
 	enum pkvm_page_state state;
@@ -1345,34 +1345,43 @@ static int host_stage2_get_guest_info(phys_addr_t phys, struct pkvm_hyp_vm **vm,
 	if (ret)
 		return ret;
 
-	if (WARN_ON(level != KVM_PGTABLE_LAST_LEVEL))
-		return -EINVAL;
+	/* We only support either PAGE_SIZE or PMD_SIZE */
+	if (level < KVM_PGTABLE_LAST_LEVEL - 1)
+		return -E2BIG;
 
-	return host_stage2_decode_gfn_meta(pte, vm, gfn);
+	ret = host_stage2_decode_gfn_meta(pte, vm, gfn);
+	if (ret)
+		return ret;
+
+	*size = kvm_granule_size(level);
+
+	return 0;
 }
 
 int __pkvm_host_force_reclaim_page_guest(phys_addr_t phys)
 {
+	u64 gfn, ipa, pa, size;
 	struct pkvm_hyp_vm *vm;
-	u64 gfn, ipa, pa;
 	kvm_pte_t pte;
 	int ret;
 
-	phys &= PAGE_MASK;
-
 	hyp_spin_lock(&vm_table_lock);
 	host_lock_component();
 
-	ret = host_stage2_get_guest_info(phys, &vm, &gfn);
+	ret = host_stage2_get_guest_info(phys, &size, &vm, &gfn);
 	if (ret)
 		goto unlock_host;
 
 	ipa = hyp_pfn_to_phys(gfn);
+
 	guest_lock_component(vm);
-	ret = get_valid_guest_pte(vm, ipa, PAGE_SIZE, &pte, &pa);
+	ret = get_valid_guest_pte(vm, ipa, size, &pte, &pa);
 	if (ret)
 		goto unlock_guest;
 
+	phys = ALIGN_DOWN(phys, size);
+	pa = ALIGN_DOWN(pa, size);
+
 	WARN_ON(pa != phys);
 	if (guest_get_page_state(pte, ipa) != PKVM_PAGE_OWNED) {
 		ret = -EPERM;
@@ -1380,14 +1389,14 @@ int __pkvm_host_force_reclaim_page_guest(phys_addr_t phys)
 	}
 
 	/* We really shouldn't be allocating, so don't pass a memcache */
-	ret = kvm_pgtable_stage2_annotate(&vm->pgt, ipa, PAGE_SIZE, NULL,
+	ret = kvm_pgtable_stage2_annotate(&vm->pgt, ipa, size, NULL,
 					  KVM_GUEST_INVALID_PTE_TYPE_POISONED,
 					  0);
 	if (ret)
 		goto unlock_guest;
 
-	hyp_poison_range(phys, PAGE_SIZE);
-	WARN_ON(host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HOST));
+	hyp_poison_range(phys, size);
+	WARN_ON(host_stage2_set_owner_locked(phys, size, PKVM_ID_HOST));
 unlock_guest:
 	guest_unlock_component(vm);
 unlock_host:
-- 
2.55.0.1007.g17ff1f9808-goog


