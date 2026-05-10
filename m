Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377A1CD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 16:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkp7o/1pAM8WkFyykEuAzGBFnLQC+wvXXVE9S0cIzOg=; b=rgE6sfW449ce/iBm9Vahwl8nkt
	fFtpdZ+V0gYUvOwM4TnlS1XhUfYK6r/QG/RzMrblc/+wUdEyC7EkU9SpilrIFJaWGSKEXesq49INl
	TWwBeQpXAJZGy1EHy/Ni4xmB+RzOZVRL1Ub6M3O59cJ4Q06xQmneQVjrP6yb88ry16hz/R5Z46wJi
	dxmo7Q5DSgV1scLqlF752o+QOc9ztt8pBduFtSBUAhl5Zvue9VjiTe5zk4uOTGjraxL+8FlQv33hP
	Cuz3jJJsJRHU0O37QMjtlT17ODwq9Qj73bD0bpMCj3dir/V66L6eGnBYdWsNbAvezXh8rJ1nxD1Le
	CdlLPPSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM6fS-0000000B79c-2PF3;
	Sun, 10 May 2026 16:06:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM6fO-0000000B77k-1euO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 16:06:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AEB726AC;
	Sun, 10 May 2026 09:06:00 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3781C3F836;
	Sun, 10 May 2026 09:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778429165; bh=VoP9MzxO+x8ngK9bt91ncy4odq1+TRH2nb39mF9mq/0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hb5UTIhMZsjtKox+UHqLPnIoZwkaNAdFcP3Ja8Qyt8DMTOYlgEq0wzQgA0SvT+DRP
	 KZmsLPcnWBg0QSr/DxZH7XuIDEPnYfPno1dSAJRpTRp3c85M/FEm84EyWmWgMnusny
	 w0PomRABGEXfrPhzdNL5/s/Cw2bsS/gR2eco70W0=
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
Subject: [PATCH v2 3/4] firmware: arm_scmi: virtio: Rework transport probe sequence
Date: Sun, 10 May 2026 17:05:26 +0100
Message-ID: <20260510160527.3537474-4-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260510160527.3537474-1-cristian.marussi@arm.com>
References: <20260510160527.3537474-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_090606_517658_5B651362 
X-CRM114-Status: GOOD (  16.17  )
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

Use the new per-instance transport handles helpers to synchronize and
optionally defer the core SCMI driver probe up until the transport driver
has completely been initialized and it is fully operational as a supplier.

Introduce proper module init/exit routines while removing the ugly trick of
registering a driver from within the probe sequence of another one, just to
avoid to have to deal with probe deferrals.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v1 -> v2
 - fixed __MUTEX_INITILIAZER() usage
 - use common generic supplier definitions
 - get rid of init/cleanup wrappers
 - fixed possible race between supplier made available and scmi_dev
   made visible
 - restored initial virtio_device_ready() logic, taking care to reset
   device on failure too
---
 drivers/firmware/arm_scmi/transports/virtio.c | 52 +++++++++++++++----
 1 file changed, 43 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/virtio.c b/drivers/firmware/arm_scmi/transports/virtio.c
index 326c4a93e44b..3282d8271839 100644
--- a/drivers/firmware/arm_scmi/transports/virtio.c
+++ b/drivers/firmware/arm_scmi/transports/virtio.c
@@ -4,7 +4,7 @@
  * (SCMI).
  *
  * Copyright (C) 2020-2022 OpenSynergy.
- * Copyright (C) 2021-2024 ARM Ltd.
+ * Copyright (C) 2021-2026 ARM Ltd.
  */
 
 /**
@@ -116,6 +116,8 @@ static struct scmi_transport_core_operations *core;
 /* Only one SCMI VirtIO device can possibly exist */
 static struct virtio_device *scmi_vdev;
 
+static DEFINE_SCMI_TRANSPORT_SUPPLIER(scmi_virtio_supplier);
+
 static void scmi_vio_channel_ready(struct scmi_vio_channel *vioch,
 				   struct scmi_chan_info *cinfo)
 {
@@ -394,6 +396,10 @@ static bool virtio_chan_available(struct device_node *of_node, int idx)
 		return false;
 	}
 
