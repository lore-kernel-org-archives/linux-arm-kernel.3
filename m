Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5B8C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 11:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fp6lx89NDYaCWj8yztXIUiroS+BazPKE4hbafizh3a4=; b=H6tQWBN+16uZXLFmfx/hcwfy2o
	WMKenl2uKKgydKsj8KqBj52v6ntCs9hiif3k6s6VPJ3B6iOBWkYPGVxMDmaCjXpbI2Y+JryQLIn3p
	Qq1FMvxX6OrMwqISOLrDje8UuwWRC489l8kcSEiFRvy2nf6vRs+PFiXLP9wCk6UgJHxyieuBDGtJx
	djMMOfoU8iFQudOxfXN57F1u8WcVsuzVi6lIfPn7Dfm1kY2wF4EyiRWh2b1t4qeFu49Kz/QdkLODR
	NuvF9Npxoi5F2EfyQy767hR5JfvMiIZpvbcIHwab0jCZBN+YUA4u+mtTwmwQCDz7WpbcUWiXcMkQ0
	V92Rxifw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsh2K-0000000B6IX-3KxR;
	Thu, 13 Mar 2025 11:47:40 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgvo-0000000B4R9-2hEF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 11:40:57 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3913aaf1e32so556187f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 04:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741866054; x=1742470854; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fp6lx89NDYaCWj8yztXIUiroS+BazPKE4hbafizh3a4=;
        b=n0IVg+BaU5MG8IpfbwLhXfGfM66OZTHips6B8x9tqAUhEpLOdD4R+08hyFQp2n/Dr4
         OGmCiOgTQX9y6COM0sUD5fPrizYcisZsD0BPpY5/jdlkowbGxguGzeue1VJYaabk1MNY
         nVFAOrOFwbX4xMZs4kbVKWr3E8krhLDEOp9iTk1TUWeV8Zmq84cH3255aagvQ40zwXGH
         v6lJF7Y9HbfB9dD2IoFsoAFumer4IdXTaOGTzGFtoDf4Ke/og+vKdanE+4S+uPVCFHRK
         nqus831BjRm8Y9ttpac1+NS83gIEfhVvSlZmYBzEQOY7T80gN/3Cg2fNLU1See2Lj0Fk
         adkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866054; x=1742470854;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fp6lx89NDYaCWj8yztXIUiroS+BazPKE4hbafizh3a4=;
        b=LMyyTTPLm5tVTfH3TbcMkhFYc7awMK8qhGXyk6JhPSAk8hm5fqbqoe1lxvuJuK/f5Q
         jmCIoatXu+fDmsfVUv1Ca8ShTlQoZ7u5FpOQ0KjkhXHYk199D4lVX9Hxw/jURqjvatK7
         QcY5APhXlWxGszEKtQY9saVV8hPXM8jhOcdECfJP5CcWKBbNS+SPco3vy9gPPfG0scay
         PL5DAYaCungohWVyGFYoEkOCCYO0MOrz0bcCmYSlPK/svQuo6fhYACQHgwLVJKfbK/e1
         8fR9kGMLUDn9BOjWV6+jCVlF5Xxav2KFU6Mc03JgspGcpqAp/n7+8VlYpSgIYJbrg5l/
         7YkQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3qgQanxL+XtSey/qDKJih87lRJqzDHgfjDfYnejj/glDbbfjSDB7fFSof20J42Q7tGp8MobDrf/M64iL3pbc/@lists.infradead.org
X-Gm-Message-State: AOJu0YzpjvAiOu8ckpKeQR/GXAfppiKbcWLB9ssAa6fh/eWrLLYMvrfN
	x84J9c7EaNWx8P6dXa37TBhIkQas1Hxg6TZeRNsvKkam1jqKz46LX9VZuoiS688gKAKQuOVhogL
	SEhUqqzVrW9Xd+E2dzQ==
X-Google-Smtp-Source: AGHT+IFt9bxBQ+OiJ6M9T42VJJBXQ3dgE7XPDiGETKJiQhO61thf8YCecySsYum/tlZhh/1oFpOYkgivgvMyU5WF
X-Received: from wryv4.prod.google.com ([2002:a5d:59c4:0:b0:391:3be0:78cb])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1a87:b0:391:1923:5a91 with SMTP id ffacd0b85a97d-39132dc4395mr17764441f8f.55.1741866054357;
 Thu, 13 Mar 2025 04:40:54 -0700 (PDT)
Date: Thu, 13 Mar 2025 11:40:38 +0000
In-Reply-To: <20250313114038.1502357-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250313114038.1502357-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250313114038.1502357-4-vdonnefort@google.com>
Subject: [PATCH v4 3/3] KVM: arm64: Count pKVM stage-2 usage in secondary
 pagetable stats
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_044056_678223_56C51624 
X-CRM114-Status: GOOD (  12.99  )
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

Count the pages used by pKVM for the guest stage-2 in memory stats under
secondary pagetable, similarly to what the VHE mode does.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index ace3969e8106..51754a354b7a 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -86,6 +86,8 @@ struct kvm_hyp_memcache {
 	phys_addr_t head;
 	unsigned long nr_pages;
 	struct pkvm_mapping *mapping; /* only used from EL1 */
+
+#define	HYP_MEMCACHE_ACCOUNT_STAGE2	BIT(1)
 	unsigned long flags;
 };
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 6107a3c8ccf6..2feb6c6b63af 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1088,12 +1088,24 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
 
 static void hyp_mc_free_fn(void *addr, void *mc)
 {
+	struct kvm_hyp_memcache *memcache = mc;
+
+	if (memcache->flags & HYP_MEMCACHE_ACCOUNT_STAGE2)
+		kvm_account_pgtable_pages(addr, -1);
+
 	free_page((unsigned long)addr);
 }
 
 static void *hyp_mc_alloc_fn(void *mc)
 {
-	return (void *)__get_free_page(GFP_KERNEL_ACCOUNT);
+	struct kvm_hyp_memcache *memcache = mc;
+	void *addr;
+
+	addr = (void *)__get_free_page(GFP_KERNEL_ACCOUNT);
+	if (addr && memcache->flags & HYP_MEMCACHE_ACCOUNT_STAGE2)
+		kvm_account_pgtable_pages(addr, 1);
+
+	return addr;
 }
 
 void free_hyp_memcache(struct kvm_hyp_memcache *mc)
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 19921ca407c6..4409a10d02b6 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -165,12 +165,16 @@ static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
 	handle = ret;
 
 	host_kvm->arch.pkvm.handle = handle;
+	host_kvm->arch.pkvm.stage2_teardown_mc.flags |= HYP_MEMCACHE_ACCOUNT_STAGE2;
+	kvm_account_pgtable_pages(pgd, pgd_sz / PAGE_SIZE);
 
 	/* Donate memory for the vcpus at hyp and initialize it. */
 	hyp_vcpu_sz = PAGE_ALIGN(PKVM_HYP_VCPU_SIZE);
 	kvm_for_each_vcpu(idx, host_vcpu, host_kvm) {
 		void *hyp_vcpu;
 
+		host_vcpu->arch.pkvm_memcache.flags |= HYP_MEMCACHE_ACCOUNT_STAGE2;
+
 		/* Indexing of the vcpus to be sequential starting at 0. */
 		if (WARN_ON(host_vcpu->vcpu_idx != idx)) {
 			ret = -EINVAL;
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


