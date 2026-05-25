Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24FDCD5BCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 20:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyYeD5XTEqJmr2zTnxl+NeYa/a47TQXMmY/hD9l2HwM=; b=oD6QO9gkITeOvo7DNy13i5oUhF
	0pFx9sxEhNUh6AKZQROQ472gppUSKtVbFE3vFlI0QrPJS56P2Jdmeb+0G8V2U8SyeWWjItnUuLPP0
	vkGzSpZgIKALMa7t+mqoOocvzwqvMyptaXzCDkToSKd6Nk+NotbOyDELENkX+PCt5bcOS3bgGsOQ3
	oyCe9/QmTlot7AREvXFJApxDmA2YXUGvbIV6JwGTlIEI5SLyl67+hIwRG5QNgg7Wok8fG58j7Q3Rd
	jFknDO6gIEfg6FV2s7NUsvbCANVb6lZGuOErwYfaAS0izdBKedXbz0PDRNHXZ85zK2byJkmQxR1vp
	LlHCz5Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRc9x-00000000RLD-0jwg;
	Mon, 25 May 2026 20:44:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRc9s-00000000RIW-19SR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 20:44:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8568C60018;
	Mon, 25 May 2026 20:44:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A381F00A3A;
	Mon, 25 May 2026 20:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779741859;
	bh=fyYeD5XTEqJmr2zTnxl+NeYa/a47TQXMmY/hD9l2HwM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NrZjqBuKT25FAUejY9YgvyvpKGnqGeJCmm1zQNZXfPh23vXsv0ZBG2HMdETUzhpAh
	 F13RZ9gptUWnhSXMxhWmENGPdfJNitALCdPI6yyN+5z5lzNxRLgzbvPOma1TsbQE1t
	 eKnRGN6ojUVig3RyKu4MSJklTdBO+t+r3okejm7GkrJIUO2GceCRDPi+zphQL/AdkZ
	 o4bYw/34TlVOT1drTTJilva9KacsCLTkJAzTzeQPFRaZciSisHjdsB/Dq/kKt9AnQM
	 KuK9H/r7IBxS15p7yroI2o/vPxSFqEQGsdT8L1WM7QMsQ/C98QkB5O/TpLrvUuEd1J
	 cEfCz20pfgkkg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Mon, 25 May 2026 21:42:41 +0100
Subject: [PATCH v2 3/9] firmware: arm_scmi: Extend transport driver macro
 to support ACPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-acpi_scmi_pcc-v2-3-4f38938d08d8@arm.com>
References: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
In-Reply-To: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2
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

Extend the SCMI transport driver helper to support ACPI-based
systems. Introduce an internal helper macro that accepts both OF
and ACPI match tables, and expose two wrappers:

  - DEFINE_SCMI_TRANSPORT_DRIVER(...) for DT/OF transports
  - DEFINE_SCMI_ACPI_TRANSPORT_DRIVER(...) for ACPI transports

For ACPI, the generated platform_driver now sets .acpi_match_table
via ACPI_PTR(), and the spawned platform_device inherits the
parent device's ACPI companion so subsequent fwnode lookups see
the correct firmware node.

This keeps existing DT users unchanged while allowing transports
to be probed using struct acpi_device_id tables on ACPI platforms.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/common.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index cc469370e989..aea3685da824 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -9,6 +9,7 @@
 #ifndef _SCMI_COMMON_H
 #define _SCMI_COMMON_H
 
+#include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/completion.h>
 #include <linux/device.h>
@@ -477,7 +478,8 @@ struct scmi_transport {
 	struct scmi_transport_core_operations **core_ops;
 };
 
-#define DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, __core_ops)\
+#define __DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __of_match,       \
+					__acpi_match, __core_ops)	       \
 static void __tag##_dev_free(void *data)				       \
 {									       \
 	struct platform_device *spdev = data;				       \
@@ -498,6 +500,7 @@ static int __tag##_probe(struct platform_device *pdev)			       \
 									       \
 	device_set_of_node_from_dev(&spdev->dev, dev);			       \
 	device_set_node(&spdev->dev, dev_fwnode(dev));			       \
+	ACPI_COMPANION_SET(&spdev->dev, ACPI_COMPANION(dev));		       \
 									       \
 	strans.supplier = dev;						       \
 	memcpy(&strans.desc, &(__desc), sizeof(strans.desc));		       \
@@ -522,11 +525,18 @@ err:									       \
 static struct platform_driver __drv = {					       \
 	.driver = {							       \
 		   .name = #__tag "_transport",				       \
-		   .of_match_table = __match,				       \
+		   .of_match_table = __of_match,			       \
+		   .acpi_match_table = ACPI_PTR(__acpi_match),		       \
 		   },							       \
 	.probe = __tag##_probe,						       \
 }
 
+#define DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, __core_ops)\
+	__DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, NULL, __core_ops)
+
+#define DEFINE_SCMI_ACPI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, __core_ops)\
+	__DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, NULL, __match, __core_ops)
+
 void scmi_notification_instance_data_set(const struct scmi_handle *handle,
 					 void *priv);
 void *scmi_notification_instance_data_get(const struct scmi_handle *handle);

-- 
2.43.0


