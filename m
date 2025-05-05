Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33F7C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 03:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBk2yqe6V3bcJVeyOgBi49UnuINiPdTpi8WzdHYcHKQ=; b=bC7UTMKyykn2fHuNN10YazFwjv
	iqG7vXbSWHlJpIVkDWPmTSBPk4dgM00L/YKhb4JDRfJkFfLhyDHXMTbrqc35ftXAnGk5rP6JPJ7f2
	k0CUK5PhjbMzlgHy6Usu57W2HGGEi6qNIYMND/6M8HgghvdfTaHzZuytZhoz3b8inziwtppjR0Ajz
	YE6zg9vJaW0NZQuL/Rb5mD6+KxZOAF8D96RS7nIjwHK3ET/pCToAQesiSbLWyifkV7J7cbR4bfPQx
	+DN9YwZTlCIMfqczaXA7yjv/1l6+QMtaKydfJ3OxOmrbzQ+Ju3nWdaS4mWqK1OjQtcLuoqsGe9YRU
	+phGbo1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC8eF-00000009uIq-34bz;
	Tue, 06 May 2025 03:07:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4oY-00000008vwN-06Wz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 23:01:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A4385C2458;
	Mon,  5 May 2025 22:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 728F8C4CEEE;
	Mon,  5 May 2025 23:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486093;
	bh=lOfCLognjnfviD9lunmu6frl76a7EqZweCWg3T5tj8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GRq0sTvxbkxvy+3oePjm49AVw/8+xA8YaBSsrSdAGvKw5GZjWAMzE+LquoLmWxOUP
	 DjRI5OEsDh9Vqis8hafiVh1TrYElH9gxNub+RDBt30EjdzNo7ZCwK0/+H1h84/+EbS
	 p92WnQ92hhur2fOg9vns4EmDsygx5uTOX2ND+pvSpMxMr56bgqCADgjURPHcOPE9jw
	 p1O0druKl6eHAQfTOetyyoiE1JuSwdIPKIRDvPWcC75Se2i9wanw70/aVK8+fc3UrL
	 oM7LTlqy6IbheeQ2cY3qKZqLGUWY03RagOF2KFZzz1uHM4ngDgECTBFOyGkHFZFpgD
	 RnndQgyP90fpQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Andrew Davis <afd@ti.com>,
	Nishanth Menon <nm@ti.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 152/294] soc: ti: k3-socinfo: Do not use syscon helper to build regmap
Date: Mon,  5 May 2025 18:54:12 -0400
Message-Id: <20250505225634.2688578-152-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_160134_107681_E5CC42D2 
X-CRM114-Status: GOOD (  16.09  )
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
index 6ea9b8c7d335c..7a3bdef5a7c0d 100644
--- a/drivers/soc/ti/k3-socinfo.c
+++ b/drivers/soc/ti/k3-socinfo.c
@@ -63,6 +63,12 @@ k3_chipinfo_partno_to_names(unsigned int partno,
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
@@ -70,13 +76,18 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
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


