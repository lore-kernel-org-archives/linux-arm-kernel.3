Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0544C5321C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 13:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3ty1n3pB66/J0W8hWvA8Cri+8z31CFZgFbeFSf27es=; b=KINEIdteTWxDJb8qAXs2ux6oxU
	Eu1/mnwDuHKEJTXGLL9ccXFeUb7/G7Ri1f/tMqHAFPsSaiCEaPnkrN+879+gxBrSGe+ptKrRMXBrA
	F7PwJ/csVF7eKjM5+4wS89sJOcFHtFT/9OlXnkijFfOAUapTbUfzC+2q9DZGr78Dx5VNZcPZ9tN3L
	o4dw1suJgb8TlCvivt8P8GIpDVbQRN7sWMSgDYR24JkLnHI2RcbLU9La+NSvl9Vdyu36fMja1Y68a
	bs4mDP2uec3zDSboF2fQ2+rdI+4/xg6PsRLhxPAfL0GK32fPztbgxYKJk9vnj1MDFGUBo9QuhjYng
	EX3QTnog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKxs-00000002m00-2Zci;
	Mon, 27 Jul 2026 13:01:52 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKxi-00000002ltz-0vTx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 13:01:45 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1785157298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T3ty1n3pB66/J0W8hWvA8Cri+8z31CFZgFbeFSf27es=;
	b=AoIU4udcVtrvloL0RAUojzM9mVJGcwtKEARhov52yCu9wo2oPByV91TNb1H9IoH+AlA7AR
	FvxxxwhJVneFRZeqXbGWjHJgHVFUcmACeTaqTz3tv6qcCmOOBYjcDjd+3qWsEQ3Noc/iWW
	q5d4rnTw1LyrAmP87yL+tFkMfXXcQMkGjha9Oo1D40sZXuM05zy9a/C8MrzkkDSSVdHYUq
	EYvaub9OmiV3phMbFx/1xhb9pjokL2H8biyPTALyQS8/qWgHlWF3UUuwPALlTKJ+Bujz3m
	unl3wJmTkpU3V3x9D8WulWsEt3X3Xf3knJyiv7XLIXVk1xWjLUDecqvtUrtRtw==
Date: Mon, 27 Jul 2026 15:00:46 +0200
Subject: [PATCH v4 03/11] firmware: imx: ele: Export API functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-3-1a515de33093@kontron.de>
References: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de>
In-Reply-To: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de>
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
 linux@ew.tq-group.com, Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=13673;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=9kYctPws8ziiBjjJl/zAI3aZm7jEa0WQaazitIF1VVw=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISs9bNWKp6t3ZYhs6rSIibtdWrnhXGvW8juP9ywVzavZE
 Sl4Qn9uRykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwESYaxj+Z3v6aIUXPhddVrbt
 b737Uv+dDDZ2s0PPHdwgpty72vfbToZ/tsVbFy15UlX5hL/eUrUn0ts248Ry4/muKtoXvnr1ZfS
 yAQA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_060142_878415_91C38841 
X-CRM114-Status: GOOD (  22.53  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/firmware/imx/ele_base_msg.c | 42 ++++++++++----------
 drivers/firmware/imx/ele_common.c   | 35 ++++++++++++++++-
 drivers/firmware/imx/ele_common.h   | 14 -------
 drivers/firmware/imx/se_ctrl.c      |  6 +--
 drivers/firmware/imx/se_ctrl.h      | 14 +------
 include/linux/firmware/imx/se_api.h | 78 +++++++++++++++++++++++++++++++++++++
 6 files changed, 137 insertions(+), 52 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index 28b835f2880f..a4ab45efdd63 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -8,6 +8,7 @@
 #include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/dma-mapping.h>
+#include <linux/firmware/imx/se_api.h>
 #include <linux/genalloc.h>
 
 #include "ele_base_msg.h"
@@ -106,8 +107,8 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 		}
 	}
 
-	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
-			    ELE_GET_INFO_REQ, ELE_GET_INFO_REQ_MSG_SZ, true);
+	imx_se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+				ELE_GET_INFO_REQ, ELE_GET_INFO_REQ_MSG_SZ, true);
 
 	tx_msg->data[0] = upper_32_bits(get_info_addr);
 	tx_msg->data[1] = lower_32_bits(get_info_addr);
@@ -120,8 +121,8 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 		return ret;
 	}
 
-	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_GET_INFO_REQ,
-				      ELE_GET_INFO_RSP_MSG_SZ, true);
+	ret = imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_GET_INFO_REQ,
+					  ELE_GET_INFO_RSP_MSG_SZ, true);
 	if (ret < 0) {
 		ele_get_info_cleanup(priv, get_info_data, get_info_addr, get_info_len);
 		return ret;
@@ -156,16 +157,16 @@ int ele_ping(struct se_if_priv *priv)
 	if (!rx_msg)
 		return -ENOMEM;
 
-	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
-			    ELE_PING_REQ, ELE_PING_REQ_SZ, true);
+	imx_se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+				ELE_PING_REQ, ELE_PING_REQ_SZ, true);
 
 	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_PING_REQ_SZ,
 			       rx_msg, ELE_PING_RSP_SZ);
 	if (ret < 0)
 		return ret;
 
-	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_PING_REQ,
-				      ELE_PING_RSP_SZ, true);
+	ret = imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_PING_REQ,
+					  ELE_PING_RSP_SZ, true);
 
 	return ret;
 }
@@ -196,8 +197,9 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (!rx_msg)
 		return -ENOMEM;
 
