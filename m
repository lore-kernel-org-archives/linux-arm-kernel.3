Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A088C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 06:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Dv5Ac6SPOdtGgS0tmgxnxoVXUMjLjqcjHEmAbg0F2U=; b=Xeh877V59CfWZ1yu8/AkIXiJXv
	04A82cCI5JDaILQu022HnRyaGsFeVJiMtHJEsGxruXTP1bhW30ff5mwbdN0AaUJkuroiLQF1GaO5M
	+mEqCnINIzoszsh5YPoyzbsgg1kBJnhH7rix/ksyO2eStaHiLPj4K8YTAqkxpfFlcY6bDpm5RxSVS
	ceL5fjwgfLey5nR/m0oPCkyBET4iBdhDA1EK1dpTnyagz2mBFqqj0gmuSxOO4OccMPzDbgaZZxye9
	WtK0gFy4uTX7/RcjIWngd3NLfdtDOo5uZ3ehBFx1+a5ZZcQK1zU9SHCA1QJi1Mf7gCBV/ec2bxIV3
	fDH2QWgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thMpu-0000000GJxI-0Gm4;
	Mon, 10 Feb 2025 06:00:02 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thMoW-0000000GJhs-0acK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 05:58:37 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-21f49f0bd8fso52047675ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Feb 2025 21:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739167114; x=1739771914; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2Dv5Ac6SPOdtGgS0tmgxnxoVXUMjLjqcjHEmAbg0F2U=;
        b=fPK/FMZf8WCViePkpMBXiEw2zDJ+o2lmooMjU8LHtbc2ztDskqyscW64kZ0807Mu/G
         kObtMK2OD/5sVZRfMEjzYZXQqwqBfDrD8Th/Dnq0OujGKwS4hRyQ66F3OqU5R9ra5Gqo
         kiUDIEOTEeS9qQe8lkLL6YQpyhneZL6BDLPKv6Bp6nTbDXfzFCnWPAhnj5JiBa7OS7py
         59jr54FLUa4Ap9Q3razEjk4umn+gX+PYzze5yNVsRFcJjYanCqyS6JbLyCYCqL8VPHmo
         efkxKmMe3ip1EvUfI2yuh9vDyNCmk8BIuQdlSjdhkSoO5fNM00GU1WfQuKWz86P35qCe
         beyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739167114; x=1739771914;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Dv5Ac6SPOdtGgS0tmgxnxoVXUMjLjqcjHEmAbg0F2U=;
        b=M3Kcz+3eo5T8DL7CS9kuwA/6pXgIAnhNSV0utPquAoeuZCWNOogFZeMVu8w1+idm/a
         0eZowDvjrMUvQ3OluFLb1g3/j4X30UMOQg3QWairjWyZhYG26SLL8Sz94CTliqwWByJd
         5xUm5MrT4f9IMtYhEDhGlNdb5Hd7TMjr2s2ryabptLM8LcWEO0vjtyLTY1ToIAcWHCdr
         cFdaHOSfTWgfpYUyxFO7GHmfFcRcHhL3awlTV4457/cfdUTRhXiYzB6R0GzNiYSKNMub
         c8xmKO1JDPDcrEgjwidgGSJkHwL7BnnClWkIswLAlnlbB5Xt7+WSDCmkgjA6iYF7y3aO
         +onQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUtPUWsrwAYRPQZFsj1hNkncpRM86t7G65ndxdSYgtqaydnKbFLVIYi191IiBDMd7KiEmEmtefhbsCmqNb5NuY@lists.infradead.org
X-Gm-Message-State: AOJu0YyzLo9+DUOmW9ms0neKqsWIVpladXb+T1nRrlXkH8EwqxNmr0qY
	qwZcqaKGI+aCVx1ruJJkdRbCBBoRg70Jp3oBnHKkHoVkjoynKACuvzS5VG6oNgmWOF1gog==
