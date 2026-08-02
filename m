Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B11DC55175
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 14:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dInG53kYdnjevV9x+m6Eppravg5fDp8WhdZiAh//Zbw=; b=QBh657QqLaFlj6IlqsP/yi6APz
	Q6k/gc/m8f2QYv/8l3/FcThDOQ42LxkIqy5u9oUlXLvxz86E5QLVq2AWGJzwKyI2CF6yrSDLg0KRb
	UbRK9Rc5lHWxAp8agCP8ZWTiOOuncDJ04dgMkIZ/+X/355YSPDNS1JJyOdRSpXXHCt4eTUjWAXL4Y
	TCYTH0N2VFDX/Bq0xIrXgxZOpt6Do1Rli3lSR0nGroiHa0iZVVU7Tc7H/FNON/rmi3EcKT6/zaM5Q
	B8uwvWgO+P7lHW05J64+pMUigKQVHOWlpULehVs0EPitzqGAYjIt6XSyfelv9oac25sjuYqHeTqUf
	993o3H+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqXdz-0000000FkRk-1Try;
	Sun, 02 Aug 2026 14:58:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqXdw-0000000FkPb-2VCG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 14:58:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAA1D143D;
	Sun,  2 Aug 2026 07:58:19 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6148A3F632;
	Sun,  2 Aug 2026 07:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785682703; bh=WQdSQVMfepfMwr2zX66Fp++wzpJXxaqsH0HmqYRBzcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t5oz0SHWDOF7kPEXwEbONd54y/mU8SxYo6G24ndepH5d2tf9OytpIIjtf/ObBbu8v
	 ar2dkOUxu3Xdp39r2/1Psfizlk001cBAlFkVRmSIF7/fM5Wvh1/yHiVQTMOEXRCIUU
	 iauWyMVTynduyrrM86xpXRc/q9Cb6KvVIeMWvvio=
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
Subject: [PATCH v7 13/23] firmware: arm-scmi: Add telemetry generic event support
Date: Sun,  2 Aug 2026 15:56:08 +0100
Message-ID: <20260802145618.1952804-14-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260802145618.1952804-1-cristian.marussi@arm.com>
References: <20260802145618.1952804-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_075824_732949_70BCC841 
X-CRM114-Status: GOOD (  16.72  )
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
 drivers/firmware/arm_scmi/telemetry.c | 100 ++++++++++++++++++++++++++
 include/linux/scmi_protocol.h         |  15 ++++
 2 files changed, 115 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index ca93db5058ce..dfe18729c6f1 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -12,6 +12,7 @@
 #include <linux/completion.h>
 #include <linux/err.h>
 #include <linux/delay.h>
+#include <linux/eventfd.h>
 #include <linux/io.h>
 #include <linux/limits.h>
 #include <linux/module.h>
@@ -498,6 +499,11 @@ enum de_state {
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
@@ -522,6 +528,9 @@ struct telemetry_info {
 	struct list_head free_des;
 	struct list_head fcs_des;
 	struct scmi_telemetry_info info;
+	/* Mutex to protect access to @events */
+	struct mutex events_mtx;
+	struct list_head events[SCMI_TLM_EVT_MAX];
 	struct notifier_block telemetry_nb;
 	atomic_t rinfo_initializing;
 	struct completion rinfo_initdone;
@@ -541,6 +550,21 @@ static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
 static inline void scmi_telemetry_uuid_link(struct telemetry_de *tde,
 					    struct telemetry_uuid *uuid);
 
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
@@ -3068,6 +3092,54 @@ static int scmi_telemetry_reset(const struct scmi_protocol_handle *ph)
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
@@ -3080,6 +3152,8 @@ static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.des_bulk_read = scmi_telemetry_des_bulk_read,
 	.des_sample_get = scmi_telemetry_des_sample_get,
 	.reset = scmi_telemetry_reset,
+	.event_subscribe = scmi_telemetry_event_subscribe,
+	.event_unsubscribe = scmi_telemetry_event_unsubscribe,
 };
 
 static bool
@@ -3427,6 +3501,9 @@ static int scmi_telemetry_instance_init(struct telemetry_info *ti)
 	if (ret)
 		return ret;
 
+	for (int i = 0; i < SCMI_TLM_EVT_MAX; i++)
+		INIT_LIST_HEAD(&ti->events[i]);
+	mutex_init(&ti->events_mtx);
 	atomic_set(&ti->des_enabled[ENA_STATE], 0);
 	atomic_set(&ti->des_enabled[ENA_TSTAMP], 0);
 	/* Setup resources lazy initialization */
@@ -3508,10 +3585,33 @@ static int scmi_telemetry_protocol_init(const struct scmi_protocol_handle *ph)
 	return 0;
 }
 
+static int scmi_telemetry_protocol_deinit(const struct scmi_protocol_handle *ph)
+{
+	struct telemetry_info *ti = ph->get_priv(ph);
+
+	//TODO maybe better on general cleanup
+
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
+
+	return 0;
+}
+
 static const struct scmi_protocol scmi_telemetry = {
 	.id = SCMI_PROTOCOL_TELEMETRY,
 	.owner = THIS_MODULE,
 	.instance_init = &scmi_telemetry_protocol_init,
+	.instance_deinit = &scmi_telemetry_protocol_deinit,
 	.ops = &tlm_proto_ops,
 	.events = &tlm_protocol_events,
 	.supported_version = SCMI_PROTOCOL_SUPPORTED_VERSION,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index e7267c776edc..3206b0710bcc 100644
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
@@ -994,6 +995,10 @@ struct scmi_telemetry_de_sample {
 	unsigned long long val;
 };
 
+enum scmi_telemetry_event {
+	SCMI_TLM_EVT_MAX
+};
+
 /**
  * struct scmi_telemetry_proto_ops - represents the various operations provided
  *	by SCMI Telemetry Protocol
@@ -1018,6 +1023,10 @@ struct scmi_telemetry_de_sample {
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
@@ -1046,6 +1055,12 @@ struct scmi_telemetry_proto_ops {
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


