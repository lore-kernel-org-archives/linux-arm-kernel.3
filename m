Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE54C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 14:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OdWbFk5dfgCFrtTumGsxzlaKJCNHfWv89PeF9IkFsqU=; b=H/8TONvGNwNTsghHRRSUdyrkRF
	DYxeWWpiYS1Ra8RdDQS1ddPxqxyW5Lk8DxjdTarizJLCrramOTVVWncKzJJ3YD7Ud5z6vl2iHpF90
	jmw/TZ7mCLuZDO6jamp78t6AGE9Wzkzijq4LuXIqfYgktnK6y2795mKvdaGXxiWK+3OHteQ2tMdF3
	VO7skDHaFdX4Tw6QXse2aKQr0GMPiK66SAdDOh6my7xiawWomJwW8xlbkIT1JKVvd6fOqxgFo9loL
	2PUUf5oBHw2BjjIdTKKdTbDBBuWKZ0TeFmj6zF6PTNNWxfFsvDMsc9Sbm4dXVP/3aZmVGRDx60VqS
	UBh2EDPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI4X-00000009frk-46c8;
	Mon, 13 Jul 2026 14:55:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI49-00000009fVd-0Xr7
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 14:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=OdWbFk5dfgCFrtTumGsxzlaKJCNHfWv89PeF9IkFsqU=; b=ibksC+u9jc8ZUbRPhZNSot6XXg
	Af+jL/B4b0dvYGWV1JcnH2Ap8Dcsja1J42aACwc/hhs7af5uk8MBxWiIlOGziArg7GCyidCqYTOBE
	3W4Bjuo/GS8OHlOMHDl9fJkLw7njAb+sZR/OdmA+fiwC5ggwbzoOkIiu+M5ggnO/NQ4X54YMtJKi7
	+l4k2ULDuQ/3Z8Awg2ClXV5yFtTtW1wnEwUh76LAa1rJmXbxSNl9DRcuIsbKPMFA3YdS43mLQTeX1
	lRH0jR1KP8VXoXrBWeamhkZtVyFKHJPaXVfUww7kxpWDwYQ1lrGDFfQ0r2/TLo+wgpS1Egsxxlzck
	OoEMtK4w==;
Received: from mail.fris.de ([116.203.77.234])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjI3z-0000000Bjt9-1AXw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 14:55:28 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1783954516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OdWbFk5dfgCFrtTumGsxzlaKJCNHfWv89PeF9IkFsqU=;
	b=HQarINlRbM/Z8ihQ/RvYvIBbV6FtOPF1NPa8mm1lsumIXG9lIIE0aWXfqlqv0xKzoJO+ni
	yMP082n0fawLy6eU1go98w9iI/s64zF4Qq9L+cMv6x/oOuEc9RblBQ3oim0vSxfzXUBYyM
	J10WIEdQCRj/3iq0zzHOiItX2r6Oy0wyttJcNElt3lAw/xKW7LfAAWysFTDJ7ut8ZNBtOl
	vQ7iqcFyy23VeLt4mo+UAhluWgpKhPI4Dw1P4Phkdnt31K6HmIEptIxtdhKqIVIfz7yWOl
	pL8XrAbQmYvHBQWGY5EgttYqCN78hpJYca+kz2QGIS9leYVvLS0QgkLpYN1cog==
Date: Mon, 13 Jul 2026 16:53:39 +0200
Subject: [PATCH v2 03/10] firmware: imx: ele: Export API functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-3-b8266d93514b@kontron.de>
References: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
In-Reply-To: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=12738;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=82aWrS74faGdiktevUv+md5sBCcaZfTuW2ECsJQUTOw=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISvkT+CErJvijkatgWIu61sPzZLk5unP7nps/lH8yBz7C
 1KiLy90lLIwiHExyIopskjxW7y2NYv1kT9WHQUzh5UJZAgDF6cATGQuDyPDW/eUwC3flj3OWb2M
 u/EfC3fqp54lZ39OXZi7QHLuo6VNhxkZDrSxer163TBB8nvdRqt5LkoflzZWFFdyOZ78+T1kNdt
 kHgA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_155525_985303_B2905CD3 
