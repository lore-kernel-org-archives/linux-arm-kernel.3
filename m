Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87336C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 11:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lph++7GkXhNCe09CPgw1E6pMsOs4MY7kRuOO+yDHD+A=; b=JRs5UGpC9XJ/FOdboYHpcvhOwt
	p47Vf/qDVHTaSzEglS0OSX5zFFyl3N6sIZedsbtFDl3v65ZKZTAgjjTu9kxgTAg0F7n41acS3SCvS
	CAoaYGS9UGcBwAmFWf1W9fGUY76FekF9/iDwAzUp1obQTX9T/bAd/U+K1EsTwFQVIgbTJu7lar2/O
	Y34NDYtI801X+oIaqcKNjccrbcfETyRgYVoOynwWakgY/sBsO7bgL0TkkRVvDP4k9TI9myVhN3X2P
	sgNIyyrheVkQkLi+TmUunQWxCK3uGURC6Pg+tJyMjMEjiSStcZlhimKPWOf2a9eH6Ph60pF0zshk9
	pSHxO9Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTgm-00000000YSs-2Sa7;
	Thu, 13 Aug 2026 11:33:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTgj-00000000YRa-3Ph3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 11:33:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 16796600B0;
	Thu, 13 Aug 2026 11:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E666E1F00A3E;
	Thu, 13 Aug 2026 11:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786620812;
	bh=lph++7GkXhNCe09CPgw1E6pMsOs4MY7kRuOO+yDHD+A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=A4JBBHLBUjGNgT7LQl9H/aIz5zZtT0UMGxYsfwHm+m7TtFWFGpSkQ8S00lhGMpMHl
	 IRTDgtnIW85LKSWKrAwdfOtToI7JPGFr+fDwRNrzLbOBJimFsmGUYgnD3DNGQgebwZ
	 +lNngtnQ7qpN8PdZrZTGoqp9sp2jW4iujfIcFRfSrFNqnmDCJ1xYHC6b50Hz0g1jRn
	 gn9PajCF7G4DcvzF/00RmpRMS1P87rFzAq4n18dm67MwJrEbKr8TOkFNh7fBjkkoCa
	 gJD6p5AJFCAftypmIHD37g4BINiPpaPvVLt0kDsE2jKEhlmWwIrawY71+ICSzgDUGN
	 gVx4A+nvghUBw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 13 Aug 2026 12:32:57 +0100
Subject: [PATCH v3 2/9] firmware: arm_scmi: Extend transport driver macro
 to support ACPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-acpi_scmi_pcc-v3-2-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@meta.com
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Breno Leitao <leitao@debian.org>
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

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/common.h | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index cc7d11c3c1f3..0b896171faa2 100644
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
@@ -679,11 +681,18 @@ err_mem:								       \
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


