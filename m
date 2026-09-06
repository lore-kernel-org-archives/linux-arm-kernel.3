Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30205C79FA2
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 10:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qZIXckBl6y5GMpnDtD2gEMdakDYCTX7XWwtbcHQyp+Q=; b=DN9VNjeTZyW5ETHG20nuIWF1qU
	R4569SpQPkDexvP+4jLwcgoYdGsIf9MlErEkgm1Zs0Lhc2W+1uRXGi70av9BcFHj71mSc/tWIWu2m
	xaw45q+gW7vZzi/z4f8KeOruqg/R0RX1M2rYrilLD0vbxwvrmpQawa7DdTtPV6El3HIXNpa/GFBJ4
	2NXE1oy3BmAvVEUhuRWzXMuSSO1M8mVxEuinWA8ZTBMckXZiBjJL7oovX8fTX8tsEmUWXYuZQA++s
	1lUm5T/IIB2P2J2NjDyPUl48jh4xgPeczApbhSMbxBUjHDxS8LLS5FYU22KWiFqtY1VKLnaMqrkwp
	ynzZHmRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x39n7-00000004tqz-415Q;
	Sun, 06 Sep 2026 10:08:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x39n5-00000004tni-26TG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 10:08:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D3C81A25;
	Sun,  6 Sep 2026 03:07:54 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09C473F7D8;
	Sun,  6 Sep 2026 03:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788689277; bh=YJNxMFHTCdWgZsg/F1YVA/U4AC9GLZhPpwRzJWxo1U4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V+NIsWuAOXpIFzptbdTflFizRivsnWeZna7Hv8Cujpg9uslM5QS4+rSDgt5l9LMXv
	 jrR0lkdq1d4dqElCSPrLrFHn9Rk6LukG170czWVqNaUS8ipbcmp9naQEmsGGNn7Yoi
	 GM5uixLsdQZWB39T1w/2hiwSenCja/Drvfn29W3c=
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
Subject: [PATCH v11 11/25] firmware: arm_scmi: Add Telemetry notification support
Date: Sun,  6 Sep 2026 11:06:09 +0100
Message-ID: <20260906100623.3488327-12-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260906100623.3488327-1-cristian.marussi@arm.com>
References: <20260906100623.3488327-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_030759_636792_B4C0D988 
X-CRM114-Status: GOOD (  22.75  )
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

Add support for notifications to Telemetry protocol and register an
internal notifier during protocol initialization: any DE value received
inside a notification payload will be cached for future user consumption.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v10 --> v11
 - link DE received by notif to the primary UUID when first seen
v8 --> v9
 - fix notif boundary and wraparound checks
 - rollback notif report payload in __le32 format before parsing
   to align with single read payload parsing
v6 --> v7
 - fix sparse warn on notof payload handling
v5 -> v6
 - use protocol instance notifier interface
 - use new RAW macros to access payload
 - add proper boundary checks on notification payload
 - fix mutex scope in msg payld parsing
 - add notification payload consistency check (Sahiko)
v3 -> v4
 - use TDE cache to save DEs received via msg payload
v2 --> v3
 - changed a few dev_err into traces
 - split from monolithic telemetry protocol patch
 - use memcpy_from_le32
---
 drivers/firmware/arm_scmi/telemetry.c | 172 ++++++++++++++++++++++++--
 include/linux/scmi_protocol.h         |   9 ++
 2 files changed, 168 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 28ed644577a3..0923f52344b5 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -505,12 +505,16 @@ struct telemetry_info {
 	struct list_head free_des;
 	struct list_head fcs_des;
 	struct scmi_telemetry_info info;
+	struct notifier_block telemetry_nb;
 	atomic_t rinfo_initializing;
 	struct completion rinfo_initdone;
 	struct scmi_telemetry_res_info *rinfo;
 	struct scmi_telemetry_res_info *(*res_get)(struct telemetry_info *ti);
 };
 
+#define telemetry_nb_to_info(x)	\
+	container_of(x, struct telemetry_info, telemetry_nb)
+
 static struct scmi_telemetry_res_info *
 __scmi_telemetry_resources_get(struct telemetry_info *ti);
 
