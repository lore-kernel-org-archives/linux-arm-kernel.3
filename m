Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA46C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 05:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wX5Pjxydk72W6dlHzm6vBpUneCYTnp+fBCLKSyxEezc=; b=Jei81srhuWEqh/WEz9b8fylUL2
	XcSwZIQR+RdGbQDLwkqBn/E5TDk5XnK3RoUgSmI+9eZo6ClbVEGNqzXst2DwQAAt7n6Sde40bLOV6
	qsOpSYbC2tkDVZqZh0Bl1YyDm2qb4ca3lK5dndyrm3hFSk/xJ2ruY85tXgN9CwHJ4rRCGApOF8vol
	MWXYjUQtct6NPM0TA5PPi3F3JIoYUj2XVBjmbDvy1/mcNFnfK5sCZhaND6Jtw0rodyd7QjYfju/gN
	Bi7tQ/EVf6W4sX0cjEgE9QIbJfReEiEJeONThCUwLFax0uCXUohT149WtOPnt4DnuvjfocYVvf6vq
	7m/pg0kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzomz-000000057ti-1fN1;
	Fri, 28 Aug 2026 05:06:05 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzomu-000000057qG-14Y1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 05:06:01 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so436547a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 22:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787893559; x=1788498359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wX5Pjxydk72W6dlHzm6vBpUneCYTnp+fBCLKSyxEezc=;
        b=IA76ggDnizB97leZ5x2uVLzxOdlVMRFhSl/4I7y1YJhYeysZA1HQlPJ4aHRXnDAFAB
         CWBPWAJ4NnNpzEBY86j5fcThaionugYHduS6eKJltZZXhVJ64UebMjy30fYazmwemj/e
         40SXYAvrZN0f4bJasVOVCrlEaIyOK2Xsb9dAJNMt9WhAkDwDlW7qEO2jBPLMVLAx151W
         avWZsKHZQ7tbiD3IiIf9r12/Vd18vDMGxLNW6+NA0EIpk/M217bj0NR3zvhX2yXI5Q0F
         DGOYvmjxh4GmBrgTT8XPEsd+PUnTxdJjUD5DbQ5ApXZO/kY0KXnYkN4cc9LZATHkEKcz
         0ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787893559; x=1788498359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wX5Pjxydk72W6dlHzm6vBpUneCYTnp+fBCLKSyxEezc=;
        b=mA7mn1RlROa+YFzgIZfMPHpxCwcD6VSs2qytfpRiQHISvP7PELvszGVl53wR4X9E48
         I98YB94tua9d9flWaIo3tl1YEi85606jOXschnhGxaJYd3F1PNH6pCE7p2UvZECCxUKP
         sVAO5s5Th3TsMcvq5AGhkj1qu20Kmfcl453AJmKpdva7X+/omrpLi+Me/pYPS4zLBsma
         LlpKCF2JE3cHLJpiu4p04+vMf6ams0dU7dNU3+t+9j6aghwLCMyD7NiDh49Fu4b/YI+h
         JE64Zypq42GppO5dE29e2GFX/Vm0cby3LfAy/CplM0ViTrN9F0oESDBrWizVd+XbE+EY
         UMdg==
X-Forwarded-Encrypted: i=1; AHgh+RorbJOLlGPOWNvWJqY0nerXL7TnTSGzg9qZu7xPPWB4LUjRHqW9tmNO9+BFWHUIDvgfN/MPhJIZTH88X2mE/9xf@lists.infradead.org
X-Gm-Message-State: AFuF++l1Nb+wovdtLbhK+VkIDWFozRzg9kABfdiFuUDB9tRJPEkCShMD
	z0Y6tq3byXMS1c1WA+2Pt9+RiyKkH9V988z90X92kggZf5Dnk7rhiTHC
X-Gm-Gg: AR+sD11KPB5JF3692MaxlYDU1xddef2BBK6WdVjuChorO5VyrJDJkKtMv8NHhyvQ2WY
	e04IGY5CGU7VG4MKK/VprBaX8VzqTumX/wYUK6gsTAo1QFkX65D+OPngZYPhntwa5dUFIB7bND9
	rzUdwskG0X02T8x4OUlAe4BC2py9/NK3lE6pazfTKW+TGDyerx2H7i5xBFSELaify4qgFKlLyHJ
	Pmx+Z7GDntJ06eELr8yLb1A3nB3jgVBQP0srF4qWHKlGr2qHxpgBgrIi8Cw5lXZj9A3gmyPoVNS
	GqNSa6HyHM5ks5enH5Dss+P+fa+s0D7hRL1ORnUf5/Vo8FmJjLW21JE0IJlQqbRIrrV8Zdsv5G/
	1YF3oF0EI4G5vgMxAvMfz0VCnlhdHeEy8tG+AtQBuvh5lWBSnPNSB/AR90801xzjMc+U8mBHri4
	y/hzOGsQ1Zn3O6PdQbqTF3AzLBgO+Gjx65r1ivwf4Nzvz+1dPz5KDNAC+Df55SePkvZsQh+H0RT
	4Te3WDlN5cwDF4QAabuHZfjDLGCnD7sga8xTaAFPKbMlvCU5ryrKOhBMSLgN7qxxYt+7DA4Pnw1
	fF6w
X-Received: by 2002:a17:90a:da87:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-396d0d4c42fmr9359769a91.2.1787893559221;
        Thu, 27 Aug 2026 22:05:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7c922sm986549a91.7.2026.08.27.22.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:05:58 -0700 (PDT)
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
Subject: [PATCH v3 2/5] ASoC: mediatek: mt8183: Fix clock handling in mux disable path
Date: Fri, 28 Aug 2026 12:05:23 +0700
Message-ID: <20260828050526.590761-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828050526.590761-1-phucduc.bui@gmail.com>
References: <20260828050526.590761-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_220600_312663_47EFB951 
X-CRM114-Status: GOOD (  13.34  )
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

Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
Suggested-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 70 +++++++++++-----------
 1 file changed, 36 insertions(+), 34 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 6ab0734ad136..2dbe0b7f8bad 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -265,25 +265,26 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
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
@@ -339,25 +340,26 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
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