+	dev_dbg(&scmi_vdev->dev, "%s Channel %sAVAILABLE on SCMI Virtio device.\n",
+		idx == VIRTIO_SCMI_VQ_TX ? "TX" : "RX",
+		(vioch && !vioch->cinfo) ? "" : "NOT ");
+
 	return vioch && !vioch->cinfo;
 }
 
@@ -410,7 +416,7 @@ static int virtio_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 	int i;
 
 	if (!scmi_vdev)
-		return -EPROBE_DEFER;
+		return -EINVAL;
 
 	vioch = &((struct scmi_vio_channel *)scmi_vdev->priv)[index];
 
@@ -460,6 +466,9 @@ static int virtio_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 
 	scmi_vio_channel_ready(vioch, cinfo);
 
+	dev_dbg(&scmi_vdev->dev, "%s Channel SETUP on SCMI Virtio device.\n",
+		tx ? "TX" : "RX");
+
 	return 0;
 }
 
@@ -801,7 +810,7 @@ static struct scmi_desc scmi_virtio_desc = {
 };
 
 static const struct of_device_id scmi_of_match[] = {
-	{ .compatible = "arm,scmi-virtio" },
+	{ .compatible = "arm,scmi-virtio", .data = &scmi_virtio_supplier.th},
 	{ /* Sentinel */ },
 };
 
@@ -864,33 +873,33 @@ static int scmi_vio_probe(struct virtio_device *vdev)
 			sz = MSG_TOKEN_MAX;
 		}
 		channels[i].max_msg = sz;
+		dev_dbg(dev, "VQ%d initialized with max_msg: %d\n", i, sz);
 	}
 
 	vdev->priv = channels;
-
 	/* Ensure initialized scmi_vdev is visible */
 	smp_store_mb(scmi_vdev, vdev);
 
 	/* Set device ready */
 	virtio_device_ready(vdev);
 
-	ret = platform_driver_register(&scmi_virtio_driver);
+	ret = scmi_transport_supplier_put(&scmi_virtio_supplier.th, &vdev->dev);
 	if (ret) {
+		virtio_reset_device(vdev);
 		vdev->priv = NULL;
 		vdev->config->del_vqs(vdev);
 		/* Ensure NULLified scmi_vdev is visible */
 		smp_store_mb(scmi_vdev, NULL);
-
 		return ret;
 	}
 
+	dev_dbg(dev, "Probed and initialized SCMI Virtio device.\n");
+
 	return 0;
 }
 
 static void scmi_vio_remove(struct virtio_device *vdev)
 {
-	platform_driver_unregister(&scmi_virtio_driver);
-
 	/*
 	 * Once we get here, virtio_chan_free() will have already been called by
 	 * the SCMI core for any existing channel and, as a consequence, all the
@@ -900,8 +909,10 @@ static void scmi_vio_remove(struct virtio_device *vdev)
 	 */
 	virtio_reset_device(vdev);
 	vdev->config->del_vqs(vdev);
+
 	/* Ensure scmi_vdev is visible as NULL */
 	smp_store_mb(scmi_vdev, NULL);
+	scmi_transport_supplier_put(&scmi_virtio_supplier.th, &vdev->dev);
 }
 
 static int scmi_vio_validate(struct virtio_device *vdev)
@@ -936,7 +947,30 @@ static struct virtio_driver virtio_scmi_driver = {
 	.validate = scmi_vio_validate,
 };
 
-module_virtio_driver(virtio_scmi_driver);
+static int __init scmi_transport_virtio_init(void)
+{
+	int ret;
+
+	ret = register_virtio_driver(&virtio_scmi_driver);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&scmi_virtio_driver);
+	if (ret) {
+		unregister_virtio_driver(&virtio_scmi_driver);
+		return ret;
+	}
+
+	return ret;
+}
+module_init(scmi_transport_virtio_init);
+
+static void __exit scmi_transport_virtio_exit(void)
+{
+	platform_driver_unregister(&scmi_virtio_driver);
+	unregister_virtio_driver(&virtio_scmi_driver);
+}
+module_exit(scmi_transport_virtio_exit);
 
 MODULE_AUTHOR("Igor Skalkin <igor.skalkin@opensynergy.com>");
 MODULE_AUTHOR("Peter Hilber <peter.hilber@opensynergy.com>");
-- 
2.53.0


