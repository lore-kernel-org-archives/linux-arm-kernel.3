Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24CEC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PGiDmxTKSnaxUwBF7nwBu69cnzbPnmVOgMWHLivqaTs=; b=BiqfS4m71/18wonpx2m15kAAht
	hBTt7UDZ0OkDRu9FDrXvw220pAOHG+8Qe6gfiawwyxAfC3tFuaUeeCGy7yhg9V7FN27EI++dCXzeO
	Z/WAYIlpYOtz1Hv+WUd/ZibWI0VOQZOS02NxdFOf6Y0k9a2upL563yw0V54AmxHozn2S/omqI1Gzt
	HzBoRdmAw9ZkhL8xFcYQXzYCu/1E12O/YxVGdW96I6SVraJWNKnJQjwknhPcusjjiqsmhxzkoMIgZ
	JxRlZctl3B6yclwQNKfLnpS4iCzl9Qb1Kl1AvTvGhAwQVeP8liQuTVGPkk3iA/Mlq3PmFw+4j6exz
	NNrT1/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMf-0000000EOzL-3xgd;
	Thu, 10 Sep 2026 12:58:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMc-0000000EOuR-3UnV
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 12:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PGiDmxTKSnaxUwBF7nwBu69cnzbPnmVOgMWHLivqaTs=; b=BuaZAqijMqtJ4csOgHBfaTYVw0
	eCGcZCI8Z7c+m053wjaiDG8sZhqFmoUxbvojnxFR7QM3s7CUPE8WyJvvBgX5yBdCvoAWQ55JlN7nS
	Mr9GGRbfbs8dSni7cji2kNnzsa4yIWi2Tx0WjAXcz4BUvEGsIa7s3Uc3oNpmRX/9reg5VDrz5LE88
	zzejk1bw4bafDZljCCVH8cU5hbTk0KW1nvsAVfVpZf/JGYY292RqxSIEsn8al02bZgrGDfLJwCwPM
	FA2W5DgM48tz48u7k7X9CJTZvr7/EuBcLmwosiG6VS4BTJ1j0tpBU3rxLPowtqDthZE52D9m2yORI
	8l/565IQ==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4eMa-00000002V4Y-0VoW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:58:49 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccdaea75so986605a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 05:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045126; x=1789649926; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGiDmxTKSnaxUwBF7nwBu69cnzbPnmVOgMWHLivqaTs=;
        b=HXMYsim6zYKp16QqVesaWmMlzaeFwjCrrEyKv1/lPPed82544LAyMUvuWrT3ZFlYoX
         rpYU6MkHSeQLMcXbD8WIPYW54qSZC0fewjKRAHqtX0cvpYOPnGMOvm17oKLEMBst+fZ3
         UvgmGR31q4Wfk04tHmYRv9G9TzSs5Elv3m81YdDzCgczQmnjONI3f8foo2A0W63K7+eU
         jReAV/kifrjAZteDIIKc0aXKjq35NLDXhOjAAxGepTHN1HO9PfO0aLHhzYITB8E4cMF5
         gAPm+uog6zxeDVmd2AXvqoOZBzDFgY3XHeeqXk7nnwagvkxgRJZL4A7wavoZ0EhuzY71
         v2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045126; x=1789649926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PGiDmxTKSnaxUwBF7nwBu69cnzbPnmVOgMWHLivqaTs=;
        b=mT/YI4UyEbU1IRJHmU7zoE10PX8ODHtuWmbdXbKyK3QuEEP5PteGH6SwZhkyxLdXYI
         MSeRBGZhdgG+6vnK1ADExjA2+6o46K608qRlLRpULWtV5ASSAtpxCVLAfk+XOArJ6Ozr
         C8I6Lt/9zDaM3Gd7Zy819tdIY3xWabWezYd85LM8VFFlwQlGyTAvpmouWFHLHVpObUqS
         PWGE+kEeDc8O1ApmjGkzPsqMvRd+7WDDQZ/vXR0YHbmw2NI5A3tA/GvHXxyRWl+Fg+ci
         ymmdDGj5jz6Ui5oNMN0zsCybhuLSYzygP9RTXnJ9+tctHp0K40yCfiOxQ9G7YhniSR/s
         6p1w==
X-Forwarded-Encrypted: i=1; AKwUvBzd3ojuuP5b5B+FVE7P2YiJcJcZXRkcuTToH5CKsAcSGw0spS6vUrPWvh8zr76XIhUQ5V5nF1al4qAMgwSELLiq@lists.infradead.org
X-Gm-Message-State: AFuF++nxkoaCxryqrEwltpYac9UBuQMKjI8fXdEYDSyunFYdQLHFyHlS
	R9saSIxZ2+04+VMiEdG1hjRh+qE16phnSptwvcs2qfK54sZeOIp7JjvP
X-Gm-Gg: AYBFou2KmE7Bjs7YhBrPgjngcCwAfrpncuASeLyaTDCU7Y/OLNk5nAGBOpEbZIz/62h
	Sn99qogy9f+NRXSi8aFvXArb/riruQujFWdJT0rrPn+MmwZO7snWdGqLgg59ZwPCeZ4kxZJ5tau
	mPs9NY4ec/MuySBOOnIaa8m95BCxQ9kz8/cNMsuYkg7Vp6EvsnEa0e+8KIfU++4R9fZ2xi/Ifxc
	EkYruYK41/P02GBHn5G1A7zdbM4O0ydSB/k/KNHD2WsoCsWL0VzqK31HQ8i090WhGZYlpVqkdbP
	32agZ5QKtJwuo3X66GV8YCwguKSo/2woUtKSadHkQuCrAoebtYBRMBY9sh6JchtLCIE/BUANeqp
	H7HVTD7prYABpMjvrNTLR7ASoeHweeOBJrVLKUProYa/ITEIB1CHcOvrpN0V6yrTCgJYtpLaBAy
	X4Psd1DdF2JDYj1ffIKdFDAj010i8L6r8C/ksNy//8k/l/PpVT0RHfiGxOlWqM0qtPUklqCdYxe
	fr6To4o9Dk9RZ3Om+Ku/A8ZbEzIiiy6ZFPtjkJGwm6ZP6/GRH5tVOPo+gYUaq8hNMW35lotM5yg
	lN4yYy3AYgmrMkdbKcP3JTZQrA==
X-Received: by 2002:a17:90b:5485:b0:395:8124:ac53 with SMTP id 98e67ed59e1d1-39d77a1d83bmr3896223a91.6.1789045126242;
        Thu, 10 Sep 2026 05:58:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:45 -0700 (PDT)
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
Subject: [PATCH 10/13] ASoC: mediatek: mt8189: Propagate MCLK errors
Date: Thu, 10 Sep 2026 19:57:39 +0700
Message-ID: <20260910125742.150902-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_135848_305736_2E097CBE 
X-CRM114-Status: GOOD (  12.06  )
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
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index 4826ee250d70..f20dbb410223 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -519,6 +519,7 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
+	int ret = 0;
 
 	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
 		__func__, w->name, event);
@@ -529,17 +530,17 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 
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
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_soc_dapm_widget mtk_dai_i2s_widgets[] = {
-- 
2.43.0


