Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AA1C88E7D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 05:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9B0Lnz9uNh2cM8wk4dYkQqiHmEJincpWAn3l27K96A=; b=naDiLMiEDeZ1a82T7iRfRRas23
	IRjCmto4jg7RUngxtjYxwn8Cgsuanexxhc+VWAA0Y8ot8jjQxMe6v7F97T9dNTX+YTiWdky3VlTez
	guovtPnBMRr9JJXOAChJJ0uzSf5or6UdDX57KUb+frxjKTc5Xf5pHS3gzvxJYe2toIzokKwQXDd/I
	kE/+DGzquixXKHUL6UJinAKLeIGbMFNsOWGuEvqU2V/EqS7lldIlyNOcfvcHQP8xNb1I96die1lwA
	LTwJEjLYVErwYFFmtrPCVXSJRCeXrALNipI2WOmG9dm6MuUukIC2q/6GcSLSAfja2IxSuO0mqIvOO
	Ua7NfoGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hmP-00000008Lt9-3PMI;
	Wed, 16 Sep 2026 05:01:57 +0000
Received: from mail-oi2-x10.google.com ([2607:f8b0:4864:32::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlu-00000008LXE-43my
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 05:01:31 +0000
Received: by mail-oi2-x10.google.com with SMTP id 5614622812f47-4b37a3a9768so489677b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 22:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534886; x=1790139686; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D9B0Lnz9uNh2cM8wk4dYkQqiHmEJincpWAn3l27K96A=;
        b=DOqzzbIthytZlINoFg+DxPKoQOdHdimbaY5bDBlThNsN7BMx8psXBLyEvqxzTDzYiJ
         RR4CNypvZu/0eWQLUFIezTvHPLse22i6b8Q7M/nmhDtbqTpgLL/b+sgxAMmnH6AZ+g/J
         ntKZKlN2r1WxYfZRHERnrLs0nRuErUhnWvbbNFZdTGQe5C+ZrteYtpbj6sEYHQYzm6L6
         PhlV77+k9Z/ffWMj5eou+lQwhu1MN7qrrUowpFoBgFhgBvPm9YWMXj+eX14Jxs2HCNVQ
         ThTacDkFXmQsCaWrixtu769DwFTITSwuqP+dGA/+UKiGvEQVj0gHOvFcZKIk6lhcktzz
         UWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534886; x=1790139686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D9B0Lnz9uNh2cM8wk4dYkQqiHmEJincpWAn3l27K96A=;
        b=FcV12pn9YY+kRY61kcNqFW/5UXts7gxFFCJC2wlosjdXXuWPgEzjAy7H4mJLlFyGwv
         r/6NSHj7lF8UT2I0ndQnp6M2SeUEFuo3DDqmTTSnPRnD4Bjtzh9jywLswRQ4OBLuDNhq
         4zFpFjsCTZUMFUHx/jA8daYYb6Rk98GYeGHAWyjjevjoFFRezwIftdapdlky3bkyMiuv
         Vd/bq9mdClOYFkvWosS2KoNXGHKWFTPo3KF8KugjNrO1N/8UgfEIwxUWzmLmYIVbuSGw
         Zxh46wV7QWv+P3CWqzYYVWpFCL+69K2ABT0rV1DYGFeS4BYsarVeLN7XU54hxQC0xY9d
         xIjA==
X-Forwarded-Encrypted: i=1; AKwUvBybp8eNcQZH2dxfebWEP5IQr88Ucbh8gHgwiJk//wAbXzHB0788jUmg7qyUt0a5IA16tN5aGrDDDap9mBJBeZAO@lists.infradead.org
X-Gm-Message-State: AFuF++nakoekWNxxZeRzcljjazTPY3rvEmUikduZgbUvfYOyFM5otqGt
	Yup9W9jiVJNs7JYoE9Hwzm6APk9Jukb9S9WuWt7oXy1OtNIqCKv/XIKf
X-Gm-Gg: AYBFou0dXPa0jNsBDGSgIrtEXefx147GExLIYAwDbltwBnVpw5HcJsNrfy+q9ZBKgBH
	83DvzwG5Oct3PexOsPzsjnUn+yMdmGzMyIEmSwyFC5HOBpm5pI+NJx/NcaaxZpcEzr9udRkplXM
	ngaTjxbzZNV1LxG/t9vFhScWRxYSnkdG2D8hrKyXstzZo8Y/+7HudA5DWnOnVk9GrtRHCJMmAb+
	X0il8BL6+GFy1QBsoOBH/em7RAPWTV6ioQ25QsxkpLz1+L2HEOYon9Z1oJU2zOHTLmF8RLmXD4l
	aMIe6pLUfnV1fjYxwwk3eEe+aHJYlEbtECXO2UZQBqHv4LXlTJgaQXiD564SmxQM6S1esOcmEKe
	Ug2hUqvLNJ4FfGj4hKRx5fFjdWem6JoQdaDlQA7/mMPbQ4Uv4SH71fxsks+EGopWPwgYyylfStK
	OQhoVnm5FSo8vwGepXKaqZ/pofZr9gdLZCu0Can7QpXV+UbIkcgLiS3iTmFSsj+E+vZ/BGrNEu/
	LY2OGiGC2n30Vs6igMAQ0wQiE2aZX0CEonCxeDpyrNo0haTMLEmUVuZxSZWh6aWSx7GyKQJPk8E
	mjIbu2QfHEEqqfU=
X-Received: by 2002:a05:6808:23ca:b0:4c3:e608:ade7 with SMTP id 5614622812f47-4ca49dd720fmr1842524b6e.11.1789534885682;
        Tue, 15 Sep 2026 22:01:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:01:25 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 09/12] ASoC: mediatek: mt8189: Propagate MCLK errors
Date: Wed, 16 Sep 2026 12:00:16 +0700
Message-ID: <20260916050020.14575-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_220127_024925_E9577B8B 
X-CRM114-Status: GOOD (  13.17  )
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

mtk_mclk_en_event() currently ignores errors returned by the MCK
enable and disable functions.

Propagate these errors.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add Angelo's Reviewed-by tag.
 - Do not pre-initialize ret; set ret = 0 in the default case.

 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index 4826ee250d70..8cd5ddf62d46 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -519,6 +519,7 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
+	int ret;
 
 	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
 		__func__, w->name, event);
@@ -529,17 +530,18 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8189_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
+		ret = mt8189_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		i2s_priv->mclk_rate = 0;
-		mt8189_mck_disable(afe, i2s_priv->mclk_id);
+		ret = mt8189_mck_disable(afe, i2s_priv->mclk_id);
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_soc_dapm_widget mtk_dai_i2s_widgets[] = {
-- 
2.43.0


