Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D999ECA5FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 11:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=; b=vzb2sU9b6XlPqQTFRGi4L2kRWk
	GB4YziVdC1Ui3LhfS/vCJFI/EVBeVQuHeHcSpGjiD08jBHGl9YLne0ILpoOkIA89lj9YffeavZWh9
	h5OrAuc590q4YvhzVQ72HG3FJ9+L5oo5ggRNH8GphCC3TxgSbccyq56PeWgRNMLsuwqcxEw0576CV
	ZV3AaXiThFJjzjGJ5gMbsyC4KIQuZgc+4NSOJHALOFDAJ9N9Douaq2eUM1xcK9YGJ0DI1Lo41QiXj
	pJhUY33hF6SevlRjr7ZNKisolacFabvzYVJnt2ARtaYso6/T6dHCqMSMOogxuauJe7Wcq+SN4HYvn
	l0Xp3JHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgUa-0000000GHwO-0OoW;
	Mon, 05 Oct 2026 11:04:24 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgUU-0000000GHpR-0wen
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 11:04:23 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-88b5f43cb8aso422663b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 04:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198257; x=1791803057; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=;
        b=WRt8Uuig5PZYuwnqWul8KN7lDOnzZxGkItQ7OedCIYBZcEB/ZwFIT3H7urY9j4lArs
         HO6fyAW+Vz850L6QUGFOgmuUxALuN6Q6918pXg8RoBOWw+SyXYfLEVziexCe2VTM47iY
         cVcynuigI0viQhAzJWj6RzQv2Xe6+d8AUxL7FQXkGc8yVPnZsB9gufW7oDNdqBnyO2M2
         j+wRp3/JaaPBH3C8QjgnSfLG5qgJFsR1rx+FMWk+o/nLd46rE1ja4JgrO+8GNwA90RYz
         KGrNt86IlOSbiA4hUuS1iOGwpH0xpHVuijzivoEkP6Vbhz1pCdfJd7Iwy6el7xA4nN5h
         EgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198257; x=1791803057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=;
        b=VUDmUcIdaac74U0sPSUo1lqCkM7CWGkkI39zkDI646mPFAqXSojVCZUW0O1vm2c5JD
         e2sb5C9OzNxS67BR1e0hC+Prznu6nUEyVST3ZVfLOCi4fUUrThvTYaVTEmL0KwvOLzzN
         tcXCq1QKFiY1YgCW9k1CbLBU0OnFaKR9ze7DLwlOqK1ywXM+7FZf9qo01sJddn+fr88v
         EE1N7yyTD27A0bGVcdxXcsglld+w2/xAJBY21DgYXdmOHDu0UFy3C7U/ItScGqYdBykW
         dhHH6pyezumJRMB2bf/2pR68Rb19aaIS6bPZaXy103Jn6uZQ+o4z9cBk3mwR+U1pf/hd
         VPJw==
X-Forwarded-Encrypted: i=1; AKwUvBw6a1BJoqHpdPI9vzEOxay5W0szU38h8+U1dlGIUJM84tfGmeUpT/RLpUq1YLKEljEzuagBO+GYh2saD/qG/WB5@lists.infradead.org
X-Gm-Message-State: AFuF++kYZZQPdJpuecHn92xFiuKX2S0Q88FTI8d3tIUrw8+Gw+Yg3Mwc
	a01vafK+QuoIf0ZHUadspGMNeCfVuTy9fGSlUpyojvbPv/OL+E9FmDAT
X-Gm-Gg: AYBFou3kGuk6AM3JuE2+XOzxvC2Qjuk5pSNXS4YBTTVoT3rSyB190tjY6342nSmcrTI
	Xom/F17E3Ykxo5L6fKAc83Zu8Ysvuyuae5um1YoLvBrcw8eCvqFiJLJCVERnpmYjuP3ZDcwXUCR
	AYD18pWBdm93HvpJLz8asqfAVqjBihDI6fdgzAp83PPpvAlPqDIxGusYfO2AX5cTX+v6bX2a6Es
	+NMVqeqKkXBzRpnLhoGV1Ez/ge7LiY1hz9cVPfd0IA1BGaNKIxZNSV6lfitj469oz0O7NgDOkrb
	c15AVjAm8uHQcN1zIYo2N27bNEE1VwL3uqo08gY0FDb0rkltOoo53e7pK7x16JMfGd63RRnFTT4
	6utFgRdhSe/elXARJnZ212d8PHdh34fuTYlJp/nhLCk5/mp2y3OTHJZ/q8XOvBMe46IeB1WQYCS
	0rN16TxKzSCJSBtSkdODlLkXbHEdbQ2s8NvdGmHi9/IOz54N1BDdqDErYDC5A7wxfzx2zIAuC7q
	oSGWCPuBO+kljzbdgkKN03et4lrQIDe8w2jpcFiGSmZOANt1oC75wTWYmxllOtbUCRiw436+dWZ
	oP8GsbjAdlFsUA==
X-Received: by 2002:a05:6a21:6f16:b0:3dd:a195:fa1c with SMTP id adf61e73a8af0-3e0d6d2f55cmr6485653637.65.1791198257419;
        Mon, 05 Oct 2026 04:04:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:04:17 -0700 (PDT)
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
Subject: [PATCH v2 13/14] ASoC: mediatek: mt8195: Fix ETDM probe error handling
Date: Mon,  5 Oct 2026 18:02:56 +0700
Message-ID: <20261005110257.50145-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040420_519474_6119C34F 
X-CRM114-Status: GOOD (  12.82  )
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

Use pm_runtime_resume_and_get() to properly handle runtime PM errors
during ETDM probe.

Propagate errors from MCLK configuration and enabling instead of
ignoring them.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 27 ++++++++++++++-------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 11317cdd14ab..8fa830a57502 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2503,6 +2503,7 @@ static int mtk_dai_etdm_probe(struct snd_soc_dai *dai)
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_dai_etdm_priv *etdm_data;
+	int ret;
 
 	dev_dbg(dai->dev, "%s id %d\n", __func__, dai->id);
 
@@ -2510,15 +2511,23 @@ static int mtk_dai_etdm_probe(struct snd_soc_dai *dai)
 		return -EINVAL;
 
 	etdm_data = afe_priv->dai_priv[dai->id];
-	if (etdm_data->mclk_freq) {
-		dev_dbg(afe->dev, "MCLK always on, rate %d\n",
-			etdm_data->mclk_freq);
-		pm_runtime_get_sync(afe->dev);
-		mtk_dai_etdm_mclk_configure(afe, dai->id);
-		mtk_dai_etdm_enable_mclk(afe, dai->id);
-		pm_runtime_put_sync(afe->dev);
-	}
-	return 0;
+	if (!etdm_data->mclk_freq)
+		return 0;
+
+	dev_dbg(afe->dev, "MCLK always on, rate %d\n",
+		etdm_data->mclk_freq);
+	ret = pm_runtime_resume_and_get(afe->dev);
+	if (ret)
+		return ret;
+	ret = mtk_dai_etdm_mclk_configure(afe, dai->id);
+	if (ret)
+		goto err_put_pm;
+	ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
+
+err_put_pm:
+	pm_runtime_put_sync(afe->dev);
+
+	return ret;
 }
 
 static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops = {
-- 
2.43.0


