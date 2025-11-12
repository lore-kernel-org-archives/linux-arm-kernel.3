Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6C9CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 01:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qO5gjJMOC2KoZtAZHzit9KBiOeQ/Raj5W6HVLeYvZI4=; b=LUQgWbGQZ9DtXRO/4+8NQkiL/H
	/hvR0w3NUukEoyd6usiwX6vqZdK4pJDWNQd11w58dYoiF5kmE6EA5dpNHB2rsYMMaBKVi5+/6E/2M
	2GPTSNKovDZSKsKNJxLgltFGiHdPyXw8wcV4UWedFytLlGkAa69oM7zdB6LhTY0yjC8x66mkBcTNO
	Y10C7M0e0LRMWYVtkVqiaud2gFFkaq7fsEKKHgxZsQSDjxwfbTcMMpvqzV5xCKhH53DzKffM67CBG
	oKSDD7IeAIi81zIvlK57hqtN+qjF6jx2oCfs6uVNU97+DdviWMQO1odw9O3iLyb71d8kaC+a3xvdZ
	WWKnCEqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ09I-00000007zeR-3d40;
	Wed, 12 Nov 2025 01:59:52 +0000
Received: from mail-m15586.qiye.163.com ([101.71.155.86])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ09D-00000007zYH-3reJ;
	Wed, 12 Nov 2025 01:59:49 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2941ca619;
	Wed, 12 Nov 2025 09:59:44 +0800 (GMT+08:00)
From: Elaine Zhang <zhangqing@rock-chips.com>
To: zhangqing@rock-chips.com,
	mkl@pengutronix.de,
	kernel@pengutronix.de,
	mailhol.vincent@wanadoo.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	cl@rock-chips.com
Cc: linux-can@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [RESEND PATCH v8 2/4] net: can: rockchip: Refactor the rkcanfd_devtype_data structure
Date: Wed, 12 Nov 2025 09:59:38 +0800
Message-Id: <20251112015940.3695638-3-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112015940.3695638-1-zhangqing@rock-chips.com>
References: <20251112015940.3695638-1-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a75ca500103a3kunm5e00f3261f074f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUxMHVZNH0wZSxoZTE9DH01WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=U9/UksghAuJ0XQYuZAhSM9yeLNbFeL7k2z8KS+lpfCLWkwpBZ0U1YNisYg3x66vsvrKHpl6o6W80nQ2mbIdBbhFxtcYoFYne+A73/9BBpIQW3O5wOGO2wNSqiXkHd4xMj2WNNZ0YJuOvd4RsdVqIdJheCaKrCK8kAOWGY32RZrs=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=qO5gjJMOC2KoZtAZHzit9KBiOeQ/Raj5W6HVLeYvZI4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_175948_174571_1169D2AB 
X-CRM114-Status: GOOD (  13.91  )
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

Add new function pointer:
Encapsulate some hardware operation functions into
rkcanfd_devtype_data to provide differentiated implementations for
different models (such as RK3568v2/v3).

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 .../net/can/rockchip/rockchip_canfd-core.c    | 100 ++++++++++--------
 drivers/net/can/rockchip/rockchip_canfd.h     |  10 ++
 2 files changed, 68 insertions(+), 42 deletions(-)

diff --git a/drivers/net/can/rockchip/rockchip_canfd-core.c b/drivers/net/can/rockchip/rockchip_canfd-core.c
index 046f0a0ae4d4..761cb36148ff 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-core.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-core.c
@@ -24,32 +24,6 @@
 
 #include "rockchip_canfd.h"
 
