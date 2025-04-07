Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A34AC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 08:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AkIkgXtzJydgYT4Aq3qFZ4/IxfJ3oybUqKkE6SsWBu8=; b=a4oVqtHVRDG6ahP7JyB0kvyDvM
	gmpInZrggnVLsWyHqBlMLhqLAS+45c6JgvfvXmvfl2uAv11UteXf7KnTZpH+tk/V7ikyibV82Alv0
	0JacB9yl/JjuwsE81HUmcU4aLG9zO0TWUldi5WdrcJmZgJwVOBry9eF9HjVUDj+wvfb6AdgkVaPC5
	tKCGmI/7NH/XnuGTGPXYGVNYnWpFdnNkPKEAFrEWA7SW3eTyWmgu25QxifcXsCr8hI2vAWg9zxrNV
	vrfVvUTlQM6ZZPBylcPOSDHLP3bEI8LBpldN67EmnNyNXjGk+hNUgyD658/Pbzwg23sQnNXvroi1B
	2vwlROfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1i3U-0000000H3Hk-3T76;
	Mon, 07 Apr 2025 08:42:08 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hpZ-0000000H007-3SfZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 08:27:46 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43d733063cdso33715415e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 01:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744014464; x=1744619264; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AkIkgXtzJydgYT4Aq3qFZ4/IxfJ3oybUqKkE6SsWBu8=;
        b=sJKa8MWaVHwpwdXrF0CZUGlEt7vSbPW+MqoeQihUU4oXFTJBQ0G0IPYfGxYbyJ2yLM
         KiMwnASNASq7dOAxZjthv+jTVHNdMcDH5WweSmltUmGIcBXvqsnzqF8IH+eSZQCkTo/8
         CRKaqKyBFnp7g+lcT8cNg9KsJ6W8jV5V+5ASD8+4Db23dx5rigfU4bvpu/UjkDnTGrvl
         tFb0yjVgZ7SGR3WloHZXMkeprlFlZQNcevZA/gYeVFOUzzabSKe26AH50kmJZkAP7hKi
         21LCT2pKRdOwtGOxeHzcKsD+Yl2SndDHI/NBRbli1FDakQG/s9AEuGR2TQo3z0I3Dp/u
         Vnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744014464; x=1744619264;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AkIkgXtzJydgYT4Aq3qFZ4/IxfJ3oybUqKkE6SsWBu8=;
        b=cm3cFK2RZCyxodYxuCqTxUFB2LfCarMP6bzDtEXiaPZUjXetq/MLCjtgF/OXiRF28t
         1/rXIYh8yQYLoNije570GYGWOpq9ZTJMLkFdiMQ/mfJLvCZdxpuLqzkfBd458rff/2TX
         qS5Wvo89kM08B696lnN+YGVKBaZx32nJIShnTGuUCdQyKgrwW5Dgyxl27uqO5/FtNDUR
         Ya2qznkUa6KJx5Wv+7xB0096Kkt5GqaWQHgH4kzmG83qLN2SMsZOAhqX9YlWZ8+3cJ8I
         +fp4NkbYg9ldQBvLbBa5XiHcbvFJ0uLs0+/IMeXsP/KCwQLpwzuOoQOZj226KhsxEpJp
         Ly+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWCJKBQRnn6Hxj9NIDmBvwBpvDSGodX3WPGDTIPozxFoxpdemQGMn9lHjEfWoSnplGiFRLnWG32mnV0PDueew5u@lists.infradead.org
X-Gm-Message-State: AOJu0YyU1SIxkiQKRddPsUYQKyTU81fpWjt/5F+mxVd4l4e7bsV6TQIH
	WLSTpzVh2uAhfZ0ff6Gow9jPBZsLZJo5e5TrxuskbyK4KQOBPPCG8Iy3+uZEwmjjPIfuurvgW4p
	YIxh30EW7s0AjnxhN7w==
X-Google-Smtp-Source: AGHT+IHHzlQ1gVc6d7i809HTCyxXwQG1q36o9QITFKS+Njq3l4/ScwwfjO7m2fkiwa4OY68/Yp4JeYb+QP2ZKtM9
X-Received: from wmcq28.prod.google.com ([2002:a05:600c:c11c:b0:43b:c336:7b29])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:354c:b0:43d:745a:5a50 with SMTP id 5b1f17b1804b1-43ee0694b57mr58544285e9.19.1744014464185;
 Mon, 07 Apr 2025 01:27:44 -0700 (PDT)
Date: Mon,  7 Apr 2025 09:27:04 +0100
In-Reply-To: <20250407082706.1239603-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250407082706.1239603-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250407082706.1239603-8-vdonnefort@google.com>
Subject: [PATCH v3 7/9] KVM: arm64: Add a range to pkvm_mappings
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_012745_865331_31033D87 
X-CRM114-Status: GOOD (  14.30  )
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
index 5276e64f814e..135df9914cca 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -167,6 +167,7 @@ struct pkvm_mapping {
 	struct rb_node node;
 	u64 gfn;
 	u64 pfn;
+	u64 nr_pages;
 	u64 __subtree_last;	/* Internal member for interval tree */
 };
 
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 08fbe79dd1e4..97ce9ca68143 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -281,7 +281,7 @@ static u64 __pkvm_mapping_start(struct pkvm_mapping *m)
 
 static u64 __pkvm_mapping_end(struct pkvm_mapping *m)
 {
-	return (m->gfn + 1) * PAGE_SIZE - 1;
+	return (m->gfn + m->nr_pages) * PAGE_SIZE - 1;
 }
 
 INTERVAL_TREE_DEFINE(struct pkvm_mapping, node, u64, __subtree_last,
@@ -318,7 +318,8 @@ static int __pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 start, u64 e
 		return 0;
 
 	for_each_mapping_in_range_safe(pgt, start, end, mapping) {
-		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn, 1);
+		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn,
+					mapping->nr_pages);
 		if (WARN_ON(ret))
 			return ret;
 		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
@@ -348,16 +349,32 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
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
@@ -379,7 +396,8 @@ int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
 
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
-		ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn, 1);
+		ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn,
+					mapping->nr_pages);
 		if (WARN_ON(ret))
 			break;
 	}
@@ -394,7 +412,8 @@ int pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
 
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
-		__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn), PAGE_SIZE);
+		__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn),
+					  PAGE_SIZE * mapping->nr_pages);
 
 	return 0;
 }
@@ -409,7 +428,7 @@ bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
 		young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest, handle, mapping->gfn,
-					   1, mkold);
+					   mapping->nr_pages, mkold);
 
 	return young;
 }
-- 
2.49.0.504.g3bcea36a83-goog


