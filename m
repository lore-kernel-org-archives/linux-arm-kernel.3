Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21CFF3ED4F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 14:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kImEqI0xCMuGmoIKI0CGRRt1bkclZfcyl+UtBK7F4Ss=; b=MtlGMmJ1tpqZt4XF0nDisKkqhy
	hqhR8Z7GDd0nE4cHeGNvih4TQgxUnavqAkcGkhAfbrd461r7XQDS2I7TQNP5YYG714f9riWBSGDC5
	Brn7nNeDiZQCKcE+Q+XUOJps7SKkwNNKOohTyLnLWA0lvcJ5POt2mZgkj8dO2KmpNj4FG7vO9OcTb
	o4tUiMeSNEtKFEk9fLcvgZJz6iaML+JCmFl+JIjznAWrwloTG3Uus1rRNIPBdV99zEZS15TyXSEVE
	Mofm5BU2/k3HjzyrPCXdFJ7fJ/7AIsjetTjEvb/+pCTxZgaoe1kbfXnqTyD8f49oXMXJGo4hkz/TS
	W6w7zOJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZmk-0000000DXiK-1KJJ;
	Sat, 11 Apr 2026 14:58:10 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZme-0000000DXb7-13SJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 14:58:05 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so3213585e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Apr 2026 07:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775919482; x=1776524282; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kImEqI0xCMuGmoIKI0CGRRt1bkclZfcyl+UtBK7F4Ss=;
        b=sBQkhnvSoCBvN0ERJtoTNA5HuHcfIXX3El74V/QgbmMwwKmyK9c2vS7y6aIsczBcec
         akxQ23e4ICRcSqgp51Mth8ywjEzT5YANt3ndzGZNYk6DArxR5ANHOhUmkkqHotWIzYAW
         l775aB8h89xNwJnenRDgl47qRcdMw6LLWIuXRzPNWKPolfr91Awpqpj7IxXfKi31iOI6
         xKUMDXYqErZ2xAhgCXsRUdDLzuf3OIyicSiFvASMx4Wk4ZqikRalgeDzso8nVROFcvZY
         6+uoXeP230ztvGk6jIkOx/YQr4ZMb8VhNNCJu1LAqBN4yrslZzMMDhL2YfWSCFLpzbcx
         Rh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919482; x=1776524282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kImEqI0xCMuGmoIKI0CGRRt1bkclZfcyl+UtBK7F4Ss=;
        b=Yosm07ecqBCNt8zAV8MjkL5LXFGA+F6LEklc2jDLpKzCQg+gyfgLlqnDshVmeKkAfw
         wKy6VwzI7GNin07Kf593HfhkZBDbCC54p8l0WtVcAH07HAyoKH263v96RNmmh7ejYNPE
         Y/H6mLf0Kgqxq8gV/37LMU2QW3pfIqXjYMpbKnZ9JHoNF2TQvEyOXRRcWZw8M/31Y0+g
         Taj5EB5NXgtCIpVECMiO6RHiZV8GGviz83L76dyBvZc/DsnFSOkD4lR6dYWeTja+52Gz
         6wfKVmQtFZK0+Y68U7Bqej7GTQWRELm1gAKQTv+T8jG6XEW8GUZTgWfEmz8z884NOpxT
         56kw==
X-Forwarded-Encrypted: i=1; AJvYcCXEMhQMqLk6FYw4fKIWw/IBbrZ30vRRgoDiTrg6dTQuFoc1Hb7f63WLHzPePBS1g2KptQD0iDR+olaFPzCUqbce@lists.infradead.org
X-Gm-Message-State: AOJu0Yxyo3yc5H3qc4Pa8QmxoP1U8LtQH/q05vG7/dLdLkAsLah0o1IU
	AYO0tyUoxG6QIN7Gx2Ymq84gUOI86J4KnEZMtO8Dj9fqghurl4p0pqr1pNu2+1XYmJ0=
X-Gm-Gg: AeBDies5QiPtbSHlmW6C5y9qwbtzTfYs+osbGx33qM8wkd2YYhcb0Z/QqPInzOgJ7z0
	M0dki7tVuscB0kP2EYSZwQ6hnfPqJ/VVIywDz7AjUzdEOsyNEZDbhOSHlxo9cQx0bpyrQBXSIdC
	mF//jdX6N9ZSgD/Lush4o9NQoVeU08TfAAQ/VeXnGX5R1TlstdNxHW+lnJ6S6qVM2r2ZTYT3Wxc
	NxRLUbdXoVdXLNm9t6M4L7mNbIRA6VDVjHAfpU8ikz7EyVaifsehGjqoo2ySxsAdWBkBlQEGkRo
	ophz/RkrcPSkMcA9RkstyYSq6+2JffavQRD0J4AKw3o9X0D0e6mxpP3IdNqY1b++pavY83o2csj
	6E1XVSdMxliBy6PprptBbJyYVAknLr3XGpIgiUII26EmY3kNFzOiycEPFEzAlNy48FVD2aMVDL3
	rZQ+RYNLz+V/DdFcgdHDA4
X-Received: by 2002:a05:600c:198c:b0:485:3fd1:9936 with SMTP id 5b1f17b1804b1-488d67b8d43mr91896385e9.5.1775919482459;
        Sat, 11 Apr 2026 07:58:02 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.248.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm48882375e9.10.2026.04.11.07.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:58:01 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 11 Apr 2026 16:57:28 +0200
