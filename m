Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23B6CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 01:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FeX+2CJlDfJirxfhOoE2pWXNKtVRb5R3kxizay3i3Mo=; b=eiA7Mb8Jv7FDU2DmqwAILkgnqM
	s4QlHd9ce174XHXjro2GQmJeQbjN4AQuMejVs/pKFqHopfB6eaBcD/M4pZTuKUyJj0RGLZN3s6/Zq
	+vKGwhClPTtIa1BIgRfUs8fxHPiDUiIG0Oz1NdKRSclkM7R8v8SyWtlodtBZFWvMj8OhG4RnM6PdX
	JSE9rK6heT3VR5ZKA3Skm+9QJ+vIOxTm/Zzp5xlLDz37hKW+jeQL1t4rLNCSe2Z6hrCB7DLesSGit
	y2mzFOStzpWAlBKzXC/9VirPxJnQXbd0TqTfOkDtdICZ6j40XkHDI2qKXoVHWbc41L/CYx7EfOffN
	d7O9frCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQExF-00000009V5t-2YI1;
	Fri, 22 May 2026 01:45:37 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQExC-00000009V4t-2gIO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 01:45:36 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-82f9fdfc965so3153389b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 18:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779414333; x=1780019133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FeX+2CJlDfJirxfhOoE2pWXNKtVRb5R3kxizay3i3Mo=;
        b=BxqptEy/yhbB5eaEsEPOlP1geDADjNgjcNeT+7Dm2ITnbtUjIJ7xXw7aDEBa+A0Wja
         ggA2iJM84+1rUnA1e9uqO43VM84EaDrB4b1yLegKvQ5+kim1Hg3yhaFzWJ9Wm+7NCfo+
         /NnkqOy1HTAK8D+p5aDLEvHDkUdG0IhxStV3Biv/XHU57admEVB/NtfE80jTql+/4tsE
         qJWNGW35SYfJvBQ8xPdqwxxY9+rTS4RDj0KFARKh8Yrh3Y7V96juawq37voRS0Masiw2
         DmqB+RIpp1MeGyengjYfLqOwDRUlzf1v4MY2bSXw3mNt8boIDitaHlyAQYynWrKwPFb9
         FRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779414333; x=1780019133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FeX+2CJlDfJirxfhOoE2pWXNKtVRb5R3kxizay3i3Mo=;
        b=fC6pmoLI8uxPXkpEp7o5KZ54psFSUxs0Z0P4ZhS17jVZKNbZjNdK2k3PYa7RWDWIFn
         a40UofDa41T7ialFNp/XFM3dkx4xyIWuPUF0i0HWXWQtj1p+QgnxDYGm/uBPgHkCmJYQ
         cTzb6eEbAU4/B/h12J4ACa3Iveg2M38orLUBgZcfJ5HwzMo8KfE9/nMwf4B+hxs7m88o
         RnUmhbMUxyXh20QpLGPN/w/Zd37+9hvaH3Kxn9SZTxZgwMKudOSOz3eILTrUegguc1HV
         4MEMsgedyyZIwKdkHygy5RWBOUgjEn3Fo/OlYNi8nlHWk2MrmgDlj2225yDCNWPUF+YF
         j7wA==
X-Forwarded-Encrypted: i=1; AFNElJ9styB0qjQs6CvFLOzg5kzKr3WDLKc1ZD1o6IAxM6VVDZJwjQjQIM/qYrTAwA1KMAxhVTTAAShuQLvp5+8qUM/q@lists.infradead.org
X-Gm-Message-State: AOJu0YyIFDRz4Cua0ggmGtqf7XI3lEwsBuXTK4mdeOwy7rRWN8fFd41C
	OXVsaF8If50kAKJ+9jOmpezau03yA+qFA4/e9jWfAup1aA1z1fFGHW+8
X-Gm-Gg: Acq92OGaHGYaTIB135LE2MuJTmtMvOaHAXYPYmuRKSre7Mbv69coYVfxxLaLP5FQ+fE
	Of2wlAQ9ypS2UJRL595WpQuVMyQOKlbCVCz9X2Zi8v/oMuRanBBn2k3YCLvSrw0z5dDq97PpFtg
	c2WPmMmkDL1dXRsHbKoq24i4qu4rm+BHeO4FST78L2ATN7WpP8B7hKb1aagVrLxYInMWqC/DtJi
	TTgmh96LSXLa25sG6mWQ+EHM5aVuX/+QViARYfhYPa6AEOoYh3n6WMGPkgETGlzjxOtGogrEzq7
	AHpLQjBOO669anzgpq1IQYMGF4ss23Aon1b0/Oqo43FlI22FiwiPm5gz44rO2pa+p12m1xFdJ48
	Wo9p5B+OoNTDmwdSRmEIwoRIVyj4FCUfKdFJFEHF8esCooxGkzUJZysCeysw6vHF5tYXLM2yopH
	/Q0oOkxuptTxdGcficr4mBSozU8yo5aZsc0RxXrLu+hxqG1Zu9/mZ3g2hPcPAGXhUFU77WRnyfo
	TZyooLD6ii1tG+RNJYNwvlc14U1eo97wcJtaYjFStsbbw==
X-Received: by 2002:a05:6a00:18a7:b0:83f:2568:d466 with SMTP id d2e1a72fcca58-8415f30a0demr1558559b3a.31.1779414333473;
        Thu, 21 May 2026 18:45:33 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164aee7f5sm167382b3a.14.2026.05.21.18.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 18:45:32 -0700 (PDT)
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
Subject: [PATCHv2] ASoC: mediatek: mt2701: fix snprintf bounds
Date: Thu, 21 May 2026 18:45:15 -0700
Message-ID: <20260522014515.719973-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_184534_714479_680180EB 
X-CRM114-Status: GOOD (  13.80  )
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
 v2: swap min arguments
 sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
index 5a2bcf027b4f..d217f9320ad2 100644
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
 
+	i2s_num = min(afe_priv->soc->i2s_num, MT2701_BASE_CLK_NUM);
 	/* Get I2S related clocks */
-	for (i = 0; i < afe_priv->soc->i2s_num; i++) {
+	for (i = 0; i < i2s_num; i++) {
 		struct mt2701_i2s_path *i2s_path = &afe_priv->i2s_path[i];
 		struct clk *i2s_ck;
 		char name[13];
-- 
2.54.0


