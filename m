Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB71C982E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yu2yiSMdwWefg76VPpSvIXsYKQxHtzBfgnHJNkHdg8c=; b=TQzs1gkgf45Pb1eZzR+K7yY7aJ
	bKC/WSSmZFbV2c3cwjk1rbuEDF2o9u8VlqqYl4gCrZSKm6pkoLUS6FLQJxibcrPrhByd3pslrk8ut
	NdftYyrftbCOo0BnkMBN1TVdwQjJJJ5d5fiJPmzUuwH4bl0RGtXjRL7ib+O5G4pWlYNbJ413PatXe
	AfMLYWjZAmma4Xv8vvcRwjebLtl09DzjbF/lBvbms6lCoKHN20BhYgYNeXRJsyy+9av3T8KwfMzJE
	38HuYkKqnwY8p/RiCs1zA3ktv/jxeHJzomoDaV1v7C1L3F4D9WJR6uTQCEkHmBJQi5c4SFrRt6QPX
	0Q/hIR9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ypo-0000000EbR5-08iq;
	Fri, 18 Sep 2026 13:41:00 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YpZ-0000000EbCM-2rSh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:40:47 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so732836a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 06:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738845; x=1790343645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yu2yiSMdwWefg76VPpSvIXsYKQxHtzBfgnHJNkHdg8c=;
        b=ijlLtBzsZQOk9keyphtAbaT3tVGSCRnUu5vtC4Z9DHIK/I4Hy6dZ4xexQ051Mu8VXj
         VBuIChijV1xqZZyuKyUjeS8kcixOw/AbSrQ6UdP4Em1UK292P3K4Y22pif4k9Em3gMKp
         ZD07DCJwhOOjontpUS6CAsA192CgvB8UYIIupW7cQWGVirCczHY3nRZ1sIGoZ39V6ZRR
         16cSg46kqkFbLeEWp9IwjLJBFWUBrvSFAyBqHIkvcm21bsrS9JFh5AqTmWM+klX3fYG6
         9KflDxOQPjJE1ZJcFNrlTSD0ZgE4lTSoGSNmQaOFMNxFWDrtnXZ3CHdzgR/fXmcbIXtP
         jPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738845; x=1790343645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yu2yiSMdwWefg76VPpSvIXsYKQxHtzBfgnHJNkHdg8c=;
        b=2bNULTxHejHW/mz5tnWJ++rut82k5Du0oMi8dybyLlMzhecO0odM29fq9dHwjf7wg9
         uKdGtNVd2zwk6Q4SR1IARC7qsgPgSdh3/CCpNmrX0utQTtet8RBqXVlpORrwxixRZ7OB
         Tr6IvkeJ1RVR0PzIFysZ81I81Gk5AKodIvcDfSbyuv6lDTF/ySCdgY179irBOR9LDpHh
         AZcx8ZD6hDV3nBidEg54EeAo3i3XWq63yZU8sgok5ry96vFg/5a158+7ywyr2d5vyblD
         Wc9MN2gDAodQtmTHI7P6dj2wQe0koVkT630jqXMC2vV5OhzBBU6vzKL+JpU1HuZktgnZ
         k3bw==
X-Forwarded-Encrypted: i=1; AKwUvBwhlSkCNJ1EhKSQo+urmNguYA3uBzW9ehsJAr+fRQpfs5eBVRmuUSJ7UphnGN+Vp1xa1F8js0B4HtVaLAi5YQXX@lists.infradead.org
X-Gm-Message-State: AFuF++lQmtXOvB9mZFz5OqEiLPLX7hhaZxWYe39RqYNgGg5RwYpluTxc
	01wsHRevAuJFJdu59owmPWw0o8ghWkZfIxwIWUJqNXKmH7UMUSgvN/xz
