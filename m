Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5994DC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 21:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbLaYrBpG9GN/ccdjbZmNVq0IkY2pKSaCp1hoLzaUb8=; b=X5hq82urQ+jVFvvn9TxKImDNV9
	ZrxPnIVa6NeknvVTgbcWdYJAjqWtHE3XMkiEFaomI7k4JkghkORNYoTE4XQ5xLzxIFbYUbZBSKMm6
	rvUAI9ne2BmvyLWa0gqWuG7Qc9loIWjMrIGTmYP2JLH2oSWcZYabBZhOPKWj9vsBvKnFCFDj3rdrB
	G5YIjrkxyfkF9vwMDO3NqPX0B+b/eL3zk9Tkw8y9FKDJ5F9bzw/V3osyiMqgS3buPRS1zqu9c4PPq
	aX3vMuOBOlfvAB0RF5Re8u0NFfdXM32ZPmpibO8vADuGZhgCJjOoxYak3Ztf0AJmd8rN+FXyjO9KP
	+55lsP9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujlr8-0000000GbDL-2X7d;
	Wed, 06 Aug 2025 21:39:30 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkHX-0000000GH69-0E2Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:40 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-315af08594fso334943a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 12:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510318; x=1755115118; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=mbLaYrBpG9GN/ccdjbZmNVq0IkY2pKSaCp1hoLzaUb8=;
        b=hAlmWW7vSG+wB8smuogT3F4zAdviHvJRl49YAmSHjfGABOhma4SImQDxhsMZYnOxSR
         0+iTm+kKYzHyIo2MchGk1mAjswXck5RflgaRFeeQKtvemG0Y8ib3FEyDXdsSo3d1Iqjl
         njESY/4XbL9AesNwUHoStIl8lQnniFUWG6R802/jIJLe9XIW1qoK5KgaPIM8JWwn2tvx
         SCQ+U2ZXODtlrumgJoScgPUHqx/+trME3ewHTGqAjICJ4bawflEy9FNrDOolY3cyiExW
         U88nQCV0ExFtbI3ApGDYTiZZEsLMZp2SI84TfyVwyu29LtDaPd6oQG0XBWshAcXnavZy
         T4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510318; x=1755115118;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbLaYrBpG9GN/ccdjbZmNVq0IkY2pKSaCp1hoLzaUb8=;
        b=JNfR8ZSsamonnq6yaI2j+VaFjKBuUvuGuuVnKc70DffPbNxreCjIo1Q1MizevBvFCs
         /lDAGBvXwuMDB75EKbXsCGolibe87CNubTqp8M7GKOTCO6UH27iUyliCv1Dq5k4EDIcx
         i3Fi//iEiZxPWJB3MsUnTTdQ1CyyRLgSX02kcz4eNfTyV5u2VATiQrquN4LEZBQ3xzw5
         OaS8eDHLd5xjfsK2Duo5JWWWegkwWdwgzqYngbHniH0X5k1hUEmiz8tOm5/l1ZtDUp8k
         upVLwjDLSCpfXEy8G7WpyAuaOneI9nPsNc1wczakRivXflsXLgJ3EdNGeXWCqkSzbDBf
         8Jpg==
X-Gm-Message-State: AOJu0YxHiGEOlPEPzV3WziAW1z0aBBDCPus5W4M/1hEw0gIbuVpgYTHj
	sEKMyFU7Z7BqJrFBB6kDy7lriqXdTl4jE9lt5Oio46Um1onCyBXcx+6E8NTpdtvXTRRv0mYcktr
	Y7eVyCQ==
X-Google-Smtp-Source: AGHT+IG1RDTXadNPV+CIxuchWnyR7MvCJdJx9iRkBiPVNpyV8SP3VNbt+vP90Pa+IEkbzbifDn/Htni5q5g=
X-Received: from pjzd15.prod.google.com ([2002:a17:90a:e28f:b0:312:151d:c818])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a04:b0:31e:6f0a:6a1a
 with SMTP id 98e67ed59e1d1-32166dfac71mr5462707a91.3.1754510317778; Wed, 06
 Aug 2025 12:58:37 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:57:00 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-39-seanjc@google.com>
