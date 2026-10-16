Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD934CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 18:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/RDg8rFx5/eCiJfpfx0wttIosYd458qWUg5nd+ni7K4=; b=PNJ1hXtaIyAtln4clKr9bQz7uC
	6NFxFIoBjOAe3vZhdQHKZaIiUHqfbUAKynDSfb/jAcofWrv38ktd/AS5ZjlQoMpWIng4k/AQqKryh
	4Au0ZTSLAs149dnCZ2hAiI5ObpeDlwQPlLz6UNzwIVudxk1M0O7oGCz+LcYkrx3bTYzOmgrDKQr13
	7f/1MPjFDXhQjoucwxtMZOfoSiWmk3XEHh2mHGE7F5r/z77FOxVX96g2cJjqERSvb4sM8PyLeK74/
	kLg+vKpVppkaYD3sATGzMA4pvkHe4MnkQl5ZHpsbjqfHFz8z0w/g0w/ie/h3oBWqnlI+x2UgGfsFw
	TGa82dsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHn7P-00000003kOX-29wr;
	Fri, 16 Oct 2026 18:57:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHn7D-00000003kEK-2Ji6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 18:57:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 879181516;
	Fri, 16 Oct 2026 11:57:10 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 525923F7B4;
	Fri, 16 Oct 2026 11:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792177033; bh=G+kFM5ko+FL7V++pXRetiHeNyezL/zKF995kLf7Keds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e1DSnT+DBhXvp6qfhUGUisFB/+Ukibjp5FLF1ChL3OVvRcPAMnvcPtFbBYFgik9nH
	 PlXr5DlKF88iU6C7LPGbFfc0jW8jwXc2aADCXfW87I0OLOTCDjClAQ8C4o5GX8UjoD
	 6weD+N4DXHWbgAAtqSy5HXaXxLXMdTtSGr2bsI64=
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
Subject: [PATCH v14 10/32] firmware: arm_scmi: Add Telemetry update intervals enumeration
Date: Fri, 16 Oct 2026 19:55:31 +0100
Message-ID: <20261016185553.2794459-11-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261016185553.2794459-1-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_115715_724058_493FC0E2 
X-CRM114-Status: GOOD (  17.91  )
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

Add support to enumerate available Telemetry update intervals.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v13 --> v14
 - splitted out of the old Basic Telemetry patch, contains the
   update_intervals enumeration routines
---
 drivers/firmware/arm_scmi/telemetry.c | 199 ++++++++++++++++++++++++++
 include/linux/scmi_protocol.h         |  21 +++
 2 files changed, 220 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 9e3dc2c2cc4b..b27d09496b53 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -91,6 +91,21 @@ struct scmi_msg_resp_telemetry_de_description {
 	struct scmi_de_desc desc[];
 };
 
+struct scmi_msg_telemetry_update_intervals {
+	__le32 index;
+	__le32 group_identifier;
+#define	ALL_DES_NO_GROUP	0x0
+#define SPECIFIC_GROUP_DES	0x1
+#define ALL_DES_ANY_GROUP	0x2
+	__le32 flags;
+};
+
+struct scmi_msg_resp_telemetry_update_intervals {
+	__le32 flags;
+#define INTERVALS_DISCRETE(x)	(le32_get_bits((x), BIT(12)) == 0)
+	__le32 intervals[];
+};
+
 enum timestamps {
 	TSTAMP_NONE = 0,
 	TSTAMP_LINE = 1,
@@ -601,6 +616,177 @@ static int scmi_telemetry_de_descriptors_get(struct telemetry_info *ti)
 	return scmi_telemetry_de_groups_init(ph->dev, ti);
 }
 
