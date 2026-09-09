Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30AFC79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 11:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=28+tS5v65uWT+cVCLYpey7OWF1AIlpH8iHS77EHvEPc=; b=rt8Y91ZQ9ExNOGhlzmnUJdmW5a
	uU7dqUf2XK4nLiO/kp9q9fqqIGGd3rC0qOR/kC0Ty2dbEmcTeV3FIe/1KGNKmxgTuRM179cvYRf9O
	0kMSBEDWhjcOQBmd2VuDeQkeDPI+XO+216dkTflYqyrlNbfZpmqHb/XHgiJiR79IKFiBX+v0J1PE3
	I1kncnnOxtc23/GrjxWaWdDdS9eZkVp2ZxmWlu1eq20NQUCzGgr4aTeDV44gFIWxu/MYeOPokT887
	DKENcwL3a1up1uVs8lNMKyFPKu03obqAxhEHCyFxyfLJOkpxYSlPTS+mjaeD/+XF4Xk5NHuLIv6ZP
	tSlSqf8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4GNl-0000000BYRq-3NwL;
	Wed, 09 Sep 2026 11:22:25 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4GNi-0000000BYQI-378j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 11:22:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D26C7101CAC;
	Wed, 09 Sep 2026 13:22:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788952931; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=28+tS5v65uWT+cVCLYpey7OWF1AIlpH8iHS77EHvEPc=;
	b=KIa426UF56JJ8yp3vzHjZKETyca4QluEYWvBpe+2TIMB8ORPMN+mjJbGWHnFndW3Io2of6
	NLzSAF/DSFaESj9xB8RnnPzlIVmgvOL+Od8a+FJpkYtC8+QaFY0AvkSwP7pRUSd+qC5yzH
	LoZ8AuSKW3aMzmm7SqWa/L9oVgMIqTN9+UsYzudrAnKFXrd10tjiMalq1OC1WxLm9SkQ2s
	wZQEG5CBSiyQ4GF7cH1DbK5MskXrVlVunImnF/fYW8EQokY74bSJzaawSJBv17RMVhMc3N
	itz4BKvbLYUeuV5movbygMN6541TDvbOXwAXXny5TSGJiMS9t7KpkqSCE+9X2g==
From: Heiko Schocher <hs@nabladev.com>
To: linux-kernel@vger.kernel.org
Cc: linux-fpga@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Heiko Schocher <hs@nabladev.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Moritz Fischer <mdf@kernel.org>,
	Tom Rix <trix@redhat.com>,
	Xu Yilun <yilun.xu@intel.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v5] fpga: xilinx-selectmap: control CSI_B and RDWR_B during configuration
Date: Wed,  9 Sep 2026 13:21:54 +0200
Message-ID: <20260909112200.13256-1-hs@nabladev.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_042223_145107_1BC7848E 
X-CRM114-Status: GOOD (  28.37  )
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

The driver requests the optional CSI_B and RDWR_B GPIOs with
GPIOD_OUT_HIGH and never touches them again. That flag carries a
logical value, so both signals end up asserted from probe on, whatever
polarity the device tree states, and they stay asserted for the
lifetime of the device.

Neither signal belongs to the driver's lifetime. CSI_B (Chip Select)
selects the device on the SelectMAP port, RDWR_B (Read/Write) selects
the transfer direction, so both belong to the data transfer. A device
that is never deselected never lets go of the port, and a port pinned
to write mode cannot be read back.

Keep the two descriptors in the driver private data, request them
deasserted, and assert them only around the configuration data
transfer. RDWR_B is asserted first, UG470 describes in chapter
"SelectMAP ABORT" that changing it while the device is selected aborts
the configuration on the next CCLK.

Signed-off-by: Heiko Schocher <hs@nabladev.com>
---

Changes in v5:
- comments from Xu Yilun
  - drop the "inactive or active" wording. The old code asserts both
    signals on every board, the polarity in the DTS does not change
    that, it only changes the electrical level.
  - write the commit message around the actual defect: both signals are
    asserted from probe on and never touched again. It no longer argues
    that this is fine for a single FPGA, because it is not, and it no
    longer leads with two FPGAs on one bus, which made the change look
    larger than it is.
  - drop "active low" from the comments in probe. The gpiod flags and
    gpiod_set_value() take logical values, so the driver does not deal
    with the polarity at all, and saying "active low" next to
    GPIOD_OUT_LOW only makes confusion.
- use the subsystem prefix "fpga:" in the subject, as the rest of
  drivers/fpga/ does
- point at UG470 instead of UG570, as the driver is for 7 Series parts and
  UG570 is the UltraScale manual! In UG470 there is an own chapter which
  describes the "selectMAP ABORT", so refer this chapter.

