Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA810CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VdKdmYQa5IF5pNpKkb7vq3XA/j7YuaBLx3jNXDvjAXQ=; b=LY0IriHMPwUQUps1kYzaVpkO7m
	8G2TvuVcko2ca5OGFKWPoxzjCyj37IdYYUJaLi0PK9Ss3zW7bLxQ0HqlGz+4FYRPaWXpuGGTdcwgT
	ajCHZ1oN5KgpvX1wIF2V0bL2gI0Z6UDoHL+sANgXTnix2sVIExdhP6FBoQ+EhXPUl2lLh/Yuftk9d
	u8jA5rbc8JpWK7GxLJTQ2mu2FLs5ncc1+39AI6zIdHr6sb+UdgPcL2/j8Am6nlZP82mGcT+zGHxSs
	A3J4HXZmplGIppyEKLxr4aqL7aehgY8BD19VVLP0fmQFRVtQQ1R4J2k+RP3eoSvApN+n3WYr/yun8
	p7mhIEpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmW-00000009NDF-3CtT;
	Thu, 01 Oct 2026 14:29:08 +0000
Received: from mail-ed1-x546.google.com ([2a00:1450:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmS-00000009N7H-1axI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:29:05 +0000
Received: by mail-ed1-x546.google.com with SMTP id 4fb4d7f45d1cf-6af9a90e40fso113756a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 07:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790864941; x=1791469741; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VdKdmYQa5IF5pNpKkb7vq3XA/j7YuaBLx3jNXDvjAXQ=;
        b=dMQaP7ezrX/PIL3OSV9RcBE+WErTwiYvzG2y9jLek+bV6AUEsZ9dadFJUkk/B6cvZO
         0k67Wap68CylgGXhEcttuhJr8GoyA6t8Z5QzojuIN7kPTSK6vUfM731fM/GVjZogG3RV
         kjQ1tU35z0LuQ3uS68iXC8BZRAjnX6LlBlSBe7h+ML8xYcfs6HH9QvGPXql7M/1GmRqX
         dKwQyojm2qjRB4sgtlPFRnFIwjxpHEE+0GbdSMi9sqniLch2BNYMVYfJAo7x7OwerDbS
         D7RrrKUpkoBzstBtsvf5sxy/DnqrzIrVxCZX9dBxX4rlpmrRVBBEmpGYwX72EJg1k/oF
         ls2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790864941; x=1791469741;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VdKdmYQa5IF5pNpKkb7vq3XA/j7YuaBLx3jNXDvjAXQ=;
        b=0BQoj1Wp5+3cJ8ysAFuWjpup3loDFxboSHQowt6wh5Yt1c6QxqrDCpKCls3imj220+
         f+Bsun5lVwyQnaFlOPDT+Z7g0HWMMrY7vI20eCLMGy/RNY6bfjE3wfGT5o18rO8Fuv2i
         WIb9F6FabOmLbshZU93vAz8Iey4Qiq0E4xg7oX8+WZK48XXtlCMAlEIJsVjLOgzEwRTz
         m2oBNVBLPu5ZET3svyYib31zRFzYh4+Z585lsOwq/GuoUn/rfz/cVLDaqroLgv6SfPLF
         zZ99cSQ3RQw8IeGz3XPJyNzAvrTIdlKK9/McI/IwBx+pYTc58FNRQmdCtRU3jEQjDIbr
         WBeg==
X-Forwarded-Encrypted: i=1; AKwUvBw+K5iC++G0h2YigerGmxTlZ025I3bWRzjmGgb1djYP3/RwibMSVj0C6Og6gp280PitJ4vDT7BLe/KMJUnDkjZ+@lists.infradead.org
X-Gm-Message-State: AFq9FYJm7qmkmCQiNdBkJBsTS+kTglcdpaBQFpfYZE4xut8NtcfwD5xk
	VMYH8HuFP+K748jy6hYDP0QQraA6YZN+ayhz83ItRyHHkqYWENl8+NGdt+G2syUaJZFCi4l0zr1
	wWhumtmeAtt5O2wCkehOMJQ==
X-Received: from edpg12.prod.google.com ([2002:aa7:d1cc:0:b0:6ac:7d1d:721f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:270d:b0:6ac:bccf:7c2a with SMTP id 4fb4d7f45d1cf-6ae198649f5mr3903585a12.2.1790864940795;
 Thu, 01 Oct 2026 07:29:00 -0700 (PDT)
Date: Thu,  1 Oct 2026 15:28:36 +0100
In-Reply-To: <20261001142849.3367614-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261001142849.3367614-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001142849.3367614-6-vdonnefort@google.com>
Subject: [PATCH v6 05/18] KVM: arm64: Allow kvm_hyp_memcache usage outside of stage-2
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_072904_456738_87C2BB87 
X-CRM114-Status: GOOD (  16.22  )
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

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_host.h | 13 +++++++++++++
 arch/arm64/kvm/mmu.c              |  4 +++-
 arch/arm64/kvm/pkvm.c             |  4 ++--
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index fc1a82777ed4..64cd6233b439 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -92,9 +92,22 @@ struct kvm_hyp_memcache {
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
2.56.0.rc1.315.gc6ed9934b7-goog


