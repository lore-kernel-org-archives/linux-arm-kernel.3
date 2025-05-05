Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D2CC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 04:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CuZnQe6k2Vt/HOHvPI3Niu8NAa0ud+J0XaWKCMAMD38=; b=uEnz3rK8IU9PidQ0NBCklmYO3x
	cYgEIPZcWpiqBHdYTJpWL41NbZmMWYAy0uyKFUwc23h080v7kHsWd+aVvgBJmLtGbdILOgZZ04tIK
	6EwkqXUzyS9z7udylT9m5MJS0Md881IG/4AQu/lNmLJe3U70h97vIXHR3wjHXtsNvLj4l4/tkVuVb
	GVZO8zog8JiMMEGCnbo8L6rqVDkhphJ3DWi3TthxrSRzsWRE0alV9Wmb+PYHVUAjcCmnKXgR+KtuS
	i5W4qFBM1c6u5FOArL12NGE1NmSeOuetAeX7UFA/0oG4btBY/H3iw55ffvcuQrRUxW6c02qSNtLM2
	2DN3i0Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC9UZ-0000000A7DL-3U1R;
	Tue, 06 May 2025 04:01:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4x0-00000008yQm-2Uh5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 23:10:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CBBD629C8;
	Mon,  5 May 2025 23:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9707C4CEEF;
	Mon,  5 May 2025 23:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486617;
	bh=nKouMe6Y0GQnvHW1DvgFl6qIE4tn21jgzi82cBCRDwE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dW/xTMkc4yRz1eNE6ZFHShCrV5C8YGoHzTGA78+16kOy91VkClK7vP29Eq/ak3Kuj
	 ddEkbJU7dXLk2feIYCXTsEmx7xs3eDV77x1E3KFvE0n0eOE+U7MuZ79x4lyMOirT62
	 FgBpEUIQNArAcbk5NmCyn6ZmnoG+KlMAzP0X3I8aubYmvW2ZXFCfHsy5eptGkAR9s9
	 ho5R/PTdDyowtgryaCs0klcoy/uHOWh8yqEkPtLYKltO8cK6HAPvFssf76AOROoe3j
	 Hsao/FxOGHtGUerqX5quLn2+PVb+9N9hb7riy7s5Wrr6vWEqZeH2Zq0bIat6hi55ms
	 rGvjR4Xgtl8Vw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Andrew Davis <afd@ti.com>,
	Nishanth Menon <nm@ti.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 121/212] soc: ti: k3-socinfo: Do not use syscon helper to build regmap
Date: Mon,  5 May 2025 19:04:53 -0400
Message-Id: <20250505230624.2692522-121-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
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

From: Andrew Davis <afd@ti.com>

[ Upstream commit a5caf03188e44388e8c618dcbe5fffad1a249385 ]

The syscon helper device_node_to_regmap() is used to fetch a regmap
registered to a device node. It also currently creates this regmap
if the node did not already have a regmap associated with it. This
should only be used on "syscon" nodes. This driver is not such a
device and instead uses device_node_to_regmap() on its own node as
a hacky way to create a regmap for itself.

This will not work going forward and so we should create our regmap
the normal way by defining our regmap_config, fetching our memory
resource, then using the normal regmap_init_mmio() function.

Signed-off-by: Andrew Davis <afd@ti.com>
Link: https://lore.kernel.org/r/20250123181726.597144-1-afd@ti.com
Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/ti/k3-socinfo.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
index 91f441ee61752..5b0d8260918d2 100644
--- a/drivers/soc/ti/k3-socinfo.c
+++ b/drivers/soc/ti/k3-socinfo.c
@@ -60,6 +60,12 @@ k3_chipinfo_partno_to_names(unsigned int partno,
 	return -EINVAL;
 }
 
+static const struct regmap_config k3_chipinfo_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
 static int k3_chipinfo_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
@@ -67,13 +73,18 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct soc_device *soc_dev;
 	struct regmap *regmap;
+	void __iomem *base;
 	u32 partno_id;
 	u32 variant;
 	u32 jtag_id;
 	u32 mfg;
 	int ret;
 
-	regmap = device_node_to_regmap(node);
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	regmap = regmap_init_mmio(dev, base, &k3_chipinfo_regmap_cfg);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-- 
2.39.5


