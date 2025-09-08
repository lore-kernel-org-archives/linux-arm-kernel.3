Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EF7CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 09:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MP0LLr4lRflx432u6oAkBGLCKf7U72EqLHq7dp9l1Mg=; b=Ae2YVj+MaYvXuSfLGBTuJgIkiX
	+eGNsvXhfkO7VLyt5sWKEJpUdA2fCBFRjzsgSOtBmWvbP/GRznK3v42CwZDmYDABQbeszhayjeRP6
	Dn+K3ZsTUoQ2aTcLEo/cCDrW5cbAVvjjyFWfjNsijDh3X496wmzB3EojfWyf1QVvc4+HjAxUOScd3
	iY4XMQaQqQmBY/EEU1dFydz6Z9h5BhI85TCcDQiuOY9rGDDF8uORCFMA3zKdEnPxMbYfUMMs3+0uK
	L+Rqal7xIRwLJN+JzLs7qwliZH0fw4mueBJDO/817EuShgW1KpHSg5PlUk27jg/dviNsBesX8p5A8
	8hMxtPZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYP5-0000000G7W8-2BtD;
	Mon, 08 Sep 2025 09:43:15 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvXrM-0000000Fuxi-39bE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 09:08:26 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58897uMQ071852;
	Mon, 8 Sep 2025 04:07:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757322476;
	bh=MP0LLr4lRflx432u6oAkBGLCKf7U72EqLHq7dp9l1Mg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fNzupBQ48c/mtWWBs7AX0CqPWWEb0i6xpR8AAe+OSytZHQ3TyXEk8Jyh4WVAvhZJz
	 JKfmP3asMeUeVFZIKHGIdFf599mq2LTP1v/wrXYqYzcntY6lqmS5CpT2tAhaEZHcJW
	 AC1L9Op8+xdRD1mgDHlcE0qUTjQ/2K9TM7X75U5E=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58897ujX2856562
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 04:07:56 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 04:07:55 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 04:07:55 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58897tMr2355795;
	Mon, 8 Sep 2025 04:07:55 -0500
Received: from localhost (danish-tpc.dhcp.ti.com [172.24.231.152])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 58897sQb023024;
	Mon, 8 Sep 2025 04:07:55 -0500
From: MD Danish Anwar <danishanwar@ti.com>
To: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet
	<corbet@lwn.net>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        MD Danish Anwar
	<danishanwar@ti.com>,
        Mengyuan Lou <mengyuanlou@net-swift.com>,
        Luo Jie
	<quic_luoj@quicinc.com>, Fan Gong <gongfan1@huawei.com>,
        Lei Wei
	<quic_leiwei@quicinc.com>,
        Michael Ellerman <mpe@ellerman.id.au>, Lee Trager
	<lee@trager.us>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Parthiban Veerasooran
	<Parthiban.Veerasooran@microchip.com>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Lukas Bulwahn <lukas.bulwahn@redhat.com>
CC: <netdev@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCH net-next v3 2/7] net: rpmsg-eth: Add basic rpmsg skeleton
Date: Mon, 8 Sep 2025 14:37:41 +0530
Message-ID: <20250908090746.862407-3-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908090746.862407-1-danishanwar@ti.com>
References: <20250908090746.862407-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_020824_916636_292D3F92 
X-CRM114-Status: GOOD (  28.92  )
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

Introduces a basic RPMSG Ethernet driver and add it's basic skeleton.
Add support for creating virtual Ethernet devices over RPMSG channels,
allowing user-space programs to send and receive messages using a
standard Ethernet protocol. The driver includes message handling,
probe, and remove functions, along with necessary data structures.

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 drivers/net/ethernet/Kconfig     |  10 +++
 drivers/net/ethernet/Makefile    |   1 +
 drivers/net/ethernet/rpmsg_eth.c | 142 +++++++++++++++++++++++++++++++
 drivers/net/ethernet/rpmsg_eth.h |  85 ++++++++++++++++++
 4 files changed, 238 insertions(+)
 create mode 100644 drivers/net/ethernet/rpmsg_eth.c
 create mode 100644 drivers/net/ethernet/rpmsg_eth.h

diff --git a/drivers/net/ethernet/Kconfig b/drivers/net/ethernet/Kconfig
index f86d4557d8d7..a73a45a9ef3d 100644
--- a/drivers/net/ethernet/Kconfig
+++ b/drivers/net/ethernet/Kconfig
@@ -170,6 +170,16 @@ config OA_TC6
 	  To know the implementation details, refer documentation in
 	  <file:Documentation/networking/oa-tc6-framework.rst>.
 
