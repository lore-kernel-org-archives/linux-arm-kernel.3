Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1298C54F4D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MIRNU+MhI0eSiQtJDok+bcOZXgSMrVDXRZo0QYi/kE=; b=xKY/VTRzTz/gA5HqadSIqI0lju
	1554TMYBTSmn9eFkMQdcSkSHcK5DN1jyuc9tVmfvYr/MJ5+I9cDbgVs9h+265vFKKYJVDVTClut8O
	pZHjqqf2yXNvXiYWXavTIUXWGL5UDfUIyuZGLK4jh8Lvga/JwPfVKTF8ohpjnJPmXL0DxtXl82fXR
	mAmKqZdW8cBtYFTQNXxiqffBj2ggkIdmJSxfcBXEWY1n6na4ME0+tGg/kUN/VeQ7aeoMPzDVQmnne
	XcTKVCSGxzrIFCbHlND4y7Oy8ayoAtxhxf72nVZaJza5V8gHEizrPG6b8vjn9CdtMyB3hg6FLiRmE
	4XNbbg5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojIu-00000005ZgD-3paq;
	Tue, 28 Jul 2026 15:01:12 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojIp-00000005Zc4-3w02
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:01:09 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47f7854678bso1425247f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 08:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785250865; x=1785855665; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8MIRNU+MhI0eSiQtJDok+bcOZXgSMrVDXRZo0QYi/kE=;
        b=DlBKy9sQgZGrPCw0lp6jXqv5OpqAxpxWifX9sHjrRy68y3tizP5TGgIn3dYvx4j6gg
         CAEd5kc64G2UF5f8zHxypuC82E55SkOF4wXr1RD7IkeleqvoyhPjEQkTITugsdSPiaMO
         C21LqkBICdNn5MqV706MiDrj8WsHJjRgfB+PFi4PztyrVY/6s9mgssR2v0EnR/5aCiHG
         SqKnn8/xkPAit3WDzZdV5mb2pA+c2srX7eEUwLBevtIZTTNatlrGo3qgPLHcUdzOgYju
         1TI/RScAvcbbfxMzYuPDSCtmfE/X+6I6tgTcJ/t1Bkb23AFLsud3D4cgskjM/+NR6XwF
         /wmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785250865; x=1785855665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8MIRNU+MhI0eSiQtJDok+bcOZXgSMrVDXRZo0QYi/kE=;
        b=SnUHM5W1JTX77bMX3b0PQj1SRmq+6EmH5HtxDto8L/I00GvvyVg5mJclY20Hq90XEC
         s0P9U4v4peLUsuSBaURsvHpcytivvPRS2n06M7eQmFokA2ES/XEsR6vaqWXXIq3q/QVn
         quvRIhB1SZcmNETrr/jMi0FPzNMbu0+ZN4gkWXemtH/GMsYxrjjKpmYFBSnJ4GmXjply
         e4F+tNB5uQ00JDYU8czeBiwBFO5qDF4RtM6W1I5DzNXufHCwzM0ZTvifn4c7z4mx0ewY
         Tb2lwvBrMfkK+LqD07P8b4NecqsAP4o55I3OOTDZ6EO2MJgCKV2NDE0GPWsPLHrBhHB1
         8Ghg==
X-Forwarded-Encrypted: i=1; AHgh+Rq3Cy8B76lU15Rk7SeuFtlcpwdunNd9fcdysU1rF+/GWSUlG3tt4EB78IS+kgsmRYDXkbZTnLAkn4fFD1BYpxG6@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy0aJMkvrrI3hEFaRzlWBcllDIN/D9cdpdXeCrhziklHDhrEwb
	glZ4ZriFs9BS3TJVZ/x8v0261ibN5SyhHwX7ekUu5UGfdf44Gue82eDq9EkilA7+Z18=
X-Gm-Gg: AR+sD13EgEhqfLsCDGwVcg1jk+o/y5hSO4pC39Q2YOkAJwAuRle9JUw9OWfVBkQmwGX
	GVEtM+LcK574gsUkdK6xueqNkZK4T7pA4idSOVdj7h2eeofEXWZuoBRSFopHScg46SYf5VCtrLy
	LVEtI4rhLQgQ1FMp+iBLLvoVwd3JJF/0JApJNs8vfLUDt221MaVpmy5B5BZwWG8DfwewvlrMcYH
	I64DXmOJSDi+nLCcltuq7gIhbxD84mhMFBPUPq0Ib0whnNtbatDiDr4rzSdyyJz20ZE8Uod76yh
	8SqvOCkt/oAwOGtbk3OO5gggttcXTdMrVR2FkNHXjaEIjE6Wz4kUoHu55XflSjM0FPVFthmu6HR
	MY8FKikKaOHNh7X3Zjck61BiOXDXqWFWow7w7eETiCp3/cuIUUvepHig8aT3IQ8gOuFYFl47+Xb
	K8A9cmd13XJcF9RCoQ+w==
