Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672E0C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 14:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6lGHEFalo0LwEvBVJqWW0T2HvlysfOZ36C5ujZSzel0=; b=G1P2vi3ZXa3A0nPsFyvNPhldHX
	tnFxdbtCwMabHVKhHNliSR5W+tuR223kdSLQi00fED5IVphnZi6iZypgcr0RZI4fWHze7g7M3ohIJ
	NHj8KhqbHYnhdA3GdXKmPdFwwxHlugww7TgD+tyE5lylgDw54jjRlYY1liHPPKQaskFeTxQ3ya159
	aMrJQr5V7rSd430WQlP9t4OR4u+zJ0+NFr4YY5FaAnN0qQ4bPq2NF4cr1MqfSsBN3WQCDn1KfjJAG
	7grAsEcOvByAH7Ghc05mfbKI7dflJuhF0ww7ev1mnBfFRfy3DFyKnqn08JXQiDDNlPivbcte+5qEV
	FzfKPW8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiNa-000000035ql-0VUW;
	Mon, 23 Jun 2025 14:42:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfrs-00000002b55-16Vz;
	Mon, 23 Jun 2025 12:01:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680103;
	bh=bdUIv+Bi0JKFaMkv/B0ZJnFgDGfpNHDxCyP1lPlsIyI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W2Ox3+9hw+zvS0lVzsElHJKlKH6Z+uPRTcHdyKlW4TKn9Vf/MS7hW+D2s9e9QCJud
	 3m6QG8LHw5EFWlRFsvDey+2HHFjHvo+rv6ESuemAzUCTLvL0+KWjUtuulVkBk6kATj
	 wOr4oTUcfHRF/nYj0Lzu0WSaKrr620P+nAccI8125+1uciDQess3vIBJgAIRZSUMdK
	 tByBqJ8VIJUdVKojcqpginxCEoDs7eFstg2+u9CzhgHHkaeLppUW+VLdCwli7AAhLr
	 /HH8V2K6NX6yuZdP50Fr/V2Yv/xPhM6MAA7TN3n8FG198fiIwElHMeXyzc7Gvnw+rK
	 GiwPNgrAshbvA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4604817E1560;
	Mon, 23 Jun 2025 14:01:42 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 2/2] firmware: arm_scmi: Add MediaTek TinySYS SCMI Protocol support
Date: Mon, 23 Jun 2025 14:01:36 +0200
Message-ID: <20250623120136.109311-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120136.109311-1-angelogioacchino.delregno@collabora.com>
References: <20250623120136.109311-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050144_610663_68C7F50C 
X-CRM114-Status: GOOD (  22.64  )
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

Add a driver for the SCMI protocol extensions for MediaTek TinySYS.
This is used to communicate with various remote processors in some
MediaTek SoCs, which mainly handle power management related tasks.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/firmware/arm_scmi/Kconfig             |   1 +
 drivers/firmware/arm_scmi/Makefile            |   1 +
 .../arm_scmi/vendors/mediatek/Kconfig         |  16 +
 .../arm_scmi/vendors/mediatek/Makefile        |   2 +
 .../arm_scmi/vendors/mediatek/mtk-tinysys.c   | 344 ++++++++++++++++++
 include/linux/scmi_mtk_protocol.h             |  62 ++++
 6 files changed, 426 insertions(+)
 create mode 100644 drivers/firmware/arm_scmi/vendors/mediatek/Kconfig
 create mode 100644 drivers/firmware/arm_scmi/vendors/mediatek/Makefile
 create mode 100644 drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c
 create mode 100644 include/linux/scmi_mtk_protocol.h

diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
index e3fb36825978..baadf4f7fef6 100644
--- a/drivers/firmware/arm_scmi/Kconfig
+++ b/drivers/firmware/arm_scmi/Kconfig
@@ -84,6 +84,7 @@ config ARM_SCMI_QUIRKS
 
 source "drivers/firmware/arm_scmi/transports/Kconfig"
 source "drivers/firmware/arm_scmi/vendors/imx/Kconfig"
+source "drivers/firmware/arm_scmi/vendors/mediatek/Kconfig"
 
 endif #ARM_SCMI_PROTOCOL
 
