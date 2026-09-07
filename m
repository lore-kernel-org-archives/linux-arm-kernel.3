Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E756C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 12:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7h2S3qXgjH0d2/zuTeGXDlTjAza128Ox3NWLM9is1c=; b=GNQ7uXchWgqHHmYTIXayeZ3+On
	9Bm5Te2UOWp+d4HmncqOOH7Ncf2+usZi8WllTSYSX1DEykKf37I5qUegI+88ZcTyjAF182MjIVE4w
	vNtQlJiYD3ovsrEuHtju4hIYVCdJPmbmvpn3hblCyOdAiYFcYlxI8s5TGir/oKSi9z4IaCsjYyhrI
	nIX0UKjCrHiarHbJZfdRQMUKm+D+TgROPQv5qYV39PVXlBPwLBaSrng0WkuVb7nSb7s3iOWlIjpSv
	JyCHzWoTiLG2WWcnuaQS3kKgU2f9kmVHTHoWntTKvpjSI15RS3qF4o+wgcJlilB/ZdeaLdYzlmOoo
	LYB5DrJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y5B-00000006kle-2wFr;
	Mon, 07 Sep 2026 12:04:17 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y57-00000006khk-1A0g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 12:04:15 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2d942c7cc2fso27839275ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 05:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782652; x=1789387452; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7h2S3qXgjH0d2/zuTeGXDlTjAza128Ox3NWLM9is1c=;
        b=PVch0mF8Tyt1ivRvxlXAaR3ibL+f956MpUOrYSIREwWpCee6HAz6hCnwEUiT1mnwde
         fbnRHPCq7TZLtFaq2N0RwAY+VkgeYfjEnQ47Y/ak+cjcjIVnwwqkWvspw5fCbQUs4R6c
         60nh4LapgGzkpXNd2ZRr7CkdfXishlAcAPExpIicu9VOx2ySamtHbOC+zgBYQYFcwM7F
         VMEfkeiRzHn4jNugib+eQlocHScWxOHoEOT9f80JmGUYYa4dS5KKr4kpI3wgomb4+t6r
         Xhzah8dCiH0hxOjRpuGjQMk1YGjBpLy3K0aHW0kj/a4bqDQkEsS0jPI48RTeNXc0AW5j
         FYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782652; x=1789387452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O7h2S3qXgjH0d2/zuTeGXDlTjAza128Ox3NWLM9is1c=;
        b=HqP5eQimeNR/gSJ3rj3YQ9tlJRuyh/RsUBNv7bDsEvdiqH3JQ1bCjBhGZanBXzoCjD
         oW/C9AxBHoJ11dOIhvd4sOK+D2jbw9MU9xMsqXMBC98ctvxu2KZIIhpzq5RczTpJ1Ouz
         RymkPb0ddxPLXLDwT3Jekw1H0vlhii7hZ1vohxHlQnc25MQtxxH5AE8GF7WCKVglpdeF
         t8uRFHd7r7vrpDx1kFRnJs8SpVUOdIUXlxp33j6Ae/an/2m7inMdUK1PngzDSIvrkisG
         hj/N3EYAeDA75a2t0D645asSylFskhL31lIEI2fdbGcuVwXYeUHUcuKtL80rmDcxqydE
         z9aA==
X-Forwarded-Encrypted: i=1; AKwUvByL5ZHyJmk+UxNallVxMImjYKvaoKVJRvdPWCi1L+M1Zwpj/T1zTkyhJG/cxJSOQqbTneJ8azjzxQY5kzJrzTIj@lists.infradead.org
X-Gm-Message-State: AFuF++nCYPsA1wLWehHked++6lbFlCdGo+nUTpAPQcb3vS9iVbY8nful
	79YtxVW/2Sf7yJ+fA4evY7aea1DCJp/Epjl16uQjU2BgCeTpG9x1PTOp