X-Google-Smtp-Source: AGHT+IG9+tJP7rcVhYR2srzYJXFwTOg0EBXRqoEhYIHwOJw5Kqc+b20iAmM0LQw/LoJ0TYVsQm3UCyyp
X-Received: from plwh12.prod.google.com ([2002:a17:902:f7cc:b0:21f:314b:a317])
 (user=keyz job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:40d0:b0:216:6769:9ed7
 with SMTP id d9443c01a7336-21f4e73bca0mr220424795ad.40.1739167114209; Sun, 09
 Feb 2025 21:58:34 -0800 (PST)
Date: Mon, 10 Feb 2025 13:58:28 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250210055828.1875372-1-keyz@google.com>
Subject: [PATCH v5 RESEND] cpuidle: psci: Add trace for PSCI domain idle
From: Keita Morisaki <keyz@google.com>
To: linux-kernel@vger.kernel.org, lpieralisi@kernel.org, sudeep.holla@arm.com, 
	rafael@kernel.org, daniel.lezcano@linaro.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Cc: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, aarontian@google.com, 
	yimingtseng@google.com, Keita Morisaki <keyz@google.com>, Dhruva Gole <d-gole@ti.com>, 
	Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_215836_195486_96223977 
X-CRM114-Status: GOOD (  12.00  )
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

The trace event cpu_idle provides insufficient information for debugging
PSCI requests due to lacking access to determined PSCI domain idle
states. The cpu_idle usually only shows -1, 0, or 1 regardless how many
idle states the power domain has.

Add new trace events namely psci_domain_idle_enter and
psci_domain_idle_exit to trace enter and exit events with a determined
idle state.

These new trace events will help developers debug CPUidle issues on ARM
systems using PSCI by providing more detailed information about the
requested idle states.

Signed-off-by: Keita Morisaki <keyz@google.com>
Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
---
v1->v2: Split the ftrace event into two (psci_domain_idle_(enter|exit))
        and rephrase the commit message accordingly. Rebased onto the latest.
v2->v3: Add "Reviewed-by: Steven Rostedt"
v3->v4: Add the Tested-by label
v4->v5: Add "Reviewed-by: Dhruva Gole"

Hopefully this patch gets attention from maintainers of
drivers/cpuidle/cpuidle-psci.c too.

 drivers/cpuidle/cpuidle-psci.c |  3 +++
 include/trace/events/power.h   | 37 ++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index 2562dc001fc1..dd8d776d6e39 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -25,6 +25,7 @@
 #include <linux/syscore_ops.h>

 #include <asm/cpuidle.h>
+#include <trace/events/power.h>

 #include "cpuidle-psci.h"
 #include "dt_idle_states.h"
@@ -74,7 +75,9 @@ static __cpuidle int __psci_enter_domain_idle_state(struct cpuidle_device *dev,
 	if (!state)
 		state = states[idx];

+	trace_psci_domain_idle_enter(dev->cpu, state, s2idle);
 	ret = psci_cpu_suspend_enter(state) ? -1 : idx;
+	trace_psci_domain_idle_exit(dev->cpu, state, s2idle);

 	if (s2idle)
 		dev_pm_genpd_resume(pd_dev);
diff --git a/include/trace/events/power.h b/include/trace/events/power.h
index d2349b6b531a..9253e83b9bb4 100644
--- a/include/trace/events/power.h
+++ b/include/trace/events/power.h
@@ -62,6 +62,43 @@ TRACE_EVENT(cpu_idle_miss,
 		(unsigned long)__entry->state, (__entry->below)?"below":"above")
 );

+DECLARE_EVENT_CLASS(psci_domain_idle,
+
+	TP_PROTO(unsigned int cpu_id, unsigned int state, bool s2idle),
+
+	TP_ARGS(cpu_id, state, s2idle),
+
+	TP_STRUCT__entry(
+		__field(u32,		cpu_id)
+		__field(u32,		state)
+		__field(bool,		s2idle)
+	),
+
+	TP_fast_assign(
+		__entry->cpu_id = cpu_id;
+		__entry->state = state;
+		__entry->s2idle = s2idle;
+	),
+
+	TP_printk("cpu_id=%lu state=0x%lx is_s2idle=%s",
+		  (unsigned long)__entry->cpu_id, (unsigned long)__entry->state,
+		  (__entry->s2idle)?"yes":"no")
+);
+
+DEFINE_EVENT(psci_domain_idle, psci_domain_idle_enter,
+
+	TP_PROTO(unsigned int cpu_id, unsigned int state, bool s2idle),
+
+	TP_ARGS(cpu_id, state, s2idle)
+);
+
+DEFINE_EVENT(psci_domain_idle, psci_domain_idle_exit,
+
+	TP_PROTO(unsigned int cpu_id, unsigned int state, bool s2idle),
+
+	TP_ARGS(cpu_id, state, s2idle)
+);
+
 TRACE_EVENT(powernv_throttle,

 	TP_PROTO(int chip_id, const char *reason, int pmax),

base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
--
2.48.1.362.g079036d154-goog

