Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E357C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 09:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWN8RON6m3KI7hVFX3xLvrOB6C92XQm8JsqxphiHc4A=; b=mjP3Ywf91UQAQSTbtHpERBf/TR
	1eS1eFzJPiO/a5ReRDpXRCVtBcklhdaM/UiBIQFO0aVbZ7t8zoy2DeiIPmUA8p3j0/bxV0Thlj4b0
	1BQB9xso5cTjyxl2IhwK7m3kOtwWmZlJvsQtiG6D0FSJPTUucbacugjFhAzbSSSauVSpoItwiTeiX
	f5bg5whcB9Hloh2w7PlLxPPOHHN3ONS0oSLyh+DX5wOT1P8W35FwHri6gU1VUq+XLhHfRIAeaBs3B
	tksPTeDjMGkk4bdOB0wHwJAIabHspnbRzom4qUTww3M64ikJQjlA8tkdoD+LW5RT0l8uquMD05LD2
	0GMZu84Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8DjS-0000000H9hS-2IIi;
	Sun, 20 Sep 2026 09:21:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8DjO-0000000H9e1-31fp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 09:21:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 747531691;
	Sun, 20 Sep 2026 02:21:02 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FD653F59E;
	Sun, 20 Sep 2026 02:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789896066; bh=VBV18BwcjkHxRBmfusIg+mEAGZIeNHamTOoODUrr6+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p2i1sq7tZslcKAGJ/zGiaP4/aunYBEssoH1ueH3oHJBH8Ko32RW2Oo274/5i8PTvu
	 DxazWS/ajjaD2IY9CTIw+VnCZ8V1J7K7RdakBFNuo2v98hCPcF29FbI2KwVkpOEdBm
	 G/F7GHqLTNX71Tk3qKJ9rO6yGjSJ+x2PrGj0xkOc=
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
	jic23@kernel.org,
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
Subject: [PATCH v12 13/25] firmware: arm-scmi: Add telemetry generic event support
Date: Sun, 20 Sep 2026 10:19:16 +0100
Message-ID: <20260920091928.2014972-14-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260920091928.2014972-1-cristian.marussi@arm.com>
References: <20260920091928.2014972-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_022106_864545_673C2B96 
X-CRM114-Status: GOOD (  18.25  )
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
index ae712e95daa0..c76409083160 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -12,6 +12,7 @@
 #include <linux/completion.h>
 #include <linux/err.h>
 #include <linux/delay.h>
+#include <linux/eventfd.h>
 #include <linux/hash.h>
 #include <linux/io.h>
 #include <linux/limits.h>
@@ -483,6 +484,11 @@ enum de_state {
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
@@ -511,6 +517,9 @@ struct telemetry_info {
 	/* Protect global and per-group configuration data */
 	struct mutex config_mtx;
 	struct scmi_telemetry_info info;
+	/* Mutex to protect access to @events */
+	struct mutex events_mtx;
+	struct list_head events[SCMI_TLM_EVT_MAX];
 	struct notifier_block telemetry_nb;
 	atomic_t rinfo_initializing;
 	struct completion rinfo_initdone;
@@ -538,6 +547,21 @@ struct mutex *lock_for_payld(struct mutex *locks, struct payload __iomem *payld)
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
@@ -3457,6 +3481,54 @@ static int scmi_telemetry_reset(const struct scmi_protocol_handle *ph)
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
@@ -3468,6 +3540,8 @@ static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.des_bulk_read = scmi_telemetry_des_bulk_read,
 	.des_sample_get = scmi_telemetry_des_sample_get,
 	.reset = scmi_telemetry_reset,
+	.event_subscribe = scmi_telemetry_event_subscribe,
+	.event_unsubscribe = scmi_telemetry_event_unsubscribe,
 };
 
 static bool
@@ -3687,6 +3761,22 @@ __scmi_telemetry_resources_get(struct telemetry_info *ti)
 	return smp_load_acquire(&ti->rinfo);
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
 static void scmi_telemetry_resources_free(void *arg)
 {
 	struct scmi_telemetry_res_info *rinfo;
@@ -3733,6 +3823,9 @@ static void scmi_telemetry_resources_free(void *arg)
 		scmi_telemetry_line_put(line);
 	xa_destroy(&ti->xa_lines);
 
+	/* Cleanup any still registered event */
+	scmi_telemetry_event_cleanup(ti);
+
 	kfree(ti->tdes);
 	kfree(rinfo->des);
 	kfree(rinfo->dei_store);
@@ -3898,6 +3991,9 @@ static int scmi_telemetry_instance_init(struct telemetry_info *ti)
 	if (ret)
 		return ret;
 
+	for (int i = 0; i < SCMI_TLM_EVT_MAX; i++)
+		INIT_LIST_HEAD(&ti->events[i]);
+	mutex_init(&ti->events_mtx);
 	atomic_set(&ti->des_enabled[ENA_STATE], 0);
 	atomic_set(&ti->des_enabled[ENA_TSTAMP], 0);
 	mutex_init(&ti->des_enabled_mtx);
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 3d7b7dde6b64..b4b3e95547ba 100644
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


