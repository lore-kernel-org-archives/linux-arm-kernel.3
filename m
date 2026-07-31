Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF37C55172
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBeJnOBeGvR3Kq4srtpyurlmLcYd2v/y6WTlhJ89Sk4=; b=B0+8koTvbFJoOF1DLUtnuVMGQQ
	8DF9Rjt0RDhXTmUb58F39S9SN+BVMESn+kqCoygmKRbpq+sjtwgyJg6nS7qi6NJee1RjK3q1L1l/z
	uezqmLCiI3YGaEmropNNot1ET7IHFSd4sfluijvrjoPWrEFuA4+X4ZHdEHtQL3aa+O2uu+6XJSouK
	1RIEfqzl9iQEfxoa2h1Gvl5EAWk0LjH3x2eqayd90aWtl10dA3PHMsZyKG1Lz1wtWs28PgrdQn4wq
	pzhH8D6ZKQ6SVpALtLIw7ArOAsx0zqhQLgElUYSz5z5XVoqLlk3cTVUmrsdezgoDeRUPE7rIgMfFs
	mMFuDetA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoLX-0000000Cjdx-3A7T;
	Fri, 31 Jul 2026 14:36:23 +0000
Received: from mail-ej1-x645.google.com ([2a00:1450:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoLA-0000000CjRk-2yRZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 14:36:01 +0000
Received: by mail-ej1-x645.google.com with SMTP id a640c23a62f3a-c15cec1ccb6so103285666b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 07:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785508558; x=1786113358; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dBeJnOBeGvR3Kq4srtpyurlmLcYd2v/y6WTlhJ89Sk4=;
        b=wWjnv4So3oWgmcvbIrIH0skrCVzS43+YB93H0gMW4lKwYQ8t5Rzr4hbfojHlWrjtcJ
         Z30EIpdiXAMkgfP38UoLMuchiHxS4A8qcmNr/GwVMS46oJ2gb+5UFxFYhVXG2O41W1wS
         TLwHBb1M05AWtcPowF1BJJ3SJWyufOBtsgdqsV5IvrpvuUNkww5n9bKt6DjB8B9Hwa+d
         BsnMkkr/r7JP2Lh+V3LZlpSnbGPz0xz9PtBOvuICvtzeou5GKFkd5IpN671WDDuhzfbm
         K8w1YiBnv34ERRdNSWsqpf444KW6lvYmQK2stpvfGIFSUKaZ0QuI61l6rxeDvi75CLCM
         Z3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508558; x=1786113358;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dBeJnOBeGvR3Kq4srtpyurlmLcYd2v/y6WTlhJ89Sk4=;
        b=YNhXTwuzuoUBKnFe2fH36PxTsZ1v3E86a85dlJrnFvUVhSpXdKjkK2w8CM9WxAcEjy
         0zekSfm7glBSHaYjSOO0l8q2Mvta6LNE81ZGAJn3qeb4EkYSJzGdsNXc53uch1U0avjd
         dj0tj0Jg5lgfIW1SpRbEn9tEUVODvlOcOTgcTg3VSop/y+FGB9nWYoi5+LYhX9Qqaf4M
         Vi6dHtbruQNhiOdjW8TF0ztIf5V3rzHEbe9dvAaSsL5JR7aTTZzTJ6Ps6u8EORYDVdtN
         YQrTW+reK5ybG4YsBcoZAWUz1l9McrkefQdamAp4irXDuEC48N5yq6gVZ8q8gPhc6DgY
         rQ6Q==
X-Forwarded-Encrypted: i=1; AHgh+RrFc/u6+Aak05Ej0fuhSmjW8UHO4uNFxM1KWjb7i/gJUJUYqD0qSP0B432EM41pqt8Ihv3357vYHIjLCyUi8ZWN@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2vN5RN6aU6zI86AMA7A0ignpt7PTA0aKx8YnmGxPYgqzKhck+
	gj+7oIiDLQZ8+cVdFb0fdNmyitHQKgdHySc7HigA2bbZjpE+LwQh7Yjv/pxaOGxiBe2Xb85dGok
	N/mYtppKsXyHEypULOK6oCQ==
X-Received: from wmpw24.prod.google.com ([2002:a05:600c:998:b0:495:4837:275e])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:4783:b0:c1c:2173:d412 with SMTP id a640c23a62f3a-c1fd23982c8mr146275266b.1.1785508557986;
 Fri, 31 Jul 2026 07:35:57 -0700 (PDT)
Date: Fri, 31 Jul 2026 15:35:27 +0100
In-Reply-To: <20260731143541.956291-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260731143541.956291-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731143541.956291-4-vdonnefort@google.com>
Subject: [PATCH v4 03/17] KVM: arm64: Add pkvm_map_private_va_range
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_073600_773376_5D8DBFC3 
X-CRM114-Status: GOOD (  12.88  )
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

In preparation for the pKVM heap allocator, introduce
pkvm_map_private_va_range() to map a physical range into the pKVM
private range.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/include/nvhe/mm.h
index 00cadd13ee5d..ea97ea49820e 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mm.h
@@ -31,6 +31,7 @@ int __pkvm_create_private_mapping(phys_addr_t phys, size_t size,
 				  unsigned long *haddr);
 int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr);
 int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr);
