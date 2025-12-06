Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF3FD3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 00:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FylYYLVT0WTXptfl4HpO9XPf05XgvSaO59C95hLudDA=; b=ZUVTns9DbqSamlPXZlm63ST3gw
	bDtsiOeR9oJsRHSJCCr1lYVh4GASi4fyBS1YRGSKcijpTP8hjwpLcYykykiLrl/inPncjPsI6YOXJ
	/4xs7bX4yJqYRf1qG8EnL+EfVhokM29dbkzgp4itjcvMK4Z1nXUc2wOxAJuW34sWU+vAncVMSvGz0
	e33jfamew91MO1FiJ/hyyf2m9+Ib0qqU/b+e8n+2B70j83RWXgSoRLxSaeJSdzrbolSzicenysdlE
	0Y08KVjoHhIi8NIXkHP4jsUHSmEg1ZvL639UcKpiAOYFTctsSoPGp1NcVLNw5lT9bnFiv537h6yfR
	Eb5suDtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfzm-0000000AEih-2svV;
	Sat, 06 Dec 2025 00:17:54 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfzZ-0000000AEKa-2O7V
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 00:17:43 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso3026390a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 16:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980260; x=1765585060; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=FylYYLVT0WTXptfl4HpO9XPf05XgvSaO59C95hLudDA=;
        b=jCT2c14W3ZbPVoNUafuNvmuRZCxlWtOTiKQVMVgyLkL6CG5YB95f8Q6+Vs5NVh9r2B
         DE9MdsJjGz9wZXbQr8fynuVe7N1DJ102OjrDoP5RMp4F2rveR83JYZj69wD1RmyBPokt
         tFWEeGAMx8P6ry4for3fft0aFyXGes/86D8fzd2U6bI3pWAZo7NPMBY3r9DyEbFeb3JC
         Bkxjv3cknq3L9xrBiktvM3JoKK0GonjBwJc5yvmwul9n/N9QEVCFEF9A7112dTEk6EUo
         sbGfQH/MjzrG1ftxzUM5Ks7qdySZddEB3rRjQzc00CHZnkxPBJLa2Ef9O+vGYjWNlQoR
         iKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980260; x=1765585060;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FylYYLVT0WTXptfl4HpO9XPf05XgvSaO59C95hLudDA=;
        b=t1ToW/dR3BjoyYCK4dzvqeARTUYOhNVfx6bwewOe0nW1YfF9+8QI80vMj5jn/UDDul
         kgJ5j3D3CjGWA05pvxAfHnGdVISgeNAQuEtlotwT+nWNp9CixWESldSynGpl9UT0l3GK
         jcHNArwatk7Jp5Cx/uapKpAhTFx+LYdLmMYsAUMjkqdEDvKop4eFGiMIHlRoXMBlIExu
         1gtjOLZXb15vsRZc9MylJlU6KX00gotCJHETVUsTCWpqfTTrOelsQlny5hAauf6uFKWY
         7JUPGWlGv0Hhxg05CIRoWftv+qGw3xa6r8oUYP7AOuqnjCnNsVRmPrGYpwoaOdQiPMBT
         775A==
X-Gm-Message-State: AOJu0YyFUCqtpjc9k+Y4aroJBn+CF2oujpC/BFJMdtV23dnn/0Wyv4Gw
	uZOfV/l8NwlKSEQBfPN7YtQzk1uz5TYQ0iPsDpofZtXm0fv4y3LIb8RvGWvYhaigcDOLsurfz0I
	Dkp9QjQ==
