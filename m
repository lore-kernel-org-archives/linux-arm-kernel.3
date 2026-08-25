Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDEDC61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 14:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xk0dNc7B36bwDKmRn5sL8ALUnv0/054lZYNtGFvdOpY=; b=zcmatQZxMNt3RdS86LYSm9XEpJ
	EyQMb0QmpWf4sYnpa4e2xK6UhTuJgE2gJvvhlY3MmJiVQJHoO7Zdlu1lrYQnVXeA7fCmro7rM8Mx9
	kGp7m1cLCYlA00Zx7y2eTZL7UyZd5+XuIyIOD0PqNe7QeZ3U9ZNiRnKKe1Ij+I7Hi1g0KfghIMygQ
	+8SYj9zjRiZkNDt7Tn0L9z6Xq9mloPEaWb15wJbt5Z8cLPvhz+RlNcrH0dOfUvYvhxF8G+euJd4Lp
	wgtjhQ1UznXKmSTqCZQAOrwZ0lfELWE7Dg0jRE3Uhv/Q5tCXiHhdRRHEMNLIzgY1RrVUQJ1WniGRi
	4j3jXumg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wys0L-00000000wWz-1JUX;
	Tue, 25 Aug 2026 14:19:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wys0I-00000000wWA-3guE;
	Tue, 25 Aug 2026 14:19:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 8B0F143DA7;
	Tue, 25 Aug 2026 14:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id DE74A1F000E9;
	Tue, 25 Aug 2026 14:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787667594;
	bh=Xk0dNc7B36bwDKmRn5sL8ALUnv0/054lZYNtGFvdOpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T8FH5/qAdqSaoDKKlg1O4VOOa89peEvvy+zljYLuWMBj6KoTlmU7+ZD2X0nEWDNzz
	 NLAYF3dbezVhevy41KhV1TV9LMyWt5a6NlsiuksVIFsXTmpgAXFkQ7Y5NAmCe973+0
	 R3B428/U82AHynqe2e4xG7+XzQAhGpoX9OVXDeprunA4RwLnznqKaQv4X/2CwT+myJ
	 NmFc4mqZQ6O0TVUQpLiluENK4ThWlgIWJSF0hno4b+4ASYJO/jfBnKD1S4gsWjMvmH
	 4Wu7P3OyeTv9YZSlThnX2A5P7ugzD0kmCIpsjTLLXbUSKrtDgj/KH1E++Af0rbgP6k
	 a5TFXdVGtwBGA==
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v1 1/3] mailbox: rockchip: Add a prefix for register defines
Date: Tue, 25 Aug 2026 16:19:24 +0200
Message-ID: <2f057b0a7fdec721457962e0f1ca37b07e2b592c.1787667315.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1787667315.git.ukleinek@kernel.org>
References: <cover.1787667315.git.ukleinek@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3104; i=ukleinek@kernel.org; h=from:subject:message-id; bh=RMzhspIF+h3rHuDcRebgUTq0TyN/+X/y3aEHxu6zPE8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqjaR3yVdKAwmmTzuja8pG1pzDOzm2ZrxQm7tzY 5E7/VLaEkeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCao2kdwAKCRCPgPtYfRL+ ThKvB/4nFnH4yltKXhUbewS1SoYJsI4JqtpGaeKg0bmkvJss++HQhjjEviTV6tX+PN80bmPpBbU PtcOd06OsihwXSpXxwCsRJ+5ZvV+oOnztCon1PTKQ4B/82v9F0ucMKCcH/+7EJdVEcbDWyCt5dq 8SCtCnSQdweUyI4vhsjj1tv70j2SkkXTUzC10xYgRV0/3sH3tMDuhDtgZG80yXpoTgKnoojfQqk pqVGO6ag+YVn/726w8KCB2XY0uckGxGduteZROn/Dz3d+BrJpO4HeN4tCorUIj7kIHlOz+J16Xv n9I0cPytuNTGtWyL9HTEFFyt6zBDrSdtIiyvVlezdQfjpjRy
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