@@ -2915,6 +2919,7 @@ scmi_telemetry_msg_payld_process(struct telemetry_info *ti,
 
 	while (next < num_dwords) {
 		struct payload *payld = (struct payload *)&dwords[next];
+		struct scmi_telemetry_de_sample sample = {};
 		struct scmi_telemetry_de *de;
 		struct telemetry_de *tde;
 		u32 de_id, meta = le32_to_cpu(payld->meta);
@@ -2944,23 +2949,28 @@ scmi_telemetry_msg_payld_process(struct telemetry_info *ti,
 
 		de = xa_load(&ti->xa_des, de_id);
 		if (!de || !de->enabled) {
-			dev_err(ti->ph->dev,
-				"MSG - Received INVALID DE - ID:%u  enabled:%c\n",
-				de_id, de ? (de->enabled ? 'Y' : 'N') : 'X');
+			trace_scmi_tlm_access(de_id, de ? "MSG_DE_DISABLED" :
+					      "MSG_DE_UNKNOWN", 0, 0);
 			continue;
 		}
 
 		tde = to_tde(de);
-		guard(mutex)(&tde->mtx);
-		tde->cached_msg = true;
-		tde->last_val = LINE_DATA_GET_RAW(&payld->tsl);
-		/* TODO BLK_TS in notification payloads */
-		tde->last_ts = HAS_LINE_EXT_RAW(meta) &&
-			LINE_TS_VALID_RAW(meta) ?
-			LINE_TSTAMP_GET_RAW(&payld->tsl) : 0;
+		scoped_guard(mutex, &tde->mtx) {
+			tde->cached_msg = true;
+			tde->last_val = LINE_DATA_GET_RAW(&payld->tsl);
+			tde->last_ts = HAS_LINE_EXT_RAW(meta) &&
+				LINE_TS_VALID_RAW(meta) ?
+				LINE_TSTAMP_GET_RAW(&payld->tsl) : 0;
+			sample.val = tde->last_val;
+			sample.tstamp = tde->last_ts;
+		}
+		scmi_telemetry_uuid_link(tde, ti->primary_uuid);
+
+		/* Trace originally read tstamp */
+		trace_scmi_tlm_collect(sample.tstamp, de->info->id, sample.val,
+				       "MESSAGE");
 
-		trace_scmi_tlm_collect(tde->last_ts, tde->de.info->id,
-				       tde->last_val, "MESSAGE");
+		scmi_telemetry_tde_cache_update(tde, &sample, NULL);
 	}
 }
 
@@ -3121,6 +3131,121 @@ static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.reset = scmi_telemetry_reset,
 };
 
