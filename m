Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D16CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 21:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wcd9+cR2Lw/1NK825QM1reyVrOzsO3D1IfFbzXKQDk=; b=2NFDPB3lcW9U/iOrnVyYlcqggf
	IA8L+iWNIeKoBAl1i1ITPD+Kw29ALRfo1XtuDNxTsFryNftSSyVFc/YXYs6med7jAdefp3EPS0Q1A
	X9ZYDyZuPSBWiumCOFeBw2Tp2eh0nqcZXK+qkqaPdEghApngGGwa1efF2yNsV6gDI564aVygD7SfI
	GFqtKTxxrzxMy39Y9Y74fVKkjs/Hs1T4pYodMKtJMdjQtvYDq2iobN91wZ69cc+OXR/7sGymca4kB
	PqJePO8eh/4iR2e3ZDK9AWRNuC08V9yxYR98ON/H1GgNPPnEXW9JZSY/7J6wgGDROHGToHMvhbGz/
	5/80X0QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXQUh-00000008NWC-0ggf;
	Wed, 10 Jun 2026 21:29:51 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXQUZ-00000008NPl-0ScR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 21:29:46 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490b3637b90so62522005e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 14:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781126981; x=1781731781; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1wcd9+cR2Lw/1NK825QM1reyVrOzsO3D1IfFbzXKQDk=;
        b=liprM0wyVq82uptKhteFWtMXD4stXLynj+3XapamCTjSfT/Nq/L7x8OY0Edgr2rfZx
         kSD0TTj1LInS4y0Cc3Ui4vubGZ8+awwQO+K5AwTXNhLeIBuXNwbWB41VlFsP59eat/9r
         PU8fBSTc3niFWEH40VuxhSxUfTeFo/uslQeUyAWZR0sX2Lsjt4s6hXPltF336O8wJFdL
         iQVa6k6eMCa7G1aNQxfpyXWqnB10BPl1V9t2HqAA5SRSLrNnA6YTUElAlyTN4Zoi9xr1
         PlqAtnIQS7oxcbTEFLSwUqvXTo9Noba6MltyoLwgUziUz6E+RQfuv8FWYBV747u/p30/
         f4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781126981; x=1781731781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1wcd9+cR2Lw/1NK825QM1reyVrOzsO3D1IfFbzXKQDk=;
        b=FIFIXiJ8/uh6SDQKXXheHjRUjFeELhBsyXapZV6aOb2iNDjlPUdKt3PF3QEGuUy9yO
         Ip71gmFUsH9JY22dmOt7EoJV+X5U40c7axcjqDLtJprTcfdnTCnT+cM4N6zg0GuxnGoN
         XcFHbcVvds6lrcnFx0VUvjSPxd8/Bbq0ElvqtTR1EbWhwIErqmpGDG7HLHzUWHjj4d8m
         q+wvYiPhkyi49DGURhIc4IdV0YuccBTgfAk30CYXO7wXKpdSblpOCYDjeuNfAb2e+7OH
         DGKSGMU/9cUCLvqaHswLGD9MeFcCTGGa6JCa8CHBQJruY18s3ntQzmahDMGxWUeKeWzS
         8z1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+N8EIFHN3UQWQzCg8Q60hu0Xx46pLXG+U7ldU4NE8GHjlBhEar9nC4jZcoOulINZC3/vrwpTNgBWW4WF+wQs3e@lists.infradead.org
X-Gm-Message-State: AOJu0YzPuDAkj6mK9J1ai/PoNdeKX0lQ/lvGqtCRqde8v8zmsVev1Gxz
	cCK9eGeD5n/dfGerTMHwNYOYtxip67o1LKgrJh50FyJZlaluT3/RmWinOmTjquOTuf0mHSzam4C
	ASAF6F3Y=
X-Gm-Gg: Acq92OFkTdnnaiWxSCNfCMgktYAXP11MT0Zv5jynRx6f92Wftqu1FJ8Okrdp5FAJScv
	6LJFCPgD+piw09MFI4wiP3HDUy05J0qSx7TmIXqYAL81ZnNjJwJfTWcZ0PFEBIx30Iiwf6vVkYL
	krXGkY1xBP21tSUKJ4auHUza9lAtSLdSKMCwLMm56muj0SfiOg3reHqvuCYvBTmdWJn2VHdhZ2H
	+ohA+iKhWFptD4zYLsA7PkOB+wkocCgr3kuzZLvgYjj/KlwHEkxvDBAoA1BBFr8+/k93hmUIIHS
	rxV2v548z2VhNPghBBJvV0sLT14ghrtjg0I31q2+a3deDamxj3yFWLZAPOldTYSkD8xAyW4Vj3p
	g+bTwm/JWqj3LC3/GLnksykHTR92X1K55GxoFJvWRnnXhINzzvy1aItJG4MTvGpGFomzreEBp3x
	PDrldDPSvOhPfpskSOP5jq67E/QjaAPNpNmtM4jU/JRA==
X-Received: by 2002:a05:600c:1f83:b0:490:b724:5085 with SMTP id 5b1f17b1804b1-490c2621a5cmr438401955e9.33.1781126981257;
        Wed, 10 Jun 2026 14:29:41 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.238.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e4228768sm970965e9.0.2026.06.10.14.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 14:29:40 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Wed, 10 Jun 2026 23:29:27 +0200
Subject: [PATCH v2 3/4] ASoC: meson: aiu: introduce I2S output formatter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-reshape-aiu-as-axg-v2-3-cac3663a8b51@baylibre.com>
References: <20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com>
In-Reply-To: <20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4373; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=1AVgdXapivwMhAZ343GX8lNmX+kCIj8zw6th//wHOqE=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDFma1x1ePSnd+f7CXK14q9JTSbxRaod51PSMRfyvXwktf
 vji6EvfjlIWBjEOBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAExkxkKG/zF6VifmBpzlkO6s
 8ijzNUq1Tgrem7vTZ5OM5hGJ6LVZjAx/eP/+0Hc0Lo466hPUnpKyXyPg0Nf83a2c1Z+uHf3/+tx
 xfgA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_142943_182058_4E32B467 
X-CRM114-Status: GOOD (  20.24  )
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
platform (see axg-tdmout), where basically the widget/formatter corresponds
to a single audio component. This is not possible in the GX platform though
because all the features are currently implemented in the AIU audio
component and changing that would require backward incompatible
device-tree changes.

Therefore aiu-formatter-i2s is kept very simple and
it only implements the bare minimum functionalities to provide I2S
playback formatting. It's not a standalone component though because this
is still belongs to AIU.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Makefile            |   1 +
 sound/soc/meson/aiu-formatter-i2s.c | 104 ++++++++++++++++++++++++++++++++++++
 2 files changed, 105 insertions(+)

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
index 0000000000000000000000000000000000000000..b4604734fe88da2acd6e5c2f9f59e8ecb0a017a5
--- /dev/null
+++ b/sound/soc/meson/aiu-formatter-i2s.c
@@ -0,0 +1,104 @@
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
+	unsigned int desc = 0;
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
+				AIU_I2S_SOURCE_DESC_MODE_32BIT,
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


