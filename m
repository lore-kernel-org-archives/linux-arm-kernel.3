Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7BAC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 15:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIWTEhmFsARbk2BN345atKp2DrJ1LmEtzHmUjEpWj/4=; b=q0qmsO2VBIs7QbQkAbbJh6zqbo
	wzqZJYd8+DmHISbC4CYQzk+ReXh+KAuhdwnzK7/vjwcG9EpEKnT9arkcIt45yn/47T2TJkML7DjWm
	uSK5a9GP6IAxcr9vx4cQ02Sa5vOiD6j5O9ly+aoaQ/cwA982PSlHXLkP2B5ev2MCf5net0Sm78NEa
	LHzwXGGHxfORidzq+RILxCRtvL3xrZxaxtxfS437mhlG9N71lY5+zjfbBv33Sjd8Mjo923UR1SQhZ
	HM+wTy/y6S+wa1jKMkNQQYujJhIm0MtaJi+5uUBKADL9zmUyM37ZBmyQOsEUKA5cTX7K+M9g3j+I2
	LO5UqDVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBjR-00000004q4t-0tPP;
	Mon, 16 Jun 2025 15:26:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9fI-00000004VJG-3jB0
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Jun 2025 13:14:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YIWTEhmFsARbk2BN345atKp2DrJ1LmEtzHmUjEpWj/4=; b=eBHwwbxPRYWwfvBKBUxhi6c6Ht
	OuGW3zMGKt4pWJNp5bYewL/DbNGAgMz/fKtzQkTzgGDvq783z4IEaVIwkdbgzHW2StSUjMXCy0aPY
	rAUxAlPVakIAKmUL71xYE6U8hjS379xT8T06Br8rDezidMIyeTJa/3t1i5yfwMtoCgdiU7uCRD4F+
	OSbDKY5AiKaw88HeLqXMxlEQ5EeEr92OBh7wgQRTQHt8wYoQdgo83eKq96046xpabfL5ZXGt0zWeO
	j5540a1fna5MQOoGRuzEV5oEp73k2IEJX03BTK7cL3LGmeK4Sru4uBWZ9Ts1tJNOyehmttNcVPfGg
	IdyEYUVA==;
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9fG-00000003aRv-2JBn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 13:14:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750079641;
	bh=YIWTEhmFsARbk2BN345atKp2DrJ1LmEtzHmUjEpWj/4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FK6QUhR1cwtYs5DPuSeAzi7fp76/6QCgGoDSaXgKWhg6g7s/j6FFq1EUiLX0NdXR2
	 HY/JXtzCN+JvM6XYtOscdY3vvcBMgwht9leEXBEgRSIBXRyTnuEcjyxNCglYFDacNG
	 Y3uKK3TYQYd9UUtrGSgwzDDrpa220ufI+GkWCOjFgv/6bwUpoPjTprz8y4AE6m/RNm
	 I10kxqhj2WndFcpsefx9NXEnw9B6xQ2TpHh4rxi9As5JaBeQEwMr9aAqMLUvmDUAhy
	 RqDpHSQEShArOJbSA+CVu1rccSBKNfdyWjkCSxmd+uaU+QoP7p/+TrxNTUpXj5jxwB
	 /TUiPahUDAypg==
Received: from [127.0.1.1] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id EE27B68850;
	Mon, 16 Jun 2025 21:14:00 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Mon, 16 Jun 2025 22:43:42 +0930
Subject: [PATCH v2 05/10] soc: aspeed: lpc-snoop: Rename 'channel' to
 'index' in channel paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-aspeed-lpc-snoop-fixes-v2-5-3cdd59c934d3@codeconstruct.com.au>
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
X-CRM114-CacheID: sfid-20250616_141418_991503_237C5E01 
X-CRM114-Status: GOOD (  12.43  )
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

We'll introduce another 'channel' variable shortly

