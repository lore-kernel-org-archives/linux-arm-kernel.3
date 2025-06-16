Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DF1C71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 15:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6h0ix1ZdixoOBaPO3IlzuOaav+hjON9yVdm3QZ+ABs4=; b=LJzK0mBTwD3/9kjYLiJxiFKFO3
	eAxzZpxB9QbXfrljvT3oAR7DyRDS23/xR77JfsgOeikFJoAPCXlAohCZ/eNVzUFLa2Rebz7Z3wT6s
	Tg4lc+z2B6x5rjUqzq+w/XgJ4ODrPZdZSCDgvoELW6XG4AGlXGfzIJil3pR2/FL15ja12nbaoRw85
	NVz9D+G0SzyzZcD+LCP8HN7hC62TKzJ1mRmIOUGOmGTB/GJioRGzBzvO2aXWf8W284TbmuvZ9jFsR
	ymcj873KbGIY2xy1JayQaE8xq1IWOjCWEElzPs1yp9+Ot4nFO0CIosG46tTfLXJGp88cok7eZznZv
	od9efuXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBjY-00000004qG8-1dVk;
	Mon, 16 Jun 2025 15:26:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9fK-00000004VJW-3Aq8
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Jun 2025 13:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6h0ix1ZdixoOBaPO3IlzuOaav+hjON9yVdm3QZ+ABs4=; b=P+HTxue8nxv8l/I8PyxfW1+3r/
	n6LZUhD65N9T6fNVds7zIIosYMxbJf4fQ3QhEgvWniCAOSvMOsJVlnFU1KThe6xKuvF9i3GXuhJ73
	qMbrOkS/BtVzROUsuq2tf9tF95qGcWYVna+IZSacdA0wEqLhXM0Lzv4D+D6qtxfKMn9DkUHLz+HbO
	zNsJW96ERle9glwQeZx3zk8TsIXw3pzY8oMmhINxKh3Exg7t2lhXY1UXjJCPNH13WYVRzcoSUYd2h
	ZmZfvJQ7ZpaNurBQoCVF7PbzronQeFIgC//SxohngtJRUGPOBKcf1rZBPLPHrHZ8Sadzmxj5OTeXH
	SR+zF11w==;
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9fI-00000003aS9-0fxa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 13:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750079645;
	bh=6h0ix1ZdixoOBaPO3IlzuOaav+hjON9yVdm3QZ+ABs4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Kor3MH/XjP0L5Qf7xtsszE318PqOoYFUW4LmZufq+PV1IG00ZaBxZrGo4TV66c7wT
	 g/nO3IrU50YVymtMloXXIbGQO+f8DLdIeKGiiVz3Q39yBcMJhutjCY1P6IjDZcisrS
	 Mp4NB+eBYCz2rS1A5RsP1/CnZwOuLKNxHufGdxTqrrcnnrzFDrQuj1rrGpaHw1AygZ
	 W7rF21jQzGf2p4NFQsopVAid4EohIDoKXZrPsbz1GXOG9DYcwhz3RlB0Ry6fJjxZMR
	 znMkjUBhJV1S6JgpRCyd+bOGYamCJcDsSsZOIR3i4zyI6uJd3FJ5nWWndufy7SaULP
	 IP1uL0ys+1VIg==
Received: from [127.0.1.1] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0A88368865;
	Mon, 16 Jun 2025 21:14:04 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Mon, 16 Jun 2025 22:43:47 +0930
Subject: [PATCH v2 10/10] soc: aspeed: lpc-snoop: Lift channel config to
 const structs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-aspeed-lpc-snoop-fixes-v2-10-3cdd59c934d3@codeconstruct.com.au>
References: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
In-Reply-To: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
To: linux-aspeed@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Henry Martin <bsdhenrymartin@gmail.com>, 
 Jean Delvare <jdelvare@suse.de>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Andrew Geissler <geissonator@yahoo.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, Patrick Venture <venture@google.com>, 
 Robert Lippert <roblip@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_141420_625424_89688BC2 
X-CRM114-Status: GOOD (  14.45  )
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

