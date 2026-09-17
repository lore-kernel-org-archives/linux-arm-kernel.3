Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732D6C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 13:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FpdQDwDHyekm81outtd03w5thF7wwbBk32DXE8MrHZM=; b=fVBzKIZ+o5sAr25HTYeqU6Cr+/
	tahaga6F2hAnLYr9+1GSRGgkTJPhZkMEIkDdOqDljwix4k9rKYYm53zkiqThVdrfFLFz0d6j5ZFOe
	iNUB8oYn3d+fPuk4C861tOQZQLEJvxA8+rDx9Ep6/MHDxboN1+FwCsIhp5x5pRDBCsv/+lRfFSG7l
	R2wFTTPb3qpTdHHzjbAScHi5XQCA/nEksqZZrNDqyJ+Dlr3FCHmy4w63mw7+cysauvvuVWQkfrc6y
	temfA0RoMr2E320yzGPXRpXF/7pfdThzCGtlwwnmZQEUgkFQawcbmHOe1+ejOEvzWY/2SMxCDneFL
	ogLy0frA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CPA-0000000BQRK-22bB;
	Thu, 17 Sep 2026 13:44:00 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CP6-0000000BQQb-12G0;
	Thu, 17 Sep 2026 13:43:58 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowABHtD6Y7qtq+raBCA--.3864S2;
	Thu, 17 Sep 2026 21:43:53 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: hpchen0nvt@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	neil.armstrong@linaro.org,
	schung@nuvoton.com,
	vkoul@kernel.org,
	ychuang3@nuvoton.com,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] phy: nuvoton: Fix clock reference leak in ma35_usb_phy_probe()
Date: Thu, 17 Sep 2026 13:43:53 +0000
Message-Id: <20260917134353.2153788-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABHtD6Y7qtq+raBCA--.3864S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tryxuFy5uw13tr4fur4xXrb_yoW8WFy3pF
	WDGF1ayryvyF1Iq3yDJw4kX3W5Ca47trs5KFZ7ua4kZa98Jr4UuayfXryFvF40vrykCa4a
	qw1kAFyrAFy5ur7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPqb7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxV
	W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Cr1j6rxdMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VAI37AI020EjII2zVCS5cI20VAGYxC7M4II
	rI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMx
	AIw28IcVCjz48v1sIEY20_Gr43Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
	43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
	0_Gr1j6F4UJwCI42IY6I8E87Iv6xkF7I0E14v26rxl6s0DYxBIdaVFxhVjvjDU0xZFpf9x
	07UZSdgUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAENA2qrrJrIjgAAsy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_064356_923250_AD67BA1A 
X-CRM114-Status: GOOD (  10.70  )
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

ma35_usb_phy_probe() obtains the USB PHY clock with of_clk_get(), but
returns without calling clk_put() when devm_phy_create() or
devm_of_phy_provider_register() fails, leaking the reference.  The
clock is only meant to be kept on the success path, where it is stored
in p_phy->clk and used by the PHY operations.

Drop the reference on those two error paths.

Fixes: b48baf69db97 ("phy: nuvoton: add new driver for the Nuvoton MA35 SoC USB 2.0 PHY")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/phy/nuvoton/phy-ma35d1-usb2.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
index 9a459b700ed4..3752e244134b 100644
--- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
+++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
@@ -111,15 +111,20 @@ static int ma35_usb_phy_probe(struct platform_device *pdev)
 				     "failed to find usb_phy clock\n");
 
 	phy = devm_phy_create(&pdev->dev, NULL, &ma35_usb_phy_ops);
-	if (IS_ERR(phy))
-		return dev_err_probe(&pdev->dev, PTR_ERR(phy), "Failed to create PHY\n");
+	if (IS_ERR(phy)) {
+		clk_put(p_phy->clk);
+		return dev_err_probe(&pdev->dev, PTR_ERR(phy),
+				     "Failed to create PHY\n");
+	}
 
 	phy_set_drvdata(phy, p_phy);
 
 	provider = devm_of_phy_provider_register(&pdev->dev, of_phy_simple_xlate);
-	if (IS_ERR(provider))
+	if (IS_ERR(provider)) {
+		clk_put(p_phy->clk);
 		return dev_err_probe(&pdev->dev, PTR_ERR(provider),
 				     "Failed to register PHY provider\n");
+	}
 	return 0;
 }
 
-- 
2.34.1


