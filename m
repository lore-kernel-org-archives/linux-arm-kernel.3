Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4389A606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 04:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z4V86a4u;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=NHPw5Z7R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pPr5igdojHE5lpGhIA9Fw0wQHZy5xnlBY2dDWxpdXko=; b=Z4V86a4u/HrHWq
	ShvGI2vOs3aeSSQqf0/qjp4sXsw5dkjElll/JbnCUa5vd63doFa4M7TLvLeYqyqOuJm0GKIFcwUPI
	LSGObawwFzekrXRRqcqwCblq8uMVr/WVN4fIYzoKz6YCSkdqOQTRcHNKX1Id0AwtAQrtIlmLMupkt
	EgdUzA/i579aX32+6Rtj6M/kCgumL5j1JGahXlMCuGQpDJN5Lnu6fexUCQiGycDICSQ4q+8QZvGkg
	UJIiYweOG5qYnxEnn0F3JJfWq1QwiaNgnND0qVaqIlh4brZ7tlLZiv1XT5fOsjMt+LaYwEhmh4XBK
	3vttxkvuRKY5K+pY1nog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNMln-0000000Dr6W-1rtJ;
	Sun, 01 Nov 2026 04:02:11 +0000
Received: from mail-m160236537.xmail.ntesmail.com ([160.236.53.7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNMld-0000000Dr1i-0aqQ;
	Sun, 01 Nov 2026 04:02:03 +0000
Received: from 5950x.tail741d0a.ts.net (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 530d84150;
	Sun, 1 Nov 2026 12:01:54 +0800 (GMT+08:00)
From: Xing Zheng <zhengxing@rock-chips.com>
To: broonie@kernel.org,
	heiko@sntech.de,
	linux-sound@vger.kernel.org
Cc: luca.ceresoli@bootlin.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	huangtao@rock-chips.com,
	sugar.zhang@rock-chips.com,
	lxt@rock-chips.com,
	xing.zheng@rock-chips.com
Subject: [PATCH v1 5/6] ASoC: codecs: rk3308: report B/C headphone detection through set_jack
Date: Sun,  1 Nov 2026 12:01:24 +0800
Message-Id: <20261101040125.1864141-6-zhengxing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101040125.1864141-1-zhengxing@rock-chips.com>
References: <20261101040125.1864141-1-zhengxing@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa19545619803a8kunm8fccdc7416d2ba
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaHUNOVkhPSxkYGE5JSU8ZHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=NHPw5Z7RebPCXUdJ2xKrdmkCBCtC1yEbsswERmuCkSAxQOHmfAS8TWKWHPzvWmT8/Tf5TjAYN2g9GOL/oAZNnkJcqsVZwBRiQ7SNZme+XnzQhqLN4XJD1S6G6ZgrIh2zxYTlNLfXmAX2A3U/5un/8GbQIvZ6/inJW5dTUqZs0ds=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=pPr5igdojHE5lpGhIA9Fw0wQHZy5xnlBY2dDWxpdXko=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_210201_497053_CA68F614 
X-CRM114-Status: GOOD (  20.50  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use the detection GRF interrupt to report headphone insertion and
removal on codec revisions B and C. Keep detection optional for existing
device trees and retain index-based IRQ lookup for trees without
interrupt names.

Enable the detector only while a machine driver has registered a jack.
Cancel its work and disable its IRQ before releasing the jack. Keep the
revision-C DAC clock running while monitoring, and restore normal DAPM
clock ownership when monitoring stops.

Report jack status without changing codec routes from the worker: jack
pin associations and output policy belong to the machine driver.

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
---
 sound/soc/codecs/rk3308_codec.c | 225 ++++++++++++++++++++++++++++++++
 1 file changed, 225 insertions(+)

diff --git a/sound/soc/codecs/rk3308_codec.c b/sound/soc/codecs/rk3308_codec.c
index 319b2391dd9b..4e3e38a8571f 100644
--- a/sound/soc/codecs/rk3308_codec.c
+++ b/sound/soc/codecs/rk3308_codec.c
@@ -10,15 +10,19 @@
 #include <linux/device.h>
 #include <linux/delay.h>
 #include <linux/init.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/util_macros.h>
+#include <linux/workqueue.h>
 #include <sound/core.h>
+#include <sound/jack.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -31,6 +35,14 @@
 #define GRF_SOC_CON1			0x304
 #define GRF_CHIP_ID			0x800
 
+#define RK3308_HPDET_COUNTER		0x0030
+#define RK3308_HPDET_CON			0x0034
+#define RK3308_HPDET_STATUS		0x0038
+#define RK3308_HPDET_STATUS_CLR		0x003c
+#define RK3308_HPDET_EDGES		(BIT(0) | BIT(1))
+/* 200 ms at the detection block's 100 MHz clock. */
+#define RK3308_HPDET_FILTER_CYCLES	20000000
+
 enum {
 	ACODEC_VERSION_A = 'A',
 	ACODEC_VERSION_B,
@@ -49,6 +61,17 @@ struct rk3308_codec_priv {
 	unsigned char codec_ver;
 	u32 micbias_level;
 	u32 adc_grps[ADC_LR_GROUP_MAX];
+	struct regmap *detect_grf;
+	/* Serialize detector configuration and jack lifetime changes. */
+	struct mutex hpdet_lock;
+	struct snd_soc_jack *hpdet_jack;
+	struct delayed_work hpdet_work;
+	unsigned int hpdet_status;
+	int hpdet_irq;
+	bool hpdet_enabled;
+	bool hpdet_seen_irq;
+	bool hpdet_clock_forced;
+	bool hp_jack_reversed;
 };
 
 static struct clk_bulk_data rk3308_codec_clocks[] = {
@@ -1015,7 +1038,205 @@ static int rk3308_codec_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static bool rk3308_codec_hpdet_inserted(struct rk3308_codec_priv *rk3308,
+					unsigned int status)
+{
+	status &= RK3308_HPDET_EDGES;
+	if (rk3308->hp_jack_reversed)
+		return status == 0 || status == BIT(1);
+
+	return status == BIT(0);
+}
+
+static void rk3308_codec_hpdet_work(struct work_struct *work)
+{
+	struct rk3308_codec_priv *rk3308 =
+		container_of(to_delayed_work(work), struct rk3308_codec_priv, hpdet_work);
+	unsigned int status;
+	int ret;
+
+	if (!rk3308->component->card->instantiated) {
+		mod_delayed_work(system_power_efficient_wq, &rk3308->hpdet_work,
+				 msecs_to_jiffies(100));
+		return;
+	}
+
+	if (READ_ONCE(rk3308->hpdet_seen_irq)) {
+		status = READ_ONCE(rk3308->hpdet_status);
+	} else {
+		ret = regmap_read(rk3308->detect_grf, RK3308_HPDET_STATUS, &status);
+		if (ret)
+			return;
+	}
+
+	/* The machine driver owns the jack pins and output-routing policy. */
+	snd_soc_jack_report(rk3308->hpdet_jack,
+			    rk3308_codec_hpdet_inserted(rk3308, status) ?
+			    SND_JACK_HEADPHONE : 0, SND_JACK_HEADPHONE);
+}
+
+static irqreturn_t rk3308_codec_hpdet_irq(int irq, void *data)
+{
+	struct rk3308_codec_priv *rk3308 = data;
+	unsigned int status;
+	int ret;
+
+	ret = regmap_read(rk3308->detect_grf, RK3308_HPDET_STATUS, &status);
+	if (ret || !(status & RK3308_HPDET_EDGES))
+		return IRQ_NONE;
+
+	ret = regmap_write(rk3308->detect_grf, RK3308_HPDET_STATUS_CLR,
+			   status & RK3308_HPDET_EDGES);
+	if (ret)
+		return IRQ_HANDLED;
+
+	WRITE_ONCE(rk3308->hpdet_status, status);
+	WRITE_ONCE(rk3308->hpdet_seen_irq, true);
+	mod_delayed_work(system_power_efficient_wq, &rk3308->hpdet_work,
+			 msecs_to_jiffies(10));
+
+	return IRQ_HANDLED;
+}
+
+static int rk3308_codec_hpdet_clock(struct rk3308_codec_priv *rk3308, bool on)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(rk3308->component);
+	int ret;
+
+	if (rk3308->codec_ver != ACODEC_VERSION_C || on == rk3308->hpdet_clock_forced)
+		return 0;
+
+	/* Revision C needs the DAC clock while the detector is monitoring. */
+	snd_soc_dapm_mutex_lock(dapm);
+	if (on) {
+		ret = snd_soc_dapm_force_enable_pin_unlocked(dapm, "DAC_MCLK_GATE");
+	} else {
+		ret = snd_soc_dapm_disable_pin_unlocked(dapm, "DAC_MCLK_GATE");
+		if (!ret)
+			ret = snd_soc_dapm_enable_pin_unlocked(dapm, "DAC_MCLK_GATE");
+	}
+	if (!ret) {
+		rk3308->hpdet_clock_forced = on;
+		ret = snd_soc_dapm_sync_unlocked(dapm);
+	}
+	snd_soc_dapm_mutex_unlock(dapm);
+
+	return ret;
+}
+
+static int rk3308_codec_set_jack(struct snd_soc_component *component,
+				 struct snd_soc_jack *jack, void *data)
+{
+	struct rk3308_codec_priv *rk3308 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	if (!rk3308->detect_grf)
+		return jack ? -EOPNOTSUPP : 0;
+
+	mutex_lock(&rk3308->hpdet_lock);
+	if (rk3308->hpdet_enabled) {
+		disable_irq(rk3308->hpdet_irq);
+		rk3308->hpdet_enabled = false;
+	}
+	cancel_delayed_work_sync(&rk3308->hpdet_work);
+	rk3308->hpdet_jack = NULL;
+
+	ret = regmap_write(rk3308->detect_grf, RK3308_HPDET_CON,
+			   RK3308_HPDET_EDGES << 16);
+	if (ret)
+		goto disable;
+	ret = regmap_clear_bits(rk3308->regmap, RK3308_DAC_ANA_CON00,
+				RK3308_DAC_HEADPHONE_DET_EN);
+	if (ret || !jack)
+		goto disable;
+
+	ret = rk3308_codec_hpdet_clock(rk3308, true);
+	if (ret)
+		goto disable;
+	ret = regmap_write(rk3308->detect_grf, RK3308_HPDET_COUNTER,
+			   RK3308_HPDET_FILTER_CYCLES);
+	if (ret)
+		goto disable;
+	ret = regmap_write(rk3308->detect_grf, RK3308_HPDET_STATUS_CLR,
+			   RK3308_HPDET_EDGES);
+	if (ret)
+		goto disable;
+	ret = regmap_set_bits(rk3308->regmap, RK3308_DAC_ANA_CON00,
+			      RK3308_DAC_HEADPHONE_DET_EN);
+	if (ret)
+		goto disable;
+	ret = regmap_write(rk3308->detect_grf, RK3308_HPDET_CON,
+			   (RK3308_HPDET_EDGES << 16) | RK3308_HPDET_EDGES);
+	if (ret)
+		goto disable;
+
+	rk3308->hpdet_jack = jack;
+	WRITE_ONCE(rk3308->hpdet_seen_irq, false);
+	rk3308->hpdet_enabled = true;
+	/* Wait for the 200 ms hardware filter before the initial report. */
+	mod_delayed_work(system_power_efficient_wq, &rk3308->hpdet_work,
+			 msecs_to_jiffies(210));
+	enable_irq(rk3308->hpdet_irq);
+	mutex_unlock(&rk3308->hpdet_lock);
+
+	return 0;
+
+disable:
+	regmap_write(rk3308->detect_grf, RK3308_HPDET_CON, RK3308_HPDET_EDGES << 16);
+	regmap_clear_bits(rk3308->regmap, RK3308_DAC_ANA_CON00,
+			  RK3308_DAC_HEADPHONE_DET_EN);
+	if (ret)
+		rk3308_codec_hpdet_clock(rk3308, false);
+	else
+		ret = rk3308_codec_hpdet_clock(rk3308, false);
+	mutex_unlock(&rk3308->hpdet_lock);
+
+	return ret;
+}
+
+static void rk3308_codec_remove(struct snd_soc_component *component)
+{
+	rk3308_codec_set_jack(component, NULL, NULL);
+}
+
+static int rk3308_codec_hpdet_init(struct platform_device *pdev,
+				   struct rk3308_codec_priv *rk3308)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	int ret;
+
+	if (rk3308->codec_ver == ACODEC_VERSION_A ||
+	    of_property_read_bool(np, "rockchip,no-hp-det") ||
+	    !of_find_property(np, "rockchip,detect-grf", NULL))
+		return 0;
+
+	rk3308->detect_grf = syscon_regmap_lookup_by_phandle(np, "rockchip,detect-grf");
+	if (IS_ERR(rk3308->detect_grf))
+		return dev_err_probe(dev, PTR_ERR(rk3308->detect_grf),
+				     "Failed to get detection GRF\n");
+
+	if (of_find_property(np, "interrupt-names", NULL))
+		rk3308->hpdet_irq = platform_get_irq_byname(pdev, "hpdet");
+	else
+		rk3308->hpdet_irq = platform_get_irq(pdev, 1);
+	if (rk3308->hpdet_irq < 0)
+		return rk3308->hpdet_irq;
+
+	mutex_init(&rk3308->hpdet_lock);
+	INIT_DELAYED_WORK(&rk3308->hpdet_work, rk3308_codec_hpdet_work);
+	rk3308->hp_jack_reversed = of_property_read_bool(np, "rockchip,hp-jack-reversed");
+	ret = devm_request_threaded_irq(dev, rk3308->hpdet_irq, NULL, rk3308_codec_hpdet_irq,
+					IRQF_ONESHOT | IRQF_NO_AUTOEN, "rk3308-hpdet", rk3308);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request headphone IRQ\n");
+
+	return 0;
+}
+
 static const struct snd_soc_component_driver rk3308_codec_component_driver = {
+	.remove = rk3308_codec_remove,
+	.set_jack = rk3308_codec_set_jack,
 	.probe = rk3308_codec_probe,
 	.set_bias_level = rk3308_codec_set_bias_level,
 	.controls = rk3308_codec_controls,
@@ -1175,6 +1396,10 @@ static int rk3308_codec_platform_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	err = rk3308_codec_hpdet_init(pdev, rk3308);
+	if (err)
+		return err;
+
 	err = devm_snd_soc_register_component(dev, &rk3308_codec_component_driver,
 					      &rk3308_codec_dai_driver, 1);
 	if (err)

