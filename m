Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C40C5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 11:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/xNynUBdZ1hKic7P/IiQFiODLJooKh+/AvfbqzXkgn4=; b=QL+1nGDRgVeShs06hiRD7TKrQz
	oJbisNpmTpdc3zppH32O9oWBfVG3AyGWvDIuWgWC49fn3e64uf7lff42YsHXnIHpp8Lx5E6GYGZDC
	qgD7ucEnIVDogJmLcy4ZGGV0g4yDlCD4byAcCl+MkutECR21+FuI0WmvpHSpmKWlBKIa5YIQ0/tvn
	JWLLcaOEalOGgsGTvNEePt2XAWPrsaFW2QgxUQQXgmEkdTbptRXOZlZ4w1bG+b02ZrTUFMpeW0g/G
	HV3/cO3AFhnYmJruWoIgtaaLDWHXw3ezGIX5wcAsPmNPdKe224Ov74Efqz+A9kya5bZjbj9B7o3p/
	LotoGmIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvaX-000000061ki-46WM;
	Mon, 17 Aug 2026 11:33:09 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvaU-000000061js-3Pj4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 11:33:07 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38e347638adso3944684a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 04:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786966386; x=1787571186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/xNynUBdZ1hKic7P/IiQFiODLJooKh+/AvfbqzXkgn4=;
        b=IiOiyXL7LMhHyMMDSC6sj+nviO0iHs4DVezIDOY5MuAEgD9GL2ZQP1fGOrNvp+jDPM
         lbz+A0pmjveSDL6aqxeI5vkfUaD8+BQHTFPPWFsd8ZIcgENQJBWMz0gle7Wsc9B/hSdn
         DnN0UMbyyf6oSvTEM7E3D61m9e8pNB1gWkgstRpYmwltsOSVM700QshrdJgtLl9LiVN1
         SRkGF4M6izp1RkBvVVzLNMQ1dkxvfGPXCd3vn32eGTmorIAYJTUrbc20cMyGLkH8oKtK
         1rt/n/AOeR2pJFZDmAeKeRHjebqUPIdtz5+uFLXgLz5AhT4E/h9ISXRiIe8/FmY+7J8O
         jmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786966386; x=1787571186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/xNynUBdZ1hKic7P/IiQFiODLJooKh+/AvfbqzXkgn4=;
        b=J+Uj6PcKBesA75raNgrhGNsaBhaq8f0Jn12D3fmRxgr4TeKHuTBdbrt9yTpbgG5+GF
         sbjuIGNrF7Lr/jWKcqXayqSxcnbUAOWghm9YJGGNJFZQIAHPyfgfZ5WLR4MkhPZM2uIo
         AT/8y8Jro/iNyyEyV81MXu6i6mqbOIlFerwxOkOhE5FCYlZRAqmV36vBK29PnHLdCb/8
         KcIeX1MbREEMChVD5l6wk0vIcAgDb6HNMkcN6YdLpghyaGm6j5oCGp7Vhfr6ucIr2yza
         7/DJFEruhOCiDcCGkS/cctBxbeztkp+kfRQ45FZj8Wq6zrxzzt05L782Ddh107QipRD3
         sQeA==
X-Forwarded-Encrypted: i=1; AHgh+RoG0NpTCrCE8LWOLc5LeksaVuB2pQpRdWZIk2F2qu+MF3puO31MC37VkwSrtxE6lxHwQxYti1qdKYcx7fAwnffa@lists.infradead.org
X-Gm-Message-State: AOJu0YwamGFMKNO8Dr8msZN/dKb3iIryU0bm03JgVCFU2ZA4JZpFY57Z
	m5mnPPttckJ/KFDa1p6sJUQVwAUU93EIAUZZUolQeRiAXzFoOhgi8pcm
