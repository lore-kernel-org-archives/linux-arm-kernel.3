Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0870ACD4F4E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 15:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDDrzBwWLv7cxXzysL5yYXylItmsqFDKcdeZuZx/a38=; b=3/UL6BpFsVHbLMuZ5dPNyfu9H6
	zAmQs7bcCehLywhIepD86lrG/J1jHJiQZz4Q8DTQLrDZz0M9cf0YVvK7hio92G6scWR2gk3EQwBYB
	ArSB6JezO3rHEM4CupfwDbwB8lCyvYPGV7bRcDp5QlgY5G9co+HocCL/YAsnK7rRXQE9V9mZj8HSO
	rOMgdj2L5UobXQYt+e5XQfaoLfID6k82vxZuM6jR2yOqci0+1wPqVo1ctEMhK2wnAr+XOLmBGNwVx
	0hkKdzF3vQRAwF6Cgf7g4Iy5Y8ziYBcW45zPv5bCL9KCYy279i8f3kbTsDrWMF1w1usH4fd4eF3gc
	lRo9WDGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuCC-00000008fAc-1Rjg;
	Fri, 15 May 2026 15:11:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuC7-00000008f7j-2zLs
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 15:11:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rDDrzBwWLv7cxXzysL5yYXylItmsqFDKcdeZuZx/a38=; b=p/nTJFlZu0YB9AqZbs5/sSLdJ5
	MznL+aMmgWzu/v4q5ZWlG7DVNJHAnu/hmskzhfbXWER0GoR8xysxi+gEb73FrgCPdvxuA7wrs7uVI
	Qw/LyOAPOjjtEAZJTsjuZ1MTvKmwpy+aVc3VOd91eY/WfYndIJ+o0yfXh/A2eiMmycu2fnrKG3d4k
	O5BwNVwS14CVsgYUEPcH3AiG3c6SHiJydS9t/PAeIqbwNdBgRZj4KbJKIsURh0Ad4WR0d4eIBI6Ye
	AwSgWmHuw22zmbm+6D4F9+2wmO25WBdBXJ/2Au9XFVE/ufXmWwNZ4GcMG8xbdOzb+BSgto05quiVv
	qDR8LNEg==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuC4-00000005XKe-2tDb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 15:11:18 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-449de065cb3so8536483f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 08:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778857875; x=1779462675; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rDDrzBwWLv7cxXzysL5yYXylItmsqFDKcdeZuZx/a38=;
        b=Tt5qtDUH3vkzCy1du1eV0CoQkoOO3UcusdyDzPSitWLUAFNmbgQjF857fJV7Sk6q75
         +Omems9+AdR8zqUwSMXrcRxn+FvotIiu3/f0QQjjLJGP5OQDJYrWCNFgkCZKpSPBbvhw
         QGo7p+fNh4AhIT9t9QcOuKQOKZJpK1YkDklf+j6PNIG/oWtBtSrQP0icOB7wz/gS7pQ1
         tMIhDHI+R8SJxNCsu5BGmklcIJ9hiLMR9vfW0btQhhDUqBRphTESVE6Sb/s8kJwLk2Kc
         WyUpZesafXNx7ebsuggvk7CSs8ZV0Qhpu62usU6k98NPqdQ/oWpXJeQnIxuER/uJNxnR
         cECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778857875; x=1779462675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rDDrzBwWLv7cxXzysL5yYXylItmsqFDKcdeZuZx/a38=;
        b=C6EZZUPQKxUvy+yDgHemjw/+KSdSqXO0cicbboMi7+Hg1RCzwWS0nobjjPPOcbjxIo
         39iY3vi+483VPUKDO69OBPclzTZMb/p3dybDy3/IpaxZGRkQu6Fs5yR6IJ7O0uBK/6PW
         eldjVUweWmMvySnyw5wj80G2FJwe5greKQmbVQY8e1Un7eimqXeIZSdH/lgpAZnMByzG
         6LOh+t6zSwBaBxzrSomI1vnoSNpAMqQk3J3KfX6neEg+ofseAeyk3Wzb7QzDyVq93Kmj
         y2SFiUd1Xg6ER2V2XLncGdcAnKZBn4x5xaFAdjk4hEQ//AYTzo0BxwKx3L5Gh4oyPUOa
         8M4w==
