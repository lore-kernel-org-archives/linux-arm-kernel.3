Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C73C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 13:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THRS6RUOhVQKyz2pzkS3iWtym7smEtX3sb7fjdkvEcQ=; b=sTuhp5gqRUTUyGVVvlLZWKFete
	O9dNAMsZM03KyosvH3R7tXeEFc34su+ndVKzjNa7mj8hNK8c5U/KlwGMUQzVpjmsxv7dSGdX6jkkt
	qtN7phyVxyKnBRTNM3kXcL8RSdqV2yHlzqJylJxCiZ6UwLnDCTriufByaOYHRUz7lDQTSMWRw/g4r
	tgswcgOjGtITo+iL6TqNqpnurg/7+sZW2NJNfMjCiEIV6nU/o+43LCw5/hLqu41ZKB7U0dELPOYB2
	fQR/J9Kdyct4Qg3KfenQBBBERhRixwoZ8/k8PNrHxAQfjkGpWI2vwZubdG3IGKxuvh4HS+3HmMGna
	NGrE/kWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjAo-0000000Fsh5-1pG8;
	Wed, 21 May 2025 13:07:54 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHium-0000000Fpfv-2BlQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 12:51:21 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3a36416aef2so1843872f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 05:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747831878; x=1748436678; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=THRS6RUOhVQKyz2pzkS3iWtym7smEtX3sb7fjdkvEcQ=;
        b=TdEvKjfbVlORLE8mFeyHQn0r2mE/HMHuuOHnF3YowxT4brFAqyr/NyzDaTfaf4zEuC
         X+snzdO4UUN77mahEhuPr+Pbv8d4OsVpi0L0bwwgX6eytL6jj4TwKJKYFs3j5hvh3uyA
         LbjbDI93kE22qAHcobVol45s5GTDpgPs2y5ukZMTpxDOYFbm0s9q4rDLxyelzdxx2I7j
         ykOc7pLD3ygQJ6jxpPpYsx0eoMN7cRTUvCJ6BoDbJZvqjkS6qN6MxoBwiqxIVx9SJJe3
         Evzfl8h5yCaLVNIQ8SGufeVUPtlfSs98uHruyD3kJv9C41g+tBet1gedTxCAF6ZlI7i0
         +aLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831878; x=1748436678;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=THRS6RUOhVQKyz2pzkS3iWtym7smEtX3sb7fjdkvEcQ=;
        b=ERfHAx9kBxHwqR0nAFuwdkhFMAoB+tXk96f30/D3fyxMWCJ/3JVIfpuc6m5W+DUSGH
         NmETKdy3OA9ipOQW5ATS1RtSrK2RKKo8ms90egD+0pnBV7Mf43yu2TgaQGJlRDbqIryF
         koYezuiVWLwE/4tL5DaJVPz2Jf+isNlKpEwwvUAg6qvZB7eZXhoXa7C9G17Hveklz23X
         L1/6pWYrL7nYRe86k5yhpSF+EPOOu5Ui7+Q0HUih53Md1MsOtu9xa/0M8Gt0MoYB5uH5
         huugCfXf3jmsNZ/3w4RRaSV/2h6wDo0yjv/jF9F6G862XW1M3opHNQM/Vl7AJTGxt0c2
         GbJA==
X-Forwarded-Encrypted: i=1; AJvYcCUpallMQn7ogggFxD82DInPaCBA9vL4P8fesksaSwAmpkTUKNcUzeWD3iQ4huBC9PR1taAqLPoby0VD+GjzRJ7M@lists.infradead.org
X-Gm-Message-State: AOJu0YzcAJvzK8o2+Pu0HgS/QAy1itVKDD5VlmiczYcy3YV1uCxQK3+m
	WRQg9JvCPGpfaNKV4XXRudGU9YtSeQLcHs1gMHdBo+WWXnAdh1cXJMRxYR/IamAOwSuTU8cqHEi
	JA1jCj6MGHcnP1peyIfeb6Q==
X-Google-Smtp-Source: AGHT+IGhYVIBRuADQr6WRByKd7PpHl5cm15NxpBtNtkX8ms0Vg3sLjAj+oF4iS4GtuyYvGveuHPK8YSVEQ+prz7R
X-Received: from wmbhc24.prod.google.com ([2002:a05:600c:8718:b0:441:bf4e:899c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4304:b0:3a3:6ae4:6615 with SMTP id ffacd0b85a97d-3a36ae46750mr10498053f8f.13.1747831878332;
 Wed, 21 May 2025 05:51:18 -0700 (PDT)
Date: Wed, 21 May 2025 13:48:32 +0100
In-Reply-To: <20250521124834.1070650-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250521124834.1070650-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250521124834.1070650-9-vdonnefort@google.com>
Subject: [PATCH v6 08/10] KVM: arm64: Add a range to pkvm_mappings
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_055120_560524_5C047C0C 
X-CRM114-Status: GOOD (  13.98  )
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
2.49.0.1112.g889b7c5bd8-goog