X-Received: by 2002:a5d:6f05:0:b0:46e:624e:3c2f with SMTP id ffacd0b85a97d-47fb1f1e2cemr3407060f8f.47.1785250865033;
        Tue, 28 Jul 2026 08:01:05 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm61036324f8f.20.2026.07.28.08.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:01:04 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 28 Jul 2026 16:00:16 +0100
Subject: [PATCH v3 4/8] coresight: tmc-etr: Prevent per-thread events from
 sharing a sink
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-james-cs-multiple-per-threads-v3-4-6aee7579f1dc@linaro.org>
References: <20260728-james-cs-multiple-per-threads-v3-0-6aee7579f1dc@linaro.org>
In-Reply-To: <20260728-james-cs-multiple-per-threads-v3-0-6aee7579f1dc@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_080108_223972_14E8C1AB 
X-CRM114-Status: GOOD (  36.80  )
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
Coresight being an exclusive PMU, multiple PERF_ATTACH_TASK events in
parallel are supported. If both of the events are owned by the same PID
then the sink becomes shared resulting in trace from the wrong thread
appearing in a per-thread buffer and WARNs in the driver being hit:

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

Fix it by returning -EBUSY if an incompatible event tries to use the
same sink. Users will only be able to use per-thread mode reliably with
multiple threads on a system that has a dedicated sink per ETM. This
limitation hasn't changed since this fix, it just makes the behavior
more consistent.

The identity and compatibility of a session are determined by the owning
process, the target process, and the inheritance settings together.

"Owning process" is a reference to the TGID of the caller of
etm_setup_aux(), so any thread in that group can access the events. It
has to be pinned at this point rather than checked at runtime via
event->owner so that we can handle scenarios like event FDs being passed
to child threads and original owners exiting.

The "target process" is determined by taking a reference to
event->hw.target in etm_setup_aux(), which is always called on the root
event, so is unaffected by inheritance. Perf holds a reference to that
task struct as long as the event exists, so it can be safely taken even
if the task isn't live by the time mmap is called.

The remaining inheritance settings are used to determine if a
PERF_ATTACH_TASK event tracks the same child threads as another event
with the same target on a different CPU. If not, then sinks can't be
shared to avoid unexpected trace appearing from a child when
inherit=false on one but not another.

Fixes: 8d03cfd16a72 ("coresight: tmc-etr: Add support for CPU-wide trace scenarios")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 53 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-etm-perf.h | 14 +++++++
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 20 +++------
 drivers/hwtracing/coresight/coresight-tmc.h      |  3 ++
 include/linux/coresight.h                        |  1 +
 5 files changed, 77 insertions(+), 14 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 7fb5c3d18bd5..28cf319a39da 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -251,6 +251,9 @@ static void free_event_data(struct work_struct *work)
 	}
 
 	free_percpu(event_data->path);
+	put_pid(event_data->session_id.owner);
+	if (event_data->session_id.target)
+		put_task_struct(event_data->session_id.target);
 	kfree(event_data);
 }
 
@@ -452,6 +455,16 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 		event_data->cfg_hash = cfg_hash;
 	}
 
+	/*
+	 * Save an identity that determines if sessions are equivalent enough
+	 * for shared sinks to receive trace from other events.
+	 */
+	event_data->session_id.owner = get_task_pid(current, PIDTYPE_TGID);
+	if (event->attach_state & PERF_ATTACH_TASK) {
+		event_data->session_id.target = get_task_struct(event->hw.target);
+		event_data->session_id.inherit = event->attr.inherit;
+		event_data->session_id.inherit_thread = event->attr.inherit_thread;
+	}
 	mask = &event_data->mask;
 
 	/*
@@ -1078,3 +1091,43 @@ void etm_perf_flush_workqueue(void)
 {
 	flush_workqueue(etm_free_wq);
 }
+
+bool etm_perf_compare_session(struct etm_session_id *a,
+			      struct etm_session_id *b)
+{
+	return a->owner == b->owner &&
+	       a->target == b->target &&
+	       a->inherit == b->inherit &&
+	       a->inherit_thread == b->inherit_thread;
+}
+EXPORT_SYMBOL_GPL(etm_perf_compare_session);
+
+/*
+ * Returns true if a sink that's potentially connected to multiple ETMs can be
+ * used in parallel with another event.
+ */
+bool etm_perf_sink_can_share(struct coresight_device *csdev,
+			     struct etm_session_id *owner,
+			     struct perf_output_handle *new)
+{
+	struct etm_event_data *new_event_data = perf_get_aux(new);
+	struct etm_session_id *new_id = &new_event_data->session_id;
+
+	/* First user can always use the sink */
+	if (csdev->refcnt == 0)
+		return true;
+
+	/*
+	 * Only allow sharing if both events have the same owner and are
+	 * expected to follow the exact same set of processes. For CPU wide
+	 * events, both new and current 'target's are NULL so sharing between
+	 * all events is allowed.
+	 *
+	 * When 'target' mismatches, trace from two different PERF_ATTACH_TASK
+	 * events is prevented from appearing in a buffer targeting another
+	 * process. Inherit flags change which set of processes are followed,
+	 * even for events with the same 'target', so they must also be checked.
+	 */
+	return etm_perf_compare_session(owner, new_id);
+}
+EXPORT_SYMBOL_GPL(etm_perf_sink_can_share);
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
index 86e259cc1adf..87b3ba72d07c 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.h
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
@@ -82,6 +82,13 @@ struct etm_filters {
 	bool			ssstatus;
 };
 
