Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F27CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wFMN5UEZF3q9oXO+dYLkRakQxmulFTlCeRMjsMq43Ug=; b=truetPkVdYQLTeWDVGE4Qlf9u8
	xz2ZtKSz0J/DOzVXEZVLH+CpPb7AXsEq/+8PhG7rZekzOwUHoxcEUoGj0egWarFXDl2ZbXaMcRk8d
	OX8YPt8dkKiG5PzZJaMD47suqm4Ug4Gx5i/yahJHQGjdz4Cx9U0qObdmnxJpDq3Ao5D0ajYoUPPVe
	Ju33jdJ4Cu8vpTiKvDWY03TYV5W3jsOhsjG/2/5efM21Zc++BASznHZDmHaybrjt/AbhZ0Blj+Mx2
	LAAGBQ1BOgHiOEkk0MG9M9gBCRta01CNdg2Py6S20akmUY45yzlRfJ8mZFnzRjNmx0gKv9yJ40/tW
	zDE91H8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipi-00000004zIZ-3vhv;
	Wed, 20 May 2026 15:27:42 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipS-00000004z4g-2lFp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:27:27 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48fe44ce385so40572925e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779290845; x=1779895645; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wFMN5UEZF3q9oXO+dYLkRakQxmulFTlCeRMjsMq43Ug=;
        b=Mm1aXgmI475EFsaVp7e2hS2ZgirDLbO9Ix+CLTlDKLm8IEGEDLt8k+uAMGb0fNG08r
         QZZAGuBBI7jCLCewPcoptAXWJ94tzdjGVZgW+HL9IqQb1lbWLQI/kwTDQPoZ4EgoYCE1
         6+NGtdTPZPra3UEiNDsHz7HZ8nu8Uys+YxDdsDMKw4zD/JfB6yRDa/1ZJA3xM0jpUa3M
         pJ3dyAuQwmH8YbBRBIJJxRfK8Ucebn+dI6GS9kTM58fpPwIqEkAzif0fBhgohXIRCxL1
         Psd1kiAkbT9a2qXbWLTsQa3mzCdXPnEtzybrp6oSEtk4lWk29wLcfesHcbv7sQIss9Dk
         XSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779290845; x=1779895645;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wFMN5UEZF3q9oXO+dYLkRakQxmulFTlCeRMjsMq43Ug=;
        b=TiXP8FSs3MIyyxS1IpmnFZybc2klQ/ra1kiW0YzzB/WT8zXPt3xVwcnIXI04oKXoRj
         DXmK2m+9hruGe0la0bDc60Ftq3jzjmeaBSIUfVUavTzWYhL+WIHMX83j5oy/JZlX39K/
         8oi3W5oIymGYl9TKUrfoFqoMH7JYIlwr0rucnycRunBhLvHiGXe5bcwA1hB2mrmx1fSb
         InjNtdbstWf5nfUxF9tiBfuqkmpnUpMLSorVA/k/7cjJZheugAbSMxlZDJTsCeDkV+92
         lIjs62Iwxfyn6Ct3CTBcbEl1f2PcTHiZTfpVhOhSlzr4LgvHpUI5+Jeu8RHDqcokmHCD
         WLCQ==
X-Gm-Message-State: AOJu0Yz5/x/wE/g5zMISa+O8Tv+hpfIIsK+oXXYsL3LRemQB8QG1usHG
	tsEUOh7/itIBTPzAJD5EfIapcvSsvQvK5XKqdxgvWkVaV9aNNfY69S5VUZrzbuLuBSD4nyXY6f3
	saHp9pomljiuHwtou7ylXGQ==
X-Received: from wmgb4.prod.google.com ([2002:a05:600c:1504:b0:48a:5909:4ec0])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c10b:b0:48f:d612:3c59 with SMTP id 5b1f17b1804b1-48fe60eb0f6mr268129155e9.9.1779290844603;
 Wed, 20 May 2026 08:27:24 -0700 (PDT)
