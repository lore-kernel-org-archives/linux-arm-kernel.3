Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC9CD3B7E8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 09:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S2w8/u2rr3mg4lvmPyZlWOPCilqIT6k6d9NxtmsU/fo=; b=VYIeCE0OFV5XJUrzId6Kkk2YG6
	aWmj57BXwO2iiyxoSXVFJ2Zc+SocyFqGw+5HU/7aoyl0mfZeNZX0gjSRKMDbMByyKDnE9ZjhP3wMv
	p/wzt/f3G6hi7bPnBp9BJlTTbyoZg0dCQ/7l2TmNKnfyj9u9EZlBwctZKHo4oupcCkboHcGoydW9P
	pjgrLUaqEHZ1tZm1lC0lW5L5HhaXHTvZLZSAfUN74VvGV6JUImjtPu+bElQ+s0xYoHzS58ijlLG9O
	vZZE8SxUsz1ffB/huNvALUtx8K8I2TRztk0HtKU5Ts3n3ZPki94ilJSp06l0HFD9x93dNWDa9wINb
	kaPhJr1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXlj-0000000CuGB-0D6G;
	Mon, 08 Dec 2025 09:42:59 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXlf-0000000CuFW-29py
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 09:42:58 +0000
Received: from dfae2b116770.home.arpa (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowAB3muGVnTZpnbsAAA--.961S2;
	Mon, 08 Dec 2025 17:42:45 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: ulf.hansson@linaro.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] pmdomain: imx: Fix reference count leak in imx_gpc_probe()
Date: Mon,  8 Dec 2025 09:42:42 +0000
Message-Id: <20251208094242.17821-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAB3muGVnTZpnbsAAA--.961S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCF4fWF4ftF47WFyftr4DXFb_yoW5Xw15pF
	ZrGFWakrWxGF47Ga4xtr1DZas0k3y2yw4jgw47G3WxZFn8tr9rur1Sva4UKr4SkFWkW3W5
	AF43JFy09F1UZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9C14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8uwCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUhmiiUUUUU=
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAYKA2k2dlSkkAAAsK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_014256_001573_D7F3C5AA 
X-CRM114-Status: GOOD (  12.23  )
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

of_get_child_by_name() returns a node pointer with refcount incremented,
we should use of_node_put() on it when not needed anymore. Add missing
of_node_put() calls in imx_gpc_probe() to avoid reference count leak.

This commit fixes the following issues:
1. Add of_node_put(pgc_node) before returning from imx_gpc_probe()
2. Use goto pattern to consolidate error handling

Fixes: 721cabf6c660 ("soc: imx: move PGC handling to a new GPC driver")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/pmdomain/imx/gpc.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
index f18c7e6e75dd..754c60effc8a 100644
--- a/drivers/pmdomain/imx/gpc.c
+++ b/drivers/pmdomain/imx/gpc.c
@@ -416,8 +416,10 @@ static int imx_gpc_probe(struct platform_device *pdev)
 		return 0;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	if (IS_ERR(base)) {
+		ret = PTR_ERR(base);
+		goto err_free;
+	}
 
 	regmap = devm_regmap_init_mmio_clk(&pdev->dev, NULL, base,
 					   &imx_gpc_regmap_config);
@@ -425,7 +427,7 @@ static int imx_gpc_probe(struct platform_device *pdev)
 		ret = PTR_ERR(regmap);
 		dev_err(&pdev->dev, "failed to init regmap: %d\n",
 			ret);
-		return ret;
+		goto err_free;
 	}
 
 	/*
@@ -460,29 +462,33 @@ static int imx_gpc_probe(struct platform_device *pdev)
 		int domain_index;
 
 		ipg_clk = devm_clk_get(&pdev->dev, "ipg");
-		if (IS_ERR(ipg_clk))
-			return PTR_ERR(ipg_clk);
+		if (IS_ERR(ipg_clk)) {
+			ret = PTR_ERR(ipg_clk);
+			goto err_free;
+		}
 		ipg_rate_mhz = clk_get_rate(ipg_clk) / 1000000;
 
 		for_each_child_of_node_scoped(pgc_node, np) {
 			ret = of_property_read_u32(np, "reg", &domain_index);
 			if (ret)
-				return ret;
+				goto err_free;
 
 			if (domain_index >= of_id_data->num_domains)
 				continue;
 
 			pd_pdev = platform_device_alloc("imx-pgc-power-domain",
 							domain_index);
-			if (!pd_pdev)
-				return -ENOMEM;
+			if (!pd_pdev) {
+				ret = -ENOMEM;
+				goto err_free;
+			}
 
 			ret = platform_device_add_data(pd_pdev,
 						       &imx_gpc_domains[domain_index],
 						       sizeof(imx_gpc_domains[domain_index]));
 			if (ret) {
 				platform_device_put(pd_pdev);
-				return ret;
+				goto err_free;
 			}
 			domain = pd_pdev->dev.platform_data;
 			domain->regmap = regmap;
@@ -495,12 +501,17 @@ static int imx_gpc_probe(struct platform_device *pdev)
 			ret = platform_device_add(pd_pdev);
 			if (ret) {
 				platform_device_put(pd_pdev);
-				return ret;
+				goto err_free;
 			}
 		}
 	}
 
+	of_node_put(pgc_node);
 	return 0;
+
+err_free:
+	of_node_put(pgc_node);
+	return ret;
 }
 
 static void imx_gpc_remove(struct platform_device *pdev)
-- 
2.34.1


