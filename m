Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25F0C4450E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 15:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j8UdcPrCWpOwvzYn0GBOE+Kb77J6h4WrSrgHpYB821s=; b=C599EWIJLqKQyUTUQe87O5x15i
	es+qwJrOfY9KHsn2u5/9huO2x+eSVf7p9ni3HOI0HRkI0dkOey++DNkgt4OOaIKRXVJu7hGiGWDmZ
	CqyAoBuerFYUUSrgzU+oTuxRskpvG3/DbJqTDIOGBYaLf3ysXka21zxO5rz8vcO0+N4XoxSFQhJsq
	zYkro6CNdwpKGXx0igbXEcXr0CYbKWrpCmNZpmRnNIVQ+utbjEUQjpRP+/xQVNS6wSpBoZ5AnAtKz
	nUngaqWpck296kl7l7r6BIdZMDZkybeCGH7OY07O8c2NvHDr08E0KcY0oCzJFbAsfOHGOjhyjr1qO
	/tmQwg5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk178-0000000FEtj-1Arr;
	Wed, 15 Jul 2026 15:01:34 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk176-0000000FEt1-27F9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 15:01:33 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-4629f312a67so4640222f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 08:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784127690; x=1784732490; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j8UdcPrCWpOwvzYn0GBOE+Kb77J6h4WrSrgHpYB821s=;
        b=lZteae96AMnyL+vquMCwSoX5Ljep0RGzUXt6pLSthj4hvoOAzuCC1lZKeYQemmOJ+g
         AzWpDEjzIEiOQyyNDKY8W3jww9Z2zs3/YZ2qYNX1RnR2TT0e7JGw9Wv1oXd9wh3cs+fB
         DezJ6sapfBAxzSMIVFmjCrg5ASh4khtpI2MVMVyQYe0WKMyHTEYeUo/cPONNO9vHbx1K
         BJJamDtayUN54wtIM0jHEZcULrfm957yIwiGYH+v2brpcR5GNaUR+2b15hyVYkRnCk+3
         Q4acak7SAZB8O+lk0ect2agAmxuzUaG4yvF1pvEDZNO4fhkxBDrxW4vvG/NypKwimch9
         x8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784127690; x=1784732490;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8UdcPrCWpOwvzYn0GBOE+Kb77J6h4WrSrgHpYB821s=;
        b=bJyKss+83xq+IqrVQXGnQVeFXVhcqEgzm9XMmxFgd621nUL3CvcJj0XrRpO0JFSINu
         BxyCRrhU784fc+Cx+TId6gSdinLB7+B0+vzhJ9erp1cU1EKNP743DvpCoy2pAai94Dtp
         UDzOlJ1bBOlpT5Ty83dqfRLYWj9FPOI3Dx//OegsqWioTB57j11CyoGmWGO9ZNXyyhbH
         cptVK23UAhjf7dzujCcQ7odhRl53KHxILlQbwI2uLf6qYyQPeRMQICJMexqW+UDrKBoA
         da0hwCOoWT7qW++lRa8TlfzAvrGDMvjBRmH6RHNeOMATlEqHtYrT1zMRn2cY8FtDn98+
         iZyA==
X-Forwarded-Encrypted: i=1; AHgh+Ro49GDT3iRs8mz9oAjjaV3j+wwde6CjJRO26hsNyw8lYVLY2OPGMkUOShmHz8cqEidUHIo62oq+v5dOeT16WXEw@lists.infradead.org
X-Gm-Message-State: AOJu0YzgdcoD750NzEFls5le7iaWo/RyTXsc+zt9GL3XGmB2eBRudVqI
	A9bT9OYzkom6mRKoxOnddR7DYPbBJTxf/KEFNzFpaEx6+1+8fa4V4RbtobKFfvojnu0PvFrji/m
	9XWohgOY7A3sYGA==
X-Received: from wrwq6.prod.google.com ([2002:a5d:5746:0:b0:47a:6462:7fbe])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2c0a:b0:474:4525:eb55 with SMTP id ffacd0b85a97d-47f4fd1fc60mr3529438f8f.47.1784127689429;
 Wed, 15 Jul 2026 08:01:29 -0700 (PDT)
