Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D187C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 16:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IC1blj73HAZcWd10bZmMNG4oNg4vfUFMXx2D2wzeNJ8=; b=QP62CW7LkAuCW2MsbdCQTTyp8t
	tQ4aO2CeEiJU6uNF2VajXgu6JTTmHucKsdF1NoC27dXdnVCH7wGKQt+Y41lCPGvH7kOZ5JeX2YXMx
	sjmjT/Mo6ZW+uQGUBea6jOV2dQO82d8G64jL4MoPNKmeEvmJne+FLC1xURke8S+WFcr9dXJatakSm
	FrbWbPrzJNUnDXK/El0FhkFiSYgGRzDuQO7bC9A3XwSMcE49QBeWMqxq7rVZwOUdXXxjsoP/0YIy/
	bBcr0BU3cnJzrmpbCH4jP5Ax/fG6KMD880jp5cm6r+ShnGWR1chntofgWl++VXyUQs64Uqj4MyKb0
	bEEEOeEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6s6G-00000009gPB-3fWy;
	Wed, 16 Sep 2026 16:03:08 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6s6D-00000009gOh-3Ywf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 16:03:07 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowACXAz63vapqO1BtCA--.21364S2;
	Thu, 17 Sep 2026 00:03:03 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maxime.coquelin@st.com,
	patrice.chotard@foss.st.com,
	wsa@kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] i2c: st: Fix clock reference leak in st_i2c_probe()
Date: Wed, 16 Sep 2026 16:02:35 +0000
Message-Id: <20260916160235.2080462-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACXAz63vapqO1BtCA--.21364S2
X-Coremail-Antispam: 1UD129KBjvJXoW7urWkJr43ZF4kAFWkKF48WFg_yoW8ZF4DpF
	4UWa90kFWUKFs0gr47Jw4jva4Y9ayIg3y5KFWSkwn7uas8X34DXFyfJFya9FWrArWkGanr
	Ja1DtayxAF18ZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JV
	W8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
	Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbtxhJ
	UUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgYMA2qqok9GyQAAst
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_090306_246264_635F3AF7 
X-CRM114-Status: GOOD (  11.11  )
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

The clock obtained with of_clk_get_by_name() is never released: the
probe error paths after it, irq request failure, deglitch setup
failure and adapter registration failure, return without clk_put(),
and st_i2c_remove() does not drop the reference either.

Add a cleanup label that drops the clock reference on the probe error
paths and release the reference in the remove path.

Fixes: 85b4fab26960 ("i2c: i2c-st: Add ST I2C controller")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/i2c/busses/i2c-st.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 751ea421caaf..2049bbce3656 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -831,7 +831,7 @@ static int st_i2c_probe(struct platform_device *pdev)
 			IRQF_ONESHOT, pdev->name, i2c_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to request irq %i\n", i2c_dev->irq);
-		return ret;
+		goto err_clk;
 	}
 
 	pinctrl_pm_select_default_state(i2c_dev->dev);
@@ -840,7 +840,7 @@ static int st_i2c_probe(struct platform_device *pdev)
 
 	ret = st_i2c_of_get_deglitch(np, i2c_dev);
 	if (ret)
-		return ret;
+		goto err_clk;
 
 	adap = &i2c_dev->adap;
 	i2c_set_adapdata(adap, i2c_dev);
@@ -857,13 +857,17 @@ static int st_i2c_probe(struct platform_device *pdev)
 
 	ret = i2c_add_adapter(adap);
 	if (ret)
-		return ret;
+		goto err_clk;
 
 	platform_set_drvdata(pdev, i2c_dev);
 
 	dev_info(i2c_dev->dev, "%s initialized\n", adap->name);
 
 	return 0;
+
+err_clk:
+	clk_put(i2c_dev->clk);
+	return ret;
 }
 
 static void st_i2c_remove(struct platform_device *pdev)
@@ -871,6 +875,7 @@ static void st_i2c_remove(struct platform_device *pdev)
 	struct st_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&i2c_dev->adap);
+	clk_put(i2c_dev->clk);
 }
 
 static const struct of_device_id st_i2c_match[] = {
-- 
2.34.1


