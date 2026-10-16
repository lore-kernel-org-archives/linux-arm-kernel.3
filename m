Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D416CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 18:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bgra3BxEIGlsaAKcIEdoGtWPE9OTXIcVpwqZBq8xG2s=; b=koa7XNo2BVjK4NNkNxITG1T8jE
	ZJ9dLAcUl3G2X9MkUSbqOZ3ip4H+C9SxhjaQ4W+ne9FfsOfL2gi+JxIViBPNt69ZUzccEPOU5Kr9i
	mcxN3WbBVISwGXM6O2oIAIF29MSTWHMB+eGW1lrj7BosCRpxF9xVBsQaYtkXLSTNE5xPcR9gdDA2f
	i8gZa3Zxnxmqc+uWH5kZ8/qInN44tResSMbwLlS/G0GEpHRhL3iTPtAO9031sEy9RuRXQZxa8lupS
	nCr7IN6+XNgUc9K/3erlvN+TVA3ku9KqtpjxoPc34JUvOA8/KtmxrL4aHmz/vv2IjnfbP+idQ5HNm
	okEuh7zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHn6m-00000003ju1-1crs;
	Fri, 16 Oct 2026 18:56:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHn6h-00000003js2-2onR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 18:56:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E74914BF;
	Fri, 16 Oct 2026 11:56:39 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 478B33F7B4;
	Fri, 16 Oct 2026 11:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792177002; bh=xzcLgoMasxkE++6SrJ30wfYIbvLL2TT2AU643nKeL+8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IMF9MlwXVSwwE1ISMBbuv5MfPMAeyw6c0+iT3DGt3vW0vQKI6vpvnyo02lnTKen41
	 GOynDgZXkSZE7HiPKZq/r8D5poOUSm2Vvu5NbuqTKRs4ssqNNlHiDLs+UgtRcadGSH
	 cf/k5anngOjhc9D4oKvpdHTlbVSn+j3DXHo+E660=
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
Subject: [PATCH v14 02/32] firmware: arm_scmi: Allow registration of unknown-size events/reports
Date: Fri, 16 Oct 2026 19:55:23 +0100
Message-ID: <20261016185553.2794459-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261016185553.2794459-1-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_115645_284220_7279D1FC 
X-CRM114-Status: GOOD (  18.03  )
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

Allow protocols to register events with build-time unknown sizes: such
events can be declared zero-sized and let the core SCMI stack perform the
needed safe-net boundary checks based on the configured transport size.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v12 --> v13
 - improve variable naming
v10 --> v11
 - account for ktime_t field when checking boundary
v2 --> v3
 - split out of previous patch on protocol notifier
 - use max() instead of max_t()
---
 drivers/firmware/arm_scmi/notify.c | 25 ++++++++++++++++++++-----
 drivers/firmware/arm_scmi/notify.h |  8 ++++++--
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index fb60fb07c0ed..7d1bb424a723 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -595,7 +595,13 @@ int scmi_notify(const struct scmi_handle *handle, u8 proto_id, u8 evt_id,
 	if (!r_evt)
 		return -EINVAL;
 
-	if (len > r_evt->evt->max_payld_sz) {
+	/*
+	 * Events with a zero max_payld_sz are sized to be of the maximum
+	 * size allowed by the transport: no need to be size-checked here
+	 * since the transport layer would have already dropped such
+	 * over-sized messages.
+	 */
+	if (r_evt->evt->max_payld_sz && len > r_evt->evt->max_payld_sz) {
 		dev_err(handle->dev, "discard badly sized message\n");
 		return -EINVAL;
 	}
@@ -752,7 +758,7 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
 				  const struct scmi_protocol_handle *ph,
 				  const struct scmi_protocol_events *ee)
 {
-	int i;
+	int i, max_msg_sz, default_report_sz;
 	unsigned int num_sources;
 	size_t payld_sz = 0;
 	struct scmi_registered_events_desc *pd;
@@ -767,6 +773,9 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
 	if (!ni)
 		return -ENOMEM;
 
+	max_msg_sz = ph->hops->get_max_msg_size(ph);
+	default_report_sz = max_msg_sz + sizeof(ktime_t);
+
 	/* num_sources cannot be <= 0 */
 	if (ee->num_sources) {
 		num_sources = ee->num_sources;
@@ -779,8 +788,13 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
 	}
 
 	evt = ee->evts;
-	for (i = 0; i < ee->num_events; i++)
-		payld_sz = max_t(size_t, payld_sz, evt[i].max_payld_sz);
+	for (i = 0; i < ee->num_events; i++) {
+		if (evt[i].max_payld_sz == 0) {
+			payld_sz = max_msg_sz;
+			break;
+		}
+		payld_sz = max(payld_sz, evt[i].max_payld_sz);
+	}
 	payld_sz += sizeof(struct scmi_event_header);
 
 	pd = scmi_allocate_registered_events_desc(ni, proto_id, ee->queue_sz,
@@ -807,7 +821,8 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
 		mutex_init(&r_evt->sources_mtx);
 
 		r_evt->report = devm_kzalloc(ni->handle->dev,
-					     evt->max_report_sz, GFP_KERNEL);
+					     evt->max_report_sz ?: default_report_sz,
+					     GFP_KERNEL);
 		if (!r_evt->report)
 			return -ENOMEM;
 
diff --git a/drivers/firmware/arm_scmi/notify.h b/drivers/firmware/arm_scmi/notify.h
index f18f98c5ab3b..ff4044fd7448 100644
--- a/drivers/firmware/arm_scmi/notify.h
+++ b/drivers/firmware/arm_scmi/notify.h
@@ -18,8 +18,12 @@
 /**
  * struct scmi_event  - Describes an event to be supported
  * @id: Event ID
- * @max_payld_sz: Max possible size for the payload of a notification message
- * @max_report_sz: Max possible size for the report of a notification message
+ * @max_payld_sz: Max possible size for the payload of a notification message.
+ *		  Set to zero to use the maximum message size allowed by the
+ *		  transport.
+ * @max_report_sz: Max possible size for the report of a notification message.
+ *		   Set to zero to use the maximum message size allowed by the
+ *		   transport plus the additional ktime_t timestamp.
  *
  * Each SCMI protocol, during its initialization phase, can describe the events
  * it wishes to support in a few struct scmi_event and pass them to the core
-- 
2.54.0


