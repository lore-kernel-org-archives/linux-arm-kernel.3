Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08243C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DCOhBJDlEMaibcEAIvX0Fz7RikvCVl0uaVPevsNKhY=; b=W0wqxq3DIEIfZN5XwpMaJLw1Ob
	ZnwokOP85DkwhI99GS47lzdAgi09rU//vtVNSprbkC+4/SCKD297R+xGcOAmBX9uvKcWLgWgCOOMe
	srQDEsQeq2N22iTRjYPTwGGCm8CrNRgO58fvPRQ+B3NsBIYsF58UZF2VmBiwxbD7HCZnhOA+NTKb7
	5cwU3+n3JcMgdZbq7fOVxDLMSUUoCBke6R1rwV+inmalwrS2A7grvdopLmr/wejLiAFqdyIwwP8q0
	r3A7BRqGU1q7//VF4eOSNjX36fkVaiIhuUyoJ6VYyMlOKnGwQ6ioZ3iO2kiDoH7k9cidpkQCaw5Oa
	mju/XM4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZA-0000000BCoQ-1h24;
	Tue, 01 Sep 2026 08:10:00 +0000
Received: from mail-ej1-x645.google.com ([2a00:1450:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZ7-0000000BCjS-20ZW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:09:58 +0000
Received: by mail-ej1-x645.google.com with SMTP id a640c23a62f3a-c252a2ae8e1so84022566b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788250195; x=1788854995; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6DCOhBJDlEMaibcEAIvX0Fz7RikvCVl0uaVPevsNKhY=;
        b=Xj6JCFWnJ9unxPKSOJRsWPk+xgvLYXEmXSJ5RkBbeQbjtBZTBQflwfpG6ryKf/fB8E
         qaGIXwZXxV1rhDyaW4bYMX47SHWx2nZvxPU9X/zeFBG1GG9z8ER0dznX9xRNl7XN89qz
         236QtvQZmc8OO7j7gJ5BScQiLOXD0nJdyWMZpmfNlm4NLLLXDR9aPgUv0FKRj0iczMWD
         f5a6UHuudnEbZ797np95lGt0sYG2/GIk4NeAOdgh9IyArDIRKX6llqMNEwwKRonb2PNu
         I2M5QfsZhngxojacXvTFb98jhIM/CCtnrashCy/4xleaTeVl41jllho0f5Xug4fR/Fon
         uRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250195; x=1788854995;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DCOhBJDlEMaibcEAIvX0Fz7RikvCVl0uaVPevsNKhY=;
        b=OpZ5PcFUSCKeVhgP1tsLqHDhnBJo2yqlB+4NdMzY/EMxsA0y2SbL18t+uea8xUHLWP
         1DpfRt0cLD+kNklT7zQKiJF9hbcpV6ucOOWRBkW7RjkNHfktnd8/cvDv1/eLF8ICkov+
         3Eu6vYuLNROpEoJ7flyqtnd6p8N2/xoqT8yLqcgZeidYuPVopbriGo4m6cssLPLndBtS
         9L7Ol5fk8ExcRyO7FidXUtcG92w0c91WyYBG5E5oegl0wlByUsV9H7z2d/cjNLfhOJ5x
         cAJlNEC9m5iqcjQPkLmgfn3z04hXZHxpu9+bx693g4gyItD8v6wSSQ9u7hwZIDyn/2P3
         zVxA==
X-Forwarded-Encrypted: i=1; AKwUvBzp08vw2MrJkdkXxCgJhbKzhO04KwZQUgGNt3srM7fswhutIt4AjvyAAt8N694O1Ni8JHGSoPLf8vJzHfRhaC9h@lists.infradead.org
X-Gm-Message-State: AFuF++nRipeQbqnRaC4y0GY7tUmC9OHMvJRwI7dvB3lnOLrofqduPC6X
	L4gnqA4qTW48gqHiXE4EdQoB8mGCBV57nfkW5axuwztnFmOb0t0sY0GX1rIKgQrp7xXZVG4xruX
	o1f2LEoRjtKz9gCQ8O1SvdQ==
X-Received: from edqr22.prod.google.com ([2002:aa7:d596:0:b0:6a5:ed14:166b])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4412:b0:6a3:f47c:969 with SMTP id 4fb4d7f45d1cf-6a60d3071a3mr19384977a12.3.1788250194778;
 Tue, 01 Sep 2026 01:09:54 -0700 (PDT)
Date: Tue,  1 Sep 2026 09:09:28 +0100
In-Reply-To: <20260901080941.997769-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260901080941.997769-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260901080941.997769-6-vdonnefort@google.com>
Subject: [PATCH v5 05/18] KVM: arm64: Allow kvm_hyp_memcache usage outside of stage-2
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_010957_536572_EB2DBB18 
X-CRM114-Status: GOOD (  13.26  )
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

Although currently limited to guest stage-2 page-table allocations,
struct kvm_hyp_memcache is a useful primitive for passing a list of
discontiguous pages between host and hypervisor.

Introduce init_hyp_memcache() to initialise a generic hyp memcache, and
init_hyp_stage2_memcache() for stage-2 specific memcaches. The generic
initialiser will be used to top up the upcoming pKVM heap allocator.

Note that the generic kvm_hyp_memcache does not account for the
allocated memory. This is expected: donations to the heap allocator are
shared and recycled, they cannot be accounted for a specific VM.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 27fe0cd5b2d7..3ab41330c94f 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -91,9 +91,22 @@ struct kvm_hyp_memcache {
 	struct pkvm_mapping *mapping; /* only used from EL1 */
 
 #define	HYP_MEMCACHE_ACCOUNT_STAGE2	BIT(1)
+#define	HYP_MEMCACHE_ACCOUNT_KMEMCG	BIT(2)
 	unsigned long flags;
 };
 
+static inline void init_hyp_memcache(struct kvm_hyp_memcache *mc)
+{
+	memset(mc, 0, sizeof(*mc));
+	mc->mapping = ZERO_SIZE_PTR; /* Prevent allocation, solely useful for stage2 memcache */
+}
+
+static inline void init_hyp_stage2_memcache(struct kvm_hyp_memcache *mc)
+{
+	memset(mc, 0, sizeof(*mc));
+	mc->flags = HYP_MEMCACHE_ACCOUNT_STAGE2 | HYP_MEMCACHE_ACCOUNT_KMEMCG;
+}
+
 static inline void push_hyp_memcache(struct kvm_hyp_memcache *mc,
 				     phys_addr_t *p,
 				     phys_addr_t (*to_pa)(void *virt))
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 9ba86450fe4a..3163502cc7d2 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1160,8 +1160,10 @@ static void *hyp_mc_alloc_fn(void *mc)
 {
 	struct kvm_hyp_memcache *memcache = mc;
 	void *addr;
+	gfp_t gfp;
 
-	addr = (void *)__get_free_page(GFP_KERNEL_ACCOUNT);
+	gfp = memcache->flags & HYP_MEMCACHE_ACCOUNT_KMEMCG ? GFP_KERNEL_ACCOUNT : GFP_KERNEL;
+	addr = (void *)__get_free_page(gfp);
 	if (addr && memcache->flags & HYP_MEMCACHE_ACCOUNT_STAGE2)
 		kvm_account_pgtable_pages(addr, 1);
 
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 8e4c6e4bec12..e5200731a45b 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -111,7 +111,7 @@ static int __pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
 	void *hyp_vcpu;
 	int ret;
 
-	vcpu->arch.pkvm_memcache.flags |= HYP_MEMCACHE_ACCOUNT_STAGE2;
+	init_hyp_stage2_memcache(&vcpu->arch.pkvm_memcache);
 
 	hyp_vcpu = alloc_pages_exact(hyp_vcpu_sz, GFP_KERNEL_ACCOUNT);
 	if (!hyp_vcpu)
@@ -172,7 +172,7 @@ static int __pkvm_create_hyp_vm(struct kvm *kvm)
 		goto free_vm;
 
 	kvm->arch.pkvm.is_created = true;
-	kvm->arch.pkvm.stage2_teardown_mc.flags |= HYP_MEMCACHE_ACCOUNT_STAGE2;
+	init_hyp_stage2_memcache(&kvm->arch.pkvm.stage2_teardown_mc);
 	kvm_account_pgtable_pages(pgd, pgd_sz / PAGE_SIZE);
 
 	return 0;
-- 
2.55.0.897.gb25b4bd76c-goog


