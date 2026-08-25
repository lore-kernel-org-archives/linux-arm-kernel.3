Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38AEAC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 14:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iyFnPxZUNik3tVvE8NS582frtpIcudnRJLt+tg4S4AQ=; b=RKjytk+/ZfT+H8yWa3FW6mW/L0
	8lT5AFQDwvcUqyBUyRr13ElK2GTrpGSaBLPi0bryjkQhhw47CFbUKTtWGcaa10hd+WoOTqwlLaYto
	EmsOUQiNo3Fm6uVNy5Pb0vWCTTvU5pJVtvrEfDZCiZhrIPvvXcehI7kZE8gbiJ8/hPI4izvzS3Ptd
	tWLzmE5Wn9F2DWdaaxqlN1/Eec4PyetxltE8XawUpK06XFo/t+BoxgT3hBl5x1DTFOWfmg2X3979Q
	IsSER2eqYCTF9j+Umry50itX8RFk9sjzgeSjwlzN7an1OMhIdQBLKmcsAa1W4grThtUUkVvsu3uNt
	TICJ8iJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wys0W-00000000weU-2Ctm;
	Tue, 25 Aug 2026 14:20:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wys0L-00000000wXW-3u1L;
	Tue, 25 Aug 2026 14:19:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 5FD6B60A5C;
	Tue, 25 Aug 2026 14:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 8260A1F000E9;
	Tue, 25 Aug 2026 14:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787667597;
	bh=iyFnPxZUNik3tVvE8NS582frtpIcudnRJLt+tg4S4AQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j6Gs4CUx9zGGfWkFL9kxN81oUxJi/3cZOKlbzN//vE56CYTE2qKC2azkTE0eVyxQU
	 GHtOd79FNbwm1Cr2HUUyE6mTmGmnQ3b2BHPkWvTx3Vu9frpPWa4KuGAqQmKaSpZWCJ
	 w33lJpC8zDjUt3jEE5WW2xJObtmynej9X8shk2Yi7AfzRujhWsGGVECLnx0KP0eGps
	 SXZctug35HZuJhTd5ne/cibQAmWPenMzWhWbGxtd6XQWtAuez8S7ZckDNpQoWtuFls
	 XnUQ2eiBF//Mct2UnZIj+WbAFGmziVum1FrEsb2BveH/sL3cwhpOjTBkH3B+2cQ+Kv
	 rdMHshw80myHQ==
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v1 2/3] mailbox: rockchip: Simplify device variant handling
Date: Tue, 25 Aug 2026 16:19:25 +0200
Message-ID: <cf355152c7392686380034efa99dd0f21530179e.1787667315.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1787667315.git.ukleinek@kernel.org>
References: <cover.1787667315.git.ukleinek@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3432; i=ukleinek@kernel.org; h=from:subject:message-id; bh=pzggRP623iO5S7KrEPih5LAJb6wdzzDR+CfLkKw6td4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqjaR6Sf/Ve89FI/rGYndoGMR2iXbJ9E4otZ4vm ZSabc1AbiOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCao2kegAKCRCPgPtYfRL+ TvTLCAC40D08o18ghprM8wNyi2PAJ30xapMGZU/kzhgWM39cp7F9mYbHpnEIicggOnepyJQP5wc G8zYKpjfe90Y7Y1MwITNPbslNV+/kRaS9JQYU38kRtCRDN8/81V3jJzDG+RonoTqLUdBgncdLYU 0lYsYfnhS5J3qC6sXFvbcUss4LoaOqXud5dBnmbx0191A4z4cW9MNrbIGxWItovFVzHnhBeMbRH xNhFUZnf8B73BGQ572vrBdz37A6f1wieWtYHX+QKcByDfrIWKODDcUGQUAaODjbOS1X3ARH54XE r5zBmAGrOLsNl+rJgvLXiaSwFQiZNeWDlKtQx/pE/RByXVW5
X-Developer-Key: i=ukleinek@kernel.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
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

From: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

There is only a single device variant. Let's not use multi-device
abstraction for that but hardcode the information relevant for that
single device type.

