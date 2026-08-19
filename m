Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC88C5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 10:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXqFLwJuyV+JjqMhVzWBsHgdtBjtcPrrFop7DOTcoKs=; b=vFm8qJf8PRrFCKOjM7+BNAw3BH
	wbcKL5K2q3oAh+sJ5RF1T08DUyCotpQlQb4rmvrjLPy93rSf08kccCFUH4v0LtwaN49b5cuLERnoH
	UOU4osWaSvnAt8DP9Nda7ixg06hJWaL2vq44pV8xeWrgDkKCsHLq4smJVuNmnX8FE9RZTstA8o+Cw
	fWZmKc8RbGmwf7VRPP2JC5uRXI/TFXFV+ZuVwnWZVJqEPmdGOD5pYC8dWXnKJTZzc4nD1WMRIL47i
	THPrSL0/lAxm++0TpqYWyB8cphjehXU+NLRZbIGqE5VqGDYLdKLjgq3bttUYAivfreqKdj9rnQw2f
	MB7LuUiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdOA-00000009Vpl-0moq;
	Wed, 19 Aug 2026 10:19:18 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdO0-00000009VkE-1zF7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 10:19:12 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38e041ea211so954202a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 03:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134747; x=1787739547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IXqFLwJuyV+JjqMhVzWBsHgdtBjtcPrrFop7DOTcoKs=;
        b=XAY3caflU+l/QCU16f9On3BOyUEICNlzZOZnmGjG9kPR6jEbnePvVe9Vs6tRCFDQK3
         cDoG86tYqeC5rmRApUODbA0uhH5WlwNGzENau9EgBaSBSvrlfDDFW+yFxJT1eE1qpB77
         rHTj4lUrwTPEtfQH9CNnDBpwyHn8nERu8dfZBxgXX+wmqPgF7W3vAd1lL3w7blLIbRx6
         bkJC9Tv2+jEM9Q81V1mYhwHnyOwNVa8O5aJ0QUV4T3LO4wqt6niALrHLUX2RyyijUfmm
         w+QlXJYt8PJgW54VwVlQlB3Brb6fi7OnqdQJbcZUTcudbRhmWUwRXAQme2z6eKEbNL6f
         B7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134747; x=1787739547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IXqFLwJuyV+JjqMhVzWBsHgdtBjtcPrrFop7DOTcoKs=;
        b=ouWMolEpWA86ymxo8h0HRcjaqyDZpK2rROOE0CQuPGPFhbMU+y16IKX2TpS2kfhBkA
         1kvt+UxlWqRkzwzsyZwlIOt2R8au0U5DJAhRe6uiTZtSptTufs7mlMha5GP0cgB+z6Ky
         sVs4KmizFQXxa5R3q5groU8kggJugkGEct2c6Av0vutfbYTQT4hOm8uR98dEpAnAiw8N
         dSXksyMyfuy6GJNWRztzIsGVaJ/ObG70b0yljTX2TWNZwsca3GZDEdOoJ0Z/iRgt9fuQ
         M+217y3t3LBkRG+qjRKEK8e/nnhdvwwMY/W1Tu6Q9n8URqigaHOQuPzyxwo8Y6VPeSTw
         CA1A==
X-Forwarded-Encrypted: i=1; AHgh+Rrmfbv2nCmgRLzRsUpOmudPgk6btvi2+DJHXdA0oLmtXoAwNxxLw2EIqgUgyqYe3BYjT1LvInK7Ns3GtBH1kuEg@lists.infradead.org
X-Gm-Message-State: AFuF++n2vtE+iES8/KKgEUTvgECdWxMUmcgViKg3Mfmu6TUczIHA3bbd
	5foDZQ1dhgRpcyiMBxcbJuZdxojBtPrqzwCCQm9ck7KWEM0TESjNGf8k
X-Gm-Gg: AR+sD12Oa0zNSjR962Zym7e3CEgBlNGugFcIpfDVerg6zQXSGfMntKUFM1nMR5k50fi
	AoRWjFZPFk1A/VZp+OFrWsS+85DD9MujX/SHoD/CM8eLlQDhFOlgtGJWBy00fHVtDZyT2T/83ku
	itj5oX6/311WL35GSR3WWyVke1g2eiWKW69PcoS0Dfd+FLtQHugXUkgaemOkrFiHX1/6KXUDbEg
	Lf5kPoBForS7lB68xbtrsctMz3v5ucrg8iqoa7O+k/VV32FkO1LUaxSt/onvneFs/+YdrNd4wBg
	Et8rb46+G1HlsNmLVd+ziGUT6CLrxVDGA2K2t3i+eDlAywBz8Ycrce6vjZW+OAPEDEcSGQreooo
	fbC2m1Qnlm4/D3LChwmhhn4OfzQrUpgYMcOFSwSCjYH91tKp3e/koRrAUCpapuTrK4TxoOF02ek
	ObUjl4zIOA1eY6AUM+lS+hBIgyxbjluUYKkuuFDg0B0Yv10B9y/DzEHSZd27RqudSQNpfBGEB+N
	/6URU4xFpURBQKRcFtZ5mLdItkTX6O6MAlJQAVgAj2QoDULY44oUyp1Z/SERk3ySFrjv706gpvS
	ep6k
X-Received: by 2002:a17:90a:f94f:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-39580840397mr7076830a91.2.1787134747355;
        Wed, 19 Aug 2026 03:19:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb14bbfsm2146392a91.1.2026.08.19.03.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/4] ASoC: mediatek: mt8183: Fix APLL enable error handling
Date: Wed, 19 Aug 2026 17:18:47 +0700
Message-ID: <20260819101849.68010-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101849.68010-1-phucduc.bui@gmail.com>
References: <20260819101849.68010-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_031908_580720_ED83FEF4 
X-CRM114-Status: GOOD (  12.85  )
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

Currently, the mt8183_apll*_enable() functions call mux_setting(afe, true)
but do not check its return value to handle failures.

In addition, the cleanup paths of mt8183_apll*_enable() do not call
mux_setting(afe, false) when the enable operation fails, while the
mt8183_apll*_disable() functions do.

Add error handling for apll*_mux_setting() and call mux_setting(afe, false)
in the cleanup paths when mt8183_apll*_enable() fails.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 6ab0734ad136..260c27016cc0 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -382,7 +382,12 @@ int mt8183_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret) {
+		dev_err(afe->dev, "%s apll1_mux_setting fail %d\n",
+			__func__, ret);
+		goto ERR_APLL1_MUX_SETTING;
+	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
 	if (ret) {
@@ -411,6 +416,8 @@ int mt8183_apll1_enable(struct mtk_base_afe *afe)
 ERR_CLK_APLL1_TUNER:
 	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
 ERR_CLK_APLL22M:
+	apll1_mux_setting(afe, false);
+ERR_APLL1_MUX_SETTING:
 	return ret;
 }
 
@@ -436,7 +443,12 @@ int mt8183_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret) {
+		dev_err(afe->dev, "%s apll2_mux_setting fail %d\n",
+			__func__, ret);
+		goto ERR_APLL2_MUX_SETTING;
+	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
 	if (ret) {
@@ -465,6 +477,8 @@ int mt8183_apll2_enable(struct mtk_base_afe *afe)
 ERR_CLK_APLL2_TUNER:
 	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
 ERR_CLK_APLL24M:
+	apll2_mux_setting(afe, false);
+ERR_APLL2_MUX_SETTING:
 	return ret;
 }
 
-- 
2.43.0


