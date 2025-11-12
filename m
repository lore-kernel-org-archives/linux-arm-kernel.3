Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E45CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 02:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6fLTNNm5Vysto9/GOfZgSAw3GYutjW7O8eiJIImZ/N4=; b=WZ9Vz5NOuISDh0ejk6aUyw2IdE
	9ChP1pCoLFKzbXX5+cKYYBbIbTclFJS3BspjThgO7/2WbErl03o2vbRZVLNL8QA8+G/lkEnp/4ry6
	cSmX6VeC/CfOepCnD8Vnvk7qxbVl7Ygjl6uAfs34ViPwGTl7AQoGdyiX5vQRmsBjnDd2ltWZPQ8Yy
	WOshbaGnmck+D6XLIraQ7mbAA2AphvHsqA7+BrMa6LVZIvOcVoMxxfwJf802ojbLX/a94iZIikBeu
	h+cnzGlyEeUA+ZGjNkkZfvLRxjEu56AhkvuBPlOCRzG1RNBxSqBb3ajOGQzdhcC/1604AVC1B4GJi
	/cOVQElg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ0do-000000081lp-2yC3;
	Wed, 12 Nov 2025 02:31:24 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ0dl-000000081lN-3tUI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 02:31:24 +0000
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowADXbMx08RNp2uFqAA--.19260S2;
	Wed, 12 Nov 2025 10:31:18 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: abelvesa@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	peng.fan@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH v2] clk: imx: imx95-blk-ctl: Fix clock leak in error paths
Date: Wed, 12 Nov 2025 10:30:25 +0800
Message-ID: <20251112023025.793-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20251111114123.2075-1-vulab@iscas.ac.cn>
References: <20251111114123.2075-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADXbMx08RNp2uFqAA--.19260S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr1xKFW5urWUAry3Zw1UWrg_yoW8ur1DpF
	Z7JFySyry8urWIgrW2yw4xXFyrW3y7ta48tr48G3Wruwn8Ar1jqFWrtFyvqF1vvFZ5C3W3
	J34vqF4fAayYkr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwwDA2kTULzHVAABsP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_183122_351896_3977A937 
X-CRM114-Status: GOOD (  10.96  )
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

The probe function enables bc->clk_apb early but fails to disable it
when bc_data is NULL or clk_hw_data allocation fails. The cleanup
path also misses pm_runtime_put_sync() when rpm is enabled.

Switch to devm_clk_get_enabled() to automatically manage the clock
resource. Add pm_runtime_put_sync() in cleanup path when rpm
is enabled.

Fixes: 5224b189462f ("clk: imx: add i.MX95 BLK CTL clk driver")
Suggested-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
Changes in v2:
  -Use devm_clk_get_enabled() instead of manual error path cleanup
---
 drivers/clk/imx/clk-imx95-blk-ctl.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
index 7e88877a6245..5fdc2af7176e 100644
--- a/drivers/clk/imx/clk-imx95-blk-ctl.c
+++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
@@ -369,16 +369,10 @@ static int imx95_bc_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	bc->base = base;
-	bc->clk_apb = devm_clk_get(dev, NULL);
+	bc->clk_apb = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(bc->clk_apb))
 		return dev_err_probe(dev, PTR_ERR(bc->clk_apb), "failed to get APB clock\n");
 
-	ret = clk_prepare_enable(bc->clk_apb);
-	if (ret) {
-		dev_err(dev, "failed to enable apb clock: %d\n", ret);
-		return ret;
-	}
-
 	bc_data = of_device_get_match_data(dev);
 	if (!bc_data)
 		return devm_of_platform_populate(dev);
@@ -431,10 +425,8 @@ static int imx95_bc_probe(struct platform_device *pdev)
 		goto cleanup;
 	}
 
-	if (pm_runtime_enabled(bc->dev)) {
+	if (pm_runtime_enabled(bc->dev))
 		pm_runtime_put_sync(&pdev->dev);
-		clk_disable_unprepare(bc->clk_apb);
-	}
 
 	return 0;
 
@@ -444,6 +436,8 @@ static int imx95_bc_probe(struct platform_device *pdev)
 			continue;
 		clk_hw_unregister(hws[i]);
 	}
+	if (bc_data->rpm_enabled && pm_runtime_enabled(bc->dev))
+		pm_runtime_put_sync(&pdev->dev);
 
 	return ret;
 }
-- 
2.50.1.windows.1


