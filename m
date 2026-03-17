Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEEDF3380C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 07:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cCz+/Q9Zpewt2kEA1alKqTlk1IxVnjfGIDqFOUHoS8I=; b=TKruHp+cxlaFqsOGDvsVa4XgBB
	fFcsD5IftO/0ExTH7UZUKGXiZiTImPlIhdSWsoV5yF+M+0VmFIf9F/8vW1eGuECtDEgr+13F+nTl6
	En1HBB/DIx8FfmmRLiX+KJXMHajfvusA9MdKNawsVJW7L52IYhS/kZEovDqgC5eQIAkxn/UFd/1bC
	2OnTi+qCqqYlP47rTOWs/PS2JFfQaFrRBvNUQlxRS+PuAkN1jIS3nNfVJVEi92Rj+HF3HWIcWTtnK
	Ud75VXaxIp2sf7J+p6KYvfloSoBKniml2LmYTD4DpxtMzUsk1N4v8kMLL23YbcweS4kAp/yuovod6
	bQvwgNYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2P6C-00000005dcu-1Wfp;
	Tue, 17 Mar 2026 07:44:20 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2P4J-00000005av3-3hiR;
	Tue, 17 Mar 2026 07:42:26 +0000
X-UUID: ccd555ba21d411f1a21c59e7364eecb8-20260317
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:2353634c-bd9c-454e-bf68-c3439609b284,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:87ef9ab8286604c6f2f3d0b3aae2297d,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ccd555ba21d411f1a21c59e7364eecb8-20260317
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 88395760; Tue, 17 Mar 2026 15:42:07 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	broonie@kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v3 09/17] spi: sifive: Use helper function devm_clk_get_enabled()
Date: Tue, 17 Mar 2026 15:41:51 +0800
Message-Id: <e0d249f53fc99a84092f29859ace9a1f22aab573.1773733017.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1773733017.git.xiaopei01@kylinos.cn>
References: <cover.1773733017.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_004224_264311_B50DB35A 
X-CRM114-Status: GOOD (  13.09  )
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
 drivers/spi/spi-sifive.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/spi/spi-sifive.c b/drivers/spi/spi-sifive.c
index 6c7aba8befa0..54adbc057af6 100644
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
 
@@ -421,7 +413,6 @@ static void sifive_spi_remove(struct platform_device *pdev)
 
 	/* Disable all the interrupts just in case */
 	sifive_spi_write(spi, SIFIVE_SPI_REG_IE, 0);
-	clk_disable_unprepare(spi->clk);
 }
 
 static int sifive_spi_suspend(struct device *dev)
-- 
2.25.1