+int pkvm_map_private_va_range(void *haddr, phys_addr_t phys, size_t size);
 phys_addr_t pkvm_private_va_range_pa(void *va);
 
 #endif /* __KVM_HYP_MM_H */
diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index 9ab7f613fa36..22f6aae42f29 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -25,6 +25,7 @@ struct memblock_region hyp_memory[HYP_MEMBLOCK_REGIONS];
 unsigned int hyp_memblock_nr;
 
 static u64 __io_map_base;
+static u64 __hyp_private_va_start;
 
 struct hyp_fixmap_slot {
 	u64 addr;
@@ -90,6 +91,41 @@ int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr)
 	return ret;
 }
 
+/**
+ * pkvm_map_private_va_range() - Map a physical range into the private VA range
+ * @haddr:	The virtual address in the private range.
+ * @phys:	The physical address to map.
+ * @size:	The size of the range to map.
+ *
+ * The hypervisor VA @haddr must have been first allocated with
+ * pkvm_alloc_private_va_range(). The created mapping can later be removed
+ * with pkvm_remove_mappings().
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int pkvm_map_private_va_range(void *haddr, phys_addr_t phys, size_t size)
+{
+	unsigned long addr = (unsigned long)haddr;
+	int ret;
+
+	if (!PAGE_ALIGNED(addr | phys | size))
+		return -EINVAL;
+
+	guard(hyp_spinlock)(&pkvm_pgd_lock);
+
+	if (addr < __hyp_private_va_start || addr >= __io_map_base)
+		return -EINVAL;
+
+	if (size > __io_map_base - addr)
+		return -EINVAL;
+
+	ret = kvm_pgtable_hyp_map(&pkvm_pgtable, addr, size, phys, PAGE_HYP);
+	if (ret)
+		kvm_pgtable_hyp_unmap(&pkvm_pgtable, addr, size);
+
+	return ret;
+}
+
 /**
  * pkvm_private_va_range_pa - Translate a private VA to a physical address.
  * @va:		The private virtual address to translate.
@@ -168,6 +204,12 @@ int pkvm_create_mappings(void *from, void *to, enum kvm_pgtable_prot prot)
  * pkvm_remove_mappings - Remove mappings from the hypervisor page-table
  * @from:	The starting virtual address of the range to remove
  * @to:		The ending virtual address of the range to remove
+ *
+ * The range [@from, @to) can be a subset of the range previously mapped by
+ * pkvm_create_mappings(), as the latter enforces PTE-level mappings. However,
+ * it cannot be a subset of a range mapped by pkvm_map_private_va_range() as
+ * that function allows block mappings which the hypervisor page-table does not
+ * split.
  */
 void pkvm_remove_mappings(void *from, void *to)
 {
@@ -462,6 +504,7 @@ int hyp_create_idmap(u32 hyp_va_bits)
 	 */
 	__io_map_base = start & BIT(hyp_va_bits - 2);
 	__io_map_base ^= BIT(hyp_va_bits - 2);
+	__hyp_private_va_start = __io_map_base;
 	__hyp_vmemmap = __io_map_base | BIT(hyp_va_bits - 3);
 
 	return __pkvm_create_mappings(start, end - start, start, PAGE_HYP_EXEC);
-- 
2.55.0.508.g3f0d502094-goog