X-Google-Smtp-Source: AGHT+IFoT/ixFxXWDXJBPVNPACu7PrN8IiUqBDaVd9+tgekzVLP1tDFd7WsI6N47bV9683aut9/Cc/2CP5c=
X-Received: from pjtl17.prod.google.com ([2002:a17:90a:c591:b0:349:1598:173b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4acf:b0:340:d06d:ea73
 with SMTP id 98e67ed59e1d1-349a2686512mr571973a91.19.1764980260147; Fri, 05
 Dec 2025 16:17:40 -0800 (PST)
Date: Fri,  5 Dec 2025 16:16:43 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-8-seanjc@google.com>
Subject: [PATCH v6 07/44] perf: Add APIs to load/put guest mediated PMU context
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
X-CRM114-CacheID: sfid-20251205_161741_742671_C5026674 
X-CRM114-Status: GOOD (  12.41  )
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

From: Kan Liang <kan.liang@linux.intel.com>

Add exported APIs to load/put a guest mediated PMU context.  KVM will
load the guest PMU shortly before VM-Enter, and put the guest PMU shortly
after VM-Exit.

On the perf side of things, schedule out all exclude_guest events when the
guest context is loaded, and schedule them back in when the guest context
is put.  I.e. yield the hardware PMU resources to the guest, by way of KVM.

Note, perf is only responsible for managing host context.  KVM is
responsible for loading/storing guest state to/from hardware.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
[sean: shuffle patches around, write changelog]
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/perf_event.h |  2 ++
 kernel/events/core.c       | 61 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index eaab830c9bf5..cfc8cd86c409 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1925,6 +1925,8 @@ extern u64 perf_event_pause(struct perf_event *event, bool reset);
 #ifdef CONFIG_PERF_GUEST_MEDIATED_PMU
 int perf_create_mediated_pmu(void);
 void perf_release_mediated_pmu(void);
+void perf_load_guest_context(void);
+void perf_put_guest_context(void);
 #endif
 
 #else /* !CONFIG_PERF_EVENTS: */
diff --git a/kernel/events/core.c b/kernel/events/core.c
index f72d4844b05e..81c35859e6ea 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -469,10 +469,19 @@ static cpumask_var_t perf_online_pkg_mask;
 static cpumask_var_t perf_online_sys_mask;
 static struct kmem_cache *perf_event_cache;
 
+#ifdef CONFIG_PERF_GUEST_MEDIATED_PMU
+static DEFINE_PER_CPU(bool, guest_ctx_loaded);
+
+static __always_inline bool is_guest_mediated_pmu_loaded(void)
+{
+	return __this_cpu_read(guest_ctx_loaded);
+}
+#else
 static __always_inline bool is_guest_mediated_pmu_loaded(void)
 {
 	return false;
 }
+#endif
 
 /*
  * perf event paranoia level:
@@ -6385,6 +6394,58 @@ void perf_release_mediated_pmu(void)
 	atomic_dec(&nr_mediated_pmu_vms);
 }
 EXPORT_SYMBOL_GPL(perf_release_mediated_pmu);
+
+/* When loading a guest's mediated PMU, schedule out all exclude_guest events. */
+void perf_load_guest_context(void)
+{
+	struct perf_cpu_context *cpuctx = this_cpu_ptr(&perf_cpu_context);
+
+	lockdep_assert_irqs_disabled();
+
+	guard(perf_ctx_lock)(cpuctx, cpuctx->task_ctx);
+
+	if (WARN_ON_ONCE(__this_cpu_read(guest_ctx_loaded)))
+		return;
+
+	perf_ctx_disable(&cpuctx->ctx, EVENT_GUEST);
+	ctx_sched_out(&cpuctx->ctx, NULL, EVENT_GUEST);
+	if (cpuctx->task_ctx) {
+		perf_ctx_disable(cpuctx->task_ctx, EVENT_GUEST);
+		task_ctx_sched_out(cpuctx->task_ctx, NULL, EVENT_GUEST);
+	}
+
+	perf_ctx_enable(&cpuctx->ctx, EVENT_GUEST);
+	if (cpuctx->task_ctx)
+		perf_ctx_enable(cpuctx->task_ctx, EVENT_GUEST);
+
+	__this_cpu_write(guest_ctx_loaded, true);
+}
+EXPORT_SYMBOL_GPL(perf_load_guest_context);
+
+void perf_put_guest_context(void)
+{
+	struct perf_cpu_context *cpuctx = this_cpu_ptr(&perf_cpu_context);
+
+	lockdep_assert_irqs_disabled();
+
+	guard(perf_ctx_lock)(cpuctx, cpuctx->task_ctx);
+
+	if (WARN_ON_ONCE(!__this_cpu_read(guest_ctx_loaded)))
+		return;
+
+	perf_ctx_disable(&cpuctx->ctx, EVENT_GUEST);
+	if (cpuctx->task_ctx)
+		perf_ctx_disable(cpuctx->task_ctx, EVENT_GUEST);
+
+	perf_event_sched_in(cpuctx, cpuctx->task_ctx, NULL, EVENT_GUEST);
+
+	if (cpuctx->task_ctx)
+		perf_ctx_enable(cpuctx->task_ctx, EVENT_GUEST);
+	perf_ctx_enable(&cpuctx->ctx, EVENT_GUEST);
+
+	__this_cpu_write(guest_ctx_loaded, false);
+}
+EXPORT_SYMBOL_GPL(perf_put_guest_context);
 #else
 static int mediated_pmu_account_event(struct perf_event *event) { return 0; }
 static void mediated_pmu_unaccount_event(struct perf_event *event) {}
-- 
2.52.0.223.gf5cc29aaa4-goog