+config RPMSG_ETH
+	tristate "RPMsg Based Virtual Ethernet driver"
+	depends on RPMSG
+	help
+	  This makes it possible for user-space programs to send and receive
+	  rpmsg messages as a standard eth protocol.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called rpmsg_eth.
+
 source "drivers/net/ethernet/packetengines/Kconfig"
 source "drivers/net/ethernet/pasemi/Kconfig"
 source "drivers/net/ethernet/pensando/Kconfig"
diff --git a/drivers/net/ethernet/Makefile b/drivers/net/ethernet/Makefile
index 67182339469a..aebd15993e3c 100644
--- a/drivers/net/ethernet/Makefile
+++ b/drivers/net/ethernet/Makefile
@@ -107,3 +107,4 @@ obj-$(CONFIG_NET_VENDOR_XIRCOM) += xircom/
 obj-$(CONFIG_NET_VENDOR_SYNOPSYS) += synopsys/
 obj-$(CONFIG_NET_VENDOR_PENSANDO) += pensando/
 obj-$(CONFIG_OA_TC6) += oa_tc6.o
+obj-$(CONFIG_RPMSG_ETH) += rpmsg_eth.o
diff --git a/drivers/net/ethernet/rpmsg_eth.c b/drivers/net/ethernet/rpmsg_eth.c
new file mode 100644
index 000000000000..b375dfd9cf1c
--- /dev/null
+++ b/drivers/net/ethernet/rpmsg_eth.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0
+/* RPMsg Based Virtual Ethernet Driver
+ *
+ * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/remoteproc.h>
+#include "rpmsg_eth.h"
+
+static int rpmsg_eth_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len,
+			      void *priv, u32 src)
+{
+	struct rpmsg_eth_common *common = dev_get_drvdata(&rpdev->dev);
+	struct message *msg = (struct message *)data;
+	u32 msg_type = msg->msg_hdr.msg_type;
+	int ret = 0;
+
+	switch (msg_type) {
+	case RPMSG_ETH_REQUEST_MSG:
+	case RPMSG_ETH_RESPONSE_MSG:
+	case RPMSG_ETH_NOTIFY_MSG:
+		dev_dbg(common->dev, "Msg type = %d, Src Id = %d\n",
+			msg_type, msg->msg_hdr.src_id);
+		break;
+	default:
+		dev_err(common->dev, "Invalid msg type\n");
+		ret = -EINVAL;
+		break;
+	}
+	return ret;
+}
+
+/**
+ * rpmsg_eth_get_shm_info - Retrieve shared memory region for RPMsg Ethernet
+ * @common: Pointer to rpmsg_eth_common structure
+ *
+ * This function locates and maps the reserved memory region for the RPMsg
+ * Ethernet device by traversing the device tree hierarchy. It first identifies
+ * the associated remote processor (rproc), then locates the "rpmsg-eth" child
+ * node within the rproc's device tree node, and finally retrieves the
+ * "memory-region" phandle that points to the reserved memory region.
+ * Once found, the shared memory region is mapped into the
+ * kernel's virtual address space using devm_ioremap()
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+static int rpmsg_eth_get_shm_info(struct rpmsg_eth_common *common)
+{
+	struct device_node *np, *rmem_np;
+	struct reserved_mem *rmem;
+	struct rproc *rproc;
+
+	/* Get the remote processor associated with this device */
+	rproc = rproc_get_by_child(&common->rpdev->dev);
+	if (!rproc) {
+		dev_err(common->dev, "rpmsg eth device not child of rproc\n");
+		return -EINVAL;
+	}
+
+	/* Get the device node from rproc or its parent */
+	np = rproc->dev.of_node ?: (rproc->dev.parent ? rproc->dev.parent->of_node : NULL);
+	if (!np) {
+		dev_err(common->dev, "Cannot find rproc device node\n");
+		return -ENODEV;
+	}
+
+	/* Parse the memory-region phandle */
+	rmem_np = of_parse_phandle(np, "memory-region", common->data.shm_region_index);
+	of_node_put(np);
+	if (!rmem_np)
+		return -EINVAL;
+
+	/* Lookup the reserved memory region */
+	rmem = of_reserved_mem_lookup(rmem_np);
+	of_node_put(rmem_np);
+	if (!rmem)
+		return -EINVAL;
+
+	common->port->shm = devm_ioremap(common->dev, rmem->base, rmem->size);
+	if (IS_ERR(common->port->shm))
+		return PTR_ERR(common->port->shm);
+
+	common->port->buf_size = rmem->size;
+
+	return 0;
+}
+
+static int rpmsg_eth_probe(struct rpmsg_device *rpdev)
+{
+	struct device *dev = &rpdev->dev;
+	struct rpmsg_eth_common *common;
+	int ret = 0;
+
+	common = devm_kzalloc(&rpdev->dev, sizeof(*common), GFP_KERNEL);
+	if (!common)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, common);
+
+	common->port = devm_kzalloc(dev, sizeof(*common->port), GFP_KERNEL);
+	common->dev = dev;
+	common->rpdev = rpdev;
+	common->data = *(const struct rpmsg_eth_data *)rpdev->id.driver_data;
+	dev_err(dev, "shm_index = %d\n", common->data.shm_region_index);
+
+	ret = rpmsg_eth_get_shm_info(common);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void rpmsg_eth_remove(struct rpmsg_device *rpdev)
+{
+	dev_dbg(&rpdev->dev, "rpmsg-eth client driver is removed\n");
+}
+
+static const struct rpmsg_eth_data ti_rpmsg_eth_data = {
+	.shm_region_index = 2,
+};
+
+static struct rpmsg_device_id rpmsg_eth_id_table[] = {
+	{ .name = "ti.shm-eth", .driver_data = (kernel_ulong_t)&ti_rpmsg_eth_data },
+	{},
+};
+MODULE_DEVICE_TABLE(rpmsg, rpmsg_eth_id_table);
+
+static struct rpmsg_driver rpmsg_eth_rpmsg_client = {
+	.drv.name = KBUILD_MODNAME,
+	.id_table = rpmsg_eth_id_table,
+	.probe = rpmsg_eth_probe,
+	.callback = rpmsg_eth_rpmsg_cb,
+	.remove = rpmsg_eth_remove,
+};
+module_rpmsg_driver(rpmsg_eth_rpmsg_client);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("MD Danish Anwar <danishanwar@ti.com>");
+MODULE_DESCRIPTION("RPMsg Based Virtual Ethernet driver");
diff --git a/drivers/net/ethernet/rpmsg_eth.h b/drivers/net/ethernet/rpmsg_eth.h
new file mode 100644
index 000000000000..7c8ae57fcf07
--- /dev/null
+++ b/drivers/net/ethernet/rpmsg_eth.h
@@ -0,0 +1,85 @@
+/* SPDX-License-Identifier: GPL-2.0
+ * RPMsg Based Virtual Ethernet Driver common header
+ *
+ * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+#ifndef __RPMSG_ETH_H__
+#define __RPMSG_ETH_H__
+
+#include <linux/errno.h>
+#include <linux/etherdevice.h>
+#include <linux/if_ether.h>
+#include <linux/if_vlan.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/netdevice.h>
+#include <linux/rpmsg.h>
+
+#define RPMSG_ETH_SHM_MAGIC_NUM 0xABCDABCD
+
+enum rpmsg_eth_msg_type {
+	RPMSG_ETH_REQUEST_MSG = 0,
+	RPMSG_ETH_RESPONSE_MSG,
+	RPMSG_ETH_NOTIFY_MSG,
+};
+
+/**
+ * struct message_header - message header structure for RPMSG Ethernet
+ * @src_id: Source endpoint ID
+ * @msg_type: Message type
+ */
+struct message_header {
+	u32 src_id;
+	u32 msg_type;
+} __packed;
+
+/**
+ * struct message - RPMSG Ethernet message structure
+ *
+ * @msg_hdr: Message header contains source and destination endpoint and
+ *          the type of message
+ *
+ * This structure is used to send and receive messages between the RPMSG
+ * Ethernet ports.
+ */
+struct message {
+	struct message_header msg_hdr;
+} __packed;
+
+/**
+ * struct prueth_pdata - RPMSG ETH device data
+ * @shm_region_index: Shared memory region index
+ */
+struct rpmsg_eth_data {
+	u8 shm_region_index;
+};
+
+/**
+ * struct rpmsg_eth_common - common structure for RPMSG Ethernet
+ * @rpdev: RPMSG device
+ * @port: Ethernet port
+ * @dev: Device
+ * @data: Vendor specific data
+ */
+struct rpmsg_eth_common {
+	struct rpmsg_device *rpdev;
+	struct rpmsg_eth_port *port;
+	struct device *dev;
+	struct rpmsg_eth_data data;
+};
+
+/**
+ * struct rpmsg_eth_port - Ethernet port structure for RPMSG Ethernet
+ * @common: Pointer to the common RPMSG Ethernet structure
+ * @shm: Shared memory region mapping
+ * @buf_size: Size (in bytes) of the shared memory buffer for this port
+ */
+struct rpmsg_eth_port {
+	struct rpmsg_eth_common *common;
+	void __iomem *shm;
+	phys_addr_t buf_size;
+};
+
+#endif /* __RPMSG_ETH_H__ */
-- 
2.34.1