X-CRM114-Status: GOOD (  22.52  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Export generic ELE API functions to send and receive messages. This
allows drivers to implement functions based on the ELE API.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/firmware/imx/ele_base_msg.c | 47 +++++++++++-----------
 drivers/firmware/imx/ele_common.c   | 35 ++++++++++++++++-
 drivers/firmware/imx/ele_common.h   | 15 -------
 drivers/firmware/imx/se_ctrl.h      | 14 +------
 include/linux/firmware/imx/se_api.h | 78 +++++++++++++++++++++++++++++++++++++
 5 files changed, 136 insertions(+), 53 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index ec718d322abc..69e70fd6a0d3 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -8,6 +8,7 @@
 #include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/dma-mapping.h>
+#include <linux/firmware/imx/se_api.h>
 #include <linux/genalloc.h>
 
 #include "ele_base_msg.h"
@@ -79,9 +80,9 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 		return -ENOMEM;
 	}
 
-	ret = se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
-				  ELE_GET_INFO_REQ, ELE_GET_INFO_REQ_MSG_SZ,
-				  true);
+	ret = imx_se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+				      ELE_GET_INFO_REQ, ELE_GET_INFO_REQ_MSG_SZ,
+				      true);
 	if (ret)
 		goto exit;
 
@@ -93,8 +94,8 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	if (ret < 0)
 		goto exit;
 
-	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_GET_INFO_REQ,
-				      ELE_GET_INFO_RSP_MSG_SZ, true);
+	ret = imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_GET_INFO_REQ,
+					  ELE_GET_INFO_RSP_MSG_SZ, true);
 	if (ret < 0)
 		goto exit;
 
@@ -132,10 +133,10 @@ int ele_ping(struct se_if_priv *priv)
 	if (!rx_msg)
 		return -ENOMEM;
 
-	ret = se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
-				  ELE_PING_REQ, ELE_PING_REQ_SZ, true);
+	ret = imx_se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+				      ELE_PING_REQ, ELE_PING_REQ_SZ, true);
 	if (ret) {
-		dev_err(priv->dev, "Error: se_fill_cmd_msg_hdr failed.");
+		dev_err(priv->dev, "Error: imx_se_fill_cmd_msg_hdr failed.");
 		return ret;
 	}
 
@@ -144,8 +145,8 @@ int ele_ping(struct se_if_priv *priv)
 	if (ret < 0)
 		return ret;
 
-	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_PING_REQ,
-				      ELE_PING_RSP_SZ, true);
+	ret = imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_PING_REQ,
+					  ELE_PING_RSP_SZ, true);
 
 	return ret;
 }
@@ -169,9 +170,9 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (!rx_msg)
 		return -ENOMEM;
 
-	ret = se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
-				  ELE_SERVICE_SWAP_REQ,
-				  ELE_SERVICE_SWAP_REQ_MSG_SZ, true);
+	ret = imx_se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+				      ELE_SERVICE_SWAP_REQ,
+				      ELE_SERVICE_SWAP_REQ_MSG_SZ, true);
 	if (ret)
 		return ret;
 
@@ -189,8 +190,8 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (ret < 0)
 		return ret;
 
-	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_SERVICE_SWAP_REQ,
-				      ELE_SERVICE_SWAP_RSP_MSG_SZ, true);
+	ret = imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_SERVICE_SWAP_REQ,
+					  ELE_SERVICE_SWAP_RSP_MSG_SZ, true);
 	if (ret)
 		return ret;
 
@@ -225,8 +226,8 @@ int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t contnr_addr,
 	if (!rx_msg)
 		return -ENOMEM;
 
-	ret = se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
-				  ELE_FW_AUTH_REQ, ELE_FW_AUTH_REQ_SZ, true);
+	ret = imx_se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+				      ELE_FW_AUTH_REQ, ELE_FW_AUTH_REQ_SZ, true);
 	if (ret)
 		return ret;
 
@@ -239,8 +240,8 @@ int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t contnr_addr,
 	if (ret < 0)
 		return ret;
 
-	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_FW_AUTH_REQ,
-				      ELE_FW_AUTH_RSP_MSG_SZ, true);
+	ret = imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_FW_AUTH_REQ,
+					  ELE_FW_AUTH_RSP_MSG_SZ, true);
 
 	return ret;
 }