+struct etm_session_id {
+	struct pid *owner;
+	struct task_struct *target;
+	bool inherit;
+	bool inherit_thread;
+};
+
 /**
  * struct etm_event_data - Coresight specifics associated to an event
  * @work:		Handle to free allocated memory outside IRQ context.
@@ -90,6 +97,7 @@ struct etm_filters {
  * @snk_config:		The sink configuration.
  * @cfg_hash:		The hash id of any coresight config selected.
  * @path:		An array of path, each slot for one CPU.
+ * @session_id:		Reference to the session that called setup_aux()
  */
 struct etm_event_data {
 	struct work_struct work;
@@ -98,6 +106,7 @@ struct etm_event_data {
 	void *snk_config;
 	u32 cfg_hash;
 	struct coresight_path * __percpu *path;
+	struct etm_session_id session_id;
 };
 
 int etm_perf_symlink(struct coresight_device *csdev, bool link);
@@ -117,5 +126,10 @@ void etm_perf_del_symlink_cscfg(struct cscfg_config_desc *config_desc);
 int __init etm_perf_init(void);
 void etm_perf_exit(void);
 void etm_perf_flush_workqueue(void);
+bool etm_perf_compare_session(struct etm_session_id *a,
+			      struct etm_session_id *b);
+bool etm_perf_sink_can_share(struct coresight_device *csdev,
+			     struct etm_session_id *owner,
+			     struct perf_output_handle *new);
 
 #endif
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index be0bbe036d02..be5ed04a554f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1746,10 +1746,10 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev,
 				    struct coresight_path *path)
 {
 	int rc = 0;
-	pid_t pid;
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct perf_output_handle *handle = path->handle;
+	struct etm_event_data *event_data = perf_get_aux(handle);
 	struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
@@ -1764,20 +1764,14 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev,
 		goto unlock_out;
 	}
 
-	/* Get a handle on the pid of the session owner */
-	pid = etr_perf->pid;
-
 	/* Do not proceed if this device is associated with another session */
-	if (drvdata->pid != -1 && drvdata->pid != pid) {
+	if (!etm_perf_sink_can_share(csdev, &drvdata->perf_session, handle)) {
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
@@ -1796,10 +1790,9 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev,
 
 	rc = tmc_etr_enable_hw(drvdata, etr_perf->etr_buf);
 	if (!rc) {
-		/* Associate with monitored process. */
-		drvdata->pid = pid;
 		coresight_set_mode(csdev, CS_MODE_PERF);
 		drvdata->perf_buf = etr_perf->etr_buf;
+		drvdata->perf_session = event_data->session_id;
 		csdev->refcnt++;
 
 		/* A new Perf session clears an old sysfs one if the buffer is shared */
@@ -1853,11 +1846,10 @@ static int tmc_disable_etr_sink(struct coresight_device *csdev)
 	/* Complain if we (somehow) got out of sync */
 	WARN_ON_ONCE(coresight_get_mode(csdev) == CS_MODE_DISABLED);
 	tmc_etr_disable_hw(drvdata);
-	/* Dissociate from monitored process. */
-	drvdata->pid = -1;
 	coresight_set_mode(csdev, CS_MODE_DISABLED);
 	/* Reset perf specific data */
 	drvdata->perf_buf = NULL;
+	drvdata->perf_session = (struct etm_session_id) {};
 
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index dc1a57ab8011..9b153b7910fb 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -13,6 +13,7 @@
 #include <linux/mutex.h>
 #include <linux/refcount.h>
 #include <linux/crc32.h>
+#include "coresight-etm-perf.h"
 
 #define TMC_RSZ			0x004
 #define TMC_STS			0x00c
@@ -248,6 +249,7 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @perf_session: Session identity of the Perf event currently using this sink.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -278,6 +280,7 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct etm_session_id	perf_session;
 };
 
 struct etr_buf_operations {
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index add0579cad88..1c06a9800cfe 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -715,4 +715,5 @@ int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode
 			       struct coresight_device *sink);
 int coresight_get_enable_clocks(struct device *dev, struct clk **pclk,
 				struct clk **atclk);
+
 #endif		/* _LINUX_COREISGHT_H */

-- 
2.34.1


