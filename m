Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737C8E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=031HktvOH2BGPB/61CKgeoO+FWayRh3FpkimFP0IrdM=; b=Ex7Uv5ZgkD5u8GkPXguo9an5YF
	Sh+pbRpfInGakY9PsFSl9sFHMpQY+fj1EbHprudBDzc0uKUFEWbLDzNmkOnaQwR6ppN7wCMBgHYNx
	0d5s5pyiPVpOGsIbNXFfg/gKvE6CAftZUxiIygrPjxbfiTCuzJndKu0/kxbcEEJYqbiBIWhG9D//S
	56S4Rq8k3Qy2i+ywJjDPEiAwx31jWVswnwJAecpTxFaOhcN34E3wKvRd7pGD011NHIqOi0dTbJI3B
	KNFRdHIjvUlT9kffbFqYNs2Ie4ezjwlWgbe60BRs0sO0qUm+nDoteAeU374bbAxNc6ICWFztBmHGi
	guNUWGTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLoLj-00000001Wa2-2GzN;
	Thu, 12 Dec 2024 18:55:47 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZt-00000001K4t-3pHR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:06:22 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43623bf2a83so8403585e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026780; x=1734631580; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=031HktvOH2BGPB/61CKgeoO+FWayRh3FpkimFP0IrdM=;
        b=Gwr1l8754kdY0FHV2gwtqUiAnb6mKc+hAMDffu45FgNMd7DAdcYUmKZMZ0SbnSz5Rl
         ReWCuvc746LZW5sMCRJ17MA/m4/yTSH2bI6B40wltIJhKcSP/0AGoXmvjT76MRb2xlT9
         HfBXwKO2L/QtR9/wHaVnmFg+MT9Ri9YgVy4K1MhRLWzxw6zj/H8TqSijxSDW2gZJXs/X
         NXFefjbcv6wB9owEMTrhWBt58Zqo/+KB6iiUGKrP3eMhaBGOeijPbSX9XbIy64tlmQcZ
         wmLo7MGhmGmtCmWjSn2Nq0DHz+gLNkqEEYwGgiHMlhVTKbybHvg/VLDUSCoomSleQltj
         REDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026780; x=1734631580;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=031HktvOH2BGPB/61CKgeoO+FWayRh3FpkimFP0IrdM=;
        b=IuhMXT6LBtiF1XaIS9GG15anz+CabtKIemsh3WMm+UTZR0g0pWG9d95HxqZomOB7Dc
         v9cPausJEBSLBEnURVAPEA1s5e5w7xxUIJcysJXV91kvOzvwDyl/1/2cGyNIcjav3kZ3
         BF1jP1tWKOgd1GJoKbK92/4vCcy4NJzMfCXGdAmqUxPGbX8PN/vVtTQ6nKq7AEk1Ppz5
         ebMNwsNXdW5BhpXbBKcSH9BuRfYFOMuvFpvpzSA5LhknUbctxPo/KL3sY0wWgTbZDzBI
         i0ZTDOkQH3H0w6b7PICH41eZh2KOR39Brtkz7PSjmAM0mB5yl+HMbQdOzCQnJRD/PFif
         up+g==
X-Forwarded-Encrypted: i=1; AJvYcCXuej/YsFgBZmH+b/p53ax2dvCbAnKdk6FuOZQ3CKn7DZMF5KKZcArEfC2wxE0Q2PFsGjKkAnCQF3/tNyIuOfzA@lists.infradead.org
X-Gm-Message-State: AOJu0YzheCYfFMQxydPBXn4X5tujnYdUrnA4MSECeEtgrW/RIUeSpNH+
	Gt3t0GZQkxaMJHddTBfWW+4SiVB0OK4Pljv71rjfhRLsZgtsXeCZYeEEdsChXtgJKezlJmX0BB+
	F1YeXYndqlw==
X-Google-Smtp-Source: AGHT+IHfy5GSFaMJOYpvz35FVWeSJ2xaUjg6ph5uDhYTSNl0fSLoTlqEzHaAu45qIKjF2hF1Km0UhuK02XOy2w==
X-Received: from wmmr4.prod.google.com ([2002:a05:600c:4244:b0:436:1796:9989])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:83cf:b0:434:f7e3:bfa0 with SMTP id 5b1f17b1804b1-4361c3e351fmr61389525e9.21.1734026780064;
 Thu, 12 Dec 2024 10:06:20 -0800 (PST)
