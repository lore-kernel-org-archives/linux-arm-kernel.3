Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB58CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 11:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=; b=Si9mrXkSes76JD8pzgdp9Ba9rt
	db+AWmbRD5fizybxzGTo9aNVeyZBvFZOFS18GGyslyuo7x6oyeVpeDGeu8Viyz1DNo5ECOi3CxYjo
	B/k77TGZ0E8G4MdmKU5UIPX6GZtwevAWFbWQUD1fIFn1Yf1v28xE7eTJZBgwoPi8CGlL9YltUoJfA
	MqYbTgYHT9yJTmXVDo4v/Je8x5FLgm17GvZUSAUQ2ZmPjMExez6+tZnQi1NhNjXxpc0Ecf8NjAOW2
	55HzrczVW9fgyJiUvn/mLQWFptumBIDW9N7S6WzOhzrXFa9UOKu41FHtnWKJd5iD3iv6fS+DTT+Jt
	Qi+7wv1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTu-0000000GH7e-0iUM;
	Mon, 05 Oct 2026 11:03:42 +0000
Received: from mail-pj2-x2a.google.com ([2607:f8b0:4864:39::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTr-0000000GH3s-2bXF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 11:03:40 +0000
Received: by mail-pj2-x2a.google.com with SMTP id 98e67ed59e1d1-3a81350dd08so291976a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 04:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198219; x=1791803019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=;
        b=HOgZbCgyBwOi5UEOgVp1OG4XctPi9rQAmEE4BCh4xwNGVuGthpOuJQeRDqucXPZp//
         /GyQuIW1MA00G4WIFXNSziapm7BlcrDm+3nClRo05Wr3/7IwV1hELabKIXO0PFDJXmk9
         PVdhmkPa5cCOLrz2/pFBfc0aFAaFVe6f1TS4mywEpl3bUC+LYtHR21RxS6EqLGUdn5qf
         1Z7/cciZg+kLPITZhwxd0A4WPfu+fsPElkmX1OROKaSWP/8GgtvyYo12mUIXyZyXsTjD
         tgimA0gG6s4+2ebTAtY6qOYbrXLminXfwt2ClugIbwTkov2b2EejGGIcnFp5sjIslJqE
         /xEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198219; x=1791803019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=;
        b=PyGYw9ZS8dAGbL8M9Pc1x5J/oDcr5I1KKneIhVxBmcSIM1St7M3G08a6ehLcH1M5Rk
         y8P03enIRE5eqZ/o2IrQtTA+p2vDzCx2irN2bspt9wYWnXenvIY6emvJ/R2xG9CiXSMW
         U5J/EcTnIeZHQ79Zx1ubqo5CSDSUFIxMecV6cFkbP9QX24LlyaqcyRG+CJU3iD0LXLBQ
         5QTHKxTdp8l8lf36nJScdnecV7npMNJCAEJBEY/N9SxpgwZx1DZ3SNDzG4kDRa5Vadm6
         P5et80lc9fk5Q3fO2vL0uAQ+pdriejnxXbzIJKQYldcLMY8FxjAHfQEPGkdlFKsJ9cfl
         Cmsg==
X-Forwarded-Encrypted: i=1; AKwUvBzyijJBU77Gfjy92IaS+D6RvdrmMFEyru2lZjQlLyUgTB7ZIKsdXt8tqbNEILg+M4cQHDa7nm1H0fQ9gAvE4zMx@lists.infradead.org
X-Gm-Message-State: AFq9FYKOWqTrs/A4gn3K4vBrsuJtfW5TlSMD1rHev8uFl42BNXziJIM9
	idCP2mYTRCCwBPrSeSGIUeYwgwPk32PX/9aBmpXD1JX4SBdwMDR9hbJ0
X-Gm-Gg: AYBFou0dWhtb8C9wBFjBfK2xPoAr5NsaeGIh3iNa35/dCzSG0IC7RCTq6erbDWYnjtY
	VWHMch5nsCOFoTPLJDW/RShG1L3UnBWrkQV1XW01UrmSxclreHBKKXRiKqexE5oW/xUIwL99zwn
	4U6ShHdhuf/uq+PTKm55VkccfozPZ3AbF9mmEn9o/cvgFcvUAuLu4uBuDAZnc2JNoOiz+bunfo0
	tTps6V72xNsTIoMOgYRiIkIHyaEH5tdErcQE6tzqj7E6wt5O5pKXYNx9bJVYwh1dLY0d33BH3QS
	iFQuT6TCd1nz/aOF/hZyxU4jt870+nh2OclREdp2P+0syV86b6Mll0gZ9SYNc+Pqj60zCmLljf9
	zIb8y2Blr2UpY9c9gdIqWmzpLFECRts4TbIFPrxjS/n10MHpy9uChfFQ6ZG9RiI9O0mvHDgtW+g
	aA16HUoWKP578A9IVEmEfk2anvpLYCh7MUVIH+C3SYPwRE+ScHeqTbBzmytMxvywRZe7p1Zdu5D
	mLRDsxdGV3ioPJo55P4EmWO4Qf4FiQ6yJviIZmKYuGAoISqRKTA5oDNEM6QNzv/rZRK0bjawWbb
	h70LVYNW5Mwcmg==
X-Received: by 2002:a17:90b:4b83:b0:3a5:1c7:c2f with SMTP id 98e67ed59e1d1-3a6ce986288mr9784031a91.59.1791198218535;
        Mon, 05 Oct 2026 04:03:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:38 -0700 (PDT)
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
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 05/14] ASoC: mediatek: mt8195: Fix paired memif clock error handling
Date: Mon,  5 Oct 2026 18:02:48 +0700
Message-ID: <20261005110257.50145-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040339_668638_6DE35384 
X-CRM114-Status: GOOD (  13.15  )
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

Check and propagate errors when preparing and enabling the paired
DL8/DL10 memif clocks.

If enabling the second clock fails, undo the clock that was already
prepared or enabled to keep the clock state balanced.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 24 ++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 52c3381e6766..1d3e01e2c3e7 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -286,15 +286,23 @@ mt8195_afe_paired_memif_clk_prepare(struct snd_pcm_substream *substream,
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int clk_id;
+	int ret;
 
 	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
 		return 0;
 
 	if (enable) {
 		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
-		mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		if (ret)
+			return ret;
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
-		mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		if (ret) {
+			clk_id = MT8195_CLK_AUD_MEMIF_DL10;
+			mt8195_afe_unprepare_clk(afe, afe_priv->clk[clk_id]);
+			return ret;
+		}
 	} else {
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
 		mt8195_afe_unprepare_clk(afe, afe_priv->clk[clk_id]);
@@ -315,6 +323,7 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int clk_id;
+	int ret;
 
 	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
 		return 0;
@@ -322,11 +331,18 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
 	if (enable) {
 		/* DL8_DL10_MEM */
 		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
-		mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		if (ret)
+			return ret;
 		udelay(1);
 		/* DL8_DL10_AGENT */
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
-		mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		if (ret) {
+			clk_id = MT8195_CLK_AUD_MEMIF_DL10;
+			mt8195_afe_disable_clk_atomic(afe, afe_priv->clk[clk_id]);
+			return ret;
+		}
 	} else {
 		/* DL8_DL10_AGENT */
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
-- 
2.43.0


