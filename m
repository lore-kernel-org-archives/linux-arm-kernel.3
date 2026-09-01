Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873F0C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PNXfvvSVMdiv5W0xxEcK++hpZTu+rqnFDb2lmCj1j4=; b=nJ5vcdoTC5VXNETiNHiWgr/JaX
	5QmEq0Ipnares5qYeebqJe3p/n/fYs2ibfqcWEJeNOAURmn0inpRTUQKNWcQUpJzpwqRi/FLvm2ww
	TenvO5kinoSlnoms5JS9c7dR9v+I2Pzg2nHcoPCTExjMNa7vOsB4ZkUPqNPj0aeQ4zXNYY/6Uq6n4
	FT9/KIQMKIrp7kczyrRbSiC313qK3u6SfsA9xDP9No8vxowd1HHpCfCTWrHHsEZ+kMbhlPc4vl8Fu
	mL3cabycEjLME4CSD3rlYSu8/Dg2ylCqN85zQN4TDvuZme4lIl93qASVvDaDyhtbdcuOekg/cG2u9
	qQfRL7pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZ8-0000000BClZ-1ldE;
	Tue, 01 Sep 2026 08:09:58 +0000
Received: from mail-ej1-x645.google.com ([2a00:1450:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZ5-0000000BCiD-2qU0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:09:56 +0000
Received: by mail-ej1-x645.google.com with SMTP id a640c23a62f3a-c1f74261f67so156343566b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788250193; x=1788854993; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+PNXfvvSVMdiv5W0xxEcK++hpZTu+rqnFDb2lmCj1j4=;
        b=q3kaH9vdvDPh5BMGXAuF6ZO8RWd1q5q/KKETpT6dzgpv4KrW48XDKTG3mj0/9AfhjC
         0oYBZt68YGSNivl4UrpdAGX0hBQrDXjCN6waySWgZpCg0bSrYuW2MrFsaBGLEnebxfTG
         4HPvFIaYI21kdsLtgauyyCodmml4+P8HuSKoDq7wM4xF2cGhPG8GMc+nl0IIzhDaBnjI
         WNtQWhAGJdYDbnrt8gTFC5aj7HJdKVv/UDzdLKEbJwV3O9dGcOkEtniPC8KY1jF7Mim9
         cL9TBW+NrHKQ6GYC/nNQ8c1B8PC5WpCcCtyqR1Hh7RO5Y9wBmtR87nQNyp7u3A1gFssW
         G6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250193; x=1788854993;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+PNXfvvSVMdiv5W0xxEcK++hpZTu+rqnFDb2lmCj1j4=;
        b=iQsm5hOU/CXxElYmD8pBdE9RP/H/gVIYEviG9ohlr7Uv1Rb14nA9HqqRU14JHOLXpc
         meQWnD8ApKadSZhV0H7Bi9lc7Q5cK7E3eSsg3NVfRksGj1Z/pjH08prZt/HR25h/ng2M
         t7UGPmb7+p8w+it/auxIAjxWV6cOMciEoVqXnuLheB43vBcJbZ1Z2wDxZROUWQaBga1x
         m4OUQ48PsdNKX01mcq0SprqAT3VVhnxC/HIqJ6/GYlAqdBQV0Pxz1jWRMZPhbTseXMLI
         ZqPMNrTScuVUUbZUhAJ9ytSoqvEtk9eHkL1ICtHaH01EeDru9omK7KAQ7h1df5mkNEEY
         KclQ==
X-Forwarded-Encrypted: i=1; AHgh+RpkgOMOxLE9gpmBflMPLLBD4sT4mUCE887lpsM2JLp0i3N59E2UEnoz2298QzdFim9B6zKuYEiphB2FX0g8LGI0@lists.infradead.org
X-Gm-Message-State: AFuF++kCI2YcRZP3d3ruZnoWYHxBYWm8uMujtEAXxEw5yxc8xC8eJyQg
	+0PTDOjv5XsC1lAD1y1B9Y7F6Rpar4rS6W9APpovP80mTBl2pUeNCo+HlbSSB8oX2XYO8aRp2aI
	OCStztQAdUAkGxla0wgjMMA==
X-Received: from ejih12.prod.google.com ([2002:a17:906:2dcc:b0:c25:34f8:440f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3d4d:b0:c21:7feb:4574 with SMTP id a640c23a62f3a-c25b3b00031mr355498266b.1.1788250192206;
 Tue, 01 Sep 2026 01:09:52 -0700 (PDT)
Date: Tue,  1 Sep 2026 09:09:26 +0100
In-Reply-To: <20260901080941.997769-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260901080941.997769-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260901080941.997769-4-vdonnefort@google.com>
Subject: [PATCH v5 03/18] KVM: arm64: Add pkvm_map_private_va_range
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_010955_738061_3E684CC2 
X-CRM114-Status: GOOD (  13.89  )
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
2.55.0.897.gb25b4bd76c-goog


