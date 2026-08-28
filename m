Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC59C61DCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 09:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWC/dN9H+/DLHGkzhHQH4QE0IirXC1qcf+ZR9KcEXL0=; b=IdDULX9DyIdFMk+FJAev3EO51g
	HBfEDpS6t98OshHScrgbq2uJjE/RAR1Zu6wDBwvTmLhIqWRa/LCDSKGNlA5v9Fgcg9qJen5vNeyml
	W1kNHPRlmCCT2k88VXpObLZlloj+iGAK045Lo26dDG/BkNBtRvjFlrNaHQqJpsxAkqyWMg0Kzlf1C
	l4ND0DScWy8JKsPBJsHrC49ruu5Vr8bHvUh4j9f+1L+08QJYxFWpUa8O7OMxLpXgjRcbYn/UNJlEv
	cSbl5/TWV3vy4P77SLgybGZEYd7XEIUEXWob0yJVEyY8v0Mf3sUo23hB4eARA/sBw3jkeXrceSUz3
	FuAXdm6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsh9-00000005QPt-3igh;
	Fri, 28 Aug 2026 09:16:19 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsgy-00000005QHU-2jnA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 09:16:09 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-854f8068301so538383b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 02:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908568; x=1788513368; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IWC/dN9H+/DLHGkzhHQH4QE0IirXC1qcf+ZR9KcEXL0=;
        b=VFCsnD/rPMkupsRN06fNFCx5fr1/tFixo/1MMxJpcyA/Hxl+yt70oeeBb77Q3kWg8K
         GlEvjxII2HY44ZC0/cagGCqZB8yjlcOTm2SK1s++YmfyFrewCpBz7PhFv0T2IHS5xEMp
         KkZkqHRkztWkNFwlEWGkpNxnZliEctIm/6KqykOXeDyr307YXSsHelOYMPr/izXzkb+N
         Dyk973Ms8ZvP3tJdWJwxih8UpKPXyXNoF9k/I22lGDuJ0RJMuolSQbhQrWUxMldlf+XI
         q67th9DBbcPjll3tpZF0VbbDHqlgCrLBeWqqogniwD67+pfSBAdz/74IKBakVPrSR2bL
         R/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908568; x=1788513368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IWC/dN9H+/DLHGkzhHQH4QE0IirXC1qcf+ZR9KcEXL0=;
        b=YSFd7DTdyXciWCD10LBqjzzN+bqqZxSlv1Mhd3vDcea2WL+NAd60r4kEwA56pNhWYV
         qU+pY8IWfAx4rhu85nx9KdD6xE1mDqGlIMHB/CMM0xJw46PRwwvfbXUqRBvxQRZvyvgS
         x8C/qrvAH2VEO27sPLb2ekXIBdpSXDx9h6RNG2YiV+37gTdOTDnkQ6CXnfX03M9FWMHq
         acTF6b81kEZaarBqZNuorLHGS+ddgLpsBj7NVTuo4HZ/GJMyx0JPGHUL7IQeVlb9QK+v
         Kn1bxQqYEpAPXPLwqTXgelzsxviQKKfphOIn6oF4hxjEH5X42cWSq0DOIem4T+N3dHsK
         AxWg==
X-Forwarded-Encrypted: i=1; AHgh+Rqb2ULZU5AQift7XHQr+LYFLK8E5VqqL5WL0Z0IZn8I/oODvoq6+1gDsPKlx26WzhZA7gVWtie6Iw0dlT5f6LOR@lists.infradead.org
X-Gm-Message-State: AFuF++mbLmNBeZzMbedTRXtKxG+aEpez6Pdu1A+Ckl97X1imGa0xqgbS
	k504PODMzeHbBhxH5NrazD6FM63pIH5LCOq9xuNklcdOMx/9LmpwXLJ1
