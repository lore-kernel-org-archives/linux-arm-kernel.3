Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5E8F53D82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tHQqMyuuFlwpT2UE52Jtk7JCykj8I76gbQARj/JlEmo=; b=BMUGHCfT3dwIzChuZZXESJO+NH
	yb8ClwLhfboD/yuUwWKmbSFhUhrHry3hBLKtydzJAu8RMTdQHWMbjcRm11eyiCr7zFztWWzUsmG+0
	nnKz4HWjMYVFNP2M97pMcuEP556DDZVVeD4b0EkZwyXX7w339FjNZmG/LN2e3kPR5YUTFVV120lKj
	ULOgNoVDE3RQkE33kUwI5FWaaC88JPhORD5DodiFlNFNQcSfKA+XBQxxIWZfH9mWYKsy/yEULKB0N
	6ZEaT0Ttgg+4eaU3pYpYPxBHJbyPF033el0ApnvRhggzW0nlmPG44rNYrTwbi9dlqkfEKB7px4qOV
	xa+4Wt8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bqs-00000004ZoX-1rwF;
	Mon, 16 Mar 2026 17:35:38 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bqp-00000004Zml-1Lnh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:35:36 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-660af6dee06so4527731a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 10:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773682533; x=1774287333; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tHQqMyuuFlwpT2UE52Jtk7JCykj8I76gbQARj/JlEmo=;
        b=MzJh+qD+24qb8VGCRs6MWFbSdGz5vsihFm1FIElM+1Y3nvQyblBpRjSb8jN4Gt4WwU
         gbtkiAqCtnMij1KE2R914WT7xp0JLNhZPRKvcSiJV+oIi2t6lzFceQhd/s8ElJHDF7aV
         6g6rEezXSK7a411iSJiZxScLaVbHFLos+9xxS4QFRzd8V4HhJ5SpyZS9GeiZaV6/UMZ9
         VvzgZXJuB8kejVc2qgpasc5i/5iVJzXfDpzPHYRLbicEOnNsUgUdNGdwT/dXgXqGYzZF
         071C7t3AcQ7lIWjYUdCSSsrBF9Mq80JYhu0B8Pd4/Txgj9wsaP4WEVAsTE/hs3J7Rj9f
         mwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773682533; x=1774287333;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tHQqMyuuFlwpT2UE52Jtk7JCykj8I76gbQARj/JlEmo=;
        b=UeFOrolRUk3/0ZwJ6Nl6M65c5vLF91s73HmgMSRuJ4Egqk0+UFRlegklgNyzFcUw+k
         OzpShoUDVAUIoQe3l3LUC05EIh9S5InT69dlfJNfBodXZGv+CPoFMzgOirspcscYP0MJ
         cfe7Mdk7r3nixj8LVWV5EM86qHWoXqD9QfwJz+gSNpbhaVz4bGYxEbNlwMLgJTpO1iNW
         GP6QYbLHuceuBVR9J4rIse+zWqLhjJagf6NKXkKDcuvOBFldg666Fz8Ma7EM8klCmbbT
         ZS82/+ZQEOqWavQoQE7yZdj/vhAXUJvIgA3nxDJdIz68ex6FqCIJQxW9rH+4DXSivV3l
         c7Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWDJzmJDW+IcMdQaY8bNS6XAQAU/GWL2ehxaXqezMBrnhepX6PGp2fvN48HNc+mBiO62y7zojeKT/ZlpvyRCYdP@lists.infradead.org
X-Gm-Message-State: AOJu0YxBI9f/0Ulli3GHRtr4jF2AJyJr4md8SQKKorutbmkaOeNVBvzo
	TBce09hoZ8FAZ6eA7MB6Yzyc+FdT0ynealw4pYuR35cObr9gHrkr3QTPHKE4hSdeEDNLzmyWB/H
	3Xg==
X-Received: from edra16.prod.google.com ([2002:aa7:d910:0:b0:661:d31:27ba])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:13d5:b0:666:d8bb:85ec
 with SMTP id 4fb4d7f45d1cf-666d8bb8808mr1653788a12.0.1773682532416; Mon, 16
 Mar 2026 10:35:32 -0700 (PDT)
Date: Mon, 16 Mar 2026 17:35:25 +0000
In-Reply-To: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
Mime-Version: 1.0
References: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260316-tabba-el2_guard-v1-4-456875a2c6db@google.com>
Subject: [PATCH 04/10] KVM: arm64: Use guard(hyp_spinlock) in mm.c
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <linux-arm-kernel@lists.infradead.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <kvmarm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Cc: Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_103535_384251_9EDB2B07 
X-CRM114-Status: GOOD (  10.53  )
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