The shifts and masks for each channel are defined by hardware and
are not something that changes at runtime. Accordingly, describe the
information in an array of const structs and associate elements with
each channel instance, removing the need for the switch and handling of
its default case.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 100 +++++++++++++++-------------------
 1 file changed, 45 insertions(+), 55 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 9f88c5471b1b6d85f6d9e1970240f3d1904d166c..2d97b8d5fb429e215c321c9c2ee3fa35d39f8618 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -63,7 +63,16 @@ enum aspeed_lpc_snoop_index {
 	ASPEED_LPC_SNOOP_INDEX_MAX = ASPEED_LPC_SNOOP_INDEX_1,
 };
 
+struct aspeed_lpc_snoop_channel_cfg {
+	enum aspeed_lpc_snoop_index index;
+	u32 hicr5_en;
+	u32 snpwadr_mask;
+	u32 snpwadr_shift;
+	u32 hicrb_en;
+};
+
 struct aspeed_lpc_snoop_channel {
+	const struct aspeed_lpc_snoop_channel_cfg *cfg;
 	bool enabled;
 	struct kfifo		fifo;
 	wait_queue_head_t	wq;
@@ -77,6 +86,23 @@ struct aspeed_lpc_snoop {
 	struct aspeed_lpc_snoop_channel chan[ASPEED_LPC_SNOOP_INDEX_MAX + 1];
 };
 
+static const struct aspeed_lpc_snoop_channel_cfg channel_cfgs[ASPEED_LPC_SNOOP_INDEX_MAX + 1] = {
+	{
+		.index = ASPEED_LPC_SNOOP_INDEX_0,
+		.hicr5_en = HICR5_EN_SNP0W | HICR5_ENINT_SNP0W,
+		.snpwadr_mask = SNPWADR_CH0_MASK,
+		.snpwadr_shift = SNPWADR_CH0_SHIFT,
+		.hicrb_en = HICRB_ENSNP0D,
+	},
+	{
+		.index = ASPEED_LPC_SNOOP_INDEX_1,
+		.hicr5_en = HICR5_EN_SNP1W | HICR5_ENINT_SNP1W,
+		.snpwadr_mask = SNPWADR_CH1_MASK,
+		.snpwadr_shift = SNPWADR_CH1_SHIFT,
+		.hicrb_en = HICRB_ENSNP1D,
+	},
+};
+
 static struct aspeed_lpc_snoop_channel *snoop_file_to_chan(struct file *file)
 {
 	return container_of(file->private_data,
@@ -189,28 +215,27 @@ static int aspeed_lpc_snoop_config_irq(struct aspeed_lpc_snoop *lpc_snoop,
 }
 
 __attribute__((nonnull))
-static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
-				   struct device *dev,
-				   enum aspeed_lpc_snoop_index index, u16 lpc_port)
+static int aspeed_lpc_enable_snoop(struct device *dev,
+				    struct aspeed_lpc_snoop *lpc_snoop,
+				    struct aspeed_lpc_snoop_channel *channel,
+				    const struct aspeed_lpc_snoop_channel_cfg *cfg,
+				    u16 lpc_port)
 {
 	const struct aspeed_lpc_snoop_model_data *model_data;
-	u32 hicr5_en, snpwadr_mask, snpwadr_shift, hicrb_en;
-	struct aspeed_lpc_snoop_channel *channel;
 	int rc = 0;
 
-	channel = &lpc_snoop->chan[index];
-
 	if (WARN_ON(channel->enabled))
 		return -EBUSY;
 
 	init_waitqueue_head(&channel->wq);
 
+	channel->cfg = cfg;
 	channel->miscdev.minor = MISC_DYNAMIC_MINOR;
 	channel->miscdev.fops = &snoop_fops;
 	channel->miscdev.parent = dev;
 
 	channel->miscdev.name =
-		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, index);
+		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, cfg->index);
 	if (!channel->miscdev.name)
 		return -ENOMEM;
 
@@ -223,39 +248,18 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 		goto err_free_fifo;
 
 	/* Enable LPC snoop channel at requested port */
-	switch (index) {
-	case 0:
-		hicr5_en = HICR5_EN_SNP0W | HICR5_ENINT_SNP0W;
-		snpwadr_mask = SNPWADR_CH0_MASK;
-		snpwadr_shift = SNPWADR_CH0_SHIFT;
-		hicrb_en = HICRB_ENSNP0D;
-		break;
-	case 1:
-		hicr5_en = HICR5_EN_SNP1W | HICR5_ENINT_SNP1W;
-		snpwadr_mask = SNPWADR_CH1_MASK;
-		snpwadr_shift = SNPWADR_CH1_SHIFT;
-		hicrb_en = HICRB_ENSNP1D;
-		break;
-	default:
-		rc = -EINVAL;
-		goto err_misc_deregister;
-	}
-
-	/* Enable LPC snoop channel at requested port */
-	regmap_update_bits(lpc_snoop->regmap, HICR5, hicr5_en, hicr5_en);
-	regmap_update_bits(lpc_snoop->regmap, SNPWADR, snpwadr_mask,
-			   lpc_port << snpwadr_shift);
+	regmap_set_bits(lpc_snoop->regmap, HICR5, cfg->hicr5_en);
+	regmap_update_bits(lpc_snoop->regmap, SNPWADR, cfg->snpwadr_mask,
+		lpc_port << cfg->snpwadr_shift);
 
 	model_data = of_device_get_match_data(dev);
 	if (model_data && model_data->has_hicrb_ensnp)
-		regmap_update_bits(lpc_snoop->regmap, HICRB, hicrb_en, hicrb_en);
+		regmap_set_bits(lpc_snoop->regmap, HICRB, cfg->hicrb_en);
 
 	channel->enabled = true;
 
 	return 0;
 
-err_misc_deregister:
-	misc_deregister(&channel->miscdev);
 err_free_fifo:
 	kfifo_free(&channel->fifo);
 	return rc;
@@ -263,30 +267,13 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 
 __attribute__((nonnull))
 static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
-				     enum aspeed_lpc_snoop_index index)
+				     struct aspeed_lpc_snoop_channel *channel)
 {
-	struct aspeed_lpc_snoop_channel *channel;
-
-	channel = &lpc_snoop->chan[index];
-
 	if (!channel->enabled)
 		return;
 
 	/* Disable interrupts along with the device */
-	switch (index) {
-	case 0:
-		regmap_update_bits(lpc_snoop->regmap, HICR5,
-				   HICR5_EN_SNP0W | HICR5_ENINT_SNP0W,
-				   0);
-		break;
-	case 1:
-		regmap_update_bits(lpc_snoop->regmap, HICR5,
-				   HICR5_EN_SNP1W | HICR5_ENINT_SNP1W,
-				   0);
-		break;
-	default:
-		return;
-	}
+	regmap_clear_bits(lpc_snoop->regmap, HICR5, channel->cfg->hicr5_en);
 
 	channel->enabled = false;
 	/* Consider improving safety wrt concurrent reader(s) */
@@ -299,8 +286,8 @@ static void aspeed_lpc_snoop_remove(struct platform_device *pdev)
 	struct aspeed_lpc_snoop *lpc_snoop = dev_get_drvdata(&pdev->dev);
 
 	/* Disable both snoop channels */
-	aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_0);
-	aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_1);
+	aspeed_lpc_disable_snoop(lpc_snoop, &lpc_snoop->chan[0]);
+	aspeed_lpc_disable_snoop(lpc_snoop, &lpc_snoop->chan[1]);
 }
 
 static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
@@ -339,6 +326,8 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
 	if (rc)
 		return rc;
 
+	static_assert(ARRAY_SIZE(channel_cfgs) == ARRAY_SIZE(lpc_snoop->chan),
+		"Broken implementation assumption regarding cfg count");
 	for (idx = ASPEED_LPC_SNOOP_INDEX_0; idx <= ASPEED_LPC_SNOOP_INDEX_MAX; idx++) {
 		u32 port;
 
@@ -346,7 +335,8 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
 		if (rc)
 			break;
 
-		rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, idx, port);
+		rc = aspeed_lpc_enable_snoop(dev, lpc_snoop, &lpc_snoop->chan[idx],
+					     &channel_cfgs[idx], port);
 		if (rc)
 			goto cleanup_channels;
 	}

-- 
2.39.5


