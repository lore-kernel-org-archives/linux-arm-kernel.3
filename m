Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464C1CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrZPU62D++2Mpf09f9HLGIFyK7TMDyESiaONSZX8Yvw=; b=wnrUbV3VImtGquzR4J9zUJrIFt
	ImVcZgjop/V+yrHqPfK+k2vnnsqZ+L3bumiopxMszdizYzYLlsFmHKqLS6J/uvEGqojqHFKJ4KhU1
	9WblB646xC/r93z6A08TJ4EOs9t+UJwjj9Sn29wFOPAXuRFysnHyM64WLg0B2vlaLsf3ayx/dMocD
	zyPAoDmJxPPdE0uWNvbOK9m2/knB8BKtJypXzMqw14JRaRS+DZGgJeHPu0qkt9byvXwf+Qn3xu6LA
	ofV81bsgyHq6xA3F64ZWpjhLiqaTTqCW/DVA5WF+E5WJnRdFkC0Uh99NzY8smw6ue18CaPPMqFwLD
	uh+Unk5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPXC-00000002H8S-2sCP;
	Wed, 07 Oct 2026 11:10:06 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPX9-00000002H5h-3RUI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:10:05 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3a8af3a704fso240725a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371402; x=1791976202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrZPU62D++2Mpf09f9HLGIFyK7TMDyESiaONSZX8Yvw=;
        b=KZ7ZKc7ngobJE9hDp/DfqTqzhrMZiB08t0tY2nALoUOIrvYTlEBmlr5nohCiKoJ9E2
         W8rOKGqE+umlr6n+xVicM6//X5dE2pnY+i3E0L2ycnb36X8muQTiupRBQb1+kvBsdte8
         XebKSrLhmGEI9+2ADojvP7fXgowfESetxVnQcuWEhI43LmhbOQbOe3H/I2mTXyjJ8itx
         Qe5qeT/8IFLIVYKoAfB6Uc8PcL5pALJaWjWi941uamE7oQA3nsdqPfvtrcGJ4UOpfWAR
         2sUCaqypPiO9YzMrBu4Dz4EVJJgLLDk34EUEgr08Q9WkKWOIPnJ08s/AaJ7sQAOWzclV
         uo6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371402; x=1791976202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrZPU62D++2Mpf09f9HLGIFyK7TMDyESiaONSZX8Yvw=;
        b=oIoqKRpCTKQFP8MEEX1M2X3Uz8FD3yiSeDwQi4HY69eITudtJ8mfAXv9BpIYZNx2Tr
         xM8s+x7Xqqzp9aNo9ZnLjPtzy4I+MY2jAY47DZeb5PW97myFx+B5L6w+RB3dZKoBhXd7
         AnkFAGxCSSh7fs8LVn6RSRiROhwiUm7rwlbXkk3K9ishsZ3NIcNYAqW3gRSEGBUiXQGU
         /9CRViFuOM1D7MRTPzlXV2G+RjKTwjRouHpEWwL5KhpU9b+rE+DCZDdJ1odXDvhPU+Fu
         bqKkKbs4YDei3DnXRWe6uJfORswOgeoWN2QiHrfmS9E+aOQqGaVHmSVWUxHjD8fXgtQD
         8gIQ==
X-Forwarded-Encrypted: i=1; AKwUvByNWIoaeO3KVfuUcFHxvC2pHLlH/AHZ6Dtz3sFGub35z5dGhdpIFbA0SpLAMS9EZxeAFCjxx45CZ6VSHhqixMfA@lists.infradead.org
X-Gm-Message-State: AFq9FYLe9yOWrxrmoX/Mi/+4XRfNCkCw2qS+/S22JFb39L75mtS4zMNv
	yck67l3r7iU8ZLAQBlHabCn2sM6uKJNIKqXeBkel6pMk3Lyv0uhO+PHd
X-Gm-Gg: AYBFou3FnQDYSc5RfhpEwQcmZATpZ9IhkooEUqUMncKQm6o6vV5a2BvAjdJULgqv9HZ
	2JwN62C54KZt+FMhVTmuwkFvu+rBGlcWWwDF+hK3sZ8CCqYP1NMhTaFoL8bubqWpPlaNKs6eHUF
	BhiVnGPGDdGRX3/JygJ5KrRnWIkP7IiEXy3BrLZVVPhBLnuqbjSXCHeNgudXpTUFFZd5oaNtt23
	16pKGTJAjcBwqqJpzzL6ycCNpXG6eDFPGA1SnQ03AU3vQvjLBfz4rUZEdrFNFlG/DA6vtN9OnLL
	Bf5nJxo21BTLIOqe8812umuZmkeKbBEYlq9PhcLLkYYr2j9Pgdk8V/4IT4LCyrcf8nruC/VHJK+
	16xFj+BYC6DFIJK+0y64snVRKOVTaAi2ZWkbecz8OVDWwWwfTb3CJ+XtYiI1EXQmKuuzsMuKWL2
	QcOmK4PCHQ2vq0uC7TRiEkR7c4cyhA4vcov/i2Qj4LCPII5g+2rRaZa1FniWCAzOBkwBVuniuQ5
	CMyaBs0KNiaSrES75KBdvg9IcL/oUdmaaU/jKqh0WxQkpgbMqcXCS0DkJtEtnTDcPR2R3X0RUOU
	UW6ujzmZM4eJKA==
X-Received: by 2002:a17:90b:4cd0:b0:3a6:f1d2:57f8 with SMTP id 98e67ed59e1d1-3a8a08354bbmr1628776a91.2.1791371402126;
        Wed, 07 Oct 2026 04:10:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5ec70dbsm1328745a91.2.2026.10.07.04.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:10:01 -0700 (PDT)
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
Subject: [PATCH v2 4/4] ASoC: mediatek: mt8365: Handle constraint return value in FE startup
Date: Wed,  7 Oct 2026 18:08:58 +0700
Message-ID: <20261007110858.509341-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007110858.509341-1-phucduc.bui@gmail.com>
References: <20261007110858.509341-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_041003_857560_38F194CF 
X-CRM114-Status: GOOD (  13.65  )
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

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from mt8365_afe_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: e1991d102bc2 ("ASoC: mediatek: mt8365: Add the AFE driver support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index e9497246f37c..314235557fdf 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -514,11 +514,14 @@ static int mt8365_afe_fe_startup(struct snd_pcm_substream *substream,
 	snd_soc_set_runtime_hwparams(substream, afe->mtk_afe_hardware);
 
 	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+		return ret;
+	}
 
 	mt8365_afe_enable_main_clk(afe);
-	return ret;
+
+	return 0;
 }
 
 static void mt8365_afe_fe_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0