Date: Thu, 12 Dec 2024 18:04:10 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-47-smostafa@google.com>
Subject: [RFC PATCH v2 46/58] KVM: arm64: Add function to topup generic allocator
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
X-CRM114-CacheID: sfid-20241212_100621_950588_3DCAFDAB 
X-CRM114-Status: GOOD (  14.20  )
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

Soon, IOMMU driver might need to topup the IOMMU pool from map_pages
IOMMU operation, which has a gfp flag is it might be called from
atomic context, add a function to topup an allocator with an ID
that also accepts gfp flags.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/include/asm/kvm_host.h |  4 ++++
 arch/arm64/kvm/mmu.c              | 20 ++++++++++++++++++++
 arch/arm64/kvm/pkvm.c             | 20 ++++++++++++++++++++
 3 files changed, 44 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index a3b5d8dd8995..59a23828bd0e 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -155,6 +155,8 @@ static inline void __free_hyp_memcache(struct kvm_hyp_memcache *mc,
 
 void free_hyp_memcache(struct kvm_hyp_memcache *mc);
 int topup_hyp_memcache(struct kvm_hyp_memcache *mc, unsigned long min_pages, unsigned long order);
+int topup_hyp_memcache_gfp(struct kvm_hyp_memcache *mc, unsigned long min_pages,
+			   unsigned long order, gfp_t gfp);
 
 static inline void init_hyp_memcache(struct kvm_hyp_memcache *mc)
 {
@@ -1628,6 +1630,8 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
 #define HYP_ALLOC_MGT_IOMMU_ID		1
 
 unsigned long __pkvm_reclaim_hyp_alloc_mgt(unsigned long nr_pages);
+int __pkvm_topup_hyp_alloc_mgt_gfp(unsigned long id, unsigned long nr_pages,
+				   unsigned long sz_alloc, gfp_t gfp);
 
 struct kvm_iommu_driver {
 	int (*init_driver)(void);
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index ef7e8c156afb..229338877c59 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1225,6 +1225,11 @@ static void *hyp_mc_alloc_fn(void *flags, unsigned long order)
 	return addr;
 }
 
+static void *hyp_mc_alloc_gfp_fn(void *flags, unsigned long order)
+{
+	return (void *)__get_free_pages(*(gfp_t *)flags, order);
+}
+
 void free_hyp_memcache(struct kvm_hyp_memcache *mc)
 {
 	unsigned long flags = mc->flags;
@@ -1249,6 +1254,21 @@ int topup_hyp_memcache(struct kvm_hyp_memcache *mc, unsigned long min_pages,
 				    kvm_host_pa, (void *)flags, order);
 }
 
+int topup_hyp_memcache_gfp(struct kvm_hyp_memcache *mc, unsigned long min_pages,
+			   unsigned long order, gfp_t gfp)
+{
+	void *flags = &gfp;
+
+	if (!is_protected_kvm_enabled())
+		return 0;
+
+	if (order > PAGE_SHIFT)
+		return -E2BIG;
+
+	return __topup_hyp_memcache(mc, min_pages, hyp_mc_alloc_gfp_fn,
+				    kvm_host_pa, flags, order);
+}
+
 /**
  * kvm_phys_addr_ioremap - map a device range to guest IPA
  *
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index e6df35aae840..0c45acbbff6e 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -1114,3 +1114,23 @@ unsigned long __pkvm_reclaim_hyp_alloc_mgt(unsigned long nr_pages)
 
 	return reclaimed;
 }
+
+int __pkvm_topup_hyp_alloc_mgt_gfp(unsigned long id, unsigned long nr_pages,
+				   unsigned long sz_alloc, gfp_t gfp)
+{
+	struct kvm_hyp_memcache mc;
+	int ret;
+
+	init_hyp_memcache(&mc);
+
+	ret = topup_hyp_memcache_gfp(&mc, nr_pages, get_order(sz_alloc), gfp);
+	if (ret)
+		return ret;
+
+	ret = kvm_call_hyp_nvhe(__pkvm_hyp_alloc_mgt_refill, id,
+				mc.head, mc.nr_pages);
+	if (ret)
+		free_hyp_memcache(&mc);
+
+	return ret;
+}
-- 
2.47.0.338.g60cca15819-goog


