Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D745CC71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 15:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/lpAFC+njrZ4FhM5FG8e1pUsSKmtZTOJbqXCRTKS2KA=; b=rFe/jZW0CvWDJXMunM7MUCGtLx
	WREun9lz4pT4TyDniucNj5jOFLvnOxDK3sfNyYqO2ukoWN+zI924FMUxMcMD4LZBkr7BCQaMCArf7
	JWPF44VypOadMtjgcNWaHLzerwr6VmKePHV3fWSxp1+rl5bN//n6bTaO8KDDzBK9mggsE/ge1g6qo
	gm6V0UdlALO/Jh6LJ+MDTzDWpsgX6k0x0tRH3xPABgGEy0FV7vElzE4k6afmJSqqkO1uN4HUyo3CN
	tH4RLCwTB2Z4vE9pL7yVn5B/31zxbgXROW5Q1NJD8Ep8vuIMZqiW64LqiTXMSnsupAbld0WSVOlW/
	dU7Qg2TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBjX-00000004qEW-2NEz;
	Mon, 16 Jun 2025 15:26:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9fK-00000004VJX-39Db
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Jun 2025 13:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/lpAFC+njrZ4FhM5FG8e1pUsSKmtZTOJbqXCRTKS2KA=; b=a96yFDko/DHazG4ZTvb4T2ccTQ
	fnLAsoAdDj0YcpEB/Pxl/4adCjN5Ao0EFULepqopaBZdLkrzc9NX1zSk9yEQNAg/qEjhl3N0P7b+N
	zjXmG63wKV2dSYeqVCKDyCkg8wFO4LU6JtkyzuaN64AYfUkPz7IflnV6aHs6tB14VRw++sVKeRh8c
	87QdUrbrBZe0xRbjKy5D1WgekAa6CO0Y4hYv2HfEjP7HaZDpZ+mdbR9nDZLVQD1kmDQD0hTd9K8as
	h1uw46oW9EPZGqLEJQ1rg8eQ6s+dEHYKZpi5crTtAed28HTs3OVlzjvvYB6NDtFoVX3hcZz9X+KUh
	8ESSHU6A==;
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9fI-00000003aSA-0ft3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 13:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750079644;
	bh=/lpAFC+njrZ4FhM5FG8e1pUsSKmtZTOJbqXCRTKS2KA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NET9XgRjDDQ6ddYttVxtQQdwpx+++CZ5MpuoMLb+RCxX1XQ2awHXdTmlIXAuvPoAJ
	 Q8hrXFQaM3fRylKuxJ1Y3vD3W9p6YXg1/IJuY3am41P97IS6G7hXmT2/wdgVsZpEXM
	 9lNsijfZ6XdryEQPDvWUA05rOX6aR0IFxoHHOiLY/SZslg3oXvo/uhMQ1eWc8U3hI8
	 uEqX/NKjFlA9new7sR3d/wrbx9mqqJUSkLKb6rZovmV4dr5jFHMoYKYxS1KhQFW4UV
	 Enpi2+O5gHKCG16JEitCnpEhaTs/6G+4gA4ufuv6czctTfU496CBJNy73ycsAMGJGt
	 GYKBaiXjdZn7w==
Received: from [127.0.1.1] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 426156885C;
	Mon, 16 Jun 2025 21:14:04 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Mon, 16 Jun 2025 22:43:46 +0930
Subject: [PATCH v2 09/10] soc: aspeed: lpc-snoop: Consolidate channel
 initialisation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-aspeed-lpc-snoop-fixes-v2-9-3cdd59c934d3@codeconstruct.com.au>
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
X-CRM114-CacheID: sfid-20250616_141420_599569_9BE2B308 
X-CRM114-Status: GOOD (  14.25  )
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

Previously, channel initialisation was a bit perilous with respect to
resource cleanup in error paths. While the implementation had issues,
it at least made an effort to eliminate some of its problems by first
testing whether any channels were enabled, and bailing out if not.

Having improved the robustness of resource handling in probe() we can
now rearrange the initial channel test to be located with the subsequent
test, and rework the unrolled conditional logic to use a loop for an
improvement in readability.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 51 +++++++++++++++++------------------
 1 file changed, 24 insertions(+), 27 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 8dbc9d4158b89f23bda340f060d205a29bbb43c3..9f88c5471b1b6d85f6d9e1970240f3d1904d166c 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -294,12 +294,21 @@ static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	kfifo_free(&channel->fifo);
 }
 
+static void aspeed_lpc_snoop_remove(struct platform_device *pdev)
+{
+	struct aspeed_lpc_snoop *lpc_snoop = dev_get_drvdata(&pdev->dev);
+
+	/* Disable both snoop channels */
+	aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_0);
+	aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_1);
+}
+
 static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
 {
 	struct aspeed_lpc_snoop *lpc_snoop;
-	struct device *dev;
 	struct device_node *np;
-	u32 port;
+	struct device *dev;
+	int idx;
 	int rc;
 
 	dev = &pdev->dev;
@@ -322,12 +331,6 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, lpc_snoop);
 
-	rc = of_property_read_u32_index(dev->of_node, "snoop-ports", 0, &port);
-	if (rc) {
-		dev_err(dev, "no snoop ports configured\n");
-		return -ENODEV;
-	}
-
 	lpc_snoop->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(lpc_snoop->clk))
 		return dev_err_probe(dev, PTR_ERR(lpc_snoop->clk), "couldn't get clock");
@@ -336,30 +339,24 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
 	if (rc)
 		return rc;
 
-	rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, ASPEED_LPC_SNOOP_INDEX_0, port);
-	if (rc)
-		return rc;
+	for (idx = ASPEED_LPC_SNOOP_INDEX_0; idx <= ASPEED_LPC_SNOOP_INDEX_MAX; idx++) {
+		u32 port;
 
-	/* Configuration of 2nd snoop channel port is optional */
-	if (of_property_read_u32_index(dev->of_node, "snoop-ports",
-				       1, &port) == 0) {
-		rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, ASPEED_LPC_SNOOP_INDEX_1, port);
-		if (rc) {
-			aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_0);
-			return rc;
-		}
+		rc = of_property_read_u32_index(dev->of_node, "snoop-ports", idx, &port);
+		if (rc)
+			break;
+
+		rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, idx, port);
+		if (rc)
+			goto cleanup_channels;
 	}
 
-	return 0;
-}
+	return idx == ASPEED_LPC_SNOOP_INDEX_0 ? -ENODEV : 0;
 
-static void aspeed_lpc_snoop_remove(struct platform_device *pdev)
-{
-	struct aspeed_lpc_snoop *lpc_snoop = dev_get_drvdata(&pdev->dev);
+cleanup_channels:
+	aspeed_lpc_snoop_remove(pdev);
 
-	/* Disable both snoop channels */
-	aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_0);
-	aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_1);
+	return rc;
 }
 
 static const struct aspeed_lpc_snoop_model_data ast2400_model_data = {

-- 
2.39.5


