Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD0AE74ACA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 19:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DSRy9NOtmkw1KfcPFSTDvxzNFkoJeBiJ3QTf0XQ/4C8=; b=VrTLvtwdGRucWxKbRLUfWttgNc
	Z0LhMo8Id6E8pNV1UZoF3hTgIDrkIM25d3B0dRf9QfXQVkToibDjNv/qV1xsPUPZ6lcihCiT150KV
	qpRk63/VjP/Vw0FHLnFphOTEISBvkFhRrO2QEkf17uxKll4EXSwqf/AMDPWdn6SOnHIWmUtfA0KPp
	B/JR6K+8Kwf5v6/weWSfh1utti4MSlCmO59wmxo0KpbwT4w+PyWE6AtIX8rC55eNe6WeJ8dJlzRe/
	tT0uZhDih/YaNT/W5OyoRXCL/cf2FNJ/M2UazbIoejvIfmNrNsSzmFL0Dg7S8ZjoGJmLVMGec87Jy
	KJYxeEWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIYtP-0000000AX0G-2Vpy;
	Tue, 03 Dec 2024 19:49:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIYgq-0000000AUkP-1wzr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 19:36:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45573FEC;
	Tue,  3 Dec 2024 11:36:33 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CC2A3F58B;
	Tue,  3 Dec 2024 11:36:04 -0800 (PST)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH] firmware: arm_scmi: Allow transport properties for multiple instances
Date: Tue,  3 Dec 2024 19:35:44 +0000
Message-ID: <20241203193544.3895173-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_113608_593523_55DBE694 
X-CRM114-Status: GOOD (  12.63  )
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

Default SCMI transport properties values can be overridden with devicetree
provided descriptors; in order to support multiple SCMI instances, make the
properties-update happen on a per-instance copy of the original transport
descriptor.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/common.h |  4 ++--
 drivers/firmware/arm_scmi/driver.c | 18 +++++++++---------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 48b12f81141d..10ea7962323e 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -442,7 +442,7 @@ struct scmi_transport_core_operations {
  */
 struct scmi_transport {
 	struct device *supplier;
-	struct scmi_desc *desc;
+	struct scmi_desc desc;
 	struct scmi_transport_core_operations **core_ops;
 };
 
@@ -468,7 +468,7 @@ static int __tag##_probe(struct platform_device *pdev)			       \
 	device_set_of_node_from_dev(&spdev->dev, dev);			       \
 									       \
 	strans.supplier = dev;						       \
-	strans.desc = &(__desc);					       \
+	memcpy(&strans.desc, &(__desc), sizeof(strans.desc));		       \
 	strans.core_ops = &(__core_ops);				       \
 									       \
 	ret = platform_device_add_data(spdev, &strans, sizeof(strans));	       \
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 1b5fb2c4ce86..eeed1689b208 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3028,7 +3028,7 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
 	int ret;
 
 	trans = dev_get_platdata(dev);
-	if (!trans || !trans->desc || !trans->supplier || !trans->core_ops)
+	if (!trans || !trans->supplier || !trans->core_ops)
 		return NULL;
 
 	if (!device_link_add(dev, trans->supplier, DL_FLAG_AUTOREMOVE_CONSUMER)) {
@@ -3043,33 +3043,33 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
 	dev_info(dev, "Using %s\n", dev_driver_string(trans->supplier));
 
 	ret = of_property_read_u32(dev->of_node, "arm,max-rx-timeout-ms",
-				   &trans->desc->max_rx_timeout_ms);
+				   &trans->desc.max_rx_timeout_ms);
 	if (ret && ret != -EINVAL)
 		dev_err(dev, "Malformed arm,max-rx-timeout-ms DT property.\n");
 
 	ret = of_property_read_u32(dev->of_node, "arm,max-msg-size",
-				   &trans->desc->max_msg_size);
+				   &trans->desc.max_msg_size);
 	if (ret && ret != -EINVAL)
 		dev_err(dev, "Malformed arm,max-msg-size DT property.\n");
 
 	ret = of_property_read_u32(dev->of_node, "arm,max-msg",
-				   &trans->desc->max_msg);
+				   &trans->desc.max_msg);
 	if (ret && ret != -EINVAL)
 		dev_err(dev, "Malformed arm,max-msg DT property.\n");
 
 	dev_info(dev,
 		 "SCMI max-rx-timeout: %dms / max-msg-size: %dbytes / max-msg: %d\n",
-		 trans->desc->max_rx_timeout_ms, trans->desc->max_msg_size,
-		 trans->desc->max_msg);
+		 trans->desc.max_rx_timeout_ms, trans->desc.max_msg_size,
+		 trans->desc.max_msg);
 
 	/* System wide atomic threshold for atomic ops .. if any */
 	if (!of_property_read_u32(dev->of_node, "atomic-threshold-us",
-				  &trans->desc->atomic_threshold))
+				  &trans->desc.atomic_threshold))
 		dev_info(dev,
 			 "SCMI System wide atomic threshold set to %u us\n",
-			 trans->desc->atomic_threshold);
+			 trans->desc.atomic_threshold);
 
-	return trans->desc;
+	return &trans->desc;
 }
 
 static int scmi_probe(struct platform_device *pdev)
-- 
2.47.0


