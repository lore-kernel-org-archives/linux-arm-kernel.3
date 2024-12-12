Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AD2E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/Ra//4VkvS4Qrc/csXRRquQ5N0sclWFpXtLU13M1U0=; b=W1QaBGE3vvZ89HzkKe2qsldeWn
	ofRmETi5QmRHDT3Vdj5/NjBOmC04hZ61FxMx5TarZgHdwpNWFpuIwIE2fAOWe9ApUlfN3iiQwKTPe
	8H/fERkEhBl722qDXVXoY8pOht/PmpahqbDY453kA+H5Yh1DLenhKbqxntSOdAqnzgm0l7AUtgDOl
	9XAggmQwnY7vBAigBtYzS41NAZd3FOwg94NIEIWHKazHC+dxyRiuncS7/zydhweHJjoCUUKy+ZaI2
	hKw8HcPSzAleInHQVzjpUI1MNx5L5r89HP3X2GHhOhMPYqzs4kHcD+aR2OCqe+trB+X+w9jE8BYIh
	BA2nwljA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnvZ-00000001QGQ-49cq;
	Thu, 12 Dec 2024 18:28:45 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZ3-00000001Jk0-0GKQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:05:30 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4361eb83f46so8308645e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026727; x=1734631527; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=c/Ra//4VkvS4Qrc/csXRRquQ5N0sclWFpXtLU13M1U0=;
        b=GZJjOy8d+lq0+jo81Hmh0iUVwH0VkT/U+n5Rpn5bfOqTLgAOt+oHv3F/0xyRYp7C9X
         zEsAFAZ522TQNuqYYZD+P81XGOFk9eLyGKbkygBt8DDz26COnYmznLqp07eOaRjFQC2z
         hucihHPBZrS8syd+Ftz2mP70GP0LKXxFyOkPOb865VcNUxj714i3YEdO/py5QKDLfPw+
         rVIw+HP33ni2DvaErZbTVPQy/tiUkZ+wQMYC8/L5sREI+XPTXKVMrG0cbFrWEa9o8n4x
         fYu87TtJsOVvjdwisNXgHTpftndrTVZ81UfxQjjK/Z7Gs4PQNqVz+IVP3pU7c9/1wD3Q
         syCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026727; x=1734631527;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c/Ra//4VkvS4Qrc/csXRRquQ5N0sclWFpXtLU13M1U0=;
        b=NN5HCcDxMOMxR2PEfgrkgysCwZqAjX5Oa7STMj6Z8QZMipYIbDf9nGWX/u3tjXY0+8
         HnX5GBhvdsrdsyvR3xaSg1lJkST/+QsVsbGGpj8jdyFTPtXqqEZTq7WegVu0gqRptEpw
         B4WwJjM7pCrxBH1zzL6ci7tFTpWUTKMxQF2nGlnbqu0cLRpS7xq3pbjGr9hUKupBFf19
         bIEIYNZpms4nBjmiYf6nSdOBpRIFz1SWkWHmFRtumhMGig20ecQzp78SaeScFBIHNNfi
         odV/flloF0oc2WGaNNkpwG3QhQMAGi3mHiwUBr8hlafcSSHqHpDxNWTV46V90KvHx/fG
         CJAg==
X-Forwarded-Encrypted: i=1; AJvYcCWviZFvwEmZIGq7cCvUTXF/ptUujR4u60P8rqdvWJIRTYoFDSkz4wo+lELsu4OlBmbbtybOdKYnkiNnjMcAJoiJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwzIKy6cAdu14vU/5+RCFJF5OWYgpTvOAX+GmsyB3/xHVru1b7r
	n9lZq5qmkYT0qUyAhT+5Eg6uq648axA9pl6qVqTBIF8eM4nRBJdnSV22TJa45jFxyGf7gi5Ejp+
	GnXz6JLBeDQ==
X-Google-Smtp-Source: AGHT+IFrLa5teCkiJUmugRTGmiVyWcF7Bk2iiIesqhTlDV4Jk+wP67mU9JHmnXeWzq6SoD15OWfRPDjTEIR09g==
X-Received: from wmik26.prod.google.com ([2002:a7b:c41a:0:b0:434:f801:bf67])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4446:b0:434:fa73:a907 with SMTP id 5b1f17b1804b1-4361c3723acmr67363395e9.13.1734026727341;
 Thu, 12 Dec 2024 10:05:27 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:45 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-22-smostafa@google.com>
Subject: [RFC PATCH v2 21/58] KVM: arm64: pkvm: Add __pkvm_host_add_remove_page()
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
X-CRM114-CacheID: sfid-20241212_100529_098800_09DD228C 
X-CRM114-Status: GOOD (  11.50  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Add a small helper to remove and add back a page from the host stage-2.
This will be used to temporarily unmap a piece of shared sram (device
memory) from the host while we handle a SCMI request, preventing the
host from modifying the request after it is verified.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index d75e64e59596..c8f49b335093 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -94,6 +94,7 @@ int __pkvm_guest_relinquish_to_host(struct pkvm_hyp_vcpu *vcpu,
 				    u64 ipa, u64 *ppa);
 int __pkvm_host_use_dma(u64 phys_addr, size_t size);
 int __pkvm_host_unuse_dma(u64 phys_addr, size_t size);
+int __pkvm_host_add_remove_page(u64 pfn, bool remove);
 
 bool addr_is_memory(phys_addr_t phys);
 int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 0840af20c366..a428ad9ca871 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -2521,3 +2521,20 @@ int host_stage2_get_leaf(phys_addr_t phys, kvm_pte_t *ptep, s8 *level)
 
 	return ret;
 }
+
+/*
+ * Temporarily unmap a page from the host stage-2, if @remove is true, or put it
+ * back. After restoring the ownership to host, the page will be lazy-mapped.
+ */
+int __pkvm_host_add_remove_page(u64 pfn, bool remove)
+{
+	int ret;
+	u64 host_addr = hyp_pfn_to_phys(pfn);
+	u8 owner = remove ? PKVM_ID_HYP : PKVM_ID_HOST;
+
+	host_lock_component();
+	ret = host_stage2_set_owner_locked(host_addr, PAGE_SIZE, owner);
+	host_unlock_component();
+
+	return ret;
+}
-- 
2.47.0.338.g60cca15819-goog


