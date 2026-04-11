Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75A2F3ED55
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 14:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kz3FwAZomnP9aNGkoofTcWTLt5IEx/freTRsvHSCfXQ=; b=gC7byM6DyzU/9o6OigMFZgf18w
	64JA/4OmuPS8WvvMXJXD4wh/Hf4r5UVzI2FCJL5pQ8rVYrxQgMIzIF5MQuojF3eq7pXX1lZnWVXuW
	N5jjZseBY9iafR1f5wtpnaYmslncm33vNmbT8N+u8Y0/+/Ow6EZcRECfG1HKkGqGwtG9oY53elxke
	n9rU1HKjljg0y43tKY56Pe3usqy6tfP7V93ZYso1i3HUJ4Wgd0VIo+x5hhlKNvkUAWjEY8NcOlOyA
	t8og/iNb9Lms6pWyVWJ1jFJP+EEQFjb4bmH+SXVu3PPVSJv+dzP5n+2lMxsd5MSJXOUZWBYx0bOb4
	qGVSQ+RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZmg-0000000DXdn-1Z9P;
	Sat, 11 Apr 2026 14:58:06 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZmb-0000000DXZx-37UF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 14:58:04 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-488b00ed86fso31796545e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Apr 2026 07:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775919480; x=1776524280; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kz3FwAZomnP9aNGkoofTcWTLt5IEx/freTRsvHSCfXQ=;
        b=Ki/kyH3KtM6vRnDYIJje27UPXC7reaWTQHyh1B+p/3olorC/gRyEGp7eLi070lXcqI
         D0D+THOe/E4LMmL2LHsGhMzFlX9HogqPi86ZTjyeXhGjkTiZM/4LXh4VbQnYo3+dTRJz
         mzTlDrP8Al2PlE1vXY063xDF6F1fwUH/JR/P5wkc7IUJ5AriaXePhD/RYWPBCZbF3Wmb
         /DhaVirJLN3eJPziuGgne9hq+AfciO1CSVlvACO2Eew2O2Wbo+8hKEBpifBNaftzkrjw
         oYpU5soAl2hEpOMziWURUOWUoWC0xyhD98wtLiTy/s6n64gONhyRuVUAKYq4V4CYsMfe
         ZDnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919480; x=1776524280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kz3FwAZomnP9aNGkoofTcWTLt5IEx/freTRsvHSCfXQ=;
        b=D0TAVOGx8icAIJ5S3Vd6iNZxiJQBQJrM13y9oWcxAHcay6g/CqCGb8lX8HN25SmG0i
         KCQvqxe/900UM8P4Qs3lK77EY2dSIvN6QQhJ6iNOYCfrQEKxjbPMkTBY37o64QE5glVD
         rEpT9VVAn5Nfyca0CCnZzNpyqLQFCY4dVZC7Uth2VC08O7S/oaJTPoDk7lTech07Wyzs
         +Q2WX2OXGFymmF8Eb/vrMu9i83kBRq1ASHs0a+b0oJUfHPfakDq5MU0F1VZlnQ1Uwbp7
         jQhfRFmycde/tt0tMVrX3Q+bkW3XZxXaMzwJc80RhAUmgqtekpOMSjeJC4/TXYkYq6ah
         czsA==
X-Forwarded-Encrypted: i=1; AJvYcCVKZ+ivsZuCBrHl6ih+l3NdOrHGWRX3jQxZS43aN3xaU4rcSZDNdt32jpt4VnV1DZ0jsS+iOfbLieHPCGqkT2Sr@lists.infradead.org
X-Gm-Message-State: AOJu0YxP4R5XvGO2W87ajqsf7YrP1L1p3f3PGqi0sA/cf8KqYeFK3+cD
	mXgR6m5xQAtfli/7kheqHocCwnf+bbG0ySo87hybi7U6Ulz0nZspyXXsr0zmyfCcAFA=
