Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8216CD5BAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AfoG+/JjS8TWGZBVrJV6lrQhcdknR5tvbiTC3bDX2tw=; b=4KcX6HjkoSHSpQb+2lE7wMkXqL
	5k/QtKNDumMjTAzwi3iqMcYjReLoUYEX75dEwghUOUwPCN5bsPGUWS1L1ejAm8hi4KCwDbk8Rfw1J
	Dnwd1+Ct1ewkmSqzWxD1WgJBz3NkVkbTJlXgNVC64vBJSooeqkikIhz39ktmuYwQWu87YAWllB1C8
	GTMWVucUiSJJbtC7Wanjagb0Uy/i3YUQPbj2PPnADDjZ7zEHZvKqtKtH9eR2wxl8QYZs5U6vb8ctw
	Xlc1eRJ/D4OWDk2so+Ac8+QS+U24w/6uUpGvFnpMv2y2Y9Il3gEMy0RnXbmoYTKYhuj7V+TzSet/D
	kcqhU3kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipQ-00000004z36-2TTW;
	Wed, 20 May 2026 15:27:24 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipO-00000004z0b-0ByF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:27:23 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-67c1bea16fdso4462871a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779290839; x=1779895639; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AfoG+/JjS8TWGZBVrJV6lrQhcdknR5tvbiTC3bDX2tw=;
        b=RjHGpmOhRSH6EqqkxMfBOH7D13rF/LIjdSISx49GtTgNmsKCyaN0N6tpKwjlX3QrS3
         l1nMwzRAtIjSflD/C45XUBmS6HoiTEEfdQ9M+gVqbYocXeHTvGbbVDZBCHusYaPh7b5w
         u+k44blqyUy7bS/aXWpGsD7y5j3rok4jnarIZJSHWK6KC6o+88WCAz+cMBN8pbd7W2L1
         IhWqvKukNj8m34xp/bFitJGHA1X7PDFYm5QJQUo88KzgcJl2BqjLivNkHC4ROgsuTSo6
         c4N4BXgK7/lUe9FzD1M1eqErVdWNTQUKesJSARsjmez4dQb9HZBJqM46KxS1hUDE0S2w
         agWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779290839; x=1779895639;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AfoG+/JjS8TWGZBVrJV6lrQhcdknR5tvbiTC3bDX2tw=;
        b=Inw7KaTcbrA/MLp+Iu3GzcKQNEQJ+8LX93W5ycQoQzE3MTxpdEiAoRIaX0ctEkom3E
         Hgk6AkTojIo/fDJujQv+1XnfFMWcMRxBTJjMZZFDcpFi0Sr7JVV1xFX9VsoKEAwUvHnA
         4HSuckV2E/254J1TMbTBO9Ib19sN9RcnP5kc2onchNmPziuA8fj4nu4Be45jiMi1nJhu
         R92EqGInJ8ZYMH5Hrbfs4ikTCS+jcSRt18jFy3C/dr9wfNReknopq395KLtBUTaddakx
         SKZNh8kN4oIuA4AkLhQP13jPYuTT1KhwC6QCgmsMcJIejpa8ZZw3WcriCK+w+FbFDdgE
         yVhw==
X-Gm-Message-State: AOJu0Yx/HytJBLa7BPbZZf22D4rQo4HMqA0kexLkVjMTVcxBRESGU9Lf
	n8Gv7iUnNQil5Au5nnryckIokdVFaceIrPdq3rtKixaeURldAbUS22GZprbw51IC+cqGXE35LO9
	2lEz9zagNBGBjMqna7rQdWQ==
X-Received: from edqm8.prod.google.com ([2002:aa7:c488:0:b0:676:9c6b:6e9d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5241:b0:66e:6ac4:2c01 with SMTP id 4fb4d7f45d1cf-683bc9aba07mr13776206a12.2.1779290839371;
 Wed, 20 May 2026 08:27:19 -0700 (PDT)
Date: Wed, 20 May 2026 16:26:38 +0100
In-Reply-To: <20260520152650.4107895-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260520152650.4107895-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.631.ge1b05301d1-goog
Message-ID: <20260520152650.4107895-6-vdonnefort@google.com>
Subject: [PATCH 05/17] KVM: arm64: Allow kvm_hyp_memcache usage outside of stage-2
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_082722_122233_688867EC 
X-CRM114-Status: GOOD (  11.41  )
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

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 65eead8362e0..15c5378b70a0 100644
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
index d089c107d9b7..04dd442c127e 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1132,9 +1132,11 @@ static void hyp_mc_free_fn(void *addr, void *mc)
 static void *hyp_mc_alloc_fn(void *mc)
 {
 	struct kvm_hyp_memcache *memcache = mc;
+	gfp_t gfp = (memcache->flags & HYP_MEMCACHE_ACCOUNT_KMEMCG) ?
+		    GFP_KERNEL_ACCOUNT : GFP_KERNEL;
 	void *addr;
 
-	addr = (void *)__get_free_page(GFP_KERNEL_ACCOUNT);
+	addr = (void *)__get_free_page(gfp);
 	if (addr && memcache->flags & HYP_MEMCACHE_ACCOUNT_STAGE2)
 		kvm_account_pgtable_pages(addr, 1);
 
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 053e4f733e4b..8324a6a1bc48 100644
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
2.54.0.631.ge1b05301d1-goog


