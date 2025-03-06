Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAEBC28B22
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 11:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXik8AjbYyPYjDFsjvp2RmgmvxUrFId1oBHnRgszILo=; b=b1aHCh/ViCHz+l6rvP2knafJ+6
	vn/OpTaDVoEEDnEc6W0ukiqGNkCcstb7MzzgkY1ie8oYPD0f7l2hgVmNqxQfI1feQfQNs3A3BZL8x
	K2rdjBiB15tJqqD0b3fY9K9qOED/mf/yh2YRGghX1b1+S0p7kHVn+RIAD0Nc7iYS60rVP4G+oLhX1
	Ve9ZkkqOkY7WoCqE+pWxwY+OXGI+K0U+6QmqZDyEyFyEE7vU9j6fOT/km9XMW9yTTvll/EVvw46T3
	G9x0eZXu69afra5B8lnzeWnSGF0niWFS77MCo4dcH7TOtkU3qLJ0DAKWFjRwRrD8SeiWJYicJZw+D
	y3PIQXJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9Aj-0000000AkO7-3ZVZ;
	Thu, 06 Mar 2025 11:13:49 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8yM-0000000AiZD-0Cuc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:01:04 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43bd0586a73so5013985e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741258860; x=1741863660; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qXik8AjbYyPYjDFsjvp2RmgmvxUrFId1oBHnRgszILo=;
        b=mMyzUe+l2Oi2vVxt/+FP+dblAIvLB435tn5fY9s0gArzxYRwKJwI6EdFa7A4DaG6bK
         hU+qM4OMYOkDx8/EXTs+mP4cEdr4LitzfYMAVj8ZjE7XL2HPdPiu7Q43Td0huDd9EcV3
         nujpvHr9mQJYHnwTjtNU9TK1AW9xjAtg588lo5CjCfh7kRTxPmCNv5PTwkNjRW3XLlK3
         8GSSgbjDG2KiNYccvcgxHx90LBJul1Ng4G9iqbnbTmDbG1KI0/CgwnKTfxa1QJHq8OAN
         v7LUwzTH3cGPGPVIyqjsPay1hVAVkPtpNkY4ENSKx4CH6FrE2OTbtcuMPmSQ7PnlxAx7
         5exA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741258860; x=1741863660;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qXik8AjbYyPYjDFsjvp2RmgmvxUrFId1oBHnRgszILo=;
        b=mHrNhT6eCS+OQguNAMKvrjmBy3NSlZMvFb5w2vy0r0J4xJx5zaCY3R6PooW1ZGln3g
         nBysIslp5sewSwlV9PUR5fJS9ZOq1fnTcwX1DEqi7/KwiV97bWXzBIIcwCoa+EvtVr+0
         ExuXl7zovtOubtS70f6LyODqTRNgXyudJQram+8KQC4tcFZJASHfJBzIpLXRI/EaWivt
         deugvv6MM89DSNA9QBkV14eeSrX3KpxjLy3w92/agmyqBHbreJ1eurj2tXIY6q3sOyow
         ufEej/Ae/uYb9IgS/vqecdDojYWGvIHDtNHXkwIwFdPhzAT/vVTZwGt0LpUIquQW/vaN
         B8pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXt1zUa5aCO+xcaLhBVs4VTuvIaQXHfr0KEIA/ZAk1xK0Dqs79W0J+Thp4blVfNSNqN37gEZoiXwZJ+nLh/zewf@lists.infradead.org
X-Gm-Message-State: AOJu0YxF2M5W5mYBH/V0rDXeee7ULoPIpOK87qOJqIGLmseIX/N78E8v
	CUYReF2A9RWrVZWqwD9rnZwh4waYY415LmRzbWzVhACMTJlE1sVO/hC2ruaGt2NeEerfRqvpgdN
	e5pEpy6uY3jAZ2AOjWQ==
X-Google-Smtp-Source: AGHT+IG1zpmCoE47NgJOQQ1JcAF2Bl3oBRwYgO4WaRdecPq4Be2Q4d+PX+LTxNRaXoONJrSQGsIXYlKSmDSqbhOe
X-Received: from wmbfp6.prod.google.com ([2002:a05:600c:6986:b0:43b:cf2d:8027])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:198f:b0:439:9ee1:86bf with SMTP id 5b1f17b1804b1-43bd294309bmr67065855e9.7.1741258860152;
 Thu, 06 Mar 2025 03:01:00 -0800 (PST)
Date: Thu,  6 Mar 2025 11:00:36 +0000
In-Reply-To: <20250306110038.3733649-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250306110038.3733649-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250306110038.3733649-8-vdonnefort@google.com>
Subject: [PATCH v2 7/9] KVM: arm64: Add a range to pkvm_mappings
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_030102_111133_E81A8C8F 
X-CRM114-Status: GOOD (  13.40  )
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
index f0d52efb858e..0e944a754b96 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -166,6 +166,7 @@ struct pkvm_mapping {
 	struct rb_node node;
 	u64 gfn;
 	u64 pfn;
+	u64 nr_pages;
 	u64 __subtree_last;	/* Internal member for interval tree */
 };
 
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index da637c565ac9..9c9833f27fe3 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -278,7 +278,7 @@ static u64 __pkvm_mapping_start(struct pkvm_mapping *m)
 
 static u64 __pkvm_mapping_end(struct pkvm_mapping *m)
 {
-	return (m->gfn + 1) * PAGE_SIZE - 1;
+	return (m->gfn + m->nr_pages) * PAGE_SIZE - 1;
 }
 
 INTERVAL_TREE_DEFINE(struct pkvm_mapping, node, u64, __subtree_last,
@@ -315,7 +315,8 @@ static int __pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 start, u64 e
 		return 0;
 
 	for_each_mapping_in_range_safe(pgt, start, end, mapping) {
-		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn, 1);
+		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn,
+					mapping->nr_pages);
 		if (WARN_ON(ret))
 			return ret;
 		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
@@ -345,16 +346,32 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
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
@@ -376,7 +393,8 @@ int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
 
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
-		ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn, 1);
+		ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn,
+					mapping->nr_pages);
 		if (WARN_ON(ret))
 			break;
 	}
@@ -391,7 +409,8 @@ int pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
 
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
-		__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn), PAGE_SIZE);
+		__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn),
+					  PAGE_SIZE * mapping->nr_pages);
 
 	return 0;
 }
@@ -406,7 +425,7 @@ bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
 		young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest, handle, mapping->gfn,
-					   1, mkold);
+					   mapping->nr_pages, mkold);
 
 	return young;
 }
-- 
2.48.1.711.g2feabab25a-goog


