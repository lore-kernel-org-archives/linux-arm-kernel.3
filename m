Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C741C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 12:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9UdK2e9HQb43MTIsHuNy+QqIiXIInrTnSwN7k6DDQs=; b=onYfoLhg+R7prLeiNOnHOmF4kP
	fxuXVhJ/arAbnTR1dnnkVVPnDhqs8L7a846JE/suxOzpT7bJpZTp6Mzq6Bq1ka15AsHmYcRaGF9uC
	UyoSdr9t9P7bCOyNaRR1gQf8ZZcF9/hGF2gAOwwnGRCjCB1sLqcOzPz+ZvbHVH4CDyp6Fb0wOt30f
	ICemt2Gc8eL94m+bupZSHTEK8gEqpASeNxZ5VRLuKW2uogEORGGEBbyUZyYBhEmV9MJAJNFwb++gd
	hUcSFlAWu2RNF96liGFua2fQlWk94ouKpAedWBemLbiMFEhpIXtZHw9YCVK7SYfB2jQAb90+rqII2
	/7sWg7zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y4v-00000006kU9-3jCW;
	Mon, 07 Sep 2026 12:04:01 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y4t-00000006kQ8-0MEV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 12:04:00 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2d5cad1a6baso29686285ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 05:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782638; x=1789387438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x9UdK2e9HQb43MTIsHuNy+QqIiXIInrTnSwN7k6DDQs=;
        b=EqRaaxx7PD5oLZrm9bD01bV/p9lneOtBIKf8Db06u/LIqUcZd4yPB6ca232F6ajsJe
         kvr17m6hJhyUtDcJK4XHc3DBA0gbI6p3ggn8Nn+gw2WD8kFiaJKsmKTJjlwyUZ3nB8ZM
         yc6csU620br/8evxf9wYgh9pju+0JEf7E2ZAfNMg6LQubF9TPIo4b6fhtd10krPTK+XN
         oVt2+2WpM1BrP1bt0MpSaZ0jhwkajY/isdRMLfEStd6Lf+3Erd+gpIm0t+B1o6mOWtz3
         p2Vg5CUHXio6pYIUwGRbqauHqdPkhWJNNv36zniq5b8ZFDfiLKPPzCDAfTO3WVH+jkLl
         9MXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782638; x=1789387438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x9UdK2e9HQb43MTIsHuNy+QqIiXIInrTnSwN7k6DDQs=;
        b=ZPVRax2ZbsCDukjbuD895sgTO0BhHuq/RpvdIu5s0ViWw/mcPyCSL2ELtSqHYlKJEQ
         EHIw7JalVe18PB6vkqCBI/AZVy/EJjA6G4fBx5WHUhh4ThbYUtL05ii6BEkwvG9JxGRH
         bwe23AOBJufqJhuHc4tYwAivjZQ5EPUP4RrLsA/v7ZQKAMhDjfxRIeVJBadRv2kEaxU2
         8HrHdASUNGDbTs7bj8bJhA/gpMeSjVUVA+3rovDQfy0FJBFecXYR1IbbVoTX3xcUZaW2
         03QiWh54CZqyGgk+jZ3vU3AIT89CqPSnukZ9yTf8DEvwJt8giSgttOf+wHY/Rn9Wl4m+
         RRlw==
X-Forwarded-Encrypted: i=1; AKwUvBy2DdoKqsJgzFPqI+euMJHKahTnl923HLCV2oFo0LBuvlu1+Z1RL4lj13dgOBdiNVZYKfNmS+BgsNQO3Df2htbw@lists.infradead.org
X-Gm-Message-State: AFuF++k4HaRnQK2vN45fvNaeKsOwlwr85ZNdcDHEVQ5tpqhS6pTkYLOY
	Wn9WkgzYJ9mFM3xG45XhyNlZcnMJkeE0D+Rc55xi/a4TZoQFMaM95FFn
X-Gm-Gg: AYBFou3DhfKPkSih7+yrrfr8egRkpeg8XlqR14hdZhl8bK+5ZFYN6P1YklODwxB56is
	WXsAOhO6fxvwsC+m8g7qfiQMZwtXNK9jEnRrOulf/Wj9jDLti02LvS70IxMreoWBZMa3nMJNy0c
	7+pL3XuaJMRLLhFCzuKQ4QObZ8s8CIu+1FX14Ub6uzqk8ZAnbISGEPCs3Hmc+A0/fEakLBw+hb8
	hLhj/kQp8jAoKJeZOyIgz/Ny2ITRBv50GdZ1yT4a8La64VMFaxS+3kaMQuAU3PUR6fs3ENAa+5o
	tvqaPNj4BEo8RrCaIUWvRt5h/gfL1Rj0ZrV7hq/qo9eVnwjpQZy8NaACR8DM6C5Ko+u38k8K/oz
	HxD0ErGm7Gl0zeDRi0pfDylR5v+UiBBvVmkVCDZ1tc6JpGWVhW0vcH6rFx/VUTS0XsgkVAwYrA4
	3+71KNQR6Pb5/wkYyT6uEy2xEp3NUX5ooRE3h6zZnhoI/sYYIvr28CmmBHSlTmSjeB7MQGPFeNA
	MpQyIk/5rn7XKH3S8t2Ce/a3XGAFa737o1dQ/ESjpLoTy5Z25ipZWJ6SHK0TJcqFqZvYQWHApys
	GPgz
