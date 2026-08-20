Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD4EC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 11:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=viEEjaaD0HZpFwginbzlEKGXqOy8NFo8cx0Pc50ZQ9I=; b=xIh/452uQu94kWF9wo5v0j/LLY
	uAiPHrCojqPju3uK9d7knr4ra14mpGOgSgZTjz0zq2cJ/Z/ezppX05RHe5c2Lcru4QJzvyhh2vjGS
	VWv75Dp2ndQamXu4OSfeuyLr391oLCsIDIp/4eVmzPOU/fl7rF8wgKtcRAvxOLFNxiUr4z/EpVwtu
	/y74dvsWWWC2JhC62srk8B33vGLA1ERYphWDhIesqUnw3WydySzJP8ynYvFhEiXTy0+HnOMezvlAP
	gKs6q+4UocfFeLSLE+CWSg6OQUAeq4nipEUOj+vgAo8O78HfAwBGKyQUyp2iIbvAeEddiVpnu0cJp
	cdUyS99w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0iY-0000000BQPE-33US;
	Thu, 20 Aug 2026 11:13:54 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0iO-0000000BQFO-3h9q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 11:13:46 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-84f77cc7302so743406b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 04:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787224424; x=1787829224; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=viEEjaaD0HZpFwginbzlEKGXqOy8NFo8cx0Pc50ZQ9I=;
        b=Z/l4ofyjWqm15D0n0xysIu7Z2eb3sqg4feX7rM50d+ffebQqOQLWFbvZmF05i1aYgT
         etHR4jeY4+Djxk4Y1qq+v3Fa1VSXSjUWSdB2+rwTJ7HgBVKnUd1LksxlZOLua1/q2HW4
         XOqCgV9a2LbOGxoQtD59vY8C58dNIwTr8rceoSNtkCEEvhKdpqw8rejy052kWh9if7C+
         KlBvs24ynTtdL9eiBSNrr5aRdM9eC+6mF+RyjxPg80Qs3an+kSLHWStl8Ophtj3oZgnV
         gnCl/L+UNAtyOPWZnFAEZF/uzgX+r4a7gGfGL28S512ciFpdUBQzY+hGK1Zjj4HROsHo
         2O9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787224424; x=1787829224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=viEEjaaD0HZpFwginbzlEKGXqOy8NFo8cx0Pc50ZQ9I=;
        b=Z92M7duRqUDLef3NhFwWmUJJhOk1uh3TcOl81OjP4uVwr43h5kiRV6qJAvJIe1q4d6
         AU32R0YyF+dXOlvZ3RP45qQhdRKv0yL++fXwwK9mdxCTg0vlqPVz+eaVykOV+Fo8ahF8
         QI9Sj7Ts4/i2b0LzRTpkMJTuzX3ixFrmQPCzlH6Bc8O+nMTQqOaTNFB/+Y7WuwiDBS1p
         Yo+gwO36hpE/xW+h+RlB6nXGLq/X3stcma6M5F96N4gb4bmkzS61+9WRTyQoK4mjAfMD
         4p2Bd4wkltGquWyW2z/keSLLi+2whWH1KxLWny6M+Ths/khxGBCWAVVsJ8hxGJmKym4k
         12Dw==
X-Forwarded-Encrypted: i=1; AHgh+RpcwDAArB10W099Bs0MzNJBH3dYyvmhkW0yNIY4mZN8z8eUVXzRKSQ7AoFPE1SuI6fxFWGYpcFdYlje8OgHFWRC@lists.infradead.org
X-Gm-Message-State: AOJu0Yz01SkY/1wGUCe5X13H1IE0jJi2Ra1zt/ygm3aQOE+CCzdElmm8
	HcVjhXV8Mem3sU8nCHerx5CQrc7YBSEMCB0g8dfPe7kPjr17Ntj3W662