X-Gm-Gg: AeBDievkGA7G42Bc7BXrxefqc0xCgTuDJyOiXVGCQgHDaWVytkz8XGFbxkw2Zz7ANT2
	34MNKAwUjmbzT4R3FzmV8iF9h4v3F9jUpeZyDV3BDq7MQgQ/qKYaLyP75/xMA+uxstmcaU2XHcb
	dvuJ0ZXpS0IhkHgNjyykEGxcZqOZNOF6D8Cl4hd9eO7lHNOdlp5/I9CZDjykXtUWdk4zLIeU8dH
	Ph14u3pBT1ot8AScARa7JgbNgUCBEx4KO3xAtBq2b4F3h1oa152kG4WY9ZrKcZ4BCHaF3qQQj8k
	AdW1c6i1T2FsAl9nP4r0EjY+8R6RfeNunN3uHDPr2fGPbm3b5MFn09burKlAlImKNXmxvAcIsCa
	GlV2EaOXHhAx4t3DGhTzaWp85nxgP5k1ILjpTo0be5e758CBL6zkIZm2WYyrqUiC24RaLye0Vxi
	F+PRcMe8rygPtriOA5EZTnRL4UUHYL5q4=
X-Received: by 2002:a05:600c:4443:b0:488:8577:d9cc with SMTP id 5b1f17b1804b1-488d686be7bmr92734015e9.20.1775919479814;
        Sat, 11 Apr 2026 07:57:59 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.248.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm48882375e9.10.2026.04.11.07.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:57:59 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 11 Apr 2026 16:57:26 +0200
Subject: [PATCH RFC v2 01/11] ASoC: meson: gx: add gx-formatter and
 gx-interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-audin-rfc-v2-1-4c8a6ec5fcab@baylibre.com>
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
In-Reply-To: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Valerio Setti <vsetti@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12064; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=qhdRQX/ddJSM25M93A+r/cVV0Syd/4yy9wYSGUsGKMU=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDJm3Eoud4v2Ovfz+rt27Yq7bM/9pNfOWKwR2svEujj6qE
 Kt+Kkilo5SFQYyDQVZMkYVl+r3fBaVqD40TThbAzGFlAhnCwMUpABPpLGRkmDN7ywbr+Y8T8lfx
 Js3XUGzl6DdawJNw8vTpeZqqK4XYrzD8lZK2v7DellGFz7r6gtIkefubF3UfljFMnrJ4TuoS8Ze
 7GQE=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_075801_854296_3CEB9A6B 
X-CRM114-Status: GOOD (  30.57  )
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

These files are the basic block which allow to shape I2S in GX devices
the same as the AXG ones: the DAI backend only controls the interface
(i.e. clocks and pins) whereas a formatter takes care of properly
formatting the data.

gx-formatter and gx-interface are strongly inspired to axg-tdm-formatter
and axg-tdm, respectively. The long term plan is to join the two platforms
to use the same formatter solution.

There is only a minor addition here compared to what has been done for
AXG and it's "gx_formatter_create()" which is required in order to let
already existing AIU code to make use of this formatter without making any
devicetree change.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Makefile       |   1 +
 sound/soc/meson/gx-formatter.c | 304 +++++++++++++++++++++++++++++++++++++++++
 sound/soc/meson/gx-formatter.h |  47 +++++++
 sound/soc/meson/gx-interface.h |  50 +++++++
 4 files changed, 402 insertions(+)

diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index 24078e4396b02d545d8ba4bcb1632979001354e3..146ec81526ba091a174a113ce3d8412ddbbfd9dd 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -4,6 +4,7 @@ snd-soc-meson-aiu-y := aiu.o
 snd-soc-meson-aiu-y += aiu-acodec-ctrl.o
 snd-soc-meson-aiu-y += aiu-codec-ctrl.o
 snd-soc-meson-aiu-y += aiu-encoder-i2s.o
+snd-soc-meson-aiu-y += gx-formatter.o
 snd-soc-meson-aiu-y += aiu-encoder-spdif.o
 snd-soc-meson-aiu-y += aiu-fifo.o
 snd-soc-meson-aiu-y += aiu-fifo-i2s.o