@@ -265,8 +266,8 @@ int ele_debug_dump(struct se_if_priv *priv)
 	if (!rx_msg)
 		return -ENOMEM;
 
-	ret = se_fill_cmd_msg_hdr(priv, &tx_msg->header, ELE_DEBUG_DUMP_REQ,
-				  ELE_DEBUG_DUMP_REQ_SZ, true);
+	ret = imx_se_fill_cmd_msg_hdr(priv, &tx_msg->header, ELE_DEBUG_DUMP_REQ,
+				      ELE_DEBUG_DUMP_REQ_SZ, true);
 	if (ret)
 		return ret;
 
@@ -279,8 +280,8 @@ int ele_debug_dump(struct se_if_priv *priv)
 		if (ret < 0)
 			return ret;
 
-		ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_DEBUG_DUMP_REQ,
-					      ELE_DEBUG_DUMP_RSP_SZ, true);
+		ret = imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_DEBUG_DUMP_REQ,
+						  ELE_DEBUG_DUMP_RSP_SZ, true);
 		if (ret) {
 			dev_err(priv->dev, "Dump_Debug_Buffer Error: %x.", ret);
 			break;
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index 76bd3841acfc..81f3057aa7bf 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -3,9 +3,24 @@
  * Copyright 2025 NXP
  */
 
+#include <linux/export.h>
+
 #include "ele_base_msg.h"
 #include "ele_common.h"
 
+/* Fill a command message header with a given command ID and length in bytes. */
+int imx_se_fill_cmd_msg_hdr(struct se_if_priv *priv, struct se_msg_hdr *hdr,
+			u8 cmd, u32 len, bool is_base_api)
+{
+	hdr->tag = priv->if_defs->cmd_tag;
+	hdr->ver = (is_base_api) ? priv->if_defs->base_api_ver : priv->if_defs->fw_api_ver;
+	hdr->command = cmd;
+	hdr->size = len >> 2;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(imx_se_fill_cmd_msg_hdr);
+
 int se_chk_tx_msg_hdr(struct se_if_priv *priv, struct se_msg_hdr *header)
 {
 	if (!header->size || header->size > MAX_WORD_SIZE)
@@ -155,6 +170,21 @@ int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
 	return err;
 }
 
+/*
+ * Send/receive blocking call for external drivers, operating on the SE
+ * interface private data (the misc device context is resolved internally).
+ */
+int imx_se_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
+			void *rx_msg, int exp_rx_msg_sz)
+{
+	if (!priv)
+		return -EINVAL;
+
+	return ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, tx_msg_sz,
+				rx_msg, exp_rx_msg_sz);
+}
+EXPORT_SYMBOL_GPL(imx_se_msg_send_rcv);
+
 static bool check_hdr_exception_for_sz(struct se_if_priv *priv,
 				       struct se_msg_hdr *header)
 {
@@ -239,8 +269,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	complete(&se_clbk_hdl->done);
 }
 
-int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
-			    u8 msg_id, u8 sz, bool is_base_api)
+int imx_se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
+				u8 msg_id, u8 sz, bool is_base_api)
 {
 	struct se_msg_hdr *header = &msg->header;
 	u32 status;
@@ -285,6 +315,7 @@ int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(imx_se_val_rsp_hdr_n_status);
 
 int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
 {
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index bdc13d1b715d..792b0c6d9dae 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -28,21 +28,6 @@ int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
 
 void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg);
 
-int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
-			    u8 msg_id, u8 sz, bool is_base_api);
-
-/* Fill a command message header with a given command ID and length in bytes. */
-static inline int se_fill_cmd_msg_hdr(struct se_if_priv *priv, struct se_msg_hdr *hdr,
-				      u8 cmd, u32 len, bool is_base_api)
-{
-	hdr->tag = priv->if_defs->cmd_tag;
-	hdr->ver = (is_base_api) ? priv->if_defs->base_api_ver : priv->if_defs->fw_api_ver;
-	hdr->command = cmd;
-	hdr->size = len >> 2;
-
-	return 0;
-}
-
 int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
 
 int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index 7f9b0d199cfc..70a1ba369a06 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -7,6 +7,7 @@
 #define SE_MU_H
 
 #include <linux/bitfield.h>