X-Gm-Gg: AR+sD10hKEyN81ykxeUWHl5zWQfx9bCg+J0GTnGhhqx90qBsEGZQgAeGeCIygF3l2kB
	aHiIyCcjl+SjtzyMTUMtXrk9g8oVetNausM0tf+nlttPXEE8/dhVAS8gPcS/GHzW42O6bk/IZqc
	V7ztDTylNuOwqDx/tT2iCOQ/RdHxqPma2pSlq4NHDi3WS9jaKF7yrBYWO9wsSo8LgvGd2MV69Ji
	NxRbCo7E/6bvJJO3Am5F8+HOmuiZLvPt89E/exABGQbHOjs/hwothTf4fFXVH7kVKcGCZCZCqVj
	GG6hBoVyQp8rQvWSfEgyN907yy0tHEZqHtLhfvTW4zo4Z8FKlfKEUoIceuwPFCFW3zsGUqPt6Ey
	1jvrgOZ+eJaMvfPt5pVl6tQDOG+dVpfCyDTpjZCggwFiN86KtUWKuRCTI+Vlh+/T04KIjG4UPpk
	4NjbdFGShh9d34TiruHlBkvhS0s9q0TSqgE0Q7WxoZqYBCK5mArOGTRfPXrcYBMLSN3xSvRQlYV
	XmIc8ArbQWnum2Liewol5e2CRzXt7ydpT6I5TcdLiIHl1NTAk/N2wiMcOPc2hfHbi9Sn9Wh7KNf
	Gu1dVokpWXL89XHeNLc02F+pYsQ=
X-Received: by 2002:a05:6a00:9296:b0:84e:24f:2667 with SMTP id d2e1a72fcca58-851d38a4dc0mr18511585b3a.8.1787224423908;
        Thu, 20 Aug 2026 04:13:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d36185c8sm1515460b3a.38.2026.08.20.04.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:13:43 -0700 (PDT)
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
Subject: [PATCH 4/5] ASoC: mediatek: mt8186: Fix MCK error handling
Date: Thu, 20 Aug 2026 18:12:52 +0700
Message-ID: <20260820111253.97866-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820111253.97866-1-phucduc.bui@gmail.com>
References: <20260820111253.97866-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_041344_940110_02DA26DA 
X-CRM114-Status: GOOD (  11.64  )
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

The mt8186_mck_enable() function returns immediately when a clock
operation fails, leaving previously enabled clocks active.

Add error paths to disable previously enabled clocks before returning
the error.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index d6b0174e2655..8cc8eb8022b5 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -528,7 +528,7 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		if (ret) {
 			dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[m_sel_id], ret);
-			return ret;
+			goto ERR_ENABLE_MCLK;
 		}
 		ret = clk_set_parent(afe_priv->clk[m_sel_id],
 				     afe_priv->clk[apll_clk_id]);
@@ -536,7 +536,7 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 			dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[m_sel_id],
 				aud_clks[apll_clk_id], ret);
-			return ret;
+			goto ERR_SELECT_MCLK;
 		}
 	}
 
@@ -545,16 +545,25 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[div_clk_id], ret);
-		return ret;
+		goto ERR_ENABLE_MCLK_DIV;
 	}
 	ret = clk_set_rate(afe_priv->clk[div_clk_id], rate);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_set_rate %s, rate %d, fail %d\n",
 			__func__, aud_clks[div_clk_id], rate, ret);
-		return ret;
+		goto ERR_SET_MCLK_RATE;
 	}
 
 	return 0;
+
+ERR_SET_MCLK_RATE:
+	clk_disable_unprepare(afe_priv->clk[div_clk_id]);
+ERR_ENABLE_MCLK_DIV:
+ERR_SELECT_MCLK:
+	if (m_sel_id >= 0)
+		clk_disable_unprepare(afe_priv->clk[m_sel_id]);
+ERR_ENABLE_MCLK:
+	return ret;
 }
 
 void mt8186_mck_disable(struct mtk_base_afe *afe, int mck_id)
-- 
2.43.0


