Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9B0C531FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 05:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C7u7qt0q5CoQ4f3u+rALRaPoEix+wn4Qau2fUG98YwQ=; b=f8sjqTgjpy7K3MUReN2z6oXQ1Z
	zQgOIz5XtwUfR02g/BfDa13YkOKGgSaiKtcPLbQ0yvUpk3DtySN4NSAZHxyR1GP42+106+x8ggIwk
	WtbIiT/0B3m+ASRIpzPjHhq625hhtuzKXSrUjey0WJJth8OPzv3vM5MCqtX6Y4rGNt+D3NJxbwMUl
	8ESL74d1eBQ5r0A+HzSODDJ9arY0Z31AhthWDs04wv7jOCOOS0aU/aGg+64VkaPeEZLqRX0RwGs81
	HY+WeYzZzB4GuwV3BItFGd2wHyA+N473T+/56I+QIccUwIXpBdPTZe0EtN7ejLsE2aT0a/VzgFmuF
	CyEOHiyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woDnX-00000001xtn-2rZl;
	Mon, 27 Jul 2026 05:22:43 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woDnT-00000001xqj-0WgC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 05:22:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B2B4118321;
	Mon, 27 Jul 2026 07:22:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1785129746; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=C7u7qt0q5CoQ4f3u+rALRaPoEix+wn4Qau2fUG98YwQ=;
	b=EvKRMMvyeQkVrUDsdyf9MBofKMZQk5cPoCYNjZeJt45cTSlWqdEF5HwNFyAX7kBa9g5+ax
	hrG2S+8c3STQLQl96mvWFIUM0+KG52I9Ywo6aB5+5pySOzMo0/8zgjyTusPzj8p+hWSRjR
	Ij752wcUBcf9FUJWON2YXiXxACLqV2Gjm4s48wcedriTDkw659GLdlvpgUAQHqrh7Wpons
	BufOkIGwdK0HxsYvy3JTkYUJ4TE7Jg0GUF6ADtcYK/9ypjFm5hmc337lgua/q6F+DamkOj
	03j1JSEk8S+fM4MCTjKJ3HmgefxyXFvNUhADyy8Fe8csmcisHV9dIjGmENEQgg==
From: Heiko Schocher <hs@nabladev.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org,
	Heiko Schocher <hs@nabladev.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Moritz Fischer <mdf@kernel.org>,
	Tom Rix <trix@redhat.com>,
	Xu Yilun <yilun.xu@intel.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3] driver: fpga: xilinx-selectmap: add csi and rdwr support
Date: Mon, 27 Jul 2026 07:22:10 +0200
Message-ID: <20260727052218.4079979-1-hs@nabladev.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_222239_536112_A9E62701 
X-CRM114-Status: GOOD (  20.34  )
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

The current driver requests the optional CSI_B and RDWR_B GPIOs but
only configures their initial output state and never changes them
afterwards. As a result, CSI_B and RDWR_B remain inactive throughout
the configuration process.

This may work on systems with a single FPGA where these signals do not
need to be controlled by software, but it does not support systems
with multiple FPGAs sharing a SelectMAP interface.

On systems with multiple FPGAs sharing the same SelectMAP data bus,
the driver must actively control these signals during configuration.

CSI_B (Chip Select, active low) selects the target FPGA. It is asserted
before configuration data is transferred and deasserted afterwards so
that only the intended device responds to bus transactions.

RDWR_B (Read/Write, active low) controls the transfer direction on the
SelectMAP interface. A low level selects write cycles, while a high
level selects read cycles. During FPGA configuration the driver drives
RDWR_B low before transferring the bitstream and restores it to its
reading (high state) afterwards.

Store the optional GPIO descriptors and toggle both signals around the
configuration data transfer, allowing multiple FPGAs to safely share a
single SelectMAP interface.

Tested on an AM625 based board with two Xilinx FPGAs connected to the
GPMC bus.

Signed-off-by: Heiko Schocher <hs@nabladev.com>
---

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

 drivers/fpga/xilinx-selectmap.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/fpga/xilinx-selectmap.c b/drivers/fpga/xilinx-selectmap.c
index d0cbb5fdfe3a..35078206a3a3 100644
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
@@ -30,16 +32,30 @@ static int xilinx_selectmap_write(struct xilinx_fpga_core *core,
 	struct xilinx_selectmap_conf *conf = to_xilinx_selectmap_conf(core);
 	size_t i;
 
+	/*
+	 * Assert CSI_B and select write mode.
+	 *
+	 * UG570 states in note 4 in Figure "Continuous x8 SelectMAP Data
+	 * Loading", RDWR_B should be asserted before CSI_B to avoid
+	 * causing an ABORT on the next CCLK.
+	 *
+	 * To be sure, set first RDWR_B pin before activate CSI_B
+	 */
+	gpiod_set_value(conf->rdwr_b, 1);
+	gpiod_set_value(conf->csi_b, 1);
+
 	for (i = 0; i < count; ++i)
 		writeb(buf[i], conf->base);
 
+	gpiod_set_raw_value(conf->csi_b, 0);
+	gpiod_set_raw_value(conf->rdwr_b, 0);
+
 	return 0;
 }
 
 static int xilinx_selectmap_probe(struct platform_device *pdev)
 {
 	struct xilinx_selectmap_conf *conf;
-	struct gpio_desc *gpio;
 	void __iomem *base;
 
 	conf = devm_kzalloc(&pdev->dev, sizeof(*conf), GFP_KERNEL);
@@ -56,15 +72,17 @@ static int xilinx_selectmap_probe(struct platform_device *pdev)
 	conf->base = base;
 
 	/* CSI_B is active low */
-	gpio = devm_gpiod_get_optional(&pdev->dev, "csi", GPIOD_OUT_HIGH);
-	if (IS_ERR(gpio))
-		return dev_err_probe(&pdev->dev, PTR_ERR(gpio),
+	conf->csi_b = devm_gpiod_get_optional(&pdev->dev, "csi",
+					      GPIOD_OUT_HIGH);
+	if (IS_ERR(conf->csi_b))
+		return dev_err_probe(&pdev->dev, PTR_ERR(conf->csi_b),
 				     "Failed to get CSI_B gpio\n");
 
 	/* RDWR_B is active low */
-	gpio = devm_gpiod_get_optional(&pdev->dev, "rdwr", GPIOD_OUT_HIGH);
-	if (IS_ERR(gpio))
-		return dev_err_probe(&pdev->dev, PTR_ERR(gpio),
+	conf->rdwr_b = devm_gpiod_get_optional(&pdev->dev, "rdwr",
+					       GPIOD_OUT_HIGH);
+	if (IS_ERR(conf->rdwr_b))
+		return dev_err_probe(&pdev->dev, PTR_ERR(conf->rdwr_b),
 				     "Failed to get RDWR_B gpio\n");
 
 	return xilinx_core_probe(&conf->core);
---
base-commit: 58717b2a1365d06c8c64b72aa948541b53fe31eb

-- 
2.55.0


