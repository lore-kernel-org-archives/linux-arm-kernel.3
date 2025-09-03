Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F79BCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 16:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KcEpxWxoGumVN+qbb0glLz3ABIKHmU1mUlR6wUJHmSA=; b=vC1iwIA6euSeED4dJq+CAC4lZU
	oVvAmIAyrDt1Q5lRrtrO6+6TKZ+MY/kMjMMMb34IrNpCITUr57y/AOE8+ilR15Qp6Jj3IsV+z9NW6
	y93UONwC++6OhvPkFoTTXLEmtSSV+hxukjTR1DzTAufSNju+psoumZ4luZk4IShJs5KEGk2pGQni9
	1R08pTi0busINypOPqZss9SMkqaT8HMnaCi6BCdZc/OAVb9GpbNdacHq2hyiZuy7oSFSc0lK4dZFk
	1TKlgPke2jr7r8TKVN+nCQuZldJe6hdrIt9LiMa6s8nSWP/vkdb/+8ymSNFmjzL1fNgtGM3fZRSBM
	RsNSVJ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utqDO-000000072R1-2Txo;
	Wed, 03 Sep 2025 16:20:06 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnBp-00000006W5G-2bPd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:06:21 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1utnBl-00006Z-Vo; Wed, 03 Sep 2025 15:06:13 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Wed, 03 Sep 2025 15:06:17 +0200
Subject: [PATCH 09/11] dmaengine: add support for device_link
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-v6-16-topic-sdma-v1-9-ac7bab629e8b@pengutronix.de>
References: <20250903-v6-16-topic-sdma-v1-0-ac7bab629e8b@pengutronix.de>
In-Reply-To: <20250903-v6-16-topic-sdma-v1-0-ac7bab629e8b@pengutronix.de>
To: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jiada Wang <jiada_wang@mentor.com>
Cc: dmaengine@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_060617_805682_80610826 
X-CRM114-Status: GOOD (  13.48  )
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

Add support to create device_links between dmaengine suppliers and the
dma consumers. This shifts the device dep-chain teardown/bringup logic
to the driver core.

Moving this to the core allows the dmaengine drivers to simplify the
.remove() hooks and also to ensure that no dmaengine driver is ever
removed before the consumer is removed.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/dma/dmaengine.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index 758fcd0546d8bde8e8dddc6039848feeb1e24475..a50652bc70b8ce9d4edabfaa781b3432ee47d31e 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -817,6 +817,7 @@ struct dma_chan *dma_request_chan(struct device *dev, const char *name)
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	struct dma_device *d, *_d;
 	struct dma_chan *chan = NULL;
+	struct device_link *dl;
 
 	if (is_of_node(fwnode))
 		chan = of_dma_request_slave_channel(to_of_node(fwnode), name);
@@ -858,6 +859,13 @@ struct dma_chan *dma_request_chan(struct device *dev, const char *name)
 	/* No functional issue if it fails, users are supposed to test before use */
 #endif
 
+	dl = device_link_add(dev, chan->device->dev, DL_FLAG_AUTOREMOVE_CONSUMER);
+	if (!dl) {
+		dev_err(dev, "failed to create device link to %s\n",
+			dev_name(chan->device->dev));
+		return ERR_PTR(-EINVAL);
+	}
+
 	chan->name = kasprintf(GFP_KERNEL, "dma:%s", name);
 	if (!chan->name)
 		return chan;

-- 
2.47.2


