Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CF1C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 18:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/mgSrJpw3YOisDXCB5xsNmyqp3J9irft+yFn98nNFU=; b=jrws5p3myEsj6XqGVr7nZt6x9D
	braWDMbddFSyQQ0yke/rP6IuKixfGp01fZ+ATtwbcX22uW0eftqc9xRQF/5Q1NUCYMj5/uYyLigJJ
	qBmhiCTBQo+AavNISfhkMwmRRsxqBVsh0WnLmUNrQ8jpVjAfrUQrrs6IyUzrJv/TVg/FcqAAwAGiK
	4gXqZKDW1+CSgwfkCi23tGOIKMQ8JWx/CfZvEKQWyWIcNBa0yie5rEan5TwCvQqBWvutFneTzeUOR
	jrVKvwYr+g0yJZPlMWiwjxdx//FAflf9gxvX7IDLX+MCY50Y8zWzEtWSpB73b0ya3oJ34AyjUzyAW
	rR4davZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nHm-0000000BknC-46Hb;
	Thu, 24 Sep 2026 17:31:07 +0000
Received: from mail-oi1-x245.google.com ([2607:f8b0:4864:20::245])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nGb-0000000Bk3i-1AlC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:29:58 +0000
Received: by mail-oi1-x245.google.com with SMTP id 5614622812f47-4dab94dc3e7so158017b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790270992; x=1790875792; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/mgSrJpw3YOisDXCB5xsNmyqp3J9irft+yFn98nNFU=;
        b=GYiH+O5EYfTAozXOjb8BJabXgNdLr5lRx3645c8eGRArnBbiq2XSMVgDqmfChKICRv
         w+qRtQYFFp2tmzACEPdff1jzRzy0wyhwskl6uOyRSABIiZnrbEze34EeVUpTAtRB7CUj
         VOCEr+M8ZzGDKTIH+b49bANGBzC2NQ9NYBFtLGrSW67FVz1mmD0Fj4KITR5zYicgVpD1
         CHDOaoFm3vP1+VPTpw+G/TA5ykF2ZDYYjGiPza5kihXJJfjf+ta1M1W8kn8NPon0CbPx
         ECoUxUnCsjGFSY+9Jytn3fLSNcmF7BSy+u8Cvr11Cme9D5sb0yBjMGydZo24CSmuMo1L
         h4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270992; x=1790875792;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T/mgSrJpw3YOisDXCB5xsNmyqp3J9irft+yFn98nNFU=;
        b=HM7xEU++ea9frjrlZpuzzhVl3FOIwnp4kv1oW2BMrCKyJpal9qifEyx6Ds6s3LSved
         E7IFlxvhKySg08SxnYIHZz1rNJQ0N3Bh27V+Uj0XNGmcL8jRa6cljn0XtASgE90IGuO2
         PcCCbRwNvll4Duh59A9xUat+pcFhIidGHgOGbJi2qT85TwptIygpilFn/X1ALY3ESOME
         CNhIL5gao0gvwiBUGfaZxT1ieeHN5MEA8fRf5Hpd9UcB8+HVDmYu7MqxYRfN1TsHZ3+Q
         E4UBuUnwmF5l1KOp1JzQubzpfHqSvc1iKKNxu4KC4OxjyMeDBVn0mQIX8E6WTLZiFir+
         jZ0w==
X-Forwarded-Encrypted: i=1; AKwUvBxC6EsOSS39rVx+3ZTrxr9R7wmVj0UsClSH5pHCA2gmzPFMiRPmyPX3Ip+S2M+tfL7R2DmW62irXgUdJ4WuouQD@lists.infradead.org
X-Gm-Message-State: AFuF++kMd5qdI+rdwh5AD92ArkHM+2N4UiXFhTluWRYhBx3I0BKV4OZ5
	imOJxUs7Nf8fNmWa8OAVNTlYtbM5IcGka3zKcwedwFZ6hZYqLUpC3TIPD2YgMUtSdFVM0yIJfAT
	xVzBPc5QFPd1OCcXOEPTIU+MGLw==
X-Received: from jahf8.prod.google.com ([2002:a05:6638:8a48:b0:5f3:a70c:f5ab])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1921:b0:4d5:291b:b84f with SMTP id 5614622812f47-4d72ef591admr3194424b6e.53.1790270991307;
 Thu, 24 Sep 2026 10:29:51 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:29:20 +0000
In-Reply-To: <20260924172928.2110956-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924172928.2110956-15-coltonlewis@google.com>
Subject: [PATCH v9 14/22] perf: Add perf_pmu_resched_update()
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Zide Chen <zide.chen@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Mingwei Zhang <mizhang@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_102953_558923_075B1785 
X-CRM114-Status: GOOD (  16.47  )
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

To modify PMU guest counter reservations dynamically, the per-CPU
available counter mask must be updated while host perf events are
temporarily scheduled out.

Introduce perf_pmu_resched_update() to update PMU state while holding
cpuctx->ctx.lock in between scheduling perf events out and scheduling
them back in. It accepts a callback invoked between ctx_sched_out() and
perf_event_sched_in(), accomplishing atomic counter mask updates with
minimal perf API expansion.

Refactor ctx_resched() into __ctx_resched() to invoke the callback at
the appropriate point.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 include/linux/perf_event.h |  3 +++
 kernel/events/core.c       | 31 ++++++++++++++++++++++++++++---
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 5842552294c19..32e3c0d365963 100644
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
index db7b76d6b68aa..06d1128d194fa 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -2991,9 +2991,10 @@ static void perf_event_sched_in(struct perf_cpu_context *cpuctx,
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
@@ -3029,6 +3030,9 @@ static void ctx_resched(struct perf_cpu_context *cpuctx,
 	else if (event_type & EVENT_PINNED)
 		ctx_sched_out(&cpuctx->ctx, pmu, EVENT_FLEXIBLE);
 
+	if (update)
+		update(pmu, data);
+
 	perf_event_sched_in(cpuctx, task_ctx, pmu, 0);
 
 	for_each_epc(epc, &cpuctx->ctx, pmu, 0)
@@ -3040,6 +3044,27 @@ static void ctx_resched(struct perf_cpu_context *cpuctx,
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
2.56.0.rc1.310.g51773c2048-goog


