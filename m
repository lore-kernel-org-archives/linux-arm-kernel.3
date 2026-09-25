Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC43C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 04:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4GNAjod76l6NOc1BH/+OGpfP5lfIuJmdZBB1uffkhg=; b=vQuiBOFfC0lLN56zmzvbaTnVQQ
	XU8POi3sUV+8aw3LVqeM0fIr/64mgjZP0Q+5EafRpppMI0080VWY3UpTtaikdEdOXeolIKlY8MIc8
	nCWqaCY85FVkgZ653n3Lm7pg8JEWjMbOxaS9RmQo6F+xSulNe+WfMp70kDfiy3JHn5JrkU/dUIEIT
	v7RM/INK8GwYBbjRbJ8R1f2wHznCItJSlofiM6/SYnfQsQn8eUl4BtDNIh/OM1D0G6sbnwpFL4ETN
	+NAwE1TIK/KLwnfvdb1HQ2fo1YY+VCnxEarljlbgPGybBZYLJlq6SwyQ4HAVO4R4ltMEzIhhj/f0Q
	78jZfRpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xtR-0000000Cdlj-19In;
	Fri, 25 Sep 2026 04:50:41 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xtB-0000000CdXO-2cvq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 04:50:27 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso338591a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 21:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311825; x=1790916625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4GNAjod76l6NOc1BH/+OGpfP5lfIuJmdZBB1uffkhg=;
        b=h+K+x9c1wq6ZgJ97XboU0VYIRMOmLU+637/bK8eZ64mi+PA3va/rYWGaDO90nZ323C
         7BGUXI+XxO2r/mBN8Ob78ZnpvH6csSAnkmGf6fwnX7R+5DCuPnobyHKXFszCUlcXvHz6
         UqFVjK9YZYhYG6ONadl5GVdcU/f8PYikLeRrDGpueQKh/juBNQsba94sqthvA5AEtm7y
         6NDnjY6HgYjN+eblf8B/Mzivoa0YlWPMB4MH2I9jJQXTUOlyOjFoIuHhbBvoQWYmaAhA
         VekjHD1CANU4/psqr7jK88JeQ5IF1DUfNerRqfTb0px4EDH86uSc3+IYV4sxpNehDtku
         UR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311825; x=1790916625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w4GNAjod76l6NOc1BH/+OGpfP5lfIuJmdZBB1uffkhg=;
        b=ob4a4niuS8yoUBX1UqdTyKO1o7+BAkMemujV8aAKLzYgkoLlePmV6wVpadKR1p2Sqm
         b82fW0f2zD4nEuRItGHB8GKmt0Nk94ONid5TQIj+APIobOsuN+Ln5qWvj6tCkflHsI30
         8z03uMKwfsKpXn74rIP6GZuGZR5F9dkCRwpbvMRpEZjrjvW134q9sK8xp9nQMqfaLcU7
         9b3f+RbK/6AosGyR0ltSyOGWzaB1nDAnTtrlB2nY9b2TanCTHSRTuQA2MT4+XsLKcz+o
         QY+EEJ8p2VVHcif0YPgGtwSJ/PmnorJloTpdo4xVioCs6ztyAB6dMIyb7i+jhxU9W1ZS
         rieQ==
X-Forwarded-Encrypted: i=1; AKwUvBw44V3tPGYlmTkxrPL0eL6Wswha0ZhuolE4mMV3aHL0JlAX71Jv+G+2USnl6dm3aSv3GXpZCUR+xKbwqh+J1nF5@lists.infradead.org
X-Gm-Message-State: AFuF++mp6T1nsm1zqbVPQbqndv9m1xnw5ZV2xz8jY/l8kv16fuVk8gTV
	WqiqZ3UDKq6En6KYeZl2Om+b0pqnY6ebvCeTHJGWw99zztP82rZldKLt
X-Gm-Gg: AYBFou0eV3bYlW7IKlgT6tuBAzrkBFleZSY+e+Xy0VYqAderr1vjyI0kWP3Ou7xTu6M
	7CnhktfPOxBHlD3T3q+sA96v0acfdHc1Chif1YW5M0635xbUBFpsfIKgEIoW9zaf2u6G+Ey6Lkr
	e9uD4qp16OIq+H2jbABC7st+54coBsx3H+ARp9USBXzpW8VcgEjcFUubgVH5BoPj/9tqe82DTAF
	dfW78MtPBYtdfmp0UVGT+FTdJTB/r1WAkvficrYAxzyQbdo3dcHJQ6nNgBO5Jo6rWgcbInNu9lh
	XvZh7GPcXG0NkKNHV1QrVwF5Nyz2dnpsBbOyE/bhwcX9LS/Gm4DHwvVUZaa00bVLuXywOTCYE51
	vxjKPokZ3FSX+/4HMquYiozVfx0wAQiiT8XPoTa2sO7VsEeAcCbrcewn8+rZtS0TVgCVJVrJBdY
	nvktAuKuua/onAXVMKB/O1YXnwm24pD7sJOI000YtUfqS8P5AovnOc/sqzLmmP+XHb8KfwyfTBQ
	LhlHd3LoOB6yKoR6+1UJCH4IOpmHA6wkjCyrT0ZwPlnLM5oNJAmC2tTb/sCBOHZjdb0umdF5/x6
	lnvTLAR7zHW1DQ==
X-Received: by 2002:a17:90b:2c88:b0:39e:b15:7950 with SMTP id 98e67ed59e1d1-3a0bb5789eamr919112a91.23.1790311824883;
        Thu, 24 Sep 2026 21:50:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:24 -0700 (PDT)
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
Subject: [PATCH 07/14] ASoC: mediatek: mt8195: Fix runtime resume error handling
Date: Fri, 25 Sep 2026 11:49:01 +0700
Message-ID: <20260925044908.450775-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_215025_703797_D8ABFB9B 
X-CRM114-Status: GOOD (  13.48  )
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

Check and propagate errors when enabling the register access and main
clocks during runtime resume.

If regcache_sync() or main clock enable fails, restore regmap cache-only
mode and disable the register access clocks before returning the error.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 23 +++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 5e76625915a5..be150c0f5472 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -2958,18 +2958,31 @@ static int mt8195_afe_runtime_resume(struct device *dev)
 {
 	struct mtk_base_afe *afe = dev_get_drvdata(dev);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int ret;
 
-	mt8195_afe_enable_reg_rw_clk(afe);
+	ret = mt8195_afe_enable_reg_rw_clk(afe);
+	if (ret)
+		return ret;
 
 	if (!afe->regmap || afe_priv->pm_runtime_bypass_reg_ctl)
-		goto skip_regmap;
+		return 0;
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret)
+		goto err_restore_cache;
+
+	ret = mt8195_afe_enable_main_clock(afe);
+	if (ret)
+		goto err_restore_cache;
 
-	mt8195_afe_enable_main_clock(afe);
-skip_regmap:
 	return 0;
+
+err_restore_cache:
+	regcache_cache_only(afe->regmap, true);
+	mt8195_afe_disable_reg_rw_clk(afe);
+
+	return ret;
 }
 
 static int init_memif_priv_data(struct mtk_base_afe *afe)
-- 
2.43.0