-static const struct rkcanfd_devtype_data rkcanfd_devtype_data_rk3568v2 = {
-	.model = RKCANFD_MODEL_RK3568V2,
-	.quirks = RKCANFD_QUIRK_RK3568_ERRATUM_1 | RKCANFD_QUIRK_RK3568_ERRATUM_2 |
-		RKCANFD_QUIRK_RK3568_ERRATUM_3 | RKCANFD_QUIRK_RK3568_ERRATUM_4 |
-		RKCANFD_QUIRK_RK3568_ERRATUM_5 | RKCANFD_QUIRK_RK3568_ERRATUM_6 |
-		RKCANFD_QUIRK_RK3568_ERRATUM_7 | RKCANFD_QUIRK_RK3568_ERRATUM_8 |
-		RKCANFD_QUIRK_RK3568_ERRATUM_9 | RKCANFD_QUIRK_RK3568_ERRATUM_10 |
-		RKCANFD_QUIRK_RK3568_ERRATUM_11 | RKCANFD_QUIRK_RK3568_ERRATUM_12 |
-		RKCANFD_QUIRK_CANFD_BROKEN,
-};
-
-/* The rk3568 CAN-FD errata sheet as of Tue 07 Nov 2023 11:25:31 +08:00
- * states that only the rk3568v2 is affected by erratum 5, but tests
- * with the rk3568v2 and rk3568v3 show that the RX_FIFO_CNT is
- * sometimes too high. In contrast to the errata sheet mark rk3568v3
- * as effected by erratum 5, too.
- */
-static const struct rkcanfd_devtype_data rkcanfd_devtype_data_rk3568v3 = {
-	.model = RKCANFD_MODEL_RK3568V3,
-	.quirks = RKCANFD_QUIRK_RK3568_ERRATUM_1 | RKCANFD_QUIRK_RK3568_ERRATUM_2 |
-		RKCANFD_QUIRK_RK3568_ERRATUM_5 | RKCANFD_QUIRK_RK3568_ERRATUM_7 |
-		RKCANFD_QUIRK_RK3568_ERRATUM_8 | RKCANFD_QUIRK_RK3568_ERRATUM_10 |
-		RKCANFD_QUIRK_RK3568_ERRATUM_11 | RKCANFD_QUIRK_RK3568_ERRATUM_12 |
-		RKCANFD_QUIRK_CANFD_BROKEN,
-};
-
 static const char *__rkcanfd_get_model_str(enum rkcanfd_model model)
 {
 	switch (model) {
@@ -212,7 +186,7 @@ static int rkcanfd_get_berr_counter(const struct net_device *ndev,
 	if (err)
 		return err;
 
-	rkcanfd_get_berr_counter_corrected(priv, bec);
+	priv->devtype_data.get_berr_counter(priv, bec);
 
 	pm_runtime_put(ndev->dev.parent);
 
@@ -302,7 +276,7 @@ static void rkcanfd_chip_start(struct rkcanfd_priv *priv)
 
 	rkcanfd_set_bittiming(priv);
 
-	rkcanfd_chip_interrupts_disable(priv);
+	priv->devtype_data.interrupts_disable(priv);
 	rkcanfd_chip_set_work_mode(priv);
 
 	priv->can.state = CAN_STATE_ERROR_ACTIVE;
@@ -316,7 +290,7 @@ static void __rkcanfd_chip_stop(struct rkcanfd_priv *priv, const enum can_state
 	priv->can.state = state;
 
 	rkcanfd_chip_set_reset_mode(priv);
-	rkcanfd_chip_interrupts_disable(priv);
+	priv->devtype_data.interrupts_disable(priv);
 }
 
 static void rkcanfd_chip_stop(struct rkcanfd_priv *priv, const enum can_state state)
@@ -342,8 +316,8 @@ static int rkcanfd_set_mode(struct net_device *ndev,
 
 	switch (mode) {
 	case CAN_MODE_START:
-		rkcanfd_chip_start(priv);
-		rkcanfd_chip_interrupts_enable(priv);
+		priv->devtype_data.chip_start(priv);
+		priv->devtype_data.interrupts_enable(priv);
 		netif_wake_queue(ndev);
 		break;
 
@@ -537,7 +511,7 @@ static int rkcanfd_handle_error_int(struct rkcanfd_priv *priv)
 		if (cf) {
 			struct can_berr_counter bec;
 
-			rkcanfd_get_berr_counter_corrected(priv, &bec);
+			priv->devtype_data.get_berr_counter(priv, &bec);
 			cf->can_id |= CAN_ERR_PROT | CAN_ERR_BUSERROR | CAN_ERR_CNT;
 			cf->data[6] = bec.txerr;
 			cf->data[7] = bec.rxerr;
@@ -567,7 +541,7 @@ static int rkcanfd_handle_state_error_int(struct rkcanfd_priv *priv)
 	u32 timestamp;
 	int err;
 
-	rkcanfd_get_berr_counter_corrected(priv, &bec);
+	priv->devtype_data.get_berr_counter(priv, &bec);
 	can_state_get_by_berr_counter(ndev, &bec, &tx_state, &rx_state);
 
 	new_state = max(tx_state, rx_state);
@@ -581,7 +555,7 @@ static int rkcanfd_handle_state_error_int(struct rkcanfd_priv *priv)
 	can_change_state(ndev, cf, tx_state, rx_state);
 
 	if (new_state == CAN_STATE_BUS_OFF) {
-		rkcanfd_chip_stop(priv, CAN_STATE_BUS_OFF);
+		priv->devtype_data.chip_stop(priv, CAN_STATE_BUS_OFF);
 		can_bus_off(ndev);
 	}
 
@@ -620,7 +594,7 @@ rkcanfd_handle_rx_fifo_overflow_int(struct rkcanfd_priv *priv)
 	if (!skb)
 		return 0;
 
-	rkcanfd_get_berr_counter_corrected(priv, &bec);
+	priv->devtype_data.get_berr_counter(priv, &bec);
 
 	cf->can_id |= CAN_ERR_CRTL | CAN_ERR_CNT;
 	cf->data[1] = CAN_ERR_CRTL_RX_OVERFLOW;
@@ -719,21 +693,21 @@ static int rkcanfd_open(struct net_device *ndev)
 	if (err)
 		goto out_close_candev;
 
-	rkcanfd_chip_start(priv);
+	priv->devtype_data.chip_start(priv);
 	can_rx_offload_enable(&priv->offload);
 
-	err = request_irq(ndev->irq, rkcanfd_irq, IRQF_SHARED, ndev->name, priv);
+	err = request_irq(ndev->irq, priv->devtype_data.irq, IRQF_SHARED, ndev->name, priv);
 	if (err)
 		goto out_rkcanfd_chip_stop;
 
-	rkcanfd_chip_interrupts_enable(priv);
+	priv->devtype_data.interrupts_enable(priv);
 
 	netif_start_queue(ndev);
 
 	return 0;
 
 out_rkcanfd_chip_stop:
-	rkcanfd_chip_stop_sync(priv, CAN_STATE_STOPPED);
+	priv->devtype_data.chip_stop_sync(priv, CAN_STATE_STOPPED);
 	pm_runtime_put(ndev->dev.parent);
 out_close_candev:
 	close_candev(ndev);
@@ -746,10 +720,10 @@ static int rkcanfd_stop(struct net_device *ndev)
 
 	netif_stop_queue(ndev);
 
-	rkcanfd_chip_interrupts_disable(priv);
+	priv->devtype_data.interrupts_disable(priv);
 	free_irq(ndev->irq, priv);
 	can_rx_offload_disable(&priv->offload);
-	rkcanfd_chip_stop_sync(priv, CAN_STATE_STOPPED);
+	priv->devtype_data.chip_stop_sync(priv, CAN_STATE_STOPPED);
 	close_candev(ndev);
 
 	pm_runtime_put(ndev->dev.parent);
@@ -818,7 +792,7 @@ static int rkcanfd_register(struct rkcanfd_priv *priv)
 	if (err)
 		goto out_pm_runtime_put_sync;
 
-	rkcanfd_register_done(priv);
+	priv->devtype_data.register_done(priv);
 
 	pm_runtime_put(ndev->dev.parent);
 
@@ -840,6 +814,48 @@ static inline void rkcanfd_unregister(struct rkcanfd_priv *priv)
 	pm_runtime_disable(ndev->dev.parent);
 }
 
+static const struct rkcanfd_devtype_data rkcanfd_devtype_data_rk3568v2 = {
+	.model = RKCANFD_MODEL_RK3568V2,
+	.quirks = RKCANFD_QUIRK_RK3568_ERRATUM_1 | RKCANFD_QUIRK_RK3568_ERRATUM_2 |
+		RKCANFD_QUIRK_RK3568_ERRATUM_3 | RKCANFD_QUIRK_RK3568_ERRATUM_4 |
+		RKCANFD_QUIRK_RK3568_ERRATUM_5 | RKCANFD_QUIRK_RK3568_ERRATUM_6 |
+		RKCANFD_QUIRK_RK3568_ERRATUM_7 | RKCANFD_QUIRK_RK3568_ERRATUM_8 |
+		RKCANFD_QUIRK_RK3568_ERRATUM_9 | RKCANFD_QUIRK_RK3568_ERRATUM_10 |
+		RKCANFD_QUIRK_RK3568_ERRATUM_11 | RKCANFD_QUIRK_RK3568_ERRATUM_12 |
+		RKCANFD_QUIRK_CANFD_BROKEN,
+	.get_berr_counter = rkcanfd_get_berr_counter_corrected,
+	.interrupts_enable = rkcanfd_chip_interrupts_enable,
+	.interrupts_disable = rkcanfd_chip_interrupts_disable,
+	.chip_start = rkcanfd_chip_start,
+	.chip_stop = rkcanfd_chip_stop,
+	.chip_stop_sync = rkcanfd_chip_stop_sync,
+	.irq = rkcanfd_irq,
+	.register_done = rkcanfd_register_done,
+};
+
+/* The rk3568 CAN-FD errata sheet as of Tue 07 Nov 2023 11:25:31 +08:00
+ * states that only the rk3568v2 is affected by erratum 5, but tests
+ * with the rk3568v2 and rk3568v3 show that the RX_FIFO_CNT is
+ * sometimes too high. In contrast to the errata sheet mark rk3568v3
+ * as effected by erratum 5, too.
+ */
+static const struct rkcanfd_devtype_data rkcanfd_devtype_data_rk3568v3 = {
+	.model = RKCANFD_MODEL_RK3568V3,
+	.quirks = RKCANFD_QUIRK_RK3568_ERRATUM_1 | RKCANFD_QUIRK_RK3568_ERRATUM_2 |
+		RKCANFD_QUIRK_RK3568_ERRATUM_5 | RKCANFD_QUIRK_RK3568_ERRATUM_7 |
+		RKCANFD_QUIRK_RK3568_ERRATUM_8 | RKCANFD_QUIRK_RK3568_ERRATUM_10 |
+		RKCANFD_QUIRK_RK3568_ERRATUM_11 | RKCANFD_QUIRK_RK3568_ERRATUM_12 |
+		RKCANFD_QUIRK_CANFD_BROKEN,
+	.get_berr_counter = rkcanfd_get_berr_counter_corrected,
+	.interrupts_enable = rkcanfd_chip_interrupts_enable,
+	.interrupts_disable = rkcanfd_chip_interrupts_disable,
+	.chip_start = rkcanfd_chip_start,
+	.chip_stop = rkcanfd_chip_stop,
+	.chip_stop_sync = rkcanfd_chip_stop_sync,
+	.irq = rkcanfd_irq,
+	.register_done = rkcanfd_register_done,
+};
+
 static const struct of_device_id rkcanfd_of_match[] = {
 	{
 		.compatible = "rockchip,rk3568v2-canfd",
diff --git a/drivers/net/can/rockchip/rockchip_canfd.h b/drivers/net/can/rockchip/rockchip_canfd.h
index 93131c7d7f54..72f26b96add0 100644
--- a/drivers/net/can/rockchip/rockchip_canfd.h
+++ b/drivers/net/can/rockchip/rockchip_canfd.h
@@ -436,9 +436,19 @@ enum rkcanfd_model {
 	RKCANFD_MODEL_RK3568V3 = 0x35683,
 };
 
+struct rkcanfd_priv;
+
 struct rkcanfd_devtype_data {
 	enum rkcanfd_model model;
 	u32 quirks;
+	void (*get_berr_counter)(struct rkcanfd_priv *priv, struct can_berr_counter *bec);
+	void (*interrupts_enable)(const struct rkcanfd_priv *priv);
+	void (*interrupts_disable)(const struct rkcanfd_priv *priv);
+	void (*chip_start)(struct rkcanfd_priv *priv);
+	void (*chip_stop)(struct rkcanfd_priv *priv, const enum can_state state);
+	void (*chip_stop_sync)(struct rkcanfd_priv *priv, const enum can_state state);
+	irqreturn_t (*irq)(int irq, void *dev_id);
+	void (*register_done)(const struct rkcanfd_priv *priv);
 };
 
 struct rkcanfd_fifo_header {
-- 
2.34.1


