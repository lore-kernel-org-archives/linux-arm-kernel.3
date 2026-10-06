Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54431CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j534rI2GLWoLqHJsJ1LpomelkSLlLDjBn+7y/CTenmI=; b=peOdLjYJWzhC+L8o0lDMcPpD5I
	zKlebWK/VL8G3I0IwltiozaP6ywuFITzXj+hONad1BRye67dWfNodagO4Kxl4CnbDVFA85Q785+Ga
	oTSghpGBeQ02SVoUhX4pGLEizFlu++yUgbGGqLIOlYSa/1PVeuTtmOelIACyUvcVNlUrxNr7tSHad
	iLx5CuBSJzy06J6szRazDlGlSbx8bMbGirccZYbm5nEnVM5d6d+EJd496vBLZfLeqpEdWw0flKjtD
	Eis4n770qUgCdZQzUlS/OxGeHdBdYv94NxIDL4nQny4Tekwe5O05ekyMpAbtZXfN47WODX1Wjlp4S
	GXZn8QZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2Dz-00000000Tj1-3cHS;
	Tue, 06 Oct 2026 10:16:43 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2Dv-00000000Tg8-2AlB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:16:40 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-86b41d77a05so283067b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 03:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791281798; x=1791886598; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j534rI2GLWoLqHJsJ1LpomelkSLlLDjBn+7y/CTenmI=;
        b=SDLPivoK+7aHQEjGVd085drIqN5L9gATS1PWCeSVqOoq46C2G1J4JpoyrhWKNmbdwY
         Nel78U9mlAoJeV6eOuepx7Vgfcwp6AykObL0gCGym0deOOKe7POEMUM8EnCGT28ZMWs0
         zrasugIiCNxFRy7ut9Qmvd3BQ/jODwHwBnSt+fTPjElASLtmmD/RFXqUljANMH7eGeTW
         kIWrpdSkzG1vFRD352OUG6hj0c/fvDJPF3wDS8ZDM3wMg5w7l2QuxmjeTfVUw94Mcuac
         i6YjCV3rg+m9/O6Oj19tolDGKagGTr+6QHYRfWGnjdXiVReJrnp0H46FrS381Mi/pNWJ
         K0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281798; x=1791886598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j534rI2GLWoLqHJsJ1LpomelkSLlLDjBn+7y/CTenmI=;
        b=NL8Lm6Biir7PPLwgohWHIGBDy2rgz/HOaew743igB4N3dIzrdoq0PksX0n3otW1gE4
         vbu429H4qKbdVNj0y2noJD7VoNzhzDdVw49y8twCwSby5LTJRb3YocmBDTUWCWw/BL8A
         yYhj8TvqmHFwr3pbY2rzHG4O0eEKoFOzDwuBhlyjsZSRR9Bkp192CnzcNl6vBR8jaort
         ihYigghDLT65giOh0Hk+N/L45IvxSbe/ka9fzPCxRC57y1NZjam67YJQwTdRkGjz+q5Z
         G6tkxOXQRfic/Ls6Skme4Jd735j0ax1Kk940fQB1ZrC4bT5ydFfHAOMsO6qQE0H0A3FW
         BBzg==
X-Forwarded-Encrypted: i=1; AKwUvBwsPlbBZrzPk4yMVK4mYjCVn1Y6TeGb547jaLyuPDxaOscPCjFXB2Dfhkt4SwrBQ/3jhXYwevlVloH5VUbD2TmO@lists.infradead.org
X-Gm-Message-State: AFuF++mL+qNmPx9hk9XqBUdoR+hCZKyl96meFVmdw/jFwilonAHVTjQW
	rIyWQ8HgeE8vdHC/UgkHQGTaouTFHwru5o0pRpOSxphGhcpsCDc4yFs8
X-Gm-Gg: AYBFou2OUfCY5T5C4uaBdI2BNfCz5uFcWrFzaxxTGnK1I8O8Rcg32IqHeFJKUl5LYHQ
	furwK3DH6GYUw9oM50jtisiRTiVQd68ExxzufrFKxB8lDyXGOtCoU+032jioxG5HwVxXB55xDXE
	vUigJb1vKGI9rcCFaBJToCjwYYfBmHBx0XIntNL1WgIAjbEcgA72efsq5SmvpVamiKAlKSmF85B
	lCoi2AakhGnjrxw9qE3zKbeLnN75dI0h4CtRbWyftswNjkVizlAz9+Z6xwYz+/duhknhlHwZj4O
	Zf8S/QBSoHy5e1Tg1z5htSvy57FEwVtXREv7Pet+DEhvap4/At3W4JEYvluvuilbOeLstXdiI2L
	aKi+UkkNzkqdK7tV/E/sshaFHgoOB7zxY8OJuy1STLDHg5Lkw/H1TdX5Fo/zTc8WP+fXBctj18w
	iVvvg9muAIydk7oMz+ct1RQHeM0081FXfKVdjSQQT+Jy/1ENytP/z5PPp6/gYiBWto5HSFpNZm3
	IrgdtnSPRx9uPfcoYBDxy/6KUsO+daI9/S5JKE5qffq6fhOx4lqN0s0UozSREzS4zPOrt49LKww
	GUJ4VAapfJzk8A==
X-Received: by 2002:a05:6a00:181c:b0:88b:c67f:a6a4 with SMTP id d2e1a72fcca58-890deebe383mr750381b3a.24.1791281798496;
        Tue, 06 Oct 2026 03:16:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d152432sm4547505b3a.53.2026.10.06.03.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:16:38 -0700 (PDT)
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
Subject: [PATCH 2/4] ASoC: mediatek: mt8188: return 0 from mt8188_afe_fe_startup() on success
Date: Tue,  6 Oct 2026 17:16:04 +0700
Message-ID: <20261006101606.54079-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006101606.54079-1-phucduc.bui@gmail.com>
References: <20261006101606.54079-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_031639_565542_85A8CB56 
X-CRM114-Status: GOOD (  14.18  )
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
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 4010879ad1d3..87d6098caf99 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -318,8 +318,11 @@ static int mt8188_afe_fe_startup(struct snd_pcm_substream *substream,
 	ret = snd_pcm_hw_constraint_minmax(runtime,
 					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 1,
 					   MT8188_MEMIF_DL7_MAX_PERIOD_SIZE);
-	if (ret < 0)
+	if (ret >= 0)
+		ret = 0;
+	else
 		dev_dbg(afe->dev, "hw_constraint_minmax failed\n");
+
 out:
 	return ret;
 }
-- 
2.43.0


