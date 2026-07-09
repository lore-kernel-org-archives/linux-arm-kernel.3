Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFAA8C44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5IlXOtfTicka82JGiLg5LihKqhXjATY/PJMfD4c3eM=; b=ynnd8CPmuJb87a1p6D6KUdguqg
	X7w6qO8UdIzaDEau4D+2M6Emz1rtS2wvROkx8AWJbzSICdS06wyvNdVxTDrKd98oqhJJqnYf1BlcY
	Jw+9XpBqyhTDZXtoOFE+rRTAjia/wzNrczNlEW5Qqjj46Et5cEyj2n4mDPwquhhZIWiqA5USgJ6fj
	d+EmmPp5yPLH/UT16tipxSLTmdYL9swGAKDg256FbVzh+mePCp2FYuU7PNx37mVVdMc4Vqx17M/+Q
	km/3dWFD25HVJtwImyBbHugKJlAnWVmNGyMORrDFf5k1FIBksNQ6AqUomQXoORoK/tUhAwVPQsU6d
	XT7Nzrgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmRv-000000023Qu-1QSG;
	Thu, 09 Jul 2026 10:57:47 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmRq-000000023N7-0gby
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 10:57:43 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so6158945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 03:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783594660; x=1784199460; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5IlXOtfTicka82JGiLg5LihKqhXjATY/PJMfD4c3eM=;
        b=QhpM8kdPIha5EKlhDN3DQlM6MIx4sF6N9E6uhJ+ekLS32m/+hTCdh7E8tafS4MSIBV
         NsVHlA89aFgDlGs+JIL094gwmy3XE6RImmHwJpPXqUY6fXDwW4Ji2OOV+K6j464LOxWh
         tUAQPvUkV0XiPYvvXj1hFd1N5rTd9guh2EhZZAZcUrwzGcZR557szmAT0PsnZkSMWw3v
         4ZcxWZNDAeOWI9D9a2rhltKWdjR5Xcr2yFTUAJW7Ax+YkTgSRoAl86NkirDHr7Y1KVDy
         tMn6oziSAL67/P8F1e9NDSXITb9ZeRAY1YUHwBQDHn8KzjIxfQKVTQSiWCRHY5q2hqi6
         Rj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783594660; x=1784199460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5IlXOtfTicka82JGiLg5LihKqhXjATY/PJMfD4c3eM=;
        b=Xu+t1JmZAlGZTIErYsnEM76+nf0Ef4Lz3mJhiVghtpE/ZL0vaZBpebmNwaD9XPKB+Z
         nfPfyWJUSt7Z0+v5kJZrb3bwl9NLlntI9v3mjUUKh/YZqvokWylFiZo6gvdQhRFmA1bI
         NSRypviEqKSWT2Y3xxpv1q5URt6Pr6DlkiAbE1HRI/mZOg/v34GwWWYATOJluxueNtpS
         VLCoIJ/d60BtkHjC4Vi8nQ8DoWC0cJKSCgKAxtCtRdwM5WVblWUbJ3btetXgG0CaJcnv
         70mF4Dk0cM++0GY+yycLQr2O9O1hRpCFcXzmLHmriPLCybccsGMul+84NA0Kmerb52PY
         Fvlw==
X-Forwarded-Encrypted: i=1; AHgh+RqjnczyTWh6P307Uc21qsEOtupFBi40CWgectaVYNw9BAXKfST6f5wAD52B4T02BOnTKnCnTSELiwfFR30nvADg@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpvi6GaFNuM7lC1XFybKAWt1raH9jdtUA1XIPD5EvDlZ/o0QbR
	R7AYuKh6c/y9/A9q8fsU8jUUP+43rEILuh02OBqxSxk8oyUzvXE+dmd59a38GsoGOEQ=
