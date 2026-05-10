Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2839CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 16:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BE2PpXc/D5MLDFjNabJxJPIL/GW8xcE54hFIvQOuxKM=; b=SYkhRV+QwGBk85OOSUXF9mTuns
	9piig6vChDiFmSaBIqug0nd4GteFt2uBoPwKMdW5U1W5bS9jJxLbwL6zpuseaApqlLBxmsXAgDl7D
	Gd5gWPHFwDZWiqOXmGW+EupElHyW2iVXtES5MiFNl9gnMhcvGkdBPU3mAvM2wVBvUEogSX/hS1ecM
	bxG9hARZGyzbSkniKcvv85GPesYHmtJYNvxARWhTjtKcg4MCGAFhfItP0ao78JYlOi2aZ4CYuqFMZ
	0n0sNJnxHQtwhPgBbaOy+J8gJjDDTnBbE8QghERB/utvYKf75vOFdXclcbn0R7XgGyt/4qrni3pKz
	ljdmFZlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM6fS-0000000B79M-0xT5;
	Sun, 10 May 2026 16:06:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM6fK-0000000B76Q-3cfQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 16:06:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B05592972;
	Sun, 10 May 2026 09:05:54 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 756863F836;
	Sun, 10 May 2026 09:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778429160; bh=w9BUYaJkPdlrqRsI2rYzDAZGFyxczOTFgyyyubfwW9I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cTOicdDiG7K6UW6wTuwcB3Wf0LetuVK7dyjZw4US4XCbsD4wa4q8AaCOTqj/XnXCt
	 GXjTYPEEYwMzT9c2+VfKlHPLCD6woWGpmlSTUTs06QZTFCSTWbEbGpo4ZkgOZh9m0t
	 4KQhujdiQlJAxgGSi0Nc0vpZhT8LJ+F9xnTql1mg=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	gatien.chevallier@foss.st.com,
	u.kleine-koenig@baylibre.com,
	dakr@kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v2 1/4] firmware: arm_scmi: Add transport instance handles
Date: Sun, 10 May 2026 17:05:24 +0100
Message-ID: <20260510160527.3537474-2-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260510160527.3537474-1-cristian.marussi@arm.com>
References: <20260510160527.3537474-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_090602_988702_BD78AD39 
X-CRM114-Status: GOOD (  23.51  )
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

SCMI transport drivers are initialized first and then the control is passed
to the SCMI core stack: some of these transports are dependent also on some
external subsytem which will have to be initialized upfront, before the
transport driver itself can be deemed operational.

Transport drivers like virtio or optee need a way to defer the core SCMI
probing till they are fully initialized and operational and also a way to
pass back the device reference to be used as a supplier while building the
devlink relations.

SCMI transport drivers can be probed multiple times when used in a multiple
instance configuration but the capability to carry-on with multiple probes
depends on the support provided by the underlying transport driver.

This change will also allow for the removal of the frowned-upon trick of
registering a platform driver only after the end of the transport drivers
porbe to avoid explicit probe deferrals.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v1 -> v2
 - saving *th handle into scmi_transport to simplify freeing path
 - add a return value to supplier_put
---
 drivers/firmware/arm_scmi/common.h | 52 +++++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 7c9617d080a0..af6f9f498e14 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -17,6 +17,7 @@
 #include <linux/hashtable.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/refcount.h>
 #include <linux/scmi_protocol.h>
 #include <linux/spinlock.h>
@@ -462,6 +463,28 @@ struct scmi_transport_core_operations {
 	const struct scmi_message_operations *msg;
 };
 
+/**
+ * struct scmi_transport_handle  - Transport instance handle
+ * @supplier_get: A helper to retrieve the device descriptor, identifying the
+ *		  transport driver serving this SCMI instance, which will be
+ *		  used as a supplier for the core SCMI driver: returning an
+ *		  error here causes the probe sequence to be interrupted and
+ *		  return that same error code, so that each transport can decide
+ *		  which policy to implement by choosing an appropriate error.
+ * @supplier_put: A helper to signal that the specified transport supplier is
+ *		  no more being used and it is made available again.
+ *
+ * Note that these helpers are needed and provided only by those transports
+ * whose initialization relies on some other subsystem and whose relations to
+ * the core SCMI driver is not tracked by firmware descriptions.
+ */
+struct scmi_transport_handle {
+	struct device __must_check *(*supplier_get)
+		(const struct scmi_transport_handle *th);
+	int (*supplier_put)(const struct scmi_transport_handle *th,
+			    struct device *dev);
+};
+
 /**
  * struct scmi_transport  - A structure representing a configured transport
  *
@@ -470,35 +493,52 @@ struct scmi_transport_core_operations {
  * @desc: Transport descriptor
  * @core_ops: A pointer to a pointer used by the core SCMI stack to make the
  *	      core transport operations accessible to the transports.
+ * @th: An optional pointer to the transport handle
  */
 struct scmi_transport {
 	struct device *supplier;
 	struct scmi_desc desc;
 	struct scmi_transport_core_operations **core_ops;
+	const struct scmi_transport_handle *th;
 };
 
 #define DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, __core_ops)\
 static void __tag##_dev_free(void *data)				       \
 {									       \
 	struct platform_device *spdev = data;				       \
+	struct scmi_transport *strans;					       \
+									       \
+	strans = dev_get_platdata(&spdev->dev);				       \
+	if (strans && strans->th)					       \
+		strans->th->supplier_put(strans->th, strans->supplier);	       \
 									       \
 	platform_device_unregister(spdev);				       \
 }									       \
 									       \
 static int __tag##_probe(struct platform_device *pdev)			       \
 {									       \
-	struct device *dev = &pdev->dev;				       \
+	struct device *dev = &pdev->dev, *supplier;			       \
 	struct platform_device *spdev;					       \
 	struct scmi_transport strans;					       \
 	int ret;							       \
 									       \
+	supplier = dev;							       \
+	strans.th = device_get_match_data(dev);				       \
+	if (strans.th) {						       \
+		supplier = strans.th->supplier_get(strans.th);		       \
+		if (IS_ERR(supplier))					       \
+			return PTR_ERR(supplier);			       \
+	}								       \
+									       \
 	spdev = platform_device_alloc("arm-scmi", PLATFORM_DEVID_AUTO);	       \
-	if (!spdev)							       \
-		return -ENOMEM;						       \
+	if (!spdev) {							       \
+		ret = -ENOMEM;						       \
+		goto err_mem;						       \
+	}								       \
 									       \
 	device_set_of_node_from_dev(&spdev->dev, dev);			       \
 									       \
-	strans.supplier = dev;						       \
+	strans.supplier = supplier;					       \
 	memcpy(&strans.desc, &(__desc), sizeof(strans.desc));		       \
 	strans.core_ops = &(__core_ops);				       \
 									       \
@@ -515,6 +555,10 @@ static int __tag##_probe(struct platform_device *pdev)			       \
 									       \
 err:									       \
 	platform_device_put(spdev);					       \
+err_mem:								       \
+	if (strans.th)							       \
+		strans.th->supplier_put(strans.th, supplier);			       \
+									       \
 	return ret;							       \
 }									       \
 									       \
-- 
2.53.0