Migrate manual hyp_spin_lock() and hyp_spin_unlock() calls managing
pkvm_pgd_lock to use the guard(hyp_spinlock) macro.

This eliminates manual unlock calls on return paths and simplifies
error handling by replacing goto labels with direct returns.
Note: hyp_fixblock_lock spans across hyp_fixblock_map/unmap functions,
so it retains explicit lock/unlock semantics to avoid RAII violations.

Change-Id: I6bb3f4105e95480269e5bf8289d084c8f9981730
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mm.c | 37 ++++++++++---------------------------
 1 file changed, 10 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index 218976287d3f..7a15c9fc15e5 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -35,13 +35,8 @@ static DEFINE_PER_CPU(struct hyp_fixmap_slot, fixmap_slots);
 static int __pkvm_create_mappings(unsigned long start, unsigned long size,
 				  unsigned long phys, enum kvm_pgtable_prot prot)
 {
-	int err;
-
-	hyp_spin_lock(&pkvm_pgd_lock);
-	err = kvm_pgtable_hyp_map(&pkvm_pgtable, start, size, phys, prot);
-	hyp_spin_unlock(&pkvm_pgd_lock);
-
-	return err;
+	guard(hyp_spinlock)(&pkvm_pgd_lock);
+	return kvm_pgtable_hyp_map(&pkvm_pgtable, start, size, phys, prot);
 }
 
 static int __pkvm_alloc_private_va_range(unsigned long start, size_t size)
@@ -80,10 +75,9 @@ int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr)
 	unsigned long addr;
 	int ret;
 
-	hyp_spin_lock(&pkvm_pgd_lock);
+	guard(hyp_spinlock)(&pkvm_pgd_lock);
 	addr = __io_map_base;
 	ret = __pkvm_alloc_private_va_range(addr, size);
-	hyp_spin_unlock(&pkvm_pgd_lock);
 
 	*haddr = addr;
 
@@ -137,13 +131,8 @@ int pkvm_create_mappings_locked(void *from, void *to, enum kvm_pgtable_prot prot
 
 int pkvm_create_mappings(void *from, void *to, enum kvm_pgtable_prot prot)
 {
-	int ret;
-
-	hyp_spin_lock(&pkvm_pgd_lock);
-	ret = pkvm_create_mappings_locked(from, to, prot);
-	hyp_spin_unlock(&pkvm_pgd_lock);
-
-	return ret;
+	guard(hyp_spinlock)(&pkvm_pgd_lock);
+	return pkvm_create_mappings_locked(from, to, prot);
 }
 
 int hyp_back_vmemmap(phys_addr_t back)
@@ -340,22 +329,17 @@ static int create_fixblock(void)
 	if (i >= hyp_memblock_nr)
 		return -EINVAL;
 
-	hyp_spin_lock(&pkvm_pgd_lock);
+	guard(hyp_spinlock)(&pkvm_pgd_lock);
 	addr = ALIGN(__io_map_base, PMD_SIZE);
 	ret = __pkvm_alloc_private_va_range(addr, PMD_SIZE);
 	if (ret)
-		goto unlock;
+		return ret;
 
 	ret = kvm_pgtable_hyp_map(&pkvm_pgtable, addr, PMD_SIZE, phys, PAGE_HYP);
 	if (ret)
-		goto unlock;
+		return ret;
 
-	ret = kvm_pgtable_walk(&pkvm_pgtable, addr, PMD_SIZE, &walker);
-
-unlock:
-	hyp_spin_unlock(&pkvm_pgd_lock);
-
-	return ret;
+	return kvm_pgtable_walk(&pkvm_pgtable, addr, PMD_SIZE, &walker);
 #else
 	return 0;
 #endif
@@ -437,7 +421,7 @@ int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr)
 	size_t size;
 	int ret;
 
-	hyp_spin_lock(&pkvm_pgd_lock);
+	guard(hyp_spinlock)(&pkvm_pgd_lock);
 
 	prev_base = __io_map_base;
 	/*
@@ -463,7 +447,6 @@ int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr)
 		if (ret)
 			__io_map_base = prev_base;
 	}
-	hyp_spin_unlock(&pkvm_pgd_lock);
 
 	*haddr = addr + size;
 

-- 
2.53.0.851.ga537e3e6e9-goog


