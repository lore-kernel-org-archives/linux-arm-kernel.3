Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AF5C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 12:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Do7a7ymRYAh80Ie6O6Ei22SbBIZZ1+J+po/v0yFfkwI=; b=DW9mzRW1yWP2o53ALbHcXFcpdk
	s1UtneBhk+h0YUiBPrZod0MKFP//jaGpLT7sPROnvKKqe/zWs/KuMBcZmBnWrYMQuaVqoz3tcXjy7
	+1Lu0zoY71xXCrfRCQGAwOZBld6VDn51Hd9h4xOb0QsAIGx2kngonbTt5F48r3JA2FwRqV1ymTPSH
	GMaigXzUvtnafcCsaPUe7H/hge7GKMro3EpOpIW1sAK82DTac9HMHlQ9vE+IRPt3rGFSn69Ni3oSo
	I4EBbhYY4HwKyZl4FjsVVqoytXYLHEGm6PSqgoJTNEho4OR0Ol+kw6KxWNbUr4xbxlnrAnRE1N1Bv
	lBhMCZNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y4h-00000006kHn-3YYR;
	Mon, 07 Sep 2026 12:03:47 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y4e-00000006kG2-1I0b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 12:03:45 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ceab75934dso33081805ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 05:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782623; x=1789387423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Do7a7ymRYAh80Ie6O6Ei22SbBIZZ1+J+po/v0yFfkwI=;
        b=gvrehwo05iVU/wi+ExU58fSZ9RDVVPHd4SkMix2K1tJV5/ju+iQ6UKk1mhncIkxbY9
         iKl7+RYfpieVTgGc9PcBC1cnXSG/DQKHrOUg3OHHWCdxlw3sNJzk2DCQAcVgWZgj7Uit
         XAoqyrX9YQlLwXlBM7T5bQWKQ6TQfrnI2LYWJximBfJfVDnKRAsiI2wxc/F66vGMOPow
         qlTARb3sMXBkcCJ1SaThkVqpImql1O8IIB2CSi3dJVz020r0ZCj1pUhk1ldPBETtWqf/
         R2YUuv7NAaBIpHDx2PkSl1/QMmWdyIHVCxa19Mp30FgoBnYTxEvnxGXq/ApTojtGA5yz
         XHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782623; x=1789387423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Do7a7ymRYAh80Ie6O6Ei22SbBIZZ1+J+po/v0yFfkwI=;
        b=WeWQMZn6Zgbw5MQ+jUupwQqRSSsNKydfKTncMnqViZLqKJ8mOEkkdWdTUL+pPgxqsJ
         KgqpQhPEuFDP6mT0IixRci6KjQk4vdbXQItentpw1LNT3MIpY+0fCMxwJcTC78k67QJp
         0iWmvUrtZpM+6MmS3XCLd47JIqc61AnfGsMoNdO9r+GFcE1gDdJq26TK15KUjTelPnlj
         pWhTZjTLguiJw7VR2X/7CFp9HgRPEr2km7aiQ+MEkhPK+k3hF4di30ZbbVcn918nYFVi
         H8cY44po0vNg4hkxjZ5jcYKTl0CzYRIq9crqKQBZrRFHu/I09/pzT0AiYlYmqyexMsis
         kCKA==
X-Forwarded-Encrypted: i=1; AKwUvBy/hZzDGrhg/ErUciQJ5d+zPwsndSoSswuvsT2QiJgpPav3sKLpS+6FlhKaSwGBVLKNzfkPn/gI87e4H50qqSEV@lists.infradead.org
X-Gm-Message-State: AFuF++n1QQVlL3SgdYvYpxy9OxiKHjXbt7LuiIDX8r2pD0LDRic3g+jZ
	i0L7Q+DqzBtkg+DH0p7MACpQoQ2X5KHY+BqIqBjrVzKCIpH3skSytEWg
X-Gm-Gg: AYBFou1ROJxDT7XKfYfaRXEO6I7+6jL/KsuncEjAljpyP1SsYmn55pd4a5q1SjeV3+H
	oTnZsgcHrfPaAeddlUyvC/VoGoidSOK8Hqy6N57YBXSzy/V9XpXX3/8a/A6bnGs7hcc6LcWfikB
	RITrS/iKYL3bNYEM/roQ4A0X48SO0Aepk+QPsjJVS4dXys6WEjpm7v3nMBTKxWm2ClDImxhY5i1
	F7w3Je//JeAstbbQ5rccpJ2p09ZFh5IiiYprMJr+wD1jenjQ/few+ffaBhA7ynDRYniKDWOnWMO
	4T24rf6TCYtZaV7Hp9eDjcSZjPC9kTvq0P0HV0mq/3jjN61h7fUfJDpzFL3iLL1mfCjqoumGf4e
	p9CtUg2HhZKodYk61Sown+hW/IBhXdDJLFIpaQ6BhCKhqFYZBVrJ/+SXuSmBpsj3fuP7IPiZP/m
	6kzD9WUHXzu/IsJB2v5nqqV8KLrMlYTA1WuijNI+3xXQEqH2JtHtWJJlxmmA/hjs5F1qmblWVoR
	h82YlXVAn6OeTLahbExJZdKsimEH3ZqhaGbJsfTcyysz/AB7z7TVizzJpIkkFsWcc3TQoz0Hcva
	E0Rc
X-Received: by 2002:a17:90b:3c05:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-39b26106c44mr34312637a91.10.1788782623126;
        Mon, 07 Sep 2026 05:03:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:03:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/7] ASoC: mediatek: mt8188: mt8188-afe-clk: Propagate clock initialization errors
Date: Mon,  7 Sep 2026 19:03:04 +0700
Message-ID: <20260907120310.135693-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_050344_353778_5D161582 
X-CRM114-Status: GOOD (  11.97  )
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

Use dev_err_probe() to handle clock lookup errors without printing
redundant messages for deferred probe.
Propagate the original error from tuner initialization instead of
returning -EINVAL.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
index fc6cb3f0469e..42878c8a6529 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
@@ -416,12 +416,9 @@ int mt8188_afe_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8188_CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	/* initial tuner */
@@ -430,7 +427,7 @@ int mt8188_afe_init_clock(struct mtk_base_afe *afe)
 		if (ret) {
 			dev_info(afe->dev, "%s(), init apll_tuner%d failed",
 				 __func__, (i + 1));
-			return -EINVAL;
+			return ret;
 		}
 	}
 
-- 
2.43.0


