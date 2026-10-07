Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7293CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNV1bGZ8s0HMJS7MZxacnD8sWRhxmo+yws19q0+WRZ4=; b=Fm7OT6o3fBIqoe1BHPScjeu4F+
	PH42PZbp4kgh1ZCa7TZH7d0Z7OO1PbD4bpqc9eFS3I+mMsBX8z1USy1IQr7Q7ryhmMu366rwH5feP
	EWZGfJ7cuIHx/3wMNuSauTJJ/i16EJtQX9Dcibem9tjWTOAJoONh2x3rIQ1rUEqpFF6WuvUkxWOyb
	x7FK2uFSr6zk2xBe6vbS1cKGIuy26rmvWPWg8n99PUTljhus/4GEW0fqidu4bN9uShteL8Nsa2ttj
	TMf4tcGeu9wDvHvQWV8/1HcSV9tTkjT0NYy+0XvzoExUXNeB2JRWqJKGxiSwlHJn2VfImmxiT/GdA
	9TzpYLQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPWy-00000002Gxa-0pM9;
	Wed, 07 Oct 2026 11:09:52 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPWv-00000002Gvf-0uu5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:09:50 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3a80d1c98f5so2172377a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371388; x=1791976188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CNV1bGZ8s0HMJS7MZxacnD8sWRhxmo+yws19q0+WRZ4=;
        b=FILUy/Ri2Q+Y5ttK5Cs0lYHTeDUlEk4yjCvVlU5DXrjCaVvLeuPppqwRZ/7FGqFtTd
         NtHQG08N+/QvngAUU4rLukvkDLA8AsY+7Hs8fnsuaIKJq7hflvfJKPeOTNuWO2MnCN/D
         jDEDnyZAsqGLJHRcelwu/ZkHuKcdiXF3a7Prf0bX1JRkLZnQwTgWctosEENjUJI8P1ud
         HNGBfZOP6rNbniAEy2WkTa5NWuw4Dh4e2TLOfLnIr5iTuMFKUZSrDrCMm5FrIE2C6hMJ
         nOiiN5SeJNHUe1T1270Yc0C4bYFfspUZJ4P8hatBbn9RhJpvSoP/tHK5av+py87nXHda
         2m6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371388; x=1791976188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CNV1bGZ8s0HMJS7MZxacnD8sWRhxmo+yws19q0+WRZ4=;
        b=WKxt/dC+yqXDQe1WWf6i24VsXZRzxIVGLZG+DfY9yROyP0u6XdX+DUAop+JiC18NcG
         X3/RXs5qnRS1CUKSPsKBvOxH+hVmrmNC8K+Mr2FwtoHKa7Cvtfb6vPx0+pAxRJ0wysF7
         VqthIJsCxmqEuGcuQytj2SFxrem9gigfff6IUINIrzb4SYncAxvGHfis/EjwKr0Qez8W
         0g6DHYfLRGoeJ6sY+cCxqnqQEmjeNZ3CYGv0beGuxDDP/aDY8ybX83xRyr2OXAJABDIe
         CqlrLfSi/BgunX0JKxG9hzsA6HlJ4XVdjjd9cVCNbnupHijeakomP5b+O9wPZBp5TjPD
         vPHg==
X-Forwarded-Encrypted: i=1; AKwUvBxfavMvyV9W6e+FQqg0KAqZhiVaJVYS0WfiLS1WFyi5gemyI1Am4ug31TCTFVREIqfipgftW8YWhZCARR0furYy@lists.infradead.org
X-Gm-Message-State: AFq9FYII4ej0QMSuh1299WflAj/g+5KJnIOUH3Ge3bu6G2tfxfKLiDQK
	kjZx6+U0C0Ay9rSn47mvJP5q4GRWSL4tA7spb/+fg8G2IzVS0o+kxB0X
X-Gm-Gg: AYBFou2cYkvO/gR9DeFuuv94owuNKXUKUEOc3LMoQPY8yye+LyBL9HcmH2wEd8Xr5Ly
	/UcUPnPu/w2RLmGZjuod3H2Kpd0yjSNic2HWbmf49UCtjJe1/lqY96bdR4yuI3hFDzHWoy08iSf
	9f3/SMReS0lMGn1XD+YGck6QDVeHX8/kaG5o2f6z8niYoWdNeqJk2ObUvhbWiCeqgSjsqRCzgci
	t/OAcLCd/yn05ZMyMPLQIR5JmxP4KVq31+Dz05asLnIbumY5QFwvIq2JY6Q6MyyPLqbEQPY1VQr
	9RsN430OlcBWA86v4KI/1MTM6r0hERhgYNZrwDpaFMF7TPwhi/O7RA0EGo/Gja3hT0infRcEWLv
	7pYprPKf6J9xiSm00xUmY+Oiute7tnnOe4pqOyj4Cdz/7ijKJO8TE3EvZynLvrV3fHLVvdDotfz
	zjw/V4QDr9zINBqfEgLeCN/tlHnjz4JCd8zT0jyn532if8gs3LZk0gW/AdiX4BM9H7YYVSTZFUP
	S1M164FXTXRWmjLBw19QP8OdSWsmaLfchyAhZuS72t3UFasOYy6OyPUQsYKg1YQlFJr/UD2OT8Y
	TkEju/rdUIS6ng==
X-Received: by 2002:a17:90b:288c:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-3a8a1969c32mr1650916a91.18.1791371388256;
        Wed, 07 Oct 2026 04:09:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5ec70dbsm1328745a91.2.2026.10.07.04.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:09:47 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Tuo Li <islituo@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Garlic Tseng <garlic.tseng@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/4] ASoC: mediatek: mt8188: Handle constraint return value in FE startup
Date: Wed,  7 Oct 2026 18:08:56 +0700
Message-ID: <20261007110858.509341-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007110858.509341-1-phucduc.bui@gmail.com>
References: <20261007110858.509341-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_040949_269326_4BF0F4FE 
X-CRM114-Status: GOOD (  12.67  )
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

snd_pcm_hw_constraint_minmax() may return 1, which is then returned
from mt8188_afe_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: bf106bf09376 ("ASoC: mediatek: mt8188: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Simplify the code change as suggested by Cezary. 

 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 4010879ad1d3..b2d935ae8668 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -320,6 +320,9 @@ static int mt8188_afe_fe_startup(struct snd_pcm_substream *substream,
 					   MT8188_MEMIF_DL7_MAX_PERIOD_SIZE);
 	if (ret < 0)
 		dev_dbg(afe->dev, "hw_constraint_minmax failed\n");
+	else
+		ret = 0;
+
 out:
 	return ret;
 }
-- 
2.43.0


