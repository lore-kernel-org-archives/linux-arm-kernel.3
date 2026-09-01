Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D639C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcGXRbOjTcgaUXDimFb+w2dbIkSAxSexDhooE+XIces=; b=IqtkIX+fmFBcfrIHKdo/ia5pee
	CQ7CFixhAJ2/VL+d5EnbRrkt2f7ssTqTv2krIl8Z02z23ryBXeXj5xtN7SoIBvO1qReF72ahxe2oB
	zzVu7zPPQgLDqJWbN5rGge5CvLjhs7hKQPeqYT6I9q0pCw3ieZeJ8iDt7ozEl6i1y9s+8RAcX8LLm
	TEpKG5iQNazulZWB+P0QRwq24fpwD5cF+gKy0JLR5vw8LKmPRNOl1/VMGF2mgD4pc0SLInr0kO8F6
	cyHek20+UtyJnEJc0TxvBpVRMXqhIpBwYWOE5umpSCDFvWIGg4JraHHppnK4AWdbinrDzwOoHkx4k
	Dg7nrcpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZF-0000000BCuw-07n7;
	Tue, 01 Sep 2026 08:10:05 +0000
Received: from mail-ed1-x545.google.com ([2a00:1450:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZC-0000000BCo6-0WWF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:10:03 +0000
Received: by mail-ed1-x545.google.com with SMTP id 4fb4d7f45d1cf-6a18e611c82so4620838a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788250200; x=1788855000; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DcGXRbOjTcgaUXDimFb+w2dbIkSAxSexDhooE+XIces=;
        b=fC7NBzhxLyjUmdQQ8+KcwjNP212qflHvZo++BFJMcRJww7M1Hl9FMBWoyuatLajmHh
         v7QcKYIItfKvgKXxte4ZR63YmXJ2XdzIHiQ1l5UwUL55f6CU5suuXO0ynPwyvEHBUpTk
         DGM0TtYXD4rUnpf2Qml/mN2SFQhmDzIaCbYhwX8IFUNQb60wqq2DLfEmYyVAh8V1syW5
         FtJJTdIVlYP20F64y8Fc7Soqvx5nJSL66eRttpv85r6tKW5EnzIfAM/SPMVnJrWWaLW6
         i92oMdAxMv3tE1KsE+t7nOWioRZ9IOsq4zC11GYH2hArXFSLvAA6IJJk962jRP9sYOzB
         nl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250200; x=1788855000;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcGXRbOjTcgaUXDimFb+w2dbIkSAxSexDhooE+XIces=;
        b=P5AR8RYe61pQIxmXtuaVWxWRydulJYQbdkuG0lWjviM1Mt6IXALqjF0g2/7DlO3+OJ
         AW+u7giBn6Q1TyrqQINbJQyuooYhuseDEm4lt0v3CjvyW3EZhfWmmBOwf1gHSQgxnhbv
         r0IlY+VZg2TGrliHxwQOjNoD2ZNN3xM2qY55nie0oN5N0VpIxaAES4d0aUYZbXsdcu1K
         if9ihHnDPmsDI3KZSOiV0HzZEzbTm7eLrcukYR1edPG55WLLMbb6qrnwwzIo/IMUQOaN
         kqGLl9dFQyEH0nyoM6FOKNo3Y/WDY8PSZW6/4/EM5p/bpkhdpsVhco44lZCNN+BF/CgJ
         sNJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdgqoab822JpyhWzNVgr9CSvaEO/t+xAjb6ZkKj3R/3vhTKWRhizvedPP6QOxKDW2E2/jhYSLlz81S85zJEKjL@lists.infradead.org
X-Gm-Message-State: AFuF++lEH/352jtwDVZQ6pbBBAW2AaEttYC0sGPhkTdDQGdr0u7KZrBS
	QN7KgC+kIJRrcZoQqg24V8/ksylZ4ad/JjKQy653mWU8kAOtD7DI4Mt792vwx6PDTNtQLC9p4YL
	us/+2Yu7IYyvgJWqWYKbHQQ==
X-Received: from edat36.prod.google.com ([2002:a05:6402:2424:b0:6a6:7416:c649])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:505c:b0:6a6:489:e89b with SMTP id 4fb4d7f45d1cf-6a60d33f88dmr17579445a12.5.1788250199559;
 Tue, 01 Sep 2026 01:09:59 -0700 (PDT)
Date: Tue,  1 Sep 2026 09:09:32 +0100
In-Reply-To: <20260901080941.997769-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260901080941.997769-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260901080941.997769-10-vdonnefort@google.com>
Subject: [PATCH v5 09/18] KVM: arm64: Add selftests for the pKVM heap allocator
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_011002_232429_D1D79376 
X-CRM114-Status: GOOD (  17.99  )
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

Introduce a comprehensive runtime selftest for the pKVM hypervisor heap
allocator, executed during init when CONFIG_NVHE_EL2_DEBUG is enabled.

The selftest runs entirely at EL2 and exercises allocator's core
mechanisms:

  * over-sized allocations
  * basic allocation and alignment
  * chunk recycling, splitting, merging
  * memory reclaiming
  * memory topup

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index fc3c52b03154..0a8df74a7b4e 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -92,6 +92,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_topup,
 	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_reclaim,
 	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_reclaimable,
+	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_alloc_selftest,
 
 	MARKER(__KVM_HOST_SMCCC_FUNC_PKVM_ONLY),
 
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 5ea5633705ef..366bbd5c854b 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -19,8 +19,10 @@
 
 enum pkvm_topup_id {
 	PKVM_TOPUP_HYP_ALLOC,
+	PKVM_TOPUP_HYP_ALLOC_SELFTEST,
 };
 
+void pkvm_selftests(void);
 int pkvm_init_host_vm(struct kvm *kvm, unsigned long type);
 int pkvm_create_hyp_vm(struct kvm *kvm);
 bool pkvm_hyp_vm_is_created(struct kvm *kvm);
@@ -212,6 +214,7 @@ struct pkvm_mapping {
 enum pkvm_hyp_req_type {
 	PKVM_HYP_NO_REQ = 0,
 	PKVM_HYP_REQ_HYP_ALLOC,
+	PKVM_HYP_REQ_HYP_ALLOC_SELFTEST,
 	__PKVM_HYP_REQ_TYPE_MAX,
 };
 
@@ -239,6 +242,7 @@ static inline size_t pkvm_hyp_req_arg_size(u8 type)
 	case PKVM_HYP_NO_REQ:
 		return 0;
 	case PKVM_HYP_REQ_HYP_ALLOC:
+	case PKVM_HYP_REQ_HYP_ALLOC_SELFTEST:
 		return sizeof(req->mem);
 	default:
 		WARN_ON(1);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 8b080804bc90..09ae5431ce58 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2914,6 +2914,8 @@ static int __init init_hyp_mode(void)
 			kvm_err("Failed to init hyp memory protection\n");
 			goto out_err;
 		}
+
+		pkvm_selftests();
 	}
 
 	return 0;
diff --git a/arch/arm64/kvm/hyp/include/nvhe/alloc.h b/arch/arm64/kvm/hyp/include/nvhe/alloc.h
index 8f87a63f8946..bca0168e0046 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/alloc.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/alloc.h
@@ -14,4 +14,15 @@ int hyp_alloc_init(size_t size);
 int hyp_alloc_topup(struct kvm_hyp_memcache *host_mc);
 unsigned long hyp_alloc_reclaimable(void);
 void hyp_alloc_reclaim(struct kvm_hyp_memcache *host_mc, unsigned long target);
+
+#ifdef CONFIG_NVHE_EL2_DEBUG
+int hyp_allocator_selftest(void);
+u32 hyp_alloc_selftest_topup_needed(void);
+int hyp_alloc_selftest_topup(struct kvm_hyp_memcache *host_mc);
+void hyp_alloc_selftest_reclaim(struct kvm_hyp_memcache *host_mc, unsigned long target);
+#else
+static inline int hyp_alloc_selftest_topup(struct kvm_hyp_memcache *host_mc) { return 0; };
+static inline void
+hyp_alloc_selftest_reclaim(struct kvm_hyp_memcache *host_mc, unsigned long target) { };
+#endif
 #endif
diff --git a/arch/arm64/kvm/hyp/nvhe/alloc.c b/arch/arm64/kvm/hyp/nvhe/alloc.c
index 32435782030b..3b83de90472a 100644
--- a/arch/arm64/kvm/hyp/nvhe/alloc.c
+++ b/arch/arm64/kvm/hyp/nvhe/alloc.c
@@ -1001,9 +1001,17 @@ int hyp_alloc_errno(void)
 	return hyp_allocator_errno(&hyp_allocator);
 }
 