+struct scmi_tlm_ivl_priv {
+	struct device *dev;
+	struct scmi_telemetry_intervals **intrvs;
+	unsigned int grp_id;
+	unsigned int flags;
+};
+
+static void iter_intervals_prepare_message(void *message,
+					   unsigned int desc_index,
+					   const void *priv)
+{
+	struct scmi_msg_telemetry_update_intervals *msg = message;
+	const struct scmi_tlm_ivl_priv *p = priv;
+
+	msg->index = cpu_to_le32(desc_index);
+	msg->group_identifier = cpu_to_le32(p->grp_id);
+	msg->flags = cpu_to_le32(FIELD_PREP(GENMASK(3, 0), p->flags));
+}
+
+static int iter_intervals_update_state(struct scmi_iterator_state *st,
+				       const void *response, void *priv)
+{
+	const struct scmi_msg_resp_telemetry_update_intervals *r = response;
+
+	st->num_returned = le32_get_bits(r->flags, GENMASK(11, 0));
+	st->num_remaining = le32_get_bits(r->flags, GENMASK(31, 16));
+
+	if (st->rx_len < (sizeof(*r) + sizeof(r->intervals[0]) * st->num_returned))
+		return -EINVAL;
+
+	/*
+	 * total intervals is not declared previously anywhere so we
+	 * assume it's returned+remaining on first call.
+	 */
+	if (!st->max_resources) {
+		struct scmi_tlm_ivl_priv *p = priv;
+		struct scmi_telemetry_intervals *intrvs;
+		bool discrete;
+		int inum;
+
+		discrete = INTERVALS_DISCRETE(r->flags);
+		/* Check consistency on first call */
+		if (!discrete && (st->num_returned != 3 || st->num_remaining != 0))
+			return -EINVAL;
+
+		inum = st->num_returned + st->num_remaining;
+		intrvs = kzalloc_flex(*intrvs, update_intervals, inum);
+		if (!intrvs)
+			return -ENOMEM;
+
+		intrvs->num_intervals = inum;
+		intrvs->discrete = discrete;
+		st->max_resources = intrvs->num_intervals;
+
+		*p->intrvs = intrvs;
+	}
+
+	return 0;
+}
+
+static int
+iter_intervals_process_response(const struct scmi_protocol_handle *ph,
+				const void *response,
+				struct scmi_iterator_state *st, void *priv)
+{
+	const struct scmi_msg_resp_telemetry_update_intervals *r = response;
+	struct scmi_tlm_ivl_priv *p = priv;
+	struct scmi_telemetry_intervals *intrvs = *p->intrvs;
+	unsigned int idx = st->loop_idx;
+
+	intrvs->update_intervals[st->desc_index + idx] =
+		le32_to_cpu(r->intervals[idx]);
+
+	return 0;
+}
+
+static int
+scmi_tlm_enumerate_update_intervals(struct telemetry_info *ti,
+				    struct scmi_telemetry_intervals **intervals,
+				    int grp_id, unsigned int flags)
+{
+	struct scmi_iterator_ops ops = {
+		.prepare_message = iter_intervals_prepare_message,
+		.update_state = iter_intervals_update_state,
+		.process_response = iter_intervals_process_response,
+	};
+	const struct scmi_protocol_handle *ph = ti->ph;
+	struct scmi_telemetry_intervals *intrvs = NULL;
+	struct scmi_tlm_ivl_priv ipriv = {
+		.dev = ph->dev,
+		.grp_id = grp_id,
+		.intrvs = &intrvs,
+		.flags = flags,
+	};
+	void *iter;
+	int ret;
+
+	iter = ph->hops->iter_response_init(ph, &ops, 0,
+		TELEMETRY_LIST_UPDATE_INTERVALS,
+		sizeof(struct scmi_msg_telemetry_update_intervals),
+		&ipriv);
+	if (IS_ERR(iter))
+		return PTR_ERR(iter);
+
+	/* Cleanup iterator inner allocations on failure */
+	ret = ph->hops->iter_response_run(iter);
+	if (ret) {
+		kfree(intrvs);
+		return ret;
+	}
+
+	*intervals = intrvs;
+
+	return 0;
+}
+
+static int
+scmi_telemetry_enumerate_groups_intervals(struct telemetry_info *ti)
+{
+	struct scmi_telemetry_res_info *rinfo;
+
+	if (!ti->info.per_group_config_support)
+		return 0;
+
+	/* Get rinfo without triggering a recursive enumeration */
+	rinfo = __scmi_telemetry_resources_get(ti);
+
+	for (int id = 0; id < rinfo->num_groups; id++) {
+		int ret;
+
+		ret = scmi_tlm_enumerate_update_intervals(ti,
+							  &rinfo->grps[id].intervals,
+							  id, SPECIFIC_GROUP_DES);
+		if (ret)
+			return ret;
+
+		rinfo->grps_store[id].num_intervals =
+			rinfo->grps[id].intervals->num_intervals;
+	}
+
+	return 0;
+}
+
+static void scmi_telemetry_intervals_free(void *interval)
+{
+	kfree(interval);
+}
+
+static int
+scmi_telemetry_enumerate_common_intervals(struct telemetry_info *ti)
+{
+	unsigned int flags;
+	int ret;
+
+	flags = !ti->info.per_group_config_support ?
+		ALL_DES_ANY_GROUP : ALL_DES_NO_GROUP;
+
+	ret = scmi_tlm_enumerate_update_intervals(ti, &ti->info.intervals,
+						  SCMI_TLM_GRP_INVALID, flags);
+	if (ret)
+		return ret;
+
+	/* A copy for UAPI access... */
+	ti->info.base.num_intervals = ti->info.intervals->num_intervals;
+
+	/* Delegate freeing of allocated intervals to unbind time */
+	return devm_add_action_or_reset(ti->ph->dev,
+					scmi_telemetry_intervals_free,
+					ti->info.intervals);
+}
+
 static const struct scmi_telemetry_info *
 scmi_telemetry_info_get(const struct scmi_protocol_handle *ph)
 {
@@ -773,6 +959,7 @@ static void scmi_telemetry_groups_free(struct scmi_telemetry_res_info *rinfo)
 
 		kfree(grp->des);
 		kfree(grp->des_str);
+		kfree(grp->intervals);
 	}
 }
 
