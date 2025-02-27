Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A761BC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 00:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARvzDFB7zgeRMzJfEJ/MY3yWuG0D2YavMEjMtd8skDU=; b=lL1zxWfIOZq+zXMtGIxzzF4SS5
	53vTLAJrxklovOlyoSC8p0FjRD/Z0rQ5saRM9jPLhgvWFcCenML4d/ULYHca4lUMn6dBYvdC3L+gi
	eKiQGk7ZsvWznA99MH/iL+YCAXRObigVYkKYO5UzbvfUpaB7ArTBRRSPWkcHQ0/B7G6xuiT4Ta22+
	IaZ/gnlgueXzK7v3kpbnV7e+DLn6sA6wQAUE8SWICLQUqdi+XhtU3tsuqTl3UwT1K/UVlfIV6cOsO
	ej0ukcp0xP/JbjLtZ9MO/fDhurzyrEGwz6HZKCZAgfGOcoMs1nlz5WYAovB3jaaqOVw0ECrhaaPMY
	kUhltBCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRw3-00000005q29-1x43;
	Thu, 27 Feb 2025 00:39:31 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRq5-00000005ory-0epM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 00:33:22 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-abba6d94ae4so40065266b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 16:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740616399; x=1741221199; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ARvzDFB7zgeRMzJfEJ/MY3yWuG0D2YavMEjMtd8skDU=;
        b=lsMwJzWrcuYmSzhOwmE63iiJG4Pe9eMOcIrG0kAR3ND8vNbRIJPkCbBpi30fZ6r9aK
         2eVwzXUrxENQPIGXOFDEOMRg27v+Yv5ufu9zN5hHi8qBAy+wqrnJyYmZyHDjPAdLi5lq
         if1fWZ4MQ7WwcCu2fm5bCNKyPcTW3u6qoKm/XChwKQN7JJ2HYQr/p9Td3qLlliJXXMrs
         OLLqglmDwDcEIVl7ZHRpBnDmeoutxeaR5InJLDQyxZ5p8c86e3Lf82JL5QcrpaVUh59C
         fm7EulTR9T48HK7UOs7MeVjg5SRqyDKQW1qaV9MbPWFM54rzgkWozCPmcwcwhWpofzI3
         MHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740616399; x=1741221199;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ARvzDFB7zgeRMzJfEJ/MY3yWuG0D2YavMEjMtd8skDU=;
        b=gVBTRauXeNsnI3kQOxpHMX7nWLViWQ9gavS2ul8qLd1ASE+e/2R3Edd4bUbOW7kr7P
         ocEY4oYk2XyOkFGML0wtZo0ZY0NE7mp1Uc4qOsVb9Fr/kmze2Rd/7eUDYtnzIqXiThAq
         dYouL+4yotLXewKLxCCMZGLDGmSskRbq4n8oOlZh7x4bHFPLuPEwBm6k/6zCQCf0aCSt
         +71tDNXMXBvOUUyvl2qvNwCywB4uCiESt7s9RvRnJlrTznw7h2wJjlxF2BGUE/gusGDn
         U6nCh7o2IPfC7A1O38Wwda9OkhzwSOoKDvNvg+56/xtRWjqO+ZV8fFyN3DrkoaQ4TJsg
         Bv3w==
X-Forwarded-Encrypted: i=1; AJvYcCVu9Y0UifJ6HRrkiGw0NgNHjKSkndRDA0zfD5YV9lNCqy1bZ9iuRDgNFqMAOIl1T1SCUjlUSANEsvdlQo5xTnVx@lists.infradead.org
X-Gm-Message-State: AOJu0Yxnvg/KzkC0Ac+CGKq4dRCyw21jVxi0vOQp2Y/AyK/usPTETI9R
	9ybR6MbDnyCPKslsw+9FVnAnMCH0s7WroEUf6llnKy2E2RdCm0xf3P1Sx+LpDBEsMqpQex+8NU8
	bNH77aA==
X-Google-Smtp-Source: AGHT+IGb9U+m49213J1IZUi+y8W79DM6Us+fCqOcM3EVD4VeabxFV0pdhtYZr/kBDuUNuD4BTttJ023fUDlE
X-Received: from ejcli4.prod.google.com ([2002:a17:907:1984:b0:abe:e707:63bf])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:d8a:b0:abb:aef3:6052
 with SMTP id a640c23a62f3a-abeeef81b5emr630257266b.55.1740616399076; Wed, 26
 Feb 2025 16:33:19 -0800 (PST)
Date: Thu, 27 Feb 2025 00:33:07 +0000
In-Reply-To: <20250227003310.367350-1-qperret@google.com>
Mime-Version: 1.0
References: <20250227003310.367350-1-qperret@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250227003310.367350-4-qperret@google.com>
Subject: [PATCH 3/6] KVM: arm64: Introduce {get,set}_host_state() helpers
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_163321_195296_D6511E5A 
X-CRM114-Status: GOOD (  15.39  )
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

