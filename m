Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2A6C44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 11:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A65APZFEd7fz0qjViK+USe3yaX2qjEZnD7YJQbU3HoY=; b=hR921STdhSuAupGOuzRcaXvdAN
	KyZ9Um2vC0QTGuESmbmXXULeMGS4RuSasq7+IQaKIw2RtHX4ciW+jg3pnd4ivOKPY3TYDRCkTxkTh
	a2ozGdwXKu5W18ZD6hBMLDQwrqkcV6TtRRKmL5aBiLJCs/ihizkIdNvjdg8XbKjBnXSdlfDSr3hL8
	o2rE0PR0Rix4rWzXnOL6Nu63RSvypL8GoKtPGTeQel+wAx6DsDhNCZk8+UgrExCHKxRMQuOEi4v1z
	+TDmS1k1j72oXkTV+x+lrc44GZpdwPQl9cT27cxbl7SslDw69GcjENZI/TWo4JUL6UE3nSFQ+jJH7
	JWc8wMrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm8sN-00000009L3Q-0Frh;
	Tue, 21 Jul 2026 11:43:07 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm8sK-00000009L2w-48nQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 11:43:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35CE011A8F5;
	Tue, 21 Jul 2026 13:42:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1784634182; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=A65APZFEd7fz0qjViK+USe3yaX2qjEZnD7YJQbU3HoY=;
	b=fGjhJKjI0PWc05levVac34+6Ks9BavSELaLLgCN8mq3fV4axt1/UaPP8lDlcPkK56sECsI
	wDKScqnMVGDlz85CVrANvpdnfXOea5cIxPn/CM8H8yjfYKGufEnfpvCaSxkkZwAMyoX53u
	ASNSlxpmOIVFDaMrHfqaeWpgmzdnWYIbQy1L27FCSdMNN5423Xgk9Nm9sk9YtpTxcIwC83
	9ieitJqpn1x8eNUa0BXzcWZY5EPO3YZkqW55XI6FCjMNbJXEJVvNrm342HHNZ8Udy0QB7C
	oeL7gdscxtndxHZpEr9XkoeJNOYiPCQcKbzbC+7zxRzu2CxBoQBJz4RAsX1EBQ==
From: Heiko Schocher <hs@nabladev.com>
To: linux-kernel@vger.kernel.org
Cc: linux-fpga@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Heiko Schocher <hs@nabladev.com>,
	Michal Simek <michal.simek@amd.com>,
	Moritz Fischer <mdf@kernel.org>,
	Tom Rix <trix@redhat.com>,
	Xu Yilun <yilun.xu@intel.com>
Subject: [PATCH v2] driver: fpga: xilinx-selectmap: add csi and rdwr support
Date: Tue, 21 Jul 2026 13:42:52 +0200
Message-ID: <20260721114258.3324794-1-hs@nabladev.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_044305_249758_78870C85 
X-CRM114-Status: GOOD (  15.29  )
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

Add csi_b and rdwr pin support for the xilinx,selectmap driver.

In current driver the pins are configured from DTS and set to
GPIOD_OUT_HIGH. This works in case you have one FPGA.

Extend this to really implement csi_b and rdwr pin function in
driver, so it works with more than one FPGA.

Tested on AM625 based board with 2 FPGAs connected to GPMC.

Signed-off-by: Heiko Schocher <hs@nabladev.com>
---

Changes in v2:
- add comments from Michal
  - skip check if gpio descriptor variables csi_b/rdwr_b are valid,
    as validate_desc() checks this in gpiod_set_value() call.
  - initialize the gpio variables csi_b/rdwr_b immediately with
    the return value from devm_gpiod_get_optional(), so we can
    drop local gpio variable at all

 drivers/fpga/xilinx-selectmap.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/fpga/xilinx-selectmap.c b/drivers/fpga/xilinx-selectmap.c
index d0cbb5fdfe3a..d5175f9430e4 100644
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
@@ -30,16 +32,21 @@ static int xilinx_selectmap_write(struct xilinx_fpga_core *core,
 	struct xilinx_selectmap_conf *conf = to_xilinx_selectmap_conf(core);
 	size_t i;
 
+	gpiod_set_value(conf->csi_b, GPIOD_OUT_HIGH);
+	gpiod_set_value(conf->rdwr_b, GPIOD_OUT_HIGH);
+
 	for (i = 0; i < count; ++i)
 		writeb(buf[i], conf->base);
 
+	gpiod_set_value(conf->rdwr_b, GPIOD_OUT_LOW);
+	gpiod_set_value(conf->csi_b, GPIOD_OUT_LOW);
+
 	return 0;
 }
 
 static int xilinx_selectmap_probe(struct platform_device *pdev)
 {
 	struct xilinx_selectmap_conf *conf;
-	struct gpio_desc *gpio;
 	void __iomem *base;
 
 	conf = devm_kzalloc(&pdev->dev, sizeof(*conf), GFP_KERNEL);
@@ -56,15 +63,17 @@ static int xilinx_selectmap_probe(struct platform_device *pdev)
 	conf->base = base;
 
 	/* CSI_B is active low */
-	gpio = devm_gpiod_get_optional(&pdev->dev, "csi", GPIOD_OUT_HIGH);
-	if (IS_ERR(gpio))
-		return dev_err_probe(&pdev->dev, PTR_ERR(gpio),
+	conf->csi_b = devm_gpiod_get_optional(&pdev->dev, "csi",
+					      GPIOD_OUT_LOW);
+	if (IS_ERR(conf->csi_b))
+		return dev_err_probe(&pdev->dev, PTR_ERR(conf->csi_b),
 				     "Failed to get CSI_B gpio\n");
 
 	/* RDWR_B is active low */
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
base-commit: 58717b2a1365d06c8c64b72aa948541b53fe31eb

-- 
2.55.0