Date: Wed, 15 Jul 2026 15:01:25 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <20260715150125.2798116-1-smostafa@google.com>
Subject: [PATCH] KVM: arm64: Use consistent type for pool size
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_080132_566654_6144E42B 
X-CRM114-Status: GOOD (  15.47  )
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

All the pool sizes in the hypervisor are "unsigned long" but when
they get passed to hyp_early_alloc_contig() or hyp_pool_init() they get
truncated to 32-bits.

That is not a big problem at the moment as to overflow this we need
4G bytes of carveout (2 TB of host or guest system memory).

However when new users are added (as IOMMU) it is hard to reason
about the carveout size anymore.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
For example in the SMMUv3 to avoid this overflow, I add a cap
for the pools size to UINT_MAX to work around this:
https://lore.kernel.org/linux-iommu/20260715115906.2664882-9-smostafa@google.com/
---
 arch/arm64/kvm/hyp/include/nvhe/early_alloc.h | 2 +-
 arch/arm64/kvm/hyp/include/nvhe/gfp.h         | 4 ++--
 arch/arm64/kvm/hyp/nvhe/early_alloc.c         | 2 +-
 arch/arm64/kvm/hyp/nvhe/page_alloc.c          | 6 +++---
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/early_alloc.h b/arch/arm64/kvm/hyp/include/nvhe/early_alloc.h
index dc61aaa56f31..462883c4e325 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/early_alloc.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/early_alloc.h
@@ -7,7 +7,7 @@
 void hyp_early_alloc_init(void *virt, unsigned long size);
 unsigned long hyp_early_alloc_nr_used_pages(void);
 void *hyp_early_alloc_page(void *arg);
-void *hyp_early_alloc_contig(unsigned int nr_pages);
+void *hyp_early_alloc_contig(unsigned long nr_pages);
 
 extern struct kvm_pgtable_mm_ops hyp_early_alloc_mm_ops;
 
diff --git a/arch/arm64/kvm/hyp/include/nvhe/gfp.h b/arch/arm64/kvm/hyp/include/nvhe/gfp.h
index 3766333bace9..3a428dc40b14 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/gfp.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/gfp.h
@@ -29,6 +29,6 @@ void hyp_get_page(struct hyp_pool *pool, void *addr);
 void hyp_put_page(struct hyp_pool *pool, void *addr);
 
 /* Used pages cannot be freed */
-int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned int nr_pages,
-		  unsigned int reserved_pages);
+int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned long nr_pages,
+		  unsigned long reserved_pages);
 #endif /* __KVM_HYP_GFP_H */
diff --git a/arch/arm64/kvm/hyp/nvhe/early_alloc.c b/arch/arm64/kvm/hyp/nvhe/early_alloc.c
index 00de04153cc6..9fef0c7d2185 100644
--- a/arch/arm64/kvm/hyp/nvhe/early_alloc.c
+++ b/arch/arm64/kvm/hyp/nvhe/early_alloc.c
@@ -21,7 +21,7 @@ unsigned long hyp_early_alloc_nr_used_pages(void)
 	return (cur - base) >> PAGE_SHIFT;
 }
 
-void *hyp_early_alloc_contig(unsigned int nr_pages)
+void *hyp_early_alloc_contig(unsigned long nr_pages)
 {
 	unsigned long size = (nr_pages << PAGE_SHIFT);
 	void *ret = (void *)cur;
diff --git a/arch/arm64/kvm/hyp/nvhe/page_alloc.c b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
index 57f86aa0f82f..51460d420c94 100644
--- a/arch/arm64/kvm/hyp/nvhe/page_alloc.c
+++ b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
@@ -229,12 +229,12 @@ void *hyp_alloc_pages(struct hyp_pool *pool, u8 order)
 	return hyp_page_to_virt(p);
 }
 
-int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned int nr_pages,
-		  unsigned int reserved_pages)
+int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned long nr_pages,
+		  unsigned long reserved_pages)
 {
 	phys_addr_t phys = hyp_pfn_to_phys(pfn);
 	struct hyp_page *p;
-	int i;
+	unsigned long i;
 
 	hyp_spin_lock_init(&pool->lock);
 	pool->max_order = min(MAX_PAGE_ORDER,
-- 
2.55.0.141.g00534a21ce-goog


