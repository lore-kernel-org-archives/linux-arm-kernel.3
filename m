Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9303FC02185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 09:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pqz7CD0+YUuVxO5XgE8iPWSEq7xmNCrWlo8GUI5+VCE=; b=yA+fgMAuV0LATKNHNGUB8ZV0pK
	wFGcXaNAh35RkBeiD0HMKwor5lHMaUOOOWpcYFurvqXUQUr4B4BYe7d0aut4K9isSe4sA3Ih5pcdd
	OJ3SscUrRShRvN0zQMnQOSziw7suj7/7auux9N2jYKoT3nZWO5Yy48ps28U922Gtt2tszLw+mpYy2
	ve12bIT2qJq8G7W3TSKnRM+z9ZckcbHiCewqvNhTYL156CUHoAkLGpBFafzdzdBYlPp2sL7THSEXq
	kdQbDrjJSGXfaLlaAUjs6VdE4tPakfqrMs2h8OpOa1SbtVA5p4hC5ktdsprf8WkoQ1jqBMRFR1EWI
	JUJDK7KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZnlk-000000056m1-24aL;
	Mon, 20 Jan 2025 09:08:28 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZni1-000000055oO-3xcg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 09:04:40 +0000
Received: from localhost.localdomain (unknown [220.197.230.167])
	by APP-01 (Coremail) with SMTP id qwCowAA3PNB+EY5nxaJaCA--.46111S2;
	Mon, 20 Jan 2025 17:04:24 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: bcm-kernel-feedback-list@broadcom.com,
	andi.shyti@kernel.org
Cc: u.kleine-koenig@baylibre.com,
	vulab@iscas.ac.cn,
	wsa+renesas@sang-engineering.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] i2c: iproc: Remove redundant error checks for bcm_iproc_i2c_init
Date: Mon, 20 Jan 2025 17:03:34 +0800
Message-ID: <20250120090334.1705-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAA3PNB+EY5nxaJaCA--.46111S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WrWDGFy5WFWDtryfWFW3ZFb_yoW8XF1DpF
	43urn8ur48GFW0qryxGrWrZa45Zw48JFW0yrsrG3W3Ga1rJw1vy3WfGFWYvryDJayrCr13
	Xrs7tr98CayjvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUjuHq7UUUU
	U==
X-Originating-IP: [220.197.230.167]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAcIA2eN0vXKLwAAso
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_010438_372748_D5E7392A 
X-CRM114-Status: GOOD (  11.80  )
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

The bcm_iproc_i2c_init() always returns 0. As a result, there
is no need to check its return value or handle errors.

This change removes the redundant error handling code after
calls to bcm_iproc_i2c_init() in both the bcm_iproc_i2c_probe()
and bcm_iproc_i2c_resume().

Fixes: e6e5dd3566e0 ("i2c: iproc: Add Broadcom iProc I2C Driver")
Fixes: 0ee04e91eacd ("i2c: iproc: Add suspend/resume support")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 15b632a146e1..c683715093d7 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -1081,9 +1081,7 @@ static int bcm_iproc_i2c_probe(struct platform_device *pdev)
 		bcm_iproc_algo.unreg_slave = NULL;
 	}
 
-	ret = bcm_iproc_i2c_init(iproc_i2c);
-	if (ret)
-		return ret;
+	bcm_iproc_i2c_init(iproc_i2c);
 
 	ret = bcm_iproc_i2c_cfg_speed(iproc_i2c);
 	if (ret)
@@ -1169,9 +1167,7 @@ static int bcm_iproc_i2c_resume(struct device *dev)
 	 * Power domain could have been shut off completely in system deep
 	 * sleep, so re-initialize the block here
 	 */
-	ret = bcm_iproc_i2c_init(iproc_i2c);
-	if (ret)
-		return ret;
+	bcm_iproc_i2c_init(iproc_i2c);
 
 	/* configure to the desired bus speed */
 	val = iproc_i2c_rd_reg(iproc_i2c, TIM_CFG_OFFSET);
-- 
2.42.0.windows.2


