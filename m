Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F7AC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 22:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vKBTcPjtidz7G0LMIsiSOIc/V7aeFqjtZ2ONPPpjUvU=; b=VpJVISyWr/RmWo/V/qRwCClsqv
	BlC6N0PbZ/aJgd3TGafoHsCr4fjlRFbAOsed+o+0Wef+G9scrCLMGdw2H1TzD+ep3vpZPhp56+jDy
	8ScRNeYWHtDzQ0rmX+n5jdtV4O7iYpjJFMJ/hh0X/bbzq6q4svFyUrOxoyHmVq0D0I8oIpHu0wO8A
	3M+mZyzULlqO+KiRsCUBjaDcmuQKKd0lNhoqrSIgJq5FrlU/li5e2+2AVKWN/zJ3avczmAkVsdc2l
	dBLBavCVrgLAIs7hGC7+AXrO1fVNEEtlOwmO1mC8Q475MclOkoZgNSUW7UdGogkz97WcWmCg4vnNW
	7z7x+pGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4QPt-0000000CyEy-3SFH;
	Wed, 09 Sep 2026 22:05:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4QPp-0000000Cy9D-3m7F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 22:05:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42BD01F02;
	Wed,  9 Sep 2026 15:05:09 -0700 (PDT)
Received: from oss-apollo7005.lab.cambridge.arm.com (oss-apollo7005.lab.cambridge.arm.com [10.7.15.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6B6A3F7D8;
	Wed,  9 Sep 2026 15:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788991512; bh=ef6477RX1SfbSDDZb7uxx5n4DKa8eFEJI2ut9zi+u/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H9Om7JesHCwfATNdzDlg8Qb+DhYNd9EtmOI4cYAb0ZBiMRUq+7/4z+74JJH/YlKKr
	 Py07qOOmFtmF9M9MH+kaDh0RKHSo9rL1OjiorW8XnwQ6/KiUs4oDeXFBgAv2E0Grpz
	 7sRWduRz1eY3cqKvCvdS9R0QZnsmgq3Cy9P3f+i4=
From: Philip Radford <philip.radford@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	d-gole@ti.com,
	souvik.chakravarty@arm.com,
	philip.radford@arm.com
Subject: [PATCH v9 10/13] firmware: arm_scmi: add Powercap MAI get/set support
Date: Wed,  9 Sep 2026 22:04:34 +0000
Message-Id: <20260909220437.1254412-11-philip.radford@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260909220437.1254412-1-philip.radford@arm.com>
References: <20260909220437.1254412-1-philip.radford@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_150514_144940_21D1785C 
X-CRM114-Status: GOOD (  18.18  )
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

Add support for Power Measurement Averaging Interval (MAI) get and set
operations to the SCMI powercap protocol driver. Extends scmi_powercap_info
to store MAI configuration and implement MAI get/set via xfer and optional
fast-channel support.

Signed-off-by: Philip Radford <philip.radford@arm.com>
---
V8->V9
- Separated out domain specific fastchannel initialisation from per-cpl loop
- Amended per-cpl fast channels to use firmware cpl id instead of relying on
  num_cpli numbering
---
 drivers/firmware/arm_scmi/powercap.c | 175 ++++++++++++++++++++++++---
 include/linux/scmi_protocol.h        |  18 +++
 2 files changed, 173 insertions(+), 20 deletions(-)

diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm_scmi/powercap.c
index 2e30bc00f056..7d426c56b9c1 100644
--- a/drivers/firmware/arm_scmi/powercap.c
+++ b/drivers/firmware/arm_scmi/powercap.c
@@ -427,6 +427,34 @@ scmi_powercap_domain_attrs_process(const struct scmi_protocol_handle *ph,
 		dom_info->notify_powercap_measurement_change =
 			SUPPORTS_POWERCAP_MEASUREMENTS_CHANGE_NOTIFY(flags);
 
+	if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
+		struct scmi_msg_resp_powercap_domain_attributes_v3 *resp_v3 = r;
+
+		flags = le32_to_cpu(resp_v3->attributes);
+		if (pinfo->notify_measurements_cmd)
+			dom_info->notify_powercap_measurement_change =
+			       SUPPORTS_POWERCAP_MEASUREMENTS_CHANGE_NOTIFY(flags);
+
+		dom_info->mai_config = SUPPORTS_POWERCAP_MAI_CONFIGURATION(flags);
+		dom_info->min_mai = le32_to_cpu(resp_v3->min_mai);
+		dom_info->max_mai = le32_to_cpu(resp_v3->max_mai);
+		dom_info->mai_step = le32_to_cpu(resp_v3->mai_step);
+
+		if (dom_info->mai_config) {
+			ret = scmi_powercap_validate(dom_info->min_mai,
+						     dom_info->max_mai,
+						     dom_info->mai_step,
+						     dom_info->mai_config);
+
+			if (ret) {
+				dev_warn(ph->dev, "Platform reported invalid MAI config for domain %d - %s\n",
+					 dom_info->id, dom_info->name);
+
+				return ret;
+			}
+		}
+	}
+
 	dom_info->extended_names = SUPPORTS_EXTENDED_NAMES(flags);
 
 	dom_info->async_powercap_cap_set =
@@ -1133,6 +1161,103 @@ static int scmi_powercap_cap_enable_get(const struct scmi_protocol_handle *ph,
 	return 0;
 }
 
+static int scmi_powercap_xfer_mai_get(const struct scmi_protocol_handle *ph,
+				      u32 domain_id, u32 *mai)
+{
+	int ret;
+	struct scmi_xfer *t;
+
+	ret = ph->xops->xfer_get_init(ph, POWERCAP_MAI_GET, sizeof(u32),
+				      sizeof(u32), &t);
+
+	if (ret)
+		return ret;
+
+	put_unaligned_le32(domain_id, t->tx.buf);
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret)
+		*mai = get_unaligned_le32(t->rx.buf);
+
+	ph->xops->xfer_put(ph, t);
+	return ret;
+}
+
+static int scmi_powercap_xfer_mai_set(const struct scmi_protocol_handle *ph,
+				      u32 domain_id, u32 mai)
+{
+	int ret;
+	struct scmi_xfer *t;
+	struct scmi_msg_powercap_cap_or_pai_set *msg;
+
+	ret = ph->xops->xfer_get_init(ph, POWERCAP_MAI_SET, sizeof(*msg),
+				      0, &t);
+	if (ret)
+		return ret;
+
+	msg = t->tx.buf;
+	msg->domain_id = cpu_to_le32(domain_id);
+	msg->flags = cpu_to_le32(0);
+	msg->value = cpu_to_le32(mai);
+
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+	return ret;
+}
+
+static int
+scmi_powercap_measurements_interval_get(const struct scmi_protocol_handle *ph,
+					u32 domain_id,
+					u32 *val)
+{
+	const struct scmi_powercap_info *pc;
+	struct scmi_fc_info *fci;
+
+	if (!val)
+		return -EINVAL;
+
+	pc = scmi_powercap_dom_info_get(ph, domain_id);
+	if (!pc)
+		return -EINVAL;
+
+	fci = pc->cpli[CPL0].fc_info;
+	if (fci && fci[POWERCAP_FC_MAI].get_addr) {
+		*val = ioread32(fci[POWERCAP_FC_MAI].get_addr);
+		trace_scmi_fc_call(SCMI_PROTOCOL_POWERCAP, POWERCAP_MAI_GET,
+				   domain_id, 0, *val, 0);
+		return 0;
+	}
+
+	return scmi_powercap_xfer_mai_get(ph, domain_id, val);
+}
+
+static int
+scmi_powercap_measurements_interval_set(const struct scmi_protocol_handle *ph,
+					u32 domain_id,
+					u32 val)
+{
+	const struct scmi_powercap_info *pc;
+	struct scmi_fc_info *fci;
+
+	pc = scmi_powercap_dom_info_get(ph, domain_id);
+	if (!pc)
+		return -EINVAL;
+
+	if (!pc->mai_config || !val || val < pc->min_mai || val > pc->max_mai)
+		return -EINVAL;
+
+	fci = pc->cpli[CPL0].fc_info;
+	if (fci && fci[POWERCAP_FC_MAI].set_addr) {
+		iowrite32(val, fci[POWERCAP_FC_MAI].set_addr);
+		ph->hops->fastchannel_db_ring(fci[POWERCAP_FC_MAI].set_db);
+		trace_scmi_fc_call(SCMI_PROTOCOL_POWERCAP, POWERCAP_MAI_SET, domain_id, 0, val, 0);
+		return 0;
+	}
+
+	return scmi_powercap_xfer_mai_set(ph, domain_id, val);
+}
+
 static const struct scmi_powercap_proto_ops powercap_proto_ops = {
 	.num_domains_get = scmi_powercap_num_domains_get,
 	.info_get = scmi_powercap_dom_info_get,
@@ -1145,6 +1270,8 @@ static const struct scmi_powercap_proto_ops powercap_proto_ops = {
 	.measurements_get = scmi_powercap_measurements_get,
 	.measurements_threshold_set = scmi_powercap_measurements_threshold_set,
 	.measurements_threshold_get = scmi_powercap_measurements_threshold_get,
+	.measurements_interval_get = scmi_powercap_measurements_interval_get,
+	.measurements_interval_set = scmi_powercap_measurements_interval_set,
 };
 
 static void scmi_powercap_domain_init_fc(const struct scmi_protocol_handle *ph,
@@ -1154,14 +1281,14 @@ static void scmi_powercap_domain_init_fc(const struct scmi_protocol_handle *ph,
 
 	for (int id = 0; id < dom_info->num_cpli; id++) {
 		struct scmi_fc_info *fc;
-		u32 *cpl_id, zero_cpl_id = 0;
+		u32 *cpl_id;
+		u32 cpl_fw_id = dom_info->cpli[id].id;
 
 		fc = devm_kcalloc(ph->dev, POWERCAP_FC_MAX, sizeof(*fc), GFP_KERNEL);
 		if (!fc)
 			return;
 
-		/* NOTE THAT when num_cpli == 1 the arg *cpl_id is 0 */
-		cpl_id = (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) ? &id : NULL;
+		cpl_id = (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) ? &cpl_fw_id : NULL;
 
 		ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
 					   POWERCAP_CAP_SET, 4, dom_info->id,
@@ -1188,29 +1315,37 @@ static void scmi_powercap_domain_init_fc(const struct scmi_protocol_handle *ph,
 						dom_info->id, cpl_id,
 						&fc[POWERCAP_FC_XAI].get_addr, NULL,
 						&fc[POWERCAP_FC_XAI].rate_limit);
-			ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
-							POWERCAP_MAI_SET, 4,
-							dom_info->id, &zero_cpl_id,
-							&fc[POWERCAP_FC_MAI].set_addr,
-							&fc[POWERCAP_FC_MAI].set_db,
-							&fc[POWERCAP_FC_MAI].rate_limit);
-
-			ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
-							POWERCAP_MAI_GET, 4,
-							dom_info->id, &zero_cpl_id,
-							&fc[POWERCAP_FC_MAI].get_addr, NULL,
-							&fc[POWERCAP_FC_MAI].rate_limit);
 
-			ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
-							POWERCAP_MEASUREMENTS_GET, 4,
-							dom_info->id, &zero_cpl_id,
-							&fc[POWERCAP_FC_MEASUREMENT].get_addr, NULL,
-							&fc[POWERCAP_FC_MEASUREMENT].rate_limit);
 		}
 
 		dom_info->cpli[id].fc_info = fc;
 	}
 
