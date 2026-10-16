Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EBECC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 18:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=efv4TVfaJ8VsASZ4+z5al33Tm+AFl8riIqsvUC3lPGE=; b=R203SoJpUpmk6MqZVw1mR9smhU
	XZ2V/r3I5iBD0DiO1AUIX+hMyMXQFPyZTEscnm3+1e5q4xHsI4g7ozWsEw5beeT9Bh+tiNdgFM+Nm
	Qpxg+oIa/njHCey655h3ERxo32UZ+86OkkaijCgdw5iInzquJUuLnoOMvB9OMUp0y5BRj9BrD4HkP
	WbhTtP1pfX0B0/0W874/biVvf5qwLbiin2WTSywXWedP+OCVFVJTQGDdLue81P3OsODRBsZBmeWiu
	V+sONTiTEcd0HdfH4OinXqoeJg3esx9XMJI3+VmS89tvZ3XJcoPb3VV+K4ZCXcAQ+pdjLpMkTfCrO
	OJpN7wAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHn7u-00000003kt1-45c6;
	Fri, 16 Oct 2026 18:57:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHn7r-00000003koD-0PkB
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 18:57:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=efv4TVfaJ8VsASZ4+z5al33Tm+AFl8riIqsvUC3lPGE=; b=ivvuYdbpHx2lacHmy5WTzH7qMy
	x1+P84BXJayLGWT37SWmmWCUZ1WQmoa1miAko0QZcJOujSMh64CefMIXzScQs5SHuS8grC0onC+Zz
	zNrr6uHJ/pmJViEL6KHXofDee24c5PUp36+24GzaT0EkLKLL0YGIJcUKgRpzoqNuEm3GdDS8jwUXA
	OFu2d9HAEo+ZLYn7Y7bHJVCI5IbZpWqEPPhLedKxk4vI+GC/6xMka2v7yj6PO0317LDvl+7vSEBEI
	FgRfQpHzvBUGTq5HE/DMpr/eYcq2reh3/31asu3m6/lIR8hfYyQY3N1f1JANoeo1a2nxmBEkRrld4
	aJBrDqTQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHn7o-00000001rqD-07Ar
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 18:57:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 856D41762;
	Fri, 16 Oct 2026 11:57:47 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 840403F7B4;
	Fri, 16 Oct 2026 11:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792177070; bh=zT/gw61UN81fR20JvQfP/Z9nqeijSK11XU5k06tftKQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b/iv22GEvr3tAB18eV2WHnAR5HH4aQ9FLchflY1v4bzCuGlLX6d3//BkZoLL7kIQC
	 DHHUshk6MYmz/0/fRWUvpWOzoXg3jjlg1BfErL6odeWQMLAwlqor6FUeHdnApPvoce
	 WH1JtCFIaf4ZSNDie9u0XtNeXiYUEeX7636CRigI=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jonathan.cameron@oss.qualcomm.com,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v14 20/32] firmware: arm-scmi: Add Telemetry generic event support
Date: Fri, 16 Oct 2026 19:55:41 +0100
Message-ID: <20261016185553.2794459-21-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261016185553.2794459-1-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_195752_568117_18EA24CA 
X-CRM114-Status: GOOD (  19.08  )
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

Add support to allow SCMI driver users to subscribe/unsubscribe to specific
Telemetry  abstract (non protocol) events.

This enables SCMI drivers to subscribe to available events by registering
an eventfd context that the core SCMI stack will use as a signalling
mechanisms.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v12 --> v13
 - refacto resources cleanup
v11 --> v12
 - dropped eventfd_ctx_put on external ref
v10 --> v11
 - move events cleanup into resource_free
v8 --> v9
 - add a TLM_EVT_DUMMY placeholder (waiting for more events later on..)
