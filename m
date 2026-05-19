Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E0ECD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 01:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BU1E1ogi+Bq1jhmjqjfCvkZIxNYkDteN8QmCFhzbN+A=; b=AJFvqnTpWuMTpMdNJOieg6yEpH
	EEH6DtPZG5TUuGtsROu4V8R+C1zsNmtEUfMKmLDQdN9qbibfy0GC8iHkpFrhvOxbCUnOgCM+aQix8
	XYqG+Oao8/4iCRa7dNHrZD/bxJMaUm32qx5gGOSy/n31T1JLBxqCMFSiM0zSsluCmTNOQgBFKpbj+
	ss7QIUSCUTXJOClspGSdv9WrL/frWC8MGIK9RckhFM+SL80Cq95GNIrzQ/uiTK9zGoodkF5q/k0bQ
	7UPU3cK0YJ1m3bz+8WOfbWUdLisW7/NK8BTd7ZXyoNNPKFas4ItyZr7eejMYH+qNrWUp0/fusLgee
	NRQjM5+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP8tJ-0000000HJtH-0yyM;
	Tue, 19 May 2026 01:05:01 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP8tH-0000000HJrj-0SyJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 01:05:00 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-369742178f8so1649250a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 18:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779152698; x=1779757498; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BU1E1ogi+Bq1jhmjqjfCvkZIxNYkDteN8QmCFhzbN+A=;
        b=Dye9nu5tqChNRhfWkJRSLrr1D0WF/lMWNKGqw48xYJAzu1qls6cmY7+VbYqmrFW7+z
         I/STWNIOHv6Y8gIxAYlSj5BTjLHlbJAOyLZQtmMwmSkxrSVeinMv4IzBR53psyml3Bxs
         xnnWAXI3HcCq+E+Ez3VmKRM/2xOYl1VwpH+jSC6UYVUs6UhYQLfnQXXTmtyjZfjpIppk
         hHW2Edk+U86EHHp+xTRjK4wYiRnH9SUNZz5b+odVoADsUTtynoT4bTbH7cTDv3qJ2S/m
         w255LbDYGdF+/QA5kBfcwBeVJfgFtteqqhehMOBst50yGs+hlRxYP9CoX0iygdoiANLf
         W87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779152698; x=1779757498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BU1E1ogi+Bq1jhmjqjfCvkZIxNYkDteN8QmCFhzbN+A=;
        b=NEqV952frtd4ToCKOmSyCHUoZnSYtribb5H7Ow8nDGgoIILlhjEhaDux4fRMniBSvx
         uz0K7RBjtx+pkWerpoCJVsKWmBqcZ7O4f/V6wviMHZ7AloWfMVIj/YWzI5yqyj2cM/IH
         DjugeA/3tb3WzaIFEQRaXlSNaIqrtbBli4nnlNPim959whfwGAVZxU1XVHOKhArKuIJl
         4D3U05OjpFYO2TWfA+UcQ8h8hCVU2NjbqUhkkWqpRD7TJLhjTG/DQfT1uXF+de1IG5JC
         Z5fnU+53y7kBocXz+usB6oYh8EbyexSeSgJdSXhyuyOSStSXML32XBoDtRyg4dO0hxWi
         rYnA==
X-Forwarded-Encrypted: i=1; AFNElJ+9DQCTrE2lfoTEF6llpMwwFXDSVvrx3NI4YfaTX+KJzALrledF0WOSiPBIXgaofc6ANjQEDJcnZzZDCD6ZpwDX@lists.infradead.org
X-Gm-Message-State: AOJu0YyUNOjRDCYV72svxqctfW6aEU8CMlIzv101b2z8FVysFOgXUXJ1
	m7Zwj84oQE9bAZj81tpcV+qfDSuLJ8hZsmzcY8GCzpGAMZLhSk6PHH9D
X-Gm-Gg: Acq92OFJhSwOIWMQfTqFxkgfVhoxqo6EafZV98w2f16UR75vOkbXwpYoT6lsv6/kSgr
	5R2+7aSnkuPnnjCDGxe7A8BV9LwdWd6WDsdUw4EnBrRKqo3cj+m3GduCCFCbfwevAfMtm4sufzk
	V81NkQEC9+csE6yp3LlCeHDXb6uWO2bsnXS5aOlHiqDDsc9YYIU0b1niOUBtnCEPaH0V6TMFM2z
	KTwVvGRxVRgUZzU4V7xy3H/t3yNnEf9gpACQzFsy+ewynPPiP+V0eRkpcPaiW3911RM20lNwWga
	m5TT+ZVKaXrqOkEi8lRH5J4fJQKX+rX7pWcug/4EkEO2R4TYThK9nBhlp6gOCDwUFe0BCNh8KIm
	L/2TCke6QzE4v9PhI94uCE/0PDvHiyd7MXYhZlkP0NKKW5BPsIPisUIta5MUfEjWw/d3IXJnSS0
	UvfYicyVQYI1p6E8Wl5keJToKt/lILwS2za5Ntzcz6pB9PzqwxaGqp2NgMKMssa+WzG3jtVlcDk
	HdSx9rQL0DDRiWaVfMlQgDpJj5RlEg/loVsMxqO811qgw==
X-Received: by 2002:a17:90b:586f:b0:35f:bb33:d72c with SMTP id 98e67ed59e1d1-369518b00cdmr17164840a91.4.1779152698278;
        Mon, 18 May 2026 18:04:58 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695148d53asm12212912a91.15.2026.05.18.18.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 18:04:57 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] ASoC: mediatek: mt2701: fix snprintf bounds
Date: Mon, 18 May 2026 18:04:40 -0700
Message-ID: <20260519010440.629290-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_180459_152664_11B76041 
X-CRM114-Status: GOOD (  14.95  )
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

For whatever reason, GCC is unable to figure out that i2s_num is a
single digit number, with MT2701_BASE_CLK_NUM being the maximum value it
represents. Add a min() call to help it out and fix W=1 errors regarding
snprintf bounds.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
index 5a2bcf027b4f..43157f218409 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
@@ -25,6 +25,7 @@ static const char *const base_clks[] = {
 int mt2701_init_clock(struct mtk_base_afe *afe)
 {
 	struct mt2701_afe_private *afe_priv = afe->platform_priv;
+	int i2s_num;
 	int i;
 
 	for (i = 0; i < MT2701_BASE_CLK_NUM; i++) {
@@ -35,8 +36,9 @@ int mt2701_init_clock(struct mtk_base_afe *afe)
 		}
 	}
 
+	i2s_num = min(MT2701_BASE_CLK_NUM, afe_priv->soc->i2s_num);
 	/* Get I2S related clocks */
-	for (i = 0; i < afe_priv->soc->i2s_num; i++) {
+	for (i = 0; i < i2s_num; i++) {
 		struct mt2701_i2s_path *i2s_path = &afe_priv->i2s_path[i];
 		struct clk *i2s_ck;
 		char name[13];
-- 
2.54.0