X-Gm-Gg: AfdE7clDTdDnn0b4jHZfwc8WJNtwg2g8BVNoXlcZGmIbMg38UOzsa+72DwpK60no4QF
	qNcFU8uss0DfuyxRyZEuemuQWwr1tipByrF2L1Zle51uoF5YEgCXHz6i8MufnV2ph/RMjtDJ/m9
	zXV7N7Kn7/P70Hj42rF1GdoB2EveSX5v8G7Aykcq30fj0X7L3PhXcWcxD+XQmPD9EbwV/ih/LmD
	TQ2t7tiGF79QJqDWfm05Lq2KAqsJR2c9JMj7qSB84Xg2tb5h/aBNF42q6KDiIdp276Y/fOfQGwh
	8lX6Eyk4t7nU5slyh6zM+EpZbC1FiLtRkxMSzqHVeF9y6FojJk3KGoZMzgoBROI5G4DbdQkmJhC
	RdLVCyZ8gvhJFsaoSVq6/Dtw4p/8b8bTP4MwaYZ0OOkKsc+rh0NleZ9oyWsjVNnGI6QHF0o+8WS
	N2maVl4SdFkuc636DFmtkPsw==
X-Received: by 2002:a05:600c:4754:b0:493:c8f7:3631 with SMTP id 5b1f17b1804b1-493e68df99fmr61780305e9.22.1783594660330;
        Thu, 09 Jul 2026 03:57:40 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9b4d850dsm51927408f8f.0.2026.07.09.03.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:57:39 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 09 Jul 2026 11:57:23 +0100
Subject: [PATCH 1/4] coresight: tmc-etr: Prevent per-thread events from
 sharing a sink
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-james-cs-multiple-per-threads-v1-1-d384e6d477ac@linaro.org>
References: <20260709-james-cs-multiple-per-threads-v1-0-d384e6d477ac@linaro.org>
In-Reply-To: <20260709-james-cs-multiple-per-threads-v1-0-d384e6d477ac@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>, 
 Jonathan Cameron <jic23@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_035742_243919_899049A3 
X-CRM114-Status: GOOD (  25.00  )
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

Sinks are potentially shared between multiple ETMs, and even with
Coresight being an exclusive PMU, multiple per-thread events in parallel
are supported. If both of the events are owned by the same PID then the
sink becomes shared resulting in trace from the wrong thread appearing
in a per-thread buffer and WARNs in the driver being hit:

  $ perf test -w named_threads 2 10 &
  $ perf record -e cs_etm//u --per-thread --pid 984

  WARNING: drivers/hwtracing/coresight/coresight-tmc-etr.c:1654 at tmc_update_etr_buffer+0x328/0x348 [coresight_tmc], CPU#1: perf/686
  [...]
  Call trace:
   tmc_update_etr_buffer+0x328/0x348 [coresight_tmc] (P)
   etm_event_stop+0x1c8/0x260 [coresight]
   etm_event_del+0x20/0x38 [coresight]
   event_sched_out+0xc4/0x1c8
   group_sched_out+0x5c/0x170
   __pmu_ctx_sched_out+0xe8/0x148
   ctx_sched_out+0x12c/0x178
   perf_event_exit_task_context+0xb0/0x3a8
   perf_event_exit_task+0xa4/0x138
   do_exit+0x1cc/0x808
   do_group_exit+0x7c/0xb0
   get_signal+0x628/0x678
   arch_do_signal_or_restart+0x98/0x1b28
   exit_to_user_mode_loop+0x90/0x188
   el0_svc+0x1cc/0x260
   el0t_64_sync_handler+0x78/0x130
   el0t_64_sync+0x198/0x1a0

Fix it by returning -EBUSY if a second per-thread event tries to use the
same sink. Users will only be able to use per-thread mode reliably with
multiple threads on a system that has a dedicated sink per ETM. This
limitation hasn't changed since this fix, it just makes the behavior
more consistent.

