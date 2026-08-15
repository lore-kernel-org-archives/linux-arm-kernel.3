Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC56C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 23:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bs9U17BdOCVa9r+RE8shAPRL7++S4+JfheFTJBOlRU8=; b=WtPy54LfPd2rv4+ikFdjcYy77o
	MWdSRY5Kouip75ZX2TtqFbYaYmldDq+OMyDu+WpVOEwsM7wts4186wgxKHYvFpAwZg1EKdRq7pCwX
	hn7XKzo52iQGwM9ftI1No6PyY9fyVJXfMqAw7oVYEpsPGxEtT2EG2Bv+jBwq9ZOWgNOGCufn23ECy
	3Am6VKDgdSOvey05uopUoILfPljIyUf1VzQrqY9rFAcedH6wO/pXZk8UWbmtF/mhvtDGoffML3n1H
	j2yTXwsPzEAvnlHbt+I9Oy9qPdU77ZXimkojiEjnDckbytSFfUxErnr8/ZgxFtWZHvQOx1Yet+OrV
	98I7BJOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvNn9-00000004I26-46Rd;
	Sat, 15 Aug 2026 23:27:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvNmi-00000004HdF-41Ms
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 23:27:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48A331596;
	Sat, 15 Aug 2026 16:27:24 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1BB03F673;
	Sat, 15 Aug 2026 16:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786836448; bh=u+iCe7VDsM0O2SVmwo5C7DY2fR/FA5mGRrm9lPyhUY4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jp5pATEkgDddM0ERm1s172f8nWtFTLhuyaLIH7++Xfw/eLCfc9JuQYpIOvX3XpCYA
	 jtE2pu6LG5fHaMoZPDMjborWAegCQUSwMCNGuNX/Fr5ri+r9GUsXxYQB8fAe55Xp0e
	 J41wO3x5yELvy7V3jHMXNbgeZgGzzXsmpTOhNWpw=
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
Subject: [PATCH v10 14/24] firmware: arm_scmi: Add Telemetry generation counter event
Date: Sun, 16 Aug 2026 00:25:54 +0100
Message-ID: <20260815232604.3730754-15-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260815232604.3730754-1-cristian.marussi@arm.com>
References: <20260815232604.3730754-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_162729_094630_1780CFD6 
X-CRM114-Status: GOOD (  17.83  )
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

Add a per-instance generation counter to track configuration changes which
uses the common telemetry events framework.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v6 --> v7
 - use new Generic event mechanism based on EventFD instead of WaitQ
v5 --> v6
 - add relese semantic to the atomic set of the generation counter
 - use new eventfd_ctx common event logic
---
 drivers/firmware/arm_scmi/telemetry.c | 44 +++++++++++++++++++++++++++
 include/linux/scmi_protocol.h         |  6 ++--
 2 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 2f74143467cf..8a0cd7f08231 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -24,6 +24,7 @@
 #include <linux/string.h>
 #include <linux/uuid.h>
 #include <linux/xarray.h>
+#include <linux/wait.h>
 
 #include "protocols.h"
 #include "notify.h"
@@ -33,6 +34,7 @@
 /* Updated only after ALL the mandatory features for that version are merged */
 #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
 
+#define SCMI_TLM_GENERATION_ONE		(SCMI_TLM_GENERATION_INVALID + 1U)
 #define SCMI_TLM_TDCF_MAX_RETRIES	5
 
 #define SCMI_TLM_DE_IMPL_NUM_DWORDS	4
@@ -690,6 +692,35 @@ scmi_telemetry_tde_cache_lookup(struct telemetry_de *tde,
 	return 0;
 }
 
