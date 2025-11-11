Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4FACCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 11:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mWED5ZHC6YVU4R6qSaCsUyL9gXaZFffU+94k86o5axo=; b=SU+GnGlPWGQQUO7e9qNNq5Tyq5
	Xlu1jocokxW+gi/hU/2b2b8oZsQNEYXDv72AMGcDKdbGF+djK0NL2EN+2HZOy4H9EgylBxPyqCuHY
	UUxCbFmN881yzk84Zr4q7yT4OmIT1uvWEEHeX3u5OoA9pA8/4lpRwG4iIA4Xz3yTqs4sRPS6p6jat
	YSxfyz9tUHqdQggEmfwk8lVVbm3a9DQ/IkXOgNrM6CWCWitDA0Q28SMT6VNCfNd/vTlDX45dzIzyi
	RGvW3lmb1MV/luMolkdXnpUY1citxa4wOt3IUJOOyc29NI5OYqfuMmtlS0UlJoVRS2m40ZfCBrkGG
	xwdom83Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImlk-000000076IO-2PdR;
	Tue, 11 Nov 2025 11:42:40 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImlg-000000076H5-3S3V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 11:42:38 +0000
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowAAnLG0nIRNpxCBaAA--.18506S2;
	Tue, 11 Nov 2025 19:42:32 +0800 (CST)
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
Subject: [PATCH] clk: imx: imx95-blk-ctl: Fix clock leak in error paths
Date: Tue, 11 Nov 2025 19:41:23 +0800
Message-ID: <20251111114123.2075-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAnLG0nIRNpxCBaAA--.18506S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFWUKFWUtrykZF4fJrykGrg_yoW8AFW8pF
	WxXFySkrW0gryIgw47Aw48XFyYgay7ta48try7C3Wru393GF10qF4rtFy0q3WvyFZ5C343
	JryvqFs8ua909r7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9K14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Gw4l42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5UDGDUUUU
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAYDA2kTAhVZtQAAsL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_034237_240241_4E261F56 
X-CRM114-Status: GOOD (  10.43  )
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

Add err_disable_clk label to ensure clk_disable_unprepare() is called
on all error paths. Add pm_runtime_put_sync() in cleanup path when rpm
is enabled.

Fixes: 5224b189462f ("clk: imx: add i.MX95 BLK CTL clk driver")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/clk/imx/clk-imx95-blk-ctl.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
index 7e88877a6245..b12aded2b304 100644
--- a/drivers/clk/imx/clk-imx95-blk-ctl.c
+++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
@@ -380,13 +380,19 @@ static int imx95_bc_probe(struct platform_device *pdev)
 	}
 
 	bc_data = of_device_get_match_data(dev);
-	if (!bc_data)
-		return devm_of_platform_populate(dev);
+	if (!bc_data) {
+		ret = devm_of_platform_populate(dev);
+		if (ret)
+			clk_disable_unprepare(bc->clk_apb);
+		return ret;
+	}
 
 	clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws, bc_data->num_clks),
 				   GFP_KERNEL);
-	if (!clk_hw_data)
-		return -ENOMEM;
+	if (!clk_hw_data) {
+		ret = -ENOMEM;
+		goto err_disable_clk;
+	}
 
 	if (bc_data->rpm_enabled) {
 		devm_pm_runtime_enable(&pdev->dev);
@@ -444,7 +450,11 @@ static int imx95_bc_probe(struct platform_device *pdev)
 			continue;
 		clk_hw_unregister(hws[i]);
 	}
+	if (bc_data->rpm_enabled && pm_runtime_enabled(bc->dev))
+		pm_runtime_put_sync(&pdev->dev);
 
+err_disable_clk:
+	clk_disable_unprepare(bc->clk_apb);
 	return ret;
 }
 
-- 
2.50.1.windows.1


