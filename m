Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6EDC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 10:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mu6cEuUuRvNS2qVienJZZQ/34Pa6SULcthRHhbJplqA=; b=WTRDzqQq0a8utewXcy9rO/TyKT
	Vj52yCn+2jJ3NlcYEFadlc6x0w7Pl3vc9HyE0NshcXs9Yj27mDrM/EfrxJgsGKpN8BXNR1PdciPaq
	fC/9TXsG2MalritRN7VUX2Eha1H3D2uIYM24FRMtaRP0IFzb/t2GsI7f9pKgFnhizwRZp6t1t1hxt
	2Sxqna4+cw9uADNchaP41/i76sFnZyZ98MaH4+OxnTJbEJlb+fabsB8iE8F7R11I8TUcEF5QQYD8F
	zP8yrl9zeHmXpw//j5L44+OjZFjPb+Y1KNNenozMZK/VMA/9UASeKyWBRQR/2pE1t+kxq5MXgvuuD
	KPs0vZgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHIj-00000007lrl-1Szv;
	Tue, 18 Aug 2026 10:44:13 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHIg-00000007lqs-2x5K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 10:44:11 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso47107525ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 03:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787049850; x=1787654650; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mu6cEuUuRvNS2qVienJZZQ/34Pa6SULcthRHhbJplqA=;
        b=inyPfTkuHrs1+/DOcSeyU+0CnvxWVjCiNkZQ8SJdnHMaD8feNjGHwl6TFVCxh9xLCS
         Y3krprKhtOAyiGKjVri1iISdVJMPJnMGb8SQ2xgwdtAs+m/taFi1Vj4WF36BzBVD41CH
         P7bDAz7Sb807EjIj9L4nkRVsvNfor3X1X8wrcOZRxYxmnAfcCCa6WqRxUAtISoKZApKx
         Rhupo2KbDj5LhMRlZ+u28QibZhnDWpqpi9yTS0qOSVuGlyttGFrfdNrbU6n7NgfvBSwd
         jAn4fYMoStv/cAb4uiNi2H8n/KU/SRBItINUrvoHqd9+89Go9peiG2vP1u0jN1wOGaSy
         TXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049850; x=1787654650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mu6cEuUuRvNS2qVienJZZQ/34Pa6SULcthRHhbJplqA=;
        b=fYaduV6VxADwHsgztHXbirVtlOtR6YcBkXtrtPfEPfJRelXRWjbZwGS741C9jWQWm1
         dj20r1B1IAVC8fNTosE82SHtaVtc/3S/xL2NNWy6u9EuOluDbldTSoKgMw+z3AZW9bjp
         8CAjrUV04t+fAOH+jVtunp7Oavy/PX7vJ4ciWlnRo7mFFCIzoxEKdEmPkJnAw5DONqPB
         HHZRhsVZcSIhIJzGaQOh1qD3uheSkPgv4t0bMiVTUIQNdkz4Be9KpSza3yWrTyMKa6k3
         pmwrKBrz+mI8nMZeJBGMgnlnOp8M9/rYZnZLt0bb7NvP4CehBZN3D5L+b1x9si3YK3lh
         EcsA==
X-Forwarded-Encrypted: i=1; AHgh+Rr0jGp167wRTSICXlCU2iRnhzf/Epn75ikPcYVhcmbAsiIWyjjmW2ndtsm1w51/NNTpDp7MAiThMM45DRWzTXO2@lists.infradead.org
X-Gm-Message-State: AOJu0Yxno58aFVk6cqozE7569bhkx4UfreYok27p2kTxM+kNcQLS/f17
	wPL1LaFajXT6+KwMwSTOvLiSk1+05Ph4h8TSp57vgIm8j2XcdaEicd1I
