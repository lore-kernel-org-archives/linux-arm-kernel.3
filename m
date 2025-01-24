Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A35C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 08:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dPRX9W95wzwQTmmvdwrEPqh/JERYDW6ukU8wyxlrOs=; b=Kwlps5mkvOd7UzGjkBnpQDLrCH
	LV1GYNua4frIU3hdy/KmGKJDtc8ZO1krySOa7xyar20QhNaP2zg3VpK255O3rpd/TQac9HZMLYh5Q
	AlZqi7IVxVr0YgnCQZVWytHfWZejwcx2tSbdO9LnQnQXfhT3/yCwhcJsBtiqzgBuX3lhBGOQMDknt
	0TA0figeddIOMGg3Ihbr/2eimg41EPSGndDeGPNZYqT6uq7TPbEt6/JTcYdG/hoqcBUBcCAAZfMVV
	6HHaurw4fzaAl9FplwX4OEUFcjBv2XAulqrQdjee91bjoXJd00HpfY4R0mD8jNGzo13Ed3I2i7ldB
	/7lnd0Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbFWm-0000000EIog-0bkw;
	Fri, 24 Jan 2025 08:59:00 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbFUW-0000000EISW-0l22
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 08:56:41 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id DCBF1A09FF;
	Fri, 24 Jan 2025 09:56:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=/dPRX9W95wzwQTmmvdwr
	EPqh/JERYDW6ukU8wyxlrOs=; b=HRJ3XRli0bJqmqEkA5XizKxZ08cudSvu96Iw
	VumzdC99vsEJnvFL4SgTXbOd837Y795TwlVsW0Dk9j4J6GL1oxG9Eb+aPUHMo77L
	jGtLasYkWxk6enfuuSjXEiRjLNQr+efAuhn6RVLpe76HEWGbgVDYFtAZGohE8pw/
	vPdLzKhHsnpPXqEv5jU0MXPDdGL7/Uf1tgb92HDTAgLBfXhZsOm/ro605IOmy6is
	Pu8e/3b1ITFXd7ORkYXaWRdDO5SEdxzfqDsTQ5D3K3yMbaIag9h0Ya50RfXFVWfe
	Gj1DF7GRZ1QOgeLYkGZfpRQLe1IYxstFPYZzc60gW1jNwmpii57++Kq7Py2w/HNp
	Ci8HVZr9mxIPCL3bW4Ml8wW7llqrsnriL4UutQpgmmq/kF8ctA5i5XWIfqDd9OnA
	/fkhiYKYk5ry8T0OdRBWgWzXpGRAlv0CLdFBmQBsXxjzwZnpCzSeaMpEzrv/3AhJ
	VAG3XQIeKQBmDYGKVUlOlumZOrw6gRFvCxArevfYiV2SbbKzIteCw+a+LY2+L6lv
	P+2FLybnzYO/0SFJdw7HqRTyqktRu5i8LOaEG/5X0twYCOd3ZhGzIPNbN849NGn1
	mCB6pgKe8RyVjBrQ8kTHXaOIvF8vAs9OYP5qWjZt5magzJ82FiwLRMYM5aEbBiq1
	XboyO1Y=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, Mark Brown
	<broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>, "Rafael J . Wysocki"
	<rafael@kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>
Subject: [PATCH v2 1/4] dma: Add devm_dma_request_chan()
Date: Fri, 24 Jan 2025 09:52:20 +0100
Message-ID: <20250124085221.766303-8-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250124085221.766303-4-csokas.bence@prolan.hu>
References: <20250124085221.766303-4-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1737708998;VERSION=7984;MC=241928571;ID=70499;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94852677063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_005640_388972_30EEA2B3 
X-CRM114-Status: GOOD (  12.15  )
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

Expand the arsenal of devm functions for DMA
devices, this time for requesting channels.

Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 drivers/dma/dmaengine.c   | 30 ++++++++++++++++++++++++++++++
 include/linux/dmaengine.h |  7 +++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index c1357d7f3dc6..02c29d26ac85 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -926,6 +926,36 @@ void dma_release_channel(struct dma_chan *chan)
 }
 EXPORT_SYMBOL_GPL(dma_release_channel);
 
+static void dmaenginem_release_channel(void *chan)
+{
+	dma_release_channel(chan);
+}
+
+/**
+ * devm_dma_request_chan - try to allocate an exclusive slave channel
+ * @dev:	pointer to client device structure
+ * @name:	slave channel name
+ *
+ * Returns pointer to appropriate DMA channel on success or an error pointer.
+ *
+ * The operation is managed and will be undone on driver detach.
+ */
+
+struct dma_chan *devm_dma_request_chan(struct device *dev, const char *name)
+{
+	struct dma_chan *chan = dma_request_chan(dev, name);
+	int ret = 0;
+
+	if (!IS_ERR(chan))
+		ret = devm_add_action_or_reset(dev, dmaenginem_release_channel, chan);
+
+	if (ret)
+		return ERR_PTR(ret);
+
+	return chan;
+}
+EXPORT_SYMBOL_GPL(devm_dma_request_chan);
+
 /**
  * dmaengine_get - register interest in dma_channels
  */
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 346251bf1026..ffb54b52ef0c 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -1528,6 +1528,7 @@ struct dma_chan *__dma_request_channel(const dma_cap_mask_t *mask,
 
 struct dma_chan *dma_request_chan(struct device *dev, const char *name);
 struct dma_chan *dma_request_chan_by_mask(const dma_cap_mask_t *mask);
+struct dma_chan *devm_dma_request_chan(struct device *dev, const char *name);
 
 void dma_release_channel(struct dma_chan *chan);
 int dma_get_slave_caps(struct dma_chan *chan, struct dma_slave_caps *caps);
@@ -1564,6 +1565,12 @@ static inline struct dma_chan *dma_request_chan_by_mask(
 {
 	return ERR_PTR(-ENODEV);
 }
+
+static inline struct dma_chan *devm_dma_request_chan(struct device *dev, const char *name)
+{
+	return ERR_PTR(-ENODEV);
+}
+
 static inline void dma_release_channel(struct dma_chan *chan)
 {
 }
-- 
2.48.1