Changes in v4:
- add comments from Xu Yulin
  replace wrong gpiod_set_raw_value() with gpiod_set_value()
  deassert CSI_B and RDWR_B in probe as in patch version 2
  rework commit message (correct the description what current
  driver do on probe), why this is not a problem with one
  FPGA, and why it needs a change if you have N FPGAs
  sharing the same selectmap Interface (clk and data pins).

Changes in v3:
- use 0 (deasserted state) and 1 (asserted state) in gpio_set_value()
  as commented from Micahl
- rewrite commit message as requested from Xu Yilun
  - describe what rdwr_b and csi_b do, and why this change is needed
    for more than one FPGA.
- add comment before asserting the signals, why they are asserted
  in this order.

Changes in v2:
- add comments from Michal
  - skip check if gpio descriptor variables csi_b/rdwr_b are valid,
    as validate_desc() checks this in gpiod_set_value() call.
  - initialize the gpio variables csi_b/rdwr_b immediately with
    the return value from devm_gpiod_get_optional(), so we can
    drop local gpio variable at all

 drivers/fpga/xilinx-selectmap.c | 39 +++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/fpga/xilinx-selectmap.c b/drivers/fpga/xilinx-selectmap.c
index d0cbb5fdfe3a..ff167b23fded 100644
--- a/drivers/fpga/xilinx-selectmap.c
+++ b/drivers/fpga/xilinx-selectmap.c
@@ -19,6 +19,8 @@
 struct xilinx_selectmap_conf {
 	struct xilinx_fpga_core core;
 	void __iomem *base;
+	struct gpio_desc *csi_b;
+	struct gpio_desc *rdwr_b;
 };
 
 #define to_xilinx_selectmap_conf(obj) \
@@ -30,16 +32,28 @@ static int xilinx_selectmap_write(struct xilinx_fpga_core *core,
 	struct xilinx_selectmap_conf *conf = to_xilinx_selectmap_conf(core);
 	size_t i;
 
+	/*
+	 * Select this device and put its SelectMAP port into write mode.
+	 *
+	 * RDWR_B is set before CSI_B. UG470 describes in chapter
+	 * "SelectMAP ABORT" that changing RDWR_B while the device is
+	 * selected aborts the configuration on the next CCLK.
+	 */
+	gpiod_set_value(conf->rdwr_b, 1);
+	gpiod_set_value(conf->csi_b, 1);
+
 	for (i = 0; i < count; ++i)
 		writeb(buf[i], conf->base);
 
+	gpiod_set_value(conf->csi_b, 0);
+	gpiod_set_value(conf->rdwr_b, 0);
+
 	return 0;
 }
 
 static int xilinx_selectmap_probe(struct platform_device *pdev)
 {
 	struct xilinx_selectmap_conf *conf;
-	struct gpio_desc *gpio;
 	void __iomem *base;
 
 	conf = devm_kzalloc(&pdev->dev, sizeof(*conf), GFP_KERNEL);
@@ -55,16 +69,23 @@ static int xilinx_selectmap_probe(struct platform_device *pdev)
 				     "ioremap error\n");
 	conf->base = base;
 
-	/* CSI_B is active low */
-	gpio = devm_gpiod_get_optional(&pdev->dev, "csi", GPIOD_OUT_HIGH);
-	if (IS_ERR(gpio))
-		return dev_err_probe(&pdev->dev, PTR_ERR(gpio),
+	/*
+	 * Request both signals deasserted, so a device sharing the SelectMAP
+	 * bus with others stays off that bus until its bitstream is written.
+	 *
+	 * The value in the gpiod flags is logical, gpiolib drives the line
+	 * high for GPIOD_OUT_LOW when the firmware describes it active low.
+	 */
+	conf->csi_b = devm_gpiod_get_optional(&pdev->dev, "csi",
+					      GPIOD_OUT_LOW);
+	if (IS_ERR(conf->csi_b))
+		return dev_err_probe(&pdev->dev, PTR_ERR(conf->csi_b),
 				     "Failed to get CSI_B gpio\n");
 
-	/* RDWR_B is active low */
-	gpio = devm_gpiod_get_optional(&pdev->dev, "rdwr", GPIOD_OUT_HIGH);
-	if (IS_ERR(gpio))
-		return dev_err_probe(&pdev->dev, PTR_ERR(gpio),
+	conf->rdwr_b = devm_gpiod_get_optional(&pdev->dev, "rdwr",
+					       GPIOD_OUT_LOW);
+	if (IS_ERR(conf->rdwr_b))
+		return dev_err_probe(&pdev->dev, PTR_ERR(conf->rdwr_b),
 				     "Failed to get RDWR_B gpio\n");
 
 	return xilinx_core_probe(&conf->core);
---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58

-- 
2.55.0