X-Gm-Gg: AR+sD11sFDHRCneyTSwAZ3vWubEsFe2oTF1sF3t4kw2uMBJVfbK1hPsDj3S2MW0au7Z
	SnTNZiSBDR1WF9SKJCW/Ym+dE9fWOqW74HCsFjEUIUGluNhP4d+0TfGi4lmJZD2bb2b7McCJOTu
	GDYkt1c3U/q+vXTtqB5fyp7fROFokOwhoxR3+ZscV1yavLPcQHjQ0BHDsx1fEPMqiDQUf6hrJtm
	XEZe5p+OZfSTjKZiUlbprM+a6KdMS4m3ZwIgYPWh3QFuwrXC4Ln/HMN/QjitcUUg+QP+sjs2wBs
	ETDhiv0BGpB5tiX5YkIDwP08H1276QKPs9Ev8Nvc2DiYODpShWImMMnA2LJoa1qHassAJ1xsikt
	oeF0FDuuw677DXFfRzGP8A8LhSUidRTZcynMiWFu7WAwSOwdUmGFQHBYxLpUpXgGwSyE424pGBA
	CE89hzBcRso2TvGu5HAAOuHuszLWMcRFvKEh5Bn5fV3V60Y7HN5M7NEyRpg4P0F9WLfY5ZBvNEi
	8mzomu4x9xALmlO7CqihoQNZQ62ekvHpHXJWthGQttFZkE4HHQQPke+UUxMcxFeULOVOLBO6Sf4
	Okry
X-Received: by 2002:a17:903:1850:b0:2ca:f21a:a6c5 with SMTP id d9443c01a7336-2d3b0aeeb01mr407552145ad.1.1787049849560;
        Tue, 18 Aug 2026 03:44:09 -0700 (PDT)
Received: from phuc-desktop.. ([14.160.25.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267bf83fb2sm15039905eec.19.2026.08.18.03.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:44:09 -0700 (PDT)
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
Subject: [PATCH 1/3] ASoC: mediatek: mt8173: Fix clock error handling
Date: Tue, 18 Aug 2026 17:43:42 +0700
Message-ID: <20260818104344.37824-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_034410_748249_B775CEA9 
X-CRM114-Status: GOOD (  12.49  )
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

The error handling paths in mt8173_afe_runtime_resume() use incorrect
labels, specifically err_i2s1_m and err_i2s2_m.
When clk_prepare_enable() fails, the code jumps to a label that calls
clk_disable_unprepare() on the clock that failed to enable. Instead,
it should call clk_disable_unprepare() on the clock that was successfully
enabled before the failure.

Fix the labels and clk_disable_unprepare() calls to ensure the error
cleanup is handled correctly.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 69cadc91c97f..b4c6ef6f0845 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -997,10 +997,10 @@ static int mt8173_afe_runtime_resume(struct device *dev)
 		goto err_bck0;
 	ret = clk_prepare_enable(afe_priv->clocks[MT8173_CLK_I2S1_M]);
 	if (ret)
-		goto err_i2s1_m;
+		goto err_bck1;
 	ret = clk_prepare_enable(afe_priv->clocks[MT8173_CLK_I2S2_M]);
 	if (ret)
-		goto err_i2s2_m;
+		goto err_i2s1_m;
 
 	/* enable AFE clk */
 	regmap_update_bits(afe->regmap, AUDIO_TOP_CON0, AUD_TCON0_PDN_AFE, 0);
@@ -1018,8 +1018,8 @@ static int mt8173_afe_runtime_resume(struct device *dev)
 
 err_i2s1_m:
 	clk_disable_unprepare(afe_priv->clocks[MT8173_CLK_I2S1_M]);
-err_i2s2_m:
-	clk_disable_unprepare(afe_priv->clocks[MT8173_CLK_I2S2_M]);
+err_bck1:
+	clk_disable_unprepare(afe_priv->clocks[MT8173_CLK_BCK1]);
 err_bck0:
 	clk_disable_unprepare(afe_priv->clocks[MT8173_CLK_BCK0]);
 err_top_aud:
-- 
2.43.0


