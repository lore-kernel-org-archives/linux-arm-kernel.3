Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F36C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCVvBPbKtk3VcJreNW7SRJiAXgmB7FAeWV2dOTbxzuc=; b=J6MUX3A8PW7v4nxlQgGgnmh3nO
	AsjbNiQ/N/vzggvjip2jinZ3GMkT3ub2WhwmfcREXeJvFRf1Wfx8OOB7C2nIxipWzDbkW6dHhkPh/
	b0/TtB1fiF0wWfE6aA4Z8At+HEa3r/UF39D2uB13ylzK9lqaCEfdZLp+sEKCEWLlyOBzb80JqH8tz
	GFVpVtJPezxlxm8UYsUawLjBktK8mnfRri4dabihMrnP7TYdoESfP37089RRZjH/yWawylh4hYU/t
	qzpkaKAYsH4uy1DO4MD5VAgspdc5zLdN7JOcBW2M+b3wRRHaAWIrN3uCX5EllzfDagsrEb6aPqZBi
	za1KVC2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR4K-00000002Pge-18MF;
	Tue, 29 Sep 2026 06:12:00 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR4H-00000002Pfa-2IgQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 06:11:58 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so2265503a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 23:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662317; x=1791267117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iCVvBPbKtk3VcJreNW7SRJiAXgmB7FAeWV2dOTbxzuc=;
        b=kKKE6dbHpclCjIuW2IzIHBy5+aciCSEJdMnV9Od0WUMRq5S5X485zy6dG6haaXND5N
         uX0ytEFTyf0Wyy/nrqwWJ7uZ0FTbc15rsIddkUxnSoNvZy9IDYOO1yGq8/QiiXZkMUPe
         Zv6flczvV9Iaf4t1sLT68tLI76tIngGgPYj/jKkLthPNblhGMbAumCrnEv8gnXN7eazA
         Ncpvr1KVvw/mxx7hDtQOw6LQVu0exblqqgblN4Z5sXvnja8iXp7sPyCQGYJP/X8wgAsu
         cbWxi//Q0nDd9B9v8fuMEvcFudAvlmNmqtwhCfWqAYJufea1IGWjKNIZQPtG30gfkTl2
         IxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662317; x=1791267117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iCVvBPbKtk3VcJreNW7SRJiAXgmB7FAeWV2dOTbxzuc=;
        b=wisjaFfNnejBC1O1022fC4nLs8oUAgHzxPgLpItlot0rY3qEglRBfeqSAa2Q0r4qMc
         67HJ3taq1ue7MPe7PSKinUcM0o5oDCF2YB7LNWb423QkFdT8kmNfYEkzu3NJoli2/kng
         4us5GiGTkJ/xhpx5M61LEzlZClI5tOf63O5yvOshI5R0ozM5rOYnEWa63xmBMgG6Mn/F
         xyws9mCucdY6N0U7BPFuOqseSXg6Mdl9TK0tqSlSXurHBlIi+IbyTrBFARHP8RTRrTx5
         +fgK77BoOEqWAFmWg0eLWZsv+SPh98LAiNtfXFmR/dKj9V32rzku+iDF08rKque/a9ms
         ip2w==
X-Forwarded-Encrypted: i=1; AKwUvByfJw+oQTo9troYe6MNZdh7C/bSNfqXr4k4NqEUpJtRheHVTDK6zkURK0Byzq11mue8nw40uJMqArwrm1DaF252@lists.infradead.org
X-Gm-Message-State: AFq9FYK02HIKTelF5MsckfmFlFmY706sFv5Nf1JcVZCU1b/2QdyXJPZ4
	Px6hESe05jbl7661rkedS74b3B02DEmzu7hErPFaNMVNLN7sqXg1bVqT