---
 drivers/firmware/arm_scmi/telemetry.c | 96 +++++++++++++++++++++++++++
 include/linux/scmi_protocol.h         | 16 +++++
 2 files changed, 112 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 08250372a282..b1e3f986919e 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -12,6 +12,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/eventfd.h>
 #include <linux/hash.h>
 #include <linux/io.h>
 #include <linux/limits.h>
@@ -497,6 +498,11 @@ enum de_state {
 	ENA_MAX
 };
 
+struct telemetry_event {
+	struct eventfd_ctx *ctx;
+	struct list_head item;
+};
+
 struct telemetry_info {
 	bool streaming_mode;
 	unsigned int num_shmti;
@@ -525,6 +531,9 @@ struct telemetry_info {
 	/* Protect global and per-group configuration data */
 	struct mutex config_mtx;
 	struct scmi_telemetry_info info;
+	/* Mutex to protect access to @events */
+	struct mutex events_mtx;
+	struct list_head events[SCMI_TLM_EVT_MAX];
 	struct notifier_block telemetry_nb;
 	atomic_t rinfo_initializing;
 	struct completion rinfo_initdone;
@@ -552,6 +561,21 @@ struct mutex *lock_for_payld(struct mutex *locks, struct payload __iomem *payld)
 	return &locks[hash_long((__force unsigned long)payld, PAYLD_HASH_BITS)];
 }
 
+static int scmi_telemetry_event_signal(struct telemetry_info *ti,
+				       enum scmi_telemetry_event type)
+{
+	struct telemetry_event *evt;
+
+	if (type >= SCMI_TLM_EVT_MAX)
+		return -EINVAL;
+
+	guard(mutex)(&ti->events_mtx);
+	list_for_each_entry(evt, &ti->events[type], item)
+		eventfd_signal(evt->ctx);
+
+	return 0;
+}
+
 static inline void
 scmi_telemetry_de_state_update(struct telemetry_info *ti, enum de_state state,
 			       bool *current_state, const bool next_state)
@@ -3691,6 +3715,54 @@ static int scmi_telemetry_reset(const struct scmi_protocol_handle *ph)
 	return ret;
 }
 
+static int scmi_telemetry_event_subscribe(const struct scmi_protocol_handle *ph,
+					  enum scmi_telemetry_event type,
+					  struct eventfd_ctx *ctx)
+{
+	struct telemetry_info *ti = ph->get_priv(ph);
+	struct telemetry_event *evt;
+
+	if (type >= SCMI_TLM_EVT_MAX)
+		return -EINVAL;
+
+	evt = kzalloc_obj(*evt);
+	if (!evt)
+		return -ENOMEM;
+
+	evt->ctx = ctx;
+	guard(mutex)(&ti->events_mtx);
+	list_add(&evt->item, &ti->events[type]);
+
+	trace_scmi_tlm_access(0, "TLM_EVT_SUBS", 0, 0);
+
+	return 0;
+}
+
+static int scmi_telemetry_event_unsubscribe(const struct scmi_protocol_handle *ph,
+					    enum scmi_telemetry_event type,
+					    struct eventfd_ctx *ctx)
+{
+	struct telemetry_info *ti = ph->get_priv(ph);
+	struct telemetry_event *evt, *n;
+
+	if (type >= SCMI_TLM_EVT_MAX)
+		return -EINVAL;
+
+	guard(mutex)(&ti->events_mtx);
+	list_for_each_entry_safe(evt, n, &ti->events[type], item) {
+		if (evt->ctx == ctx) {
+			list_del(&evt->item);
+			kfree(evt);
+
+			trace_scmi_tlm_access(0, "TLM_EVT_UNSUBS", 0, 0);
+
+			break;
+		}
+	}
+
+	return 0;
+}
+
 static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.info_get = scmi_telemetry_info_get,
 	.de_lookup = scmi_telemetry_de_lookup,
@@ -3702,6 +3774,8 @@ static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.des_bulk_read = scmi_telemetry_des_bulk_read,
 	.des_sample_get = scmi_telemetry_des_sample_get,
 	.reset = scmi_telemetry_reset,