diff --git a/drivers/firmware/arm_scmi/Makefile b/drivers/firmware/arm_scmi/Makefile
index 780cd62b2f78..d1b4ec16b8bc 100644
--- a/drivers/firmware/arm_scmi/Makefile
+++ b/drivers/firmware/arm_scmi/Makefile
@@ -13,6 +13,7 @@ scmi-module-objs := $(scmi-driver-y) $(scmi-protocols-y) $(scmi-transport-y)
 
 obj-$(CONFIG_ARM_SCMI_PROTOCOL) += transports/
 obj-$(CONFIG_ARM_SCMI_PROTOCOL) += vendors/imx/
+obj-$(CONFIG_ARM_SCMI_PROTOCOL) += vendors/mediatek/
 
 obj-$(CONFIG_ARM_SCMI_PROTOCOL) += scmi-core.o
 obj-$(CONFIG_ARM_SCMI_PROTOCOL) += scmi-module.o
diff --git a/drivers/firmware/arm_scmi/vendors/mediatek/Kconfig b/drivers/firmware/arm_scmi/vendors/mediatek/Kconfig
new file mode 100644
index 000000000000..8facdcd3819f
--- /dev/null
+++ b/drivers/firmware/arm_scmi/vendors/mediatek/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "ARM SCMI MediaTek Vendor Protocols"
+
+config MTK_SCMI_TINYSYS
+	tristate "MediaTek SCMI TinySYS Extension"
+	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
+	default y if ARCH_MEDIATEK
+	help
+	  This enables communication with the MediaTek TinySYS MCU
+	  to control the power status of various SoC sub-devices
+	  other than passing other messages for initialization.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called mtk-tinysys.
+
+endmenu
diff --git a/drivers/firmware/arm_scmi/vendors/mediatek/Makefile b/drivers/firmware/arm_scmi/vendors/mediatek/Makefile
new file mode 100644
index 000000000000..dc1ff63c3b69
--- /dev/null
+++ b/drivers/firmware/arm_scmi/vendors/mediatek/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_MTK_SCMI_TINYSYS) += mtk-tinysys.o
diff --git a/drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c b/drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c
new file mode 100644
index 000000000000..baeb36493952
--- /dev/null
+++ b/drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c
@@ -0,0 +1,344 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * System Control and Management Interface (SCMI) MediaTek TinySYS Protocol
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ * Copyright (c) 2025 Collabora Ltd
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#define pr_fmt(fmt) "SCMI Notifications TinySYS - " fmt
+
+#include <linux/bits.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/scmi_protocol.h>
+#include <linux/scmi_mtk_protocol.h>
+
+#include "../../protocols.h"
+#include "../../notify.h"
+
+#define SCMI_MTK_CMD_SSPM_QUERY_ALIVE		0xdead
+
+enum scmi_mtk_tinysys_protocol_cmd {
+	MTK_TINYSYS_COMMON_SET = 0x3,
+	MTK_TINYSYS_COMMON_GET = 0x4,
+	MTK_TINYSYS_POWER_STATE_NOTIFY = 0x5,
+	MTK_TINYSYS_SLBC_CTRL = 0x6,
+};
+
+struct scmi_mtk_tinysys_common_get_payld {
+	__le32 rsvd;
+	__le32 param[SCMI_MTK_MSG_COMMON_REPLY_BYTES];
+};
+
+struct scmi_mtk_tinysys_common_set_payld {
+	__le32 rsvd;
+	__le32 ctrl_id;
+	__le32 param[SCMI_MTK_MSG_COMMON_PARAM_BYTES];
+};
+
+struct scmi_mtk_tinysys_slbc_payld {
+	__le32 rsvd;
+	__le32 cmd;
+	__le32 arg[SCMI_MTK_MSG_SLBC_PARAM_BYTES];
+};
+
+struct scmi_mtk_tinysys_pwrst_notify {
+	__le32 rsvd;
+	__le32 fid;
+	__le32 enable;
+};
+
+struct scmi_mtk_tinysys_notify_payld {
+	__le32 fid;
+	__le32 param[SCMI_MTK_MSG_NOTIF_ST_BYTES];
+};
+
+struct scmi_mtk_tinysys_protocol_attributes {
+	__le32 attributes;
+};
+
+struct scmi_mtk_tinysys_info {
+	int num_domains;
+};
+
+static int scmi_mtk_tinysys_attributes_get(const struct scmi_protocol_handle *ph,
+					   struct scmi_mtk_tinysys_info *tinfo)
+{
+	struct scmi_mtk_tinysys_protocol_attributes *attr;
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0, sizeof(*attr), &t);
+	if (ret)
+		return ret;
+
+	attr = t->rx.buf;
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		attr->attributes = get_unaligned_le32(t->rx.buf);
+		tinfo->num_domains = attr->attributes;
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_mtk_tinysys_get_num_sources(const struct scmi_protocol_handle *ph)
+{
+	struct scmi_mtk_tinysys_info *tinfo = ph->get_priv(ph);
+
+	if (!tinfo)
+		return -EINVAL;
+
+	return tinfo->num_domains;
+}
+
+static int scmi_mtk_tinysys_set_notify_enabled(const struct scmi_protocol_handle *ph,
+					       u8 evt_id, u32 src_id, bool enable)
+{
+	struct scmi_mtk_tinysys_pwrst_notify *pwrst_notify;
+	struct scmi_xfer *t;
+	int ret;
+
+	/* There's only one possible event for now */
+	if (evt_id != 0)
+		return -EINVAL;
+
+	ret = ph->xops->xfer_get_init(ph, MTK_TINYSYS_POWER_STATE_NOTIFY,
+				      sizeof(*pwrst_notify), 0, &t);
+	if (ret)
+		return ret;
+
+	pwrst_notify = t->tx.buf;
+	pwrst_notify->fid = src_id;
+	pwrst_notify->enable = cpu_to_le32(enable);
+
+	ret = ph->xops->do_xfer(ph, t);
+	ph->xops->xfer_put(ph, t);
+	return ret;
+}
+
+static void *scmi_mtk_tinysys_fill_custom_report(const struct scmi_protocol_handle *ph,
+						 u8 evt_id, ktime_t timestamp,
+						 const void *payld, size_t payld_sz,
+						 void *report, u32 *src_id)
+{
+	const struct scmi_mtk_tinysys_notify_payld *p = payld;
+	struct scmi_mtk_tinysys_notif_report *r = report;
+	int i;
+
+	if (sizeof(*p) != payld_sz)
+		return NULL;
+
+	if (evt_id == SCMI_EVENT_MTK_TINYSYS_NOTIFIER) {
+		r->timestamp = timestamp;
+		r->fid = le32_to_cpu(p->fid);
+		for (i = 0; i < SCMI_MTK_MSG_NOTIF_ST_BYTES; i++)
+			r->status[i] = le32_to_cpu(p->param[i]);
+		if (src_id)
+			*src_id = p->fid;
+	} else {
+		WARN_ON_ONCE(1);
+		return NULL;
+	}
+
+	return r;
+}
+
+static const struct scmi_event scmi_mtk_tinysys_events[] = {
+	{
+		.id = SCMI_EVENT_MTK_TINYSYS_NOTIFIER,
+		.max_payld_sz =	sizeof(struct scmi_mtk_tinysys_notify_payld),
+		.max_report_sz = sizeof(struct scmi_mtk_tinysys_notif_report),
+	},
+};
+
+static int scmi_mtk_tinysys_common_get(const struct scmi_protocol_handle *ph,
+				       u32 ctrl_id, u32 cmd,
+				       struct scmi_mtk_tinysys_status *retval)
+{
+	struct scmi_mtk_tinysys_common_get_payld *p;
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, MTK_TINYSYS_COMMON_GET,
+				      sizeof(*p), sizeof(*retval), &t);
+	if (ret)
+		return ret;
+
+	p = t->tx.buf;
+	p->param[0] = ctrl_id;
+	p->param[1] = cmd;
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		if (t->rx.len == sizeof(*retval))
+			memcpy(retval, t->rx.buf, sizeof(*retval));
+		else
+			ret = -EINVAL;
+	}
+
+	ph->xops->xfer_put(ph, t);
+	return ret;
+}
+
+static int scmi_mtk_tinysys_common_set(const struct scmi_protocol_handle *ph,
+				       u32 ctrl_id, const u32 *params,
+				       const u8 num_params)
+{
+	struct scmi_mtk_tinysys_common_set_payld *p;
+	struct scmi_xfer *t;
+	int i, ret;
+
+	if (!params || num_params > SCMI_MTK_MSG_COMMON_PARAM_BYTES)
+		return -EINVAL;
+
+	ret = ph->xops->xfer_get_init(ph, MTK_TINYSYS_COMMON_SET, sizeof(*p), 0, &t);
+	if (ret)
+		return ret;
+
+	p = t->tx.buf;
+	p->ctrl_id = cpu_to_le32(ctrl_id);
+	for (i = 0; i < num_params; i++)
+		p->param[i] = cpu_to_le32(params[i]);
+
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+	return ret;
+}
+
+static int scmi_mtk_tinysys_cm_mgr_set(const struct scmi_protocol_handle *ph,
+				       u32 ctrl_id, u32 cmd, u32 arg)
+{
+	const u32 params[2] = { cmd, arg };
+
+	return scmi_mtk_tinysys_common_set(ph, ctrl_id, params, 2);
+}
+
+static int scmi_mtk_tinysys_gpu_pwr_set(const struct scmi_protocol_handle *ph,
+				       u32 ctrl_id, u8 pwr_indication, bool enable)
+{
+	const u32 params[2] = { pwr_indication, enable };
+
+	return scmi_mtk_tinysys_common_set(ph, ctrl_id, params, 2);
+}
+
+static int scmi_mtk_tinysys_slbc_req(const struct scmi_protocol_handle *ph,
+				     const struct scmi_mtk_tinysys_slbc *req,
+				     struct scmi_mtk_tinysys_slbc *retval)
+{
+	struct scmi_mtk_tinysys_slbc_payld *p;
+	struct scmi_xfer *t;
+	int i, ret;
+
+	ret = ph->xops->xfer_get_init(ph, MTK_TINYSYS_SLBC_CTRL,
+				      sizeof(*p), sizeof(*p), &t);
+	if (ret)
+		return ret;
+
+	p = t->tx.buf;
+	p->cmd = cpu_to_le32(req->cmd);
+	for (i = 0; i < SCMI_MTK_MSG_SLBC_PARAM_BYTES; i++)
+		p->arg[i] = cpu_to_le32(req->arg[i]);
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret && retval) {
+		if (t->rx.len == sizeof(*retval))
+			memcpy(retval, t->rx.buf, sizeof(*retval));
+		else
+			ret = -EINVAL;
+	}
+
+	ph->xops->xfer_put(ph, t);
+	return ret;
+}
+
+static int scmi_mtk_tinysys_sspm_mem_set(const struct scmi_protocol_handle *ph,
+					 u32 ctrl_id, u32 pa, u32 mem_sz)
+{
+	const u32 params[2] = { pa, mem_sz };
+
+	if (mem_sz < SZ_1M)
+		return -EINVAL;
+
+	return scmi_mtk_tinysys_common_set(ph, ctrl_id, params, 2);
+}
+
+static bool scmi_mtk_tinysys_sspm_is_alive(const struct scmi_protocol_handle *ph,
+					   u32 ctrl_id)
+{
+	const u32 param = SCMI_MTK_CMD_SSPM_QUERY_ALIVE;
+	int ret;
+
+	ret = scmi_mtk_tinysys_common_set(ph, ctrl_id, &param, 1);
+
+	return ret ? false : true;
+}
+
+static const struct scmi_mtk_tinysys_proto_ops mtk_tinysys_proto_ops = {
+	.common_get = scmi_mtk_tinysys_common_get,
+	.cm_mgr_set = scmi_mtk_tinysys_cm_mgr_set,
+	.gpu_pwr_set = scmi_mtk_tinysys_gpu_pwr_set,
+	.slbc_req = scmi_mtk_tinysys_slbc_req,
+	.sspm_is_alive = scmi_mtk_tinysys_sspm_is_alive,
+	.sspm_mem_set = scmi_mtk_tinysys_sspm_mem_set,
+};
+
+static const struct scmi_event_ops scmi_mtk_tinysys_event_ops = {
+	.get_num_sources = scmi_mtk_tinysys_get_num_sources,
+	.set_notify_enabled = scmi_mtk_tinysys_set_notify_enabled,
+	.fill_custom_report = scmi_mtk_tinysys_fill_custom_report,
+};
+
+static const struct scmi_protocol_events scmi_mtk_tinysys_protocol_events = {
+	.queue_sz = 4 * SCMI_PROTO_QUEUE_SZ,
+	.ops = &scmi_mtk_tinysys_event_ops,
+	.evts = scmi_mtk_tinysys_events,
+	.num_events = ARRAY_SIZE(scmi_mtk_tinysys_events),
+};
+
+static int scmi_mtk_tinysys_protocol_init(const struct scmi_protocol_handle *ph)
+{
+	struct scmi_mtk_tinysys_info *tinfo;
+	u32 version;
+	int ret;
+
+	ret = ph->xops->version_get(ph, &version);
+	if (ret)
+		return ret;
+
+	dev_info(ph->dev, "MediaTek TinySYS Protocol Version %d.%d\n",
+		 PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+
+	tinfo = devm_kzalloc(ph->dev, sizeof(*tinfo), GFP_KERNEL);
+	if (!tinfo)
+		return -ENOMEM;
+
+	ret = scmi_mtk_tinysys_attributes_get(ph, tinfo);
+	if (ret)
+		return ret;
+
+	return ph->set_priv(ph, tinfo, version);
+}
+
+static const struct scmi_protocol scmi_mtk_tinysys = {
+	.id = SCMI_PROTOCOL_MTK_TINYSYS,
+	.owner = THIS_MODULE,
+	.instance_init = &scmi_mtk_tinysys_protocol_init,
+	.ops = &mtk_tinysys_proto_ops,
+	.events = &scmi_mtk_tinysys_protocol_events,
+	.vendor_id = SCMI_MTK_VENDOR,
+};
+module_scmi_protocol(scmi_mtk_tinysys);
+
+MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
+MODULE_ALIAS("scmi-protocol-" __stringify(SCMI_PROTOCOL_MTK_TINYSYS) "-" SCMI_MTK_VENDOR);
+MODULE_DESCRIPTION("MediaTek SCMI TinySYS driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/scmi_mtk_protocol.h b/include/linux/scmi_mtk_protocol.h
new file mode 100644
index 000000000000..51ad0cb4b72d
--- /dev/null
+++ b/include/linux/scmi_mtk_protocol.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SCMI Message Protocol driver MediaTek extension header
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ * Copyright (c) 2025 Collabora Ltd
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#ifndef _LINUX_SCMI_MTK_PROTOCOL_H
+#define _LINUX_SCMI_MTK_PROTOCOL_H
+
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/notifier.h>
+#include <linux/types.h>
+
+#define SCMI_PROTOCOL_MTK_TINYSYS	0x80
+#define SCMI_MTK_VENDOR			"MediaTek"
+
+#define SCMI_MTK_MSG_COMMON_PARAM_BYTES	5
+#define SCMI_MTK_MSG_COMMON_REPLY_BYTES	2
+#define SCMI_MTK_MSG_NOTIF_ST_BYTES	4
+#define SCMI_MTK_MSG_SLBC_PARAM_BYTES	4
+
+struct scmi_mtk_tinysys_status {
+	u32 rsvd;
+	u32 reply[SCMI_MTK_MSG_COMMON_REPLY_BYTES];
+};
+
+struct scmi_mtk_tinysys_slbc {
+	u32 cmd;
+	u32 arg[SCMI_MTK_MSG_SLBC_PARAM_BYTES];
+};
+
+struct scmi_mtk_tinysys_proto_ops {
+	int (*common_get)(const struct scmi_protocol_handle *ph,
+			  u32 ctrl_id, u32 cmd,
+			  struct scmi_mtk_tinysys_status *retval);
+	int (*cm_mgr_set)(const struct scmi_protocol_handle *ph,
+			  u32 ctrl_id, u32 cmd, u32 arg);
+	int (*gpu_pwr_set)(const struct scmi_protocol_handle *ph,
+			   u32 ctrl_id, u8 pwr_indication, bool enable);
+	int (*slbc_req)(const struct scmi_protocol_handle *ph,
+			const struct scmi_mtk_tinysys_slbc *req,
+			struct scmi_mtk_tinysys_slbc *retval);
+	bool (*sspm_is_alive)(const struct scmi_protocol_handle *ph,
+			      u32 ctrl_id);
+	int (*sspm_mem_set)(const struct scmi_protocol_handle *ph,
+			    u32 ctrl_id, u32 pa, u32 mem_sz);
+};
+
+enum scmi_mtk_tinysys_notification_events {
+	SCMI_EVENT_MTK_TINYSYS_NOTIFIER = 0x0,
+};
+
+struct scmi_mtk_tinysys_notif_report {
+	ktime_t timestamp;
+	unsigned int fid;
+	unsigned int status[SCMI_MTK_MSG_NOTIF_ST_BYTES];
+};
+#endif
-- 
2.49.0


