Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8558BC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21pMHDsV/Fd9QFDutbYYXowTkN17HxIRjn27KJEcxhQ=; b=UsZoNS3PUwmv7qMmVh6wGo6npH
	RHUH5iuSNoVFFmre7BPbIHcmIctIJAaSUMd6KJWsHn+atKJ4b4Pkierb2BeY6uBTfNLQXnbJPE462
	BAVecPC+UJrzRmlcZKnKfwUArODi+n/UM1ASOMVOdvCMx2/bhnbEnoSV1qaTcqpt15CrR5FXL/aaC
	+i7OumK5UYvAlIKUs0LuOIP6eHofxwqW3UgB+KN4U5BOFy0/QxGq2/Cs1+YV13CjYHKcLXhvRBiQU
	WaiCS8PbsUFbDXjCVLsa6kMXy9Rw8qMqHqzf5wXBO+WqrLkbiHaOcXRoWqjCMaJXxKPA6CSPj37B5
	oEk6ZhgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ypn-0000000EbQH-3P5D;
	Fri, 18 Sep 2026 13:40:59 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YpV-0000000Eb7L-1nPH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:40:42 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccc02279so603922a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 06:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738841; x=1790343641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=21pMHDsV/Fd9QFDutbYYXowTkN17HxIRjn27KJEcxhQ=;
        b=aN0yZIG5eeNo4hDKM7cHFrGndiQ0R0tzdNcR+/OR/J8H0XQO+M1r30Opef5jwa5qWS
         dQGcBuL5MbFNJKuRhda254lGesdZa4KUv5C4nv3WkWkHYNL0+ncrVpwywvLe3cUPsQQ4
         L93jFaKQPKGImn2+HgmLsP3UUo7Quh6D+pYuBbau+AWncbnZNwZ2xn8CttnJ6Ygmh848
         QLw6zXONw6pvuWOSqzK4DbovFEZcghBfGBTS94PpbdW/0KqeIDX+m6Owwp67laXgprZ8
         0boBDZbqxgK6F3iewScwabG7TUpXBnkiue+Z1jXoj4NSFhMFIhox5dYaZ64kBAH5Gr/C
         YWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738841; x=1790343641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=21pMHDsV/Fd9QFDutbYYXowTkN17HxIRjn27KJEcxhQ=;
        b=PdcFQu24szJx2P3qF0fppXipab3ULZ9+8TINV80LpiZFSEpUAbi5dv+m7eZa4y/e7Z
         BDJM8QiLA3sD3ob/WbiDsN/ARcRVEDNJLrhVw2Vvhxc7nQ2elJjw8qU9P16T6JXT2lCz
         DV4Rpb2eMrRSBpIwRQCDvdVo/NsJkeKv+/LBeZUvZ6Fb3wn8HMmTuTztt7oOVLNeZv2T
         XC0Svbt/cG/i2iXNyDeHd61vLfleV7Eg4E1WJ18SLmzl1hhn2Q52ZKwLJdZHFAlQhJE3
         VwDxbGHWg1x80vKzY7LuF+b2U/yGCrYjMCXqMfdYFILeIpMMy3vD7cYQN4XV2EyNXAiF
         dOFw==
X-Forwarded-Encrypted: i=1; AKwUvBwvVQaG19r44L12d1g6pafzX9yy+QiQ6lks0o3UEIx+WHNbDxKNI8A4JqhtYGkiqUM0hd+ZD1xuDy2DDMPUZsrP@lists.infradead.org
X-Gm-Message-State: AFuF++kcHqiBRqHEwdEYzEvWM7ycJlVpM/KjU7nycMr4KmtZquOrtajJ
	+lpO5vMf9myBgDgEbx7wpvYfyrfMDmRjzCjriGcpnXPH3ILQTtxN+n4p
