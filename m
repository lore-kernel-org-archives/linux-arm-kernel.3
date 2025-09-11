Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB8DCAC593
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 22:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrWtjuRdJs3JWv0wTLShA6+s14Hzwba0vFUmRwZTBnU=; b=JRqleMM2cFtjUchg82raZnDwP3
	GhHeyRF6ghSgQyySXlfPXp3baUP6JyNzPAGvTSDnlRmOBT1wkeRXZzi3xW07lK5qEoKlL+cuYXsZy
	x5Fwhf0BUwTigCMfZiuelh9yLyBmuBuVlfAUDM+f8/4bfeebcREVt8HZs0LXs3CAE0Xxv+Ea0V610
	cjEap/I/AQaRIw2qg4LrUoopCs19wfN5zoUnJ/amTnlSuhrYeCKVQzZPOyKD0xs994avax+3r1khu
	qXabBtcohjSBYwDwQHX7uqbxqCW6mi1gISEH/zG9/UT1kgxAww1g3X7sA7KEM3n5pX81HCYZW8bC+
	HJ+mRvUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpMe-00000005bpN-1CKl;
	Thu, 11 Sep 2025 22:02:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpMb-00000005bnp-10WN
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 11 Sep 2025 22:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zrWtjuRdJs3JWv0wTLShA6+s14Hzwba0vFUmRwZTBnU=; b=cNYYnp5IXO4wqQn8OnFALTiUb8
	sBhn0c06iPkVavHGbTRnBDKU2FLg1+03X0J4QMnNLwU6B1hyeZLovS3Exq1rjosxW4CdwzfBEhgSq
	BiU1/yNKmL3tuhYB8MIgmmyBmy1G/sOhc0YPJ3pFTDA91n9KBCfjmh4JF8OiD2jgA0m+C5XnKooWy
	Ba0LhYV+ID7GSZv2qmbCrDg5ErsQ7KmXRd1Xj8LgDM2Yfkx08oXorCYcbxstDIVaZbRMWcvwrFjrW
	sOGW/ymf+kzlz115dsD+jUS7Ia8SvphVBwNPCCHBUuNLBgQEwmL4QB+qoUu5KAQiQVj3Vnl2nz05n
	tJwZKUGg==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpLa-00000006BJg-1XSJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 22:01:55 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uwpLU-0005sG-L2; Fri, 12 Sep 2025 00:00:48 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Fri, 12 Sep 2025 00:00:41 +0200
Subject: [PATCH 1/2] dmaengine: add device_link support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-v6-16-topic-dma-devlink-v1-1-4debc2fbf901@pengutronix.de>
References: <20250912-v6-16-topic-dma-devlink-v1-0-4debc2fbf901@pengutronix.de>
In-Reply-To: <20250912-v6-16-topic-dma-devlink-v1-0-4debc2fbf901@pengutronix.de>
To: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jiada Wang <jiada_wang@mentor.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: dmaengine@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_230103_442164_A3A3E7E8 
X-CRM114-Status: GOOD (  18.81  )
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

Shift the device dependency handling to the driver core by adding
support for devlinks.

The link between the consumer device and the dmaengine device is
established by the consumer via the dma_request_chan() automatically if
the dmaengine driver supports it (create_devlink flag set).

By adding the devlink support it is ensured that the supplier can't be
removed while the consumer still uses the dmaengine. Furthermore it
ensures that the supplier driver is present and actual bound before the
consumer is uses the supplier.

Additional PM and runtime-PM dependency handling can be added easily too
by setting the required flags (not implemented by this commit).

The new create_devlink flag controlls the devlink creation to not cause
any regressions with existing dmaengine drivers. This flag can be
removed once all drivers are successfully tested to support devlinks.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/dma/dmaengine.c   | 15 +++++++++++++++
 include/linux/dmaengine.h |  3 +++
 2 files changed, 18 insertions(+)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index 758fcd0546d8bde8e8dddc6039848feeb1e24475..e81985ab806ae87ff3aa4739fe6f6328b2587f2e 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -858,6 +858,21 @@ struct dma_chan *dma_request_chan(struct device *dev, const char *name)
 	/* No functional issue if it fails, users are supposed to test before use */
 #endif
 
+	/*
+	 * Devlinks between the dmaengine device and the consumer device
+	 * are optional till all dmaengine drivers are converted/tested.
+	 */
+	if (chan->device->create_devlink) {
+		struct device_link *dl;
+
+		dl = device_link_add(dev, chan->device->dev, DL_FLAG_AUTOREMOVE_CONSUMER);
+		if (!dl) {
+			dev_err(dev, "failed to create device link to %s\n",
+					dev_name(chan->device->dev));
+			return ERR_PTR(-EINVAL);
+		}
+	}
+
 	chan->name = kasprintf(GFP_KERNEL, "dma:%s", name);
 	if (!chan->name)
 		return chan;
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index bb146c5ac3e4ccd7bc0afbf3b28e5b3d659ad62f..c67737a358df659f2bf050a9ccb8d23b17ceb357 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -817,6 +817,8 @@ struct dma_filter {
  *	DMA tansaction with no software intervention for reinitialization.
  *	Zero value means unlimited number of entries.
  * @descriptor_reuse: a submitted transfer can be resubmitted after completion
+ * @create_devlink: create a devlink between a dma_chan_dev supplier and
+ *	dma-channel consumer device
  * @residue_granularity: granularity of the transfer residue reported
  *	by tx_status
  * @device_alloc_chan_resources: allocate resources and return the
@@ -894,6 +896,7 @@ struct dma_device {
 	u32 max_burst;
 	u32 max_sg_burst;
 	bool descriptor_reuse;
+	bool create_devlink;
 	enum dma_residue_granularity residue_granularity;
 
 	int (*device_alloc_chan_resources)(struct dma_chan *chan);

-- 
2.47.3


