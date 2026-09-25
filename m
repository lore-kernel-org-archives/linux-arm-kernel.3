Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0085C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 04:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKjDwPOE3diTKoGaWJLuVQ3uglSGi8QtTacAmTtKLmA=; b=dXYpbuImk1HTGwFdGyTs9jHPQw
	tSDk+vZ9oWXcWKqGYBlNjZJY7VV86INwhyoDL62Ek0TMIK468iq3EX12i95Am9QDI/rtgaoI2gjz7
	2+TWMtANpty/06bahrhQswxWrl3gS37Sy+97WbVtVfURBXpia9LEu8M8ON9LXP35cvmKMaP3K+5jU
	sLGbw8qCFnTa0ECQxAYcY+CouqtDVnXpDl5Ntz4zvcKW4btXNkgNUjHlxYEcKgvC6FGUO2CpS2YsM
	iEaPICgmUrwcocZ170AEVz6Y+PnmSQGdiyOTEGSZ7hDDKVc8TAs1lPSC1FP/Xrug5qAsB0px6lxBI
	J41cXTbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xt9-0000000CdWA-14F2;
	Fri, 25 Sep 2026 04:50:23 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xsy-0000000CdNn-1vX8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 04:50:15 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so378533a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 21:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311812; x=1790916612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GKjDwPOE3diTKoGaWJLuVQ3uglSGi8QtTacAmTtKLmA=;
        b=FDHGKi4bi006AuAGF63fv+uG8QBIfTiD/gP3sK3CSASR2LZaK0GaANW7+BGr1/lA/2
         DC1Kj9v1TkJJXzBsX5KueLenSYgqHbF0VrI/oZeT9OIX7vOpUKimMaDV7ULEEg9nSXx2
         5nu2CfWjrKfV+rfCg1Vt1k5be7QD7hhwvQX/n94/yZu12/JrKORPI6Kv67obkijRje4+
         NV6EzUWjKoNi6apFIwkciZnUeZjgsKN8DARG256M3t9+zzT0e4nOunDGMJudHggk+BMw
         ZBihIxV1mwTB69H8Mr32gWzmRb+k8G1gLkPJqhw30LfH5g5NxDww+k5Jmuz3xEDgJLh4
         f6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311812; x=1790916612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GKjDwPOE3diTKoGaWJLuVQ3uglSGi8QtTacAmTtKLmA=;
        b=NOI8Lobvij/d1t/YcUExJp231cEM9dM3L/AHVeHnf3+o9QRvrehkzFyGG6dFzBwd9V
         af18hhYDyExpl602oz8miVtmZExy+k/D7CR5J7ptq0SM0Kf6siLxMFm3EVKzGFMu7riI
         BPV/gIzIVKGaA3r3VnR9lJl72HLMyHDhJokHvVgzFU1gg75jNXTpjQvzcjpinn4O5pPQ
         ZgikGn5NNoCWXooA8vQf2Mu1/AbUhgR0NjWtaifiye18zuEVtbp36BgNmVpvj2yNm4/I
         H1rjkX07j4ULkLO61jFZMx/3x4zGgafmSPxRQOKaPJWCDKUr9EHvC1QBq8joYoJD3c81
         QbLw==
X-Forwarded-Encrypted: i=1; AKwUvByyAI6F9LaVwN5Ektog6SPEhxlwq/cziGBwuIB2cUiNlzwz7Vi26Y0Yb98tkJlQbkk1Oo2bcPbVygplD0X9slyB@lists.infradead.org
X-Gm-Message-State: AFuF++mwKVr7Mxgwu2sb+TeUxPoEz74AJ/uIXWR7t1ayVlsv3Fcgjgzq
	n9ZfpAc+BjwwQlJZUw2nARi+Qp2H0OZdmYZ6wQ6AiAhRJwUyCtZnl24M