+static inline void __scmi_telemetry_generation_set(struct telemetry_info *ti,
+						   unsigned int new)
+{
+	int ret;
+
+	atomic_set_release(&ti->info.generation, new);
+
+	ret = scmi_telemetry_event_signal(ti, SCMI_TLM_EVT_GENERATION);
+	if (ret)
+		dev_warn_once(ti->ph->dev,
+			      "Could NOT signal telemetry event %d\n",
+			      SCMI_TLM_EVT_GENERATION);
+}
+
+static inline void scmi_telemetry_generation_update(struct telemetry_info *ti)
+{
+	unsigned int next;
+
+	/* Wrap around skipping invalid generation 0 */
+	next = (atomic_read(&ti->info.generation) + 1) ?: SCMI_TLM_GENERATION_ONE;
+
+	__scmi_telemetry_generation_set(ti, next);
+}
+
+static inline void scmi_telemetry_generation_reset(struct telemetry_info *ti)
+{
+	__scmi_telemetry_generation_set(ti, SCMI_TLM_GENERATION_ONE);
+}
+
 struct scmi_tlm_de_priv {
 	struct telemetry_info *ti;
 	void *next;
@@ -2475,6 +2506,8 @@ static int __scmi_telemetry_state_set(const struct scmi_protocol_handle *ph,
 						       tstamp_enabled_state,
 						       *tstamp);
 
+		/* A local change can have an impact anyway */
+		scmi_telemetry_generation_update(ti);
 		return 0;
 	}
 
@@ -2536,6 +2569,9 @@ static int __scmi_telemetry_state_set(const struct scmi_protocol_handle *ph,
 
 	ph->xops->xfer_put(ph, t);
 
+	if (!ret)
+		scmi_telemetry_generation_update(ti);
+
 	return ret;
 }
 
@@ -2705,6 +2741,9 @@ scmi_telemetry_collection_configure(const struct scmi_protocol_handle *ph,
 
 	ph->xops->xfer_put(ph, t);
 
+	if (!ret)
+		scmi_telemetry_generation_update(ti);
+
 	return ret;
 }
 
@@ -3189,6 +3228,9 @@ static int scmi_telemetry_reset(const struct scmi_protocol_handle *ph)
 		struct telemetry_info *ti = ph->get_priv(ph);
 
 		scmi_telemetry_local_resources_reset(ti);
+		/* Reset generation now that server has been reset */
+		scmi_telemetry_generation_reset(ti);
+
 		/* NO need to lookup the initial state we have just reset all */
 	}
 
@@ -3649,6 +3691,8 @@ static int scmi_telemetry_instance_init(struct telemetry_info *ti)
 	for (int i = 0; i < SCMI_TLM_EVT_MAX; i++)
 		INIT_LIST_HEAD(&ti->events[i]);
 	mutex_init(&ti->events_mtx);
+	/* Generation counter init */
+	atomic_set(&ti->info.generation, SCMI_TLM_GENERATION_ONE);
 	atomic_set(&ti->des_enabled[ENA_STATE], 0);
 	atomic_set(&ti->des_enabled[ENA_TSTAMP], 0);
 	/* Setup resources lazy initialization */
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 06591b27f365..83ab8edc0b13 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -891,6 +891,7 @@ enum scmi_telemetry_collection {
 	SCMI_TLM_SINGLE_READ,
 };
 
+#define SCMI_TLM_GENERATION_INVALID	0U
 #define SCMI_TLM_GRP_INVALID		0xFFFFFFFF
 
 struct scmi_telemetry_intervals {
@@ -986,6 +987,7 @@ struct scmi_telemetry_info {
 	bool enabled;
 	bool notif_enabled;
 	enum scmi_telemetry_collection current_mode;
+	atomic_t generation;
 };
 
 struct scmi_telemetry_de_sample {
@@ -996,7 +998,7 @@ struct scmi_telemetry_de_sample {
 };
 
 enum scmi_telemetry_event {
-	SCMI_TLM_EVT_DUMMY,
+	SCMI_TLM_EVT_GENERATION,
 	SCMI_TLM_EVT_MAX,
 };
 
@@ -1022,11 +1024,11 @@ enum scmi_telemetry_event {
  *		    the ones belonging to a specific group when provided.
  *		    This causes an immediate update platform-side of all the
  *		    enabled DEs.
- * @reset: reset configuration and telemetry data.
  * @event_subscribe: subscribe to the specified event @type using the provided
  *		     @eventfd_ctx.
  * @event_unsubscribe: unsubscribe to the specified event @type the previously
  *		       registered @eventfd_ctx.
+ * @reset: reset configuration and telemetry data.
  */
 struct scmi_telemetry_proto_ops {
 	const struct scmi_telemetry_info __must_check *(*info_get)
-- 
2.54.0


