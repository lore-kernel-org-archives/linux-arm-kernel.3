Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372FBC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 15:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZH2nQiJURmm3f1AacPrlu4/bRjlg+XhQ1J7Bn7VXnB0=; b=YGvi3mHsuYjQdDOm+vrQnTMQZb
	M0tBPTs1lR11HCeeXiWTd314NPabFXy7LY2hTIjw86I035RGlLrn/iTeJcHtGiLNMyWkN18+LkhST
	OsHYIJTpsPl+tGkFOfn0gtEV+saJ357lJxVCdrwtzRhlcWoDKbmhAW4nve6BDT6FAUnUMB+3Ci9F9
	TYbPQAISGPAuqILVOFsrJqvssZAcxFhLGaDVeLidyiDbHhp5qTnVqRbPE+zsSISj9VqppXnKiCKDa
	cAPfVkSII558PKCS5X4dk0vs6Pn37BU2FGGwCUi2THaVYwOZ4Vq6fIujwH2Z1AVNEC6HAZ30RFbSp
	4/MoQ0+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBj9-00000004phD-0Coq;
	Mon, 16 Jun 2025 15:26:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9fE-00000004VHd-2KgK
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Jun 2025 13:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZH2nQiJURmm3f1AacPrlu4/bRjlg+XhQ1J7Bn7VXnB0=; b=P4v61PIF36IzRO8936ZkEVzM7w
	Bia3mW36tsNgjxvQg+iZ1et4UV8kTq+EMdFVPpG85DDgSp6iPfEHylnml41H0p3JZ5K5PBHzZQT+H
	7xKDmF7jWcLh5KadMEWSJpWrJYyyOMJJ1E/IAZPl57Qe75JIQ1hoKuXgexwQU8Y5OqwfJFS4nm14H
	QD9RUswcl8JFLNQK+36/zy1uWWf8ugichNXpkBhrqriDk5ouu819l+Q/xkBdgCYU0KZs2rPhIuKLQ
	kGA842WZbpbEt8IPBk8yMk1ejbT3/iLjharjox9OUsDjK8X7ZjiFdxkcjbT0PjUuGSvf0cufmloWp
	EjtTU0kw==;
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9fB-00000003aQB-3Rr5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 13:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750079640;
	bh=ZH2nQiJURmm3f1AacPrlu4/bRjlg+XhQ1J7Bn7VXnB0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jOyYZgdxYYAWdVDWWT9hujOZNAzM7/cW8rNsAD7F/VQKHLlPYJNsa9RD7V0Mbu3CD
	 ZC3xxtBeDLKvUk3wfHwhcQr1yNbTCCJEEMVQSNJmxWpUEHRFjg9WINb24ZCOU3tUDx
	 lpiB0l8eGro6Lp/dqaeZwN71irafgr7CH9dBLiaiXT83vQNOr5HJIe4XQA49+S0xgp
	 KU2guJrnLcxMmJENIbv23CfG/lwB6Apj2Dzx5VS0K2o6baF37jr6AgkgJ+/hrW79Bh
	 pn0QzyL/NBVQp9m3AtYxPL4Uj++L8qBSWDBo9zAhlVg04udw67xJS8ziEQu1Vcjm11
	 +u4D9a6bUJasQ==
Received: from [127.0.1.1] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 329C36884F;
	Mon, 16 Jun 2025 21:14:00 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Mon, 16 Jun 2025 22:43:41 +0930
Subject: [PATCH v2 04/10] soc: aspeed: lpc-snoop: Constrain parameters in
 channel paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-aspeed-lpc-snoop-fixes-v2-4-3cdd59c934d3@codeconstruct.com.au>
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
X-CRM114-CacheID: sfid-20250616_141414_604057_6273A51A 
X-CRM114-Status: GOOD (  13.10  )
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

Ensure pointers and the channel index are valid before use.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index ca7536213e0986f737606a52996ffea620df2a7a..804c6ed9c4c671da73a6c66c1de41c59922c82dc 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -25,7 +25,6 @@
 
 #define DEVICE_NAME	"aspeed-lpc-snoop"
 
-#define NUM_SNOOP_CHANNELS 2
 #define SNOOP_FIFO_SIZE 2048
 
 #define HICR5	0x80
@@ -57,6 +56,12 @@ struct aspeed_lpc_snoop_model_data {
 	unsigned int has_hicrb_ensnp;
 };
 
+enum aspeed_lpc_snoop_index {
+	ASPEED_LPC_SNOOP_INDEX_0 = 0,
+	ASPEED_LPC_SNOOP_INDEX_1 = 1,
+	ASPEED_LPC_SNOOP_INDEX_MAX = ASPEED_LPC_SNOOP_INDEX_1,
+};
+
 struct aspeed_lpc_snoop_channel {
 	bool enabled;
 	struct kfifo		fifo;
@@ -68,7 +73,7 @@ struct aspeed_lpc_snoop {
 	struct regmap		*regmap;
 	int			irq;
 	struct clk		*clk;
-	struct aspeed_lpc_snoop_channel chan[NUM_SNOOP_CHANNELS];
+	struct aspeed_lpc_snoop_channel chan[ASPEED_LPC_SNOOP_INDEX_MAX + 1];
 };
 
 static struct aspeed_lpc_snoop_channel *snoop_file_to_chan(struct file *file)
@@ -182,9 +187,10 @@ static int aspeed_lpc_snoop_config_irq(struct aspeed_lpc_snoop *lpc_snoop,
 	return 0;
 }
 
+__attribute__((nonnull))
 static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 				   struct device *dev,
-				   int channel, u16 lpc_port)
+				   enum aspeed_lpc_snoop_index channel, u16 lpc_port)
 {
 	const struct aspeed_lpc_snoop_model_data *model_data;
 	u32 hicr5_en, snpwadr_mask, snpwadr_shift, hicrb_en;
@@ -251,8 +257,9 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	return rc;
 }
 
+__attribute__((nonnull))
 static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
-				     int channel)
+				     enum aspeed_lpc_snoop_index channel)
 {
 	if (!lpc_snoop->chan[channel].enabled)
 		return;
@@ -331,16 +338,16 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
 	if (rc)
 		goto err;
 
-	rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, 0, port);
+	rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, ASPEED_LPC_SNOOP_INDEX_0, port);
 	if (rc)
 		goto err;
 
 	/* Configuration of 2nd snoop channel port is optional */
 	if (of_property_read_u32_index(dev->of_node, "snoop-ports",
 				       1, &port) == 0) {
-		rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, 1, port);
+		rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, ASPEED_LPC_SNOOP_INDEX_1, port);
 		if (rc) {
-			aspeed_lpc_disable_snoop(lpc_snoop, 0);
+			aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_0);
 			goto err;
 		}
 	}
@@ -358,8 +365,8 @@ static void aspeed_lpc_snoop_remove(struct platform_device *pdev)
 	struct aspeed_lpc_snoop *lpc_snoop = dev_get_drvdata(&pdev->dev);
 
 	/* Disable both snoop channels */
-	aspeed_lpc_disable_snoop(lpc_snoop, 0);
-	aspeed_lpc_disable_snoop(lpc_snoop, 1);
+	aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_0);
+	aspeed_lpc_disable_snoop(lpc_snoop, ASPEED_LPC_SNOOP_INDEX_1);
 
 	clk_disable_unprepare(lpc_snoop->clk);
 }

-- 
2.39.5


