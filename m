Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40449C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 05:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=; b=P70CLE8GDBLO9lwSqULAlmx1nw
	KD2oylCPOe/U7wBKbmH1/E+QGAicw1zMo6n/LS1C5FxQeTP0oYfgTX9gY0vFC4kjDYs5t3en+JLMg
	s8CDEuKyVtlwe1xUOGLr0oNTnX9WNqOw9V2NwgrCvywPD+BQ3Xmk/wFAa5NVgB4JJSwX6hMq2WaPb
	TDfDTbTYgl6ANRInNNZ6gqaKHWksdisrbo0TKnXigW0UhbWkSl/nj2twzd77Lz5NGkpH2x7dH1ibO
	IINrD3kMNLIw2C2G1ljrxDFbXAYcPlu9IpLD0B0jCFQH8L1idkmLZcTGpJa+8sZfLF7dDqfBcVQtd
	/BloUjEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hmG-00000008Lnf-2B0T;
	Wed, 16 Sep 2026 05:01:48 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlp-00000008LSI-3dr8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 05:01:25 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cc147d86bebso2375694a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 22:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534881; x=1790139681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=;
        b=TT/lMMvlAkoZvplYKGeptWvRXw1QjX7tDRI9cd1Ks6KWSSJGlDsfnaiJbozPGjOK5s
         Dd1CqsD8mhtoeD78C43Nws4i4hkCE5AHKcgTSHhLI0kfh8r7DP3TI76X0L0z3JC4F/kV
         iYbQ0g1aKyJzTzmO8nGYbbRFyMRh2yMdL8bjhwCVFFf8tnS3CVcZ6eFjBg6Ii8sKUvgI
         xa5jIO5cXGCh+NuVx/y4pGdIQvYL21kdKAdGuV6JPT0h9rL0oIsXLoVu+oorW0Di6Ow1
         sK5n6HJa090oV1yr5G0fbqte6JXbqDmHR+JI+hZreULpQEy2qbGxCmce0DRC8bC0Q24e
         zbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534881; x=1790139681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=;
        b=JBbrAeFZC3QclShZYFlXgvuHGD6l4nPNe8lxUca2WJpsrZCAufSmLOQNo7sHnaiAcb
         D+RPPpxejZZ86lmu4lt3B3dH2q34ApXtA82HNU3Hb7gdKuAl67WqtXUaCVt3lw7puG9J
         96hBKxgXd8lRct7T9qBo0WuQUOpTpjkiV5I9bNHeTqadTFbOtkbK4YPxCfAN0IQuQvYQ
         JLw16Zqy/JI2DlgI6EbbrRzE6go78HKcRb8uFB0+nX4toYT/w081U+Yros9c2Lq5o2xH
         0w1KspRyPsRGpfePHHYFA4IhQfEjKklge2saUapJcSzirN6TA4yIzbX6AMBjXjbEiBoE
         6QkA==
X-Forwarded-Encrypted: i=1; AKwUvBxdv+I4myxXlU879ctHLa3DbMnxCajHmodWesJuYTrCEGqXq7fIpGxGrH9nvhcjsEGOV3PJfn4+oCsKmBYRWK+V@lists.infradead.org
X-Gm-Message-State: AFuF++lwK8hMqHGDX8iZ/HvAhHysaJVFGAHT6R9HecQn/a1+eTjQaDL9
	FAPI4PFqDrpo3IDoDy8hI1WI5w9AhdBD7fhXokYC538XZf6ELpjtSPYk
X-Gm-Gg: AYBFou0C2ThdiijDoIiTFHRn9tH10QbJC05wvcAydtMRltLzoUwHqOZCij/vMHUWKLU
	/H7rL9cq/bhtFeHyPfoE3MTt22GnlgP7ZRgY389ThuTwzGTTjaTPqBszhOocdgyX1k2s/zHQxp3
	AjMuRxL3oOFZo0EMFC3+wJL2g/c1mO57X0fNMFZby3sd0EKqcpbcSZqjjgu3ndr1MDQ+ZhJ1v6c
	PJF9EkCDzf1BL/bPMgWxXLfmzFe4N01szqjEepBwkB2goEkLCNk/zpLF/uZlwSQ5LjdjxpzQW6a
	VN7+0pkqvQJ2RUwM90ufrjaEkh1+tyW3ALBW6FFhqZDTqbjdfjVFTafmz7JXeRFkn9rkdCqPKIJ
	GuNPkKHNOx5pvfTwILvHudxokj8iW8UoydB4OPioEAXtxgH2T1p19ZZ6Y6slT+vjYcmbLrA4LF6
	WUw4SoZBDIlCAZOqHbQtFU59FBj1HR9Oxzn1ValsDMjtXDvqP3i6wVXyS4brZNhZ0bNo5cIqtuz
	EjWW2oW10DJnb+901O7gKmXcSGtj6GU1eOnXxGfv9F+Qsjp5f1ZlKjxc6Ktk7Sg381xfh0ylMB/
	pXnt4ccoLZ94FgA=
X-Received: by 2002:a05:6a20:e615:b0:3da:f1b3:50fa with SMTP id adf61e73a8af0-3db4fb852a7mr9838208637.8.1789534880774;
        Tue, 15 Sep 2026 22:01:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:01:20 -0700 (PDT)
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
Subject: [PATCH v3 08/12] ASoC: mediatek: mt8189: Propagate APLL errors
Date: Wed, 16 Sep 2026 12:00:15 +0700
Message-ID: <20260916050020.14575-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_220123_458890_29FDDB6D 
X-CRM114-Status: GOOD (  12.46  )
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

mtk_apll_event() currently ignores errors returned by the APLL
enable functions.

Propagate these errors.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index 94c49a662e2d..4826ee250d70 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -485,6 +485,7 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	int ret;
 
 	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
 		__func__, w->name, event);
@@ -492,9 +493,11 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		if (strcmp(w->name, APLL1_W_NAME) == 0)
-			mt8189_apll1_enable(afe);
+			ret = mt8189_apll1_enable(afe);
 		else
-			mt8189_apll2_enable(afe);
+			ret = mt8189_apll2_enable(afe);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		if (strcmp(w->name, APLL1_W_NAME) == 0)
-- 
2.43.0