+#include <linux/firmware/imx/se_api.h>
 #include <linux/miscdevice.h>
 #include <linux/semaphore.h>
 #include <linux/mailbox_client.h>
@@ -73,21 +74,8 @@ struct se_if_device_ctx {
 	struct list_head link;
 };
 
-/* Header of the messages exchange with the EdgeLock Enclave */
-struct se_msg_hdr {
-	u8 ver;
-	u8 size;
-	u8 command;
-	u8 tag;
-}  __packed;
-
 #define SE_MU_HDR_SZ	4
 
-struct se_api_msg {
-	struct se_msg_hdr header;
-	u32 data[];
-};
-
 struct se_if_defines {
 	const u8 se_if_type;
 	u8 cmd_tag;
diff --git a/include/linux/firmware/imx/se_api.h b/include/linux/firmware/imx/se_api.h
index b1c4c9115d7b..90104ecaaede 100644
--- a/include/linux/firmware/imx/se_api.h
+++ b/include/linux/firmware/imx/se_api.h
@@ -11,4 +11,82 @@
 #define SOC_ID_OF_IMX8ULP		0x084d
 #define SOC_ID_OF_IMX93			0x9300
 
+/**
+ * struct se_msg_hdr - Header of the messages exchanged with the secure enclave.
+ * @ver: API version the message conforms to (base or firmware API version).
+ * @size: Message size in 32-bit words, including the header.
+ * @command: Command identifier.
+ * @tag: Message tag identifying it as a command or a response.
+ */
+struct se_msg_hdr {
+	u8 ver;
+	u8 size;
+	u8 command;
+	u8 tag;
+}  __packed;
+
+/**
+ * struct se_api_msg - A message exchanged with the secure enclave.
+ * @header: Message header describing the command and its length.
+ * @data: Command or response payload, sized per @header.size.
+ */
+struct se_api_msg {
+	struct se_msg_hdr header;
+	u32 data[];
+};
+
+/* Opaque handle to a secure-enclave interface instance. */
+struct se_if_priv;
+
+/**
+ * imx_se_fill_cmd_msg_hdr() - Populate the header of a command message.
+ * @priv: Secure-enclave interface instance the command targets.
+ * @hdr: Message header to be filled in.
+ * @cmd: Command identifier to place in the header.
+ * @len: Total message length in bytes, including the header.
+ * @is_base_api: %true to tag the message with the base API version, %false to
+ *               use the firmware API version.
+ *
+ * Fill in the tag, version, command and size fields of @hdr so that the message
+ * can be sent to the secure enclave.
+ *
+ * Return: 0 on success.
+ */
+int imx_se_fill_cmd_msg_hdr(struct se_if_priv *priv, struct se_msg_hdr *hdr,
+			    u8 cmd, u32 len, bool is_base_api);
+
+/**
+ * imx_se_msg_send_rcv() - Send a command to the secure enclave and wait for the
+ *                         response.
+ * @priv: Secure-enclave interface instance to communicate with.
+ * @tx_msg: Buffer holding the command message to send.
+ * @tx_msg_sz: Size of the command message in bytes.
+ * @rx_msg: Buffer receiving the response message.
+ * @exp_rx_msg_sz: Expected size of the response message in bytes.
+ *
+ * Blocking send/receive helper for external drivers. The transaction is
+ * serialized internally and the misc device context is resolved from @priv.
+ *
+ * Return: number of bytes received on success, or a negative error code.
+ */
+int imx_se_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
+			void *rx_msg, int exp_rx_msg_sz);
+
+/**
+ * imx_se_val_rsp_hdr_n_status() - Validate a response header and status code.
+ * @priv: Secure-enclave interface instance the response came from.
+ * @msg: Response message to validate.
+ * @msg_id: Command identifier the response is expected to match.
+ * @sz: Expected response size in bytes.
+ * @is_base_api: %true if the command used the base API version, %false if it
+ *               used the firmware API version.
+ *
+ * Check that the response tag, command identifier, size and API version match
+ * the expectations, and that the enclave reported a successful status.
+ *
+ * Return: 0 if the response is valid and successful, or a negative error code.
+ */
+int imx_se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
+				u8 msg_id, u8 sz, bool is_base_api);
+
 #endif /* __SE_API_H__ */

-- 
2.55.0