@@ -836,6 +1023,12 @@ scmi_telemetry_resources_enumerate(struct telemetry_info *ti)
 		goto done;
 	}
 
+	ret = scmi_telemetry_enumerate_groups_intervals(ti);
+	if (ret) {
+		dev_err(dev, FW_BUG "Cannot fully enumerate group intervals. Degraded system.\n");
+		goto done;
+	}
+
 	ti->rinfo->fully_enumerated = true;
 done:
 	/* Disable initialization permanently */
@@ -910,6 +1103,12 @@ static int scmi_telemetry_protocol_init(const struct scmi_protocol_handle *ph)
 		return ret;
 	}
 
+	ret = scmi_telemetry_enumerate_common_intervals(ti);
+	if (ret) {
+		dev_err(dev, FW_BUG "Cannot enumerate update intervals. Abort.\n");
+		return ret;
+	}
+
 	ti->info.base.version = ph->version;
 
 	return ph->set_priv(ph, ti);
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 51d4cbfc0969..26a18698681a 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -826,8 +826,25 @@ struct scmi_pinctrl_proto_ops {
 	int (*pin_free)(const struct scmi_protocol_handle *ph, u32 pin);
 };
 
+#define	SCMI_TLM_GET_UPDATE_INTERVAL_SECS(x)	(FIELD_GET(GENMASK(20, 5), (x)))
+#define SCMI_TLM_GET_UPDATE_INTERVAL_EXP(x)	(sign_extend32((x), 4))
+
+#define SCMI_TLM_GET_UPDATE_INTERVAL(x)		(FIELD_GET(GENMASK(20, 0), (x)))
+#define SCMI_TLM_BUILD_UPDATE_INTERVAL(s, e)				    \
+	(FIELD_PREP(GENMASK(20, 5), (s)) | FIELD_PREP(GENMASK(4, 0), (e)))
+
 #define SCMI_TLM_GRP_INVALID		0xFFFFFFFF
 
+struct scmi_telemetry_intervals {
+	unsigned int grp_id;
+	bool discrete;
+	unsigned int num_intervals;
+#define SCMI_TLM_UPDATE_INTVL_SEGMENT_LOW	0
+#define SCMI_TLM_UPDATE_INTVL_SEGMENT_HIGH	1
+#define SCMI_TLM_UPDATE_INTVL_SEGMENT_STEP	2
+	unsigned int update_intervals[] __counted_by(num_intervals);
+};
+
 struct scmi_telemetry_grp_info {
 	unsigned int grp_id;
 	unsigned int num_des;
@@ -840,6 +857,8 @@ struct scmi_telemetry_group {
 	unsigned int *des;
 	char *des_str;
 	struct scmi_telemetry_grp_info *info;
+	unsigned int active_update_interval;
+	struct scmi_telemetry_intervals *intervals;
 };
 
 struct scmi_telemetry_de_info {
@@ -893,6 +912,8 @@ struct scmi_telemetry_info {
 	bool reset_support;
 	bool fc_support;
 	struct scmi_telemetry_base_info base;
+	unsigned int active_update_interval;
+	struct scmi_telemetry_intervals *intervals;
 };
 
 /**
-- 
2.54.0


