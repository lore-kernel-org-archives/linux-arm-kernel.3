Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8FBCDB470
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 05:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pgE4eNrAuTsV9UffW4YgtbXXC0tYKSkFBFKKzS1paQY=; b=gdq9jhT119mKDXLGJoayXofJNh
	D4CgKpffZmBylt4fUfD6HVyzSPhBZvURDMKH7t+l0NjQVU4ZUoI3pqa8jFxKaie+Wlli0ipunp/8/
	NezRIyRz2x6o6/e3ol/ppXJq7t9xU3feM7NAn31oLDu5SLIM2zYXKLhbjl3IM4YjTwB0/8BPUrgs8
	G7G6L8JwZlGxKv3wSrqvZMBJcR0/nbcpgUrTTWQOjFFWNGokAQX30WoqHVwMkQN8TCnlY8yvgSInB
	pEoKHw8vJx9u2Z4IEaPqFskzJSS2npmieBgDOOh0Modz8p6GzM8C3CLwe+IGVr9/st8QiSDzZEABL
	QYZdlyKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGVX-00000007BHU-0H7A;
	Wed, 24 Jun 2026 05:50:43 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGVR-00000007BGD-3jgB;
	Wed, 24 Jun 2026 05:50:42 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowAAnIbgicDtqQQqtFQ--.23387S2;
	Wed, 24 Jun 2026 13:50:26 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	kernel@pengutronix.de,
	Vincent Mailhol <mailhol@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-can@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] can: rockchip_canfd: Propagate reset failures on start
Date: Wed, 24 Jun 2026 13:50:26 +0800
Message-ID: <20260624055026.24789-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAAnIbgicDtqQQqtFQ--.23387S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZFy3Jw18AFy7Gr18KF4fGrg_yoW5Kw4Up3
	y5J3W3Jry8Zr1rXa1rJr18ZF1Fq3ZxKr47Ga97ta1Iy34ay3WUGr1jkr1Y9r4Ut34UC34F
	gr45Aa4UWF43XFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUpwZcUUUUU=
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_225038_553631_2DA56EAB 
X-CRM114-Status: GOOD (  11.88  )
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

The Rockchip CAN-FD driver requires a reset controller, but
rkcanfd_chip_set_reset_mode() ignores reset assert/deassert failures.
rkcanfd_open() and CAN_MODE_START can then report success after the
controller failed to enter a known reset state.

Return reset errors from the reset/start helpers and propagate them
before enabling RX offload, requesting the IRQ, or starting the netdev
queue.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 .../net/can/rockchip/rockchip_canfd-core.c    | 40 +++++++++++++++----
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/net/can/rockchip/rockchip_canfd-core.c b/drivers/net/can/rockchip/rockchip_canfd-core.c
index 29de0c01e4ed..89bc402b76e8 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-core.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-core.c
@@ -102,13 +102,23 @@ static const struct can_bittiming_const rkcanfd_data_bittiming_const = {
 	.brp_inc = 2,	/* value from data sheet x2 */
 };
 
-static void rkcanfd_chip_set_reset_mode(const struct rkcanfd_priv *priv)
+static int rkcanfd_chip_set_reset_mode(const struct rkcanfd_priv *priv)
 {
-	reset_control_assert(priv->reset);
+	int err;
+
+	err = reset_control_assert(priv->reset);
+	if (err)
+		return err;
+
 	udelay(2);
-	reset_control_deassert(priv->reset);
+
+	err = reset_control_deassert(priv->reset);
+	if (err)
+		return err;
 
 	rkcanfd_write(priv, RKCANFD_REG_MODE, 0x0);
+
+	return 0;
 }
 
 static void rkcanfd_chip_set_work_mode(const struct rkcanfd_priv *priv)
@@ -246,11 +256,14 @@ static void rkcanfd_chip_fifo_setup(struct rkcanfd_priv *priv)
 	netdev_reset_queue(priv->ndev);
 }
 
-static void rkcanfd_chip_start(struct rkcanfd_priv *priv)
+static int rkcanfd_chip_start(struct rkcanfd_priv *priv)
 {
 	u32 reg;
+	int err;
 
-	rkcanfd_chip_set_reset_mode(priv);
+	err = rkcanfd_chip_set_reset_mode(priv);
+	if (err)
+		return err;
 
 	/* Receiving Filter: accept all */
 	rkcanfd_write(priv, RKCANFD_REG_IDCODE, 0x0);
@@ -309,13 +322,16 @@ static void rkcanfd_chip_start(struct rkcanfd_priv *priv)
 
 	netdev_dbg(priv->ndev, "%s: reg_mode=0x%08x\n", __func__,
 		   rkcanfd_read(priv, RKCANFD_REG_MODE));
+
+	return 0;
 }
 
 static void __rkcanfd_chip_stop(struct rkcanfd_priv *priv, const enum can_state state)
 {
 	priv->can.state = state;
 
-	rkcanfd_chip_set_reset_mode(priv);
+	if (rkcanfd_chip_set_reset_mode(priv))
+		netdev_err(priv->ndev, "Failed to reset CAN-FD controller\n");
 	rkcanfd_chip_interrupts_disable(priv);
 }
 
@@ -339,10 +355,14 @@ static int rkcanfd_set_mode(struct net_device *ndev,
 			    enum can_mode mode)
 {
 	struct rkcanfd_priv *priv = netdev_priv(ndev);
+	int err;
 
 	switch (mode) {
 	case CAN_MODE_START:
-		rkcanfd_chip_start(priv);
+		err = rkcanfd_chip_start(priv);
+		if (err)
+			return err;
+
 		rkcanfd_chip_interrupts_enable(priv);
 		netif_wake_queue(ndev);
 		break;
@@ -719,7 +739,10 @@ static int rkcanfd_open(struct net_device *ndev)
 	if (err)
 		goto out_close_candev;
 
-	rkcanfd_chip_start(priv);
+	err = rkcanfd_chip_start(priv);
+	if (err)
+		goto out_runtime_put;
+
 	can_rx_offload_enable(&priv->offload);
 
 	err = request_irq(ndev->irq, rkcanfd_irq, IRQF_SHARED, ndev->name, priv);
@@ -734,6 +757,7 @@ static int rkcanfd_open(struct net_device *ndev)
 
 out_rkcanfd_chip_stop:
 	rkcanfd_chip_stop_sync(priv, CAN_STATE_STOPPED);
+out_runtime_put:
 	pm_runtime_put(ndev->dev.parent);
 out_close_candev:
 	close_candev(ndev);
-- 
2.50.1 (Apple Git-155)


