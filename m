Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96278606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TzvGJM6q;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C8OHHY8U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=e6Dn35ZTrHhUrWwyLjwezkHEWmgek2c8fRcIdn4hvLg=; b=TzvGJM6qsBNVsHOuHyC++I8dur
	FZfsagAQ9rTZVOoM7L9rCCSdew73J1deFGk8FjH32YXvy6t+ASOMag8A4LfW/phJtMhUpW0UvpfG/
	sD5BUOje+tSet4gBl7ZCZFY30uX/HFrVXdhfP6QHN94SjJecFxFO8z11eaOAPWkWxBc2+O1X3sw3N
	CWtJY9r+aJX3SNNi2ClT1cYyMPnXtmDJEUqkpAYZSFmvEQJHPUY5EVkE20AHc6eEpbHNf223FK0Y8
	b4IEdsGjg978xHs7w1c47+vvKjxsp7RQebQ1GCRUJYGnHRKvz21ty4g1TSnLf6cjHE7igWdiwEnqv
	Ddp6R82g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyw5-00000000NoX-0eF6;
	Mon, 02 Nov 2026 20:47:21 +0000
Received: from mail-wr1-f71.google.com ([209.85.221.71])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyw2-00000000Nfp-1JRX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:47:19 +0000
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48af4046a3bso3372056f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 12:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793652435; x=1794257235; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e6Dn35ZTrHhUrWwyLjwezkHEWmgek2c8fRcIdn4hvLg=;
        b=C8OHHY8UuIhjVu2S6tJNVWsvwJRvl6CWub88t3KmAUGq1zYLALthKD9mGk0k8MPpmy
         D/LZtjBuKgnFd/o8EBXcFT0FKGR3Lkr2ASuRt64YjRipAUWTH1nXA0eB/YuQicBjlExp
         cgMyec3pzG307opCpb3W105HcOXIs3JZ+eDzkdCTLgJa1Sb87NmBLuueXlaZLPHlOjq8
         lKRKcD1bLR57h4vUfjZYUPm4KaVAcy/+Tv+ztfSPrYWciApujzsq/Fc0D7nKuwAj3WWG
         vqbL/BWYYBIAVQjR2tgc96zRJx8O+MBFMprItFBbTSTB3QVrSJNTfKdft5exci7Y/h6H
         ycdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652435; x=1794257235;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e6Dn35ZTrHhUrWwyLjwezkHEWmgek2c8fRcIdn4hvLg=;
        b=tZWEOCQKGrUHZtbtl9BjCLpY9+6RVHoEkqo6wqBGBO6eCVkv9cs0x1gBB/uNKPDF7h
         thH3pZ1m7lD2ej2P1KAcVH6wyslqIEIQCHKBSSgG/4JbHS3EnlPCqOjs74GvnrW1aEzB
         5zpMMtMqIEv2YQKgIwqOzeHfsjuXDGuBD3pao/wesEb1ntDMIlou1XLOFrqW8gr428d/
         vuN6glgZl9BvJFpqEBQNvtGkh8iHJ9LxYjjdH1Or4FL55oWkyYU8HZOppHuXFO7VF/uM
         UpaMBXBjaBGsdJ/W3GhRVZq9M8WeL1faS/8+yQZv1Kguys/kbRgbjtP8DCHS+gBYg0Ut
         7q8A==
X-Forwarded-Encrypted: i=1; AKwUvBz7GHdzTB8RE6KczxliZeJ5OyodPgRnbwqJzBhircFiZnIohG0xriHq2ZkkOk9YkBfnBY3hdfR6pLjd/VyK6ONm@lists.infradead.org
X-Gm-Message-State: APuU4Z/GEC5OO7w2Ja6wLP7RdsrM0oHIEc2DIuEf4t6OH85VGH4TEQYm
	KnMVvaTV6RN8E7QPgzCS0CV2PBM/bwY3U43NvtJBDCKK/IMSWR6dBqcUXnnTTVlLQYCzDNGSxV3
	aHg0Or+QWa2uq4H8ZvSrkGA==
X-Received: from wrrd17.prod.google.com ([2002:adf:fd91:0:b0:488:8b9b:19f9])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5388:0:b0:48e:666d:c96d with SMTP id ffacd0b85a97d-48e6e50c8d4mr18081477f8f.51.1793652435099;
 Mon, 02 Nov 2026 12:47:15 -0800 (PST)
Date: Mon,  2 Nov 2026 20:46:18 +0000
In-Reply-To: <20261102204628.401871-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261102204628.401871-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102204628.401871-14-vdonnefort@google.com>
Subject: [PATCH v3 13/23] KVM: arm64: Handle huge mappings in __pkvm_host_force_reclaim_page_guest()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_124718_382168_03DC3254 
X-CRM114-Status: GOOD (  16.14  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index 030bfc1155f8..68ed886e294e 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1340,7 +1340,7 @@ static void hyp_poison_range(phys_addr_t phys, u64 size)
 	__apply_guest_page(__hyp_va(phys), size, __hyp_poison_page);
 }
 
-static int host_stage2_get_guest_info(phys_addr_t phys, struct pkvm_hyp_vm **vm,
+static int host_stage2_get_guest_info(phys_addr_t phys, u64 *size, struct pkvm_hyp_vm **vm,
 				      u64 *gfn)
 {
 	enum pkvm_page_state state;
@@ -1368,34 +1368,43 @@ static int host_stage2_get_guest_info(phys_addr_t phys, struct pkvm_hyp_vm **vm,
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
@@ -1403,14 +1412,14 @@ int __pkvm_host_force_reclaim_page_guest(phys_addr_t phys)
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
2.56.0.385.gac671c819a-goog


