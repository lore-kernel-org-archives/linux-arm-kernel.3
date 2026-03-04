Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8579EFCE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 18:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/F7XmH5/hs11BL5Bv9gfwXPkKTxvFijq4nvY+SwIm9w=; b=ZZas+7VrOk6rAgjMQPgXimK3xA
	LzYvfNune59wSHR/1fNfnXsWYOvAAyjohVy0PyyDp3NUZS2zFKHqB1fhaVdWSKJaajTZM+oFHNCy0
	L48daej2tI7gm3zBJ6Y65jhl8OLgTDQLbENxAfNkWJgLokUTbesQVMjL8O7a3oxqYejv0T28Pt2Rw
	yjcgkG1O2vnsIZkLUQAx2lzZn6Mvti7hrA2xIs4/TxQ8dV16Ly8tWJTssDsScJAGENzMbjZdHTFOb
	4FPMFTdskM4D5C6DN3sq5kjc7Cu2BbpQYI2OJubl45mcpcLaF8ktLbVDt8vJs6thfFELh4g9scchA
	gWQU2hVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqhD-00000000JOo-3taU;
	Wed, 04 Mar 2026 18:11:43 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqhB-00000000JMi-05HN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 18:11:42 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-82746ed8cb1so3991173b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 10:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772647900; x=1773252700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/F7XmH5/hs11BL5Bv9gfwXPkKTxvFijq4nvY+SwIm9w=;
        b=VqUE1FRMQAKVZBpsEHs92R+kLUVaInRuceLucdtY4FsmyRQ+B5TfhGmtmwJxEe1je9
         8eze+PvRe5uvyyp2zmCWpDUvBfeIo81fYodh9o5fnsHZcq0WNcPWShy0u0DHtP/iIirP
         yw3MTJ5L+p3Up4+D6icTBRuCla6WbHfH0/AaHXGSuOnuzY2Xn/NY39AbRXXde9WXQ97+
         2g4aFosd/UnjvxSIXLXgwaQTj1htVNy8cyG3WUeAZFSYsxNzP1y4HWDN2SRWhzF+bKrn
         VAQj7QUDzhitnrH14MCLzk/QrpeC8GrVBFfBbYx7R8zXjXtMExS9dfxMXAjP2idwG/H3
         +UKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772647900; x=1773252700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/F7XmH5/hs11BL5Bv9gfwXPkKTxvFijq4nvY+SwIm9w=;
        b=haeSaeVsNsabNShGHgUnguJIwsWiIu01LKxX2nQQK4FwoNeHqHvgOokDD+5xZTyvX0
         07IU9cqf6ly2A6WIA045KczYxggIHy4FRi0GHguhvyuZ4LGv0P8NDBaQ7sRqpssJEVKH
         XI4jn4lZMdf2fSWaffoWiBYPTkdLPFUVFimIO3g8q++eGNMpp3MNXldhvIA4xuy3PIKs
         uc5XBT01DPc/0owp/g6HIEqc8P3rHadSpDRNaDYurXVTWv5awr89Y87QHq0YHzQ8eaKc
         VKrMbF1/tvkfruCLT7vejzZrqj7m8UE6OHKYZDMkT5uPQfTe+wAsGw1mtE/+t9Zhyat/
         KSWw==
X-Forwarded-Encrypted: i=1; AJvYcCVBik5UcXYiqeurZ/cQKyWE++Kj9tMu7G1gV/edeTr+lvNZP+eNqRd3AfbqwPUzpzPsChHiNRGxn1ZoIqjSCkOW@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4b0WhiYa8NAKjyJAvUDz0R5v5vp83Gwbrg8rUCG4xFz9U1sh7
	fcmpBC4hxMhDGpr8Po4qkx3YbYnDJ4J3050BJc7KgmvH2CRExLxr92at
