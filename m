Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBC7C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPlUF+jlmhxiJd29b0DUNFcdEsvoJFl2QvVHlxO9hLA=; b=Ncr9gDvT2hqPtshThNZAIcTpNi
	UZGLUXzZP3CxK4x6XSvLfk+WF0J9RyvVj+1bVObbD7uNeIJFQJy0hKeHfP3bwsWRpJUpQQq1qR9iL
	Qw+bS4xicxgCrX1f+J8ZkUz8+tAHkfLblaDiCDPo/C75OYUygCm/JH5HLvo2hTSSMLN0IgEhRfidk
	R/bdjEJw7CK7NSYZxNCjheIgwWFvxCFzsf8fh9kVOEIHPE1DQeDtqnDB70LTzwNF8biq5t7XRfju9
	xzRMd7yl3iZdBUf9QfCLk2H5c4ABbvijzvN6x+41XQEwFfPoxIjMNymDSJJYg14V98k9g5p2eeCMq
	cQaSJV+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WKa-00000002dKn-00WK;
	Fri, 04 Sep 2026 15:59:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WKL-00000002clY-0DRx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 15:59:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7EE2F42DB2;
	Fri,  4 Sep 2026 15:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7464D1F0155D;
	Fri,  4 Sep 2026 15:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788537580;
	bh=fPlUF+jlmhxiJd29b0DUNFcdEsvoJFl2QvVHlxO9hLA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Q+LhnicjBHod2Ym6yIRh2BI/PRSJ9XtQtBXQ9ziiY2XA+JAC42sLPzFHTV46YQmP+
	 pHaYKhrMLvowEKj/uKrq9K2XzkatixuMf3LRwhgViLWrZ8HLm+ZKtdvX1CVQMJc6Wi
	 G0FZXILOFjVGJGByYXSmNTvl5VzyiMxeZgwRNEOYwbw9d/BvIZQSoDFfZgboZDM6dz
	 ypxWO1dSnTIuIIeWUYXX6JfsjmF9MzqFelG1miPR1BcWtOO+fpIMn/PPOXjQ5fiLDI
	 S1wzKmtFYDDBGIIc7lnYqfmCZv0Hs/qn/OycW4Ol1qpFDOLK71UpzY4SL7ztzW5lE5
	 URn3GEAvb0c6g==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 04 Sep 2026 16:57:57 +0100
Subject: [PATCH v4 2/9] firmware: arm_scmi: Extend transport driver macro
 to support ACPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi_scmi_pcc-v4-2-6ebe9755606e@kernel.org>
References: <20260904-acpi_scmi_pcc-v4-0-6ebe9755606e@kernel.org>
In-Reply-To: <20260904-acpi_scmi_pcc-v4-0-6ebe9755606e@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@meta.com
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Breno Leitao <leitao@debian.org>, 
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
X-Mailer: b4 0.16.0
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

Extend the SCMI transport driver helper to support ACPI-based systems.
Introduce an internal helper macro that accepts both OF and ACPI match
tables, and expose two wrappers:

  - DEFINE_SCMI_TRANSPORT_DRIVER(...) for DT/OF transports
  - DEFINE_SCMI_ACPI_TRANSPORT_DRIVER(...) for ACPI transports

For ACPI, set the generated platform_driver .acpi_match_table via
ACPI_PTR(). The ACPI wrapper relies on the firmware-node propagation
provided by the preceding change so fwnode lookups on the spawned
platform device see the correct firmware description.

Keep existing DT users unchanged while allowing transports to be probed
using struct acpi_device_id tables on ACPI platforms.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/common.h | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 244f4ee5b655..f172ec9a054b 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -9,6 +9,7 @@
 #ifndef _SCMI_COMMON_H
 #define _SCMI_COMMON_H
 
+#include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/completion.h>
 #include <linux/device.h>
@@ -615,7 +616,8 @@ struct scmi_transport_supplier __supplier = {			\
 	.th.supplier_put = scmi_transport_supplier_put,		\
 }
 
-#define DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, __core_ops)\
+#define __DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __of_match,       \
+					__acpi_match, __core_ops)	       \
 static void __tag##_dev_free(void *data)				       \
 {									       \
 	struct platform_device *spdev = data;				       \
@@ -681,11 +683,18 @@ err_mem:								       \
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