+static int selftest_init(void);
+
 int hyp_alloc_init(size_t size)
 {
-	return hyp_allocator_init(&hyp_allocator, size);
+	int ret;
+
+	ret = hyp_allocator_init(&hyp_allocator, size);
+	if (ret)
+		return ret;
+
+	return selftest_init();
 }
 
 void hyp_alloc_reclaim(struct kvm_hyp_memcache *mc, unsigned long target)
@@ -1025,3 +1033,179 @@ u32 hyp_alloc_topup_needed(void)
 {
 	return hyp_allocator_topup_needed(&hyp_allocator);
 }
+
+#ifdef CONFIG_NVHE_EL2_DEBUG
+#define SELFTEST_MAX_PAGES 6
+#define SELFTEST_MAX_SIZE (PAGE_SIZE * SELFTEST_MAX_PAGES)
+
+static DEFINE_PER_CPU(int, __selftest_errno);
+static DEFINE_PER_CPU(u32, __selftest_topup_needed);
+
+static struct hyp_allocator selftest_allocator = {
+	.errno = &__selftest_errno,
+	.topup_needed = &__selftest_topup_needed,
+	.lock = __HYP_SPIN_LOCK_UNLOCKED,
+};
+
+int hyp_alloc_selftest_topup(struct kvm_hyp_memcache *host_mc)
+{
+	return hyp_allocator_topup(&selftest_allocator, host_mc);
+}
+
+void hyp_alloc_selftest_reclaim(struct kvm_hyp_memcache *host_mc, unsigned long target)
+{
+	hyp_allocator_reclaim(&selftest_allocator, host_mc, target);
+}
+
+u32 hyp_alloc_selftest_topup_needed(void)
+{
+	return hyp_allocator_topup_needed(&selftest_allocator);
+}
+
+static int selftest_init(void)
+{
+	return hyp_allocator_init(&selftest_allocator, SELFTEST_MAX_SIZE);
+}
+
+static void *selftest_alloc(size_t size)
+{
+	return hyp_allocator_alloc(&selftest_allocator, size);
+}
+
+static void selftest_free(void *addr)
+{
+	hyp_allocator_free(&selftest_allocator, addr);
+}
+
+static int selftest_errno(void)
+{
+	return hyp_allocator_errno(&selftest_allocator);
+}
+
+int hyp_allocator_selftest(void)
+{
+	struct hyp_allocator *allocator = &selftest_allocator;
+	static DEFINE_HYP_SPINLOCK(selftest_lock);
+	struct kvm_hyp_memcache host_mc = { };
+	void *addr1, *addr2, *addr3, *addr4;
+	int ret;
+
+	guard(hyp_spinlock)(&selftest_lock);
+
+	if (allocator->mc.nr_pages < SELFTEST_MAX_PAGES) {
+		*this_cpu_ptr(allocator->topup_needed) = SELFTEST_MAX_PAGES -
+							 allocator->mc.nr_pages;
+		return -ENOMEM;
+	}
+
+	selftest_alloc(SELFTEST_MAX_SIZE);
+	if (selftest_errno() != -E2BIG)
+		return -EINVAL;
+
+	selftest_alloc(SIZE_MAX);
+	if (selftest_errno() != -E2BIG)
+		return -EINVAL;
+
+	/* Test first chunk */
+	addr1 = selftest_alloc(0);
+	if (!addr1 || addr1 != (void *)allocator->start + chunk_hdr_size())
+		return -EINVAL;
+
+	/* Test second contiguous chunk with unaligned size */
+	addr2 = selftest_alloc(MIN_ALLOC_SIZE + 1);
+	if (!addr2)
+		return -EINVAL;
+	addr3 = selftest_alloc(0);
+	if (!addr3 ||
+	    addr3 != addr2 + (2 * MIN_ALLOC_SIZE) + chunk_hdr_size())
+		return -EINVAL;
+
+	selftest_free(addr3);
+
+	/* Test chunk recycling */
+	selftest_free(addr1);
+	if (addr1 != selftest_alloc(0))
+		return -EINVAL;
+
+	/* Test chunk forward merging */
+	addr3 = selftest_alloc(0);
+	selftest_free(addr2);
+	selftest_free(addr1);
+	if (addr1 != selftest_alloc(MIN_ALLOC_SIZE * 2))
+		return -EINVAL;
+
+	selftest_free(addr1);
+
+	/* Test chunk splitting */
+	if (addr1 != selftest_alloc(0))
+		return -EINVAL;
+	if (addr2 != selftest_alloc(0))
+		return -EINVAL;
+
+	/* Test chunk backward merging */
+	selftest_free(addr1);
+	selftest_free(addr2);
+	if (addr1 != selftest_alloc(MIN_ALLOC_SIZE * 2))
+		return -EINVAL;
+
+	selftest_free(addr1);
+
+	/* Test chunk 3-way merging */
+	addr1 = selftest_alloc(0);
+	addr2 = selftest_alloc(0);
+	addr4 = selftest_alloc(0);
+	selftest_free(addr1);
+	selftest_free(addr3);
+	selftest_free(addr2);
+	if (addr1 != selftest_alloc(MIN_ALLOC_SIZE * 3))
+		return -EINVAL;
+
+	selftest_free(addr4);
+	selftest_free(addr1);
+
+	/* Test reclaiming */
+	if (addr1 != selftest_alloc(0))
+		return -EINVAL;
+	if (addr2 != selftest_alloc(PAGE_SIZE * 2))
+		return -EINVAL;
+	addr3 = selftest_alloc(0);
+	addr4 = selftest_alloc(PAGE_SIZE);
+
+	/* Test reclaiming the last chunk of the list */
+	selftest_free(addr4);
+	hyp_allocator_reclaim(allocator, &host_mc, SELFTEST_MAX_PAGES);
+	if (host_mc.nr_pages != SELFTEST_MAX_PAGES - 3)
+		return -EINVAL;
+
+	/* Test punching a hole in the middle of a free chunk ... */
+	selftest_free(addr2);
+	hyp_allocator_reclaim(allocator, &host_mc, SELFTEST_MAX_PAGES);
+	if (host_mc.nr_pages != SELFTEST_MAX_PAGES - 2)
+		return -EINVAL;
+
+	if (selftest_alloc(PAGE_SIZE))
+		return -EINVAL;
+	if (selftest_errno() != -ENOMEM)
+		return -EINVAL;
+
+	/* ... and to refill this hole */
+	ret = hyp_allocator_topup(allocator, &host_mc);
+	if (ret)
+		return ret;
+	/* Chunk at addr2 was made smaller by the reclaim */
+	if (addr2 != selftest_alloc(PAGE_SIZE))
+		return -EINVAL;
+
+	/* Test reclaiming the entire allocator from the host */
+	selftest_free(addr3);
+	selftest_free(addr2);
+	selftest_free(addr1);
+	if (addr1 != selftest_alloc(SELFTEST_MAX_PAGES * PAGE_SIZE - chunk_hdr_size()))
+		return -EINVAL;
+	selftest_free(addr1);
+
+	return 0;
+}
+#else
+static int selftest_init(void) { return 0; }
+#endif
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 62567560e1a5..563be134c0cb 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -827,6 +827,22 @@ static void handle___pkvm_finalize_teardown_vm(struct kvm_cpu_context *host_ctxt
 	cpu_reg(host_ctxt, 1) = __pkvm_finalize_teardown_vm(handle);
 }
 