Date: Wed, 20 May 2026 16:26:43 +0100
In-Reply-To: <20260520152650.4107895-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260520152650.4107895-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.631.ge1b05301d1-goog
Message-ID: <20260520152650.4107895-11-vdonnefort@google.com>
Subject: [PATCH 10/17] KVM: arm64: Add selftests for the pKVM heap allocator
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_082726_760791_88DC599A 
X-CRM114-Status: GOOD (  17.80  )
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

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index b427ef790b15..07a46860c8b2 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -117,6 +117,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_topup,
 	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_reclaim,
 	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_reclaimable,
+	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_alloc_selftest,
 
 	MARKER(__KVM_HOST_SMCCC_FUNC_MAX)
 };
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index ca3b5fc5f28f..c1c9e8c1f5b6 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -19,6 +19,7 @@
 
 enum pkvm_topup_id {
 	PKVM_TOPUP_HYP_ALLOC,
+	PKVM_TOPUP_HYP_ALLOC_SELFTEST,
 };
 
 unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsigned long target);
@@ -210,6 +211,7 @@ struct pkvm_mapping {
 enum pkvm_hyp_req_type {
 	PKVM_HYP_NO_REQ = 0,
 	PKVM_HYP_REQ_HYP_ALLOC,
+	PKVM_HYP_REQ_HYP_ALLOC_SELFTEST,
 	__PKVM_HYP_REQ_TYPE_MAX,
 };
 
@@ -237,6 +239,7 @@ static inline size_t pkvm_hyp_req_arg_size(u8 type)
 	case PKVM_HYP_NO_REQ:
 		return 0;
 	case PKVM_HYP_REQ_HYP_ALLOC:
+	case PKVM_HYP_REQ_HYP_ALLOC_SELFTEST:
 		return sizeof(req->mem);
 	default:
 		WARN_ON(1);
diff --git a/arch/arm64/kvm/hyp/include/nvhe/alloc.h b/arch/arm64/kvm/hyp/include/nvhe/alloc.h
index 8f87a63f8946..329250dad6f6 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/alloc.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/alloc.h
@@ -14,4 +14,11 @@ int hyp_alloc_init(size_t size);
 int hyp_alloc_topup(struct kvm_hyp_memcache *host_mc);
 unsigned long hyp_alloc_reclaimable(void);
 void hyp_alloc_reclaim(struct kvm_hyp_memcache *host_mc, unsigned long target);
+
+#ifdef CONFIG_NVHE_EL2_DEBUG
+int hyp_allocator_selftest(void);
+u32 hyp_alloc_selftest_topup_needed(void);
+int hyp_alloc_selftest_topup(struct kvm_hyp_memcache *host_mc);
+void hyp_alloc_selftest_reclaim(struct kvm_hyp_memcache *host_mc, unsigned long target);
+#endif
 #endif
diff --git a/arch/arm64/kvm/hyp/nvhe/alloc.c b/arch/arm64/kvm/hyp/nvhe/alloc.c
index 183336f297c3..ea79da743d71 100644
--- a/arch/arm64/kvm/hyp/nvhe/alloc.c
+++ b/arch/arm64/kvm/hyp/nvhe/alloc.c
@@ -1011,9 +1011,24 @@ int hyp_alloc_errno(void)
 	return hyp_allocator_errno(&hyp_allocator);
 }
 
+#ifdef CONFIG_NVHE_EL2_DEBUG
+static int selftest_init(void);
+#endif
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
+#ifdef CONFIG_NVHE_EL2_DEBUG
+	ret = selftest_init();
+	if (ret)
+		return ret;
+#endif
+	return 0;
 }
 
 void hyp_alloc_reclaim(struct kvm_hyp_memcache *mc, unsigned long target)
