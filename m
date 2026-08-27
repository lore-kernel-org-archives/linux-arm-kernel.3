Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503D6C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 15:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:To:From
	:Cc:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tD7GuzBUX3nmgWtzY2TDrWC7XWIHAdLF+AgXdDtgONY=; b=y8W/1Y1V0Ov636BRWiaM0txjEU
	Hehsa3SSohuwahaW0npTjFOfhHHLqnE5dRXjx2VkXrUh+FUyocXwy76UfCEos7AKUj5KFNvJ3VCY9
	41zesxnp/I+6yeuwjGwB7+LM3itM9Dv0W+rM8w3Hc8dXH7Tah/HypcP267Y1wKctiYi+rv3CAiLAt
	bOBaW/ADWtGFpEkCyoW3TQJhRV8wULmTV7YZS/54Q09S2bgZDxdbpgdmt/gV77PEASpEjt6gozDGU
	PI4YcsLObOUOFPGE68ilJ9WiukfnHy721/UOHyvF7bmRXD+B3vXMXMSt+YbjgOEeMXzHVMGq5hr+t
	n5RdqkEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcGQ-00000004Gkd-3nsp;
	Thu, 27 Aug 2026 15:43:38 +0000
Received: from sg-2-3.ptr.blmpb.com ([71.18.227.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcGE-00000004Ghc-2OLi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 15:43:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1787845393; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=tD7GuzBUX3nmgWtzY2TDrWC7XWIHAdLF+AgXdDtgONY=;
 b=cQlOX5YZUnsizO0yBXOAmOLHnoBlYJeyupTMPXSqzJvAfekWhSe4tL2abr0QDSV0Db8joO
 a3SLcT+yY9IW8KdWTpHPSwI9Ym0oPh5gBzjpuyWyE0hoXU/FY3EP++JY3WlXQepbwW7aQh
 G154Ld2hi7qM3fzvS5aPvEcBZkdT8OMXUFs84DytcSYwrst/+uCnNMYkiloWsUB4xTOuUJ
 zMeJkPMkRO0LOTUfec+T9c2acwbphfsUOq6fQwQ7DkdTDRFgslzdLgu3/82jTh+T4HNzc3
 el/Kmdewud5/DBfrSvUPW8WXeMJ5XJL6d+PFBWWeBdaeAdrBbecQV+fsWI5TjQ==
Date: Thu, 27 Aug 2026 23:43:01 +0800
Received: from [192.168.9.107] ([111.42.148.163]) by smtp.feishu.cn with ESMTPS; Thu, 27 Aug 2026 23:43:11 +0800
Cc: <linux-i2c@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>, 
	<linux-arm-msm@vger.kernel.org>, <stable@vger.kernel.org>, 
	"Shengzhuo Wei" <me@cherr.cc>
From: "Shengzhuo Wei" <me@cherr.cc>
X-Lms-Return-Path: <lba+26a905b10+594250+lists.infradead.org+me@cherr.cc>
X-Original-From: Shengzhuo Wei <me@cherr.cc>
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
Message-Id: <20260827-i2c-dma-channel-leak-v1-1-271d4adc03a0@cherr.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
Subject: [PATCH 1/3] i2c: at91: release DMA channels on remove and probe error
In-Reply-To: <20260827-i2c-dma-channel-leak-v1-0-271d4adc03a0@cherr.cc>
Content-Type: text/plain; charset=UTF-8
References: <20260827-i2c-dma-channel-leak-v1-0-271d4adc03a0@cherr.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_084326_808320_D47B8869 
X-CRM114-Status: GOOD (  12.66  )
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

at91_twi_configure_dma() requests exclusive tx/rx DMA channels, but
nothing ever releases them on driver detach, and the probe error path
after the channels are acquired (i2c_add_numbered_adapter() failure)
returns without releasing them either, because the remove callback is
not invoked after a failed probe.

Move the release into a helper, call it from the existing
configure-failure path, the adapter-registration failure path, and
at91_twi_remove().

Fixes: 60937b2cdbf9 ("i2c: at91: add dma support")
Cc: stable@vger.kernel.org
Signed-off-by: Shengzhuo Wei <me@cherr.cc>
Assisted-by: GLM:5.3
---
 drivers/i2c/busses/i2c-at91-core.c   |  3 +++
 drivers/i2c/busses/i2c-at91-master.c | 12 +++++++++++-
 drivers/i2c/busses/i2c-at91.h        |  1 +
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at91-core.c
index b64adef778d4..8ca4556d9664 100644
--- a/drivers/i2c/busses/i2c-at91-core.c
+++ b/drivers/i2c/busses/i2c-at91-core.c
@@ -255,6 +255,7 @@ static int at91_twi_probe(struct platform_device *pdev)
 	if (rc) {
 		pm_runtime_disable(dev->dev);
 		pm_runtime_set_suspended(dev->dev);
+		at91_twi_dma_release(dev);
 
 		return rc;
 	}
@@ -270,6 +271,8 @@ static void at91_twi_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&dev->adapter);
 
+	at91_twi_dma_release(dev);
+
 	pm_runtime_disable(dev->dev);
 	pm_runtime_set_suspended(dev->dev);
 }
diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index 894cedbca99f..68238cc8aee0 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -817,11 +817,21 @@ static int at91_twi_configure_dma(struct at91_twi_dev *dev, u32 phy_addr)
 error:
 	if (ret != -EPROBE_DEFER)
 		dev_info(dev->dev, "can't get DMA channel, continue without DMA support\n");
+	at91_twi_dma_release(dev);
+	return ret;
+}
+
+void at91_twi_dma_release(struct at91_twi_dev *dev)
+{
+	struct at91_twi_dma *dma = &dev->dma;
+
 	if (dma->chan_rx)
 		dma_release_channel(dma->chan_rx);
 	if (dma->chan_tx)
 		dma_release_channel(dma->chan_tx);
-	return ret;
+	dma->chan_rx = NULL;
+	dma->chan_tx = NULL;
+	dev->use_dma = false;
 }
 
 static int at91_init_twi_recovery_gpio(struct platform_device *pdev,
diff --git a/drivers/i2c/busses/i2c-at91.h b/drivers/i2c/busses/i2c-at91.h
index 942e9c3973bb..d68fcbbc3e0f 100644
--- a/drivers/i2c/busses/i2c-at91.h
+++ b/drivers/i2c/busses/i2c-at91.h
@@ -172,6 +172,7 @@ void at91_twi_irq_restore(struct at91_twi_dev *dev);
 void at91_init_twi_bus(struct at91_twi_dev *dev);
 
 void at91_init_twi_bus_master(struct at91_twi_dev *dev);
+void at91_twi_dma_release(struct at91_twi_dev *dev);
 int at91_twi_probe_master(struct platform_device *pdev, u32 phy_addr,
 			  struct at91_twi_dev *dev);
 

-- 
2.47.3

