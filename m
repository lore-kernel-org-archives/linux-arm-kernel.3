Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD0FC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 15:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:
	Content-Transfer-Encoding:Message-Id:Subject:From:To:In-Reply-To:Date:
	References:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t4JSPZHi9ydke9/rPPt+tNOeEYeI6jSjT/5oE9D+9xI=; b=IHwwaH1qTNbAYexZrCrOJ2I/DQ
	y7mlE8vJ4Bq655WryyYB+54+c5N5W9SAN9BPRrMsnvgVJPPsOLh0edVw9HfzqDb0CYCpjxdYu5iNz
	IR0ZSXA24qGK8xlXJCc7DdEdy38fTaXKRsktaPPtxxRaxAi0U1dmZtdxtHLW3dlMEarDDzApIkCqB
	9ZeD48a/ojFPyxxwIurDvH/ZiNgcnksSehYW1W2429+zwfVpregtTJhC0kMQbMgpsRCUyD3AjmAkT
	xVp6uNhqVhmXuFjyHwqSv4Lcg4DTO4cwG+Ft9FatWmpR7rMUaR9vEffJtnUhEi8qTodXMz8VhHNxv
	WM/pVPMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcGG-00000004Gj2-32Ze;
	Thu, 27 Aug 2026 15:43:28 +0000
Received: from sg-2-1.ptr.blmpb.com ([71.18.227.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcGE-00000004Ghd-0WH0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 15:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1787845396; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=t4JSPZHi9ydke9/rPPt+tNOeEYeI6jSjT/5oE9D+9xI=;
 b=spdOKRzXbQHQxQh/Y7D8+9kzXcXo4tN2qoGCYbRuYSuSucv0YbkeTMhCrv1WZ2Xc72QQBS
 9wAJ1a27Z8tnGiTf6z0Y+e7VWUJi5A3cVlTLmiKwccNnXAyKquy9LJgrZGH5byOM/HI85A
 c2FqHzjobhy4Oi3LTeg495EO3xNvDLC9IzgY52AdmHCTNYQDDWmtNAzzRUkAAUepHndx1m
 elT5+TX4BdZn85gbOxT6vc5aG/HEcP0FB0S0kwnA7ymBxxKr7eRmUYZYQKF1AuMCRrWAGL
 c4gT7U7CTWB1jHWeJclCcEegGXGqLPGFx5VfxIEb8PXDDijlMLRLMzt/jWzgbg==
Received: from [192.168.9.107] ([111.42.148.163]) by smtp.feishu.cn with ESMTPS; Thu, 27 Aug 2026 23:43:13 +0800
Mime-Version: 1.0
X-Original-From: Shengzhuo Wei <me@cherr.cc>
References: <20260827-i2c-dma-channel-leak-v1-0-271d4adc03a0@cherr.cc>
Date: Thu, 27 Aug 2026 23:43:02 +0800
X-Lms-Return-Path: <lba+26a905b12+5cb819+lists.infradead.org+me@cherr.cc>
In-Reply-To: <20260827-i2c-dma-channel-leak-v1-0-271d4adc03a0@cherr.cc>
To: "Codrin Ciubotariu" <codrin.ciubotariu@microchip.com>, 
	"Andi Shyti" <andi.shyti@kernel.org>, 
	"Nicolas Ferre" <nicolas.ferre@microchip.com>, 
	"Alexandre Belloni" <alexandre.belloni@bootlin.com>, 
	"Claudiu Beznea" <claudiu.beznea@tuxon.dev>, 
	"Wolfram Sang" <wsa@kernel.org>, 
	"Ludovic Desroches" <ludovic.desroches@atmel.com>, 
	"Oleksij Rempel" <o.rempel@pengutronix.de>, 
	"Pengutronix Kernel Team" <kernel@pengutronix.de>, 
	"Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, 
	"Fabio Estevam" <festevam@gmail.com>, 
	"Yao Yuan" <yao.yuan@freescale.com>, 
	"Mukesh Kumar Savaliya" <mukesh.savaliya@oss.qualcomm.com>, 
	"Viken Dadhaniya" <viken.dadhaniya@oss.qualcomm.com>, 
	"Bjorn Andersson" <andersson@kernel.org>, 
	"Vinod Koul" <vkoul@kernel.org>, 
	"Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, 
	"Praveen Talari" <praveen.talari@oss.qualcomm.com>
From: "Shengzhuo Wei" <me@cherr.cc>
Subject: [PATCH 2/3] i2c: imx: release DMA channels on probe error
Message-Id: <20260827-i2c-dma-channel-leak-v1-2-271d4adc03a0@cherr.cc>
X-Mailer: b4 0.16.0
Content-Transfer-Encoding: 7bit
Cc: <linux-i2c@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>, 
	<linux-arm-msm@vger.kernel.org>, <stable@vger.kernel.org>, 
	"Shengzhuo Wei" <me@cherr.cc>
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_084326_344623_B5FCA19A 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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

i2c_imx_dma_request() acquires exclusive tx/rx DMA channels and is
optional: on errors other than -EPROBE_DEFER the driver falls back to
PIO mode and probe continues. If i2c_add_numbered_adapter() then fails,
probe returns through clk_notifier_unregister without releasing the
channels, because the remove callback is not invoked after a failed
probe.

Release the channels on the probe error path, mirroring
i2c_imx_remove().

Fixes: ce1a78840ff7 ("i2c: imx: add DMA support for freescale i2c driver")
Cc: stable@vger.kernel.org
Signed-off-by: Shengzhuo Wei <me@cherr.cc>
Assisted-by: GLM:5.3
---
 drivers/i2c/busses/i2c-imx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 19ec056b00af..c24d9201a60e 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1880,6 +1880,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
 
 clk_notifier_unregister:
 	clk_notifier_unregister(i2c_imx->clk, &i2c_imx->clk_change_nb);
+	if (i2c_imx->dma)
+		i2c_imx_dma_free(i2c_imx);
 	free_irq(irq, i2c_imx);
 rpm_disable:
 	pm_runtime_put_noidle(&pdev->dev);

-- 
2.47.3

