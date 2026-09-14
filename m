Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B49AC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iLuGPJOul88SFkcVl5PHBDFHBc0tVdx0/BNU/eqBS78=; b=bl8Z1N/cZSxZzcugARHdI1gn0H
	1OuBtXdIz/j1gIf6I7rq+HqhuO7Z7ZeSyIRRqG1k42++4qg3zPQklZ2JnJdVPNrR6jy7On0VgbZpI
	Hh5m3SA7yyMjZOiGHllLWCY6el6hFImZUM/IFkl6aT5lMlQkMmtsmtyq2IACeW4fWKCExXsmcaFTz
	qe/7yHObIzOTAmZzKa6okL494LwegH1xWA2x8Snte0A5ShYRmZ1Xs8+FJ8jek4x/kWJNMWu5+l73o
	IMRXXIydL3wEZ3cW5uWuQYFOIkKYHy4MYg9t6ngbI1kLCt09a1KcfnJLOUYicuxMF92hwugXMi3kt
	UcLw9MSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x618d-00000002ZAN-49wz;
	Mon, 14 Sep 2026 07:30:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x618U-00000002YyI-206D
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Sep 2026 07:29:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=iLuGPJOul88SFkcVl5PHBDFHBc0tVdx0/BNU/eqBS78=; b=OWZ6bGvXbR4jmJ1Gqbjcny0xAc
	aNy/FCByIjdzd9Q2MGzHtkcfboOczxjUFK1JVjvjwv1SSwHwHEeFt3K4xdX7XUgBUU7Vg615GB7Ss
	uzLfKMFqJCowb7wiOc26N4nIuz8eIjSlAITF4jx+FaxWIWs5910XhIwu+BkLBQZGbpFTPtn97mX35
	lwfGsTixqEI9ijNglERtxvbP5wzmmL7Moj8J1HnVqXPdLWZW44YcQ8SeegJd0MQqaZrUkDDTTxVBh
	rDvM1PK13HIBx9+1S49hBQRS/V6f+JzchMov0MD0k67P58qJtitw3VnK6LX8vueMPwULpT4uIJGwR
	lJA0dWOw==;
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x618N-00000005KuI-30DS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 07:29:53 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso4493680a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 00:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370985; x=1789975785; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iLuGPJOul88SFkcVl5PHBDFHBc0tVdx0/BNU/eqBS78=;
        b=Jssms+F5q8oi5rGyClEj76JgNllhhtkif2DxxtgpSXR9Sy+YzjBcz/RSVCqsz54sbP
         Eecy7hBKT4ipcrelY6THxlpY9yikZf25XcXJdBrTHzP7rM+aakc/HGr7zTYAU8Noh8MD
         +Lhf8LeaxBtX6jYQv8qTGSHSRfSgMTsfO2K9mOyyhhXB5A9zELGkYOXb77/iXjLkAsIl
         TD0VEb3bsXSZxXnXvVbaSDYHZT8kNxTqEM6f/ngj6mvPtvTP407slWp0SDBSVGtxLd32
         YOle1nz75FSMIgBcPzVVHPmQz0TGYKVQTS9UzK6XkFxwkH2uOxHw7ohpZ4r8nxT7y+9y
         KN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370985; x=1789975785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iLuGPJOul88SFkcVl5PHBDFHBc0tVdx0/BNU/eqBS78=;
        b=Ebb3/1YzFlczgxeGd3qQST4kEO/iEiAl2miHHDyUNA/vUDvfAhMJw3p8tGzeGy8gC9
         EMjTVAQ+DzUdRs9bg9bvju0a+eHgT6cFEksrSfC7W7v8CyJYEDJ2kIxC6Bw2BCnFoMPs
         A2nNeFHDUyeKVYeuZgLRwrs1KgjJQ3/ODcnK3IQx0OG4pw0qLBdPjwi6q3vgjiCfe/PG
         ZI4bjVkBcjU0zHTMm4rlApbEMXN9Ea4PILwlOPV2dQtFz9tFbbU7DIvWEv8BfzFpU9Fx
         XLWM/H5iA8If4uPZhXEC371IhKJvKrcxRK4YQYsbAK5+5psKOCx39+HmmjdiIlcQxYpC
         EYjA==
X-Forwarded-Encrypted: i=1; AKwUvBwMk5Fek96JLIOTFs3B7fj8JIb60Ul2Ipr4oPjsF1pEZD/SDp2Lu6mRTRpwxQEyY+ULSLhDsAjGxF1aOWcLe50P@lists.infradead.org
X-Gm-Message-State: AFuF++njEWlPF712PPnU80YyUC70+ClXGERQKWIIUX2+aeW05E7SChY6
	FMdd4kZKKVVYdkHvfl2oddF8GwZUK/ZZu4l8lBzoudt/iBIClaQHNkUC
X-Gm-Gg: AYBFou32PGDaaeNPRQI6S3PEUwXFFQzetZTnq4eCoBcZbhttCFvkUBk1QTROYs7RvPC
	Wl6dnx7AuXkDrlGeNlQXnY43XLodGB1ylzJ3S3gPgFI/zdX01NapDppcvxP0D15PIuqrlevrh3r
	V1A2TuLGMWyI5izHidvQ4luAhsZNMQD1PY69ZWBUq6BhMQmcc0J9CtgVNybzvWpRzvT5on53BC2
	nKeJ4gRMlxJG04+rF/AVAQ5/XMeRz4TtYGRdUAnnAj6ywJJ2/2vqixEd7Xeknh3aHRQaePMRHtt
	d6Hp23NELKGyCq1ZUgS7SVEoQCznLVD9egLwEnwVWqyZMCL+PcvhGHObD+O7r5G2P1xo1QipKMA
	oXwqNieNtuBy6LSTMI04fGtDxW2SoqIC9BY7eJaACvcUGRmq7BS+GuqG0s7W46fMb8UmKD58TvG
	rihJd159yIu5NcbsvAP3xUGB7qs+wm03xHvFc6Rsnc0n6XjO1WZkhWRcaPK6ZDWoT16L8pw4CC6
	sR06y0BnLQAwrIL34XdPLtrNaYrgiNngwM1usoUmICoLDBIJn0YMOxFWtHdKBPsCWc11f/CgmSi
	ms4dPBEOz6N5VBJF8WoKZrkPeA==
X-Received: by 2002:a17:90b:2809:b0:396:d27b:89b9 with SMTP id 98e67ed59e1d1-39debfa956bmr3527909a91.10.1789370985063;
        Mon, 14 Sep 2026 00:29:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:44 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 11/13] ASoC: mediatek: mt8189: Validate sysclk frequency
Date: Mon, 14 Sep 2026 14:28:40 +0700
Message-ID: <20260914072842.24420-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_082951_250490_A9B2564A 
X-CRM114-Status: GOOD (  11.30  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

A zero frequency causes a modulo-by-zero error when validating the
I2S clock frequency. Reject it before performing the validation.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Check for zero frequency since freq is unsigned. 

 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index f20dbb410223..2202fed63fc9 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -1286,6 +1286,9 @@ static int mtk_dai_i2s_set_sysclk(struct snd_soc_dai *dai,
 	    dir != SND_SOC_CLOCK_OUT)
 		return -EINVAL;
 
+	if (!freq)
+		return -EINVAL;
+
 	i2s_priv = afe_priv->dai_priv[dai->id];
 	if (!i2s_priv)
 		return -EINVAL;
-- 
2.43.0


