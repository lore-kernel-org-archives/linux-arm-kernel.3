Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0E7C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 16:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDcOKwVW00nNGG4NyR6ISobI0N8ZjJsPjdepkGhedWo=; b=iNvJr0gvvCQ1n5xmhBBeCcpqIJ
	PVyO17iGf4tXu2wnhYn2vQT4AV7b2UlvObfghcsvF6e+sBuOO9sS46WtFWB5J9XIcavtmxF3j9FYf
	mAW7u7/XOIrc8jvCmWZFWzEEu5e/umrQ8Cpy668w22nq1ZK4DCb6zFd0SNZ5UV9uPYb6AnbuIY3y6
	qJ0VQHSu5b3s2dNxcRPnALOCuWx950MZXs/qz7HgVK4Hqo9LWyfpXJTsb6AQqROdYBrAbSZEhtmp5
	uNXhV/qlqgvREYkGZmoTAweHTl24rjMardStdpfYPS0UFPDaaX2PE0rJ9GSbwme+Ko/TGBvA9Bfi7
	hMSDR+vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55xi-0000000AK7Y-1jyh;
	Wed, 16 Apr 2025 16:50:10 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55K4-0000000ABuO-1iGO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 16:09:13 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-ac3d175fe71so474694566b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 09:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744819750; x=1745424550; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bDcOKwVW00nNGG4NyR6ISobI0N8ZjJsPjdepkGhedWo=;
        b=2BzD+fpuN1VEyJJCo12Xgq/231kt7hDPwzPTGzoo0lRM2St0vVj9MQtRbCWEZV321v
         cNR6NFy50ulACzrK1IYdgnXDfWkDUDXRB1jelKEKyJGA12I9PIfqw5M05fyviRuPC/1+
         H5wpfKiL5Bs5iZKNeEfuAXDGsX0L/rfP3d3ynpJnfHEX6e1Uo1SGF+SxR/z3JSnZdN07
         7Lo0VJNX71I4DCh65U+Xdop0tenYmXwzmdSnenEZqqmj6I8C2SfCmcsbK+FjYkhrVZnF
         euWjHuwbj4Bfj8SOB5b7YJ1Nw+24dAQKZVEUe0wcBXuiZ22H9xEwr5TzmMXaxiaqMMaX
         JuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744819750; x=1745424550;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bDcOKwVW00nNGG4NyR6ISobI0N8ZjJsPjdepkGhedWo=;
        b=epgh/9XWel31BRuZg/5nP5tEiDcDOjT6kA47ZMSue0n0SHskOMRWndzlhJZx0Ycilp
         UWpo3t6rrXgqUq9ak3OEK8IFBGT4eBjtZLCt6E1GxUX/s0PAssVpz9Y4XqvVCzq3SLr6
         s8F6zyu4BOpMpSIQsgqwiWh4U6sbUMy1+o4U3RJyEbl6IA8hC4sV6ZymBGH0MfqF0oeS
         6fSo0BSQSbiD9xNdamiJF0gibI+D5I0TmAAi/ygP1p/3TXQ9UG2IEBm3vSRdp64ZrFxe
         YK8tBuAh7N3p0BX4jzokgrcEiljNZj77YCgf7ytXdyPWDDABK1v9ZHDrJ3L2VjR6FhhG
         OA4g==
X-Forwarded-Encrypted: i=1; AJvYcCV7xVQTJnkjWNfcrDv8FcFyyJDmfnKrJ8fhqBArsQ9kSwTUk6r/jlRtKRue5NgmXW9u2g6CFTWzwD2G6xE6eeLO@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5s7CQzDwAshRvJ1xdF6Fx/RwPcpvbSp1bkCw2TxDg9rhJihX3
	+knUutQXcBw/VurCwUfMNkkSyOvuTylSHyC/ZTXVVDfrXKkxM4d9OqZNYmIQj6AxtQOylX29tl6
	npImL5A==
X-Google-Smtp-Source: AGHT+IH44M1oUP6au2Aa62Uwe3W7YocYkvgokTJLiLufvbBovB2uSIcZxzrsLQa0fm+cjgs2UKBEThpNgR1E
X-Received: from eduf26.prod.google.com ([2002:a05:6402:5a:b0:5ed:19b4:3ce])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:27ce:b0:5f3:5863:64b5
 with SMTP id 4fb4d7f45d1cf-5f4b747b2c6mr2174230a12.12.1744819750663; Wed, 16
 Apr 2025 09:09:10 -0700 (PDT)
Date: Wed, 16 Apr 2025 16:08:59 +0000
In-Reply-To: <20250416160900.3078417-1-qperret@google.com>
Mime-Version: 1.0
References: <20250416160900.3078417-1-qperret@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416160900.3078417-4-qperret@google.com>
Subject: [PATCH v3 3/4] KVM: arm64: Selftest for pKVM transitions
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Quentin Perret <qperret@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_090912_456100_53523C37 
X-CRM114-Status: GOOD (  14.17  )
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

We have recently found a bug [1] in the pKVM memory ownership
transitions by code inspection, but it could have been caught with a
test.

Introduce a boot-time selftest exercising all the known pKVM memory
transitions and importantly checks the rejection of illegal transitions.

