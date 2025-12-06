Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3702D3ABC6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 00:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3rwpX75fYsvQxObK18NSjc+CmweVuoOUNJF4J3Ucww=; b=2Ucqn+kkENatZwxL6MzVKckJ8f
	AYZcZXXhbA1im3XZf3csYW+T54Led5wVcyuXrdVAMEVNHTj4+EVHzew/3o5nml35MYcmgoGXLtBxY
	W7Y8yLrfiJ2TPMDUQSlYF0SFVDohmmq+xd7l/nErcfka7UWIH2vw8AOl7bUKz2btFmRtKAhoh62gA
	sD8VTkOvNcq1mumO/0mVCHEafEilgxKVx4OIPkfEwIZ3aHUy4B2LOf1NxUdnsheDD7K6a45fT9Zg+
	iRq7nVOgOPxFogBdlT9+FR7MAYwVHFbbGhqrXvp2XuROyW5ygWk7bFbrTrh6HnymF/P41z27uOH/4
	qSLsuvFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfzs-0000000AEt5-3L1B;
	Sat, 06 Dec 2025 00:18:00 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfzd-0000000AERt-3djn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 00:17:47 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-341616a6fb7so2792730a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 16:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980264; x=1765585064; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=b3rwpX75fYsvQxObK18NSjc+CmweVuoOUNJF4J3Ucww=;
        b=aqHeBxpN3b0g9ZCZl79ABdIKwWNVWwX+A0oarHqj6uL+ibT30mdoBOdRIr8mAbepAI
         8IowVe1lQPimG2zSH/Y7TMjgdH8DM6s8r7iilMxJJOGaP4/MKjBg+Lynt7gI0ewFC66R
         vVjrTlEo9ZbeAzwH2XgHPepyqq2z/0SqMILo3rVKFLuao6hqRI0BI+Ln0C763QQH2W/a
         BOU/aBoEe5K8DXgYUKcgoeWoSbMZVb/OqsEWrbzlgO0wwJXWahx076lBP4Cn/touTms/
         d4g3R0XyC8V7aIsnz53esR5yjEPJJSFD6kog1gBJkrheUAAtepnT4wvfOU8vHAshdEEd
         M2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980264; x=1765585064;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b3rwpX75fYsvQxObK18NSjc+CmweVuoOUNJF4J3Ucww=;
        b=vNJ0Lj1K6u4AKASry8txSw9F2C7rM/3MhsA0QxeoZraFeAzrdXzpC77hsR3ifxNg1U
         hc5seYwN4Mg8i1AoOu7QgEgpGknE1CO0854m+GLBUNLsdM8M5CIZ90uhI/ms75B597g2
         nd74L0CAqHM9CmBg5Bl6MWQFgPJY2ClZV/VGIqMPfEMB0PDBH+9PQ4YTB88k7FDu/mTE
         5/8n4DJIbqPnGP8bWZlItC9WlrLnccE5iZjLF3WrPO35wtQtt6eFsLyWsjupk9ywe9rS
         voViVwuy5+E4lj5dg4LD7rreOyyAPwDKW4Y/U4q5cZW0MF4iaXZw7BP3kVdt6QsXVjJl
         NbQA==
X-Gm-Message-State: AOJu0YxXBkucf57GLu0xmzJ3SUVq52nsRqEOxp/1y/K88lCDb66RmHhT
	F5NZCK4ZG0Wj+m2V/wWh/0QXZDUbP9FPILJwXW00z1YoCuq5fV/Pw8DvzcAVSUoBbyw7E6PBUbF
	DQrfhiQ==
X-Google-Smtp-Source: AGHT+IHEsD7fkDDlHKveCIETTAnzxygk5RYBYlDb1QrkU4F4qH52QVESGYT3XJZIm6BuCoPrCdtcsD42SZs=
X-Received: from pjbbf17.prod.google.com ([2002:a17:90b:b11:b0:33b:dccb:b328])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2750:b0:349:9dc4:fa35
 with SMTP id 98e67ed59e1d1-349a2622069mr652583a91.25.1764980263863; Fri, 05
 Dec 2025 16:17:43 -0800 (PST)
Date: Fri,  5 Dec 2025 16:16:45 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-10-seanjc@google.com>
Subject: [PATCH v6 09/44] perf/x86/core: Add APIs to switch to/from mediated
 PMI vector (for KVM)
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
X-CRM114-CacheID: sfid-20251205_161745_978605_6D9F5566 
X-CRM114-Status: GOOD (  15.32  )
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

