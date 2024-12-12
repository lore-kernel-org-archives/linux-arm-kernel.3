Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1F5E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXIRvpZuiwLtOV93NpSTxaaQKTg5ZvL9FYLJBzJb620=; b=Ayu//t1YoYIYYUhbGyLEkriEuQ
	AwhuTKyLMGH/ZUHqfaM9OYkb1rWoqOKQhJXRuxXz1chhDz6BqljS3FRZOssdbWE1A8tfBnhZrl7J+
	89PLkSLar3AUIe6uhuc5jL0Sp32eD/LpHV1L6IOBr+81LOXw7oQTy4fz8z0vbBvxEv8iM6i/9j2bm
	SBHb/REQbsLrLpGW/VR+4FZzHG7UU/3wli3Vmms4y+qMHbjBBv2zRe1nmqAnk2YQpraLyCJo/2pw6
	waCMmb0oJJUWXb4bEoHclpvDqOlcd2XYdJsclKicJUd1/K9KYLBQs5HK1e/KuJYUshwNf/awJfv0Z
	OzePPQdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnm6-00000001NzP-2QW6;
	Thu, 12 Dec 2024 18:18:58 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnYl-00000001Jcm-10Bo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:05:12 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43627bb20b5so4502385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026709; x=1734631509; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iXIRvpZuiwLtOV93NpSTxaaQKTg5ZvL9FYLJBzJb620=;
        b=j4W0MvZE9L93KiCODGfT8/lZRzknurJJVJZhaAjEnzZm/MK+M8dpjCRIPfOPXDcr2K
         qrTb9SUl0BT1HqBY/YSKJEN+134aXpBkZoi/b1RkThDVgxF2xIewmB693UQo33MQqyRA
         mz/7wTvYgpyzleI7thqggK29dz7bmxVih7qmU3ds1oYzPN/l6iDhsBp1U8tdo6bXEA5j
         GIQ0EazUyqbCdWdTUx4/82AQD9VS/u9NpY9dRVqXp8v1hUBOHMn6R0sC+1ulOJg0NsRr
         t8qhvFxMgZpRI/4SbXVhaDJ6ZBACl/k/smKoWPPE3/MLbeRsOqiYB+6XFwZX2gRFH+7u
         EWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026709; x=1734631509;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iXIRvpZuiwLtOV93NpSTxaaQKTg5ZvL9FYLJBzJb620=;
        b=YichtzWCHXF3+g5BxGibNEM8Glb+ZPEBZmNNz/id9ssEOup3PZrUFjsqBLFOnz6pkP
         TcI+MlnqTK0xbTuLMy5mtk2wx6yUshYwIXSDw6ciI+Q1/45sAR3cJXUs4H/ub4pN6ruB
         spiX/EtTdMU+ZtBigUyZWVeobd549dISQC29LncEZ3iCiOVDVJmM/oZyXLTxncnWdoE9
         amJr/R/9UrS+Oz77FYXyG7RPolJ/gyO2Ipvo6q8iE2VR+hpxRQem1dhVzKNtBqw+D0Uh
         BdCvNdvAIqc7zMmYPgPbBY7p5CRTqPEzKbL1BJmZqfGi1EFgCQx8uSfAa/bshach2j0F
         Ev/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6nWzaYCjWDqHf+ca1/F93Y1tiTM+S70+fg1AdFpzzfFeJFAxSb9+b6eS+i2pt8eqGizimTXCiRr+Xve01a1LM@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6cGh3RiASRInmOGutp8dDeUdelLG8MLnUdhzIN7sPRoTv/uqI
	+HNqsZALqH/Ct9sJHkZw2ykLh6o6aTpI9vxHBL9heTaSeCdenM3UFxMhhwExPkaQnjiV5ndE+TQ
	wXm4njwvU6g==
X-Google-Smtp-Source: AGHT+IHgnk/pCZh1WlJnWXuUNSz2FFTV3sydknebPh6K+YIgIP/qVa3msTdRnMT5NLGcQQqFklKUxKoqwGRQMg==
X-Received: from wmdp19.prod.google.com ([2002:a05:600c:5d3:b0:434:f271:522e])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46c6:b0:434:a746:9c82 with SMTP id 5b1f17b1804b1-43622823ab1mr38109965e9.5.1734026709204;
 Thu, 12 Dec 2024 10:05:09 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:36 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-13-smostafa@google.com>
Subject: [RFC PATCH v2 12/58] KVM: arm64: Add __pkvm_{use, unuse}_dma()
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org, 
	robin.murphy@arm.com, jean-philippe@linaro.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, vdonnefort@google.com, qperret@google.com, 
	tabba@google.com, danielmentz@google.com, tzukui@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_100511_276422_4A879711 
X-CRM114-Status: GOOD (  18.77  )
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

When a page is mapped in an IOMMU page table for DMA, it must
not be donated to a guest or the hypervisor we ensure this with:
- Host can only map pages that are OWNED
- Any page that is mapped is refcounted
- Donation/Sharing is prevented from refcount check in
  host_request_owned_transition()
- No MMIO transtion is allowed beyond IOMMU MMIO which
  happens during de-privilege.
In case in the future shared pages are allowed to be mapped,
similar checks are needed in host_request_unshare() and
host_ack_unshare()

