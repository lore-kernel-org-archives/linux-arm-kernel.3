Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504E5106FD84
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 06:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzZNFqShnLrIISmRIkMaGsk+Q4Sdcy9fc2OC25X5ZkA=; b=GnX7NWXDtxTYSIBxOv1jUkQnjA
	nBKp8ae7sDw8ggdC2Z+pJYhe9kqEQBNTpVx2POA9HMtZDbtnw9esgTrnD9/0TYioEYDeiTM5qmxZz
	pdDmbm8HRPzylbs3ET01xp4gs/3lj/hgJXCZmupajh8yO26aDRa9Vwa3UBJg1ZEx3IjYBOiHwWYPS
	eL0hsIzwEe7aQ5rLeN3G+Paa6f0P1Jy40snbFDKze+PCYDpJqji55vt5DFRrRd1+9DB+q43waZGKI
	a2foBWrxcTHRMaLP/c3DuJA6tcpaWP3hiJ4iMQzcZuVTpMntjhhY6lAIPHsNt5WUKvDu9tO3kz6EV
	AhSr40OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vjq-0000000GmiV-1tHl;
	Fri, 13 Mar 2026 06:11:11 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vhz-0000000Gk8w-1mIa;
	Fri, 13 Mar 2026 06:09:17 +0000
X-UUID: 2153ff861ea311f1a21c59e7364eecb8-20260313
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:1e88ab2e-8ab0-4d31-b1f4-bce00a1dcc05,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:0cf5d1f34091593f18efacf21598dcd7,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2153ff861ea311f1a21c59e7364eecb8-20260313
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2127724665; Fri, 13 Mar 2026 14:09:01 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: broonie@kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v2 09/17] spi: sifive: Use helper function devm_clk_get_enabled()
Date: Fri, 13 Mar 2026 14:08:25 +0800
Message-Id: <10f23e10d8cb481f9ede02bbd6f73b8866ebd81d.1773381582.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1773381582.git.xiaopei01@kylinos.cn>
References: <cover.1773381582.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_230915_978793_72CD6C30 
X-CRM114-Status: GOOD (  12.52  )
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

devm_clk_get() and clk_prepare_enable() can now be replaced by
devm_clk_get_enabled() when driver enables the clocks. Moreover, it is no
longer necessary to unprepare and disable the clocks explicitly.
Simplify code.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/spi/spi-sifive.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/spi-sifive.c b/drivers/spi/spi-sifive.c
index 6c7aba8befa0..3d45105f2e41 100644
--- a/drivers/spi/spi-sifive.c
+++ b/drivers/spi/spi-sifive.c
@@ -312,7 +312,8 @@ static int sifive_spi_probe(struct platform_device *pdev)
 		goto put_host;
 	}
 
-	spi->clk = devm_clk_get(&pdev->dev, NULL);
+	/* Spin up the bus clock before hitting registers */
+	spi->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(spi->clk)) {
 		dev_err(&pdev->dev, "Unable to find bus clock\n");
 		ret = PTR_ERR(spi->clk);
@@ -342,13 +343,6 @@ static int sifive_spi_probe(struct platform_device *pdev)
 		goto put_host;
 	}
 
-	/* Spin up the bus clock before hitting registers */
-	ret = clk_prepare_enable(spi->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "Unable to enable bus clock\n");
-		goto put_host;
-	}
-
 	/* probe the number of CS lines */
 	spi->cs_inactive = sifive_spi_read(spi, SIFIVE_SPI_REG_CSDEF);
 	sifive_spi_write(spi, SIFIVE_SPI_REG_CSDEF, 0xffffffffU);
@@ -357,14 +351,14 @@ static int sifive_spi_probe(struct platform_device *pdev)
 	if (!cs_bits) {
 		dev_err(&pdev->dev, "Could not auto probe CS lines\n");
 		ret = -EINVAL;
-		goto disable_clk;
+		goto put_host;
 	}
 
 	num_cs = ilog2(cs_bits) + 1;
 	if (num_cs > SIFIVE_SPI_MAX_CS) {
 		dev_err(&pdev->dev, "Invalid number of spi targets\n");
 		ret = -EINVAL;
-		goto disable_clk;
+		goto put_host;
 	}
 
 	/* Define our host */
@@ -392,7 +386,7 @@ static int sifive_spi_probe(struct platform_device *pdev)
 			       dev_name(&pdev->dev), spi);
 	if (ret) {
 		dev_err(&pdev->dev, "Unable to bind to interrupt\n");
-		goto disable_clk;
+		goto put_host;
 	}
 
 	dev_info(&pdev->dev, "mapped; irq=%d, cs=%d\n",
@@ -401,13 +395,11 @@ static int sifive_spi_probe(struct platform_device *pdev)
 	ret = devm_spi_register_controller(&pdev->dev, host);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "spi_register_host failed\n");
-		goto disable_clk;
+		goto put_host;
 	}
 
 	return 0;
 
-disable_clk:
-	clk_disable_unprepare(spi->clk);
 put_host:
 	spi_controller_put(host);
 
-- 
2.25.1


