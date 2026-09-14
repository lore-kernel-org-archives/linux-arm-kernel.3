Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155BBC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PGiDmxTKSnaxUwBF7nwBu69cnzbPnmVOgMWHLivqaTs=; b=bMkgxB6ffhU898VN/tOOinwK28
	/1/n+f0MHNGZMc6ka+RozmZJJQyTwwDNR4OPQRw7nFuSHPbF3I0vIc+iSGVKj0QkjFw4VmGnfsK1o
	veudFeOSuXpJIqqWn7O4LfJ/BbwojJbLJaq1MqAt5sbgIt0jZ5mwXX2C55ZgO/E7WxF76/Dr8mvO9
	mxyfGmyUkKDOm324hKTIvghhOaaDmBIKJHu9tpQnoT7oEEH7o1+4N/+8qXZJBpKwYSlPBpCXZ0Wmf
	3/4xrF2mT1iaT1W96RX21puea3UeayPNRNMvBOjDMsaXi7S9nJsHPzh9X7BXNfc0H2webVd4DvFf2
	HjrRS7iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x618L-00000002Ylg-1dgZ;
	Mon, 14 Sep 2026 07:29:45 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x618H-00000002Yfa-37oi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 07:29:42 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cc4aa02a269so2282770a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 00:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370981; x=1789975781; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGiDmxTKSnaxUwBF7nwBu69cnzbPnmVOgMWHLivqaTs=;
        b=Bx9NvAEWaW9CtqHQ1CjGb7rEDpAKPAfnvNAjwipw3WTBO2xVoXcRsUhuJtxtrHC53k
         9KjcZiQ7ytvcIA7K02jfDZuZysZXicj1LbJ8PhBK5kLMOd9V+onC0r554FYv0nNXW/+E
         zqkVO3Q+2zvW1dCyv3RSE8K0OQOcm4OZmiePUisTy40wnB5oICqOSaEOTsY1h8AeITD0
         X5DPSg8hJ8AzcPEvv+/TVZVGRy347v75wQosSAq8utWv8HxzI6SiamBHal1wuPDpigqh
         2JmCdgEeXb4ZUhPEqoWky/xy3mP3dfuC9v8vi/0Bwxm9nJg7tjH6DnT/8R8tnQpnyvOT
         niKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370981; x=1789975781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PGiDmxTKSnaxUwBF7nwBu69cnzbPnmVOgMWHLivqaTs=;
        b=M7trdoW20/hrhAtoLGxpyxVWKGy1xB1bCghIP7P/mDCFQKCTpdWFtkyD6f8/yaJN9e
         KlTFAq6WZx5AJYnAsfPwb9Lao4ctlsZsPLgbq+nVR3E+N4wX+p53eJ9uNL6pK9vEUO6L
         Xaqt4i07Ux4Lv1Vwgd/m3/qxzsev0evhm1zn3LaQIFxY+6EdTXyYxJVqngz5wCxQvg3A
         Bj6VO0LD2Y/X3D8/EuIgk8FbfsRTBR6I5eTeVRXHW6QeaMPFattzwXKaPqSKg/FmY9v8
         Ub93uJbI85zAf99yl9R1A+sQNOvWFypWm+1N+LCWwgLHz5BTA+4PT0Poz/qCCR/yLk8D
         gl+w==
X-Forwarded-Encrypted: i=1; AKwUvBzN9/7ZKGWAwt7xQEA4/aYmdFl8BLFcF2YNTtMS42Ne6AFGy5E3cr8tZnXELlEvYOOMKx0GMAG38uMKYZzzdY6H@lists.infradead.org
X-Gm-Message-State: AFuF++nqMdT6Ylfnlpz0angopUv8mouG2mA/9wYJzfxiAkJdQumoHo6F
	yktXASySyG2hhLbMQh2g8p7CVzEC5zZQVBgFpaW7ub0ZIugDycmNsa/J
X-Gm-Gg: AYBFou1oCExMLr/5Lo9CS+Tq2lF5dIExCY+vdYQwVcGVTsYPsE5r6rzHD5QOx2AsRRz
	PEUA9mTQC2nPpHud1hXHk12JxVHJx0RTtS3IiOiGxt44ZgN9hjqqiYuyVijkco2YXf1WFiC/S+i
	EJ16J3rfoXBiUCWNkCB8Aw4kGwFx72/EOXRzXfEYa1pDS8SgF5Gh8paQSJVpUTrHcl6HyxqWHCq
	zJTzzW2h9r8OHSJ4Huk+o6c/MI2wg2HnUzfZZp6KfoUv8dR1z0gsgFZlA+xbbbwMyaJ55FbeYme
	C7D1wQncxB0aRTWiekD2k7b055ZNiCtBc3ZXpycJgTUC4y/oHi4JRHI3y5HgbCU2j7jvLRyZKuX
	e1yoJ5alFHLoISq/vhawqgYzTPZVPwqCQAo4WQMfB21s6tMPWP36CeByD446ozxf63b+xdiVxP2
	QJWH/GalHfryV3mZeqAu/xvWCvnTnzQVDsNHGCfWlRlEJw983ikie99JFTRZHsXJh4R7o9LQrTo
	3lyCSwfowbACuzCAfUfPRXvazBeyUgDQQmOwkQHU6NLq98Uz2cZYF2UrJLeMHFVxJDQlCWjpfzl
	RM8k6PxzOkd+biZm
X-Received: by 2002:a17:90b:164f:b0:39d:b1bd:b384 with SMTP id 98e67ed59e1d1-39dec0b6344mr3180432a91.17.1789370980816;
        Mon, 14 Sep 2026 00:29:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:40 -0700 (PDT)
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
Subject: [PATCH v2 10/13] ASoC: mediatek: mt8189: Propagate MCLK errors
Date: Mon, 14 Sep 2026 14:28:39 +0700
Message-ID: <20260914072842.24420-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_002941_794679_160DBE74 
X-CRM114-Status: GOOD (  12.15  )
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


