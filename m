Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2088E69173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 16:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1Z4az5usI2lY9gqx5SE+mRAc0vY8Gmvq8DnX4tFp+Y=; b=yXc1CibsyhlGO12SVOhvDysEi6
	D3rhN1zD/a65+qj3uu+kXl6TpWnC9n1MvcSqr6KV0e2N+5ynwzrqs7o2VmViB0v+PC5rPe8GdmQ71
	B8nwUL596FbwL+LqmfT3jz3HBugvaXJKxBh96+Q7VQMn7Egp57fDyE951QkzHw6U7wlUAIgQnMOQe
	zXGZ+bOpQe4n9L0lk3DdCa9ZKKYIWZSY2qDyToy1Wd+GTC2GveFFxX/tVwx8ey0U0TFi9DnnMiKG+
	ccv512U8OYl8TQ/RUpaOf+96ssO1hDRD5E9kTDYkZZmss/CPcIa41CSfVMSf6t/PIlh/DOMwHuXy6
	ZPy7FWkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEWLx-00000002oX7-47IX;
	Fri, 22 Nov 2024 16:17:53 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEWL1-00000002oGp-0x6c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 16:16:56 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id CC41AA048D;
	Fri, 22 Nov 2024 17:16:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=D1Z4az5usI2lY9gqx5SE
	+mRAc0vY8Gmvq8DnX4tFp+Y=; b=b6llwpk8o9zymmKz3dSyFDTyHSQtqZjS/4pX
	SWhZxIhoBRRgaumyB37IFn448O0AvrIjfLIsLdYqyeZELNGI/qskEzGRVhEtXynn
	SlepZitd119v8W4rFL/+yxNw9kOo/yAsOC8mRL7VMeZyjmzhNyKxczgvQbq3XToq
	5b9h7jDSG3OQ1CAqYZWrLnhOlj4lFPGoZYhDEzMrf7kX7sD9MVKm7tf/qzB8NVc4
	+7UKBR6jVrDOJ+wjFQu4f7xXsq9+LL7r61QsvjEQfDJ5IBPA7i0keqaxDBJttgKc
	+n1//lR45fR/1oqGwFgvSKoKJ4G3UxivcNbbZVF/PkZ/2P6Y9NAEKQX5HHAkCiw4
	xYEIqqS92UsmFKJUXqVz0fHPlmrwyZPC+2S2XXdTw3Ie7QFnnHHAMRF+VoUMhNVf
	O1IlKwDyvEJc0ETY8JCx1CMjBOIS1NNLQDSJZBsj9Q9Xx31CNKWCmyrXNcm1/Lmk
	pMCYDbNuhn0YkvxdVle27BVJmeDFZX7e9elZPytUXM4YB9Qrp6l+6UyC87T7bzOG
	gRbZ0g/V1VS6GGL82WtrwSafEQn9tKZCvF+8d9lUeeD8mRL2CR7wH9+OvO2jrM5B
	prHYjCoxXJYVGCGG25pv8RMrYmRDtqueaZSJNm9nRKTEMw1YS/c6IGSHL2mMM5aI
	4NeIPb0=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: Mesih Kilinc <mesihkilinc@gmail.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, Vinod Koul
	<vkoul@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>
Subject: [PATCH v6 2/5] dma-engine: sun4i: Add has_reset option to quirk
Date: Fri, 22 Nov 2024 17:11:29 +0100
Message-ID: <20241122161128.2619172-3-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122161128.2619172-1-csokas.bence@prolan.hu>
References: <20241122161128.2619172-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1732292213;VERSION=7980;MC=2546843321;ID=75609;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94855607263
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_081655_417967_5D4F1683 
X-CRM114-Status: GOOD (  14.50  )
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

From: Mesih Kilinc <mesihkilinc@gmail.com>

Allwinner suniv F1C100s has a reset bit for DMA in CCU. Sun4i do not
has this bit but in order to support suniv we need to add it. So add
support for reset bit.

Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
[ csokas.bence: Rebased and addressed comments ]
Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---

Notes:
    Changes in v2:
    * Call reset_control_deassert() unconditionally, as it supports optional resets
    * Use dev_err_probe()
    * Whitespace
    Changes in v3:
    * More dev_err_probe() fixes
    Changes in v4:
    * Use return value of dev_err_probe()
    Changes in v5:
    * More whitespace
    Changes in v6:
    * Use the new devm_reset_control_get_exclusive_deasserted()

 drivers/dma/sun4i-dma.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
index b2c1e4b9f696..adb52a6df83a 100644
--- a/drivers/dma/sun4i-dma.c
+++ b/drivers/dma/sun4i-dma.c
@@ -15,6 +15,7 @@
 #include <linux/of_dma.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
@@ -159,6 +160,7 @@ struct sun4i_dma_config {
 	u8 ddma_drq_sdram;
 
 	u8 max_burst;
+	bool has_reset;
 };
 
 struct sun4i_dma_pchan {
@@ -208,6 +210,7 @@ struct sun4i_dma_dev {
 	int				irq;
 	spinlock_t			lock;
 	const struct sun4i_dma_config *cfg;
+	struct reset_control *rst;
 };
 
 static struct sun4i_dma_dev *to_sun4i_dma_dev(struct dma_device *dev)
@@ -1215,6 +1218,13 @@ static int sun4i_dma_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk);
 	}
 
+	if (priv->cfg->has_reset) {
+		priv->rst = devm_reset_control_get_exclusive_deasserted(&pdev->dev, NULL);
+		if (IS_ERR(priv->rst))
+			return dev_err_probe(&pdev->dev, PTR_ERR(priv->rst),
+					     "Failed to get reset control\n");
+	}
+
 	platform_set_drvdata(pdev, priv);
 	spin_lock_init(&priv->lock);
 
@@ -1355,6 +1365,7 @@ static struct sun4i_dma_config sun4i_a10_dma_cfg = {
 	.ddma_drq_sdram		= SUN4I_DDMA_DRQ_TYPE_SDRAM,
 
 	.max_burst		= SUN4I_MAX_BURST,
+	.has_reset		= false,
 };
 
 static const struct of_device_id sun4i_dma_match[] = {
-- 
2.34.1



