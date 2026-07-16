Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22F3C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 07:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cOYOG/tMAZHpsl9rtrAkayAE0wym5RSRRAJN5onSY2w=; b=dv7ew4SNYPZLTSUY1OtZwO4MyM
	MyO6c5oIdV0/AxmQyJVNmvrSV0p8T38eoJNGNd4oGj8yYRXiVc+TJeLBS2qGJEJIkGpa0Vk3HGqP2
	Pt+1W6B0bKSqtwKTG0wKkCnDMIFHT8JTJh5U5E2GmiDHp8vHI+gjFskLw4i26ebERuex4Cjd8cr9N
	lUn1gaYUKHq9LCfYlhIbbsR1Njjo0liNOmDOOHJmrQuPAr7iBQiizEoxV8v+lEUnwPjvRunHKCpb0
	W2jJB1c2ca0HFduq8aNxWCSES3/Hxk7Joa8XiiZe0D4rwUQHL/pfCtacm4sMAUQHg4R10t7KbMpbf
	lNFedRaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkG5A-0000000GbTE-1HzE;
	Thu, 16 Jul 2026 07:00:32 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkG58-0000000GbS8-0VFv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 07:00:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 07BD1119C5F;
	Thu, 16 Jul 2026 09:00:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1784185224; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=cOYOG/tMAZHpsl9rtrAkayAE0wym5RSRRAJN5onSY2w=;
	b=Tdubegq3tanEWXYpwbVKOYIneplybv/vKqf6RUiDSA6QfvLeWnzmZ2ErsskzG9EpmqO/M4
	jrHJZu4L2ztrJW8eeHR7OQv1r4RugSUoRctiNNVlmCx6FSHV4v1fX/S54F5slOgOo15CNQ
	OAtCJZzSbVbBGvFAIFqasqoZnreu1LR5YT+eEe2moWC5KjbZrUp0ikhqBQ0qftvcPLa3Z+
	M1VdNbjMEvVlk0q/FufJaqcKDSlYzDvtEFzoDFyB5bE5yaoGtfPopQQamsugKuCs1ub6jQ
	9uPrG0jRDnNHKa70CsGBW4ntMjFzw63gYkGQQIiHYNRQp39bW4swJWWgfo2vBg==
From: Heiko Schocher <hs@nabladev.com>
To: linux-kernel@vger.kernel.org
Cc: linux-fpga@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Heiko Schocher <hs@nabladev.com>,
	Michal Simek <michal.simek@amd.com>,
	Moritz Fischer <mdf@kernel.org>,
	Tom Rix <trix@redhat.com>,
	Xu Yilun <yilun.xu@intel.com>
Subject: [PATCH v1] driver: fpga: xilinx-selectmap: add csi and rdwr support
Date: Thu, 16 Jul 2026 09:00:12 +0200
Message-ID: <20260716070020.4113618-1-hs@nabladev.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_000030_386477_0B8F5809 
X-CRM114-Status: GOOD (  14.75  )
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

 drivers/fpga/xilinx-selectmap.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/fpga/xilinx-selectmap.c b/drivers/fpga/xilinx-selectmap.c
index d0cbb5fdfe3a..b5fbdedf8aec 100644
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
@@ -30,9 +32,21 @@ static int xilinx_selectmap_write(struct xilinx_fpga_core *core,
 	struct xilinx_selectmap_conf *conf = to_xilinx_selectmap_conf(core);
 	size_t i;
 
+	if (conf->csi_b)
+		gpiod_set_value(conf->csi_b, GPIOD_OUT_HIGH);
+
+	if (conf->rdwr_b)
+		gpiod_set_value(conf->rdwr_b, GPIOD_OUT_HIGH);
+
 	for (i = 0; i < count; ++i)
 		writeb(buf[i], conf->base);
 
+	if (conf->rdwr_b)
+		gpiod_set_value(conf->rdwr_b, GPIOD_OUT_LOW);
+
+	if (conf->csi_b)
+		gpiod_set_value(conf->csi_b, GPIOD_OUT_LOW);
+
 	return 0;
 }
 
@@ -56,16 +70,18 @@ static int xilinx_selectmap_probe(struct platform_device *pdev)
 	conf->base = base;
 
 	/* CSI_B is active low */
-	gpio = devm_gpiod_get_optional(&pdev->dev, "csi", GPIOD_OUT_HIGH);
+	gpio = devm_gpiod_get_optional(&pdev->dev, "csi", GPIOD_OUT_LOW);
 	if (IS_ERR(gpio))
 		return dev_err_probe(&pdev->dev, PTR_ERR(gpio),
 				     "Failed to get CSI_B gpio\n");
+	conf->csi_b = gpio;
 
 	/* RDWR_B is active low */
-	gpio = devm_gpiod_get_optional(&pdev->dev, "rdwr", GPIOD_OUT_HIGH);
+	gpio = devm_gpiod_get_optional(&pdev->dev, "rdwr", GPIOD_OUT_LOW);
 	if (IS_ERR(gpio))
 		return dev_err_probe(&pdev->dev, PTR_ERR(gpio),
 				     "Failed to get RDWR_B gpio\n");
+	conf->rdwr_b = gpio;
 
 	return xilinx_core_probe(&conf->core);
 }
---
base-commit: 58717b2a1365d06c8c64b72aa948541b53fe31eb

-- 
2.55.0