-	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
-			    ELE_SERVICE_SWAP_REQ, ELE_SERVICE_SWAP_REQ_MSG_SZ, true);
+	imx_se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+				ELE_SERVICE_SWAP_REQ, ELE_SERVICE_SWAP_REQ_MSG_SZ,
+				true);
 
 	tx_msg->data[0] = flag;
 	tx_msg->data[1] = addr_size;
@@ -212,8 +214,8 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (ret < 0)
 		return ret;
 
-	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_SERVICE_SWAP_REQ,
-				      ELE_SERVICE_SWAP_RSP_MSG_SZ, true);
+	ret = imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_SERVICE_SWAP_REQ,
+					  ELE_SERVICE_SWAP_RSP_MSG_SZ, true);
 	if (ret)
 		return ret;
 
@@ -248,8 +250,8 @@ int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
 	if (!rx_msg)
 		return -ENOMEM;
 
-	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
-			    ELE_FW_AUTH_REQ, ELE_FW_AUTH_REQ_SZ, true);
+	imx_se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+				ELE_FW_AUTH_REQ, ELE_FW_AUTH_REQ_SZ, true);
 
 	tx_msg->data[0] = lower_32_bits(contnr_addr);
 	tx_msg->data[1] = 0;
@@ -260,8 +262,8 @@ int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
 	if (ret < 0)
 		return ret;
 
-	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_FW_AUTH_REQ,
-				      ELE_FW_AUTH_RSP_MSG_SZ, true);
+	ret = imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_FW_AUTH_REQ,
+					  ELE_FW_AUTH_RSP_MSG_SZ, true);
 
 	return ret;
 }
@@ -286,8 +288,8 @@ int ele_debug_dump(struct se_if_priv *priv)
 	if (!rx_msg)
 		return -ENOMEM;
 
-	se_fill_cmd_msg_hdr(priv, &tx_msg->header, ELE_DEBUG_DUMP_REQ,
-			    ELE_DEBUG_DUMP_REQ_SZ, true);
+	imx_se_fill_cmd_msg_hdr(priv, &tx_msg->header, ELE_DEBUG_DUMP_REQ,
+				ELE_DEBUG_DUMP_REQ_SZ, true);
 
 	msg_ex_cnt = 0;
 	do {
@@ -298,8 +300,8 @@ int ele_debug_dump(struct se_if_priv *priv)
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
index fbb6e584341a..f9c56fd42af0 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -3,11 +3,26 @@
  * Copyright 2025 NXP
  */
 
+#include <linux/export.h>
+
 #include "ele_base_msg.h"
 #include "ele_common.h"
 #include "ele_fw_api.h"
 #include "se_ctrl.h"
 
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
 int se_chk_tx_msg_hdr(struct se_if_device_ctx *dev_ctx, struct se_msg_hdr *header)
 {
 	struct se_if_priv *priv = dev_ctx->priv;
@@ -261,6 +276,21 @@ int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
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
@@ -402,8 +432,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	}
 }
 
-int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
-			    u8 msg_id, u8 sz, bool is_base_api)
+int imx_se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
+				u8 msg_id, u8 sz, bool is_base_api)
 {
 	struct se_msg_hdr *header = &msg->header;
 	u32 status;
@@ -450,6 +480,7 @@ int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(imx_se_val_rsp_hdr_n_status);
 
 int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
 {
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index b63a3fbf087a..8f0739960d4d 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -28,20 +28,6 @@ int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
 		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz);
 
 void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg);
-
-int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
-			    u8 msg_id, u8 sz, bool is_base_api);
-
-/* Fill a command message header with a given command ID and length in bytes. */
-static inline void se_fill_cmd_msg_hdr(struct se_if_priv *priv, struct se_msg_hdr *hdr,
-				       u8 cmd, u32 len, bool is_base_api)
-{
-	hdr->tag = priv->if_defs->cmd_tag;
-	hdr->ver = (is_base_api) ? priv->if_defs->base_api_ver : priv->if_defs->fw_api_ver;
-	hdr->command = cmd;
-	hdr->size = len >> 2;
-}
-
 int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
 
 int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 3c14964830a6..53f252d2f111 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -911,9 +911,9 @@ static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
 		"message received, start transmit to user");
 
 	rsp_status_err =
-		se_val_rsp_hdr_n_status(priv, rx_msg, tx_msg->header.command,
-					cmd_snd_rcv_rsp_info.rx_buf_sz,
-					tx_msg->header.ver == priv->if_defs->base_api_ver);
+		imx_se_val_rsp_hdr_n_status(priv, rx_msg, tx_msg->header.command,
+					    cmd_snd_rcv_rsp_info.rx_buf_sz,
+					    tx_msg->header.ver == priv->if_defs->base_api_ver);
 
 	if (!rsp_status_err) {
 		err = se_dev_ctx_cpy_out_data(dev_ctx);
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index af7738ad76cd..76082e8b977c 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -7,6 +7,7 @@
 #define SE_CTRL_H
 
 #include <linux/bitfield.h>
+#include <linux/firmware/imx/se_api.h>
 #include <linux/miscdevice.h>
 #include <linux/mailbox_client.h>
 #include <linux/semaphore.h>
@@ -95,22 +96,9 @@ struct se_if_device_ctx {
 	struct kref refcount;
 };
 
-/* Header of the messages exchange with the EdgeLock Enclave */
-struct se_msg_hdr {
-	u8 ver;
-	u8 size;
-	u8 command;
-	u8 tag;
-}  __packed;
-
 #define SE_MU_HDR_SZ		4
 #define SE_MU_HDR_WORD_SZ	1
 
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