Bloat-o-meter reports the following size reduction for an ARCH=arm64
build:

	add/remove: 0/1 grow/shrink: 0/1 up/down: 0/-492 (-492)
	Function                                     old     new   delta
	rk3368_drv_data                                4       -      -4
	rockchip_mbox_probe                         2084    1596    -488
	Total: Before=7185, After=6693, chg -6.85%

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/mailbox/rockchip-mailbox.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/mailbox/rockchip-mailbox.c b/drivers/mailbox/rockchip-mailbox.c
index 7ebe5f0d0233..ada2bd419880 100644
--- a/drivers/mailbox/rockchip-mailbox.c
+++ b/drivers/mailbox/rockchip-mailbox.c
@@ -22,15 +22,13 @@
 #define ROCKCHIP_MAILBOX_B2A_CMD(x)		(0x30 + (x) * 8)
 #define ROCKCHIP_MAILBOX_B2A_DAT(x)		(0x34 + (x) * 8)
 
+#define ROCKCHIP_MAILBOX_NUM_CHANS		4
+
 struct rockchip_mbox_msg {
 	u32 cmd;
 	int rx_size;
 };
 
-struct rockchip_mbox_data {
-	int num_chans;
-};
-
 struct rockchip_mbox_chan {
 	int idx;
 	int irq;
@@ -151,20 +149,15 @@ static irqreturn_t rockchip_mbox_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static const struct rockchip_mbox_data rk3368_drv_data = {
-	.num_chans = 4,
-};
-
 static const struct of_device_id rockchip_mbox_of_match[] = {
-	{ .compatible = "rockchip,rk3368-mailbox", .data = &rk3368_drv_data},
-	{ },
+	{ .compatible = "rockchip,rk3368-mailbox" },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, rockchip_mbox_of_match);
 
 static int rockchip_mbox_probe(struct platform_device *pdev)
 {
 	struct rockchip_mbox *mb;
-	const struct rockchip_mbox_data *drv_data;
 	struct resource *res;
 	struct clk *pclk;
 	int ret, irq, i;
@@ -172,13 +165,13 @@ static int rockchip_mbox_probe(struct platform_device *pdev)
 	if (!pdev->dev.of_node)
 		return -ENODEV;
 
-	drv_data = (const struct rockchip_mbox_data *) device_get_match_data(&pdev->dev);
-
-	mb = devm_kzalloc(&pdev->dev, struct_size(mb, chans, drv_data->num_chans), GFP_KERNEL);
+	mb = devm_kzalloc(&pdev->dev,
+			  struct_size(mb, chans, ROCKCHIP_MAILBOX_NUM_CHANS),
+			  GFP_KERNEL);
 	if (!mb)
 		return -ENOMEM;
 
-	mb->mbox.chans = devm_kcalloc(&pdev->dev, drv_data->num_chans,
+	mb->mbox.chans = devm_kcalloc(&pdev->dev, ROCKCHIP_MAILBOX_NUM_CHANS,
 				      sizeof(*mb->mbox.chans), GFP_KERNEL);
 	if (!mb->mbox.chans)
 		return -ENOMEM;
@@ -186,7 +179,7 @@ static int rockchip_mbox_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, mb);
 
 	mb->mbox.dev = &pdev->dev;
-	mb->mbox.num_chans = drv_data->num_chans;
+	mb->mbox.num_chans = ROCKCHIP_MAILBOX_NUM_CHANS;
 	mb->mbox.ops = &rockchip_mbox_chan_ops;
 	mb->mbox.txdone_irq = true;
 
@@ -195,7 +188,7 @@ static int rockchip_mbox_probe(struct platform_device *pdev)
 		return PTR_ERR(mb->mbox_base);
 
 	/* Each channel has two buffers for A2B and B2A */
-	mb->buf_size = (size_t)resource_size(res) / (drv_data->num_chans * 2);
+	mb->buf_size = (size_t)resource_size(res) / (ROCKCHIP_MAILBOX_NUM_CHANS * 2);
 
 	pclk = devm_clk_get_enabled(&pdev->dev, "pclk_mailbox");
 	if (IS_ERR(pclk))
-- 
2.55.0.11.g153666a7d9bb