diff --git a/sound/soc/meson/gx-formatter.c b/sound/soc/meson/gx-formatter.c
new file mode 100644
index 0000000000000000000000000000000000000000..3f6d01f8d755ddedaaa0b0ab0a2683155e43d1b6
--- /dev/null
+++ b/sound/soc/meson/gx-formatter.c
@@ -0,0 +1,304 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Copyright (c) 2026 BayLibre, SAS.
+// Author: Valerio Setti <vsetti@baylibre.com>
+
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+
+#include "gx-formatter.h"
+
+struct gx_formatter {
+	struct list_head list;
+	struct gx_stream *stream;
+	const struct gx_formatter_driver *drv;
+	bool enabled;
+	struct regmap *map;
+};
+
+static int gx_formatter_enable(struct gx_formatter *formatter)
+{
+	int ret;
+
+	/* Do nothing if the formatter is already enabled */
+	if (formatter->enabled)
+		return 0;
+
+	/* Setup the stream parameter in the formatter */
+	if (formatter->drv->ops->prepare) {
+		ret = formatter->drv->ops->prepare(formatter->map,
+					   formatter->drv->quirks,
+					   formatter->stream);
+		if (ret)
+			return ret;
+	}
+
+	/* Finally, actually enable the formatter */
+	if (formatter->drv->ops->enable)
+		formatter->drv->ops->enable(formatter->map);
+
+	formatter->enabled = true;
+
+	return 0;
+}
+
+static void gx_formatter_disable(struct gx_formatter *formatter)
+{
+	/* Do nothing if the formatter is already disabled */
+	if (!formatter->enabled)
+		return;
+
+	if (formatter->drv->ops->disable)
+		formatter->drv->ops->disable(formatter->map);
+
+	formatter->enabled = false;
+}
+
+static int gx_formatter_attach(struct gx_formatter *formatter)
+{
+	struct gx_stream *ts = formatter->stream;
+	int ret = 0;
+
+	mutex_lock(&ts->lock);
+
+	/* Catch up if the stream is already running when we attach */
+	if (ts->ready) {
+		ret = gx_formatter_enable(formatter);
+		if (ret) {
+			pr_err("failed to enable formatter\n");
+			goto out;
+		}
+	}
+
+	list_add_tail(&formatter->list, &ts->formatter_list);
+out:
+	mutex_unlock(&ts->lock);
+	return ret;
+}
+
+static void gx_formatter_detach(struct gx_formatter *formatter)
+{
+	struct gx_stream *ts = formatter->stream;
+
+	mutex_lock(&ts->lock);
+	list_del(&formatter->list);
+	mutex_unlock(&ts->lock);
+
+	gx_formatter_disable(formatter);
+}
+
+static int gx_formatter_power_up(struct gx_formatter *formatter,
+				      struct snd_soc_dapm_widget *w)
+{
+	struct gx_stream *ts = formatter->drv->ops->get_stream(w);
+	int ret;
+
+	/*
+	 * If we don't get a stream at this stage, it would mean that the
+	 * widget is powering up but is not attached to any backend DAI.
+	 * It should not happen, ever !
+	 */
+	if (WARN_ON(!ts))
+		return -ENODEV;
+
+	formatter->stream = ts;
+	ret = gx_formatter_attach(formatter);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void gx_formatter_power_down(struct gx_formatter *formatter)
+{
+	gx_formatter_detach(formatter);
+	formatter->stream = NULL;
+}
+
+int gx_formatter_event(struct snd_soc_dapm_widget *w,
+		       struct snd_kcontrol *control,
+		       int event)
+{
+	struct snd_soc_component *c;
+	struct gx_formatter *formatter;
+	int ret = 0;
+
+	c = snd_soc_dapm_to_component(w->dapm);
+
+	if (w->priv != NULL)
+		formatter = w->priv;
+	else
+		formatter = snd_soc_component_get_drvdata(c);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		ret = gx_formatter_power_up(formatter, w);
+		break;
+
+	case SND_SOC_DAPM_PRE_PMD:
+		gx_formatter_power_down(formatter);
+		break;
+
+	default:
+		dev_err(c->dev, "Unexpected event %d\n", event);
+		return -EINVAL;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gx_formatter_event);
+
+int gx_formatter_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct gx_formatter_driver *drv;
+	struct gx_formatter *formatter;
+	void __iomem *regs;
+
+	drv = of_device_get_match_data(dev);
+	if (!drv) {
+		dev_err(dev, "failed to match device\n");
+		return -ENODEV;
+	}
+
+	formatter = devm_kzalloc(dev, sizeof(*formatter), GFP_KERNEL);
+	if (!formatter)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, formatter);
+	formatter->drv = drv;
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	formatter->map = devm_regmap_init_mmio(dev, regs, drv->regmap_cfg);
+	if (IS_ERR(formatter->map)) {
+		dev_err(dev, "failed to init regmap: %ld\n",
+			PTR_ERR(formatter->map));
+		return PTR_ERR(formatter->map);
+	}
+
+	return snd_soc_register_component(dev, drv->component_drv, NULL, 0);
+}
+EXPORT_SYMBOL_GPL(gx_formatter_probe);
+
+int gx_formatter_create(struct device *dev,
+			struct snd_soc_dapm_widget *w,
+			const struct gx_formatter_driver *drv,
+			struct regmap *regmap)
+{
+	struct gx_formatter *formatter;
+
+	formatter = devm_kzalloc(dev, sizeof(*formatter), GFP_KERNEL);
+	if (!formatter)
+		return -ENOMEM;
+
+	formatter->drv = drv;
+	formatter->map = regmap;
+
+	w->priv = formatter;
+
+	return 0;
+}
+
+int gx_stream_start(struct gx_stream *ts)
+{
+	struct gx_formatter *formatter;
+	int ret = 0;
+
+	mutex_lock(&ts->lock);
+	ts->ready = true;
+
+	/* Start all the formatters attached to the stream */
+	list_for_each_entry(formatter, &ts->formatter_list, list) {
+		ret = gx_formatter_enable(formatter);
+		if (ret) {
+			pr_err("failed to start tdm stream\n");
+			goto out;
+		}
+	}
+
+out:
+	mutex_unlock(&ts->lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gx_stream_start);
+
+void gx_stream_stop(struct gx_stream *ts)
+{
+	struct gx_formatter *formatter;
+
+	mutex_lock(&ts->lock);
+	ts->ready = false;
+
+	/* Stop all the formatters attached to the stream */
+	list_for_each_entry(formatter, &ts->formatter_list, list) {
+		gx_formatter_disable(formatter);
+	}
+
+	mutex_unlock(&ts->lock);
+}
+EXPORT_SYMBOL_GPL(gx_stream_stop);
+
+struct gx_stream *gx_stream_alloc(struct gx_iface *iface)
+{
+	struct gx_stream *ts;
+
+	ts = kzalloc(sizeof(*ts), GFP_KERNEL);
+	if (ts) {
+		INIT_LIST_HEAD(&ts->formatter_list);
+		mutex_init(&ts->lock);
+		ts->iface = iface;
+	}
+
+	return ts;
+}
+EXPORT_SYMBOL_GPL(gx_stream_alloc);
+
+void gx_stream_free(struct gx_stream *ts)
+{
+	/*
+	 * If the list is not empty, it would mean that one of the formatter
+	 * widget is still powered and attached to the interface while we
+	 * are removing the TDM DAI. It should not be possible
+	 */
+	WARN_ON(!list_empty(&ts->formatter_list));
+	mutex_destroy(&ts->lock);
+	kfree(ts);
+}
+EXPORT_SYMBOL_GPL(gx_stream_free);
+
+int gx_stream_set_cont_clocks(struct gx_stream *ts,
+			      unsigned int fmt)
+{
+	int ret = 0;
+
+	if (fmt & SND_SOC_DAIFMT_CONT) {
+		/* Clock are already enabled - skipping */
+		if (ts->clk_enabled)
+			return 0;
+
+		ret = clk_prepare_enable(ts->iface->mclk);
+		if (ret)
+			return ret;
+
+		ts->clk_enabled = true;
+		return 0;
+	}
+
+	/* Clocks are already disabled - skipping */
+	if (!ts->clk_enabled)
+		return 0;
+
+	clk_disable_unprepare(ts->iface->mclk);
+
+	ts->clk_enabled = false;
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gx_stream_set_cont_clocks);
+
+MODULE_DESCRIPTION("Amlogic GX formatter driver");
+MODULE_AUTHOR("Valerio Setti <vsetti@baylibre.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/meson/gx-formatter.h b/sound/soc/meson/gx-formatter.h
new file mode 100644
index 0000000000000000000000000000000000000000..05670c3dfb9f43ac3ee959f1d3d11bacee020c43
--- /dev/null
+++ b/sound/soc/meson/gx-formatter.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2026 Baylibre SAS.
+ * Author: Valerio Setti <vsetti@baylibre.com>
+ */
+
+#ifndef _MESON_GX_FORMATTER_H
+#define _MESON_GX_FORMATTER_H
+
+#include "gx-interface.h"
+
+struct platform_device;
+struct regmap;
+struct snd_soc_dapm_widget;
+struct snd_kcontrol;
+
+struct gx_formatter_hw {
+	unsigned int skew_offset;
+};
+
+struct gx_formatter_ops {
+	struct gx_stream *(*get_stream)(struct snd_soc_dapm_widget *w);
+	void (*enable)(struct regmap *map);
+	void (*disable)(struct regmap *map);
+	int (*prepare)(struct regmap *map,
+		       const struct gx_formatter_hw *quirks,
+		       struct gx_stream *ts);
+};
+
+struct gx_formatter_driver {
+	const struct snd_soc_component_driver *component_drv;
+	const struct regmap_config *regmap_cfg;
+	const struct gx_formatter_ops *ops;
+	const struct gx_formatter_hw *quirks;
+};
+
+int gx_formatter_event(struct snd_soc_dapm_widget *w,
+		       struct snd_kcontrol *control,
+		       int event);
+int gx_formatter_probe(struct platform_device *pdev);
+
+int gx_formatter_create(struct device *dev,
+			struct snd_soc_dapm_widget *w,
+			const struct gx_formatter_driver *drv,
+			struct regmap *regmap);
+
+#endif /* _MESON_GX_FORMATTER_H */
diff --git a/sound/soc/meson/gx-interface.h b/sound/soc/meson/gx-interface.h
new file mode 100644
index 0000000000000000000000000000000000000000..c6b78635d7807333e4cb2f09191e29390da8e077
--- /dev/null
+++ b/sound/soc/meson/gx-interface.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2026 Baylibre SAS.
+ * Author: Valerio Setti <vsetti@baylibre.com>
+ */
+
+#ifndef _MESON_GX_INTERFACE_H
+#define _MESON_GX_INTERFACE_H
+
+#include <linux/clk.h>
+#include <linux/regmap.h>
+#include <sound/pcm.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+struct gx_iface {
+	struct clk *sclk;
+	struct clk *lrclk;
+	struct clk *mclk;
+	unsigned long mclk_rate;
+
+	/* format is common to all the DAIs of the iface */
+	unsigned int fmt;
+	unsigned int slots;
+	unsigned int slot_width;
+
+	/* For component wide symmetry */
+	int rate;
+};
+
+struct gx_stream {
+	struct gx_iface *iface;
+	struct list_head formatter_list;
+	struct mutex lock;
+	unsigned int channels;
+	unsigned int width;
+	unsigned int physical_width;
+	bool ready;
+
+	/* For continuous clock tracking */
+	bool clk_enabled;
+};
+
+struct gx_stream *gx_stream_alloc(struct gx_iface *iface);
+void gx_stream_free(struct gx_stream *ts);
+int gx_stream_start(struct gx_stream *ts);
+void gx_stream_stop(struct gx_stream *ts);
+int gx_stream_set_cont_clocks(struct gx_stream *ts, unsigned int fmt);
+
+#endif /* _MESON_GX_INTERFACE_H */

-- 
2.39.5


