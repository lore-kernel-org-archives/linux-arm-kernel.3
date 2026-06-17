Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C92CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8VWF2SeEtHF667M6jhaZnBwcldxW4ZuQhlBOZBeK1Y=; b=JaYha5kSko1V1CfkSC+GOvKO3E
	KziI5riHpRO8qk1m1kzwyRG0sE/sbOZW86Ui28yQcsPTebXTMgS5hLvC2Od91/CC+oFvcyWcZVAk1
	YQ30RCjT+k5NcghBesqKJxNezgW2MISUEkm7c54PGevBIcuYVyhZLoiAcZHB+6Bllip+RfcQNrBUI
	l7VnyTMGAhUopTYrcKKBQKUuX2g3VdWCc9qwOtB6iU91LJju7eL6t+FhRq9k7bP9bm/xhbuUorw0O
	Byfs4Dq9EQnxqiSI+VGKe2sVNRtBAf4gM02++eYhCkaXuWx5vQ6cbEzTWFPYvWMXApdUw99WVgjUl
	E7vtHR0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZncS-0000000H5TG-3L0v;
	Wed, 17 Jun 2026 10:35:40 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZncR-0000000H5Rg-0bMk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:35:40 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-304d8362a58so601381eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692538; x=1782297338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8VWF2SeEtHF667M6jhaZnBwcldxW4ZuQhlBOZBeK1Y=;
        b=Uq01J7M6G/Rvpgd6N0G1rCWcJHFTilwjpaopMtk/YgS62ktrU99pX/SbuZgdR0XwaZ
         uYp6JiyUq86j+P05mb4wEPCr7Ok/sY5FUueC+E7mM/hpq5u0bKsxjAoVFrujP5wjaSwI
         JqM3qgHKbsJbwhsFuiWZ9qzsizQWeUmI+wPHFkqmK2rlzlIZ2oYjkemzdWsFNOQIrjA+
         aOSVeOmC9KwTBxa6hzp7CdVQ/uDTZ5LcA3uLyrWfteNefFELNpk/z5Pcw3hlpnUYSEm7
         LpknKgPvwe1WJn5jt8cZE2bCmDhJTn4U37H3SDYrhom4GKMJiRjpCYGCruXX1n9KT5jN
         JvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692538; x=1782297338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y8VWF2SeEtHF667M6jhaZnBwcldxW4ZuQhlBOZBeK1Y=;
        b=X15CrPhwOYLJC+M6cMI55OyPGPDqiAjZAlnuSJSCoW474NUVPe8+XWQP3qCY/oDEH5
         sg5CwW6RLc6phQ8ZwzfuS7o1y7KUsjaEcNF5bi6i4GKtbBuNz9veK2ThHnkQm7742kg5
         iyl84PEU0Eh0I0UQFgN1vJl1Prpl9XKtFpiWAMXICxq9sq0qtW+eWcMNveKk3xRWslaO
         3mBfPZ9roOCQzsL3vVEbVYvD/c0be4rhkky4tnu2WpE86TVez/yV6OE5/Cp/k5+FoNsf
         wMg2rCGVCowQvBwbkPuCAlmaWY19W7lg9bgjZoyfDqrG3ashlbQ4jTFargyncmuOPLzZ
         qynQ==
X-Forwarded-Encrypted: i=1; AFNElJ9k6QWcx7iP3ZzuhEvw+0lgyDvqCTt2U8vRru6OXDXcn2Dtxvp2a5y0yEpW1XchSxEDFm35q6zCSdXWYx8eZ3dH@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb4DHk6bLEnDNj2qS37PAR0oT7B3fBDF3CNIt/myxqJdWRzq1L
	RpX1ZXRSU7qURqdYw4pPLCZXXqAsVzLPZRVeODu5ZcD9ZNRWnFN6RnoU
X-Gm-Gg: AfdE7cmt7quqgXx63I2Lu+2emBZI7b/BWjJiAHlaj8o7nBRVGhKUmaTdSBOMTlTSe7R
	l7Mo7lT/ryvmVtPSfj8R6mI8+wWWGaL3vABGFZjIe7dd4NtWo6EzQNet4zEJv9HklrSTrZ0VKMX
	bwbqGNlLd/IGeEhbNaGcEMlc74tjGR6A9rKnQYIgivPwsU9dspNUCSXtTNvbI9n6Ehzmlw/qZRp
	pp2EkXYaS/uQ6mAvSSlqy2qw1SKjUgHNHGMw6a1ZnRgUwOd7asdeEknmDvpF5xFNIpBJoSE440b
	yVQ92HKwDt8/wdW3ZAUOIyE2qiFVYBIW9LzE0/ClGx42MSafmtGL4W+kdfD3PzNefb6BcrCj9sX
	2BVGXT8IBEO4g9AeqlsPf6Q2TRLoC2VjsFNn4pml9e/cEss0kfK8u8kkcrRsd1l1ZtcTMHlUlv1
	37SDOvo0aPcKyVx5wUShQ15GRwz/lCm7pLEmBXBddPBZH8HnM=
X-Received: by 2002:a05:7300:6420:b0:304:bd90:b88f with SMTP id 5a478bee46e88-30bcf5ff5abmr1289238eec.9.1781692538389;
        Wed, 17 Jun 2026 03:35:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:35:38 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 17/78] ASoC: codecs: cs43130: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:34 +0700
