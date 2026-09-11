Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EFBC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 22:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8cTBryyPok9u5hgBBgTaMVbOGx+U65ZrgXcISbAXk8=; b=05e2c9aMhfgNo9h8Np5n1zo8xU
	EbjrDZiSo7q/YCc2+imyM3nTLr+v8ZAY9bPtrYBVAg1TkM00RWsfBhRuPROiQcNM4PsvRVx8VYKpk
	0zxD0lDvxioW9rQJsnlsJO+YDBJ69o9SKSo6CMrPirlCK4Qg0Rg+7k1QuOFtCxBva2cJHajBnK2j0
	Hk26KslGSOv5lLlwEiuab9pWyBqZDdMGzCRjietYkqGHSvH8Qwz3EFg4aVTuG/gbzBC/SHkkBL0MQ
	VcA9feGYrK8LTtkH98KOv7xSrBnhOsLKgfFuSxedfjcrEoyMCfLwyuEb/ylf5ZaL3+pgzk+Fqu1rz
	8rrFca6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59Wr-00000000FMy-3x6i;
	Fri, 11 Sep 2026 22:15:29 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59We-00000000FDl-0rle
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 22:15:17 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso11827055e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 15:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789164914; x=1789769714; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y8cTBryyPok9u5hgBBgTaMVbOGx+U65ZrgXcISbAXk8=;
        b=jkqinN76xygNJDMgVqdEIFceUGufnMO0ysjqvFgtvj1HVIrrJbmOWzDTNZYOs/Fd2g
         47Nnt2pA98wrcmXNjrJZe0y/fq0aDjk8KUM8qQIqj9/KA6FadAQ0utKAZue5D7xX6D2A
         gPzVxkKjTJnAw1iCPf7cJU+1MNX3A+ZJc+ZOEtMHx1yMzZMNl4xwrpLzMQKQtxkvOvp/
         u6yedoywFDLfG4eTWejzyvmwpQZZv57dfvQM5nKmYO2E8Bc65Z89r+tdt3rzNE7hD7IJ
         pT3jWve3wuODUoPd9fuxeOIxiUoqiKk/35LXLCkIq+JlpWMrtd2DSW4e1HVTiiR7ARgr
         C/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164914; x=1789769714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y8cTBryyPok9u5hgBBgTaMVbOGx+U65ZrgXcISbAXk8=;
        b=Wsjc41OwiMrwTmHwHWTP/BsCN7NBvvl7Qka4+V4KrcJt5tw+u4FwE2GEh+Y4dAZoy7
         nzxM1wg4ZEh1qnQ5/8JeEbfr+vRAcv0hZ8r8mdEky4tu2gbqXrrDZS/57a77PV8r/UIh
         n5jTSDcpNylr54gYrK/z+VZSlPeudpjsWezT3IAjsaHGJcg8yOTPcueKOkXn0BYWrkHF
         XRqDXyacivfpuEMoxY/970oXYcooG1PxsJnatXkB7l48CY70BuChOn2lDUjlJ9Yzvooq
         1pPKQz7yNCFKtQ19JIx0mFKPWBEzXTefGF3aysSkzSpl/PkGD1XXt6Sh1Xdg+R7PRSP4
         c/9w==
X-Forwarded-Encrypted: i=1; AKwUvBwH6L1uZ7jMJGR3gYQs0X+70QlUxT/lX/DQet6dewfxkMHyqsuyOz+WnQP9hPSbmCjjcNV9dddpOYCqEHg8hTPd@lists.infradead.org
X-Gm-Message-State: AFuF++mx6v/CGVEYwjRQe5pB1tq/UxdHcuVfOsP+4ajuZ+ndUsRxNmj7
	qQiUzA/Us9b77cJeQgEZepbpOMi22QRbZfLnjXhqFZtkmYi3XRLRLxyJb8skoS3iLyI=
