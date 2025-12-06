Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F40DD3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 00:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Updb/Jfn2dAHBrhkdzkPSsR6YWK/TllPUiDQA+O1aSA=; b=NMhz40TVPnaMv9asyyMbkBtb0M
	3Mp3exQIid5fkICakqYIOQ50LJFvKb5nKOhq6SvvHVzLAhp/B0p28zY/plXfj2jex5lgG5WiHxDF1
	oDeQ9vY1bHDaLYwwNQ8q3FH0616dJnj0w/RrPJY2zq5IWbT8YBpcpTj1aYDxnjTXmT9c47E1BMX0g
	rbwn/OrGoZ55UCwWvAYPKs7GNTiCxaBPIbZ1iRVG8mwGqjL7On1sDnTlm0VZTSah0oG+9D2FywFho
	f3A99WxBAiaXd5Q/L5BUWnKdwDXytyoi+8Y1xsl+l62+3W0m47jqNW7PJ/Gr+eL5z+j4ZlUEaKRxe
	50sqI+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0z-0000000AGjF-0OXF;
	Sat, 06 Dec 2025 00:19:09 +0000
Received: from mail-pf1-f201.google.com ([209.85.210.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg00-0000000AF1s-145d
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 00:18:10 +0000
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7c7957d978aso2757181b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 16:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980284; x=1765585084; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Updb/Jfn2dAHBrhkdzkPSsR6YWK/TllPUiDQA+O1aSA=;
        b=Daf0/+FzQHnfhJVPL0EETwcJ7ZgXp8nufDZL5mMjhTClQzvNakRK+cowK/YH2SYl67
         Lh2uW1Sx5pYZWn9uZ1Re0EvP0RbV+i0VsF8Zs0tW44mVnX8iE/wcJ4SDDPVQFN/16rgI
         02yiEg9EZN727dvyCQsADpOxqFIGPmpLRe2XnvfthWAZyBghKZvfhJ0U/Ee+S1ho9K5a
         NDmIcjHkDOVWEanKOyWqba422+BFB8Vb1ibMTnjqNlXzlqPXbmznWJGssYtFKShIwkCf
         Ho4NyoBAtoloNm+mbHAS/zwsf4T9vyfcqCRp95Z0LuzeAAPZX4IOOv8rtUQyd1XgOxvZ
         01HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980284; x=1765585084;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Updb/Jfn2dAHBrhkdzkPSsR6YWK/TllPUiDQA+O1aSA=;
        b=oOBn4XZ+OSZy/jXPhynzVI26LRyqDJuTJt2GJHxMCtcm5cBQzhAbN/XHvXnRWDvcld
         ONqoR7uWzq5u8UnoTdlBpjiECWaghSKgSnX4kyQK11ZRxLiaQSRhIs7Kp1IZLkRov7GP
         9rcLUx7ElUvcvQjDpyDfGw4uRefkfsrEmA2/aX83c5xk49g3S3nnu035PzLR6d+kb4gF
         CQALq+LvQ/AiI24Vf0ly/b7UG0U9Uht2z6FE0JJSwGDD+vtABMGV8C/TXN5J+ZnOxe91
         QoXo3V98NfGaqc+GLfSSOiVXltZLkih2IOWA9QEuZqAbMEdSHeZPBds7fPrdx/DdZwP4
         8qow==
X-Gm-Message-State: AOJu0YxORm0KRa+J+auZNiTt2t2N3SwRBTexPK4br7PjLN0RlXgODGUp
	SC3bXHeSCuZH+RtpnIKgslWYFMvAZ1gkynS6dhOXYAIOTGgrhsjxbSD361LFilG3uuKsTDY93ED
	1mWRLzg==
X-Google-Smtp-Source: AGHT+IGmx8a/eJZmORgvkEWVhn/uP5dbhmnIbP0XRDK0XcrnLs6A3LdHJHErdqkr+RZXqUaApvjJvO7ayAk=
X-Received: from pgbdp3.prod.google.com ([2002:a05:6a02:f03:b0:bc8:5648:d6bf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:8187:b0:366:1a2c:6f91
 with SMTP id adf61e73a8af0-3661a2c7805mr309067637.4.1764980284548; Fri, 05
 Dec 2025 16:18:04 -0800 (PST)
Date: Fri,  5 Dec 2025 16:16:55 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-20-seanjc@google.com>
Subject: [PATCH v6 19/44] KVM: x86/pmu: Register PMI handler for mediated vPMU
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Mingwei Zhang <mizhang@google.com>, 
	Xudong Hao <xudong.hao@intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_161809_627944_ED443BF5 
X-CRM114-Status: GOOD (  14.83  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xiong Zhang <xiong.y.zhang@linux.intel.com>

Register a dedicated PMI handler with perf's callback when mediated PMU
support is enabled.  Perf routes PMIs that arrive while guest context is
loaded to the provided callback, by modifying the CPU's LVTPC to point at
a dedicated mediated PMI IRQ vector.

WARN upon receipt of a mediated PMI if there is no active vCPU, or if the
vCPU doesn't have a mediated PMU.  Even if a PMI manages to skid past
VM-Exit, it should never be delayed all the way beyond unloading the vCPU.
And while running vCPUs without a mediated PMU, the LVTPC should never be
wired up to the mediated PMI IRQ vector, i.e. should always be routed
through perf's NMI handler.

Signed-off-by: Xiong Zhang <xiong.y.zhang@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
Tested-by: Xudong Hao <xudong.hao@intel.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.c | 10 ++++++++++
 arch/x86/kvm/pmu.h |  2 ++
 arch/x86/kvm/x86.c |  3 ++-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 0de0af5c6e4f..b3dde9a836ea 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -159,6 +159,16 @@ void kvm_init_pmu_capability(const struct kvm_pmu_ops *pmu_ops)
 		perf_get_hw_event_config(PERF_COUNT_HW_BRANCH_INSTRUCTIONS);
 }
 
+void kvm_handle_guest_mediated_pmi(void)
+{
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+
+	if (WARN_ON_ONCE(!vcpu || !kvm_vcpu_has_mediated_pmu(vcpu)))
+		return;
+
+	kvm_make_request(KVM_REQ_PMI, vcpu);
+}
+
 static inline void __kvm_perf_overflow(struct kvm_pmc *pmc, bool in_pmi)
 {
 	struct kvm_pmu *pmu = pmc_to_pmu(pmc);
diff --git a/arch/x86/kvm/pmu.h b/arch/x86/kvm/pmu.h
index a5c7c026b919..9849c2bb720d 100644
--- a/arch/x86/kvm/pmu.h
+++ b/arch/x86/kvm/pmu.h
@@ -46,6 +46,8 @@ struct kvm_pmu_ops {
 
 void kvm_pmu_ops_update(const struct kvm_pmu_ops *pmu_ops);
 
+void kvm_handle_guest_mediated_pmi(void);
+
 static inline bool kvm_pmu_has_perf_global_ctrl(struct kvm_pmu *pmu)
 {
 	/*
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index fb3a5e861553..1623afddff3b 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10111,7 +10111,8 @@ int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 		set_hv_tscchange_cb(kvm_hyperv_tsc_notifier);
 #endif
 
-	__kvm_register_perf_callbacks(ops->handle_intel_pt_intr, NULL);
+	__kvm_register_perf_callbacks(ops->handle_intel_pt_intr,
+				      enable_mediated_pmu ? kvm_handle_guest_mediated_pmi : NULL);
 
 	if (IS_ENABLED(CONFIG_KVM_SW_PROTECTED_VM) && tdp_mmu_enabled)
 		kvm_caps.supported_vm_types |= BIT(KVM_X86_SW_PROTECTED_VM);
-- 
2.52.0.223.gf5cc29aaa4-goog


