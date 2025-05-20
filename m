Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCA7C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 10:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iaiebv1iUlPjNsuMmhJjesUK4sbc8xArY8P1OHZ/a4c=; b=gEl2XFmgvDNn57rmNISmDeoJG5
	VNu42C1tutSncsKq76lwqHL5IM8UU3dF3CU5hp1WVJtGM6zl/HykSYh1s2HT/wknJAQAKlppZptF+
	rdLutAa+T8D/eqOJGtO94Fz+Ov/CotxrU6jyUEzlRRCbf69cxRN0NGQ5UKpxVm2TY7+AaDWXsNTYn
	h+hwkOpFGrlMJcY3+Rx29jnHBR+43K9DSlmdqPjx2SXtS2P9lx+U3D9Aa9pOHoDtRs4dHRrPSkbLp
	gmXCY7iT/wywVoOylqOQgKU2EIsY/XqeNH8oEd/Hn70zv8iuUmJKZE+Bw+Ae/5awtVW7GC07suAQN
	9hDSHg3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJr2-0000000CHfr-01eU;
	Tue, 20 May 2025 10:05:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJP5-0000000CDTp-26Km
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 May 2025 09:36:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iaiebv1iUlPjNsuMmhJjesUK4sbc8xArY8P1OHZ/a4c=; b=JKt+ureHmHnmEEO1mdLf/AdvYf
	eRMrlaM/W0p4IriWrTKxm+2EYp/1zWY0jFdw3LIaZUOUeL7xZjpY4IHu97hN0ltLTCBpk1RE7VmlA
	ZDMNSV5lFnKKNyfsA44Qn52bKG1kZTx7/aXBP08dAu/qGxCcOGmG5dHO2n4Qd0Ht3BWvkTYCNXJcD
	icLdvsT2uOGj2ki47m6r+EM7cKhlZydD80FuHQqPbu+pZ0YNnkiLfEdb7mvG2SqU/umuSOo/M8mGO
	YP39YoGyfv/EHzc/hMwpSKlScJppekRy2gX6fSK8d4tCoq0fz4t7z9VfSpi5KYyc0xTsQa/1bty0Y
	yJchN0Zw==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uHIiq-00000000jqv-1iPm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 08:53:19 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-442d472cf7fso42732775e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 01:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747731195; x=1748335995; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iaiebv1iUlPjNsuMmhJjesUK4sbc8xArY8P1OHZ/a4c=;
        b=zGDC/eQyT/8Qro/gHySYN/4FfsT5LVCnKPH94uS6l2YRq+Yo1BHcBe270Jriqh+2xS
         2Lwl/X10OoX+AoROsgnsLtkm0fYoPsQbxPTfE6IGklB3HZKyM16Tw39sgs8ZkKDMQTX4
         vKAfEPjBd/3/K3liALKHWIYszW1/MIWWy6kwjP+AjHNlsjyu/OFD2Mh0Lz5OJ6TDUUmn
         zsU6d0B7tVUFNBKo3clWBuQdfXj5SFZNcM38EbXcJRhpDiAM0toh71kldkJ9pGP6CNMk
         SnUvnsp2ftwIGQXDRkEK5lj8g9OygH2Q3BV+lrJAEPQoc996jln3TR79Lsxn3PNSOLx9
         6opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747731195; x=1748335995;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iaiebv1iUlPjNsuMmhJjesUK4sbc8xArY8P1OHZ/a4c=;
        b=pu6EWPQuG2VLx7ZJPtNJUBMAvHTe7zitigjijNdMeMIzXRRTynHBJDL3Kfpd0P/orQ
         rxiSTLpu78XQye2Ro+sKqvdSfqctgbXjU5FTj4ferpL77Rrg6l+EHj7nnosGoDCDdoAS
         fcmekJBw8NqY5zfQKyYDrNPPBQ5NlHTCjMCnkfCNi2NbbH9wc/aB0XEaknYOW/roh4mz
         aRvyJ0CkVKQ0peW9/RKW9oTCd4MSAfTWTK1JUuUhI/q5vlbEjbHBZ7/gxrHZxU4iBSva
         KnHCJE8CeeuwW/hsQ4c3kvvYvyJlD5yuxRvlz6GI04UWdy8KCrsNPlxlUHOfUUNLhmmg
         sNzg==
X-Forwarded-Encrypted: i=1; AJvYcCXB0VhNjjT8tdNbFOFqtAouP3Ryqdm/cglx0MtmHtFVUPwq62+Y3i1VHN6T/n589A672Th1rNZr9AQRBGr3o7Fx@lists.infradead.org
X-Gm-Message-State: AOJu0Yyegfmn6K+Gt0/PFBHfs4zNyJscgFYwrPf1CLh2AA9H+tw3253O
	ftjhfolb2GH+mRl1WdTQ5OAV+dEBKQU/BkOfQxHsWhG9meSB7mN39V2uz5fJaZi0KcrRKP7Qx0M
	1MIR3lZ3UQ6CFpZOllTvf0g==
X-Google-Smtp-Source: AGHT+IHpkZxdcW0elwcmz1T5vd4Wk49F8B5i3CFYJRUb7n4RGyA8tbVGoOAC7m8rZnfR1snVQ+54871TJKr2vkjF
X-Received: from wmqb3.prod.google.com ([2002:a05:600c:4e03:b0:43d:1ef1:b314])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:468f:b0:440:6a37:be09 with SMTP id 5b1f17b1804b1-442fd6312f8mr169931545e9.16.1747731195203;
 Tue, 20 May 2025 01:53:15 -0700 (PDT)
Date: Tue, 20 May 2025 09:51:59 +0100
In-Reply-To: <20250520085201.3059786-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250520085201.3059786-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
Message-ID: <20250520085201.3059786-9-vdonnefort@google.com>
Subject: [PATCH v5 08/10] KVM: arm64: Add a range to pkvm_mappings
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_095316_743701_F3DF2680 
X-CRM114-Status: GOOD (  13.92  )
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
index 8a1a2faf66a8..b1a65f50c02a 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -264,7 +264,7 @@ static u64 __pkvm_mapping_start(struct pkvm_mapping *m)
 
 static u64 __pkvm_mapping_end(struct pkvm_mapping *m)
 {
-	return (m->gfn + 1) * PAGE_SIZE - 1;
+	return (m->gfn + m->nr_pages) * PAGE_SIZE - 1;
 }
 
 INTERVAL_TREE_DEFINE(struct pkvm_mapping, node, u64, __subtree_last,
@@ -305,7 +305,8 @@ static int __pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 start, u64 e
 		return 0;
 
 	for_each_mapping_in_range_safe(pgt, start, end, mapping) {
-		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn, 1);
+		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn,
+					mapping->nr_pages);
 		if (WARN_ON(ret))
 			return ret;
 		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
@@ -335,16 +336,32 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
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
@@ -366,7 +383,8 @@ int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
 
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
-		ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn, 1);
+		ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn,
+					mapping->nr_pages);
 		if (WARN_ON(ret))
 			break;
 	}
@@ -381,7 +399,8 @@ int pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
 
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
-		__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn), PAGE_SIZE);
+		__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn),
+					  PAGE_SIZE * mapping->nr_pages);
 
 	return 0;
 }
@@ -396,7 +415,7 @@ bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
 		young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest, handle, mapping->gfn,
-					   1, mkold);
+					   mapping->nr_pages, mkold);
 
 	return young;
 }
-- 
2.49.0.1143.g0be31eac6b-goog


