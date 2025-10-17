Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6DACCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 13:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1B+7cFZ3UNUlvSb/muUu/UTmvwC8AThbVW1WeatoRz4=; b=QIn/k60bx+zBpUVvy+WQnfxC0W
	Y5mO2aPFj+JyW3KvfHsv3FM4oK2pN44Cz26CbiCKhY5Dv0f87V9O+YdXW9gW7irQ7qZLmKCt4PyNt
	dvjUe0U8Y8oObzKSEYQi9t9UJXbXtsTlOUbj1/7oCj9OpPyFdt2MeIffzvDlOCCs9DfqIzC2QvXdK
	Z/VEuj+uC1wjTmmh5Ul7euup6GoPxv4XPZTADh8CIRylT6EKQRCt5z/9FZLVVKmJya+ZAiXhn6968
	tyfo30Te5069rTptVIJFAcg5UQ4hzotzM+Q0gv4QJP8sNFryoG255h2E2BaAXPtWH6pTywnHzIyJ8
	PE0lcjxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9kRR-00000007uSS-35nX;
	Fri, 17 Oct 2025 13:24:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9kRP-00000007uQM-1xEa
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 13:24:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=1B+7cFZ3UNUlvSb/muUu/UTmvwC8AThbVW1WeatoRz4=; b=Kvs5YpJ7zdPV7AzD85xuUZV7B8
	VgYuWczipuwgv/v8+SxsxnUlefuKvcMhgZEjI6gzI9KKfpwQFzELnnVj8TGt7H0/b78X1k/ioLGKn
	kphTZFR7i+YZ7J83E5e/KU6hGOMso19L2JOEAN1fUwl8Nuz8u+cbQmnYG9fgTMu3pe+atI3bCR84T
	4jCs2OnDKcfzeauqERiG5wViEnbLN8WeoUoKCM3bAUDlc2xGttz5r4JBtboWIVV8AEjUWj/dmm7lx
	qy7MiKLR+Wjnfb0pW396vNnewdCKpELc79aLcl5fPWkIsbE7Q9kmr0oVc1LxHQfbo6DcqldF9m2jx
	OeUqP9/w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9kRM-00000007c16-0Uu4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 13:24:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1985119F6;
	Fri, 17 Oct 2025 06:24:04 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 463983F66E;
	Fri, 17 Oct 2025 06:24:11 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 17 Oct 2025 14:23:45 +0100
Subject: [PATCH 2/8] firmware: arm_scmi: Extend transport driver macro to
 support ACPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251017-acpi_scmi_pcc-v1-2-0adbab7709d9@arm.com>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
In-Reply-To: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Sudeep Holla <sudeep.holla@arm.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_142416_521892_CB574C37 
X-CRM114-Status: GOOD (  11.91  )
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

Extend the SCMI transport driver helper to also support ACPI-based
systems. Introduce an internal helper macro that accepts both OF and
ACPI match tables, and expose two wrappers:

  - DEFINE_SCMI_TRANSPORT_DRIVER(...)      -> DT/OF wrapper (unchanged ABI)
  - DEFINE_SCMI_ACPI_TRANSPORT_DRIVER(...) -> ACPI wrapper

For ACPI, the generated platform_driver now sets .acpi_match_table via
ACPI_PTR() so that builds without CONFIG_ACPI remain safe (becomes NULL).
The spawned platform_device inherits the parent device’s ACPI companion
to ensure proper firmware-node association (i.e.subsequent lookups or
fwnode use see the correct firmware node).

This keeps existing DT users unchanged and continues to function as
expected while allowing transports to be probed using the structure
`acpi_device_id` tables on ACPI platforms.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/common.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 911941e6885d..d038fec72360 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -9,6 +9,7 @@
 #ifndef _SCMI_COMMON_H
 #define _SCMI_COMMON_H
 
+#include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/completion.h>
 #include <linux/device.h>
@@ -453,7 +454,8 @@ struct scmi_transport {
 	struct scmi_transport_core_operations **core_ops;
 };
 
-#define DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, __core_ops)\
+#define __DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __of_match,       \
+					__acpi_match, __core_ops)	       \
 static void __tag##_dev_free(void *data)				       \
 {									       \
 	struct platform_device *spdev = data;				       \
@@ -474,6 +476,7 @@ static int __tag##_probe(struct platform_device *pdev)			       \
 									       \
 	device_set_of_node_from_dev(&spdev->dev, dev);			       \
 	device_set_node(&spdev->dev, dev_fwnode(dev));			       \
+	ACPI_COMPANION_SET(&spdev->dev, ACPI_COMPANION(dev));		       \
 									       \
 	strans.supplier = dev;						       \
 	memcpy(&strans.desc, &(__desc), sizeof(strans.desc));		       \
@@ -498,11 +501,18 @@ err:									       \
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
2.34.1