+	if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
+		u32 zero_cpl_id = 0;
+
+		fc_cpl0 = dom_info->cpli[CPL0].fc_info;
+
+		ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
+					   POWERCAP_MAI_SET, 4,
+					   dom_info->id, &zero_cpl_id,
+					   &fc_cpl0[POWERCAP_FC_MAI].set_addr,
+					   &fc_cpl0[POWERCAP_FC_MAI].set_db,
+					   &fc_cpl0[POWERCAP_FC_MAI].rate_limit);
+
+		ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
+					   POWERCAP_MAI_GET, 4,
+					   dom_info->id, &zero_cpl_id,
+					   &fc_cpl0[POWERCAP_FC_MAI].get_addr, NULL,
+					   &fc_cpl0[POWERCAP_FC_MAI].rate_limit);
+
+		ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
+					   POWERCAP_MEASUREMENTS_GET, 4,
+					   dom_info->id, &zero_cpl_id,
+					   &fc_cpl0[POWERCAP_FC_MEASUREMENT].get_addr, NULL,
+					   &fc_cpl0[POWERCAP_FC_MEASUREMENT].rate_limit);
+	}
+
 	if (PROTOCOL_REV_MAJOR(ph->version) < 0x3) {
 		fc_cpl0 = dom_info->cpli[CPL0].fc_info;
 		ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 583122037bf6..eeb5e609e782 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -658,6 +658,12 @@ struct scmi_powercap_cpl_info {
  *		       reports power data on an abstract linear scale.
  * @extended_names: Support for long names.
  * @fastchannels: Support for at least one fastchannel,
+ * @mai_config: MAI configuration support.
+ * @min_mai: Minimum supported Power Measurement Averaging Interval in
+ *			microseconds.
+ * @max_mai: Maximum supporte Power Measurement Averaging Interval in
+			microseconds.
+ * @mai_step: Step size between supported MAI values in microseconds.
  * @name: name assigned to the Powercap Domain by platform.
  * @sustainable_power: Maximum sustainable power consumption for this domain
  *		       under normal conditions.
@@ -679,6 +685,10 @@ struct scmi_powercap_info {
 	bool powercap_scale_uw;
 	bool extended_names;
 	bool fastchannels;
+	bool mai_config;
+	u32 min_mai;
+	u32 max_mai;
+	u32 mai_step;
 	char name[SCMI_MAX_STR_SIZE];
 	unsigned int sustainable_power;
 	unsigned int accuracy;
@@ -737,6 +747,10 @@ struct scmi_powercap_info {
  * @measurements_threshold_get: get the currently configured low and high power
  *				thresholds used when registering callbacks for
  *				notification POWERCAP_MEASUREMENTS_NOTIFY.
+ * @measurements_interval_get: get the current Power Measurement Averaging
+ *				Interval (MAI) value for the specified domain.
+ * @measurements_interval_set: set the Power Measurement Averaging Interval
+ *				(MAI) value for the specified domain.
  */
 struct scmi_powercap_proto_ops {
 	int (*num_domains_get)(const struct scmi_protocol_handle *ph);
@@ -762,6 +776,10 @@ struct scmi_powercap_proto_ops {
 	int (*measurements_threshold_get)(const struct scmi_protocol_handle *ph,
 					  u32 domain_id, u32 *power_thresh_low,
 					  u32 *power_thresh_high);
+	int (*measurements_interval_get)(const struct scmi_protocol_handle *ph,
+					 u32 domain_id, u32 *val);
+	int (*measurements_interval_set)(const struct scmi_protocol_handle *ph,
+					 u32 domain_id, u32 val);
 };
 
 enum scmi_pinctrl_selector_type {
-- 
2.25.1