@@ -1035,3 +1050,184 @@ u32 hyp_alloc_topup_needed(void)
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
+	int ret = -EINVAL;
+
+	hyp_spin_lock(&selftest_lock);
+
+	if (allocator->mc.nr_pages < SELFTEST_MAX_PAGES) {
+		*this_cpu_ptr(allocator->topup_needed) = SELFTEST_MAX_PAGES -
+							 allocator->mc.nr_pages;
+		ret = -ENOMEM;
+		goto end;
+	}
+
+	selftest_alloc(SELFTEST_MAX_SIZE);
+	if (selftest_errno() != -E2BIG)
+		goto end;
+
+	selftest_alloc(SIZE_MAX);
+	if (selftest_errno() != -E2BIG)
+		goto end;
+
+	/* Test first chunk */
+	addr1 = selftest_alloc(0);
+	if (!addr1 || addr1 != (void *)allocator->start + chunk_hdr_size())
+		goto end;
+
+	/* Test second contiguous chunk with unaligned size */
+	addr2 = selftest_alloc(MIN_ALLOC_SIZE + 1);
+	if (!addr2)
+		goto end;
+	addr3 = selftest_alloc(0);
+	if (!addr3 ||
+	    addr3 != addr2 + (2 * MIN_ALLOC_SIZE) + chunk_hdr_size())
+		goto end;
+
+	selftest_free(addr3);
+
+	/* Test chunk recycling */
+	selftest_free(addr1);
+	if (addr1 != selftest_alloc(0))
+		goto end;
+
+	/* Test chunk forward merging */
+	addr3 = selftest_alloc(0);
+	selftest_free(addr2);
+	selftest_free(addr1);
+	if (addr1 != selftest_alloc(MIN_ALLOC_SIZE * 2))
+		goto end;
+
+	selftest_free(addr1);
+
+	/* Test chunk splitting */
+	if (addr1 != selftest_alloc(0))
+		goto end;
+	if (addr2 != selftest_alloc(0))
+		goto end;
+
+	/* Test chunk backward merging */
+	selftest_free(addr1);
+	selftest_free(addr2);
+	if (addr1 != selftest_alloc(MIN_ALLOC_SIZE * 2))
+		goto end;
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
+		goto end;
+
+	selftest_free(addr4);
+	selftest_free(addr1);
+
+	/* Test reclaiming */
+	if (addr1 != selftest_alloc(0))
+		goto end;
+	if (addr2 != selftest_alloc(PAGE_SIZE * 2))
+		goto end;
+	addr3 = selftest_alloc(0);
+	addr4 = selftest_alloc(PAGE_SIZE);
+
+	/* Test reclaiming the last chunk of the list */
+	selftest_free(addr4);
+	hyp_allocator_reclaim(allocator, &host_mc, SELFTEST_MAX_PAGES);
+	if (host_mc.nr_pages != SELFTEST_MAX_PAGES - 3)
+		goto end;
+
+	/* Test punching a hole in the middle of a free chunk ... */
+	selftest_free(addr2);
+	hyp_allocator_reclaim(allocator, &host_mc, SELFTEST_MAX_PAGES);
+	if (host_mc.nr_pages != SELFTEST_MAX_PAGES - 2)
+		goto end;
+
+	if (selftest_alloc(PAGE_SIZE))
+		goto end;
+	if (selftest_errno() != -ENOMEM)
+		goto end;
+
+	/* ... and to refill this hole */
+	ret = hyp_allocator_topup(allocator, &host_mc);
+	if (ret)
+		goto end;
+	/* Chunk at addr2 was made smaller by the reclaim */
+	if (addr2 != selftest_alloc(PAGE_SIZE))
+		goto end;
+
+	/* Test reclaiming the entire allocator from the host */
+	selftest_free(addr3);
+	selftest_free(addr2);
+	selftest_free(addr1);
+	if (addr1 != selftest_alloc(SELFTEST_MAX_PAGES * PAGE_SIZE - chunk_hdr_size()))
+		goto end;
+	selftest_free(addr1);
+
+	ret = 0;
+
+end:
+	hyp_spin_unlock(&selftest_lock);
+	return ret;
+}
+#else
+static int selftest_init(void) { return 0; }
+#endif
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 20be0343abd4..4e7db8b48614 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -614,6 +614,27 @@ static void handle___pkvm_finalize_teardown_vm(struct kvm_cpu_context *host_ctxt
 	cpu_reg(host_ctxt, 1) = __pkvm_finalize_teardown_vm(handle);
 }
 