X-Gm-Gg: ATEYQzxHU+tQQnCslYvYr/ctaTgGEeDRbbqBDDa4s6QpHq5OcUEC2feKP8i4C+76dhz
	DzOMvVuWuJzeMvrKBYtIrTYCCTPQGQcZJlCbuozNip64pAPASudzurJQWrxYwHgz47GU6ZBe03H
	5MPGGlrKoklXaHhOX7tzXMevbJD/irZcR7C2tXAgKggFwkNzKaNGg7f3bRNJcIEbpOz1JksBHGF
	AdZFgZkjoHscqWpTnSiDRQlt73i49LhnSaUiHYkn8pZyjbq6grFgoWe1TP51Exun5qkZaAIAt8I
	GU0D5uOvQNCWPI9FWa+0fFw4EXxZqDaKQmJIPPxcwIMDdvDisO+luaQeEKiL12vhWOUsnT15rRo
	kMW/pGtd1DWPxtZNo2vGt6DsFfXXWEJRA7zgv/LH5bo7bsLtKRF6eSpPacFjt2Q/vapK1sFqlcM
	p8zkhElZYvocaG2oUmB8R2Be0ngOH4p720SkPu7fS5bloC1aB+W0cDZflWUo5uUKx/SQ1mS7tDU
	c31+7U=
X-Received: by 2002:a05:6a00:2191:b0:81f:4675:c2a6 with SMTP id d2e1a72fcca58-82972b7584amr2427606b3a.2.1772647900198;
        Wed, 04 Mar 2026 10:11:40 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829713825efsm2503835b3a.51.2026.03.04.10.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:11:39 -0800 (PST)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 2/3] clk: mediatek: mt6795-infracfg: Switch to common probe/remove helpers
Date: Thu,  5 Mar 2026 03:10:23 +0900
Message-ID: <20260304181024.738391-3-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260304181024.738391-1-akkun11.open@gmail.com>
References: <20260304181024.738391-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_101141_069866_B16D7A98 
X-CRM114-Status: GOOD (  15.91  )
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

The MT6795 infracfg driver can use the MediaTek clock framework's common
initialization sequence. Reduce the boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt6795-infracfg.c | 70 ++++------------------
 1 file changed, 11 insertions(+), 59 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6795-infracfg.c b/drivers/clk/mediatek/clk-mt6795-infracfg.c
index e4559569f5b0..6aefc577ece5 100644
--- a/drivers/clk/mediatek/clk-mt6795-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-infracfg.c
@@ -8,7 +8,6 @@
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include "clk-cpumux.h"
 #include "clk-gate.h"
 #include "clk-mtk.h"
 #include "reset.h"
@@ -77,74 +76,27 @@ static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.rst_idx_map_nr = ARRAY_SIZE(infra_ao_idx_map),
 };
 
+static const struct mtk_clk_desc infra_desc = {
+	.clks = infra_gates,
+	.num_clks = ARRAY_SIZE(infra_gates),
+	.cpumuxes = cpu_muxes,
+	.num_cpumuxes = ARRAY_SIZE(cpu_muxes),
+	.rst_desc = &clk_rst_desc,
+};
+
 static const struct of_device_id of_match_clk_mt6795_infracfg[] = {
-	{ .compatible = "mediatek,mt6795-infracfg" },
+	{ .compatible = "mediatek,mt6795-infracfg", .data = &infra_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt6795_infracfg);
 
-static int clk_mt6795_infracfg_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	void __iomem *base;
-	int ret;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	ret = mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
-	if (ret)
-		goto free_clk_data;
-
-	ret = mtk_clk_register_gates(&pdev->dev, node, infra_gates,
-				     ARRAY_SIZE(infra_gates), clk_data);
-	if (ret)
-		goto free_clk_data;
-
-	ret = mtk_clk_register_cpumuxes(&pdev->dev, node, cpu_muxes,
-					ARRAY_SIZE(cpu_muxes), clk_data);
-	if (ret)
-		goto unregister_gates;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_cpumuxes;
-
-	return 0;
-
-unregister_cpumuxes:
-	mtk_clk_unregister_cpumuxes(cpu_muxes, ARRAY_SIZE(cpu_muxes), clk_data);
-unregister_gates:
-	mtk_clk_unregister_gates(infra_gates, ARRAY_SIZE(infra_gates), clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-	return ret;
-}
-
-static void clk_mt6795_infracfg_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_cpumuxes(cpu_muxes, ARRAY_SIZE(cpu_muxes), clk_data);
-	mtk_clk_unregister_gates(infra_gates, ARRAY_SIZE(infra_gates), clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt6795_infracfg_drv = {
 	.driver = {
 		.name = "clk-mt6795-infracfg",
 		.of_match_table = of_match_clk_mt6795_infracfg,
 	},
-	.probe = clk_mt6795_infracfg_probe,
-	.remove = clk_mt6795_infracfg_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt6795_infracfg_drv);
 
-- 
2.52.0


