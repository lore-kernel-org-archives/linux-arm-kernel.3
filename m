Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1077EC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 12:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4hgMi6/uNAtRYrz9ZogYJurz7z1EY11bapUhL//V5s=; b=zdpKKkiOMHQEb/yXaFf6WfS1I2
	QQsOc0WTnq6xfDjVe+9+7MpXbNDHV88qkhDkK/fqtxWvG9Z+vHrx5pz8jHmHpXEZzAExuYqC++1qu
	rEGgl8L79ECdiJo4KTkA1Z8pAVYkaOGLdcfsDEMOWCahL1RTNbD9XIwXNB8Vc+4Qb+uTSO5OEG/08
	T4XCoKjp+G0zlxxe2dDJJlFtuti2rpSAZQks2o3TR3URTcePrSRA2fsEwI+QwMxnX3XXY6GKoh5ws
	J82RFxIgZpZ2W612TzFxEZzPyhdiH3t/lVzrLUoQdII7qCea6+0Pa5uFVYWjs9Hs0WBz1jl05qudY
	zu38m2Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxONg-0000000DJSj-1B22;
	Fri, 21 Aug 2026 12:29:56 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxONd-0000000DJPu-3iPP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 12:29:54 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-84faf0fa17eso856627b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 05:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315393; x=1787920193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g4hgMi6/uNAtRYrz9ZogYJurz7z1EY11bapUhL//V5s=;
        b=C7Z5uv54BSbCHrlLYvCXEZm/pP1rdPbuKExF9e1jet80EiqZbdcoA6YffnU86D65XB
         tiL1amBF3fwYTflatKBm2Lgo6H/8oWCkDriRJnBdSdl5Ask4Ucvf3NRP8RbQJX+YRjLS
         NyF60fSWu9ZA4J1FDI9iwGaS5fAvHfYEz1/1gOIDfzMqPpXZBpfwj9YZ0P9rI0dVvlFE
         y0XPIHQ7p3w4qo4S+iXnZUNL+ZRQ+ExQ+Fh7zTlRsYF/hdh2YbQpcz0TtvYtkO2AgxpY
         k0UNVmI9NFlpr5bW3ZehQCfPwImvGaF5etwGKWfHEHo8FD9hQNazo20yveDGi50KqKQt
         gDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315393; x=1787920193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g4hgMi6/uNAtRYrz9ZogYJurz7z1EY11bapUhL//V5s=;
        b=Mhx41LAQyLKwysRR8xBpaq7w5bPydvoteLFogSZYpnEM91eP30V3unDsyass0GSgNu
         xEcYR3oAOFTjBH/L1Eac3f3wpd9lTvyyzprj/zr/b4WDGUktyS6HHxRSaB0zBQ68Um+u
         kgmUQbDeeOtDYqayIU+BeST7aCWYu8fxziU+XvDlQjTnh3IyjAR5UUkANh7jsqFBI/tE
         b2orgVabcLgDtKQeoPfG0E9VBSpXcindcaDEQllZFZYXkyWGGeSn3d2GGs/iUPab/2+C
         OsqH6cr0WFmlhgvCc3dAiOT28NvkrMwdcieyE+yIsOnzyj6cSfGXDc8BOPt/ZDUna0z2
         /meA==
X-Forwarded-Encrypted: i=1; AHgh+RpoCnbN/jrTZcGMUE6kdGIyhDITs6LjfBBnIAhjGArIFJJ3JkvD34Ti2xq1xthpk83vMb8ge7EVveq4OLLIuAP9@lists.infradead.org
X-Gm-Message-State: AFuF++mH7Zp44qiZGpeUNtAVsixUJxaWApVvEAOVlS4g3ivvcXFCHoQl
	gx1ubIbGc6ayzW006KbGq3lmlzt+TZit8LzI6QbsD+nfYiaCXskHBySa
X-Gm-Gg: AR+sD13ZqV1LXCN1tfOFeNNi/KS4On7TY7Ttu+syptLtggcLITqjRIr9WGGrtphS7Au
	ou5TwcM/R2enfqBCv/HGLkRj9ubsAZFWibioDaT7smuGF0vUliCdj+9vUjeNLvBUyhUSwkD+S6H
	lMR52Ek+Tfcg1eTA0Pkb9wk+slj+N/xjHJrKU+eTt1VuAIb5YrFYa/bPgOrDPEEn7YLQDcHYzL6
	gxEGvZc5Gx0tOK7WuVQgQOt6T1cQ8lOG45eLJwiVflx2sqnCH+Exru/6RhQrMaHLhRSzo5fVaXR
	l3BzvW6X2FNk3UC2LZpGk7BkMJQox79nICRuDVxw6N/jFR+L3eArRgWjyGwD2OCOaCL9UrDjBCp
	hbIrRqkUCssEodDqCaZLaZkE5hpw9G7ITVsqq7JlTG+wDcQCax6rCEAp5ExmVT0fQfu1zNZ5emS
	Vb/3YQ0G93LJN9QK520RK37p4AMjTAe9zqNht6Aebl5GM6Meexzg/gLaQ1x38eMcDFcIGRvLvXX
	Hql7gAIKuAypFhLV9jjlbaK/qP8zJhtDUOqMjx0wYEK9gxr1FoHhMgXxJ0yhER0eFCktkNZCeM2
	qVOn8g==
X-Received: by 2002:a05:6a00:328a:b0:851:b03a:fcb with SMTP id d2e1a72fcca58-851fa018184mr11023615b3a.14.1787315393221;
        Fri, 21 Aug 2026 05:29:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3389fc4sm2848582b3a.14.2026.08.21.05.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:29:52 -0700 (PDT)
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
Subject: [PATCH v2 2/4] ASoC: mediatek: mt8183: Fix APLL enable error handling
Date: Fri, 21 Aug 2026 19:29:26 +0700
Message-ID: <20260821122928.41343-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821122928.41343-1-phucduc.bui@gmail.com>
References: <20260821122928.41343-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_052953_932008_41DBB0F1 
X-CRM114-Status: GOOD (  12.31  )
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

Currently, the mt8183_apll*_enable() functions call mux_setting(afe, true)
but do not check its return value to handle failures.

In addition, the cleanup paths of mt8183_apll*_enable() do not call
mux_setting(afe, false) when the enable operation fails, while the
mt8183_apll*_disable() functions do.

Add error handling for apll*_mux_setting() and call mux_setting(afe, false)
in the cleanup paths when mt8183_apll*_enable() fails.

Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 6ab0734ad136..0790d8123179 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -382,7 +382,9 @@ int mt8183_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		goto ERR_APLL1_MUX_SETTING;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
 	if (ret) {
@@ -411,6 +413,8 @@ int mt8183_apll1_enable(struct mtk_base_afe *afe)
 ERR_CLK_APLL1_TUNER:
 	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
 ERR_CLK_APLL22M:
+	apll1_mux_setting(afe, false);
+ERR_APLL1_MUX_SETTING:
 	return ret;
 }
 
@@ -436,7 +440,9 @@ int mt8183_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		goto ERR_APLL2_MUX_SETTING;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
 	if (ret) {
@@ -465,6 +471,8 @@ int mt8183_apll2_enable(struct mtk_base_afe *afe)
 ERR_CLK_APLL2_TUNER:
 	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
 ERR_CLK_APLL24M:
+	apll2_mux_setting(afe, false);
+ERR_APLL2_MUX_SETTING:
 	return ret;
 }
 
-- 
2.43.0


