Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63292E77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 13:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iTGvHrcTaQRE6EGi6WHeT9jClkvtJUPF3/CG0AQje/o=; b=higA+rqMgRnFrv8A1EQdDoutZm
	P+6qCzJbmK/EFqfdJtIMefPgM8i9z+CZy1ERhz8PB6GMq8xQ60d5QvzeGju6eeMm1DAU+ZwGYbu8p
	WpBqUlYFqvoACBAZ+NCkbaEKoekJFtdGNRiMZCNB2Qn4biE5Go7wyZMSaLLSK1lfj7vgVExW1pCVX
	HVdU10dQpW+6VhmxwLNFEqdhP1c/StIyTfT2pnOavo5YXoLRCXPrSs33ABrcPVXIaDuScntfAqpvT
	0vD6rUrBUrBBMHiVb+ED7+E+jVENtb1Og+hyHDKUakWfON+N7qkbi9xu1/posqm10F4mpGyZ16T5S
	+i5KITNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLN2t-0000000F22T-15JY;
	Wed, 11 Dec 2024 13:46:31 +0000
Received: from smtp153-162.sina.com.cn ([61.135.153.162])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLN1m-0000000F1gg-3rKp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 13:45:27 +0000
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([58.48.52.254])
	by sina.com (10.182.253.25) with ESMTP
	id 675997620000376C; Wed, 11 Dec 2024 21:45:08 +0800 (CST)
X-Sender: guomin_chen@sina.com
X-Auth-ID: guomin_chen@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=guomin_chen@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=guomin_chen@sina.com
X-SMAIL-MID: 30054012059153
X-SMAIL-UIID: 1F8406BE2AA2478480B6D63F9C5D81B4-20241211-214508-1
From: guomin_chen@sina.com
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Xinqi Zhang <quic_xinqzhan@quicinc.com>,
	guomin chen <gchen.guomin@gmail.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	guomin chen <guomin_chen@sina.com>
Subject: [PATCH] firmware: arm_scmi: Delete the meaningless scmi_bus_id.
Date: Wed, 11 Dec 2024 21:45:05 +0800
Message-ID: <20241211134505.2218386-1-guomin_chen@sina.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_054523_124962_57CAE1D4 
X-CRM114-Status: GOOD (  11.02  )
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

From: guomin chen <guomin_chen@sina.com>

Currently, scmi_bus_id is only used to set scmi_dev.id,
which in turn sets the SCMI device name. After removing
scmi_bus_id, it is clearer and more meaningful to directly
use the input parameters name and protocol to set the SCMI
device name.

Signed-off-by: guomin chen <guomin_chen@sina.com>
---
 drivers/firmware/arm_scmi/bus.c    | 16 ++--------------
 drivers/firmware/arm_scmi/driver.c |  4 ++--
 2 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 157172a5f2b5..c4e013a77e33 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -20,7 +20,6 @@
 BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
 EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
 
-static DEFINE_IDA(scmi_bus_id);
 
 static DEFINE_IDR(scmi_requested_devices);
 /* Protect access to scmi_requested_devices */
@@ -341,7 +340,6 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
 	if (scmi_dev->protocol_id == SCMI_PROTOCOL_SYSTEM)
 		atomic_set(&scmi_syspower_registered, 0);
 
-	ida_free(&scmi_bus_id, scmi_dev->id);
 	device_unregister(&scmi_dev->dev);
 }
 
@@ -349,7 +347,7 @@ static struct scmi_device *
 __scmi_device_create(struct device_node *np, struct device *parent,
 		     int protocol, const char *name)
 {
-	int id, retval;
+	int retval;
 	struct scmi_device *scmi_dev;
 
 	/*
@@ -387,20 +385,12 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 		return NULL;
 	}
 
-	id = ida_alloc_min(&scmi_bus_id, 1, GFP_KERNEL);
-	if (id < 0) {
-		kfree_const(scmi_dev->name);
-		kfree(scmi_dev);
-		return NULL;
-	}
-
-	scmi_dev->id = id;
 	scmi_dev->protocol_id = protocol;
 	scmi_dev->dev.parent = parent;
 	device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
 	scmi_dev->dev.bus = &scmi_bus_type;
 	scmi_dev->dev.release = scmi_device_release;
-	dev_set_name(&scmi_dev->dev, "scmi_dev.%d", id);
+	dev_set_name(&scmi_dev->dev, "scmi_dev.%s.%d", scmi_dev->name, protocol);
 
 	retval = device_register(&scmi_dev->dev);
 	if (retval)
@@ -413,7 +403,6 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 	return scmi_dev;
 put_dev:
 	put_device(&scmi_dev->dev);
-	ida_free(&scmi_bus_id, id);
 	return NULL;
 }
 
@@ -526,7 +515,6 @@ static void __exit scmi_bus_exit(void)
 	 */
 	scmi_devices_unregister();
 	bus_unregister(&scmi_bus_type);
-	ida_destroy(&scmi_bus_id);
 }
 module_exit(scmi_bus_exit);
 
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 1b5fb2c4ce86..bbf1f05f2be3 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2641,8 +2641,8 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 	cinfo->max_msg_size = info->desc->max_msg_size;
 
 	/* Create a unique name for this transport device */
-	snprintf(name, 32, "__scmi_transport_device_%s_%02X",
-		 idx ? "rx" : "tx", prot_id);
+	snprintf(name, 32, "__scmi_transport_device_%s",
+		 idx ? "rx" : "tx");
 	/* Create a uniquely named, dedicated transport device for this chan */
 	tdev = scmi_device_create(of_node, info->dev, prot_id, name);
 	if (!tdev) {
-- 
2.47.1