X-Received: by 2002:a17:903:46cd:b0:2ca:1479:d9dc with SMTP id d9443c01a7336-2db125c332fmr382050405ad.12.1788782638093;
        Mon, 07 Sep 2026 05:03:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:03:57 -0700 (PDT)
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
Subject: [PATCH 4/7] ASoC: mediatek: mt8188: mt8188-afe-clk: Handle clock enable errors
Date: Mon,  7 Sep 2026 19:03:07 +0700
Message-ID: <20260907120310.135693-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_050359_128857_2AE461B1 
X-CRM114-Status: GOOD (  14.16  )
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

Clock enable errors are currently ignored by several AFE clock
control functions.

Check the return values and roll back previously enabled clocks when
a subsequent clock enable fails.

Fixes: f6b026479b13 ("ASoC: mediatek: mt8188: support audio clock control")
Fixes: 9be0213a6858 ("ASoC: mediatek: mt8188: refine APLL control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 69 ++++++++++++++++++----
 1 file changed, 58 insertions(+), 11 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
index 77511f6fba41..8b6dca22c8ed 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
@@ -579,22 +579,47 @@ static int mt8188_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_t
 int mt8188_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 {
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
-
+	int ret;
 	/* bus clock for AFE external access, like DRAM */
-	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_TOP_AUDIO_LOCAL_BUS_SEL]);
+	ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_TOP_AUDIO_LOCAL_BUS_SEL]);
+	if (ret)
+		goto err_local_bus;
 
 	/* bus clock for AFE internal access, like AFE SRAM */
-	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_TOP_AUD_INTBUS_SEL]);
+	ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_TOP_AUD_INTBUS_SEL]);
+	if (ret)
+		goto err_intbus;
 
 	/* audio 26m clock source */
-	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_ADSP_AUDIO_26M]);
+	ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_ADSP_AUDIO_26M]);
+	if (ret)
+		goto err_26m;
 
 	/* AFE hw clock */
-	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_AFE]);
-	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS_HP]);
-	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS]);
+	ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_AFE]);
+	if (ret)
+		goto err_afe;
+	ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS_HP]);
+	if (ret)
+		goto err_a1sys_hp;
+	ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS]);
+	if (ret)
+		goto err_a1sys;
 
 	return 0;
+
+err_a1sys:
+	mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS_HP]);
+err_a1sys_hp:
+	mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_AFE]);
+err_afe:
+	mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_ADSP_AUDIO_26M]);
+err_26m:
+	mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_TOP_AUD_INTBUS_SEL]);
+err_intbus:
+	mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_TOP_AUDIO_LOCAL_BUS_SEL]);
+err_local_bus:
+	return ret;
 }
 
 int mt8188_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
@@ -630,7 +655,13 @@ static int mt8188_afe_enable_a1sys(struct mtk_base_afe *afe)
 	if (ret)
 		return ret;
 
-	return mt8188_afe_enable_top_cg(afe, MT8188_TOP_CG_A1SYS_TIMING);
+	ret = mt8188_afe_enable_top_cg(afe, MT8188_TOP_CG_A1SYS_TIMING);
+	if (ret) {
+		mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS]);
+		return ret;
+	}
+
+	return 0;
 }
 
 static int mt8188_afe_disable_a1sys(struct mtk_base_afe *afe)
@@ -651,7 +682,13 @@ static int mt8188_afe_enable_a2sys(struct mtk_base_afe *afe)
 	if (ret)
 		return ret;
 
-	return mt8188_afe_enable_top_cg(afe, MT8188_TOP_CG_A2SYS_TIMING);
+	ret = mt8188_afe_enable_top_cg(afe, MT8188_TOP_CG_A2SYS_TIMING);
+	if (ret) {
+		mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A2SYS]);
+		return ret;
+	}
+
+	return 0;
 }
 
 static int mt8188_afe_disable_a2sys(struct mtk_base_afe *afe)
@@ -739,8 +776,18 @@ int mt8188_apll2_disable(struct mtk_base_afe *afe)
 
 int mt8188_afe_enable_main_clock(struct mtk_base_afe *afe)
 {
-	mt8188_afe_enable_top_cg(afe, MT8188_TOP_CG_26M_TIMING);
-	mt8188_afe_enable_afe_on(afe);
+	int ret;
+
+	ret = mt8188_afe_enable_top_cg(afe, MT8188_TOP_CG_26M_TIMING);
+	if (ret)
+		return ret;
+
+	ret = mt8188_afe_enable_afe_on(afe);
+	if (ret) {
+		mt8188_afe_disable_top_cg(afe, MT8188_TOP_CG_26M_TIMING);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.43.0


