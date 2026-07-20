Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D73C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 17:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=coQ8Sg2Gg4wBmuVDYw7iK7AOHNH8rxxYYghY3YcY7oQ=; b=zytwXughEqXJVEjrQvuqWH3O7k
	84mok1eQUoPpJYmwAKtv2Hzr4bd4P+TU17AhjT502a2V4I8nj9sspbvPXwQl4y+KaT6Vhhw3BhYlo
	9VhDjGoosU48LDN/lMTkBROfOlhq4MIWMXfAjpa9T9F9O4F9Wos/Zj7CsLi2g5ic/yjupSp3Iyggv
	kqRjgO5Dom9t/XxJ8cv37aWKqr0ghpEhHjeq9s5un3x1sxLdtilJ3ReEoQ18fj6MJ6daC31G8xptj
	sCnAutDDXG82WIN+6JwyfSVsv9R4EK+hMDc0buIh54YmbNmAYarlDye3YWiMyhtqLsjFVLdmNiYTf
	uUk9TQ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrac-00000007UuF-1BpO;
	Mon, 20 Jul 2026 17:15:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlraT-00000007UlX-2H3M
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Jul 2026 17:15:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=coQ8Sg2Gg4wBmuVDYw7iK7AOHNH8rxxYYghY3YcY7oQ=; b=LRzExT3qN3O0THMZjSt1NoVOrr
	9gbCDMewo2mijrMTquG0q9qKNq5rPnS15L9zlv38H+wnDVviTeiyGW95edFB8laPgvgMp9kRZv570
	mp7wqTyC6FBgLkUGN7cQCWJo73c3jexjuWaM58Pi/8E1UajNo7howNJk8ouKw1YegHP7k9elJfRrL
	7MZLyp53ckeChwSH5vxRYR3nMDIiivnWJ8FJ1aJ3BLa4QxC5RwMSaf+vEm7Xl727ZoWiSPDLG9iwI
	pR5GJAxK0I7eLrsH05Uas+vdzE4dVCZR7N7iCROseG+Ft1l/f88QUVV1CA/4EehYU9GXzR3MLORE3
	uqpAQIGg==;
Received: from mail-ed1-x546.google.com ([2a00:1450:4864:20::546])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wlraQ-0000000Gphr-2wHW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 17:15:28 +0000
Received: by mail-ed1-x546.google.com with SMTP id 4fb4d7f45d1cf-69e97ea7b5bso2408400a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 10:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784567724; x=1785172524; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=coQ8Sg2Gg4wBmuVDYw7iK7AOHNH8rxxYYghY3YcY7oQ=;
        b=cup2bBko+NaQ/9Z3AyAvjYXmdZXuW0skea982QvB005bqfcT8unegbiILXMQXUlnts
         ucCyqS3TO64y1SvXoBafuydDoxRuWv54PNy2rMQFUPdL8Beo6UBKohW1C5Fqs5lLCayT
         lsvandwnrOOGkw6oXRCDHr2Czfb3aIHeAjjU27OPES5NHnzhp/xpmmgQ86NCfV5lMQgq
         Ey4f50ICeDJ8eg+FTUAqnMmapEHL+JN0gFh3pjXtnEI092f2PfwVPSBIfm0Y0mfUeky4
         ChGg//UqJqxH6DgVAfgRsTDyIwHyoJekEtCjNAHd29xnieGmvbbwjh0oigBynzJz0z1y
         g3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784567724; x=1785172524;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=coQ8Sg2Gg4wBmuVDYw7iK7AOHNH8rxxYYghY3YcY7oQ=;
        b=KXTK7QYvvfu1AOC0GfNkTu4EVzZnMrOuT8+z6exiGlO/B8wigxhL3AqLKnbpqE3Adk
         G4D6I15mwKHSRlhw5pU/VFEz50FyJoYiSQUxSOBZbomY2297/oN83m0NwrXWj0X9W54g
         lUMhVmL1H2VP0NO2XoEIH7tNc/bwQ+2zr0FGDEeDzuVEvIGgnWKZlNmr5VHYj+EUZzui
         eB2znm1JrdCuUdKePRW4UX05/qHbJ1mlpG/4vUPRAKd23yszuY0eHuwp4ypEXt7ejIE2
         YE0fQ8yZaHjdUg6Tn3Z28HLHt5F4AqLvTVQMQKTI3KzC/zkhi9eQTgnY1H69eHjT/TU3
         HvxQ==
X-Forwarded-Encrypted: i=1; AHgh+RpL61V/7lh1bxmj9PRRjHjU1xaa/EnHWvW4uxoEH+P2HyqVgKHV3fWs0OlxtXpzj/jm6qUIX7eEY9eGHKqfV4Q2@lists.infradead.org
X-Gm-Message-State: AOJu0YyoS6cKq5z5GkT+L/fopl7cOdJUnCvV0/9rUdLLgeghlM2fdixb
	ETbNAHnZcMEHZvoGPa65va10Iq9g2YAbgTsWVlN+nEAaIA/8b83F4doa81KCCdCnyYbhfmabJBv
	rDYlskCsRmF/Z423IpeNe8Q==
X-Received: from edev9-n1.prod.google.com ([2002:a05:6402:a2c9:10b0:698:ad4b:abf5])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4409:b0:69a:9355:d1c6 with SMTP id 4fb4d7f45d1cf-69e653279b9mr5624442a12.42.1784567723872;
 Mon, 20 Jul 2026 10:15:23 -0700 (PDT)
Date: Mon, 20 Jul 2026 18:15:01 +0100
In-Reply-To: <20260720171513.1415357-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260720171513.1415357-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260720171513.1415357-6-vdonnefort@google.com>
Subject: [PATCH v3 05/17] KVM: arm64: Allow kvm_hyp_memcache usage outside of stage-2
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, tabba@google.com, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <fuad.tabba@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_181526_828945_BA8A814C 
X-CRM114-Status: GOOD (  12.14  )
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

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index bae2c4f92ef5..caea8e9986d1 100644
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
index 6c941aaa10c6..1e37f2f56c68 100644
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
index 428723b1b0f5..d2681da0b629 100644
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
2.55.0.229.g6434b31f56-goog


