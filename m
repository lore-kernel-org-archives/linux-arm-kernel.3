Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568E5606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 23:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j18utw2H;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gFCqoSGq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=X5mulTtwuiDu6oBH63Wxek1FVxJ/3qD8ZV4+cfvjAFY=; b=j18utw2HyLRfU3
	ZZTJEQllA2nJLAJElgfCWmIyQ55kYe+897hlI8D1p1Ne47Q4YEdC6UAK5TciqvgqaiacEzLt1pQKH
	4NyiGzg816e1457993Bq+R44gI7+v6nOcG09QYIZnm9peolfl9ev8BcAdELE1Bo0qCUax+BAWgmg4
	85JeS+qABJMe39zawcbRuNR/Yy6XuPnbTU8WgzPp1LJyiOgEAAu7uuFah0vKhWEHy28TmF5/fkfxQ
	CGrmPTrOGVykdwukGLr0QlPlbWfJ7tb+DCoxMqY0UF8inylDjgYJA4kvsl88Ly02FL893KktErtVk
	D+jAHoNIC0l2sd/3ALEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONea-00000003vGP-3slk;
	Tue, 03 Nov 2026 23:10:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONeX-00000003vAB-0goa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 23:10:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52C6E1650;
	Tue,  3 Nov 2026 15:10:49 -0800 (PST)
Received: from e121740.manchester.arm.com (e121740.arm.com [10.33.8.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF29B3F673;
	Tue,  3 Nov 2026 15:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793747452; bh=L5CAIPZiZH3kZEJIjArqSoa/6A1lheCZeuDiN6SG4UY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gFCqoSGq+45wVKW19hidynPTe+psph7nB4SwbXUW+0RC1ooQSfr6AsE0XoZ7d6X1M
	 SX5G1G/5KtMqN8kOulvmQaQvXBrZMGoKuk0U0gXBQeb5mnKXDAN9rvnZTf8coXS5Cq
	 KlDeRWDKE5tUa/vHPIHvCd/OBjTQt7UOclu6pPM8=
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
	Philip Radford <philip.radford@arm.com>
Subject: [PATCH v10 10/13] firmware: arm_scmi: add Powercap MAI get/set support
Date: Tue,  3 Nov 2026 23:10:04 +0000
Message-Id: <20261103231007.537082-11-philip.radford@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103231007.537082-1-philip.radford@arm.com>
References: <20261103231007.537082-1-philip.radford@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_151053_323808_1F002133 
X-CRM114-Status: GOOD (  19.01  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add support for Power Measurement Averaging Interval (MAI) get and set
operations to the SCMI powercap protocol driver. Extends scmi_powercap_info
to store MAI configuration and implement MAI get/set via xfer and optional
fast-channel support.

Signed-off-by: Philip Radford <philip.radford@arm.com>
---
V9->V10
- use interval-specific validation for MAI values
- allow all-zero MAI values to mean the platform did not report the interval
- moved Powercap fastchannel firmware CPL identifier fix to fastchannel
  support patch
---
 drivers/firmware/arm_scmi/powercap.c | 172 ++++++++++++++++++++++++---
 include/linux/scmi_protocol.h        |  18 +++
 2 files changed, 171 insertions(+), 19 deletions(-)

diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm_scmi/powercap.c
index b911d9164023..b34ad5734461 100644
--- a/drivers/firmware/arm_scmi/powercap.c
+++ b/drivers/firmware/arm_scmi/powercap.c
@@ -447,6 +447,34 @@ scmi_powercap_domain_attrs_process(const struct scmi_protocol_handle *ph,
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
+			ret = scmi_powercap_interval_validate(dom_info->min_mai,
+							      dom_info->max_mai,
+							      dom_info->mai_step,
+							      &dom_info->mai_config);
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
@@ -1153,6 +1181,103 @@ static int scmi_powercap_cap_enable_get(const struct scmi_protocol_handle *ph,
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
@@ -1165,6 +1290,8 @@ static const struct scmi_powercap_proto_ops powercap_proto_ops = {
 	.measurements_get = scmi_powercap_measurements_get,
 	.measurements_threshold_set = scmi_powercap_measurements_threshold_set,
 	.measurements_threshold_get = scmi_powercap_measurements_threshold_get,
+	.measurements_interval_get = scmi_powercap_measurements_interval_get,
+	.measurements_interval_set = scmi_powercap_measurements_interval_set,
 };
 
 static void scmi_powercap_domain_init_fc(const struct scmi_protocol_handle *ph,
@@ -1174,14 +1301,13 @@ static void scmi_powercap_domain_init_fc(const struct scmi_protocol_handle *ph,
 
 	for (int id = 0; id < dom_info->num_cpli; id++) {
 		struct scmi_fc_info *fc;
-		u32 *cpl_id, zero_cpl_id = 0;
+		u32 *cpl_id;
 		u32 cpl_fw_id = dom_info->cpli[id].id;
 
 		fc = devm_kcalloc(ph->dev, POWERCAP_FC_MAX, sizeof(*fc), GFP_KERNEL);
 		if (!fc)
 			return;
 
-		/* NOTE THAT when num_cpli == 1 the arg *cpl_id is 0 */
 		cpl_id = (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) ? &cpl_fw_id : NULL;
 
 		ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
@@ -1209,29 +1335,37 @@ static void scmi_powercap_domain_init_fc(const struct scmi_protocol_handle *ph,
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
index 085ca1a1e3a7..e858105f1ffd 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -662,6 +662,12 @@ struct scmi_powercap_cpl_info {
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
@@ -683,6 +689,10 @@ struct scmi_powercap_info {
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
@@ -741,6 +751,10 @@ struct scmi_powercap_info {
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
@@ -766,6 +780,10 @@ struct scmi_powercap_proto_ops {
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
2.34.1


