Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5FAC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 14:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RNLpH3Q60kPaAsu8vhpy60m6RZim/8uyJRruoS33oJY=; b=F3FExXBkDGK8hA/DlCZC908Wvq
	+Gyyimns9JJb45oaF4UBwrUN709DJNTtbxH67J2EJeEjErzWvfo7yiXLSGelE6NlOWittP95Pus4T
	O8ZT6iuAzUmP/UeqHbnAzF+ZICUSMgFmMNzF2OHE3NjuSOFGLfBuvgKfW55UzLlwtV1LPhSiH7MfA
	wHQweb0dYmRwq1upUTg/PqVH/hYSHIfdXjFfg6+UPcqeH2K7SYUKDcfZOdL4oTqc/RhYKoZVGeaSs
	hiuievITC46247OE530a5lTV+vJcKnR/gOI7tyYw2hskRhKHZm9vK1cuzpx4NNtbPNs+O6LlPU9M2
	Utr9qwPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOvE-00000003yDN-3SDa;
	Fri, 09 May 2025 14:41:56 +0000
Received: from mail-wm1-f74.google.com ([209.85.128.74])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNbU-00000003j2e-2qrj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:17:30 +0000
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-441d438a9b7so13575265e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 06:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746796646; x=1747401446; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RNLpH3Q60kPaAsu8vhpy60m6RZim/8uyJRruoS33oJY=;
        b=WaHHu18lYPrNSka44ET4m7+yXg8e0D43ou151zMtQUk9SO4viZhnFECwB6s8G8JuM5
         btBL+qmlfj7jm/aLHz4uKx/dAVwmzZePiQymTZGpVmK/CYZhvyDJDWqmWSxp1tr5tOs8
         exQ8CdmlNphZ2gLLDASegOkMr4zNokDo040fwmeuqgtXlQERdXA6mZG+fvfnuBTe5UHH
         Gca15X1gqRK2TdCXo0YPWXoNyuJKKvBC7jATNHpIZvkqpomObLgM9Sqt2deogi6RNv/O
         QQGMGrutZKf+3I5DIfwGeJ5aKqTmO+ZpsqzHGk7fqVZvr67O2/DGGZ2YkN+9vTQYl9f1
         eEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746796646; x=1747401446;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNLpH3Q60kPaAsu8vhpy60m6RZim/8uyJRruoS33oJY=;
        b=tLfL0i+gUKx2pbj69jfdO0JmBIRpmsY5fUF1rJcHmvDxJElRCRdOYCnwgZCMXDJjgV
         A8/PbIiZl4o7tvO/2dpVUrEmq7RIVg/nmG/+2QuLis267ZPyU3ezZZpGetldAPYt2JFY
         6BNQSm3GPgjYxBDbzKq0ixuFydAhB8EhdZ9/mygwuKzN06MMP5CXZH86PVBNsr5UGsQ8
         /TaRUHTq0Xot+lOXaygJmu7PdKUJVAU1YaInnDsF1dqdxjVWEPOUeNBX/2N6/ULM4GB6
         CNJsOh550liRzFB/TG1A3od25Cc4zqYHX43wcbcmEtx6qXRFW2s37vB3RTsIE2xuVjOJ
         B4Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWOVlLy7XJXZMXSegkqd16qoh0yam40NZW80arg3IcAdwfrLccjZZZQF+VPpFNhWcgdas1JULFTuJEEGXwm6FyO@lists.infradead.org
X-Gm-Message-State: AOJu0YyH5wNf0qH0lDCAT/UkbwXPq2EAcUmXJ+TaoDL3d0vOF60nsFzS
	+cH2b3Dtija4DDshYwX5ckrn1df9pBzzyv6XVMdAzsGsW2n4xzpgXDJE9ahRzNez88pf+1DYj8L
	9ZxKA/aSASip+2hgAlQ==
X-Google-Smtp-Source: AGHT+IEzp3z+QA2RzhLt/eBNPn4r3BZgbOIVIrs7d4F5IcvdZaGGp2zyrkjpEIgHZCECiNxrwkCgmBm3JE7hKe7K
X-Received: from wmbdr11.prod.google.com ([2002:a05:600c:608b:b0:441:d228:3918])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5919:b0:441:d228:3a07 with SMTP id 5b1f17b1804b1-442d0325520mr59393395e9.13.1746796646289;
 Fri, 09 May 2025 06:17:26 -0700 (PDT)