X-Gm-Gg: AR+sD12e+izwXa2ohyHWbs+aAdZKenO16UPcDyBRovk2fCQxq/wTufwt3k1OvqDxU4C
	ypVY1214dUV87jqrT/VL2GkAsHjydGoBBu4tQeTe8Ir1+j234oJCkrnqD/IWTDh7XvoNTd9HogA
	oRxAFDVymp9kwjep872dKEivualDtvOPuahBoYFsh8k/3wrTUCEpYvyYjEmMl7su3ogp+w84myr
	kXDWc4VtXO/MaRdpuzZo1kYolwm2GmbLWUa2oSjNN59a4sUp6QsQwIRwetf8DPEEqNCYTmKsM0A
	bsaMii00vUjPjqLRlswpQxe4fDKjGzuthXxHYXx2Jclso7W2p7luIX4Ew5RNuTbJofbzWTY3f7s
	YCUGc46iZZ59xAhD+0v2P+HWvUPZu3Qs3LnUFgl7IAeV9PAOIw42bn3Rn/b2cKRPpp594MtTdcB
	s1GZYRPinn7nXzW7+DNmNSZGGnfuinMzK5Hq4YO/HGmc7M5eHA5axyS6a4oBl48R3VS4SO0SwYS
	dFZaWwJvXtxdjgBPSqRfjg+X5lXxTmzOWKNhpmwdQkZ8ExqdGVj4PWbRtQKirDFYKXiH1cqDMTS
	d4si5g==
X-Received: by 2002:a05:6a00:2d84:b0:845:e8b5:8c49 with SMTP id d2e1a72fcca58-85629a25879mr10588287b3a.10.1787908567583;
        Fri, 28 Aug 2026 02:16:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:16:07 -0700 (PDT)
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
Subject: [PATCH v3 2/8] ASoC: mediatek: mt8186: Fix clock handling in mux disable path
Date: Fri, 28 Aug 2026 16:15:26 +0700
Message-ID: <20260828091532.600047-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828091532.600047-1-phucduc.bui@gmail.com>
References: <20260828091532.600047-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_021608_708073_AC52DF6B 
X-CRM114-Status: GOOD (  13.54  )
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

In the disable path of the appl*_mux_setting() functions,
clk_disable_unprepare() is called after clk_set_parent().
If clk_set_parent() fails, clk_disable_unprepare() is skipped,
potentially leaving one of the clocks enabled.

Move the clk_disable_unprepare() calls before clk_set_parent()
so that the clocks are always disabled and unprepared in the
disable path.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 70 +++++++++++-----------
 1 file changed, 36 insertions(+), 34 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index aa8b2eaf7b95..a517aa67abf6 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -125,25 +125,26 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			goto ERR_SELECT_CLK_TOP_MUX_AUD_ENG1;
 		}
 	} else {
-		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1],
-				     afe_priv->clk[CLK_CLK26M]);
-		if (ret) {
-			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
-				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1],
-				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
-		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1]);
-
-		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_1],
-				     afe_priv->clk[CLK_CLK26M]);
-		if (ret) {
-			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
-				__func__, aud_clks[CLK_TOP_MUX_AUD_1],
-				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
-		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
+
+		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1],
+				     afe_priv->clk[CLK_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1],
+				aud_clks[CLK_CLK26M], ret);
+			goto EXIT;
+		}
+
+		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_1],
+				     afe_priv->clk[CLK_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_1],
+				aud_clks[CLK_CLK26M], ret);
+			goto EXIT;
+		}
 	}
 
 	return 0;
@@ -199,25 +200,26 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			goto ERR_SELECT_CLK_TOP_MUX_AUD_ENG2;
 		}
 	} else {
-		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
-				     afe_priv->clk[CLK_CLK26M]);
-		if (ret) {
-			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
-				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
-				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
-		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2]);
-
-		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
-				     afe_priv->clk[CLK_CLK26M]);
-		if (ret) {
-			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
-				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
-				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
-		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
+
+		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
+				     afe_priv->clk[CLK_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
+				aud_clks[CLK_CLK26M], ret);
+			goto EXIT;
+		}
+
+		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
+				     afe_priv->clk[CLK_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
+				aud_clks[CLK_CLK26M], ret);
+			goto EXIT;
+		}
 	}
 
 	return 0;
-- 
2.43.0


