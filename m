Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCA7FCE08F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 14:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9YBoRXZoCHF91T0h+jWv827XOatLI13ytXUoo9TzTc=; b=pIKwvFbFI/ARzZx4fN9NJ6fjw3
	i4PXmfcn2wtctBQNHZgA8Dvn7OTbPEBjOtXqsh5HlmTHSC6NkS9NiDwfpA3IgG15aBrseZizEpIMV
	w8uQEqUTNET6LtW/UyGVtKd+mToTS2HFUFfCOCD+OMOfv8XGr5K9T2AIlFUevgG0Gf5S22G/rS8jt
	CJp/PF5wlm2lM0e2uBjccCMyn3ZWKnjGQN8lnFobMvQ3Qh0kul7uldQnk7sYtEGH+lbNByQFz7x32
	6IaUNdSKt/6UE+z5/4Etib+/rdgOVG6uzGqpaDew0HQExe8xDLo0f5mdpCET7B91s1WA7NbPKKhje
	X3yP3dhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcCu-00000006J9d-2x4R;
	Thu, 26 Feb 2026 14:19:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcCq-00000006J3p-1QYQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 14:19:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B5EC153B;
	Thu, 26 Feb 2026 06:19:01 -0800 (PST)
Received: from donnerap.manchester.arm.com (donnerap.manchester.arm.com [10.33.8.81])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F5373F99C;
	Thu, 26 Feb 2026 06:19:05 -0800 (PST)
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
Subject: [PATCH v3 9/9] firmware: arm_scmi: add Powercap MAI get/set support
Date: Thu, 26 Feb 2026 14:18:30 +0000
Message-ID: <20260226141830.3400924-10-philip.radford@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226141830.3400924-1-philip.radford@arm.com>
References: <20260226141830.3400924-1-philip.radford@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_061908_454993_1DD0FE57 
X-CRM114-Status: GOOD (  13.15  )
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

Add support for Power Measurement Averaging Interval (MAI)
get and set operations to the SCMI powercap protocol driver.
Extends scmi_powercap_info to store MAI configuration and
implement MAI get/set via xfer and optional fast-channel
support.

Signed-off-by: Philip Radford <philip.radford@arm.com>
---
 drivers/firmware/arm_scmi/powercap.c | 120 +++++++++++++++++++++++++++
 include/linux/scmi_protocol.h        |   8 ++
 2 files changed, 128 insertions(+)

diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm_scmi/powercap.c
index 1087d59ac873..7dc6d3001637 100644
--- a/drivers/firmware/arm_scmi/powercap.c
+++ b/drivers/firmware/arm_scmi/powercap.c
@@ -401,6 +401,34 @@ scmi_powercap_domain_attrs_process(const struct scmi_protocol_handle *ph,
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
+				dev_warn(ph->dev, "Platform reported problem MAI config for domain %d - %s\n",
+					 dom_info->id, dom_info->name);
+
+				return ret;
+			}
+		}
+	}
+
 	dom_info->extended_names = SUPPORTS_EXTENDED_NAMES(flags);
 
 	dom_info->async_powercap_cap_set =
@@ -1082,6 +1110,96 @@ static int scmi_powercap_cap_enable_get(const struct scmi_protocol_handle *ph,
 	return 0;
 }
 
+static int scmi_powercap_xfer_mai_get(const struct scmi_protocol_handle *ph, u32 domain_id,
+				      u32 *mai)
+{
+	int ret;
+	struct scmi_xfer *t;
+
+	ret = ph->xops->xfer_get_init(ph, POWERCAP_MAI_GET, sizeof(u32),
+								sizeof(u32), &t);
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
+static int scmi_powercap_xfer_mai_set(const struct scmi_protocol_handle *ph, u32 domain_id, u32 mai)
+{
+	int ret;
+	struct scmi_xfer *t;
+	struct scmi_msg_powercap_cap_or_pai_set *msg;
+
+	ret = ph->xops->xfer_get_init(ph, POWERCAP_MAI_SET, sizeof(*msg), 0, &t);
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
+static int scmi_powercap_measurements_interval_get(const struct scmi_protocol_handle *ph,
+						   u32 domain_id, u32 *val)
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
+		trace_scmi_fc_call(SCMI_PROTOCOL_POWERCAP, POWERCAP_MAI_GET, domain_id, 0, *val, 0);
+		return 0;
+	}
+
+	return scmi_powercap_xfer_mai_get(ph, domain_id, val);
+}
+
+static int scmi_powercap_measurements_interval_set(const struct scmi_protocol_handle *ph,
+						   u32 domain_id, u32 val)
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
@@ -1094,6 +1212,8 @@ static const struct scmi_powercap_proto_ops powercap_proto_ops = {
 	.measurements_get = scmi_powercap_measurements_get,
 	.measurements_threshold_set = scmi_powercap_measurements_threshold_set,
 	.measurements_threshold_get = scmi_powercap_measurements_threshold_get,
+	.measurements_interval_get = scmi_powercap_measurements_interval_get,
+	.measurements_interval_set = scmi_powercap_measurements_interval_set,
 };
 
 static void scmi_powercap_domain_init_fc(const struct scmi_protocol_handle *ph,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index d0f6c0102559..73d66281dcc3 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -675,6 +675,10 @@ struct scmi_powercap_info {
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
@@ -758,6 +762,10 @@ struct scmi_powercap_proto_ops {
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
2.47.3


