Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A227C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 18:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8PDm8oG4+65SlSCHXlAGQHcFz/7pVlJ6WK47/KCblA=; b=RdGJzw4gzEDxLys59IXotxLpc6
	cODpv6Z+HHINkImUCQ0FFmxsJxCF1up3AABLVYlmgjSemIX8uNXvNyfRARCwBOg/MH0MHad7K5OJZ
	z98E3ADDQwh4BJ+cxPQ88ddfCSVokyn7EKmekjUHzMcVZUHtegLp/ZukM6z4oyXZrVTqkE2tl+r8Z
	A08H210136WOIsiVTBS7Tsq1jWrGvKGnKDSFhiIfyL9uO3lekB+BF6MyFD1DG8jjggFtD+SN4Cgh8
	YvzI7oKZ9wCwkJvMAenuLPuhR8VsM6fWata41kSyZOID7ghjiUzki6VcOYOEU6agQz8OJ0UBCOdTv
	kWgx+wdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnWW-0000000DFZt-24en;
	Mon, 06 Jul 2026 17:54:28 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnWT-0000000DFYA-2oyF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:54:27 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-47132f8a98aso1974057f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783360463; x=1783965263; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t8PDm8oG4+65SlSCHXlAGQHcFz/7pVlJ6WK47/KCblA=;
        b=ASvkU+V0ivSxGzt1cZ9NpCiMG0hwExZ2Ktxlmo57kmjvofh81CLvdbdpQn8N1wslMH
         dJCCsdMPXV3ShlO42xZMU2ZX9jwuEVnvhq99EH58+V04z2oh7CV8URS5J2wq1REQk7ih
         xxrXcn6PqmVn+Jnk6SvOLUi/ALu6nrrDideOAKckFfxJ4b0tsbFSR/wzAGj7yXd2uTKw
         Km85uPeQngeL1Poe6ZCYOl4HGlx2tsgqwSpcZvXsJJPl61nDppL3JGkh97usX6Ds1H74
         y2COOTt8alzF6O1KCMl7nHH9Gqt4WQSdbLAIduqGt8VIG3aWXeUCfnp6M7n9YSFfLisN
         5arQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360463; x=1783965263;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t8PDm8oG4+65SlSCHXlAGQHcFz/7pVlJ6WK47/KCblA=;
        b=B3zlhpoiRfjEHRp+VkqrKdodF36xNPOexJDUydqJcNGxyFLxrZJ4BGH9G9/fnBLr0G
         f3ylctc0cGhwSiGwkr4sF2OwR5+i2MTyWVBmhvo54ZSpt9Wj4sUO567f5seRrRFRbaR1
         L0eljIySIizrqVu4hyDfWIPwT4TdYc0mpcYTvtrVHNYWqGJ32LiGypu9d3xy4UDWfkfT
         D7ZqJAmlBy/1HZLYUgt3Ly5CxrEYJJ8a+kEocI+PIes23gbYLOO2zkR64ktrX40QGzSU
         vkUfcIwYQrB/mFr8GSB20lduSDRWMXca2Bno99ctnoELLAZc7r+lVgKi65lneQVa46cK
         VAoQ==
X-Gm-Message-State: AOJu0YyaNiomQLJR+41rA5RUJxXLnXxJh/mWbhIN+6sEmCa4RRsworLt
	x58GT+9o176G0adh24fIn8kvQOV3MgiiTxqnrj49TNHC6x8YhKsG35KrFR8UCMp4zYAUcn7bxz9
	7XVdkVae9qzVtmbeTRqApow==
X-Received: from wrsb12.prod.google.com ([2002:a5d:45cc:0:b0:473:1fcb:48a8])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e4f:b0:490:b189:212d with SMTP id 5b1f17b1804b1-493df09a140mr16985925e9.33.1783360463046;
 Mon, 06 Jul 2026 10:54:23 -0700 (PDT)
Date: Mon,  6 Jul 2026 18:53:58 +0100
In-Reply-To: <20260706175415.2604046-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260706175415.2604046-2-vdonnefort@google.com>
Subject: [PATCH v2 01/18] KVM: arm64: Add __pkvm_private_range_pa
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_105425_716551_FA73C4E0 
X-CRM114-Status: UNSURE (   8.37  )
X-CRM114-Notice: Please train this message.
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

Mappings in the pKVM private range are not identity mapped, making the
standard __hyp_pa() unsuitable for translating these addresses.

Introduce __pkvm_private_range_pa() to resolve physical addresses for
this range by walking the hypervisor page-table. This will be useful for
the upcoming pKVM heap allocator.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/include/nvhe/mm.h
index 6e83ce35c2f2..d3137c16b632 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mm.h
@@ -30,5 +30,6 @@ int __pkvm_create_private_mapping(phys_addr_t phys, size_t size,
 				  unsigned long *haddr);
 int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr);
 int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr);
+phys_addr_t __pkvm_private_range_pa(void *va);
 
 #endif /* __KVM_HYP_MM_H */
diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index 3b0bee496bff..773426a68d2d 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -502,3 +502,17 @@ int refill_memcache(struct kvm_hyp_memcache *mc, unsigned long min_pages,
 
 	return ret;
 }
+
+phys_addr_t __pkvm_private_range_pa(void *va)
+{
+	kvm_pte_t pte = 0;
+	s8 level;
+
+	hyp_spin_lock(&pkvm_pgd_lock);
+	WARN_ON(kvm_pgtable_get_leaf(&pkvm_pgtable, (u64)va, &pte, &level));
+	hyp_spin_unlock(&pkvm_pgd_lock);
+
+	WARN_ON(!kvm_pte_valid(pte));
+
+	return kvm_pte_to_phys(pte) + offset_in_page(va);
+}
-- 
2.55.0.rc2.803.g1fd1e6609c-goog