X-Gm-Gg: AYBFou0MEQiXzAe2AI3BAqgXYEWgAQEArPfpnalmn51D6h/iRhQAL2tCJvgMA6oV9tY
	F5hnURXeD1cvd/49t6qroG+HHwf/Jz8kfcGTVRqmdQeMgzHZeRPmuxcCUmc3+9h85untpvVNiw6
	xzmAHDHjJptHbAl3mNPl60ftz1Q96AEmV/i8bRgSwlaEAPCO3avl3lGY8EjSx1syLpOtfSJFvLY
	0Z9MLFZifoZoDBXioDtxcN6ra6BpVFi7qK9k+b/z5DitXv7eU5Fa2VBoZYPxIGU++o6qcINV/mW
	h0G6zOIZ9D5FxIXihHxLRfOxky/38KBd3kQHUUuMMQUmnRuzt685hwKirUKkO4iY+3RCIkMOORB
	aOzaiR/ANrtevjqBbGbOSZiLje/RUGOo6TdgLl3ubxR7eKGiakBOo/oTVcUtMYOSjF1gPYeAzUO
	0PDi1zoNlAzrdutxwQZiLDsMjVdoes43AG7RYAMRBGYck2tI4gTUl1FsoSXc8pCwC/0yef+hSD7
	/PkRHvU/3EiOV/Dc0LUVfnF1yJezhaJWeKJStvZZa6fF+4AGOY9D/511jdWKKbDARX6K8RYFFKW
	e6/4QUVWIDe+6DPSYi3rdoDQ
X-Received: by 2002:a17:90b:3a4d:b0:3a4:9ba1:94fb with SMTP id 98e67ed59e1d1-3a49ba1ad2emr1589587a91.52.1790662316829;
        Mon, 28 Sep 2026 23:11:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:11:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 01/10] ASoC: mediatek: mt8196: fix APLL mux error handling
Date: Tue, 29 Sep 2026 13:11:12 +0700
Message-ID: <20260929061121.124001-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_231157_597686_46E59810 
X-CRM114-Status: GOOD (  11.59  )
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

Propagate errors from clock operations in the enable path and clean up
previously enabled clocks when a later operation fails.

For the disable path, continue disabling all clocks even if a clock
operation fails. Do not propagate the errors so that the disable path
can perform as much cleanup as possible.

Fixes: 7384ecab34eb ("ASoC: mediatek: mt8196: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 56 +++++++++++++---------
 1 file changed, 34 insertions(+), 22 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
index 286e39f53ae0..91ae44024949 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -220,33 +220,39 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1],
 					      MT8196_AUD_ENG1_CLK);
 		if (ret)
-			return ret;
+			goto err_disable_eng1;
 
 		ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
 		if (ret)
-			return ret;
+			goto err_restore_eng1;
 
 		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
 					      apll_rate);
 		if (ret)
-			return ret;
+			goto err_disable_audio_h;
 	} else {
-		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1],
-					      MT8196_AFE_26M);
-		if (ret)
-			return ret;
+		mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1],
+					MT8196_AFE_26M);
 
 		mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1]);
 
-		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
-					      MT8196_AFE_26M);
-		if (ret)
-			return ret;
+		mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
+					MT8196_AFE_26M);
 
 		mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
 	}
 
 	return 0;
+
+err_disable_audio_h:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+err_restore_eng1:
+	mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1],
+				MT8196_AFE_26M);
+err_disable_eng1:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1]);
+
+	return ret;
 }
 
 static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
@@ -268,33 +274,39 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2],
 					      MT8196_AUD_ENG2_CLK);
 		if (ret)
-			return ret;
+			goto err_disable_eng2;
 
 		ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
 		if (ret)
-			return ret;
+			goto err_restore_eng2;
 
 		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
 					      apll_rate);
 		if (ret)
-			return ret;
+			goto err_disable_audio_h;
 	} else {
-		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2],
-					      MT8196_AFE_26M);
-		if (ret)
-			return ret;
+		mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2],
+					MT8196_AFE_26M);
 
 		mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2]);
 
-		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
-					      MT8196_AFE_26M);
-		if (ret)
-			return ret;
+		mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
+					MT8196_AFE_26M);
 
 		mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
 	}
 
 	return 0;
+
+err_disable_audio_h:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+err_restore_eng2:
+	mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2],
+				MT8196_AFE_26M);
+err_disable_eng2:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2]);
+
+	return ret;
 }
 
 int mt8196_apll1_enable(struct mtk_base_afe *afe)
-- 
2.43.0