Subject: [PATCH v5 38/44] KVM: x86/pmu: Disallow emulation in the fastpath if
 mediated PMCs are active
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
X-CRM114-CacheID: sfid-20250806_125839_107593_3F224FD0 
X-CRM114-Status: GOOD (  12.79  )
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

Don't handle exits in the fastpath if emulation is required, i.e. if an
instruction needs to be skipped, the mediated PMU is enabled, and one or
more PMCs is counting instructions.  With the mediated PMU, KVM's cache of
PMU state is inconsistent with respect to hardware until KVM exits the
inner run loop (when the mediated PMU is "put").

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.h | 10 ++++++++++
 arch/x86/kvm/x86.c |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/x86/kvm/pmu.h b/arch/x86/kvm/pmu.h
index e2e2d8476a3f..a0cd42cbea9d 100644
--- a/arch/x86/kvm/pmu.h
+++ b/arch/x86/kvm/pmu.h
@@ -234,6 +234,16 @@ static inline bool pmc_is_globally_enabled(struct kvm_pmc *pmc)
 	return test_bit(pmc->idx, (unsigned long *)&pmu->global_ctrl);
 }
 
+static inline bool kvm_pmu_is_fastpath_emulation_allowed(struct kvm_vcpu *vcpu)
+{
+	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
+
+	return !kvm_vcpu_has_mediated_pmu(vcpu) ||
+	       !bitmap_intersects(pmu->pmc_counting_instructions,
+				  (unsigned long *)&pmu->global_ctrl,
+				  X86_PMC_IDX_MAX);
+}
+
 void kvm_pmu_deliver_pmi(struct kvm_vcpu *vcpu);
 void kvm_pmu_handle_event(struct kvm_vcpu *vcpu);
 int kvm_pmu_rdpmc(struct kvm_vcpu *vcpu, unsigned pmc, u64 *data);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 7fb94ef64e18..6bdf7ef0b535 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -2092,6 +2092,9 @@ EXPORT_SYMBOL_GPL(kvm_emulate_invd);
 
 fastpath_t handle_fastpath_invd(struct kvm_vcpu *vcpu)
 {
+	if (!kvm_pmu_is_fastpath_emulation_allowed(vcpu))
+		return EXIT_FASTPATH_NONE;
+
 	if (!kvm_emulate_invd(vcpu))
 		return EXIT_FASTPATH_EXIT_USERSPACE;
 
@@ -2151,6 +2154,9 @@ fastpath_t handle_fastpath_set_msr_irqoff(struct kvm_vcpu *vcpu)
 	u64 data = kvm_read_edx_eax(vcpu);
 	u32 msr = kvm_rcx_read(vcpu);
 
+	if (!kvm_pmu_is_fastpath_emulation_allowed(vcpu))
+		return EXIT_FASTPATH_NONE;
+
 	switch (msr) {
 	case APIC_BASE_MSR + (APIC_ICR >> 4):
 		if (!lapic_in_kernel(vcpu) || !apic_x2apic_mode(vcpu->arch.apic) ||
@@ -11267,6 +11273,9 @@ EXPORT_SYMBOL_GPL(kvm_emulate_halt);
 
 fastpath_t handle_fastpath_hlt(struct kvm_vcpu *vcpu)
 {
+	if (!kvm_pmu_is_fastpath_emulation_allowed(vcpu))
+		return EXIT_FASTPATH_NONE;
+
 	if (!kvm_emulate_halt(vcpu))
 		return EXIT_FASTPATH_EXIT_USERSPACE;
 
-- 
2.50.1.565.gc32cd1483b-goog


