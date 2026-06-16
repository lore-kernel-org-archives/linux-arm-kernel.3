Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E918CD98E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 11:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJvVCa2VK6max9BLRy/0sx5xSe5Pd3SI/T1a8CDu858=; b=NQs/wH8XlotOkTz1SulZf/QGsE
	hKlgMAy7I+kg0cSCT/9JJb/XgaW2hDSmez1ISZ87yDD9TTKf7xQd5kefu/4jis9bxGHzEPvloCX6s
	KgZ8aeZn8FDr4/5nOqhMTt+o+JY6k7GW9tz7AJd9x35LT1/2wTGJAkSUZeHa6PFNvs3BTiEjUgvy7
	se2y1Y1QxMo28JGhCYa/H3dItEPkCkVwYBe4bP5mf4MYkZubPkwdEOJaAAnj47H8tfe0F2OKTwCK7
	t6iCwM8lzuLd94MmCnkwFg9379GcA4q10wWlbgzm91Rz3InIC8SJWRoSXYbm3FCkDaG+49TMck7sc
	EgCo+evw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSMr-0000000Fhf0-07iA;
	Tue, 16 Jun 2026 11:54:09 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSMi-0000000FhaI-3o52
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 11:54:05 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1781610839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yJvVCa2VK6max9BLRy/0sx5xSe5Pd3SI/T1a8CDu858=;
	b=Tvkr0TKiO2xmbMFiEtr69yBGEC9WBXd1fvFyyZdAfPYL8zEy1yMIlyqRPVUCgrOO13AZYW
	hcfoXtJNEQX+61MO99LKAPHIxY2vCUhzzjoAT2Fe0ywTvuA3A6VhL+A7vcJDknFWtnUByK
	0HqiuBRs9ca+D7TP9rmbNlHXV6KBSFuChPFd//wbieysLiKkmK6txQ25ywkGe4RiJNGJb/
	U7IY/sdl2sKRVEWoI9iZN6Um2dbXdnv3k7TsKt00erALSnwsedu+ymQIqCHTM/amuS94WD
	/bT6oIjW2PnL5wjzKo4//JSDjNZMXysB1wE2MRGUdhCiDGdJmvQFWfLFszsxDQ==
Date: Tue, 16 Jun 2026 13:52:18 +0200
Subject: [PATCH 3/9] firmware: imx: ele: Add API functions for OCOTP fuse
 access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-3-cb7f3698c3e6@kontron.de>
References: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
In-Reply-To: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=5550;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=frlyGCyzAHGQ2RuRX5vM190vkXZcLZQJX3zxRaHnPe0=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIcvQMvTmRAcfXksue4dTj2w3Wu34Zt7SZB7btpe7UaDMe
 /Zc72UdpSwMYlwMsmKKLFL8Fq9tzWJ95I9VR8HMYWUCGcLAxSkAE7m5keGv3F3nZCfO7Hlvfp2Q
 fmGr8pX76dnZtxvfBd1rvFdu3NuXw/DfPfMx86w9Wm8M/RcsOce/2qxK+uvsq3E+TZcbTOYpu+r
 zAwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_045401_630013_8526DC8E 
X-CRM114-Status: GOOD (  15.41  )
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

The ELE S400 API provides read and write access to the OCOTP fuse
registers. This adds the necessary API functions imx_se_read_fuse()
and imx_se_write_fuse() to be used by other drivers such as the
OCOTP S400 NVMEM driver.

This is ported from the downstream vendor kernel.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/firmware/imx/ele_base_msg.c | 122 ++++++++++++++++++++++++++++++++++++
 drivers/firmware/imx/ele_base_msg.h |   6 ++
 include/linux/firmware/imx/se_api.h |   3 +
 3 files changed, 131 insertions(+)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index ec718d322abc..281d223aa144 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -8,6 +8,7 @@
 #include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/dma-mapping.h>
+#include <linux/firmware/imx/se_api.h>
 #include <linux/genalloc.h>
 
 #include "ele_base_msg.h"
@@ -303,3 +304,124 @@ int ele_debug_dump(struct se_if_priv *priv)
 
 	return ret;
 }
