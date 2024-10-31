Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE23AD6B6C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 12:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNpVFYx8OTvMo9bgzpXMQTFYCg9msi89VC+X0jgjFKg=; b=o4fZl1lp4MNXfKCJ9yngJw4MJk
	tS+F8rT+qh6FtPLU+Pmmk3apg1cp8nv0TRkOaCN70QaV7bQeFgIN4oLU+ple+ao5NCE7xC2Jf4QNM
	qXuCqaoQwwSQShrtYf6hMdAQ13A9V4ZjsHotaW/7UlAWZezmHE2glrcuyYbPJi70BjzjPKsATmIEJ
	1iJU4FTr9FZp3ISzvXuQXBKFHlXd7wk6weQuPMkXh5EUiuRGYxFzY95fcs+eHkcgY97LCm3rm5LoI
	V91JmKQWbPhJDMBrZ8tpT8sX55FmIZQWTz3eA8WgVNyNvYlN334FA5AIbTyfkS1hJRCCpboZ2oau3
	hJA+8HEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UTd-00000003Yp5-0iKA;
	Thu, 31 Oct 2024 12:40:37 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UPf-00000003XkH-0r3C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 12:36:32 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 8B760A0E19;
	Thu, 31 Oct 2024 13:36:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=LNpVFYx8OTvMo9bgzpXM
	QTFYCg9msi89VC+X0jgjFKg=; b=Kvf1xsAnCnBwryoZRrlOqy+uppoG2/NZtsMF
	/Rz1fWEy0PjmOvCrqV8zHecPxWYJHS+AhV2F/IaWyxlCJnWjJkQtD7+uMIJdkAE+
	EEArxCjTxiT6YpOwN8u4B2nyzVOF6p6Z/8hHjH8wR2XAWBgMers0o2GmqYMmX+HO
	cN2k7+N5tVg/GtFZkMNEZbt4Ar5rMrf39dqKunia1L99jePI1YdupIC3pR8UcBda
	T5wmhfMe1luzCjXAZm0Yfuo7hr9UCVK6R4YPP9LB/YGSItjYh45BO9teIEPabnAC
	zk6joZI+WcOSE+ksuEpiG8UQ0IC75CYFncWrQIF7lmnmmpgHIgXtxuXbBLi5aOVb
	HGDjbsgqf/i8WTdCWylVUlkG7u6cz0xF4cxNDYdJDqgwR2MVgpQrlDTvUZGv1CQr
	r+id5rsT4DvyIWNfIP425CfHraxWqDVai4SndUnEpMu9FlSD3PzTb6xCN2BcH4l6
	afpzUlRUeqISBdLqDDvcDlau/9dz9RbPTTzk24H3gEA+9sONvzU1Ry1p0dqnzwRn
	Zn78T2QcXN9e5ceL9E0eDNWoNe+A76k78eZr3mNFm6BtNhpd1BbZ9YKpQ1U8s1C7
	F0DAmaB/KIU4T/T4LRJvZ2nbpg35FfuF73XE66dqTOE3jJK4tMsvno8sR2SqIDIa
	rZxMW0w=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: Mesih Kilinc <mesihkilinc@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, Vinod Koul
	<vkoul@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>
Subject: [PATCH v4 02/10] dma-engine: sun4i: Add has_reset option to quirk
Date: Thu, 31 Oct 2024 13:35:28 +0100
Message-ID: <20241031123538.2582675-2-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031123538.2582675-1-csokas.bence@prolan.hu>
References: <20241031123538.2582675-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1730378188;VERSION=7979;MC=3052623669;ID=207182;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855667667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_053631_429745_D8A5281E 
X-CRM114-Status: GOOD (  16.14  )
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
    Changes in v3:
    * Use return value of dev_err_probe()

 drivers/dma/sun4i-dma.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
index d472f57a39ea..4626cc8ad114 100644
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
@@ -1215,6 +1218,15 @@ static int sun4i_dma_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk);
 	}
 
+	if (priv->cfg->has_reset) {
+		priv->rst = devm_reset_control_get_exclusive(&pdev->dev,
+							     NULL);
+		if (IS_ERR(priv->rst)) {
+			return dev_err_probe(&pdev->dev, PTR_ERR(priv->rst),
+						  "Failed to get reset control\n");
+		}
+	}
+
 	platform_set_drvdata(pdev, priv);
 	spin_lock_init(&priv->lock);
 
@@ -1287,6 +1299,14 @@ static int sun4i_dma_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/* Deassert the reset control */
+	ret = reset_control_deassert(priv->rst);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret,
+			"Failed to deassert the reset control\n");
+		goto err_clk_disable;
+	}
+
 	/*
 	 * Make sure the IRQs are all disabled and accounted for. The bootloader
 	 * likes to leave these dirty
@@ -1356,6 +1376,7 @@ static struct sun4i_dma_config sun4i_a10_dma_cfg = {
 	.ddma_drq_sdram		= SUN4I_DDMA_DRQ_TYPE_SDRAM,
 
 	.max_burst		= SUN4I_MAX_BURST,
+	.has_reset		= false,
 };
 
 static const struct of_device_id sun4i_dma_match[] = {
-- 
2.34.1



