Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB78C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktoNsEAM8yzRGTqWXbn5tE4afzDQIVo6sEvkne09pIg=; b=yhVsYuUs969wHvB2MSg+b2MmCD
	VbDQh5vdYpCpeTw13TxJAgP9AlIhjmn1NPL4GsV6kLxC/dNrtNgvccKtRnMipK/mi1KZeokYgJwIo
	OrB0i1FUO9c0RrVN+ij5BvK7P5pNNXCUj1+TraOUznJLWMGwGZqQJivo5+VFjr/gCRYG6iuNNsCqe
	kRPQ+U5SvllPfGDsc58F4/aE3A+kW3TjdWdo/YiWfLJiQTvpkn3/WARpYEFj34QARnaYcSg38JvN2
	4xmpp1fyRXthSr0Mgq6xEeoa8Rcc6uRTiHFFADIblUwdgfXNdUoWfqPOKD4n18ZMYFXjHPhMC7HZY
	xVidApqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yoq-0000000EaSK-0PRE;
	Fri, 18 Sep 2026 13:40:00 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yoi-0000000EaMA-2AFl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:39:54 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso668386a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 06:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738792; x=1790343592; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ktoNsEAM8yzRGTqWXbn5tE4afzDQIVo6sEvkne09pIg=;
        b=kvVj2I/NHqkIZbD7NAJy7AX+xrbfn9A2tZCTbXFquJaj30cdHrpaK5nRFmSrCIJfd7
         4bmDNbeAkDH2TTBrCsWSShNrjCTk+6Kh/Rz46f/i6kZ3alBjFDCi7nn5y5Ise4mP0yvq
         gVklYQQeoDhX12UgS7y+rVbQOMpishn0uib8tNhHWqObhmB38iFq61Qq2pl58rzo4Di+
         KjIdtAZAPvXEKJLrrlYKyBEqywtvIWV/1SbFNeDjk9/DCKO4SJrUXx9ACoKo0WUhBkL+
         tHcmzrsAXbUH2L0TM7TOkd+oOPmn+AfL7P1xhX3rcx5pm14t9HkPXStDgLrhectz8JC1
         Ok3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738792; x=1790343592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ktoNsEAM8yzRGTqWXbn5tE4afzDQIVo6sEvkne09pIg=;
        b=mZTH5OvkKfG+nzEuSHNZ7tIFe61aCyVLm5kiZPMEzPJw+UwjzOZICxRMMD714V5Zc5
         AlrJ/hIZURDraRGOhz2wAP2FAR+rbe8ghGfMjbrnb4f5vY2kLtrQwE0oVmUBZeIU7y7r
         WaeRMZ1ua3Jx9uRhTeeNm9fLy01EVd9JLO1AO9v6ch4oiiIH/t/tWTribNgByZdxc+3I
         MTXewxcyZOEB+G2xLakqoZleJOdnbqRyiOKXLEEoeZGDJVFandeXSPDR3jaEGyrfOkNt
         hM97WTretGHdv4cQfc7fuuIiUwdttPIIsn3dSCNPZSl9ZUQsJSY0PYYtXfLE8efnuITG
         /atw==
X-Forwarded-Encrypted: i=1; AKwUvBzyJZA119kEYkFHNKg+Xy47I7qx/4luAt8VVn6vsNELiwnPWW6dzqnfw+EPOunrAy/DfPc/c2+tfMbXvBaC4pbv@lists.infradead.org
X-Gm-Message-State: AFuF++nU4OVY774CI/AOAf2c85nopuzJoAiJnRKILsEOlzzp8BDtWMx7
	woT5k5YoFbBQhBA8i4BGzgulRM6gXi0SJvuT8Whp0EM6sjTbrdFtPzqu