X-Gm-Gg: AR+sD10P5jcr8bUECjpI9HIa6bHBk/hM/5/07ky3iCtjm4/54rEUEWtQJR5pKPoxgg6
	hjVBqBQZ1mbO/uNDSdYGnd190rI/7QT8taLr3Ad1kizjtBgQ/l8PPiAyz9Tzbp1s1a47MaXpusd
	xNiSGsIvLaZ+CnluiVyxcwmV2y4xbVkzxu7iV84+JNv1YZyoZY+QIKOPgN49YAMCGakVwDkWV3B
	i4d7sgQfVznLu4bpJF+Ze6ru/4Bu61rN5BxfohW/ad2Vg6IGKlhQdqUMqn9MI5FN6m/94JiJSIs
	BCJwjnh03iGAYL8ibwMB88JrI6aHQ8HqarDYpZtqLi2gAB1WSTA+tMxYEF5NKe8kbFe6m7Ug28F
	xM8d4pFlfHB8yMkwOEOrc/bqOf1eh3zwEGqUohnM2aaCqOHCtH4qBDRlhH+BDsuOEIMxt818DsE
	eVR1XMyly80+X8Kcv2TNYIOzMX8Q1byrxU8gm1LqJpp7uxEHDklnXD2nBM7wgzCKG7wIqPwRe4i
	OQkrguqf9uUT8ztCTcUE/gz46qZzqjoS6g+oIUnfoqRwQPGOb2CkUIOXmRYi/4W7sj5bKMHecbd
	sRwVp7jke01ZcWI=
X-Received: by 2002:a17:90b:17c5:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-3933b874ad6mr23181975a91.10.1786966385953;
        Mon, 17 Aug 2026 04:33:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d3b3b91sm2071705a91.13.2026.08.17.04.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:33:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] ASoC: mt6797: fix wrong unwind order and error code in enable_clock
Date: Mon, 17 Aug 2026 18:32:47 +0700
Message-ID: <20260817113249.69252-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_043306_854742_B1AEA2FD 
X-CRM114-Status: GOOD (  11.48  )
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

The error paths in mt6797_afe_enable_clock() use incorrect goto labels,
causing clocks that failed to enable to be disabled during cleanup.

Fix the goto labels to only unwind clocks that were successfully
enabled, and return the actual error code.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt6797/mt6797-afe-clk.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
index 6f3e6acfcfab..0ac04d73b777 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
@@ -63,21 +63,21 @@ int mt6797_afe_enable_clock(struct mtk_base_afe *afe)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_INFRA_SYS_AUD], ret);
-		goto CLK_INFRA_SYS_AUDIO_ERR;
+		return ret;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_INFRA_SYS_AUD_26M]);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_INFRA_SYS_AUD_26M], ret);
-		goto CLK_INFRA_SYS_AUD_26M_ERR;
+		goto CLK_INFRA_SYS_AUDIO_ERR;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_TOP_MUX_AUD]);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_TOP_MUX_AUD], ret);
-		goto CLK_MUX_AUDIO_ERR;
+		goto CLK_INFRA_SYS_AUD_26M_ERR;
 	}
 
 	ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD],
@@ -93,13 +93,11 @@ int mt6797_afe_enable_clock(struct mtk_base_afe *afe)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_TOP_MUX_AUD_BUS], ret);
-		goto CLK_MUX_AUDIO_INTBUS_ERR;
+		goto CLK_MUX_AUDIO_ERR;
 	}
 
-	return ret;
+	return 0;
 
-CLK_MUX_AUDIO_INTBUS_ERR:
-	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_BUS]);
 CLK_MUX_AUDIO_ERR:
 	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD]);
 CLK_INFRA_SYS_AUD_26M_ERR:
@@ -107,7 +105,7 @@ int mt6797_afe_enable_clock(struct mtk_base_afe *afe)
 CLK_INFRA_SYS_AUDIO_ERR:
 	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUD]);
 
-	return 0;
+	return ret;
 }
 
 int mt6797_afe_disable_clock(struct mtk_base_afe *afe)
-- 
2.43.0