X-Forwarded-Encrypted: i=1; AFNElJ/oKJPIH+jyXsfQ1jllij9ytXNwWPEcxNeA1gMXpJvlCDODWT332K7oV7mAuxONNUN1IMRNGNpFHZtfvQoUx6F6@lists.infradead.org
X-Gm-Message-State: AOJu0YzETGOHESbFSMLryx9Qw6fLupw0bFmlpVJPCuBurQlm4zzocR1Y
	3cKBxKDatZvq4tpfcgkeRNypPUVIkaUs9oPDuLSYEGI09HESIIHTTkjUJFxRtKrohVU=
X-Gm-Gg: Acq92OHubt5iNsqHZBl8Ny0HOyyHBqG8pRTFP4zHCn0U4UIbAsz1AwodsgG0XgI4AzK
	rSMi7eFeaZSppclQPc4KeJ6Cg/bn4xkGirvUY6Is+i1Sys+LqvjcgmE6X04eB7/QFInvR+2j5ZN
	r+MpwDALqA8PU1duZNl4QsoB/YxKOUTtPoZVWrMGavDhxTNbQnNXEx5VfSo++07ecLX9ICIUzIn
	aesJPVZDnC/ce1CO7b+vh2ImA2LErjH+5ptsrKMRYHY0ivpui/ezuKhIHPNrJiJtwbRrQNQrwaW
	VxQE2G08iad14xocPtfQBmNLYqqAAOL9rqMRUykMKIzWoTykE6+u+TaO9NksqtLIitQhMuR1CJq
	ib825MdXeP6s6TWly8lYOFuEgmiRqcUhMEzJLF2ofK+7qu2OG8mJ6B2BOzc/CzvxTCaEPS/Ar42
	0yjgx+JGubCrqoKMh80cSt
X-Received: by 2002:a05:6000:250a:b0:45d:4b37:7fcf with SMTP id ffacd0b85a97d-45e5c58951emr6150818f8f.15.1778857875103;
        Fri, 15 May 2026 08:11:15 -0700 (PDT)
Received: from [127.0.1.1] ([151.41.223.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19c2dsm15262062f8f.21.2026.05.15.08.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:11:14 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Fri, 15 May 2026 17:10:37 +0200
Subject: [PATCH 1/4] ASoC: meson: gx: add gx-formatter and gx-interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-reshape-aiu-as-axg-v1-1-53b457784ff3@baylibre.com>
References: <20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com>
In-Reply-To: <20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11315; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=j6Zh4RLoIBZtyp/kwYar+Xu3SLB01yR+UX6gB7d84TE=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDFns5v31Lufn3Togwrkoq36i9Qw/rjX9GdeMVPrFWk+yH
 Fun+Muto5SFQYyDQVZMkYVl+r3fBaVqD40TThbAzGFlAhnCwMUpABM5xMrIsFjmd/bqK9ytE3dO
 Pvxcr6I7fsrG8NwWPUGJH20TdFW3mTEyTJYTNnnVqf89bObMKLn4HxtbVkpOFO5mvtskMT9jWUI
 /FwA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_161117_127021_AC4849CC 
X-CRM114-Status: GOOD (  29.73  )
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
 sound/soc/meson/gx-formatter.c | 277 +++++++++++++++++++++++++++++++++++++++++
 sound/soc/meson/gx-formatter.h |  47 +++++++
 sound/soc/meson/gx-interface.h |  45 +++++++
 4 files changed, 370 insertions(+)

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
index 0000000000000000000000000000000000000000..db93546ed9217f711fcdbeddbd815ce21f27bab5
--- /dev/null
+++ b/sound/soc/meson/gx-formatter.c
@@ -0,0 +1,277 @@
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
+	if (w->priv)
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
+	return devm_snd_soc_register_component(dev, drv->component_drv,
+					       NULL, 0);
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
+	ts->ready = true;
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
index 0000000000000000000000000000000000000000..d9ab894589fa039f7fdd76765390630a2c6d8fbf
--- /dev/null
+++ b/sound/soc/meson/gx-interface.h
@@ -0,0 +1,45 @@
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
+	struct clk *mclk;
+	unsigned long mclk_rate;
+
+	/* format is common to all the DAIs of the iface */
+	unsigned int fmt;
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
+
+#endif /* _MESON_GX_INTERFACE_H */

-- 
2.39.5