This way the defines don't make the impression to be more generic than
they actually are.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/mailbox/rockchip-mailbox.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/mailbox/rockchip-mailbox.c b/drivers/mailbox/rockchip-mailbox.c
index bc2f9dd798dd..7ebe5f0d0233 100644
--- a/drivers/mailbox/rockchip-mailbox.c
+++ b/drivers/mailbox/rockchip-mailbox.c
@@ -12,15 +12,15 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-#define MAILBOX_A2B_INTEN		0x00
-#define MAILBOX_A2B_STATUS		0x04
-#define MAILBOX_A2B_CMD(x)		(0x08 + (x) * 8)
-#define MAILBOX_A2B_DAT(x)		(0x0c + (x) * 8)
+#define ROCKCHIP_MAILBOX_A2B_INTEN		0x00
+#define ROCKCHIP_MAILBOX_A2B_STATUS		0x04
+#define ROCKCHIP_MAILBOX_A2B_CMD(x)		(0x08 + (x) * 8)
+#define ROCKCHIP_MAILBOX_A2B_DAT(x)		(0x0c + (x) * 8)
 
-#define MAILBOX_B2A_INTEN		0x28
-#define MAILBOX_B2A_STATUS		0x2C
-#define MAILBOX_B2A_CMD(x)		(0x30 + (x) * 8)
-#define MAILBOX_B2A_DAT(x)		(0x34 + (x) * 8)
+#define ROCKCHIP_MAILBOX_B2A_INTEN		0x28
+#define ROCKCHIP_MAILBOX_B2A_STATUS		0x2C
+#define ROCKCHIP_MAILBOX_B2A_CMD(x)		(0x30 + (x) * 8)
+#define ROCKCHIP_MAILBOX_B2A_DAT(x)		(0x34 + (x) * 8)
 
 struct rockchip_mbox_msg {
 	u32 cmd;
@@ -68,9 +68,10 @@ static int rockchip_mbox_send_data(struct mbox_chan *chan, void *data)
 
 	mb->chans[chans->idx].msg = msg;
 
-	writel_relaxed(msg->cmd, mb->mbox_base + MAILBOX_A2B_CMD(chans->idx));
+	writel_relaxed(msg->cmd, mb->mbox_base +
+		       ROCKCHIP_MAILBOX_A2B_CMD(chans->idx));
 	writel_relaxed(msg->rx_size, mb->mbox_base +
-		       MAILBOX_A2B_DAT(chans->idx));
+		       ROCKCHIP_MAILBOX_A2B_DAT(chans->idx));
 
 	return 0;
 }
@@ -81,7 +82,7 @@ static int rockchip_mbox_startup(struct mbox_chan *chan)
 
 	/* Enable all B2A interrupts */
 	writel_relaxed((1 << mb->mbox.num_chans) - 1,
-		       mb->mbox_base + MAILBOX_B2A_INTEN);
+		       mb->mbox_base + ROCKCHIP_MAILBOX_B2A_INTEN);
 
 	return 0;
 }
@@ -92,7 +93,7 @@ static void rockchip_mbox_shutdown(struct mbox_chan *chan)
 	struct rockchip_mbox_chan *chans = mb->chans;
 
 	/* Disable all B2A interrupts */
-	writel_relaxed(0, mb->mbox_base + MAILBOX_B2A_INTEN);
+	writel_relaxed(0, mb->mbox_base + ROCKCHIP_MAILBOX_B2A_INTEN);
 
 	mb->chans[chans->idx].msg = NULL;
 }
@@ -107,13 +108,13 @@ static irqreturn_t rockchip_mbox_irq(int irq, void *dev_id)
 {
 	int idx;
 	struct rockchip_mbox *mb = (struct rockchip_mbox *)dev_id;
-	u32 status = readl_relaxed(mb->mbox_base + MAILBOX_B2A_STATUS);
+	u32 status = readl_relaxed(mb->mbox_base + ROCKCHIP_MAILBOX_B2A_STATUS);
 
 	for (idx = 0; idx < mb->mbox.num_chans; idx++) {
 		if ((status & (1 << idx)) && (irq == mb->chans[idx].irq)) {
 			/* Clear mbox interrupt */
 			writel_relaxed(1 << idx,
-				       mb->mbox_base + MAILBOX_B2A_STATUS);
+				       mb->mbox_base + ROCKCHIP_MAILBOX_B2A_STATUS);
 			return IRQ_WAKE_THREAD;
 		}
 	}
-- 
2.55.0.11.g153666a7d9bb