+static bool
+scmi_telemetry_notify_supported(const struct scmi_protocol_handle *ph,
+				u8 evt_id, u32 src_id)
+{
+	struct telemetry_info *ti = ph->get_priv(ph);
+
+	return ti->info.continuos_update_support;
+}
+
+static int
+scmi_telemetry_set_notify_enabled(const struct scmi_protocol_handle *ph,
+				  u8 evt_id, u32 src_id, bool enable)
+{
+	return 0;
+}
+
+static void *
+scmi_telemetry_fill_custom_report(const struct scmi_protocol_handle *ph,
+				  u8 evt_id, ktime_t timestamp,
+				  const void *payld, size_t payld_sz,
+				  void *report, u32 *src_id)
+{
+	const struct scmi_telemetry_update_notify_payld *p = payld;
+	struct scmi_telemetry_update_report *r = report;
+	size_t dwords_sz, msg_payld_sz;
+
+	/* At least sized as an empty notification */
+	if (payld_sz < sizeof(*p))
+		return NULL;
+
+	r->timestamp = timestamp;
+	r->agent_id = le32_to_cpu(p->agent_id);
+	r->status = le32_to_cpu(p->status);
+	r->num_dwords = le32_to_cpu(p->num_dwords);
+
+	/*Check boundaries and wraparounds */
+	if (check_mul_overflow(r->num_dwords, sizeof(r->dwords[0]), &dwords_sz))
+		return NULL;
+
+	if (check_add_overflow(sizeof(*p), dwords_sz, &msg_payld_sz))
+		return NULL;
+
+	if (msg_payld_sz > payld_sz)
+		return NULL;
+
+	/*
+	 * Allocated dwords and report are sized as max_msg_size, so as
+	 * to allow for the maximum payload permitted by the configured
+	 * transport. Overflow is not possible since out-of-size messages
+	 * are dropped at the transport layer.
+	 */
+	if (r->num_dwords)
+		memcpy_from_le32(r->dwords, p->array, r->num_dwords);
+
+	*src_id = 0;
+
+	return r;
+}
+
+static const struct scmi_event tlm_events[] = {
+	{
+		.id = SCMI_EVENT_TELEMETRY_UPDATE,
+		.max_payld_sz = 0,
+		.max_report_sz = 0,
+	},
+};
+
+static const struct scmi_event_ops tlm_event_ops = {
+	.is_notify_supported = scmi_telemetry_notify_supported,
+	.set_notify_enabled = scmi_telemetry_set_notify_enabled,
+	.fill_custom_report = scmi_telemetry_fill_custom_report,
+};
+
+static const struct scmi_protocol_events tlm_protocol_events = {
+	.queue_sz = SCMI_PROTO_QUEUE_SZ,
+	.ops = &tlm_event_ops,
+	.evts = tlm_events,
+	.num_events = ARRAY_SIZE(tlm_events),
+	.num_sources = 1,
+};
+
+static int scmi_telemetry_notifier(struct notifier_block *nb,
+				   unsigned long event, void *data)
+{
+	struct scmi_telemetry_update_report *er = data;
+	struct telemetry_info *ti = telemetry_nb_to_info(nb);
+
+	if (er->status) {
+		trace_scmi_tlm_access(0, "BAD_NOTIF_MSG", 0, 0);
+		return NOTIFY_DONE;
+	}
+
+	trace_scmi_tlm_access(0, "TLM_UPDATE_MSG", 0, 0);
+	/* Lookup the embedded DEs in the notification payload ... */
+	if (er->num_dwords) {
+		size_t payld_bytes = sizeof(er->dwords[0]) * er->num_dwords;
+
+		__le32 *dwords __free(kvfree) =
+			kvcalloc(er->num_dwords, sizeof(*dwords), GFP_KERNEL);
+		if (!dwords)
+			return NOTIFY_DONE;
+
+		memcpy_to_le32(dwords, er->dwords, er->num_dwords);
+		/* The report payload size was bound checked on rx */
+		scmi_telemetry_msg_payld_process(ti, er->num_dwords, dwords,
+						 payld_bytes);
+	}
+
+	/* ...scan the SHMTI/FCs for any other DE updates. */
+	if (ti->streaming_mode)
+		scmi_telemetry_scan_update(ti);
+
+	return NOTIFY_OK;
+}
+
 /**
  * scmi_telemetry_resources_alloc  - Resources allocation
  * @ti: A reference to the telemetry info descriptor for this instance
@@ -3466,7 +3591,27 @@ static int scmi_telemetry_protocol_init(const struct scmi_protocol_handle *ph)
 
 	ti->info.base.version = ph->version;
 
-	return ph->set_priv(ph, ti);
+	ret = ph->set_priv(ph, ti);
+	if (ret)
+		return ret;
+
+	/*
+	 * Register a notifier anyway straight upon protocol initialization
+	 * since there could be some DEs that are ONLY reported by notifications
+	 * even though the chosen collection method was SHMTI/FCs.
+	 */
+	if (ti->info.continuos_update_support) {
+		ti->telemetry_nb.notifier_call = &scmi_telemetry_notifier;
+		ret = ph->instance_notifier_register(ph, SCMI_EVENT_TELEMETRY_UPDATE,
+						     NULL, &ti->telemetry_nb);
+		if (ret) {
+			dev_err(ph->dev,
+				"Could NOT register Telemetry notifier\n");
+			return ret;
+		}
+	}
+
+	return 0;
 }
 
 static const struct scmi_protocol scmi_telemetry = {
@@ -3474,6 +3619,7 @@ static const struct scmi_protocol scmi_telemetry = {
 	.owner = THIS_MODULE,
 	.instance_init = &scmi_telemetry_protocol_init,
 	.ops = &tlm_proto_ops,
+	.events = &tlm_protocol_events,
 	.supported_version = SCMI_PROTOCOL_SUPPORTED_VERSION,
 };
 
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index aadabaee6067..2d571c78613b 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -1252,6 +1252,7 @@ enum scmi_notification_events {
 	SCMI_EVENT_SYSTEM_POWER_STATE_NOTIFIER = 0x0,
 	SCMI_EVENT_POWERCAP_CAP_CHANGED = 0x0,
 	SCMI_EVENT_POWERCAP_MEASUREMENTS_CHANGED = 0x1,
+	SCMI_EVENT_TELEMETRY_UPDATE = 0x0,
 };
 
 struct scmi_power_state_changed_report {
@@ -1339,4 +1340,12 @@ struct scmi_powercap_meas_changed_report {
 	unsigned int	domain_id;
 	unsigned int	power;
 };
+
+struct scmi_telemetry_update_report {
+	ktime_t		timestamp;
+	unsigned int	agent_id;
+	int		status;
+	unsigned int	num_dwords;
+	unsigned int	dwords[];
+};
 #endif /* _LINUX_SCMI_PROTOCOL_H */
-- 
2.54.0