X-Gm-Gg: AYBFou3u2Tl8BOCINNXLEn5M1bNW4kbE7IW2IKWtRnUal39wAjUQgc7iZvHqgRy6QZK
	Tc4PTaacbT3/PFYXeaNocTr8Oi0g8pMhrPQ/TJrHvO9SQkrFiQoH1FV552L1lyV1kTEpK1ZNRPJ
	qhW0yaRZPdHDyUgHSH1xBlE8qRylejcmc0uXxM/iMJqvvHRDnN6vacDh9NrLWXzw5fpz8cX+aCL
	k5+SMm8b8pbFvQ18S2dkjJWHhiAzEH0dheFCJPNG5uIWtS5a1E3yp7I0J0bYwVnR80ulFn+BgCs
	XKRbhIRWcVuNf9wM90LvfL/L+pXFGNlvWlbG3ob4ViPtLCRHbAYrmqRgx2Nb355ivpGzujixWZC
	BOY12KNje5UiBEdDxGCl8h1GCgUfzgNI9cFoLI+HG46DVq7gQ2SusgKWOHKbwTiuYDL8QAEJoK4
	tlbbeOfsT52ESbTgLiKPzRPPHSOu3OPRhsMNspHaTqPtkAdaXngRbuKHBs/v7vAPCIaUdQLns9w
	Zx29YuX6UFh9mOSQsF8AR2vuGiVtNTxGGzaWJjypTpLR0AvuFhg+5rQDar6Ra02PmN0GJmk0p8l
	TPKX7JCq5u20Dg==
X-Received: by 2002:a17:90b:398c:b0:39e:1c2c:1d4b with SMTP id 98e67ed59e1d1-39e54bcd0a9mr5957619a91.11.1789738791912;
        Fri, 18 Sep 2026 06:39:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:39:51 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 02/15] ASoC: mediatek: mt8192: fix AFE clock error handling
Date: Fri, 18 Sep 2026 20:38:58 +0700
Message-ID: <20260918133912.133799-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_063952_653178_DC16AB31 
X-CRM114-Status: GOOD (  11.66  )
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

If a clock operation fails in mt8192_afe_enable_clock(), the function
returns immediately via the EXIT label without disabling the clocks
that were successfully enabled earlier in the sequence. This leaves
unneeded clocks running and causes a resource leak.

Properly unwind clocks enabled before an error by jumping to appropriate
cleanup labels on failure.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-clk.c | 28 +++++++++++++++-------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
index bd778e5663b5..7647bdd463d9 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
@@ -220,21 +220,21 @@ int mt8192_afe_enable_clock(struct mtk_base_afe *afe)
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_INFRA_SYS_AUDIO], ret);
-		goto EXIT;
+		return ret;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_INFRA_AUDIO_26M]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_INFRA_AUDIO_26M], ret);
-		goto EXIT;
+		goto err_disable_infra_sys_audio;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIO]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIO], ret);
-		goto EXIT;
+		goto err_disable_infra_audio_26m;
 	}
 	ret = clk_set_parent(afe_priv->clk[CLK_MUX_AUDIO],
 			     afe_priv->clk[CLK_CLK26M]);
@@ -242,14 +242,14 @@ int mt8192_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIO],
 			aud_clks[CLK_CLK26M], ret);
-		goto EXIT;
+		goto err_disable_mux_audio;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIOINTBUS], ret);
-		goto EXIT;
+		goto err_disable_mux_audio;
 	}
 
 	ret = mt8192_set_audio_int_bus_parent(afe, CLK_CLK26M);
@@ -257,7 +257,7 @@ int mt8192_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIOINTBUS],
 			aud_clks[CLK_CLK26M], ret);
-		goto EXIT;
+		goto err_disable_mux_audiointbus;
 	}
 
 	ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUDIO_H],
@@ -266,17 +266,27 @@ int mt8192_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_TOP_MUX_AUDIO_H],
 			aud_clks[CLK_TOP_APLL2_CK], ret);
-		goto EXIT;
+		goto err_disable_mux_audiointbus;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_AFE]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_AFE], ret);
-		goto EXIT;
+		goto err_disable_mux_audiointbus;
 	}
 
-EXIT:
+	return 0;
+
+err_disable_mux_audiointbus:
+	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
+err_disable_mux_audio:
+	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIO]);
+err_disable_infra_audio_26m:
+	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_AUDIO_26M]);
+err_disable_infra_sys_audio:
+	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUDIO]);
+
 	return ret;
 }
 
-- 
2.43.0


