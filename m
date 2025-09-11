Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB7DCAC594
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 21:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Fu4283is7k3h4AAAe1ou7JKSqtp+G1jW4YWU3i1pdQM=; b=GJ+dsCw78p7dtG
	c4VBGRVd5OtOYVDwfUfYGe4s+A8SNx++yrKvqd9h1yMUKkg5AU6BGhIzgqlRRMyHD7UGd+2eMeg2c
	4MeGaGhF4A7QQ4Z9Sp4Xau6++xJwEj5ubc68/BHdFXWWFAo6LpxwkyfY/c64ubKdtxOcwzajJ83sC
	kBgWKz5G9QLyjjSdv9vHE2iQe/UwiAuVbpUX6rwGc3W7YuOYLX5L651Kk4u0Xb7NiWSVAf15kLn76
	CB6ShnWkTmt5fvV8KkoE44xnd8VhH2Jr38LXZLcXO3NymFBaZbxJtFLyYoTVloh40sZBj016LEVoF
	Ke5NbMheFW5YQEcq2SUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpHs-00000005ZMT-00d1;
	Thu, 11 Sep 2025 21:57:04 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpHk-00000005ZIL-3oYu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 21:56:59 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uwpHd-0004g5-VH; Thu, 11 Sep 2025 23:56:49 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v2 00/10] i.MX SDMA cleanups and fixes
Date: Thu, 11 Sep 2025 23:56:41 +0200
Message-Id: <20250911-v6-16-topic-sdma-v2-0-d315f56343b5@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJpFw2gC/32NOw6DMBAFr4K2zkbGJPyq3COi8GeBLWIjm1hEi
 LvH4QApZ6Q3b4dIgSlCX+wQKHFk7zLISwFmVm4iZJsZpJB30YkKU41ljatf2GC0L4U304620lo
 0VQt5tgQaeTuTzyHzzHH14XM+pPJn/8RSiQKVabTSteyo1Y+F3PReg3e8XS3BcBzHF7H9iEO1A
 AAA
X-Change-ID: 20250903-v6-16-topic-sdma-4c8fd3bb0738
To: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jiada Wang <jiada_wang@mentor.com>
Cc: dmaengine@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_145656_952955_06D05B79 
X-CRM114-Status: GOOD (  11.32  )
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

Hi,

by this series the i.MX SDMA handling for i.MX8M devices is fixed. This
is required because these SoCs do have multiple SPBA busses.

Furthermore this series does some cleanups to prepare the driver for the
upcoming DMA devlink support. The DMA devlink support is required to fix
the consumer <-> provider issue because the current i.MX SDMA driver
doesn't honor current active DMA users once the i.MX SDMA driver is
getting removed. Which can lead into very situations e.g. hang the whole
system.

Regards,
  Marco

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Changes in v2:
- Link to v1: https://lore.kernel.org/r/20250903-v6-16-topic-sdma-v1-0-ac7bab629e8b@pengutronix.de
- Split DMA devlink support and SDMA driver fixes&cleanups into two series
- Make of_dma_controller_free() fix backportable
- Update struct sdma_channel documentation
- Shuffle patches to have fixes patches at the very start of the series
- Fix commit message wording
- Check return value of devm_add_action_or_reset()

---
Marco Felsch (10):
      dmaengine: imx-sdma: fix missing of_dma_controller_free()
      dmaengine: imx-sdma: fix spba-bus handling for i.MX8M
      dmaengine: imx-sdma: drop legacy device_node np check
      dmaengine: imx-sdma: sdma_remove minor cleanups
      dmaengine: imx-sdma: cosmetic cleanup
      dmaengine: imx-sdma: make use of devm_kzalloc for script_addrs
      dmaengine: imx-sdma: make use of devm_clk_get_prepared()
      dmaengine: imx-sdma: make use of devm_add_action_or_reset to unregiser the dma_device
      dmaengine: imx-sdma: make use of devm_add_action_or_reset to unregiser the dma-controller
      dmaengine: imx-sdma: make use of dev_err_probe()

 drivers/dma/imx-sdma.c | 181 ++++++++++++++++++++++++++-----------------------
 1 file changed, 96 insertions(+), 85 deletions(-)
---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250903-v6-16-topic-sdma-4c8fd3bb0738

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>


