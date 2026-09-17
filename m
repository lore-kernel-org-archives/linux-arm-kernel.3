Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F30C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 10:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oVJaU+DOjRJKKPGXXVstG6aVJDRduTtQL8MJwysxqYs=; b=H7tnV4QMW/NocdYKHi6yuXo8I/
	MHQE6nETNnnFsTSMpeaITGzNYXBCK3MEt0EKquHfyuWyagfMOjC2xAJUOzHapdWl4qp2uUIoL5Mj4
	KExYjtxwwy7QBZS8BGr7vn9y6fglpT6I1gNYhE0uiqHnBBAV7BEIe4vR9Cc//Dvos1h2A41Qba9bF
	vIVdX3eUgsSkeHY63bEUylE00EP0wtmroW5CAwR8G4296B36SapzeqWbzi+UKbnsue0ETqTBQ6FJd
	hIzI0BcxsanM9dqKiD8xjogW2/sLp1LPAKgJqqfXdFRUfgh43TEFXhENmRe3O3aLHel/UFdNOAGeE
	WSKbw24g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79cG-0000000B7t3-23Kr;
	Thu, 17 Sep 2026 10:45:20 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79cD-0000000B7s4-1GCk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 10:45:18 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAB3qEK6xKtqI+R+CA--.906S2;
	Thu, 17 Sep 2026 18:45:14 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: info@gerhard-bertelsmann.de
Cc: jernej.skrabec@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	mailhol@kernel.org,
	mkl@pengutronix.de,
	mripard@kernel.org,
	samuel@sholland.org,
	wens@kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] can: sun4i_can: Fix clk leak in sun4ican_probe()
Date: Thu, 17 Sep 2026 10:45:14 +0000
Message-Id: <20260917104514.2147347-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAB3qEK6xKtqI+R+CA--.906S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy5GrWfZry5Cry5Ar18Xwb_yoW8Ar1rpF
	nYqaySkr48GFyYgwnrta10vFyYyw4IyFyakrW0kws3ZanxAr1DCFyrCFyjvF48AFWkGay5
	Ww4jyF18KFs8Z3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPvb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI
	0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4
	AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq62Iq12xI8VA0II8E6IAqYI8I648v4I1l
	FIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr4
	1l42xK82IY6x8ErcxFaVAv8VW8GFyrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s02
	6c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw
	0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvE
	c7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r4UJVWxJr1lIxAIcVC2z280aVCY1x0267AKxVW0oVCq3bIYCTnIWIevJa73UjIFyTuY
	vjxUqP8nDUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRINA2qrq01YSAABsj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_034517_714017_86FF6F3F 
X-CRM114-Status: GOOD (  11.38  )
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

In sun4ican_probe(), the clock is obtained with of_clk_get(), which
returns a reference that must be released with clk_put().  If
platform_get_irq(), devm_platform_ioremap_resource(), alloc_candev()
or register_candev() fails, the reference is never released, leaking
the clock.

Fix this by adding an exit_put_clk label that releases the clock and
jumping to it from all error paths after the of_clk_get() call.

Fixes: 0738eff14d81 ("can: Allwinner A10/A20 CAN Controller support - Kernel module")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/net/can/sun4i_can.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/can/sun4i_can.c b/drivers/net/can/sun4i_can.c
index af52285d5a4e..311526107ed8 100644
--- a/drivers/net/can/sun4i_can.c
+++ b/drivers/net/can/sun4i_can.c
@@ -854,13 +854,13 @@ static int sun4ican_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		err = -ENODEV;
-		goto exit;
+		goto exit_put_clk;
 	}
 
 	addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(addr)) {
 		err = PTR_ERR(addr);
-		goto exit;
+		goto exit_put_clk;
 	}
 
 	dev = alloc_candev(sizeof(struct sun4ican_priv), 1);
@@ -868,7 +868,7 @@ static int sun4ican_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev,
 			"could not allocate memory for CAN device\n");
 		err = -ENOMEM;
-		goto exit;
+		goto exit_put_clk;
 	}
 
 	dev->netdev_ops = &sun4ican_netdev_ops;
@@ -908,6 +908,8 @@ static int sun4ican_probe(struct platform_device *pdev)
 
 exit_free:
 	free_candev(dev);
+exit_put_clk:
+	clk_put(clk);
 exit:
 	return err;
 }
-- 
2.34.1


