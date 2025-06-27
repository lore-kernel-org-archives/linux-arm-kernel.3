Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC748C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 20:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HluJQ8LptdTS6su8UuncXTZx769j4AJJg4ElkyPIcvo=; b=UQkkRXk+VioJdwLeD2PfYg3HxS
	51g6MwqkgN13Z59HKSu+EWN8/MAEQAXqMqFLWzXB2jJ3qRpzWB5rCk16QDScBl/+Ea1tceKX0AGLr
	jDoosqg6Yn9pyoJvevM1Kw3ZDFaWDmzUeSRuV1msoABnjayyjwzgARKxb23yzcLnsfC7lpPxGBli/
	LeiCaikTPFkdPablns1zjtkTWXA45A50jq6Wdp0EJE4qYg9aiZLVN6b7lrEe/a9H56tSTJKh3LFVN
	KOoi48RIsNNuHrvP1v/MuHX2erLgdKs+FFw8KBOSOahDNBN6ODi1QHcfQU9rKVAEH7/6PjL2qg70W
	Vx4m1f2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVG8Y-0000000FoAC-1U4g;
	Fri, 27 Jun 2025 20:57:30 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVG0L-0000000FnFz-0FCh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 20:49:02 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55RKmtqe2508631;
	Fri, 27 Jun 2025 15:48:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751057335;
	bh=HluJQ8LptdTS6su8UuncXTZx769j4AJJg4ElkyPIcvo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=OOk6C3ngM3CvLkx8ZjVG9iONNE2BRVfsrklBSqWReGrLGbBlIw0y4K2BipxuxRg3k
	 NXAGSuASHbUI346BQp5r4y5xxA6H+YRJjXOLEIwUe24zRqbWcCWrMSFZBWE8B85MDf
	 MGnVfdIueCpvMNsHkhyMAj3JFTBTrZgQ3GUZ8vgQ=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55RKmtsB3292478
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 27 Jun 2025 15:48:55 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 15:48:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 15:48:55 -0500
Received: from uda0506412.dhcp.ti.com (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55RKmpWW3421525;
	Fri, 27 Jun 2025 15:48:55 -0500
From: Kendall Willis <k-willis@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>,
        <ulf.hansson@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>
CC: <d-gole@ti.com>, <vishalm@ti.com>, <sebin.francis@ti.com>,
        <msp@baylibre.com>, <khilman@baylibre.com>,
        Kendall Willis <k-willis@ti.com>
Subject: [PATCH 1/2] firmware: ti_sci: Enable abort handling of entry to LPM
Date: Fri, 27 Jun 2025 15:48:20 -0500
Message-ID: <20250627204821.1150459-2-k-willis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627204821.1150459-1-k-willis@ti.com>
References: <20250627204821.1150459-1-k-willis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_134901_189216_E8200621 
X-CRM114-Status: GOOD (  19.13  )
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

Introduce LPM abort call that enables the ti_sci driver to support
aborting entry to a low power mode.

The following power management operation defined in the TISCI
Low Power Mode API [1] is implemented to enable aborting entry to LPM:

TISCI_MSG_LPM_ABORT
Abort the current low power mode entry by clearing the current mode
selection.

Additionally, add LPM abort message in ti_sci_suspend and
ti_sci_suspend_noirq if there is a failure.

[1] https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 drivers/firmware/ti_sci.c              | 67 ++++++++++++++++++++++++--
 drivers/firmware/ti_sci.h              |  3 +-
 include/linux/soc/ti/ti_sci_protocol.h |  2 +
 3 files changed, 68 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index ae5fd1936ad32..d5139428498d4 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -2015,6 +2015,58 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 	return ret;
 }
 