Fixes: 8d03cfd16a72 ("coresight: tmc-etr: Add support for CPU-wide trace scenarios")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c    | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 20 ++++++--------------
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 include/linux/coresight.h                       |  3 +++
 4 files changed, 34 insertions(+), 14 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index f7b1308a759c..d38db0c8f6ce 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -2246,6 +2246,30 @@ int coresight_get_enable_clocks(struct device *dev, struct clk **pclk,
 }
 EXPORT_SYMBOL_GPL(coresight_get_enable_clocks);
 
+/*
+ * Returns true if a sink that's potentially connected to multiple ETMs can be
+ * used in parallel with another event.
+ */
+bool coresight_sink_can_share(struct perf_event *existing,
+			      struct perf_event *new)
+{
+	/*
+	 * In per-thread mode only one event can use a sink, otherwise a sink
+	 * shared by multiple ETMs could have trace from two different threads
+	 * in it from two different events.
+	 */
+	if (existing->cpu == -1)
+		return existing == new;
+
+	/*
+	 * In per-CPU mode allow the sink to be shared across events, userspace
+	 * expects data from multiple CPUs in a shared sink. The only
+	 * restriction is the events must have the same owner.
+	 */
+	return existing->owner == new->owner;
+}
+EXPORT_SYMBOL_GPL(coresight_sink_can_share);
+
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Pratik Patel <pratikp@codeaurora.org>");
 MODULE_AUTHOR("Mathieu Poirier <mathieu.poirier@linaro.org>");
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 361a433e6f0c..ea05fa3e7902 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1736,7 +1736,6 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev,
 				    struct coresight_path *path)
 {
 	int rc = 0;
-	pid_t pid;
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct perf_output_handle *handle = path->handle;
@@ -1754,30 +1753,24 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev,
 		goto unlock_out;
 	}
 
-	/* Get a handle on the pid of the session owner */
-	pid = etr_perf->pid;
-
 	/* Do not proceed if this device is associated with another session */
-	if (drvdata->pid != -1 && drvdata->pid != pid) {
+	if (drvdata->event &&
+	    !coresight_sink_can_share(drvdata->event, handle->event)) {
 		rc = -EBUSY;
 		goto unlock_out;
 	}
 
-	/*
-	 * No HW configuration is needed if the sink is already in
-	 * use for this session.
-	 */
-	if (drvdata->pid == pid) {
+	/*  No HW configuration is needed if the sink is already in use. */
+	if (csdev->refcnt) {
 		csdev->refcnt++;
 		goto unlock_out;
 	}
 
 	rc = tmc_etr_enable_hw(drvdata, etr_perf->etr_buf);
 	if (!rc) {
-		/* Associate with monitored process. */
-		drvdata->pid = pid;
 		coresight_set_mode(csdev, CS_MODE_PERF);
 		drvdata->perf_buf = etr_perf->etr_buf;
+		drvdata->event = handle->event;
 		csdev->refcnt++;
 	}
 
@@ -1821,11 +1814,10 @@ static int tmc_disable_etr_sink(struct coresight_device *csdev)
 	/* Complain if we (somehow) got out of sync */
 	WARN_ON_ONCE(coresight_get_mode(csdev) == CS_MODE_DISABLED);
 	tmc_etr_disable_hw(drvdata);
-	/* Dissociate from monitored process. */
-	drvdata->pid = -1;
 	coresight_set_mode(csdev, CS_MODE_DISABLED);
 	/* Reset perf specific data */
 	drvdata->perf_buf = NULL;
+	drvdata->event = NULL;
 
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 319a354ede9f..220fe45fca83 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -275,6 +275,7 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct perf_event	*event;
 };
 
 struct etr_buf_operations {
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index add0579cad88..916ea657a194 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -715,4 +715,7 @@ int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode
 			       struct coresight_device *sink);
 int coresight_get_enable_clocks(struct device *dev, struct clk **pclk,
 				struct clk **atclk);
+bool coresight_sink_can_share(struct perf_event *existing,
+			      struct perf_event *new);
+
 #endif		/* _LINUX_COREISGHT_H */

-- 
2.34.1