Date: Fri,  9 May 2025 14:17:04 +0100
In-Reply-To: <20250509131706.2336138-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250509131706.2336138-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509131706.2336138-9-vdonnefort@google.com>
Subject: [PATCH v4 08/10] KVM: arm64: Add a range to pkvm_mappings
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_061728_717981_BD57BD21 
X-CRM114-Status: GOOD (  14.01  )
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

From: Quentin Perret <qperret@google.com>

In preparation for supporting stage-2 huge mappings for np-guest, add a
nr_pages member for pkvm_mappings to allow EL1 to track the size of the
stage-2 mapping.

Signed-off-by: Quentin Perret <qperret@google.com>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index da75d41c948c..ea58282f59bb 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -173,6 +173,7 @@ struct pkvm_mapping {
 	struct rb_node node;
 	u64 gfn;
 	u64 pfn;
+	u64 nr_pages;
 	u64 __subtree_last;	/* Internal member for interval tree */
 };
 
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 6febddbec69e..0e30f16149d5 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -264,7 +264,7 @@ static u64 __pkvm_mapping_start(struct pkvm_mapping *m)
 
 static u64 __pkvm_mapping_end(struct pkvm_mapping *m)
 {
-	return (m->gfn + 1) * PAGE_SIZE - 1;
+	return (m->gfn + m->nr_pages) * PAGE_SIZE - 1;
 }
 
 INTERVAL_TREE_DEFINE(struct pkvm_mapping, node, u64, __subtree_last,
@@ -301,7 +301,8 @@ static int __pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 start, u64 e
 		return 0;
 
 	for_each_mapping_in_range_safe(pgt, start, end, mapping) {
-		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn, 1);
+		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn,
+					mapping->nr_pages);
 		if (WARN_ON(ret))
 			return ret;
 		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
@@ -331,16 +332,32 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 		return -EINVAL;
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
-	ret = kvm_call_hyp_nvhe(__pkvm_host_share_guest, pfn, gfn, 1, prot);
-	if (ret) {
-		/* Is the gfn already mapped due to a racing vCPU? */
-		if (ret == -EPERM)
+
+	/*
+	 * Calling stage2_map() on top of existing mappings is either happening because of a race
+	 * with another vCPU, or because we're changing between page and block mappings. As per
+	 * user_mem_abort(), same-size permission faults are handled in the relax_perms() path.
+	 */
+	mapping = pkvm_mapping_iter_first(&pgt->pkvm_mappings, addr, addr + size - 1);
+	if (mapping) {
+		if (size == (mapping->nr_pages * PAGE_SIZE))
 			return -EAGAIN;
+
+		/* Remove _any_ pkvm_mapping overlapping with the range, bigger or smaller. */
+		ret = __pkvm_pgtable_stage2_unmap(pgt, addr, addr + size);
+		if (ret)
+			return ret;
+		mapping = NULL;
 	}
 
+	ret = kvm_call_hyp_nvhe(__pkvm_host_share_guest, pfn, gfn, size / PAGE_SIZE, prot);
+	if (WARN_ON(ret))
+		return ret;
+
 	swap(mapping, cache->mapping);
 	mapping->gfn = gfn;
 	mapping->pfn = pfn;
+	mapping->nr_pages = size / PAGE_SIZE;
 	pkvm_mapping_insert(mapping, &pgt->pkvm_mappings);
 
 	return ret;
@@ -362,7 +379,8 @@ int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
 
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
-		ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn, 1);
+		ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn,
+					mapping->nr_pages);
 		if (WARN_ON(ret))
 			break;
 	}
@@ -377,7 +395,8 @@ int pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
 
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
-		__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn), PAGE_SIZE);
+		__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn),
+					  PAGE_SIZE * mapping->nr_pages);
 
 	return 0;
 }
@@ -392,7 +411,7 @@ bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
 		young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest, handle, mapping->gfn,
-					   1, mkold);
+					   mapping->nr_pages, mkold);
 
 	return young;
 }
-- 
2.49.0.1015.ga840276032-goog


