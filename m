Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24876C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 04:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHaGtDWIabgwE9bMPCVResetCLU3h+f9hWvuf0/laf8=; b=qtL1JPujpvtKIh9TJEA3A0xKkt
	XP8ccC4AyZCKsTcYqYEijIQsgPe4c8N1T0oqlu5r4X+jzkmDU0AkPqjKwkdBxwLMPRgT2LYoRJQws
	YnzaX39j/6LPix1hfyTXSaKRbApO3+RwfRlpM1I3Q6eczQE0pwEPT3Zth3iqO2EDHftitQXGWKVGA
	iIxGXq6KuwjH/a3y3Q2X8x/EF/MTXgXWcExVAjLUPs+JiW8ZvM14aenlnfDP+zloyw0GKsz4CAndZ
	gt1e8/AvM6HsJt7PjoY1A4yFAMhHw0ZAg45UDI+4foSsOihhCTrfWh1dJ6pH1Q6obH2RTdseXz+FB
	bNtIoqqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zRW-0000000GLaj-0jKD;
	Thu, 03 Sep 2026 04:52:54 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zRS-0000000GLYV-2bCW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 04:52:52 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-396750cfee6so1645489a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 21:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411170; x=1789015970; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aHaGtDWIabgwE9bMPCVResetCLU3h+f9hWvuf0/laf8=;
        b=L4n/IjnMWe8u9ojAErzissk94cABSeScdlukMxdHpDx2jKpKqajV3HwtTY7n9l16VP
         SpAC+01cGdK7D4kjgdi/Imv+TRmSwvlbfCctXBdKZmHZwxPPZfaTmrsKkvI/TE0hEx4a
         a4mTXMvf0yNQL+2Q5VkhZW8bjqTEsM1iwwzf9kJIKs3tKesp1XXhs0bZX4l3OzWY23LC
         JrUe+uJJb+7ANwxDLBZZGBy/jSvcG+5s9es5n8LVPj2YqLtW9bRmUP/ypMnyWSK8O8p7
         pLoqjWLAwIoedpl35PQHTds61LnobKNJeXrhRD/vExz0Iemvn/2Vyws9081x7q3VBVkd
         mKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411170; x=1789015970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aHaGtDWIabgwE9bMPCVResetCLU3h+f9hWvuf0/laf8=;
        b=G4orVVphZH+io6batyykHhIR5KLYoTohaimWrhhJAIlymAZWsY912rAHKAI3RKUnit
         tLSVpmJ5Hz2Wr5MbIBOQrVfSC234qaQPFFOz8kc9ZyVBej7dRi9EH/X5noRtYYf6fEHS
         I1/8dH7VSWUFUdp0YS0Sx4FS+iVEcfpvuT6mWWBjOAK1/r0LUKCkAwRqFh/r08kc3Naj
         7kCieAz/zaUKEQiuG6HgFqQ5qf3H1RCKcvVCGWBvAvAb1dp24DdHrMZr87H0uR5Q47tP
         X4kQsMyO+EBXTLvG87mXm4jdOxHoyxdaHzXI9FCVLvewJpmwkqRAGSZenMy+QV9ol5Px
         QKIA==
X-Forwarded-Encrypted: i=1; AKwUvBxbhJkwWKJbfJSqm5CacALaFr8XhW73pT6Qj3L6CIaDK92wVlm4isF++g54QHgvKhJ1iQR9GtvnLtPp9fh6+gHR@lists.infradead.org
X-Gm-Message-State: AFuF++k4ejSYRTRSTsDUTOiZiZrqGsThyswSQpnKagxU1kjBprYXvBqY
	fFFQKzbsq80qewjVGS/tLSsmvDQjTF6NQDkIDonTG8NP5N22AG/T+YhP
X-Gm-Gg: AYBFou20Og6mSQHTBZA8n/I7nZMd/8CnuGaMQD3qq4VK0x/trXoGAytmxSpLLp8jSS6
	vaYZaUcV0rtcJHOWPKEmT1YIry6wJKOpCBiKl1HT3qjXxOCgZFL3ZdPEoVM5dmwbteACitPEvFF
	Y/OO96xwIyOLiVGrNgsfyOD0iwqVkJhAngsSzrkwor3Mr4+B0pgW46qNdFVAObpkWATyVbuUR52
	Dl5m0BfEDfBUQetvAqmTocRndW/Z/zu4gqBFqpvUF2PZlThUcsbwOetnXlct0v6gge0Gg8GweGg
	vQO7Cz1gw3W09ze0bXYcqhor2t3e8JBYEn2SGizeJ+4mTdujjayZEeO7mrnAV5y44wGhuGncpyv
	wPxZCUUSzNj4eck/rOVxoRvZ3LjRwVARPaKS6zKwxcpeiZsbatmznqwvxIIuiM0mXArkzhVaN+8
	UcPp1uSPBKSeMtGjZJ94oPGdULf8ky1qmCivAhlOO89SMRYVdBOFVqzGllby97xcpnYi04itTqf
	o9ZVFJgfkekaMTjVaRLAvDqZIbUdfkFidLPtlezR5zhRXO+kaPB6zRKo9RuO4r0Z95QZUdUt5Dg
	KGAf
X-Received: by 2002:a17:90b:1811:b0:398:c724:1bb1 with SMTP id 98e67ed59e1d1-39aedee9313mr14120611a91.8.1788411169700;
        Wed, 02 Sep 2026 21:52:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm2747538a91.16.2026.09.02.21.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:52:49 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Shunli Wang <shunli.wang@mediatek.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 1/5] ASoC: mediatek: mt8183: Fix wrong clock cleanup on clk_set_parent() failure
Date: Thu,  3 Sep 2026 11:51:59 +0700
Message-ID: <20260903045203.175337-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903045203.175337-1-phucduc.bui@gmail.com>
References: <20260903045203.175337-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_215250_674283_74CA5AC3 
X-CRM114-Status: GOOD (  13.58  )
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

In mt8183_afe_enable_clock(), when clk_set_parent() fails, the current
error path incorrectly cleans up the previously enabled clock instead of
the clock used by clk_set_parent().

Fix the error path to clean up the correct clock when clk_set_parent()
fails.

Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add a Reviewed-by tag.

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index cc4f8f4d3dab..6ab0734ad136 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -137,7 +137,7 @@ int mt8183_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIO],
 			aud_clks[CLK_CLK26M], ret);
-		goto CLK_MUX_AUDIO_ERR;
+		goto CLK_MUX_AUDIO_INTBUS_ERR;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
@@ -153,7 +153,7 @@ int mt8183_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIOINTBUS],
 			aud_clks[CLK_TOP_SYSPLL_D2_D4], ret);
-		goto CLK_MUX_AUDIO_INTBUS_ERR;
+		goto CLK_AFE_ERR;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_AFE]);
-- 
2.43.0