Subject: [PATCH RFC v2 03/11] ASoC: meson: aiu: introduce I2S output
 formatter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-audin-rfc-v2-3-4c8a6ec5fcab@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4421; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=wXLRsbmPRrk2661x1UmBAXkax+7ikv0+c3YhjvlmDR8=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDJm3EosnHvX2S1hn1HVt8fpdp+xfn0y91sISLBCUUXGh3
 S/hZEJORykLgxgHg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACZySo7hf6Bfovuj2cvNZ1sx
 ZE0wepfPxjz1u6mR85G3WfYvDpVUNDL8Lyu166lb1MmmtD9m9g1zg5xMM16brOe8CY/etmhbVE5
 mBgA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_075804_326292_1350ED31 
X-CRM114-Status: GOOD (  19.70  )
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

Introduce aiu-formatter-i2s, a gx_formatter implementation for the AIU I2S
playback path. This is going to replace data formatting tasks that are
currently being implemented in aiu-encoder-i2s.

This should ideally follow the same design pattern used on the AXG
platform (see axg-tdmout), but the problem here is that all playback
features (including data formatting) so far are implemented in the AIU
component. Getting the full AXG design would mean introducing incompatible
device-tree changes. Therefore aiu-formatter-i2s is kept very simple and
it only implements the bare minimum functionalities to provide I2S
playback formatting. It's not a standalone component though because this
is still implemented by AIU.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Makefile            |   1 +
 sound/soc/meson/aiu-formatter-i2s.c | 106 ++++++++++++++++++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index 146ec81526ba091a174a113ce3d8412ddbbfd9dd..f9ec0ebb01f048728b8f85fd8e58fb90df990470 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -5,6 +5,7 @@ snd-soc-meson-aiu-y += aiu-acodec-ctrl.o
 snd-soc-meson-aiu-y += aiu-codec-ctrl.o
 snd-soc-meson-aiu-y += aiu-encoder-i2s.o
 snd-soc-meson-aiu-y += gx-formatter.o
+snd-soc-meson-aiu-y += aiu-formatter-i2s.o
 snd-soc-meson-aiu-y += aiu-encoder-spdif.o
 snd-soc-meson-aiu-y += aiu-fifo.o
 snd-soc-meson-aiu-y += aiu-fifo-i2s.o
diff --git a/sound/soc/meson/aiu-formatter-i2s.c b/sound/soc/meson/aiu-formatter-i2s.c
new file mode 100644
index 0000000000000000000000000000000000000000..c7eff04521de3c282f7f79864143e073ff1b2f27
--- /dev/null
+++ b/sound/soc/meson/aiu-formatter-i2s.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2026 BayLibre, SAS.
+// Author: Valerio Setti <vsetti@baylibre.com>
+
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include "aiu.h"
+#include "gx-formatter.h"
+
+#define AIU_I2S_SOURCE_DESC_MODE_8CH	BIT(0)
+#define AIU_I2S_SOURCE_DESC_MODE_24BIT	BIT(5)
+#define AIU_I2S_SOURCE_DESC_MODE_32BIT	BIT(9)
+#define AIU_I2S_SOURCE_DESC_MODE_SPLIT	BIT(11)
+#define AIU_RST_SOFT_I2S_FAST		BIT(0)
+
+#define AIU_I2S_DAC_CFG_MSB_FIRST	BIT(2)
+
+static struct snd_soc_dai *
+aiu_formatter_i2s_get_be(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_dapm_path *p;
+	struct snd_soc_dai *be;
+
+	snd_soc_dapm_widget_for_each_sink_path(w, p) {
+		if (!p->connect)
+			continue;
+
+		if (p->sink->id == snd_soc_dapm_dai_in)
+			return (struct snd_soc_dai *)p->sink->priv;
+
+		be = aiu_formatter_i2s_get_be(p->sink);
+		if (be)
+			return be;
+	}
+
+	return NULL;
+}
+
+static struct gx_stream *
+aiu_formatter_i2s_get_stream(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_dai *be = aiu_formatter_i2s_get_be(w);
+
+	if (!be)
+		return NULL;
+
+	return snd_soc_dai_dma_data_get_playback(be);
+}
+
+static int aiu_formatter_i2s_prepare(struct regmap *map,
+				 const struct gx_formatter_hw *quirks,
+				 struct gx_stream *ts)
+{
+	/* Always operate in split (classic interleaved) mode */
+	unsigned int desc = AIU_I2S_SOURCE_DESC_MODE_SPLIT;
+	unsigned int tmp;
+
+	/* Reset required to update the pipeline */
+	regmap_write(map, AIU_RST_SOFT, AIU_RST_SOFT_I2S_FAST);
+	regmap_read(map, AIU_I2S_SYNC, &tmp);
+
+	switch (ts->physical_width) {
+	case 16: /* Nothing to do */
+		break;
+
+	case 32:
+		desc |= (AIU_I2S_SOURCE_DESC_MODE_24BIT |
+			 AIU_I2S_SOURCE_DESC_MODE_32BIT);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	switch (ts->channels) {
+	case 2: /* Nothing to do */
+		break;
+	case 8:
+		desc |= AIU_I2S_SOURCE_DESC_MODE_8CH;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_update_bits(map, AIU_I2S_SOURCE_DESC,
+				AIU_I2S_SOURCE_DESC_MODE_8CH |
+				AIU_I2S_SOURCE_DESC_MODE_24BIT |
+				AIU_I2S_SOURCE_DESC_MODE_32BIT |
+				AIU_I2S_SOURCE_DESC_MODE_SPLIT,
+				desc);
+
+	/* Send data MSB first */
+	regmap_update_bits(map, AIU_I2S_DAC_CFG,
+				AIU_I2S_DAC_CFG_MSB_FIRST,
+				AIU_I2S_DAC_CFG_MSB_FIRST);
+
+	return 0;
+}
+
+const struct gx_formatter_ops aiu_formatter_i2s_ops = {
+	.get_stream	= aiu_formatter_i2s_get_stream,
+	.prepare	= aiu_formatter_i2s_prepare,
+};

-- 
2.39.5


