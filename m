Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C1FC88E7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 17:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPlUF+jlmhxiJd29b0DUNFcdEsvoJFl2QvVHlxO9hLA=; b=0IdKF2KVr5y2XEhQdrBn1kElql
	r+CRrRIXxPSg1zC+vrfb5dRlsgSQu7VjUqfCl1NPhXoaj232NyFY16m1V/L4ON51wdRxtkUP4NkMO
	BVWm7pT0jFN6tgURGd74EcF5Qbw81t6qf+GHqRk3zGmN5OkIz/jgz7VsRqGmMJidDCY1tme9aiB3I
	K4YlVCrQHMrMqhZg6SHLkwDXQH+6m4f6Ed41lpaqIwfQCAvzdBAtaUrjQh0HaUUYY6As9BBpuQCn5
	+8DcX32i61+6pYFerLywPz3edT16CUKnQw7UXjr5bNrUvPajtShk7RGSgHzWNAD72VDptWSrl+hep
	Om8dtBJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Wae-00000007WcR-2cdt;
	Tue, 15 Sep 2026 17:05:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Wab-00000007WZc-1DB9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 17:05:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FD8F438A9;
	Tue, 15 Sep 2026 17:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F6D41F00898;
	Tue, 15 Sep 2026 17:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789491900;
	bh=fPlUF+jlmhxiJd29b0DUNFcdEsvoJFl2QvVHlxO9hLA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZN+5d4e0e+R2X8b0v1CKWc+PrTYEeMIrjYc7eU6yernE4KWS50SHeUbISxE5JYplH
	 wPhj2Kc08NpJXmwHOLG7L22R6Akq9BQBP+WBm4z5mN/bC1TALtzd8WolcYKKcmwxWP
	 vuLH3uWYJFsDoWFEfxOqLymGNLQUiPzhOj3Wwb/cIMSn2QeAPemfgnegDhnxAFGV/B
	 IDEOxgWq8V3e0MngxKPiIn+8OvGBAFdVQVIqFnqDTMCPZDFJgtfTe15VAXcee1ly90
	 SJ7Do0ScwQPTZiwtKJe+gTTggejfWAelB7DVNTNXzg+E1nqlIFb6hyzQt9/zRgIqo5
	 JmIiuOgm5j/7w==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 15 Sep 2026 18:03:36 +0100
Subject: [PATCH v5 2/9] firmware: arm_scmi: Extend transport driver macro
 to support ACPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-acpi_scmi_pcc-v5-2-298579e9f359@kernel.org>
References: <20260915-acpi_scmi_pcc-v5-0-298579e9f359@kernel.org>
In-Reply-To: <20260915-acpi_scmi_pcc-v5-0-298579e9f359@kernel.org>
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


