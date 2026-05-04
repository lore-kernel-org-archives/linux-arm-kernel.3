Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70E9CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 21:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHqwi47gLxulqjFwzyPWRWmJ21m3KfZnivqkYOWLGBw=; b=DhA1RyYNr9EqphqWThdYyjk99Y
	OqT1bpzYeoyN99DmH+2vXRHHEMAt42RtzNT5zo+EF1natEtqWt0AsxTi2oNA4Y+ZpDMCUuy6R6VnT
	vbMsnGUD3E8B3DK8sr/RIwA8WAYyvdFNvEVEo5pwbL6J5ztw4e+dEX88NupXIKR1RdOWGz6svkpL+
	+lDmsg4rgGyimDWO+jHiNECE2Faty0MVF5RBE7UGf6R7NrrYZeGQFOjokhFGHB2SyvA0vR7Fyb4Cw
	TNG5R3E3vvlN5XHtJUIFDdpTObLfzW6ZceWAtg/LOxkqRSebLdYhHfJ1J+UJWT72LEqUk5RAKsw+/
	rGWFTf+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0gj-0000000ELcK-0Ym7;
	Mon, 04 May 2026 21:18:49 +0000
Received: from mail-ot1-x34a.google.com ([2607:f8b0:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0gg-0000000ELUK-0CMO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 21:18:47 +0000
Received: by mail-ot1-x34a.google.com with SMTP id 46e09a7af769-7dbd50dee52so11811785a34.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 14:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777929524; x=1778534324; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IHqwi47gLxulqjFwzyPWRWmJ21m3KfZnivqkYOWLGBw=;
        b=oThlVjJJ5JgfmjWiYZB+ymyILuiypISsmztXjwIYriIqljd4J6PGoqNlHTDuE8xNRi
         r8DcWBzCoEiP4QKyGxkNIvU5Mj9xuJiTcA503IitEqMKrqEWuBOWJTXUI7HHatljess2
         inm5SLNQorUjFLlr/EL5UKaiHTzHKumzO3XLfCKB1j5G00M7TZLXUYoqI3AFCoZi3DE/
         O526DHMZ3l1J3Zo7QkNN5AunokyI0pS9M/qMJS7/qSRos9/lvQx6qfMrSvPvdLB6LiwU
         exmO6Zen8/D9ccekUgOpHDhqsDdERzMjbkcIW1pA5uQsdPIzEK0lm9XWb7me0u5JbWLv
         dl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777929524; x=1778534324;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IHqwi47gLxulqjFwzyPWRWmJ21m3KfZnivqkYOWLGBw=;
        b=fUgUvZphWxrB2W4yvUu4ePtwQIHoi32ehJdPk91BeM9nV4P1p01xqSNePSHRIVJ0Nq
         qGfhSx4CmvpsUIXgcLSah7pX3n8oR89YkH2S9p9eOwgISpZVNA8K43AN6JtRxFpdwu2W
         1+shDp3Klk5N0TS++h5atTPbrVS4r3FGX9jRk+UJ0a/vf1WiaIpjP0GGv+gpBDxHtBR6
         nzjoaU2l1SMZyv/29Lsa48xMUyeFKgaCUvi/DAH0fT5b0Qswrb8Tu8711AMAQxc4dODp
         rQk84szskvv5v4BvySVJbNjgOHIi+9ZiDaaKrouGRMaQAsZxZd0K/u53d8QT6dA8Wmik
         JgwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+pleC2EXZX23/qLWyHtJr9b6w2FwqgfkKRMdVZK5a7PgHmMSbpGICzJfMLQEf6W3lY51AdTYPdRX1pTnZVLw+c@lists.infradead.org
X-Gm-Message-State: AOJu0YyLfkSUrFtfXy0Ljq9y+wssm9GfdUw7q1SebmF52ckf+mIGti3x
	vuCTbdG/Dc9uZ5L/ppS9u3k77kfKISmRu6VoMVbKTUIBKUwqOxwVlbEooGWIVwUyJszGk2sgft1
	oZPqcLAcoRXvZ8q+RV4kz/S78cw==
X-Received: from iods12.prod.google.com ([2002:a05:6602:324c:b0:96b:30a7:3dc9])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:211:b0:696:8278:c619 with SMTP id 006d021491bc7-696979ad7d2mr5858531eaf.6.1777929523888;
 Mon, 04 May 2026 14:18:43 -0700 (PDT)
Date: Mon,  4 May 2026 21:18:05 +0000
In-Reply-To: <20260504211813.1804997-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260504211813.1804997-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260504211813.1804997-13-coltonlewis@google.com>
Subject: [PATCH v7 12/20] perf: Add perf_pmu_resched_update()
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	James Clark <james.clark@linaro.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_141846_096704_10D92BCF 
X-CRM114-Status: GOOD (  16.34  )
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

To modify PMU guest counter reservations dynamically, we need to
update the available counters safely.

Introduce perf_pmu_resched_update() to allow updating the PMU struct
in between scheduling perf events out and scheduling them back in
again. It takes a callback operation to call in between schedule out
and schedule in. This accomplishes the goal with minimal perf API
expansion.

Refactor ctx_resched call the callback in the right place.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 include/linux/perf_event.h |  3 +++
 kernel/events/core.c       | 28 +++++++++++++++++++++++++---
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 48d851fbd8ea5..a08db3ee38b10 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1242,6 +1242,9 @@ extern int perf_event_task_disable(void);
 extern int perf_event_task_enable(void);
 
 extern void perf_pmu_resched(struct pmu *pmu);
+extern void perf_pmu_resched_update(struct pmu *pmu,
+				    void (*update)(struct pmu *, void *),
+				    void *data);
 
 extern int perf_event_refresh(struct perf_event *event, int refresh);
 extern void perf_event_update_userpage(struct perf_event *event);
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 89b40e4397177..62fec73caabad 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -2983,9 +2983,10 @@ static void perf_event_sched_in(struct perf_cpu_context *cpuctx,
  * event_type is a bit mask of the types of events involved. For CPU events,
  * event_type is only either EVENT_PINNED or EVENT_FLEXIBLE.
  */
-static void ctx_resched(struct perf_cpu_context *cpuctx,
-			struct perf_event_context *task_ctx,
-			struct pmu *pmu, enum event_type_t event_type)
+static void __ctx_resched(struct perf_cpu_context *cpuctx,
+			  struct perf_event_context *task_ctx,
+			  struct pmu *pmu, enum event_type_t event_type,
+			  void (*update)(struct pmu *, void *), void *data)
 {
 	bool cpu_event = !!(event_type & EVENT_CPU);
 	struct perf_event_pmu_context *epc;
@@ -3021,6 +3022,9 @@ static void ctx_resched(struct perf_cpu_context *cpuctx,
 	else if (event_type & EVENT_PINNED)
 		ctx_sched_out(&cpuctx->ctx, pmu, EVENT_FLEXIBLE);
 
+	if (update)
+		update(pmu, data);
+
 	perf_event_sched_in(cpuctx, task_ctx, pmu, 0);
 
 	for_each_epc(epc, &cpuctx->ctx, pmu, 0)
@@ -3032,6 +3036,24 @@ static void ctx_resched(struct perf_cpu_context *cpuctx,
 	}
 }
 
+static void ctx_resched(struct perf_cpu_context *cpuctx,
+			struct perf_event_context *task_ctx,
+			struct pmu *pmu, enum event_type_t event_type)
+{
+	__ctx_resched(cpuctx, task_ctx, pmu, event_type, NULL, NULL);
+}
+
+void perf_pmu_resched_update(struct pmu *pmu, void (*update)(struct pmu *, void *), void *data)
+{
+	struct perf_cpu_context *cpuctx = this_cpu_ptr(&perf_cpu_context);
+	struct perf_event_context *task_ctx = cpuctx->task_ctx;
+
+	perf_ctx_lock(cpuctx, task_ctx);
+	__ctx_resched(cpuctx, task_ctx, pmu, EVENT_ALL|EVENT_CPU, update, data);
+	perf_ctx_unlock(cpuctx, task_ctx);
+}
+EXPORT_SYMBOL_GPL(perf_pmu_resched_update);
+
 void perf_pmu_resched(struct pmu *pmu)
 {
 	struct perf_cpu_context *cpuctx = this_cpu_ptr(&perf_cpu_context);
-- 
2.54.0.545.g6539524ca2-goog


