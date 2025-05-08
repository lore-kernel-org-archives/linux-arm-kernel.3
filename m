Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAABC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 15:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VqDEeskjv204T3o+wE2sZQ84XlTbJJpueq61qTFHyrU=; b=feVguLzjOBs/+ppDqVBJGsACmn
	3Vkl/Y4cJljh/PMsCqUDK1M/UqwOCrHrjHNDgtDfDCqxmkBHrg3S8Uwy/NHla1zF+qoMyl6hsAtef
	8jJk/Zz+p5SYW6g/+oLSDXG3sXA8bl2zOYasY8I21jP//ewBshYz4nQbC+RKbqFOraaESNcF2W0iS
	DShN/051d8LcgY/O05v1JSHRt8zCFQFUsdWqcKjPqJ8uiiK1Us18JJPW7KZOyn+LoayVQsJIFAGLs
	E3U59WVhNeD8M7R775R6990ML7XX2BJmR1BHrY8lVdKjmk4JcIKqMG6xb+EWQn2kYqWQajuErSMWo
	tcBhWYhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3IP-000000019kj-16iy;
	Thu, 08 May 2025 15:36:25 +0000
Received: from smtp-75.smtpout.orange.fr ([80.12.242.75] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2cl-000000010Fx-2xYY;
	Thu, 08 May 2025 14:53:25 +0000
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id D2cYuomdl816KD2cluwCrp; Thu, 08 May 2025 16:53:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1746716003;
	bh=VqDEeskjv204T3o+wE2sZQ84XlTbJJpueq61qTFHyrU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=kmer2oUbkAgOhVfov1utjfGjKAfmb/BJ5QcB46zCIaqQYavwLTUu29+A1ZPz5aOSf
	 T7jQk01ZTHqW0tyOSQ4SDXlSFipu9KTipIfiaP5GKh6YNCkwh2SlIYGFmbMgO1ulMK
	 41XW59fx5HzeD98srEdzP6BbYD5qAEE1nlPkUsUzAjE3ZZ872L2R6ZvJdSGJWCeKFs
	 EF7/WzzWvzASRcdldvOC5ee8c//yRhxNxNMklIJIO3Irl0zV1KwSwfdp5En7DwPSZy
	 tVSeKQPJ17oWKXq1CAsm/mmpXrIw+euQ33DAgvUL+deIzoVMYP6T7dOYMDyplHq924
	 yiBRZo34NVqKQ==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 08 May 2025 16:53:23 +0200
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
Subject: [PATCH v2 4/4] net: airoha: Use dev_err_probe()
Date: Thu,  8 May 2025 16:52:28 +0200
Message-ID: <1b67aa9ea0245325c3779d32dde46cdf5c232db9.1746715755.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <5c94b9b3850f7f29ed653e2205325620df28c3ff.1746715755.git.christophe.jaillet@wanadoo.fr>
References: <5c94b9b3850f7f29ed653e2205325620df28c3ff.1746715755.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_075323_879438_5BBBDE7D 
X-CRM114-Status: GOOD (  10.76  )
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
Changes in v2:
  - New patch

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