Add 2 functions that would be called before each IOMMU map
and after each successful IOMMU unmap.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 97 +++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 67466b4941b4..d75e64e59596 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -92,6 +92,8 @@ int __pkvm_remove_ioguard_page(struct pkvm_hyp_vcpu *hyp_vcpu, u64 ipa);
 bool __pkvm_check_ioguard_page(struct pkvm_hyp_vcpu *hyp_vcpu);
 int __pkvm_guest_relinquish_to_host(struct pkvm_hyp_vcpu *vcpu,
 				    u64 ipa, u64 *ppa);
+int __pkvm_host_use_dma(u64 phys_addr, size_t size);
+int __pkvm_host_unuse_dma(u64 phys_addr, size_t size);
 
 bool addr_is_memory(phys_addr_t phys);
 int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index d14f4d63eb8b..0840af20c366 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -513,6 +513,20 @@ bool addr_is_memory(phys_addr_t phys)
 	return !!find_mem_range(phys, &range);
 }
 
+static bool is_range_refcounted(phys_addr_t addr, u64 nr_pages)
+{
+	struct hyp_page *p;
+	int i;
+
+	for (i = 0 ; i < nr_pages ; ++i) {
+		p = hyp_phys_to_page(addr + i * PAGE_SIZE);
+		if (hyp_refcount_get(p->refcount))
+			return true;
+	}
+
+	return false;
+}
+
 static bool addr_is_allowed_memory(phys_addr_t phys)
 {
 	struct memblock_region *reg;
@@ -927,6 +941,9 @@ static int host_request_owned_transition(u64 *completer_addr,
 	u64 size = tx->nr_pages * PAGE_SIZE;
 	u64 addr = tx->initiator.addr;
 
+	if (range_is_memory(addr, addr + size) && is_range_refcounted(addr, tx->nr_pages))
+		return -EINVAL;
+
 	*completer_addr = tx->initiator.host.completer_addr;
 	return __host_check_page_state_range(addr, size, PKVM_PAGE_OWNED);
 }
@@ -938,6 +955,7 @@ static int host_request_unshare(u64 *completer_addr,
 	u64 addr = tx->initiator.addr;
 
 	*completer_addr = tx->initiator.host.completer_addr;
+
 	return __host_check_page_state_range(addr, size, PKVM_PAGE_SHARED_OWNED);
 }
 
@@ -2047,6 +2065,85 @@ int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages)
 	return ret;
 }
 
+static void __pkvm_host_use_dma_page(phys_addr_t phys_addr)
+{
+	struct hyp_page *p = hyp_phys_to_page(phys_addr);
+
+	hyp_page_ref_inc(p);
+}
+
+static void __pkvm_host_unuse_dma_page(phys_addr_t phys_addr)
+{
+	struct hyp_page *p = hyp_phys_to_page(phys_addr);
+
+	hyp_page_ref_dec(p);
+}
+
+/*
+ * __pkvm_host_use_dma - Mark host memory as used for DMA
+ * @phys_addr:	physical address of the DMA region
+ * @size:	size of the DMA region
+ * When a page is mapped in an IOMMU page table for DMA, it must
+ * not be donated to a guest or the hypervisor we ensure this with:
+ * - Host can only map pages that are OWNED
+ * - Any page that is mapped is refcounted
+ * - Donation/Sharing is prevented from refcount check in
+ *   host_request_owned_transition()
+ * - No MMIO transtion is allowed beyond IOMMU MMIO which
+ *   happens during de-privilege.
+ * In case in the future shared pages are allowed to be mapped,
+ * similar checks are needed in host_request_unshare() and
+ * host_ack_unshare()
+ */
+int __pkvm_host_use_dma(phys_addr_t phys_addr, size_t size)
+{
+	int i;
+	int ret = 0;
+	size_t nr_pages = size >> PAGE_SHIFT;
+
+	if (WARN_ON(!PAGE_ALIGNED(phys_addr | size)))
+		return -EINVAL;
+
+	host_lock_component();
+	ret = __host_check_page_state_range(phys_addr, size, PKVM_PAGE_OWNED);
+	if (ret)
+		goto out_ret;
+
+	if (!range_is_memory(phys_addr, phys_addr + size))
+		goto out_ret;
+
+	for (i = 0; i < nr_pages; i++)
+		__pkvm_host_use_dma_page(phys_addr + i * PAGE_SIZE);
+
+out_ret:
+	host_unlock_component();
+	return ret;
+}
+
+int __pkvm_host_unuse_dma(phys_addr_t phys_addr, size_t size)
+{
+	int i;
+	size_t nr_pages = size >> PAGE_SHIFT;
+
+	if (WARN_ON(!PAGE_ALIGNED(phys_addr | size)))
+		return -EINVAL;
+
+	host_lock_component();
+	if (!range_is_memory(phys_addr, phys_addr + size))
+		goto out_ret;
+	/*
+	 * We end up here after the caller successfully unmapped the page from
+	 * the IOMMU table. Which means that a ref is held, the page is shared
+	 * in the host s2, there can be no failure.
+	 */
+	for (i = 0; i < nr_pages; i++)
+		__pkvm_host_unuse_dma_page(phys_addr + i * PAGE_SIZE);
+
+out_ret:
+	host_unlock_component();
+	return 0;
+}
+
 int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
 			    enum kvm_pgtable_prot prot)
 {
-- 
2.47.0.338.g60cca15819-goog


