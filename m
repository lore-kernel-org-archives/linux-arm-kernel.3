Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D825ACD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 19:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ld//V/f0QfaYRycD8rujhv5xi8e1YzlAhgupiZPHoEU=; b=0C99VgWtuWl292BM1jJx/yOAVM
	sCn2cesOpebrDcCmKqH5yDfTCSqk9qPDgoJ7LDp8v3lpu+tMUo7vAnRTAS8NEO2a3qO+GCUlODknF
	SLqQuSSm51flu3LJbdtJxwXTkL/AuFni+QtdwciDhQWegGu+9M4hkW6KozkxKjsuFzKHqZY+X9hVx
	/iupybA6wPYZSmXJ2OGaobZCsgAdcU+EpOYu31+22Co+PvvBa7hE9Iue9ndDjub0isdzI6qrRx+Ur
	yoXvlPKuRLvbRKQO2mV1JSo/uXL1g7noS9AbOwGUTTumqXGPmBGUWgC/GYlKyezpHLR4Dv9tc0KWf
	sHTF194Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7ZN-0000000BSeL-27Yf;
	Fri, 12 Jun 2026 19:29:33 +0000
Received: from mail-ot1-x34a.google.com ([2607:f8b0:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7ZE-0000000BSSS-1cmN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 19:29:25 +0000
Received: by mail-ot1-x34a.google.com with SMTP id 46e09a7af769-7e6b5976d74so2621881a34.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 12:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781292563; x=1781897363; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ld//V/f0QfaYRycD8rujhv5xi8e1YzlAhgupiZPHoEU=;
        b=JZmaV/p55+EsRg5tWz5cvkygwK3X6uaU46CKcbNvXKurx2hlEnO2irRTRNB99ZpJwg
         +ryPp5Yomb/oeVfN07Cb3nuLIO4XHyr6nPkwYdjY+WuJ7HXeNgyDRXzHNCfcEwhYbHWU
         8FemMHQ2SU2QJjFf4hdreK1rrKb6ObVb4hYs3ncmWaVf46crxiEO571HQBKn3EHmFLUl
         8hPnDIBP/sR1bBTuig8caSUUpJ9+Cjt6LshgFh/p/QFmfPgtqWCr7bkqy6WmWSxVRIZt
         t7YwLf2vhU38prw3+R+xTAwsT0vHZOzMdQoYtue1pyYf575S1EViVqgzLWVTqXyjbTg4
         DrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292563; x=1781897363;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ld//V/f0QfaYRycD8rujhv5xi8e1YzlAhgupiZPHoEU=;
        b=GF8ErNmEhqI2IbRRz++2M/sYToFWFNZrmC0s3tKWBJnd/uOK7YjN98vq9mh2/DV8ig
         +Wcixub9Jw3KE+tqzHpGRDHI7kWRLyyw27G+NR7c112YHjcpwnYzsiZoND0KAwPpff5v
         sxJYKyQeuAlqVfkzAFFIK5aLhD+9mMtV5Mmn6sAV7WLvXZvNPV+8w7Zu5sARn9ZnL3Yn
         ch4Z8iJpGyyqy/nQ+C7wI17dgxKU2w+/C64DPvOM1+2OGBReW98xOYUcqVcrRKP6BZOA
         M2L65umsh8yWs54AcYHhsfR+cCMNCnFlNdjWH/Xr4iOGk0y9scy/4WcjvWPoDd4mKO6j
         XU/g==
X-Forwarded-Encrypted: i=1; AFNElJ9tupCdQxh0Io5+2r35iT65gj6Qd4ENBHnxgS63+0BRcrL6OJvZzKDcLV/mcfTuYPi7qvH1+JvbMavtEApSPWHG@lists.infradead.org
X-Gm-Message-State: AOJu0YyS3fuetX1MEy7KpGmJmh82xmtj1nKz6uw0ZLtujnJG7B8e1uR1
	CNwDNyWnUZDYSqhSt0GK9ufwXLcXtVmzSA9LebZFhlEnq5Bc8f9sCtxFzBuu0lWtghG8yWqGLxD
	HbRtqaBRr5oCD+y5CN8lJyYyiHQ==
X-Received: from jaan16-n2.prod.google.com ([2002:a05:6638:aad0:20b0:5e2:7885:115c])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3020:b0:485:1173:2e4b with SMTP id 5614622812f47-48741c5f737mr622385b6e.37.1781292562500;
 Fri, 12 Jun 2026 12:29:22 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:29:01 +0000
In-Reply-To: <20260612192909.1153907-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260612192909.1153907-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612192909.1153907-14-coltonlewis@google.com>
Subject: [PATCH 13/21] perf: Add perf_pmu_resched_update()
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_122924_436221_F1B8F013 
X-CRM114-Status: GOOD (  15.90  )
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
 kernel/events/core.c       | 31 ++++++++++++++++++++++++++++---
 2 files changed, 31 insertions(+), 3 deletions(-)

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
index 7935d5663944e..ad2fc080bacac 100644
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
@@ -3032,6 +3036,27 @@ static void ctx_resched(struct perf_cpu_context *cpuctx,
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
+	unsigned long flags;
+
+	local_irq_save(flags);
+	perf_ctx_lock(cpuctx, task_ctx);
+	__ctx_resched(cpuctx, task_ctx, pmu, EVENT_ALL|EVENT_CPU, update, data);
+	perf_ctx_unlock(cpuctx, task_ctx);
+	local_irq_restore(flags);
+}
+EXPORT_SYMBOL_GPL(perf_pmu_resched_update);
+
 void perf_pmu_resched(struct pmu *pmu)
 {
 	struct perf_cpu_context *cpuctx = this_cpu_ptr(&perf_cpu_context);
-- 
2.54.0.1136.gdb2ca164c4-goog