X-Gm-Gg: AYBFou0KcxCcIoE4nZ8vGqjNo/otQCGFPIa5yLiJ/Whx8h46sIjll9kJtITJiOfSiIS
	9ih/y6LZYte9KNugCpWlT/zvR2hvd+Kk2nVk8b0oIemo8XiBddYa59oH9EiD/1YM7N/TbiY8+BF
	/mEUxUfN4rmuDG5MJhDiqXqRf6dSD4FQUy3QjaqvwVvPDhG89UP/VB2XLQGKSLY8+Ygq9uoG15K
	Ms0F3FQNSaOHmr330ZGY57FjIe6BsHmERuomNmy41GjJXnu6XFDPzNqGsDDwOqYvm2p6ewRbBd+
	TW1cMhDGh50JzxULU5pKydWChD+qu/ozsrSV/H5CdwRqAVbsdNFIhpUPYxP6meeHtIksWX0ohSA
	eHjm5ZfP7abgLo29a5UJC/WkS4pfFrN3b/f33QRiqXSIsm9TAbf1iqiKxjMRG7OsX7htpLgvrnc
	Fmqf6lCZFwbTn+i+iZqHJSyId/1IB6Ux5gSU//DPJ4DQDVlhYcyXSLmNlKfvc4irVs6/04baEJA
	Mdnvr616bC1t8f0R0IxmyCNPVpsTWi5SXLC9Dr5fIwvR/90PTY7GF8o0UKRph0F7f6ksepjyYr+
	N9Ct
X-Received: by 2002:a17:902:ed8b:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2db126d8fc2mr211708425ad.12.1788782652165;
        Mon, 07 Sep 2026 05:04:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:04:11 -0700 (PDT)
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
Subject: [PATCH 7/7] ASoC: mediatek: mt8188: fix clk leak on error in audsys_clk_register
Date: Mon,  7 Sep 2026 19:03:10 +0700
Message-ID: <20260907120310.135693-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_050413_312090_B3AE4E69 
X-CRM114-Status: GOOD (  16.04  )
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

devm_add_action_or_reset() is called after the loop that registers gate
clocks. If kzalloc() fails mid-loop, the function returns -ENOMEM before
that call, so cleanup is never registered and all previously registered
clocks leak permanently.

Move devm_add_action_or_reset() before the loop so cleanup is always
scheduled. The clock from the current (failing) iteration is not yet
stored in afe_priv->lookup[i], so it still needs an explicit
clk_unregister_gate() call.

Fixes: fd67a7a1a22c ("ASoC: mediatek: mt8188: fix use-after-free in driver remove path")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-audsys-clk.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
index 972f097a13ca..9f3b3a777577 100644
--- a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
@@ -170,7 +170,7 @@ int mt8188_audsys_clk_register(struct mtk_base_afe *afe)
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
 	struct clk *clk;
 	struct clk_lookup *cl;
-	int i;
+	int i, ret;
 
 	afe_priv->lookup = devm_kcalloc(afe->dev, CLK_AUD_NR_CLK,
 					sizeof(*afe_priv->lookup),
@@ -179,6 +179,10 @@ int mt8188_audsys_clk_register(struct mtk_base_afe *afe)
 	if (!afe_priv->lookup)
 		return -ENOMEM;
 
+	ret = devm_add_action_or_reset(afe->dev, mt8188_audsys_clk_unregister, afe);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < ARRAY_SIZE(aud_clks); i++) {
 		const struct afe_gate *gate = &aud_clks[i];
 
@@ -194,8 +198,10 @@ int mt8188_audsys_clk_register(struct mtk_base_afe *afe)
 
 		/* add clk_lookup for devm_clk_get(SND_SOC_DAPM_CLOCK_SUPPLY) */
 		cl = kzalloc_obj(*cl);
-		if (!cl)
+		if (!cl) {
+			clk_unregister_gate(clk);
 			return -ENOMEM;
+		}
 
 		cl->clk = clk;
 		cl->con_id = gate->name;
@@ -206,5 +212,5 @@ int mt8188_audsys_clk_register(struct mtk_base_afe *afe)
 		afe_priv->lookup[i] = cl;
 	}
 
-	return devm_add_action_or_reset(afe->dev, mt8188_audsys_clk_unregister, afe);
+	return 0;
 }
-- 
2.43.0