+static void handle___pkvm_hyp_alloc_selftest(struct kvm_cpu_context *host_ctxt)
+{
+	struct pkvm_hyp_req req = { .type = PKVM_HYP_NO_REQ };
+	int ret = -EPERM;
+
+#ifdef CONFIG_NVHE_EL2_DEBUG
+	ret = hyp_allocator_selftest();
+	if (ret == -ENOMEM) {
+		req.type = PKVM_HYP_REQ_HYP_ALLOC_SELFTEST;
+		req.mem.nr_pages = hyp_alloc_selftest_topup_needed();
+	}
+#endif
+	cpu_reg(host_ctxt, 1) = ret;
+	pkvm_hyp_req_to_smccc(host_ctxt, &req);
+}
+
 static void handle___pkvm_hyp_topup(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(enum pkvm_topup_id, id, host_ctxt, 1);
@@ -842,6 +858,9 @@ static void handle___pkvm_hyp_topup(struct kvm_cpu_context *host_ctxt)
 	case PKVM_TOPUP_HYP_ALLOC:
 		ret = hyp_alloc_topup(&host_mc);
 		break;
+	case PKVM_TOPUP_HYP_ALLOC_SELFTEST:
+		ret = hyp_alloc_selftest_topup(&host_mc);
+		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -862,6 +881,9 @@ static void handle___pkvm_hyp_reclaim(struct kvm_cpu_context *host_ctxt)
 	case PKVM_TOPUP_HYP_ALLOC:
 		hyp_alloc_reclaim(&host_mc, target);
 		break;
+	case PKVM_TOPUP_HYP_ALLOC_SELFTEST:
+		hyp_alloc_selftest_reclaim(&host_mc, target);
+		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -998,6 +1020,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_hyp_topup),
 	HANDLE_FUNC(__pkvm_hyp_reclaim),
 	HANDLE_FUNC(__pkvm_hyp_reclaimable),