+#ifdef CONFIG_NVHE_EL2_DEBUG
+static void handle___pkvm_hyp_alloc_selftest(struct kvm_cpu_context *host_ctxt)
+{
+	int ret = hyp_allocator_selftest();
+	struct pkvm_hyp_req req = { .type = PKVM_HYP_NO_REQ };
+
+	if (ret == -ENOMEM) {
+		req.type = PKVM_HYP_REQ_HYP_ALLOC_SELFTEST;
+		req.mem.nr_pages = hyp_alloc_selftest_topup_needed();
+	}
+
+	cpu_reg(host_ctxt, 1) = ret;
+	pkvm_hyp_req_to_smccc(host_ctxt, &req);
+}
+#else
+static void handle___pkvm_hyp_alloc_selftest(struct kvm_cpu_context *host_ctxt)
+{
+	cpu_reg(host_ctxt, 1) = -EPERM;
+}
+#endif
+
 static void handle___pkvm_hyp_topup(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(enum pkvm_topup_id, id, host_ctxt, 1);
@@ -629,6 +650,11 @@ static void handle___pkvm_hyp_topup(struct kvm_cpu_context *host_ctxt)
 	case PKVM_TOPUP_HYP_ALLOC:
 		ret = hyp_alloc_topup(&host_mc);
 		break;
+#ifdef CONFIG_NVHE_EL2_DEBUG
+	case PKVM_TOPUP_HYP_ALLOC_SELFTEST:
+		ret = hyp_alloc_selftest_topup(&host_mc);
+		break;
+#endif
 	default:
 		ret = -EINVAL;
 	}
@@ -649,6 +675,11 @@ static void handle___pkvm_hyp_reclaim(struct kvm_cpu_context *host_ctxt)
 	case PKVM_TOPUP_HYP_ALLOC:
 		hyp_alloc_reclaim(&host_mc, target);
 		break;
+#ifdef CONFIG_NVHE_EL2_DEBUG
+	case PKVM_TOPUP_HYP_ALLOC_SELFTEST:
+		hyp_alloc_selftest_reclaim(&host_mc, target);
+		break;
+#endif
 	default:
 		ret = -EINVAL;
 	}
@@ -807,6 +838,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_hyp_topup),
 	HANDLE_FUNC(__pkvm_hyp_reclaim),
 	HANDLE_FUNC(__pkvm_hyp_reclaimable),
+	HANDLE_FUNC(__pkvm_hyp_alloc_selftest),
 };
 
 static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index f29134a1cc73..15281ae1be39 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -143,6 +143,9 @@ static int pkvm_handle_hyp_req(struct pkvm_hyp_req *req)
 	case PKVM_HYP_REQ_HYP_ALLOC:
 		ret = pkvm_hyp_topup(PKVM_TOPUP_HYP_ALLOC, req->mem.nr_pages);
 		break;
+	case PKVM_HYP_REQ_HYP_ALLOC_SELFTEST:
+		ret = pkvm_hyp_topup(PKVM_TOPUP_HYP_ALLOC_SELFTEST, req->mem.nr_pages);
+		break;
 	}
 
 	trace_kvm_handle_pkvm_hyp_req(req, ret);
@@ -348,6 +351,19 @@ static int __init pkvm_drop_host_privileges(void)
 	return ret;
 }
 
+static void __init pkvm_selftests(void)
+{
+#ifdef CONFIG_NVHE_EL2_DEBUG
+	int ret = pkvm_call_hyp_req(__pkvm_hyp_alloc_selftest);
+
+	if (ret)
+		kvm_err("pKVM hyp allocator selftest failed (%d)\n", ret);
+	else
+		WARN_ON(pkvm_hyp_reclaim(PKVM_TOPUP_HYP_ALLOC_SELFTEST, ULONG_MAX) !=
+			6 /* SELFTEST_MAX_PAGES */);
+#endif
+}
+
 static int __init finalize_pkvm(void)
 {
 	int ret;
@@ -368,6 +384,9 @@ static int __init finalize_pkvm(void)
 	if (ret)
 		pr_err("Failed to finalize Hyp protection: %d\n", ret);
 
+	if (!ret)
+		pkvm_selftests();
+
 	return ret;
 }
 device_initcall_sync(finalize_pkvm);
-- 
2.54.0.631.ge1b05301d1-goog