Acked-by: Jean Delvare <jdelvare@suse.de>
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 43 ++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 804c6ed9c4c671da73a6c66c1de41c59922c82dc..e9d17239163a8ae5145bd3652fcec572b70bd11c 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -190,37 +190,37 @@ static int aspeed_lpc_snoop_config_irq(struct aspeed_lpc_snoop *lpc_snoop,
 __attribute__((nonnull))
 static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 				   struct device *dev,
-				   enum aspeed_lpc_snoop_index channel, u16 lpc_port)
+				   enum aspeed_lpc_snoop_index index, u16 lpc_port)
 {
 	const struct aspeed_lpc_snoop_model_data *model_data;
 	u32 hicr5_en, snpwadr_mask, snpwadr_shift, hicrb_en;
 	int rc = 0;
 
-	if (WARN_ON(lpc_snoop->chan[channel].enabled))
+	if (WARN_ON(lpc_snoop->chan[index].enabled))
 		return -EBUSY;
 
-	init_waitqueue_head(&lpc_snoop->chan[channel].wq);
+	init_waitqueue_head(&lpc_snoop->chan[index].wq);
 	/* Create FIFO datastructure */
-	rc = kfifo_alloc(&lpc_snoop->chan[channel].fifo,
+	rc = kfifo_alloc(&lpc_snoop->chan[index].fifo,
 			 SNOOP_FIFO_SIZE, GFP_KERNEL);
 	if (rc)
 		return rc;
 
-	lpc_snoop->chan[channel].miscdev.minor = MISC_DYNAMIC_MINOR;
-	lpc_snoop->chan[channel].miscdev.name =
-		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, channel);
-	if (!lpc_snoop->chan[channel].miscdev.name) {
+	lpc_snoop->chan[index].miscdev.minor = MISC_DYNAMIC_MINOR;
+	lpc_snoop->chan[index].miscdev.name =
+		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, index);
+	if (!lpc_snoop->chan[index].miscdev.name) {
 		rc = -ENOMEM;
 		goto err_free_fifo;
 	}
-	lpc_snoop->chan[channel].miscdev.fops = &snoop_fops;
-	lpc_snoop->chan[channel].miscdev.parent = dev;
-	rc = misc_register(&lpc_snoop->chan[channel].miscdev);
+	lpc_snoop->chan[index].miscdev.fops = &snoop_fops;
+	lpc_snoop->chan[index].miscdev.parent = dev;
+	rc = misc_register(&lpc_snoop->chan[index].miscdev);
 	if (rc)
 		goto err_free_fifo;
 
 	/* Enable LPC snoop channel at requested port */
-	switch (channel) {
+	switch (index) {
 	case 0:
 		hicr5_en = HICR5_EN_SNP0W | HICR5_ENINT_SNP0W;
 		snpwadr_mask = SNPWADR_CH0_MASK;
@@ -246,25 +246,26 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	if (model_data && model_data->has_hicrb_ensnp)
 		regmap_update_bits(lpc_snoop->regmap, HICRB, hicrb_en, hicrb_en);
 
-	lpc_snoop->chan[channel].enabled = true;
+	lpc_snoop->chan[index].enabled = true;
 
 	return 0;
 
 err_misc_deregister:
-	misc_deregister(&lpc_snoop->chan[channel].miscdev);
+	misc_deregister(&lpc_snoop->chan[index].miscdev);
 err_free_fifo:
-	kfifo_free(&lpc_snoop->chan[channel].fifo);
+	kfifo_free(&lpc_snoop->chan[index].fifo);
 	return rc;
 }
 
 __attribute__((nonnull))
 static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
-				     enum aspeed_lpc_snoop_index channel)
+				     enum aspeed_lpc_snoop_index index)
 {
-	if (!lpc_snoop->chan[channel].enabled)
+	if (!lpc_snoop->chan[index].enabled)
 		return;
 
-	switch (channel) {
+	/* Disable interrupts along with the device */
+	switch (index) {
 	case 0:
 		regmap_update_bits(lpc_snoop->regmap, HICR5,
 				   HICR5_EN_SNP0W | HICR5_ENINT_SNP0W,
@@ -279,10 +280,10 @@ static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 		return;
 	}
 
-	lpc_snoop->chan[channel].enabled = false;
+	lpc_snoop->chan[index].enabled = false;
 	/* Consider improving safety wrt concurrent reader(s) */
-	misc_deregister(&lpc_snoop->chan[channel].miscdev);
-	kfifo_free(&lpc_snoop->chan[channel].fifo);
+	misc_deregister(&lpc_snoop->chan[index].miscdev);
+	kfifo_free(&lpc_snoop->chan[index].fifo);
 }
 
 static int aspeed_lpc_snoop_probe(struct platform_device *pdev)

-- 
2.39.5


