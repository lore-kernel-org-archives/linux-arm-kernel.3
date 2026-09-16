Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AD7C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1N8/KVAqOCQAD4EiIZyR8heh+iQu7kAXIa7beDEF1s=; b=KIhN78SqoapRTqg+1aFCvvo9U4
	w78lGOlBX2zYtlW1ds0Ua3QKD+naEBB5y8NKkpBp+voCTnleyZUQjU/G32T3NvrQlQbgCbFnK3ai+
	N3YNQ0V5I3/jZpDWzbv8ulKSaOKoJcO2LQkMrvlkI2pZU3neYhz/ju3nzNq4ZYsEvDkmaBgxo1+wX
	vZADC0/HbThEdQ8Kih+XhW57znkZLcYgZ3od7W4uFVlLZsltzfA+7bIE6aAC4kGAZPkdj4uY7jh6q
	jy5EP/4iPUQWI9aTg3kkXu/twN5GCaToWYU0NKiksbmyb6WG+spWrbJH2tKGqS7rXXdrXMSS5JUmg
	9aj+QzAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rH7-00000009W6D-2hLF;
	Wed, 16 Sep 2026 15:10:17 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rGk-00000009VqM-3JLM;
	Wed, 16 Sep 2026 15:09:56 +0000
X-PTX-Original-Recipient: ezequiel@vanguardiasur.com.ar
X-PTX-Original-Recipient: jacob-chen@iotwrt.com
X-PTX-Original-Recipient: mchehab@kernel.org
X-PTX-Original-Recipient: detlev.casanova@collabora.com
X-PTX-Original-Recipient: heiko@sntech.de
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-PTX-Original-Recipient: linux-rockchip@lists.infradead.org
X-PTX-Original-Recipient: lgs201920130244@gmail.com
X-PTX-Original-Recipient: p.zabel@pengutronix.de
X-PTX-Original-Recipient: kernel@pengutronix.de
X-PTX-Original-Recipient: s.pueschel@pengutronix.de
X-PTX-Original-Recipient: m.tretter@pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E87682059F3;
	Wed, 16 Sep 2026 17:09:49 +0200 (CEST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1x6rGf-001Fsx-2g;
	Wed, 16 Sep 2026 17:09:49 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 16 Sep 2026 17:09:46 +0200
Subject: [PATCH v2 05/17] media: rockchip: rga: use devres version of
 pm_runtime_enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260916-spu-rga3multicore-v2-5-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
In-Reply-To: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Guangshuo Li <lgs201920130244@gmail.com>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_080955_289179_F90B75BF 
X-CRM114-Status: GOOD (  13.58  )
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

Use the devres version of pm_runtime_enable named
devm_pm_runtime_enable to ease up the cleanup handling. Also it avoids
having a mixed cleanup order due to the following
devm_platform_ioremap_resource being cleaned up anyways after the probe
function has returned.

This also changes some dev_err calls to dev_err_probe for convenient
returning. This may not print these messages in the error case, as
dev_err_probe may handle them differently based on the error (e.g.
ENOMEM won't be printed).

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

---
v2
- added
---
 drivers/media/platform/rockchip/rga/rga.c | 34 +++++++++++--------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 8c03422d669cf..d7f0712177b70 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -797,37 +797,31 @@ static int rga_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Unable to parse OF data\n");
 
-	pm_runtime_enable(rga->dev);
+	ret = devm_pm_runtime_enable(rga->dev);
+	if (ret)
+		return ret;
 
 	rga->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(rga->regs)) {
-		ret = PTR_ERR(rga->regs);
-		goto err_put_clk;
-	}
+	if (IS_ERR(rga->regs))
+		return PTR_ERR(rga->regs);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		ret = irq;
-		goto err_put_clk;
-	}
+	if (irq < 0)
+		return irq;
 
 	ret = devm_request_irq(rga->dev, irq, rga_isr,
 			       rga_has_internal_iommu(rga) ? 0 : IRQF_SHARED,
 			       dev_name(rga->dev), rga);
-	if (ret < 0) {
-		dev_err(rga->dev, "failed to request irq\n");
-		goto err_put_clk;
-	}
+	if (ret < 0)
+		return dev_err_probe(rga->dev, ret, "failed to request irq\n");
 
 	ret = dma_set_mask_and_coherent(rga->dev, DMA_BIT_MASK(32));
-	if (ret) {
-		dev_err(rga->dev, "32-bit DMA not supported");
-		goto err_put_clk;
-	}
+	if (ret)
+		dev_err_probe(rga->dev, ret, "32-bit DMA not supported");
 
 	ret = v4l2_device_register(&pdev->dev, &rga->v4l2_dev);
 	if (ret)
-		goto err_put_clk;
+		return ret;
 	vfd = video_device_alloc();
 	if (!vfd) {
 		v4l2_err(&rga->v4l2_dev, "Failed to allocate video device\n");
@@ -877,8 +871,6 @@ static int rga_probe(struct platform_device *pdev)
 	video_device_release(vfd);
 unreg_v4l2_dev:
 	v4l2_device_unregister(&rga->v4l2_dev);
-err_put_clk:
-	pm_runtime_disable(rga->dev);
 
 	return ret;
 }
@@ -892,8 +884,6 @@ static void rga_remove(struct platform_device *pdev)
 	v4l2_m2m_release(rga->m2m_dev);
 	video_unregister_device(rga->vfd);
 	v4l2_device_unregister(&rga->v4l2_dev);
-
-	pm_runtime_disable(rga->dev);
 }
 
 static int __maybe_unused rga_runtime_suspend(struct device *dev)

-- 
2.55.0


