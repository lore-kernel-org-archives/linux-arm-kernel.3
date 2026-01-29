Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AF5D358D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 17:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+C1jrCk01uJW4tdXVNyjurMMFe30KQRlHA7Zs4K4+4=; b=q5aiBSls3kbYhgaH0fA1VuWjyI
	rLU4bDm35PhHdsbLXnXEnIfY06rY5ZLWC/09ys+Z2LzSxL1dumiF+G5tSBTUSj2utS8cmSvrdYA7e
	ex9xFdzG5TKs0rlxN2xZ+fcDoaWcARy5uMLPW1TSzenQNUNkmeN8MoXLz2D1cKY556pVGToCyk3RK
	v87YckTNXKXYKv61bRu75fMpJo3/CWDygVXwrZISMFEH7H2ojMJHcXpH3L9ZeKp5KTTusd6m279/U
	oj4JbhM3dzhHfbSdNqzx4ZbF2cq6VJUZkw3wtUj1pij3+BnzUt7csXQ9KwUC5NvJWE4/J9/T1iaRf
	UxXHn+fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVly-00000000QSz-2oDi;
	Thu, 29 Jan 2026 17:25:38 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVlq-00000000QDP-18He
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 17:25:37 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769707403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g+C1jrCk01uJW4tdXVNyjurMMFe30KQRlHA7Zs4K4+4=;
	b=j7N5KKVyRCU7RNDyNLydxDbfmCD1YYA/AVnpg4iShAxJy5loAN9PEySF3l/1szGsjOqUY9
	n08FRg9MdbIi3eFOvNiorSHUszKtoef6bHOzu8lkMafj8wucXUeYuWwgwZ33QOd7Dh3JRH
	X4EhOZVU4U08JtSUqY0ehQD0llGEf3w=
From: Sean Anderson <sean.anderson@linux.dev>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <michal.simek@amd.com>,
	Takashi Iwai <tiwai@suse.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 2/2] ASoC: xilinx: xlnx_i2s: Discover parameters from registers
Date: Thu, 29 Jan 2026 12:23:15 -0500
Message-Id: <20260129172315.3871602-3-sean.anderson@linux.dev>
In-Reply-To: <20260129172315.3871602-1-sean.anderson@linux.dev>
References: <20260129172315.3871602-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_092530_629282_F309BB8A 
X-CRM114-Status: GOOD (  12.73  )
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

Xilinx helpfully included a read-only "config" register that contains
configuration parameters. Discover our parameters from this register
instead of reading them from the device tree.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 sound/soc/xilinx/xlnx_i2s.c | 32 +++++++++++---------------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_i2s.c b/sound/soc/xilinx/xlnx_i2s.c
index ca915a001ad5..a2b426376676 100644
--- a/sound/soc/xilinx/xlnx_i2s.c
+++ b/sound/soc/xilinx/xlnx_i2s.c
@@ -17,6 +17,9 @@
 
 #define DRV_NAME "xlnx_i2s"
 
+#define I2S_CORE_CFG			0x04
+#define I2S_CORE_CFG_DATA_24BIT		BIT(16)
+#define I2S_CORE_CFG_CHANNELS		GENMASK(11, 8)
 #define I2S_CORE_CTRL_OFFSET		0x08
 #define I2S_CORE_CTRL_32BIT_LRCLK	BIT(3)
 #define I2S_CORE_CTRL_ENABLE		BIT(0)
@@ -172,7 +175,7 @@ static int xlnx_i2s_probe(struct platform_device *pdev)
 {
 	struct xlnx_i2s_drv_data *drv_data;
 	int ret;
-	u32 format;
+	u32 format, cfg;
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
 
@@ -184,27 +187,14 @@ static int xlnx_i2s_probe(struct platform_device *pdev)
 	if (IS_ERR(drv_data->base))
 		return PTR_ERR(drv_data->base);
 
-	ret = of_property_read_u32(node, "xlnx,num-channels", &drv_data->channels);
-	if (ret < 0) {
-		dev_err(dev, "cannot get supported channels\n");
-		return ret;
-	}
-	drv_data->channels *= 2;
-
-	ret = of_property_read_u32(node, "xlnx,dwidth", &drv_data->data_width);
-	if (ret < 0) {
-		dev_err(dev, "cannot get data width\n");
-		return ret;
-	}
-	switch (drv_data->data_width) {
-	case 16:
-		format = SNDRV_PCM_FMTBIT_S16_LE;
-		break;
-	case 24:
+	cfg = readl(drv_data->base + I2S_CORE_CFG);
+	drv_data->channels = FIELD_GET(I2S_CORE_CFG_CHANNELS, cfg);
+	if (cfg & I2S_CORE_CFG_DATA_24BIT) {
+		drv_data->data_width = 24;
 		format = SNDRV_PCM_FMTBIT_S24_LE;
-		break;
-	default:
-		return -EINVAL;
+	} else {
+		drv_data->data_width = 16;
+		format = SNDRV_PCM_FMTBIT_S16_LE;
 	}
 
 	if (of_device_is_compatible(node, "xlnx,i2s-transmitter-1.0")) {
-- 
2.35.1.1320.gc452695387.dirty


