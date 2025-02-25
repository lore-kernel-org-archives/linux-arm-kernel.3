Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627E4C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 01:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mVBQg35LScynYQPBsFgs3dGrm+AD9n8KyZeHIALpKpg=; b=T9NMPi+C4ROAgquNbHVuE5updu
	p1Yf2p2W60jfYkJfwWZfouLwm06bn4k+sf+vc2pmu9fwfIrwtCCZRW6Otm4viY5eOdm1BiFR/QAIf
	0IUKC9f/M1+/5wD2VFjg5Da64Ye0x0J/7/fSnsFgeeFLnn3P9R0sU5eIKoOWsBl2j3ezKxmGgELuf
	qo93/8k1d61I1fVyC5hELLYlqdiWMDBB7kIU9yRyZAwfq0DVtTiALKhWQrXp+5T8vbquBl69mlPEO
	jpwoKhXJKaJ7dIQ20mpmcBYR9A+QqynWvL/Y58ErTAkK/TI8YkkJVzYNZFmq96QcnA2S7rPU+pW2n
	ENk7Cilg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmkEY-0000000FkwX-2QkI;
	Tue, 25 Feb 2025 01:59:42 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmk8g-0000000FkHq-1tRg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 01:53:40 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-abba896add9so394047966b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 17:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740448416; x=1741053216; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mVBQg35LScynYQPBsFgs3dGrm+AD9n8KyZeHIALpKpg=;
        b=lap1RaCW8l1DR8cYXJODOWn3sROCqi4Oqc5UlkkPGRtZGvhNrVIUdcwwa5K1bYu/i9
         qR5EBCXkCwBKOeIrh8k4wQvaJprTK8Ls74GaBqR91mis1CvCSlxw4CK6r8qkc76kfhpX
         yc1OBQ9ctHmzyXmywC+8if9VPahPLj1Xhoh8kbd1na8Ju56rnPW54VD8LBSsUJdWkD8i
         9asoq+SgPzulHNrOKCuKNPA0N0QFstpDmVzv8Wn9fKAYTepoNK8eVRhC/Bhu9L4C409E
         njXJ4Fy4UUuVGzIvt1rwMVKZyQf9jkPZu/EbXZRQW4Hsczpj0xE7oZ9zNSxwX5an3OAE
         U1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740448416; x=1741053216;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mVBQg35LScynYQPBsFgs3dGrm+AD9n8KyZeHIALpKpg=;
        b=a4+7y+6QEeOEelXehahduCgQxOnaj5dzoNVQvAKpw440pohZA8T+6V73APGoBx1VWy
         jvx+wQHbTZV+t8iaTxuW/mEEMRXtmjHF+2/xdZIS0FznBoSuhj+tkyTDhQiTLy1WHUOr
         2ZFsbFBHv5F9XU2vZxjsU0bXW70IlM2olccLaUSm8lKgmlLIj8rCav0TrjoKyFP9vUXG
         9Vy3CNgUwrnGJYGLfhycCuUPGikfFgcthvPcfd5Sc+gXd3hmnnJVblZuI8IxqcyJ66+t
         GKiHcJ7BcaSPNDiP8hRSNblyBJRLpDtQBthZURjpjsdltpaj7lekxo+imyfQhmeTfdhM
         fcfg==
X-Gm-Message-State: AOJu0Yz4zpTJWrmEZGQYWqVTNsOErO1GEGnz5vx1tmnbkabIsff/rK12
	y4h1dwZ3Ky/UQ7YNAIzfA8Y1speZ4b7o8GvCjCNOGZbKN4OGuofutl/a0rnODcOTk9eVc3WMAwK
	6gacPyw==
X-Google-Smtp-Source: AGHT+IEOA9rIjA6uekoY3WihM+tF/K0vVRrG2dIyIogwJ20oRerMsyDc12AtygClhb6MD/mhH+yOzfP2W+Kp
X-Received: from ejcvg17.prod.google.com ([2002:a17:907:d311:b0:abb:78a9:ce4a])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:7801:b0:aa6:7737:199c
 with SMTP id a640c23a62f3a-abc09a079d1mr1474527866b.15.1740448416319; Mon, 24
 Feb 2025 17:53:36 -0800 (PST)
Date: Tue, 25 Feb 2025 01:53:26 +0000
In-Reply-To: <20250225015327.3708420-1-qperret@google.com>
Mime-Version: 1.0
References: <20250225015327.3708420-1-qperret@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250225015327.3708420-4-qperret@google.com>
Subject: [PATCH v2 3/4] KVM: arm64: Selftest for pKVM transitions
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_175338_494372_76FA784A 
X-CRM114-Status: GOOD (  15.42  )
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
 arch/arm64/kvm/Kconfig                        |  10 ++
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   6 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 111 ++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/setup.c               |   2 +
 4 files changed, 129 insertions(+)

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index ead632ad01b4..038d7f52232c 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -46,6 +46,7 @@ menuconfig KVM
 config NVHE_EL2_DEBUG
 	bool "Debug mode for non-VHE EL2 object"
 	depends on KVM
+	select PKVM_SELFTESTS
 	help
 	  Say Y here to enable the debug mode for the non-VHE KVM EL2 object.
 	  Failure reports will BUG() in the hypervisor. This is intended for
@@ -53,6 +54,15 @@ config NVHE_EL2_DEBUG
 
 	  If unsure, say N.
 
+config PKVM_SELFTESTS
+	bool "Protected KVM hypervisor selftests"
+	help
+	  Say Y here to enable Protected KVM (pKVM) hypervisor selftests
+	  during boot. Failure reports will panic the hypervisor. This is
+	  intended for EL2 hypervisor development.
+
+	  If unsure, say N.
+
 config PROTECTED_NVHE_STACKTRACE
 	bool "Protected KVM hypervisor stacktraces"
 	depends on NVHE_EL2_DEBUG
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 978f38c386ee..31a3f2cdf242 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -67,4 +67,10 @@ static __always_inline void __load_host_stage2(void)
 	else
 		write_sysreg(0, vttbr_el2);
 }
+
+#ifdef CONFIG_PKVM_SELFTESTS
+void pkvm_ownership_selftest(void);
+#else
+static inline void pkvm_ownership_selftest(void) { }
+#endif
 #endif /* __KVM_NVHE_MEM_PROTECT__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index ae39abc7e604..46f3f4aeecc5 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1083,3 +1083,114 @@ int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu)
 
 	return 0;
 }
+
+#ifdef CONFIG_PKVM_SELFTESTS
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
+	WARN_ON(__hyp_check_page_state_range((u64)virt, size, selftest_state.hyp));
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
index 46d9bd04348f..54006f959e1b 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -308,6 +308,8 @@ void __noreturn __pkvm_init_finalise(void)
 		goto out;
 
 	pkvm_hyp_vm_table_init(vm_table_base);
+
+	pkvm_ownership_selftest();
 out:
 	/*
 	 * We tail-called to here from handle___pkvm_init() and will not return,
-- 
2.48.1.658.g4767266eb4-goog