+/**
+ * ti_sci_cmd_lpm_abort() - Abort entry to LPM
+ * @handle:     pointer to TI SCI handle
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_lpm_abort(const struct ti_sci_handle *handle)
+{
+	struct ti_sci_info *info;
+	struct ti_sci_msg_hdr *req;
+	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_xfer *xfer;
+	struct device *dev;
+	int ret = 0;
+
+	if (IS_ERR(handle))
+		return PTR_ERR(handle);
+	if (!handle)
+		return -EINVAL;
+
+	info = handle_to_ti_sci_info(handle);
+	dev = info->dev;
+
+	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_ABORT,
+				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+				   sizeof(*req), sizeof(*resp));
+	if (IS_ERR(xfer)) {
+		ret = PTR_ERR(xfer);
+		dev_err(dev, "Message alloc failed(%d)\n", ret);
+		return ret;
+	}
+	req = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
+
+	ret = ti_sci_do_xfer(info, xfer);
+	if (ret) {
+		dev_err(dev, "Mbox send fail %d\n", ret);
+		goto fail;
+	}
+
+	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
+
+	if (!ti_sci_is_response_ack(resp))
+		ret = -ENODEV;
+	else
+		ret = 0;
+
+fail:
+	ti_sci_put_one_xfer(&info->minfo, xfer);
+
+	return ret;
+}
+
 static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 {
 	struct ti_sci_info *info;
@@ -3202,6 +3254,7 @@ static void ti_sci_setup_ops(struct ti_sci_info *info)
 		pmops->lpm_wake_reason = ti_sci_msg_cmd_lpm_wake_reason;
 		pmops->set_device_constraint = ti_sci_cmd_set_device_constraint;
 		pmops->set_latency_constraint = ti_sci_cmd_set_latency_constraint;
+		pmops->lpm_abort = ti_sci_cmd_lpm_abort;
 	}
 
 	rm_core_ops->get_range = ti_sci_cmd_get_resource_range;
@@ -3699,9 +3752,13 @@ static int __maybe_unused ti_sci_suspend(struct device *dev)
 	}
 
 	ret = ti_sci_prepare_system_suspend(info);
-	if (ret)
+	if (ret) {
+		dev_err(dev, "%s: Failed to prepare sleep. Abort entering low power mode.\n",
+			__func__);
+		if (ti_sci_cmd_lpm_abort(&info->handle))
+			dev_err(dev, "%s: Failed to abort.\n", __func__);
 		return ret;
-
+	}
 	return 0;
 }
 
@@ -3711,8 +3768,12 @@ static int __maybe_unused ti_sci_suspend_noirq(struct device *dev)
 	int ret = 0;
 
 	ret = ti_sci_cmd_set_io_isolation(&info->handle, TISCI_MSG_VALUE_IO_ENABLE);
-	if (ret)
+	if (ret) {
+		dev_err(dev, "%s: Failed to suspend. Abort entering low power mode.\n", __func__);
+		if (ti_sci_cmd_lpm_abort(&info->handle))
+			dev_err(dev, "%s: Failed to abort.\n", __func__);
 		return ret;
+	}
 
 	return 0;
 }
diff --git a/drivers/firmware/ti_sci.h b/drivers/firmware/ti_sci.h
index 053387d7baa06..51d77f90a32cc 100644
--- a/drivers/firmware/ti_sci.h
+++ b/drivers/firmware/ti_sci.h
@@ -6,7 +6,7 @@
  * The system works in a message response protocol
  * See: https://software-dl.ti.com/tisci/esd/latest/index.html for details
  *
- * Copyright (C)  2015-2024 Texas Instruments Incorporated - https://www.ti.com/
+ * Copyright (C)  2015-2025 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 #ifndef __TI_SCI_H
@@ -42,6 +42,7 @@
 #define TI_SCI_MSG_SET_IO_ISOLATION	0x0307
 #define TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT	0x0309
 #define TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT	0x030A
+#define TI_SCI_MSG_LPM_ABORT	0x0311
 
 /* Resource Management Requests */
 #define TI_SCI_MSG_GET_RESOURCE_RANGE	0x1500
diff --git a/include/linux/soc/ti/ti_sci_protocol.h b/include/linux/soc/ti/ti_sci_protocol.h
index fd104b6668364..8c1815a9e8234 100644
--- a/include/linux/soc/ti/ti_sci_protocol.h
+++ b/include/linux/soc/ti/ti_sci_protocol.h
@@ -214,6 +214,7 @@ struct ti_sci_clk_ops {
  * @set_latency_constraint: Set LPM resume latency constraint
  *		- latency: maximum acceptable latency to wake up from low power mode
  *		- state: The desired state of latency constraint: set or clear.
+ * @lpm_abort: Abort entry to LPM by clearing the LPM selection
  */
 struct ti_sci_pm_ops {
 	int (*lpm_wake_reason)(const struct ti_sci_handle *handle,
@@ -222,6 +223,7 @@ struct ti_sci_pm_ops {
 				     u32 id, u8 state);
 	int (*set_latency_constraint)(const struct ti_sci_handle *handle,
 				      u16 latency, u8 state);
+	int (*lpm_abort)(const struct ti_sci_handle *handle);
 };
 
 /**
-- 
2.34.1