X-Gm-Gg: AYBFou1mjrK/0xtwDV1u8jihdk7EaNGOvRto76FYjbW62BbjhM3Na4Vp9Ey0iklBsYD
	bCOlPVhvN1+GX4A+kNuya/CGqAWDVr0+ziqN4sdtPYbtPWcuh6nvLwywL95IvHU4JCQARgtZzZj
	0c1n+u3AdQa3A6+XYLotOnSvkh+QWZJ1G+464jYFjfTPm9BNZjcfeCq8qJVGGxhLxAWcjeWL3fw
	yYrCiKTTQxuOnjz6N3PGmSuSejbYHEbDYPnnz+mcLgcSqKqj884ohLGoR53qxW30AJSxAjcChSI
	ZYgpIjIvS7C53ZeguVIVVaL/2Q8QPOW8NzUE9+SW2pnMhEU6aDuVme9N1fRiR1l21gUrSK04OxI
	ozH9zqVS7wQvzKAyio5RzZetyh4fZjcEoGAPwKI1u7u6Dr97Y3zzOJU0RBNPWmCZw0tgRqnKjXO
	bK4LdvodSEPoq66BamCW5CCZxW72KCLaMwySjKGxXXbqh/YiHURL3gHdhZTPTpHXQLAf5olEr1C
	kMPUNtp/TZTsp9oD0z/ncXMaycLNZ4yRw2i4yjXjNoT11wwnEQo2ncClbZUoTovAgC+j91nhrNQ
	vIidT24DcdjzsQ==
X-Received: by 2002:a17:90b:5404:b0:39e:3713:c2e4 with SMTP id 98e67ed59e1d1-3a098ad3c2emr3883170a91.14.1790311811708;
        Thu, 24 Sep 2026 21:50:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:11 -0700 (PDT)
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
Subject: [PATCH 04/14] ASoC: mediatek: mt8195: Fix timing system clock error handling
Date: Fri, 25 Sep 2026 11:48:58 +0700
Message-ID: <20260925044908.450775-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_215012_501570_A842713E 
X-CRM114-Status: GOOD (  15.96  )
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

Check the return value of mt8195_afe_enable_clk() when enabling the
timing system clocks.

If enabling a clock fails, disable the clocks that were already
enabled and propagate the error to the caller. In
mt8195_afe_enable_main_clock(), return the error instead of continuing
with AFE clock enable.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 34c828fdea29..ef7a62fba6ec 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -662,7 +662,7 @@ static int mt8195_afe_disable_afe_on(struct mtk_base_afe *afe)
 static int mt8195_afe_enable_timing_sys(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int i;
+	int i, ret;
 	static const unsigned int clk_array[] = {
 		MT8195_CLK_AUD_A1SYS,
 		MT8195_CLK_AUD_A2SYS,
@@ -673,13 +673,22 @@ static int mt8195_afe_enable_timing_sys(struct mtk_base_afe *afe)
 		MT8195_TOP_CG_26M_TIMING,
 	};
 
-	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+	for (i = 0; i < ARRAY_SIZE(clk_array); i++) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+		if (ret)
+			goto err_disable_clk;
+	}
 
 	for (i = 0; i < ARRAY_SIZE(cg_array); i++)
 		mt8195_afe_enable_top_cg(afe, cg_array[i]);
 
 	return 0;
+
+err_disable_clk:
+	while (--i >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[clk_array[i]]);
+
+	return ret;
 }
 
 static int mt8195_afe_disable_timing_sys(struct mtk_base_afe *afe)
@@ -707,7 +716,11 @@ static int mt8195_afe_disable_timing_sys(struct mtk_base_afe *afe)
 
 int mt8195_afe_enable_main_clock(struct mtk_base_afe *afe)
 {
-	mt8195_afe_enable_timing_sys(afe);
+	int ret;
+
+	ret = mt8195_afe_enable_timing_sys(afe);
+	if (ret)
+		return ret;
 
 	mt8195_afe_enable_afe_on(afe);
 
-- 
2.43.0