Instead of directly accessing the host_state member in struct hyp_page,
introduce static inline accessors to do it. The future hyp_state member
will follow the same pattern as it will need some logic in the accessors.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/memory.h | 12 +++++++++++-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c    | 14 +++++++-------
 arch/arm64/kvm/hyp/nvhe/setup.c          |  4 ++--
 3 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
index 642b5e05fe77..4a3c55d26ef3 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
@@ -42,7 +42,7 @@ struct hyp_page {
 	u8 order;
 
 	/* Host (non-meta) state. Guarded by the host stage-2 lock. */
-	enum pkvm_page_state host_state : 8;
+	unsigned __host_state : 8;
 
 	u32 host_share_guest_count;
 };
@@ -79,6 +79,16 @@ static inline struct hyp_page *hyp_phys_to_page(phys_addr_t phys)
 #define hyp_page_to_virt(page)	__hyp_va(hyp_page_to_phys(page))
 #define hyp_page_to_pool(page)	(((struct hyp_page *)page)->pool)
 
+static inline enum pkvm_page_state get_host_state(phys_addr_t phys)
+{
+	return (enum pkvm_page_state)hyp_phys_to_page(phys)->__host_state;
+}
+
+static inline void set_host_state(phys_addr_t phys, enum pkvm_page_state state)
+{
+	hyp_phys_to_page(phys)->__host_state = state;
+}
+
 /*
  * Refcounting for 'struct hyp_page'.
  * hyp_pool::lock must be held if atomic access to the refcount is required.
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 19c3c631708c..a45ffdec7612 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -467,7 +467,7 @@ static int host_stage2_adjust_range(u64 addr, struct kvm_mem_range *range)
 		return -EAGAIN;
 
 	if (pte) {
-		WARN_ON(addr_is_memory(addr) && hyp_phys_to_page(addr)->host_state != PKVM_NOPAGE);
+		WARN_ON(addr_is_memory(addr) && get_host_state(addr) != PKVM_NOPAGE);
 		return -EPERM;
 	}
 
@@ -496,7 +496,7 @@ static void __host_update_page_state(phys_addr_t addr, u64 size, enum pkvm_page_
 	phys_addr_t end = addr + size;
 
 	for (; addr < end; addr += PAGE_SIZE)
-		hyp_phys_to_page(addr)->host_state = state;
+		set_host_state(addr, state);
 }
 
 int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
@@ -620,7 +620,7 @@ static int __host_check_page_state_range(u64 addr, u64 size,
 
 	hyp_assert_lock_held(&host_mmu.lock);
 	for (; addr < end; addr += PAGE_SIZE) {
-		if (hyp_phys_to_page(addr)->host_state != state)
+		if (get_host_state(addr) != state)
 			return -EPERM;
 	}
 
@@ -630,7 +630,7 @@ static int __host_check_page_state_range(u64 addr, u64 size,
 static int __host_set_page_state_range(u64 addr, u64 size,
 				       enum pkvm_page_state state)
 {
-	if (hyp_phys_to_page(addr)->host_state == PKVM_NOPAGE) {
+	if (get_host_state(addr) == PKVM_NOPAGE) {
 		int ret = host_stage2_idmap_locked(addr, size, PKVM_HOST_MEM_PROT);
 
 		if (ret)
@@ -904,7 +904,7 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
 		goto unlock;
 
 	page = hyp_phys_to_page(phys);
-	switch (page->host_state) {
+	switch (get_host_state(phys)) {
 	case PKVM_PAGE_OWNED:
 		WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_OWNED));
 		break;
@@ -957,9 +957,9 @@ static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ip
 	if (WARN_ON(ret))
 		return ret;
 
-	page = hyp_phys_to_page(phys);
-	if (page->host_state != PKVM_PAGE_SHARED_OWNED)
+	if (get_host_state(phys) != PKVM_PAGE_SHARED_OWNED)
 		return -EPERM;
+	page = hyp_phys_to_page(phys);
 	if (WARN_ON(!page->host_share_guest_count))
 		return -EINVAL;
 
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index d62bcb5634a2..1a414288fe8c 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -201,10 +201,10 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	case PKVM_PAGE_OWNED:
 		return host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HYP);
 	case PKVM_PAGE_SHARED_OWNED:
-		hyp_phys_to_page(phys)->host_state = PKVM_PAGE_SHARED_BORROWED;
+		set_host_state(phys, PKVM_PAGE_SHARED_BORROWED);
 		break;
 	case PKVM_PAGE_SHARED_BORROWED:
-		hyp_phys_to_page(phys)->host_state = PKVM_PAGE_SHARED_OWNED;
+		set_host_state(phys, PKVM_PAGE_SHARED_OWNED);
 		break;
 	default:
 		return -EINVAL;
-- 
2.48.1.658.g4767266eb4-goog