X-Gm-Gg: AYBFou3frzLCI3bmrhkxZnwQzoCGk3YrbjVA+sMkT1gGIjPPVZWvh0utu1Eh2m5EDoB
	K0NISc5bc/Q0C6LK8QGhDws/8ROnI2ub/hJo3aXmh/ERSBF+cXqHNrNJ+fS//a3pVdUbPxVHDrO
	BUiaQgEtfX+B+THMrFzTZutd5H/Y7omuiLq/GxT06bG8QuR9PpV6HWCUHCXBrOhQTFafNa+9MCx
	HBcSO0sITD2kY7sPMMLKwq+q92EWdzXXDMQpy6kAQ20hHkJRacIVpAsy3Zwt0DFDWFxJFBgoy7k
	WROzVcHGRuZSvgRS4MRacD9BjxPURXrbLXl1T0IEN1csVhO546wrX5AhSCXr20b/T5ptFQsBrrq
	Hduobau6c65kq7/lvpCT1Gdx1qDjibPd2odRJJ/nMnmOXGC3Cr+GA/Hrt+41rtEmTTeC6uP8D0f
	Jseh6UetP5TmzccDwuczBEQClQSWUGTKgHtCXoh0jnSMkiP1UO+YlPWDSRkYkYSQ7XERzTWhyEs
	Uii7Zf4MhalY73rVvKAVNi826dF2avaixC1Exa/HqVVad80Eum+xLyXe+BHQvPbOQ/qzoJL4fKB
	HNxTpbFiJQF2Xw==
X-Received: by 2002:a17:90b:48d0:b0:39d:ec24:5ffe with SMTP id 98e67ed59e1d1-39e54d1115amr6173759a91.9.1789738840001;
        Fri, 18 Sep 2026 06:40:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:39 -0700 (PDT)
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
Subject: [PATCH 12/15] ASoC: mediatek: mt8192: Propagate mt8192_afe_gpio_request() errors in ADDA DAI
Date: Fri, 18 Sep 2026 20:39:08 +0700
Message-ID: <20260918133912.133799-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_064041_789774_96EEC0EC 
X-CRM114-Status: GOOD (  13.02  )
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

Currently, DAPM event handlers in mt8192-dai-adda.c ignore the return
value of mt8192_afe_gpio_request(). If GPIO configuration fails during
PRE_PMU or POST_PMD events, the error is silently ignored.

Fix this by checking and propagating error codes from
mt8192_afe_gpio_request() in all ADDA DAPM event handlers.

Fixes: 607ac4859564 ("ASoC: mediatek: mt8192: support adda in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c | 44 +++++++++++++++------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
index f8cb84621d38..c5c726a6e423 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
@@ -218,10 +218,13 @@ static int mtk_adda_ul_event(struct snd_soc_dapm_widget *w,
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int mtkaif_dmic = afe_priv->mtkaif_dmic;
+	int ret;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 1);
+		ret = mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 1);
+		if (ret)
+			return ret;
 
 		/* update setting to dmic */
 		if (mtkaif_dmic) {
@@ -239,7 +242,9 @@ static int mtk_adda_ul_event(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_POST_PMD:
 		/* should delayed 1/fs(smallest is 8k) = 125us before afe off */
 		usleep_range(125, 135);
-		mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA, 1);
+		ret = mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA, 1);
+		if (ret)
+			return ret;
 		break;
 	default:
 		break;
@@ -257,11 +262,14 @@ static int mtk_adda_ch34_ul_event(struct snd_soc_dapm_widget *w,
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int mtkaif_dmic = afe_priv->mtkaif_dmic_ch34;
 	int mtkaif_adda6_only = afe_priv->mtkaif_adda6_only;
+	int ret;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34,
-					1);
+		ret = mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34,
+					      1);
+		if (ret)
+			return ret;
 
 		/* update setting to dmic */
 		if (mtkaif_dmic) {
@@ -291,8 +299,10 @@ static int mtk_adda_ch34_ul_event(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_POST_PMD:
 		/* should delayed 1/fs(smallest is 8k) = 125us before afe off */
 		usleep_range(125, 135);
-		mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA_CH34,
-					1);
+		ret = mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA_CH34,
+					      1);
+		if (ret)
+			return ret;
 
 		/* reset dmic */
 		afe_priv->mtkaif_dmic_ch34 = 0;
@@ -446,15 +456,20 @@ static int mtk_adda_dl_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	int ret;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 0);
+		ret = mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 0);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		/* should delayed 1/fs(smallest is 8k) = 125us before afe off */
 		usleep_range(125, 135);
-		mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA, 0);
+		ret = mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA, 0);
+		if (ret)
+			return ret;
 		break;
 	default:
 		break;
@@ -469,17 +484,22 @@ static int mtk_adda_ch34_dl_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	int ret;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34,
-					0);
+		ret = mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34,
+					      0);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		/* should delayed 1/fs(smallest is 8k) = 125us before afe off */
 		usleep_range(125, 135);
-		mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA_CH34,
-					0);
+		ret = mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA_CH34,
+					      0);
+		if (ret)
+			return ret;
 		break;
 	default:
 		break;
-- 
2.43.0