+
+static int ele_read_fuse(struct se_if_priv *priv, uint16_t fuse_id, u32 *value)
+{
+	struct se_api_msg *tx_msg __free(kfree) = NULL;
+	struct se_api_msg *rx_msg __free(kfree) = NULL;
+	int rx_msg_sz = ELE_READ_FUSE_RSP_MSG_SZ;
+	int ret = 0;
+
+	if (!priv)
+		return -EINVAL;
+
+	tx_msg = kzalloc(ELE_READ_FUSE_REQ_MSG_SZ, GFP_KERNEL);
+	if (!tx_msg)
+		return -ENOMEM;
+
+	rx_msg = kzalloc(rx_msg_sz, GFP_KERNEL);
+	if (!rx_msg)
+		return -ENOMEM;
+
+	ret = se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+				  ELE_READ_FUSE_REQ, ELE_READ_FUSE_REQ_MSG_SZ,
+				  true);
+	if (ret)
+		return ret;
+
+	tx_msg->data[0] = fuse_id;
+
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg,
+			       ELE_READ_FUSE_REQ_MSG_SZ, rx_msg, rx_msg_sz);
+	if (ret < 0)
+		return ret;
+
+	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_READ_FUSE_REQ,
+				      rx_msg_sz, true);
+	if (ret)
+		return ret;
+
+	*value = rx_msg->data[1];
+
+	return 0;
+}
+
+/**
+ * imx_se_read_fuse() - API to request SE-FW to read the fuse value.
+ * @se_if_data: refs to data attached to the se interface.
+ * @fuse_id: fuse identifier to read.
+ * @value: unsigned integer array to store the fuse values.
+ *
+ * Secure enclave like EdgeLock Enclave, manages the fuses. This API
+ * requests the FW to read the fuses. FW responds with the read values.
+ *
+ * Context:
+ *
+ * Return value:
+ *   0,   means success.
+ *   < 0, means failure.
+ */
+int imx_se_read_fuse(void *se_if_data, uint16_t fuse_id, u32 *value)
+{
+	return ele_read_fuse((struct se_if_priv *)se_if_data, fuse_id, value);
+}
+EXPORT_SYMBOL_GPL(imx_se_read_fuse);
+
+static int ele_write_fuse(struct se_if_priv *priv, uint16_t fuse_id, u32 value)
+{
+	struct se_api_msg *tx_msg __free(kfree) = NULL;
+	struct se_api_msg *rx_msg __free(kfree) = NULL;
+	int ret = 0;
+
+	if (!priv)
+		return -EINVAL;
+
+	tx_msg = kzalloc(ELE_WRITE_FUSE_REQ_MSG_SZ, GFP_KERNEL);
+	if (!tx_msg)
+		return -ENOMEM;
+
+	rx_msg = kzalloc(ELE_WRITE_FUSE_RSP_MSG_SZ, GFP_KERNEL);
+	if (!rx_msg)
+		return -ENOMEM;
+
+	ret = se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+				  ELE_WRITE_FUSE, ELE_WRITE_FUSE_REQ_MSG_SZ,
+				  true);
+	if (ret)
+		return ret;
+
+	tx_msg->data[0] = (32 << 16) | (fuse_id << 5);
+	tx_msg->data[1] = value;
+
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg,
+			       ELE_WRITE_FUSE_REQ_MSG_SZ, rx_msg,
+			       ELE_WRITE_FUSE_RSP_MSG_SZ);
+	if (ret < 0)
+		return ret;
+
+	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_WRITE_FUSE,
+				      ELE_WRITE_FUSE_RSP_MSG_SZ, true);
+
+	return ret;
+}
+
+/**
+ * imx_se_write_fuse() - API to request SE-FW to write to fuses.
+ * @se_if_data: refs to data attached to the se interface.
+ * @fuse_id: fuse identifier to write to.
+ * @value: unsigned integer value that to be written to the fuse.
+ *
+ * Secure enclave like EdgeLock Enclave, manages the fuses. This API
+ * requests the FW to write the fuse with the given value.
+ *
+ * Context:
+ *
+ * Return value:
+ *   0,   means success.
+ *   < 0, means failure.
+ */
+int imx_se_write_fuse(void *se_if_data, uint16_t fuse_id, u32 value)
+{
+	return ele_write_fuse((struct se_if_priv *)se_if_data, fuse_id, value);
+}
+EXPORT_SYMBOL_GPL(imx_se_write_fuse);
diff --git a/drivers/firmware/imx/ele_base_msg.h b/drivers/firmware/imx/ele_base_msg.h
index 1c5d6791b323..2af3ada2ad07 100644
--- a/drivers/firmware/imx/ele_base_msg.h
+++ b/drivers/firmware/imx/ele_base_msg.h
@@ -36,6 +36,12 @@
 #define ELE_GET_INFO_REQ_MSG_SZ		0x10
 #define ELE_GET_INFO_RSP_MSG_SZ		0x08
 
+#define ELE_READ_FUSE_REQ_MSG_SZ	(8)
+#define ELE_READ_FUSE_RSP_MSG_SZ	(12)
+
+#define ELE_WRITE_FUSE_REQ_MSG_SZ	(12)
+#define ELE_WRITE_FUSE_RSP_MSG_SZ	(12)
+
 #define MAX_UID_SIZE			(16)
 #define DEV_GETINFO_ROM_PATCH_SHA_SZ	(32)
 #define DEV_GETINFO_FW_SHA_SZ		(32)
diff --git a/include/linux/firmware/imx/se_api.h b/include/linux/firmware/imx/se_api.h
index b1c4c9115d7b..ed766b1d48f8 100644
--- a/include/linux/firmware/imx/se_api.h
+++ b/include/linux/firmware/imx/se_api.h
@@ -11,4 +11,7 @@
 #define SOC_ID_OF_IMX8ULP		0x084d
 #define SOC_ID_OF_IMX93			0x9300
 
+int imx_se_read_fuse(void *se_if_data, uint16_t fuse_id, u32 *value);
+int imx_se_write_fuse(void *se_if_data, uint16_t fuse_id, u32 value);
+
 #endif /* __SE_API_H__ */

-- 
2.54.0


