Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB220C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 21:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w80ZA8rn05ntQihJcNwz1pv2hia2ecTvLpbk0Bz9WXc=; b=lqOKArHGcPdg+L5N14sr869LQW
	YB+OvLR+ZiC2jW4o/zn+rHQJQESxARH6tO96e7/daZTrcIJrPkOF9wJ643/b3r1bYlY/qd3uhr8Qq
	5CTf5nqLSAx0O5vZIil5ShKUl6DAssHT/+4O+UNYoQXLpApsEJokPbn3SA+eMbpvqIhM7Z/t1Q012
	9vvei4iJJmzZADscXylkJGWB1C859mA4m251hBFeid8+Btt/z6ngDQC0+6i28K4v3CRtHwNYyPISn
	r6oH5oidnnfKtm4JoVq2c81ofXv9EnY4uWrXctQ67rNzcIUrknONSeOwnYIOHJhvwsNJ0sIHTDNuF
	ByIUBozg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujm3i-0000000GdwM-0VoM;
	Wed, 06 Aug 2025 21:52:30 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkHf-0000000GHF7-1kEA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:48 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3214259ce67so319329a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 12:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510326; x=1755115126; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=w80ZA8rn05ntQihJcNwz1pv2hia2ecTvLpbk0Bz9WXc=;
        b=OBPnXjc94IdtRurhOjsOIPSJ4M8yrDXLioE9nsOawkhyZ275xdDzdXZxwdXVvZP3F4
         6tlIYnQkswQQXmXOT/gbaeopVbrMIZyKp6oaru/54KgPYxPvYBY7AO0X+6FnrzBT3k5I
         ZOvtNLVafYnbh4mH3ibBJchy8v62s/7s9LA3sz1IS9mZX+mYVs7TErxE/w8HMyP/9Dg9
         UonqLWq38X/rvF0YKyMIYDDkdejvrlE/BocrWgEQCAeP2e+2T4S7Fquini8GsJZ3bQaU
         AgRG5sgbyW9KIt8OZj/zp0DlssFRuU2ebgC37wYj9YRNVzaXFLUPREF5BXzWqyZ/+bTA
         stBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510326; x=1755115126;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w80ZA8rn05ntQihJcNwz1pv2hia2ecTvLpbk0Bz9WXc=;
        b=kS64zy8npvPaRGrYXX3CNg8spaRsV6N/aT63Rh4MBOJnxrWUcZMbQ8O7vqQlHgb9WH
         uUvezEugFEL8EO8+Iyi4OzQFjhgSyC4a8C/AiPlk4yBwmtUd98cY2JTiKavHq46TcqZl
         Wv2t9GREFYpkRR0+z0QOVN6k+fTJrUowEqY6bmd38muRLIdTv6A8YO6bk2QHaXPxSSQJ
         clQJHWT4K6kcnA52cJ82DxEnhHnQ6cMT+4NFD/P7tlX0Chwe5OIzdu0OMVFDUzDnGjN/
         JXDN4oIVYyNC7HOcNZc0xzOKNmQRgZo/4WbgFKLIW/V4/WWnh46ydRlyO0PiwZ5LuYCI
         9GPw==
X-Gm-Message-State: AOJu0YztCVpIhZdBX0zDZAk9zpjwjI9r5p9xPlx681I/o+hc6UkfGSz1
	yXQqqY2suxRDT7vvmGNrG7sWBVEqbtjqvtAMyBTqNB/TV9HImZy22Vqv40RibhxBfE0XWCm1Rj6
	MAobkeg==