Add APIs (exported only for KVM) to switch PMIs to the dedicated mediated
PMU IRQ vector when loading guest context, and back to perf's standard NMI
when the guest context is put.  I.e. route PMIs to
PERF_GUEST_MEDIATED_PMI_VECTOR when the guest context is active, and to
NMIs while the host context is active.

While running with guest context loaded, ignore all NMIs (in perf).  Any
NMI that arrives while the LVTPC points at the mediated PMU IRQ vector
can't possibly be due to a host perf event.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/events/core.c            | 32 +++++++++++++++++++++++++++++++
 arch/x86/include/asm/perf_event.h |  5 +++++
 2 files changed, 37 insertions(+)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index fa6c47b50989..abe6a129a87f 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -55,6 +55,8 @@ DEFINE_PER_CPU(struct cpu_hw_events, cpu_hw_events) = {
 	.pmu = &pmu,
 };
 
+static DEFINE_PER_CPU(bool, guest_lvtpc_loaded);
+
 DEFINE_STATIC_KEY_FALSE(rdpmc_never_available_key);
 DEFINE_STATIC_KEY_FALSE(rdpmc_always_available_key);
 DEFINE_STATIC_KEY_FALSE(perf_is_hybrid);
@@ -1749,6 +1751,25 @@ void perf_events_lapic_init(void)
 	apic_write(APIC_LVTPC, APIC_DM_NMI);
 }
 
+#ifdef CONFIG_PERF_GUEST_MEDIATED_PMU
+void perf_load_guest_lvtpc(u32 guest_lvtpc)
+{
+	u32 masked = guest_lvtpc & APIC_LVT_MASKED;
+
+	apic_write(APIC_LVTPC,
+		   APIC_DM_FIXED | PERF_GUEST_MEDIATED_PMI_VECTOR | masked);
+	this_cpu_write(guest_lvtpc_loaded, true);
+}
+EXPORT_SYMBOL_FOR_MODULES(perf_load_guest_lvtpc, "kvm");
+
+void perf_put_guest_lvtpc(void)
+{
+	this_cpu_write(guest_lvtpc_loaded, false);
+	apic_write(APIC_LVTPC, APIC_DM_NMI);
+}
+EXPORT_SYMBOL_FOR_MODULES(perf_put_guest_lvtpc, "kvm");
+#endif /* CONFIG_PERF_GUEST_MEDIATED_PMU */
+
 static int
 perf_event_nmi_handler(unsigned int cmd, struct pt_regs *regs)
 {
@@ -1756,6 +1777,17 @@ perf_event_nmi_handler(unsigned int cmd, struct pt_regs *regs)
 	u64 finish_clock;
 	int ret;
 
+	/*
+	 * Ignore all NMIs when the CPU's LVTPC is configured to route PMIs to
+	 * PERF_GUEST_MEDIATED_PMI_VECTOR, i.e. when an NMI time can't be due
+	 * to a PMI.  Attempting to handle a PMI while the guest's context is
+	 * loaded will generate false positives and clobber guest state.  Note,
+	 * the LVTPC is switched to/from the dedicated mediated PMI IRQ vector
+	 * while host events are quiesced.
+	 */
+	if (this_cpu_read(guest_lvtpc_loaded))
+		return NMI_DONE;
+
 	/*
 	 * All PMUs/events that share this PMI handler should make sure to
 	 * increment active_events for their events.
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index 49a4d442f3fc..4cd38b9da0ba 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -651,6 +651,11 @@ static inline void perf_events_lapic_init(void)	{ }
 static inline void perf_check_microcode(void) { }
 #endif
 
+#ifdef CONFIG_PERF_GUEST_MEDIATED_PMU
+extern void perf_load_guest_lvtpc(u32 guest_lvtpc);
+extern void perf_put_guest_lvtpc(void);
+#endif
+
 #if defined(CONFIG_PERF_EVENTS) && defined(CONFIG_CPU_SUP_INTEL)
 extern struct perf_guest_switch_msr *perf_guest_get_msrs(int *nr, void *data);
 extern void x86_perf_get_lbr(struct x86_pmu_lbr *lbr);
-- 
2.52.0.223.gf5cc29aaa4-goog


