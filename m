Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA6ECA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AgtErX92+S4B0epnd2wY3xYBTw3NROE9KR9546jjP9s=; b=pyQTdAfg6a6vzGl+2T+C0ZBKkj
	HFLKiB7h8IqvBNz7y7QAF/HTRAkDymvzt57A+MKZJFe60h+qU0A+kwJyW7x8GEYBOMJXd5z25v0vl
	rOGhedgsW4TZB/EMz4wfLOuE3pnNSE7a+74AFqelUhBuYdI2P8oNxKG40BbWC5vm5lxB1k770mQ9X
	ktC+fXIg88bFzXFHzQyazsLuScPYa71iIlrDm64rKbBTd3p7UeOTe8mm8s0OatfZFIyun6MwkgnwK
	8/sYQjDLSzwnJkusRmBUnfbS35/GXaWJDtJgFx98u7t1+QqcRJAWWVFC9SzXBqGvVEHxGMoJhKMMZ
	up+rIEEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmd-00000009NMI-1ypO;
	Thu, 01 Oct 2026 14:29:15 +0000
Received: from mail-ed1-x548.google.com ([2a00:1450:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmZ-00000009NEr-1aT2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:29:13 +0000
Received: by mail-ed1-x548.google.com with SMTP id 4fb4d7f45d1cf-6a9b7e63963so8539527a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 07:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790864949; x=1791469749; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AgtErX92+S4B0epnd2wY3xYBTw3NROE9KR9546jjP9s=;
        b=uScAkNMu4MDE4F6jqfV/BjaNeyxfyWpEMI7krkB5zTVffqrrNGHFOKtw/JqrEnPxQ6
         vp35t7+Ia8ScA2InHHkqxmuzSCYGnCyvsCxplJbtUN1T2IxH3+689/Spyfkh6KF60RDz
         HN6POCu60m6sCjRM4wvBGnMgbs6WiBtIghA76poH0PTHAW4mzrxKe77J7atp6kM2YNsb
         Ycmo1t9y14EGgevPj70hP9oA/A97mI8uw4Wr1BsIx7uuCUPYNnIXpoS9I2FTv18+gyUd
         Z8oZhYO8mBH/hK7VaWMNBJgaCB6EhKwqRXHwTJ09KrA/4sYMN4LKw7bTUxlxzAtEYyT9
         Eyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790864949; x=1791469749;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AgtErX92+S4B0epnd2wY3xYBTw3NROE9KR9546jjP9s=;
        b=bRGzbhnUi9wR9QNS0e3AdKOW2cF3iJNztocVwzqlpI9/Z9PVEy8VqZ+MI6AaZyobse
         y8wNoBtL93diAiq2WeLrrq7nKAQn6uJAodGO0r30hJ3g3D50i8NjFm/EDsDUsiDRbFkq
         0vMbvJmvwqkkK71hzvkritOxpZOeO4SZg4n/8vmQJYRGm/9bNYxDC1YDgb0wmEmKtci0
         qFcra5AJNbAmrDV6WSGGjm9xHO279A0BZeToYNJYE69L/QlSlqbgEfuZ+QRe8/Ctzta/
         kA6jU39M4k1WzRvL2XQdfOXdZXTl+1p1OxvtApZOKVomcHURRipniOQ/jW6Y5g3dQIsc
         Tbcw==
X-Forwarded-Encrypted: i=1; AKwUvBzwXre3r9YkMkzX2Y+p2DqPqYNVYkHLk9/UzLUpydcZzDyoqY9jnRbnM1VXJsTR1cP/f+0+NI3SIjqqATOlYrRx@lists.infradead.org
X-Gm-Message-State: AFq9FYLI5utn2nsREWdzYhW5tDSFPGEDlsicAD1XKRWWcWLfxkfS70Rl
	0vmj94wueKigl6bUx4E3zrTCMyD6PWLshzS/BBsqLnIfl0674iGgiKLcn0z1U0vJvEujfiTwF5B
	d/JNoFz5OMSQ0slyjMOd6vQ==
X-Received: from edbch8.prod.google.com ([2002:a05:6402:1bc8:b0:6a5:d898:8471])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4024:b0:6aa:734a:a091 with SMTP id 4fb4d7f45d1cf-6ae19929a44mr4327530a12.40.1790864948432;
 Thu, 01 Oct 2026 07:29:08 -0700 (PDT)
Date: Thu,  1 Oct 2026 15:28:40 +0100
In-Reply-To: <20261001142849.3367614-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261001142849.3367614-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001142849.3367614-10-vdonnefort@google.com>
Subject: [PATCH v6 09/18] KVM: arm64: Add selftests for the pKVM heap allocator
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_072911_867907_0EAD7E52 
X-CRM114-Status: GOOD (  21.10  )
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

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_asm.h        |   1 +
 arch/arm64/include/asm/kvm_hcall.h      |   2 +
 arch/arm64/include/asm/kvm_pkvm.h       |   3 +
 arch/arm64/kvm/arm.c                    |   2 +
 arch/arm64/kvm/hyp/include/nvhe/alloc.h |  11 ++
 arch/arm64/kvm/hyp/nvhe/alloc.c         | 186 +++++++++++++++++++++++-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      |  24 +++
 arch/arm64/kvm/pkvm.c                   |  19 +++
 8 files changed, 247 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index fc3c52b03154..1ac1990bbd68 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -62,6 +62,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___kvm_enable_ssbs,
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_init_lrs,
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_get_gic_config,
+	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_alloc_selftest,
 
 	MARKER(__KVM_HOST_SMCCC_FUNC_MIN_PKVM),
 
diff --git a/arch/arm64/include/asm/kvm_hcall.h b/arch/arm64/include/asm/kvm_hcall.h
index bce6eb8b20e0..8a6c2506fdeb 100644
--- a/arch/arm64/include/asm/kvm_hcall.h
+++ b/arch/arm64/include/asm/kvm_hcall.h
@@ -24,6 +24,7 @@ typedef u16 pkvm_handle_t;
 
 enum pkvm_topup_id {
 	PKVM_TOPUP_HYP_ALLOC,
+	PKVM_TOPUP_HYP_ALLOC_SELFTEST,
 };
 
 struct kvm;
@@ -153,6 +154,7 @@ DECLARE_KVM_HOST_HCALL(int, __pkvm_cpu_set_vector,
 DECLARE_KVM_HOST_HCALL0(void, __kvm_enable_ssbs)
 DECLARE_KVM_HOST_HCALL0(void, __vgic_v3_init_lrs)
 DECLARE_KVM_HOST_HCALL0(u64, __vgic_v3_get_gic_config)
+DECLARE_KVM_HOST_HCALL0(int, __pkvm_hyp_alloc_selftest)
 
 DECLARE_KVM_HOST_HCALL0(int, __pkvm_prot_finalize)
 
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index c338178d6bb2..ec8060f220f4 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -17,6 +17,7 @@
 
 #define HYP_MEMBLOCK_REGIONS 128
 
+void pkvm_selftests(void);
 int pkvm_init_host_vm(struct kvm *kvm, unsigned long type);
 int pkvm_create_hyp_vm(struct kvm *kvm);
 bool pkvm_hyp_vm_is_created(struct kvm *kvm);
@@ -208,6 +209,7 @@ struct pkvm_mapping {
 enum pkvm_hyp_req_type {
 	PKVM_HYP_NO_REQ = 0,
 	PKVM_HYP_REQ_HYP_ALLOC,
+	PKVM_HYP_REQ_HYP_ALLOC_SELFTEST,
 	__PKVM_HYP_REQ_TYPE_MAX,
 };
 
@@ -235,6 +237,7 @@ static inline size_t pkvm_hyp_req_arg_size(u8 type)
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
index e0104d2dd6c0..c1881c0011c9 100644
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
index fdc39f064718..a6e6c0941428 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -800,6 +800,23 @@ DEFINE_KVM_HOST_HCALL(int, __pkvm_finalize_teardown_vm,
 	return __pkvm_finalize_teardown_vm(handle);
 }
 
+DEFINE_KVM_HOST_HCALL0(int, __pkvm_hyp_alloc_selftest)
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
+	pkvm_hyp_req_to_smccc(host_data_ptr(host_ctxt), &req);
+
+	return ret;
+}
+
 DEFINE_KVM_HOST_HCALL(int, __pkvm_hyp_topup,
 	enum pkvm_topup_id, id, phys_addr_t, head, unsigned long, nr_pages)
 {
@@ -814,6 +831,9 @@ DEFINE_KVM_HOST_HCALL(int, __pkvm_hyp_topup,
 	case PKVM_TOPUP_HYP_ALLOC:
 		ret = hyp_alloc_topup(&host_mc);
 		break;
+	case PKVM_TOPUP_HYP_ALLOC_SELFTEST:
+		ret = hyp_alloc_selftest_topup(&host_mc);
+		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -835,6 +855,9 @@ DEFINE_KVM_HOST_HCALL(int, __pkvm_hyp_reclaim,
 	case PKVM_TOPUP_HYP_ALLOC:
 		hyp_alloc_reclaim(&host_mc, target);
 		break;
+	case PKVM_TOPUP_HYP_ALLOC_SELFTEST:
+		hyp_alloc_selftest_reclaim(&host_mc, target);
+		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -927,6 +950,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__kvm_enable_ssbs),
 	HANDLE_FUNC(__vgic_v3_init_lrs),
 	HANDLE_FUNC(__vgic_v3_get_gic_config),
+	HANDLE_FUNC(__pkvm_hyp_alloc_selftest),
 	HANDLE_FUNC(__pkvm_prot_finalize),
 
 	HANDLE_FUNC(__kvm_adjust_pc),
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
2.56.0.rc1.315.gc6ed9934b7-goog