Message-ID: <20260617103235.449609-18-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033539_188349_CF7D6E05 
X-CRM114-Status: GOOD (  14.88  )
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs43130.c | 96 +++++++++++++++++++-------------------
 1 file changed, 47 insertions(+), 49 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index e7b06f962790..5e7472e9e107 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -818,26 +818,26 @@ static int cs43130_dsd_hw_params(struct snd_pcm_substream *substream,
 	unsigned int required_clk;
 	u8 dsd_speed;
 
-	mutex_lock(&cs43130->clk_mutex);
-	if (!cs43130->clk_req) {
-		/* no DAI is currently using clk */
-		if (!(CS43130_MCLK_22M % params_rate(params)))
-			required_clk = CS43130_MCLK_22M;
-		else
-			required_clk = CS43130_MCLK_24M;
+	scoped_guard(mutex, &cs43130->clk_mutex) {
+		if (!cs43130->clk_req) {
+			/* no DAI is currently using clk */
+			if (!(CS43130_MCLK_22M % params_rate(params)))
+				required_clk = CS43130_MCLK_22M;
+			else
+				required_clk = CS43130_MCLK_24M;
+
+			cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
+			if (cs43130->pll_bypass)
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
+			else
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		}
 
-		cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
-		if (cs43130->pll_bypass)
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
-		else
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		cs43130->clk_req++;
+		if (cs43130->clk_req == 2)
+			cs43130_pcm_dsd_mix(true, cs43130->regmap);
 	}
 
-	cs43130->clk_req++;
-	if (cs43130->clk_req == 2)
-		cs43130_pcm_dsd_mix(true, cs43130->regmap);
-	mutex_unlock(&cs43130->clk_mutex);
-
 	switch (params_rate(params)) {
 	case 176400:
 		dsd_speed = 0;
@@ -881,26 +881,26 @@ static int cs43130_hw_params(struct snd_pcm_substream *substream,
 	unsigned int required_clk;
 	u8 dsd_speed;
 
-	mutex_lock(&cs43130->clk_mutex);
-	if (!cs43130->clk_req) {
-		/* no DAI is currently using clk */
-		if (!(CS43130_MCLK_22M % params_rate(params)))
-			required_clk = CS43130_MCLK_22M;
-		else
-			required_clk = CS43130_MCLK_24M;
+	scoped_guard(mutex, &cs43130->clk_mutex) {
+		if (!cs43130->clk_req) {
+			/* no DAI is currently using clk */
+			if (!(CS43130_MCLK_22M % params_rate(params)))
+				required_clk = CS43130_MCLK_22M;
+			else
+				required_clk = CS43130_MCLK_24M;
+
+			cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
+			if (cs43130->pll_bypass)
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
+			else
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		}
 
-		cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
-		if (cs43130->pll_bypass)
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
-		else
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		cs43130->clk_req++;
+		if (cs43130->clk_req == 2)
+			cs43130_pcm_dsd_mix(true, cs43130->regmap);
 	}
 
-	cs43130->clk_req++;
-	if (cs43130->clk_req == 2)
-		cs43130_pcm_dsd_mix(true, cs43130->regmap);
-	mutex_unlock(&cs43130->clk_mutex);
-
 	switch (dai->id) {
 	case CS43130_ASP_DOP_DAI:
 	case CS43130_XSP_DOP_DAI:
@@ -988,14 +988,13 @@ static int cs43130_hw_free(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct cs43130_private *cs43130 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&cs43130->clk_mutex);
+	guard(mutex)(&cs43130->clk_mutex);
 	cs43130->clk_req--;
 	if (!cs43130->clk_req) {
 		/* no DAI is currently using clk */
 		cs43130_change_clksrc(component, CS43130_MCLK_SRC_RCO);
 		cs43130_pcm_dsd_mix(false, cs43130->regmap);
 	}
-	mutex_unlock(&cs43130->clk_mutex);
 
 	return 0;
 }
@@ -2132,18 +2131,18 @@ static void cs43130_imp_meas(struct work_struct *wk)
 
 	cs43130->hpload_done = false;
 
-	mutex_lock(&cs43130->clk_mutex);
-	if (!cs43130->clk_req) {
-		/* clk not in use */
-		cs43130_set_pll(component, 0, 0, cs43130->mclk, CS43130_MCLK_22M);
-		if (cs43130->pll_bypass)
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
-		else
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
-	}
+	scoped_guard(mutex, &cs43130->clk_mutex) {
+		if (!cs43130->clk_req) {
+			/* clk not in use */
+			cs43130_set_pll(component, 0, 0, cs43130->mclk, CS43130_MCLK_22M);
+			if (cs43130->pll_bypass)
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
+			else
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		}
 
-	cs43130->clk_req++;
-	mutex_unlock(&cs43130->clk_mutex);
+		cs43130->clk_req++;
+	}
 
 	regmap_read(cs43130->regmap, CS43130_INT_STATUS_4, &reg);
 
@@ -2215,12 +2214,11 @@ static void cs43130_imp_meas(struct work_struct *wk)
 	regmap_multi_reg_write(cs43130->regmap, hp_cln_seq,
 			       ARRAY_SIZE(hp_cln_seq));
 
-	mutex_lock(&cs43130->clk_mutex);
+	guard(mutex)(&cs43130->clk_mutex);
 	cs43130->clk_req--;
 	/* clk not in use */
 	if (!cs43130->clk_req)
 		cs43130_change_clksrc(component, CS43130_MCLK_SRC_RCO);
-	mutex_unlock(&cs43130->clk_mutex);
 }
 
 static irqreturn_t cs43130_irq_thread(int irq, void *data)
-- 
2.43.0


