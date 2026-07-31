Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58918C55174
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxYCu5PqX7oQBor4HSEAD2JB2T+k3+Y2nJyvkFItg2w=; b=niVDcnxgV2edcZZOwpkPsmHR/G
	MhuYXb1Z1n4cp21P+KFwC65qbvhW1I3E/W/Rk5r2VMKVqw0qnO9z3rSeCmEFtpzeZr03TTbs2DAnO
	xsrbE7NUz2yXo8/d/FbR3GfkkCkxB/UmMaQLYnsukUKTuivP1mMYu0pN5acVLzSbXkBC3sS3WF/UL
	0GWCwCARxDv632FdcWa/68qw3dYDTm+IZUXtyYaIxmuXIWbCHrdJ3b8taeZ6WxMJ1MoH9QcLmR1ww
	9sd6rVYHXpXl/4pCNbfRWQ2zzheqpRbFVIQcj7XDHK1R2cP0Hhbnr2S5lwUMZ2iT7W9Woee3jmgMy
	aHE3rgXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoLY-0000000Cjex-2Via;
	Fri, 31 Jul 2026 14:36:24 +0000
Received: from mail-ej1-x648.google.com ([2a00:1450:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoLE-0000000CjTe-2maE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 14:36:06 +0000
Received: by mail-ej1-x648.google.com with SMTP id a640c23a62f3a-c15eb4015e7so118369366b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 07:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785508561; x=1786113361; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xxYCu5PqX7oQBor4HSEAD2JB2T+k3+Y2nJyvkFItg2w=;
        b=pMn2pAaMsot1eXQEJLUsos1qDN8Jo4/Mv7GZhQiNR05+53kV+Lz3gMYkXw/u/9iYPx
         ivDLFXPbSu9R2d7jQMfIsJKYOPotcbqhEqx2ljRP6Pobblehs0bi3TN0GsZ1USnvz9WA
         jskoPz3QtLc62h/B3QZJhJVKDjX77pWgPaUepsBOAEGKFsNK1SFuHFxzhpbAys0v5J92
         rgcRjCwKYsHB2dQlHl3FUGq6WK9XrEo6VdKGDKZzntqLuBrAKMa5cqyVwKWjqh324brx
         ND2CWsIrhW/7eQHQASq3ZVBOAGxIfmJ+2Xqd9dX/e2Thm/xHzSK9vGrxRMxghFZCZGG2
         9Yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508561; x=1786113361;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xxYCu5PqX7oQBor4HSEAD2JB2T+k3+Y2nJyvkFItg2w=;
        b=j+1dKxZQAgKQuYOr3GAJQ0qZMOhnsbdgtPTCpFXQtwCM3RWE7+e10zisD2zRTF9+Dd
         OX1iqzogO6kvKshzp+GOwcPGW9ekxbUiXdhqLBRhOjiI/Col7gq6LLT4IuOnUbw5S7id
         uWWq8iuOePDujjHtzi0Gto+FicVEvPepQ51eejXrM8tXfXQgOWKSWvyaqGBKhxuyXlT3
         83hqyx/YwBP1we02ZLUWLAmz1o6zm5oLv3PK8M08U5j3aE5eZb0h8FcyT39sM172SJAp
         x2UsUj+vIBGLc7krlg2Pzri38GE+SbRY2S4XWTxkmNZHI3YEGFtSrrxZJbvsw67WvcjU
         t88g==
X-Forwarded-Encrypted: i=1; AHgh+RqFuYIeqzXucorbVru+LzRUUFuuBnzZjNtlkdk+Cr9eDCFPCQQ2U611bp+WlqmiYs86zgZC63/pLrEt5v1+dvB1@lists.infradead.org
X-Gm-Message-State: AOJu0YwgX4QXnfHgNZSsxti3bjNTkuL0WAnGPwjb77Pag/2INHtwozg+
	dLEZdtHQWRoqB1KibIq4mv182oCIQkzRz8x1Mryck8kDMg49ZpN3pkIHKPrMIAf/ycCCWrtlA0X
	Vw7oWq3WIEmpYAnJo2lzzVw==
X-Received: from wmsk18.prod.google.com ([2002:a05:600d:8492:b0:495:59ae:3d1f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:e15b:20b0:c16:72ba:d352 with SMTP id a640c23a62f3a-c1fd2572e4amr110967966b.31.1785508560418;
 Fri, 31 Jul 2026 07:36:00 -0700 (PDT)
Date: Fri, 31 Jul 2026 15:35:29 +0100
In-Reply-To: <20260731143541.956291-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260731143541.956291-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731143541.956291-6-vdonnefort@google.com>
Subject: [PATCH v4 05/17] KVM: arm64: Allow kvm_hyp_memcache usage outside of stage-2
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_073604_730649_1CA758D3 
X-CRM114-Status: GOOD (  12.25  )
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
2.55.0.508.g3f0d502094-goog