+	.event_subscribe = scmi_telemetry_event_subscribe,
+	.event_unsubscribe = scmi_telemetry_event_unsubscribe,
 };
 
 static bool
@@ -4020,10 +4094,28 @@ static void scmi_telemetry_groups_free(struct scmi_telemetry_res_info *rinfo)
 	}
 }
 
+static void scmi_telemetry_event_cleanup(struct telemetry_info *ti)
+{
+	guard(mutex)(&ti->events_mtx);
+	/* Clear any residual events */
+	for (int type = 0; type < SCMI_TLM_EVT_MAX; type++) {
+		struct telemetry_event *evt, *n;
+
+		list_for_each_entry_safe(evt, n, &ti->events[type], item) {
+			dev_warn(ti->ph->dev,
+				 "Found UN-SUBSCRIBED event type %d!\n", type);
+			list_del(&evt->item);
+			kfree(evt);
+		}
+	}
+}
+
 static void scmi_telemetry_instance_cleanup(void *arg)
 {
 	struct telemetry_info *ti = arg;
 
+	/* Cleanup any still registered event */
+	scmi_telemetry_event_cleanup(ti);
 	scmi_telemetry_groups_free(ti->rinfo);
 	scmi_telemetry_tdes_cleanup(ti);
 	scmi_telemetry_uuids_cleanup(ti);
@@ -4185,6 +4277,10 @@ static int scmi_telemetry_instance_init(struct telemetry_info *ti)
 		return ret;
 	}
 
+	for (int i = 0; i < SCMI_TLM_EVT_MAX; i++)
+		INIT_LIST_HEAD(&ti->events[i]);
+	mutex_init(&ti->events_mtx);
+
 	atomic_set(&ti->des_enabled[ENA_STATE], 0);
 	atomic_set(&ti->des_enabled[ENA_TSTAMP], 0);
 	mutex_init(&ti->des_enabled_mtx);
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 8328ba9b592b..8ca6803df60a 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -11,6 +11,7 @@
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/device.h>
+#include <linux/eventfd.h>
 #include <linux/notifier.h>
 #include <linux/types.h>
 #include <linux/uuid.h>
@@ -994,6 +995,11 @@ struct scmi_telemetry_de_sample {
 	unsigned long long val;
 };
 
+enum scmi_telemetry_event {
+	SCMI_TLM_EVT_DUMMY,
+	SCMI_TLM_EVT_MAX,
+};
+
 /**
  * struct scmi_telemetry_proto_ops - represents the various operations provided
  *	by SCMI Telemetry Protocol
@@ -1017,6 +1023,10 @@ struct scmi_telemetry_de_sample {
  *		    This causes an immediate update platform-side of all the
  *		    enabled DEs.
  * @reset: reset configuration and telemetry data.
+ * @event_subscribe: subscribe to the specified event @type using the provided
+ *		     @eventfd_ctx.
+ * @event_unsubscribe: unsubscribe to the specified event @type the previously
+ *		       registered @eventfd_ctx.
  */
 struct scmi_telemetry_proto_ops {
 	const struct scmi_telemetry_info __must_check *(*info_get)
@@ -1044,6 +1054,12 @@ struct scmi_telemetry_proto_ops {
 	int __must_check (*des_sample_get)(const struct scmi_protocol_handle *ph,
 					   int grp_id, int *num_samples,
 					   struct scmi_telemetry_de_sample *samples);
+	int (*event_subscribe)(const struct scmi_protocol_handle *ph,
+			       enum scmi_telemetry_event type,
+			       struct eventfd_ctx *ctx);
+	int (*event_unsubscribe)(const struct scmi_protocol_handle *ph,
+				 enum scmi_telemetry_event type,
+				 struct eventfd_ctx *ctx);
 	int (*reset)(const struct scmi_protocol_handle *ph);
 };
 
-- 
2.54.0