X-Gm-Gg: AYBFou0YgO/bOkf4ggWPmbF7WNxMRV3g7jfs/YEA/1URO3GZe645QdOiGk483xNz5bQ
	d3tCEImmwwmK6xHmkuSyL8ZkJU3Li3DyW7CP2Wd7zZaqq7QVqbbOIJ/HHLl8JfpY8d/JFHwpfFc
	UnfrPGNCvZVMRvZfc2xkdlChSvqy6AbFAPGgyQjAV7gjwGiiHOsDS6h1femVyyT3bAd2dsfxiXv
	oQtGQWGK2VAkM4JSBLzshhDz9dEmDgGMvsOLLcvanQ6H2oICAGPpiJES7qruUdbVOi+1ynfoMU8
	FW3PR9hdCUj7cZygPzVacHafrHVWOz+Qu3e9HCAlJsJ9xIyOCf4xmL4rss73jRAUk6ThufaPd3H
	KHEu8C9ymx78bHFNGkjCYwPCfVLzCRtthInZQ+E55HW9ujlAs5m5IqnVxoy5t3XJM9TLVkuufyy
	NPQJGN8ac9sSotjTA0rlYNPuPTFkleiVzk1cT+axzPFfN3b5BjLxhS+g5p5JcUKM9UMg==
X-Received: by 2002:a05:600d:444c:20b0:49b:96a0:5c00 with SMTP id 5b1f17b1804b1-49e6198d09bmr54562695e9.13.1789164914076;
        Fri, 11 Sep 2026 15:15:14 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm202882745e9.7.2026.09.11.15.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:13 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 12 Sep 2026 00:14:33 +0200
Subject: [PATCH 3/6] ASoC: meson: add audin FIFO driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-audin-v1-3-7fbefe928711@baylibre.com>
References: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
In-Reply-To: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=17768; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=vNQyBJeBZc6hUUZzJuEKw9fG/gfnPN3fY7SmjWA8aIo=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlLanN7Qt2zRZMeb2ebcC7lY2hV5FK2huM/Ve+3nVQ3d
 3i1/lJaRykLgxgXg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACbyrp2RYepD4dMe211WdEhn
 hqb4+NWvnPn6mmzQjDl/X7x1NTMVfMrIcJXDfdkefmmlyWfXzGmP1RKwDk4/ZyCmEcjtF+3jd+w
 TLwA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_151516_450967_E4D9240D 
X-CRM114-Status: GOOD (  32.28  )
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

Add support for the frontend DAI of the capture interface which is in
charge of receiving decoded data from "audin-formatter-i2s" and move them
to an internal FIFO before they are block-transferred to RAM.

This component could ideally handle multiple input sources (SPDIF, I2S,
PCM, HDMI), but for the time being only I2S is added and has been tested.