X-Google-Smtp-Source: AGHT+IEfElow/kZ7u4L92aZnG23Q7FLbrDYX2HxfWcS+XU7qHvCNVpRcocJ/y0Y5Vl+7RC7W7jz29DD5/48=
X-Received: from pjbdy8.prod.google.com ([2002:a17:90b:6c8:b0:321:6ddc:33a0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2750:b0:321:157a:ee73
 with SMTP id 98e67ed59e1d1-32166e27ab1mr4925727a91.6.1754510326195; Wed, 06
 Aug 2025 12:58:46 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:57:05 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-44-seanjc@google.com>
Subject: [PATCH v5 43/44] KVM: x86/pmu: Expose enable_mediated_pmu parameter
 to user space
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Kan Liang <kan.liang@linux.intel.com>, 
	Yongwei Ma <yongwei.ma@intel.com>, Mingwei Zhang <mizhang@google.com>, 
	Xiong Zhang <xiong.y.zhang@linux.intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_125847_472667_13F4F3B7 
X-CRM114-Status: GOOD (  16.70  )
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

From: Dapeng Mi <dapeng1.mi@linux.intel.com>

Expose enable_mediated_pmu parameter to user space, i.e. allow userspace
to enable/disable mediated vPMU support.

Document the mediated versus perf-based behavior as part of the
kernel-parameters.txt entry, and opportunistically add an entry for the
core enable_pmu param as well.

Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../admin-guide/kernel-parameters.txt         | 49 +++++++++++++++++++
 arch/x86/kvm/svm/svm.c                        |  2 +
 arch/x86/kvm/vmx/vmx.c                        |  2 +
 3 files changed, 53 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 07e22ba5bfe3..12a96493de9a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2840,6 +2840,26 @@
 
 			Default is Y (on).
 
+	kvm.enable_pmu=[KVM,X86]
+			If enabled, KVM will virtualize PMU functionality based
+			on the virtual CPU model defined by userspace.  This
+			can be overridden on a per-VM basis via
+			KVM_CAP_PMU_CAPABILITY.
+
+			If disabled, KVM will not virtualize PMU functionality,
+			e.g. MSRs, PMCs, PMIs, etc., even if userspace defines
+			a virtual CPU model that contains PMU assets.
+
+			Note, KVM's vPMU support implicitly requires running
+			with an in-kernel local APIC, e.g. to deliver PMIs to
+			the guest.  Running without an in-kernel local APIC is
+			not supported, though KVM will allow such a combination
+			(with severely degraded functionality).
+
+			See also enable_mediated_pmu.
+
+			Default is Y (on).
+
 	kvm.enable_virt_at_load=[KVM,ARM64,LOONGARCH,MIPS,RISCV,X86]
 			If enabled, KVM will enable virtualization in hardware
 			when KVM is loaded, and disable virtualization when KVM
@@ -2886,6 +2906,35 @@
 			If the value is 0 (the default), KVM will pick a period based
 			on the ratio, such that a page is zapped after 1 hour on average.
 
+	kvm-{amd,intel}.enable_mediated_pmu=[KVM,AMD,INTEL]
+			If enabled, KVM will provide a mediated virtual PMU,
+			instead of the default perf-based virtual PMU (if
+			kvm.enable_pmu is true and PMU is enumerated via the
+			virtual CPU model).
+
+			With a perf-based vPMU, KVM operates as a user of perf,
+			i.e. emulates guest PMU counters using perf events.
+			KVM-created perf events are managed by perf as regular
+			(guest-only) events, e.g. are scheduled in/out, contend
+			for hardware resources, etc.  Using a perf-based vPMU
+			allows guest and host usage of the PMU to co-exist, but
+			incurs non-trivial overhead and can result in silently
+			dropped guest events (due to resource contention).
+
+			With a mediated vPMU, hardware PMU state is context
+			switched around the world switch to/from the guest.
+			KVM mediates which events the guest can utilize, but
+			gives the guest direct access to all other PMU assets
+			when possible (KVM may intercept some accesses if the
+			virtual CPU model provides a subset of hardware PMU
+			functionality).  Using a mediated vPMU significantly
+			reduces PMU virtualization overhead and eliminates lost
+			guest events, but is mutually exclusive with using perf
+			to profile KVM guests and adds latency to most VM-Exits
+			(to context switch PMU state).
+
+			Default is N (off).
+
 	kvm-amd.nested=	[KVM,AMD] Control nested virtualization feature in
 			KVM/SVM. Default is 1 (enabled).
 
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index ca6f453cc160..2797c3ab7854 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -178,6 +178,8 @@ module_param(intercept_smi, bool, 0444);
 bool vnmi = true;
 module_param(vnmi, bool, 0444);
 
+module_param(enable_mediated_pmu, bool, 0444);
+
 static bool svm_gp_erratum_intercept = true;
 
 static u8 rsm_ins_bytes[] = "\x0f\xaa";
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 85bd82d41f94..4a4691beba55 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -151,6 +151,8 @@ module_param_named(preemption_timer, enable_preemption_timer, bool, S_IRUGO);
 extern bool __read_mostly allow_smaller_maxphyaddr;
 module_param(allow_smaller_maxphyaddr, bool, S_IRUGO);
 
+module_param(enable_mediated_pmu, bool, 0444);
+
 #define KVM_VM_CR0_ALWAYS_OFF (X86_CR0_NW | X86_CR0_CD)
 #define KVM_VM_CR0_ALWAYS_ON_UNRESTRICTED_GUEST X86_CR0_NE
 #define KVM_VM_CR0_ALWAYS_ON				\
-- 
2.50.1.565.gc32cd1483b-goog