X-Gm-Gg: AYBFou1mHZ8eOYnh5DoxBXQdKvkkbtjOVrXoKTH1YSJinHu0raKUvnATEc+hIrG+LE1
	+tDpEXqlZVEJ5N9/i3DKLJPWKaSlnVtRyyvXidxoQSVMm1CEGuXepcf2GAOH3Ugg0VX9LdJCUh6
	VFeqq8VNOXKzZJh3c7fYxwt3tIxKrskW/RVDsA461qbRRQ5YUJ3rBMcBNRoToKNCHUxXINdOaLq
	Pqo/Wns44f7JFnx9RjUvLt94QgWX9xS2xA5Fxll7ccggqteNtpkOu6Py3aZk96pfFYNlSeelx8s
	0d/BvN+69W6gU4cT375mL77CbHa43demS1rSEty8YATjVygGJRtTh/X8DUJ3yFMEkhi1O7AeYNB
	5ctBhNQDghiLNl6h5y0g+PqX0F6oSO+VdpXIG2hZ3nv0M99tes1Sa6z8dx9OvPcxvgTP202K+c+
	UwfHRa4R96IWYXiEvQma11O6M5gpn/S9WmRADqyyWnfffVfexpIUtJgaOvDQTEKLurvCtJY9zyW
	78JDu0VDi2EoQmtAPT3DVmB1qvVvdhSKaVCpJvwQzp2689gm/zvfsSFqV2DhOO4Igg/jrPej4Zr
	sqsVCJ8oKhtg6KdUlssFe+1R
X-Received: by 2002:a17:90b:5588:b0:39d:f4a8:75ef with SMTP id 98e67ed59e1d1-39e54cbb4a5mr6454551a91.1.1789738844971;
        Fri, 18 Sep 2026 06:40:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:44 -0700 (PDT)
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
Subject: [PATCH 13/15] ASoC: mediatek: mt8192: Propagate errors in TDM DAI DAPM event handlers
Date: Fri, 18 Sep 2026 20:39:09 +0700
Message-ID: <20260918133912.133799-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_064045_755884_BA7C6C78 
X-CRM114-Status: GOOD (  13.16  )
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

Currently, DAPM event handlers in mt8192-dai-tdm.c ignore return values
from mt8192_afe_gpio_request() and mt8192_mck_enable().
If GPIO configuration or master clock setup fails during DAPM events,
the error is silently ignored.

Fix this by checking and propagating error codes properly in all
TDM DAI DAPM event handlers.

Fixes: 52fcd65414ab ("ASoC: mediatek: mt8192: support tdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
index 49440db370af..36fa0f32ed1c 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
@@ -250,6 +250,7 @@ static int mtk_tdm_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret;
 
 	if (!tdm_priv) {
 		dev_warn(afe->dev, "%s(), tdm_priv == NULL", __func__);
@@ -261,16 +262,17 @@ static int mtk_tdm_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_afe_gpio_request(afe->dev, true, tdm_priv->id, 0);
+		ret = mt8192_afe_gpio_request(afe->dev, true, tdm_priv->id, 0);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		mt8192_afe_gpio_request(afe->dev, false, tdm_priv->id, 0);
+		ret = mt8192_afe_gpio_request(afe->dev, false, tdm_priv->id, 0);
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mtk_tdm_bck_en_event(struct snd_soc_dapm_widget *w,
@@ -282,6 +284,7 @@ static int mtk_tdm_bck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret;
 
 	if (!tdm_priv) {
 		dev_warn(afe->dev, "%s(), tdm_priv == NULL", __func__);
@@ -293,7 +296,9 @@ static int mtk_tdm_bck_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_rate);
+		ret = mt8192_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_rate);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		mt8192_mck_disable(afe, tdm_priv->bck_id);
@@ -314,6 +319,7 @@ static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret;
 
 	if (!tdm_priv) {
 		dev_warn(afe->dev, "%s(), tdm_priv == NULL", __func__);
@@ -325,7 +331,9 @@ static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_rate);
+		ret = mt8192_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_rate);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		tdm_priv->mclk_rate = 0;
-- 
2.43.0


