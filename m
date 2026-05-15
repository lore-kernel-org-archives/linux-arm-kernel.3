Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BA0CD4F47
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 15:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kImEqI0xCMuGmoIKI0CGRRt1bkclZfcyl+UtBK7F4Ss=; b=YAx5gWwrQZtvLCRslpd3F+cwUU
	lDiDeT7rjD1KqQrggymd7xDRqfJ/MMpEo7meCFUg0zYi1QF57Q6ZIhQ25xAuuqgq9HCLQytiuQkQD
	73HjNyHGl34R/HCM97Br941vGhnAL036MsBboJEJUiF77+Dzgxfunl6B8xagWDhUnBtc67eduZGxB
	g7Z2uyYK7K7QXSEHBNMBdv+I1d3rBGxuJ05Ldrm05kBVaJAvZPmQ3CvlJ+FkB4aFVdiV6XVfyimQm
	CI2lTFG0aDVjo2i4Clym5DkeH9PA81J1wc26qD2RmuK+SyW6WYuTUonbqDWlPen0BjemsxMsLhNvj
	v3PWDmnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuCC-00000008fBk-3dwy;
	Fri, 15 May 2026 15:11:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuCA-00000008f9J-3Vqw
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 15:11:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kImEqI0xCMuGmoIKI0CGRRt1bkclZfcyl+UtBK7F4Ss=; b=a1e57tEDyc6BSOsYP/3j2j0mcI
	+MtyQxFn/BFmM9F6IA9uQ0wN6JskM8kpiABEjKTucKZyjFWisE1g21CkbB+1z9lj2+rYmqfXCvFff
	yQyFgbXVwq+yqrJWBft81tt4zZ5ppA9rmhIZghUaWvBE7rQutOkwUf6iEcrRfGiLDkRy/DCWdyIYQ
	ZIaTuAH/BEMLIlnOlVy4p8YQiQYFdsC7IOjSdQVs2VXw1444BRy/t62f9+RHO3k/yOCUgv47eGGlD
	G+XhK+9QMH8Af+UB141lbJ9GAj2tqNa6z9Qhzf+zACY8aikEauflUcgqHxPyrpsM+ZbS9CqIOjdhH
	WqcwW8Xw==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuC7-00000005XLh-1CcQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 15:11:21 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso9161405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 08:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778857878; x=1779462678; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kImEqI0xCMuGmoIKI0CGRRt1bkclZfcyl+UtBK7F4Ss=;
        b=THe8ZxifFKeVXVxtwJ0RQMf4O+E21SJEW1gvK7fRsV8zT6KtUhaeq8PYbAURntvRWR
         22VG4WOM/4H/vqsot2i8Bjm/pUxw8D8qzFklj4ayLUWJZy02EFRRm3FqsI8IXBdhGS3D
         K6RcW6potKvbLHKSE1Et+Zj+BbHbhUToq428bpXVhIIcyvHMT7NWsLhtz1KuSwI0h1mr
         6sxRAAVOVRA/Iu0zFOstXwpwd1SOt3KmdMgxaDIQUqb5Aj3Ik68D9tHzZCAGRYEC5SRX
         LATwk1nDGiDp0AsnWI8Bnqi6rvjsHDVZSXBqNqJVbaxk/90X5Qxuw59YDKcei77ORv4O
         z0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778857878; x=1779462678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kImEqI0xCMuGmoIKI0CGRRt1bkclZfcyl+UtBK7F4Ss=;
        b=siIQ0nMTYoroXJNCPFwlWMbGb9OlSsn3ZMJ2THqhDK/j4xQKt/FBzXcUR+0mA+pzq2
         FluymwGZ5ZaypvGY1ntOcJ5HHm8/Kj/wjYanpDF+u+6dcSAri+a/GlcLEv9ajQVSZKCx
         Yut84QWNaVw/JjdQhzR7os9wFMTSu8F8iLzgj5YQB3w/udqvg+WfDGN8LVQ6Fi3/YaJ6
         Jax3GsXWet4AeRUDJozN10x2nLZaK9vOBzpu50zFO0rZtlUf5STptXpshNIdMueV5Prx
         pjwhJxpwdZAZ3NrXBJ/nA1CtS8iivBkZgy7PIpNoQ1dBsY/m13RQ5Bzs7Kjezf5q9TBW
         FPYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+RMC7oBzy0HE59IO0CWq/4bU5TL3w98+4KMFtXDhKZv2e4RZQBkp+Whh5mhCduHyftFp8OvxSIOyBkqw8n2rlQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7H3ZRJORanyV+NaCX+l0fRT3h6LnEsGLCQLhyDeEcUQhR+71a
	tKvU+GPR9ENdA/EEiYzai4QWYbQfoc/pcXivQ0FHNeAnY9iE5oSzdPGKjQLu6t61JOE=
X-Gm-Gg: Acq92OEqb4CdeBCHg/tqLUMmky0eDdVyfoa/BVfF8KCKG+6YXsyHaPkqHUbwgzGpc2W
	CrQ3rvuw6Iu39DJ79uF0ysSt7zT7DPm2EQi5tAOUvj8OWgjYAvP1DZUGvwS2NNjkvqLT1z5MEHc
	+8K1Kry2pK9Aq4qdr1r95m3BLHXtjHDXARN+k3VywS+GQrZZgFsnNWunNRjgY1JkclXgF/Q51LM
	tRTPvbH8cwLNdcCl/ZEqtimRhdQu0j/DXDzpEa1OzwN20Hb8vtS0vogvNLp0yGJGOjE9x2jqyFP
	TyskEbxrlKXW+KV/OuwIXQ9dcT6E0UpkbZD5TC9/FeILn1Rjzd1EoyrO4NctvQmdJk+p7VsqK0z
	l0wNk9tliVEUg90yqe250Z9dhF1yzdvyPzGyDlAKzTKftiXHkZRXy7/FZHR4uPJfl2gIN4XmrFV
	HvojUy+T48ejQDDX877UJgYP2CK047Dt4=
X-Received: by 2002:a05:600c:a41a:b0:48e:6be6:168d with SMTP id 5b1f17b1804b1-48fd6333317mr83104435e9.8.1778857877832;
        Fri, 15 May 2026 08:11:17 -0700 (PDT)
Received: from [127.0.1.1] ([151.41.223.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19c2dsm15262062f8f.21.2026.05.15.08.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:11:17 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Fri, 15 May 2026 17:10:39 +0200
Subject: [PATCH 3/4] ASoC: meson: aiu: introduce I2S output formatter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-reshape-aiu-as-axg-v1-3-53b457784ff3@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4421; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=wXLRsbmPRrk2661x1UmBAXkax+7ikv0+c3YhjvlmDR8=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDFns5hPy3xhovfLOb3TVEor+UPEoLmeizsMrXCYtob4e6
 vl7llR0lLIwiHEwyIopsrBMv/e7oFTtoXHCyQKYOaxMIEMYuDgFYCKzKxkZ3t/kCix7vmv955Uh
 65Rmz1sTe7T+/qO4uLANpgwSbHcOrmBkeB7h+O7ye+nJPlYCvD/vyCTP4xSazmuz6NSPsqYABYX
 LfAA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_161119_856289_3BA550A5 
X-CRM114-Status: GOOD (  19.85  )
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


