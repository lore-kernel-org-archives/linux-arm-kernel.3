Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4727C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 20:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xe3Yf/RkJy0bBAFw+fy2FrPiDrFjW5kHmVMstQPOdyk=; b=pzvBJCSR+JNiunxnm8hcfsYq4k
	/D+X2FWvMMes1bpQtc4VabrzrbBlK+PIPE7UFxoIHRm2szw5YWBFM3WrZtU5zJTdZ5ZYSdSiZ4346
	ZFuUplJlaVqh36wi25xGbhYk2CxqHxLut7Pi6yNNF7wgKQNo8TDf2lT/WbloUA7hfogtMLq8Cknhq
	RL4j3FCtkOHj7Rco7toVTVcdo7wdhpkLx95aBwpaGGBXg4w5vBIcfI/S1l6L0W1WE/MbUpzAvfId4
	oIJLNfpKrtZff+mZFWeqJ0y1Gq2h0SEQxdQ+AEWHRvmVzVrj11U44IX0OEY3qKiFdxPKy0RuoorJp
	8Tdg3Zig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFf80-00000001n9l-3u9c;
	Thu, 15 May 2025 20:24:28 +0000
Received: from smtp-17.smtpout.orange.fr ([80.12.242.17] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFekR-00000001kDF-1SJg;
	Thu, 15 May 2025 20:00:08 +0000
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id FekBuCN6oIqMPFekQugnx3; Thu, 15 May 2025 22:00:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1747339207;
	bh=Xe3Yf/RkJy0bBAFw+fy2FrPiDrFjW5kHmVMstQPOdyk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=dds4VrK0VNtd1KEL5NbJssDaA6ZgoOZRe2hYjPJQrQXEDy2zIxlDbH6HyHsa60st+
	 mnmReU3IaRk75AWJv89Dh4h1sqmhxMc9wU+PWs2Q/6+T5QuAib0PK8iN/72pwQxGtp
	 6Q4g3X4fBHo/+Vbut0qwVfH8we040E9XMCkQxUy0c9vgd/mQJbXVSCvt38dDUvP7SM
	 jeq9fWUAevNfhMZe9kg1Ed72kNlwapp2rVG/h2UvmmbYiIZY57DR6JD8+Zvyqa8fzm
	 OA/m2jrnNJAJD6lxmulxHIISVebP7wF/BLvGLBsDgres6dGXybDY4LyX8zVaI79X6H
	 V7kUGcjoFu3Sw==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 15 May 2025 22:00:07 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org
Subject: [PATCH v3 4/4] net: airoha: Use dev_err_probe()
Date: Thu, 15 May 2025 21:59:38 +0200
Message-ID: <bb64aa1ea0205329c377ad32dde46cdf5c232db9.1746715755.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <5c94b9b345017f29ed653e2f05d25620d128c3f0.1746715755.git.christophe.jaillet@wanadoo.fr>
References: <5c94b9b345017f29ed653e2f05d25620d128c3f0.1746715755.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_130007_522324_20D5D772 
X-CRM114-Status: GOOD (  10.56  )
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

Use dev_err_probe() to slightly simplify the code.
It is less verbose, more informational and makes error logging more
consistent in the probe.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Changes in v3:
  - None

Changes in v2:
  - New patch
v2: https://lore.kernel.org/all/1b67aa9ea0245325c3779d32dde46cdf5c232db9.1746715755.git.christophe.jaillet@wanadoo.fr/

Compile tested only.
---
 drivers/net/ethernet/airoha/airoha_eth.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 2335aa59b06f..7404ee894467 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2896,10 +2896,9 @@ static int airoha_probe(struct platform_device *pdev)
 	eth->dev = &pdev->dev;
 
 	err = dma_set_mask_and_coherent(eth->dev, DMA_BIT_MASK(32));
-	if (err) {
-		dev_err(eth->dev, "failed configuring DMA mask\n");
-		return err;
-	}
+	if (err)
+		return dev_err_probe(eth->dev, err,
+				     "failed configuring DMA mask\n");
 
 	eth->fe_regs = devm_platform_ioremap_resource_byname(pdev, "fe");
 	if (IS_ERR(eth->fe_regs))
@@ -2912,10 +2911,9 @@ static int airoha_probe(struct platform_device *pdev)
 	err = devm_reset_control_bulk_get_exclusive(eth->dev,
 						    ARRAY_SIZE(eth->rsts),
 						    eth->rsts);
-	if (err) {
-		dev_err(eth->dev, "failed to get bulk reset lines\n");
-		return err;
-	}
+	if (err)
+		return dev_err_probe(eth->dev, err,
+				     "failed to get bulk reset lines\n");
 
 	eth->xsi_rsts[0].id = "xsi-mac";
 	eth->xsi_rsts[1].id = "hsi0-mac";
@@ -2925,10 +2923,9 @@ static int airoha_probe(struct platform_device *pdev)
 	err = devm_reset_control_bulk_get_exclusive(eth->dev,
 						    ARRAY_SIZE(eth->xsi_rsts),
 						    eth->xsi_rsts);
-	if (err) {
-		dev_err(eth->dev, "failed to get bulk xsi reset lines\n");
-		return err;
-	}
+	if (err)
+		return dev_err_probe(eth->dev, err,
+				     "failed to get bulk xsi reset lines\n");
 
 	eth->napi_dev = alloc_netdev_dummy(0);
 	if (!eth->napi_dev)
-- 
2.49.0