The new test is hidden behind a new Kconfig option separate from
CONFIG_EL2_NVHE_DEBUG on purpose as that has side effects on the
transition checks ([1] doesn't reproduce with EL2 debug enabled).

[1] https://lore.kernel.org/kvmarm/20241128154406.602875-1-qperret@google.com/

Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   6 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 111 ++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/setup.c               |   2 +
 3 files changed, 119 insertions(+)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index ea0a704da9b8..535722cd8417 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -67,4 +67,10 @@ static __always_inline void __load_host_stage2(void)
 	else
 		write_sysreg(0, vttbr_el2);
 }
+
+#ifdef CONFIG_NVHE_EL2_DEBUG
+void pkvm_ownership_selftest(void);
+#else
+static inline void pkvm_ownership_selftest(void) { }
+#endif
 #endif /* __KVM_NVHE_MEM_PROTECT__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 4a0f98943577..1912cc22c987 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1092,3 +1092,114 @@ int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu)
 
 	return 0;
 }
+
+#ifdef CONFIG_NVHE_EL2_DEBUG
+struct pkvm_expected_state {
+	enum pkvm_page_state host;
+	enum pkvm_page_state hyp;
+};
+
+static struct pkvm_expected_state selftest_state;
+static struct hyp_page *selftest_page;
+
+static void assert_page_state(void)
+{
+	void *virt = hyp_page_to_virt(selftest_page);
+	u64 size = PAGE_SIZE << selftest_page->order;
+	u64 phys = hyp_virt_to_phys(virt);
+
+	host_lock_component();
+	WARN_ON(__host_check_page_state_range(phys, size, selftest_state.host));
+	host_unlock_component();
+
+	hyp_lock_component();
+	WARN_ON(__hyp_check_page_state_range(phys, size, selftest_state.hyp));
+	hyp_unlock_component();
+}
+
+#define assert_transition_res(res, fn, ...)		\
+	do {						\
+		WARN_ON(fn(__VA_ARGS__) != res);	\
+		assert_page_state();			\
+	} while (0)
+
+void pkvm_ownership_selftest(void)
+{
+	void *virt = hyp_alloc_pages(&host_s2_pool, 0);
+	u64 phys, size, pfn;
+
+	WARN_ON(!virt);
+	selftest_page = hyp_virt_to_page(virt);
+	selftest_page->refcount = 0;
+
+	size = PAGE_SIZE << selftest_page->order;
+	phys = hyp_virt_to_phys(virt);
+	pfn = hyp_phys_to_pfn(phys);
+
+	selftest_state.host = PKVM_NOPAGE;
+	selftest_state.hyp = PKVM_PAGE_OWNED;
+	assert_page_state();
+	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
+	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
+
+	selftest_state.host = PKVM_PAGE_OWNED;
+	selftest_state.hyp = PKVM_NOPAGE;
+	assert_transition_res(0,	__pkvm_hyp_donate_host, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
+	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
+
+	selftest_state.host = PKVM_PAGE_SHARED_OWNED;
+	selftest_state.hyp = PKVM_PAGE_SHARED_BORROWED;
+	assert_transition_res(0,	__pkvm_host_share_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
+
+	assert_transition_res(0,	hyp_pin_shared_mem, virt, virt + size);
+	assert_transition_res(0,	hyp_pin_shared_mem, virt, virt + size);
+	hyp_unpin_shared_mem(virt, virt + size);
+	WARN_ON(hyp_page_count(virt) != 1);
+	assert_transition_res(-EBUSY,	__pkvm_host_unshare_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
+
+	hyp_unpin_shared_mem(virt, virt + size);
+	assert_page_state();
+	WARN_ON(hyp_page_count(virt));
+
+	selftest_state.host = PKVM_PAGE_OWNED;
+	selftest_state.hyp = PKVM_NOPAGE;
+	assert_transition_res(0,	__pkvm_host_unshare_hyp, pfn);
+
+	selftest_state.host = PKVM_PAGE_SHARED_OWNED;
+	selftest_state.hyp = PKVM_NOPAGE;
+	assert_transition_res(0,	__pkvm_host_share_ffa, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
+	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
+
+	selftest_state.host = PKVM_PAGE_OWNED;
+	selftest_state.hyp = PKVM_NOPAGE;
+	assert_transition_res(0,	__pkvm_host_unshare_ffa, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
+
+	selftest_state.host = PKVM_NOPAGE;
+	selftest_state.hyp = PKVM_PAGE_OWNED;
+	assert_transition_res(0,	__pkvm_host_donate_hyp, pfn, 1);
+
+	selftest_page->refcount = 1;
+	hyp_put_page(&host_s2_pool, virt);
+}
+#endif
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index 2050bb5a6de7..47294134cf1b 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -312,6 +312,8 @@ void __noreturn __pkvm_init_finalise(void)
 		goto out;
 
 	pkvm_hyp_vm_table_init(vm_table_base);
+
+	pkvm_ownership_selftest();
 out:
 	/*
 	 * We tail-called to here from handle___pkvm_init() and will not return,
-- 
2.49.0.604.gff1f9ca942-goog