+	HANDLE_FUNC(__pkvm_hyp_alloc_selftest),
 
 	HANDLE_FUNC(__pkvm_host_share_hyp),
 	HANDLE_FUNC(__pkvm_host_unshare_hyp),
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index fec819a9dc78..7821f2592eba 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -344,6 +344,22 @@ static int __init pkvm_drop_host_privileges(void)
 	return ret;
 }
 
+void __init pkvm_selftests(void)
+{
+#ifdef CONFIG_NVHE_EL2_DEBUG
+	int ret = pkvm_call_hyp_req(__pkvm_hyp_alloc_selftest);
+	unsigned long reclaimed;
+
+	reclaimed = pkvm_hyp_reclaim(PKVM_TOPUP_HYP_ALLOC_SELFTEST, ULONG_MAX);
+
+	/* On failure, not all the pages may be reclaimable */
+	if (!ret)
+		WARN_ON(reclaimed != 6 /* SELFTEST_MAX_PAGES */);
+	else
+		kvm_err("pKVM hyp allocator selftest failed (%d)\n", ret);
+#endif
+}
+
 static int __init finalize_pkvm(void)
 {
 	int ret;
@@ -677,6 +693,9 @@ static int pkvm_handle_hyp_req(struct pkvm_hyp_req *req)
 	case PKVM_HYP_REQ_HYP_ALLOC:
 		ret = pkvm_hyp_topup(PKVM_TOPUP_HYP_ALLOC, req->mem.nr_pages);
 		break;
+	case PKVM_HYP_REQ_HYP_ALLOC_SELFTEST:
+		ret = pkvm_hyp_topup(PKVM_TOPUP_HYP_ALLOC_SELFTEST, req->mem.nr_pages);
+		break;
 	}
 
 	trace_kvm_handle_pkvm_hyp_req(req, ret);
-- 
2.55.0.897.gb25b4bd76c-goog