Note: due to register configuration, at boot "Input Source" is set to
"SPDIF". In order to be able to test I2S it must be switched to "I2S".

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Kconfig      |   5 +
 sound/soc/meson/Makefile     |   2 +
 sound/soc/meson/audin-fifo.c | 466 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 473 insertions(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index f6e54615fc73..b83c7c15d1e9 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -16,10 +16,15 @@ config SND_MESON_AUDIN
 	tristate "Amlogic AUDIN"
 	select REGMAP_MMIO
 	select SND_MESON_AIU
+	select SND_MESON_AUDIN_FIFO
 	help
 	  Select Y or M to add support for the audio input subsystem found
 	  in the Amlogic GX SoC family. Currently only I2S input is supported.
 
+config SND_MESON_AUDIN_FIFO
+	tristate
+	select REGMAP_MMIO
+
 config SND_MESON_AXG_FIFO
 	tristate
 	select REGMAP_MMIO
diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index 6a06a7b26e61..3e373bd27645 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -12,6 +12,7 @@ snd-soc-meson-aiu-y += aiu-fifo-i2s.o
 snd-soc-meson-aiu-y += aiu-fifo-spdif.o
 snd-soc-meson-audin-y := audin.o
 snd-soc-meson-audin-y += audin-formatter-i2s.o
+snd-soc-meson-audin-fifo-y := audin-fifo.o
 snd-soc-meson-axg-fifo-y := axg-fifo.o
 snd-soc-meson-axg-frddr-y := axg-frddr.o
 snd-soc-meson-axg-toddr-y := axg-toddr.o
@@ -32,6 +33,7 @@ snd-soc-meson-t9015-y := t9015.o
 
 obj-$(CONFIG_SND_MESON_AIU) += snd-soc-meson-aiu.o
 obj-$(CONFIG_SND_MESON_AUDIN) += snd-soc-meson-audin.o
+obj-$(CONFIG_SND_MESON_AUDIN_FIFO) += snd-soc-meson-audin-fifo.o
 obj-$(CONFIG_SND_MESON_AXG_FIFO) += snd-soc-meson-axg-fifo.o
 obj-$(CONFIG_SND_MESON_AXG_FRDDR) += snd-soc-meson-axg-frddr.o
 obj-$(CONFIG_SND_MESON_AXG_TODDR) += snd-soc-meson-axg-toddr.o
diff --git a/sound/soc/meson/audin-fifo.c b/sound/soc/meson/audin-fifo.c
new file mode 100644
index 000000000000..7029bd6a464a
--- /dev/null
+++ b/sound/soc/meson/audin-fifo.c
@@ -0,0 +1,466 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2026 BayLibre, SAS.
+// Author: Valerio Setti <vsetti@baylibre.com>
+
+#include <linux/bitfield.h>
+#include <linux/dma-mapping.h>
+#include <linux/hrtimer.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/wordpart.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+/* FIFO registers */
+#define AUDIN_FIFO_START	0x00
+#define AUDIN_FIFO_END		0x04
+#define AUDIN_FIFO_PTR		0x08
+
+/* FIFOx CTRL registers and bits */
+#define AUDIN_FIFO_CTRL			0x14
+#define  AUDIN_FIFO_CTRL_EN		BIT(0)
+#define  AUDIN_FIFO_CTRL_RST		BIT(1)
+#define  AUDIN_FIFO_CTRL_LOAD		BIT(2)
+#define  AUDIN_FIFO_CTRL_DIN_SEL_OFF	3
+#define  AUDIN_FIFO_CTRL_ENDIAN_MASK	GENMASK(10, 8)
+#define  AUDIN_FIFO_CTRL_CHAN_MASK	GENMASK(14, 11)
+#define  AUDIN_FIFO_CTRL_UG		BIT(15)
+
+/* FIFOx_CTRL1 registers and bits */
+#define AUDIN_FIFO_CTRL1			0x18
+#define  AUDIN_FIFO_CTRL1_DIN_BYTE_NUM_MASK	GENMASK(3, 2)
+#define  AUDIN_FIFO_CTRL1_DIN_POS_01_MASK	GENMASK(1, 0)
+
+/* When the FIFO is full the data is bulk transferred to memory. */
+#define AUDIN_FIFO_LANE_SIZE		8 /* bytes */
+#define AUDIN_FIFO_I2S_BLOCK		(AUDIN_FIFO_LANE_SIZE * 32) /* 256 bytes */
+
+static const struct snd_pcm_hardware audin_fifo_pcm_hw = {
+	.info = (SNDRV_PCM_INFO_INTERLEAVED |
+		 SNDRV_PCM_INFO_MMAP |
+		 SNDRV_PCM_INFO_MMAP_VALID |
+		 SNDRV_PCM_INFO_BLOCK_TRANSFER |
+		 SNDRV_PCM_INFO_PAUSE),
+	.formats = SNDRV_PCM_FMTBIT_S16_LE,
+	.rate_min = 5512,
+	.rate_max = 192000,
+	.channels_min = 2,
+	.channels_max = 2,
+	/*
+	 * The FIFO only moves data to the memory once it is full, so its pointer
+	 * progresses one block at a time.
+	 */
+	.period_bytes_min = 2 * AUDIN_FIFO_I2S_BLOCK,
+	.period_bytes_max = UINT_MAX, /* Bounded by buffer_bytes_max */
+	.periods_min = 2,
+	.periods_max = UINT_MAX,
+	/*
+	 * It's 1 MB. There is no physical constraint for this; it's only meant to
+	 * provide some decently large buffer size where to store incoming data
+	 * and fit various period_bytes requests.
+	 */
+	.buffer_bytes_max = 4096 * AUDIN_FIFO_I2S_BLOCK,
+};
+
+struct audin_fifo_dai_data {
+	/*
+	 * The AUDIN peripheral has an IRQ to signal when data is received, but
+	 * it cannot grant a periodic behavior. The reason is that the register
+	 * which holds the address which triggers the IRQ must be updated
+	 * continuously. This creates a risk of overflow if for any reason the
+	 * ISR execution is delayed. Using a periodic timer is therefore simpler
+	 * and more reliable.
+	 */
+	struct hrtimer polling_timer;
+	struct snd_soc_component *component;
+	struct snd_pcm_substream *substream;
+	unsigned int period_bytes;
+	unsigned int byte_rate;
+	unsigned int last_pos; /* Position inside the allocated read buffer. */
+	bool running;
+};
+
+static unsigned int audin_fifo_pos(struct snd_soc_component *component,
+				   struct snd_pcm_runtime *runtime)
+{
+	unsigned int ptr = snd_soc_component_read(component, AUDIN_FIFO_PTR);
+
+	return ptr - lower_32_bits(runtime->dma_addr);
+}
+
+static ktime_t audin_fifo_bytes_to_ns(struct audin_fifo_dai_data *data,
+				      unsigned int bytes)
+{
+	return div_u64((u64)bytes * NSEC_PER_SEC, data->byte_rate);
+}
+
+static int audin_fifo_dai_trigger(struct snd_pcm_substream *substream, int cmd,
+				  struct snd_soc_dai *dai)
+{
+	struct audin_fifo_dai_data *data = snd_soc_dai_dma_data_get_capture(dai);
+	struct snd_soc_component *component = dai->component;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		snd_soc_component_update_bits(component, AUDIN_FIFO_CTRL,
+					      AUDIN_FIFO_CTRL_EN,
+					      AUDIN_FIFO_CTRL_EN);
+		WRITE_ONCE(data->running, true);
+		hrtimer_start(&data->polling_timer,
+			      audin_fifo_bytes_to_ns(data, data->period_bytes),
+			      HRTIMER_MODE_REL);
+		break;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_STOP:
+		WRITE_ONCE(data->running, false);
+		/*
+		 * PCM stream lock is held here. If the timer callback is running
+		 * (i.e. it cannot be stopped) there is also hrtimer_cancel()
+		 * in hw_free().
+		 */
+		hrtimer_try_to_cancel(&data->polling_timer);
+		snd_soc_component_update_bits(component, AUDIN_FIFO_CTRL,
+					      AUDIN_FIFO_CTRL_EN, 0);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int audin_fifo_dai_prepare(struct snd_pcm_substream *substream,
+				  struct snd_soc_dai *dai)
+{
+	struct audin_fifo_dai_data *data = snd_soc_dai_dma_data_get_capture(dai);
+	struct snd_soc_component *component = dai->component;
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	dma_addr_t dma_end = runtime->dma_addr + runtime->dma_bytes - AUDIN_FIFO_LANE_SIZE;
+	unsigned int val;
+
+	data->last_pos = 0;
+
+	/*
+	 * Setup memory boundaries.
+	 * Note: DMA has a 32-bit mask, so it's OK to take lower 32 bits.
+	 */
+	snd_soc_component_write(component, AUDIN_FIFO_START, lower_32_bits(runtime->dma_addr));
+	snd_soc_component_write(component, AUDIN_FIFO_PTR, lower_32_bits(runtime->dma_addr));
+	snd_soc_component_write(component, AUDIN_FIFO_END, lower_32_bits(dma_end));
+
+	/* Load new addresses (both LOAD and UG are self-clearing). */
+	val = AUDIN_FIFO_CTRL_LOAD | AUDIN_FIFO_CTRL_UG;
+	snd_soc_component_update_bits(component, AUDIN_FIFO_CTRL, val, val);
+
+	/* Reset (RST is self-clearing). */
+	snd_soc_component_update_bits(component, AUDIN_FIFO_CTRL,
+				      AUDIN_FIFO_CTRL_RST,
+				      AUDIN_FIFO_CTRL_RST);
+
+	return 0;
+}
+
+static int audin_fifo_dai_hw_params(struct snd_pcm_substream *substream,
+				    struct snd_pcm_hw_params *params,
+				    struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct audin_fifo_dai_data *data = snd_soc_dai_dma_data_get_capture(dai);
+	unsigned int val;
+
+	if (params_width(params) != 16) {
+		dev_err(dai->dev, "Unsupported width %u\n", params_width(params));
+		return -EINVAL;
+	}
+
+	/*
+	 * The I2S input decoder passes 24 bits of left-justified data
+	 * but for the time being we only support 16 bit formatted samples
+	 * which means that we drop the LSB.
+	 */
+	val = FIELD_PREP(AUDIN_FIFO_CTRL1_DIN_POS_01_MASK, 1);
+	snd_soc_component_update_bits(component, AUDIN_FIFO_CTRL1,
+				      AUDIN_FIFO_CTRL1_DIN_POS_01_MASK,
+				      val);
+
+	/* Set sample size to 2 bytes (16 bit) */
+	val = FIELD_PREP(AUDIN_FIFO_CTRL1_DIN_BYTE_NUM_MASK, 1);
+	snd_soc_component_update_bits(component, AUDIN_FIFO_CTRL1,
+				      AUDIN_FIFO_CTRL1_DIN_BYTE_NUM_MASK,
+				      val);
+
+	/*
+	 * This is a bit counterintuitive. Even though the platform has a single
+	 * pin for I2S input which would mean that we can only support 2
+	 * channels, doing so would cause samples to be stored in a weird way
+	 * into the FIFO: all the samples from the 1st channel on the 1st half
+	 * of the FIFO, then samples from the 2nd channel in the other half. Of
+	 * course extra work would be required to properly interleave them
+	 * before returning to the userspace.
+	 * Setting a single channel mode instead solves the problem: samples
+	 * from 1st and 2nd channel are stored interleaved and sequentially in
+	 * the FIFO.
+	 */
+	val = FIELD_PREP(AUDIN_FIFO_CTRL_CHAN_MASK, 1);
+	snd_soc_component_update_bits(component, AUDIN_FIFO_CTRL,
+				      AUDIN_FIFO_CTRL_CHAN_MASK, val);
+
+	/*
+	 * FIFO is filled line by line and each of them is 8 bytes. The
+	 * problem is that each line is filled starting from the end,
+	 * so we need to properly reorder them before moving to the
+	 * RAM. This is the value required to properly re-order samples stored
+	 * in 16 bit format.
+	 */
+	val = FIELD_PREP(AUDIN_FIFO_CTRL_ENDIAN_MASK, 6);
+	snd_soc_component_update_bits(component, AUDIN_FIFO_CTRL,
+				      AUDIN_FIFO_CTRL_ENDIAN_MASK, val);
+
+	/* Used by the polling timer to convert a byte count into a delay. */
+	data->period_bytes = params_period_bytes(params);
+	data->byte_rate = params_rate(params) * params_channels(params) *
+			  params_physical_width(params) / BITS_PER_BYTE;
+
+	data->substream = substream;
+
+	return 0;
+}
+
+static int audin_fifo_dai_hw_free(struct snd_pcm_substream *substream,
+				  struct snd_soc_dai *dai)
+{
+	struct audin_fifo_dai_data *data = snd_soc_dai_dma_data_get_capture(dai);
+
+	WRITE_ONCE(data->running, false);
+	hrtimer_cancel(&data->polling_timer);
+
+	return 0;
+}
+
+static int audin_fifo_dai_startup(struct snd_pcm_substream *substream,
+				  struct snd_soc_dai *dai)
+{
+	int ret;
+
+	snd_soc_set_runtime_hwparams(substream, &audin_fifo_pcm_hw);
+
+	ret = snd_pcm_hw_constraint_step(substream->runtime, 0,
+					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+					 AUDIN_FIFO_I2S_BLOCK);
+	if (ret < 0) {
+		dev_err(dai->dev, "Failed to set constraint on buffer_bytes %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_pcm_hw_constraint_step(substream->runtime, 0,
+					 SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
+					 AUDIN_FIFO_I2S_BLOCK);
+	if (ret < 0) {
+		dev_err(dai->dev, "Failed to set constraint on period_bytes %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int audin_fifo_dai_pcm_new(struct snd_soc_pcm_runtime *rtd,
+				  struct snd_soc_dai *dai)
+{
+	int ret;
+
+	ret = dma_coerce_mask_and_coherent(dai->dev, DMA_BIT_MASK(32));
+	if (ret) {
+		dev_err(dai->dev, "Failed to set DMA mask %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
+					     dai->dev,
+					     audin_fifo_pcm_hw.buffer_bytes_max,
+					     audin_fifo_pcm_hw.buffer_bytes_max);
+	if (ret) {
+		dev_err(dai->dev, "Failed to set PCM managed buffer %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static enum hrtimer_restart audin_fifo_timer_cb(struct hrtimer *timer)
+{
+	struct audin_fifo_dai_data *data =
+		container_of(timer, struct audin_fifo_dai_data, polling_timer);
+	struct snd_pcm_runtime *runtime = data->substream->runtime;
+	unsigned int curr_pos, delta, sleep_time;
+
+	if (!READ_ONCE(data->running))
+		return HRTIMER_NORESTART;
+
+	curr_pos = audin_fifo_pos(data->component, runtime);
+	delta = (curr_pos >= data->last_pos) ?
+		curr_pos - data->last_pos :
+		(runtime->dma_bytes - data->last_pos) + curr_pos;
+
+	/* Report only when the period is completed. */
+	if (delta >= data->period_bytes) {
+		data->last_pos = curr_pos;
+		delta = delta % data->period_bytes;
+		snd_pcm_period_elapsed(data->substream);
+	}
+
+	/* Sleep until the period is completed. */
+	sleep_time = round_up(data->period_bytes - delta, AUDIN_FIFO_I2S_BLOCK);
+	hrtimer_forward_now(timer, audin_fifo_bytes_to_ns(data, sleep_time));
+
+	return HRTIMER_RESTART;
+}
+
+static int audin_fifo_dai_probe(struct snd_soc_dai *dai)
+{
+	struct audin_fifo_dai_data *data;
+
+	data = kzalloc_obj(*data);
+	if (!data)
+		return -ENOMEM;
+
+	data->component = dai->component;
+
+	hrtimer_setup(&data->polling_timer, audin_fifo_timer_cb, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_REL);
+
+	snd_soc_dai_dma_data_set_capture(dai, data);
+
+	return 0;
+}
+
+static int audin_fifo_dai_remove(struct snd_soc_dai *dai)
+{
+	kfree(snd_soc_dai_dma_data_get_capture(dai));
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops audin_fifo_dai_ops = {
+	.trigger	= audin_fifo_dai_trigger,
+	.prepare	= audin_fifo_dai_prepare,
+	.hw_params	= audin_fifo_dai_hw_params,
+	.hw_free	= audin_fifo_dai_hw_free,
+	.startup	= audin_fifo_dai_startup,
+	.pcm_new	= audin_fifo_dai_pcm_new,
+	.probe		= audin_fifo_dai_probe,
+	.remove		= audin_fifo_dai_remove,
+};
+
+static struct snd_soc_dai_driver audin_fifo_dai_drv[] = {
+	{
+		.name = "FIFO",
+		.capture = {
+			.stream_name	= "Capture",
+			.channels_min	= 2,
+			.channels_max	= 2,
+			.rates		= SNDRV_PCM_RATE_CONTINUOUS,
+			.rate_min	= 5512,
+			.rate_max	= 192000,
+			.formats	= SNDRV_PCM_FMTBIT_S16_LE,
+		},
+		.ops = &audin_fifo_dai_ops,
+	},
+};
+
+static snd_pcm_uframes_t
+audin_fifo_component_pointer(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	return bytes_to_frames(runtime, audin_fifo_pos(component, runtime));
+}
+
+static const char * const audin_fifo_input_sel_texts[] = {
+	"SPDIF", "I2S", "PCM", "HDMI", "Demodulator"
+};
+
+static SOC_ENUM_SINGLE_DECL(audin_fifo_input_sel_enum, AUDIN_FIFO_CTRL,
+			    AUDIN_FIFO_CTRL_DIN_SEL_OFF,
+			    audin_fifo_input_sel_texts);
+
+static const struct snd_kcontrol_new audin_fifo_input_sel_mux =
+	SOC_DAPM_ENUM("Input Source", audin_fifo_input_sel_enum);
+
+static const struct snd_soc_dapm_widget audin_fifo_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("I2S IN", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_MUX("SRC SEL", SND_SOC_NOPM, 0, 0,
+			 &audin_fifo_input_sel_mux),
+};
+
+static const struct snd_soc_dapm_route audin_fifo_dapm_routes[] = {
+	{ "SRC SEL", "I2S", "I2S IN" },
+	{ "Capture", NULL, "SRC SEL" },
+};
+
+static const struct snd_soc_component_driver audin_fifo_component = {
+	.dapm_widgets		= audin_fifo_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(audin_fifo_dapm_widgets),
+	.dapm_routes		= audin_fifo_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(audin_fifo_dapm_routes),
+	.pointer		= audin_fifo_component_pointer,
+};
+
+static const struct regmap_config audin_fifo_regmap_cfg = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0x18,
+};
+
+static int audin_fifo_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	void __iomem *regs;
+	struct regmap *map;
+	int ret;
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return dev_err_probe(dev, PTR_ERR(regs), "Error ioremapping resource\n");
+
+	map = devm_regmap_init_mmio(dev, regs, &audin_fifo_regmap_cfg);
+	if (IS_ERR(map))
+		return dev_err_probe(dev, PTR_ERR(map), "Failed to init regmap\n");
+
+	ret = devm_snd_soc_register_component(dev, &audin_fifo_component,
+					      audin_fifo_dai_drv,
+					      ARRAY_SIZE(audin_fifo_dai_drv));
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register component\n");
+
+	return 0;
+}
+
+static const struct of_device_id audin_fifo_of_match[] = {
+	{ .compatible = "amlogic,meson-gxbb-audin-fifo" },
+	{ .compatible = "amlogic,meson-gxl-audin-fifo" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, audin_fifo_of_match);
+
+static struct platform_driver audin_fifo_pdrv = {
+	.probe = audin_fifo_probe,
+	.driver = {
+		.name = "meson-gx-audin-fifo",
+		.of_match_table = audin_fifo_of_match,
+	},
+};
+module_platform_driver(audin_fifo_pdrv);
+
+MODULE_DESCRIPTION("Meson GX AUDIN FIFO driver");
+MODULE_AUTHOR("Valerio Setti <vsetti@baylibre.com>");
+MODULE_LICENSE("GPL");

-- 
2.47.3


