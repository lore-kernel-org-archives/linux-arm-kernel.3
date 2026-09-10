Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F306CC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 11:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OAl4R63i7nP2kPOGdri8Gsnk69LVzRCygwjUC9I3Ijw=; b=GWz9+hfAm5zsK5m33aQU2khyTi
	2DayI9QSC8SEPAhMDMhQ1wd2UKigKdo8rleCzTJX+hgjVcnPcVfNXsZ3IgG1fl8/rTgAVYw1eYD76
	WeUrkxQXAzOVPWXkia1DleHFqlVfb7p1HTLqEwUsr5rf/45v4uuZmGosK5xZhH/6CjPi53LaloUvq
	mpdVu8PiRUUyQXAaDchKZ1vAX8L7hvBBy2wGFajgmEcku0657KUQcYFyHRZxdySqAdD+H5yvBJRrt
	kG6mTseMuNnjlo6aTdtNkBQOzxr91NTzVJ1BStENlGf8ke64xkUFvG6Q5/9mWoExgTnL3IsOzjOXc
	Xin29heA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dCD-0000000EFLG-0Qep;
	Thu, 10 Sep 2026 11:44:01 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dCA-0000000EFK6-0o4k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 11:43:59 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2dd020a2e44so15732005ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 04:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789040637; x=1789645437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OAl4R63i7nP2kPOGdri8Gsnk69LVzRCygwjUC9I3Ijw=;
        b=nGKKuek9+mgnsGMVWmEm+W4cgMAXajhE9An6NWnqdkDE721WMtTQlNt5qeXfU6bvpN
         6k7ftFW9W078T/HvbNXuBKQZoQxpP8s78g87d3ftkpxeL8EkMNC6mX4eHj51nUKS9LPG
         v+qJuLzUiQx6MUF5P5A7zd8YzbtV/t8ihYCYgRF1fX/ZbU+FmH64CRfpVSZmaxrm6Zol
         K80DY2v1n7DwwwITIyF0TRPqqgpknvw+4nV/FvKDsqBBPa7SAOuhZkIRuRz0Czh79CxI
         t8qW+E6m0LRQ1I+cp2P5vikdHeOGt8UGtYUB2Fn6ZQiIf7Hab/lvrQKCNJk1QjwmsAmt
         N6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789040637; x=1789645437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OAl4R63i7nP2kPOGdri8Gsnk69LVzRCygwjUC9I3Ijw=;
        b=o7TDWxfI1I2bVac+wuJZOy3yVUCgrBCRadoq8I3hc6b/Ig7+zxjHnCwZq0y3nuBLxt
         hTrk1UHY9Eedsfc4xvot//rh0hh87/fMhc1P4wqImrPwjvGb2z4fWxiC0gxTNZ8YkWNt
         PMk08Qk4tSfWnkZ9dCRF+/ZZkzD5aTSXlOI2kPxP+Jql2gMGeXSl0K7EOiurCKOrBZdM
         rxXYBK9/g3818UVCJkrbHiVbVmOtK2coI8OFsYCVIVk/cgulb5SDNjSoBqUf/1WD+nrZ
         5lv0hq9zDPLdKNsoeViVBmsSQ7O9wOr5jyT2XxNvtsAtnUOW3Izc2Xvao3G8bWbY3ab9
         J7NA==
X-Forwarded-Encrypted: i=1; AKwUvBzNgWrBaMwJYOh/RIxPXCO/OoLKoScUr5CORvsHQYYHToHEK3ot0oemWREJ5AvGYj1Fi700GgF05CUdf8dU7d91@lists.infradead.org
X-Gm-Message-State: AFuF++nJEFPmZyjHmSbI73iXploK83ZEITAVXtRx2IAHjoOurLb0OKBy
	YppTlfmX0wG02Okv7wjxHRjKN+AG03mfEVIvSLzzk7GtVsOy4hCVo1fN
X-Gm-Gg: AYBFou3THm/GOhcFXVTil27vZ4yTExDm23/1zaLsynQ4hp2DralvLrDhje3Ip5Bjwjg
	qyIKUvsMbkbg7BktyYyPf7nS57yyohrivWEyzyjv0Dzb//LyFYz5RlDbsKF87MLl9Fqn7rCFHre
	2gv/AtJUC3AELz0TpS9N1vj+U28RnJFwVCEyd9NVBy9t1IZS+OcWjfm6FTu6vZ1SiKDYJnHY2Ib
	wLQRxMa52uxsCNDg1tygdnb+k6ujfVmHW8lfpr9EOCqNgTc4sdF92plkK/ogbWM/EueC5qeZDPh
	7WVzcPE+wyH4z3mjI+0lwYeBb/18FmWfLm7adBPi8Ym2E057FGJsVjQaJvT4zhD6X+j2/qD7Tiz
	1eOjCeN+3p5Vq3UqlwEWYRA9Zla1BNIieGKTXepWYNFFoY4T3RWelETFvhJhqD7RHIKqM60FTRa
	ylghE1NopFWi0oQkk3bnm1QiQPeNK1TwTI21hD+4KxHCK67e+6E5IEick/MYzgTZc6Zb6Xnn44Y
	Okg0y0/OcFbdtXWzkNe5YuPdc0D85P5sp52ZquuYsBq8b8YqOhAEBKZAl2nRo8qUqD86t8v/M4I
	EossGrsaevAuURA=
X-Received: by 2002:a17:903:22c8:b0:2d7:5ebe:a588 with SMTP id d9443c01a7336-2db126d6e31mr572534875ad.13.1789040637106;
        Thu, 10 Sep 2026 04:43:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14959fd2sm87427155ad.23.2026.09.10.04.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:43:56 -0700 (PDT)
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
	Darren Ye <darren.ye@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: mediatek: common: Propagate control and DAPM errors
Date: Thu, 10 Sep 2026 18:43:37 +0700
Message-ID: <20260910114338.142682-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_044358_233240_BCCFCCA2 
X-CRM114-Status: GOOD (  12.03  )
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

mtk_afe_add_sub_dai_control() currently ignores errors from
ASoC control and DAPM setup functions.

Propagate these errors to the caller.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 .../mediatek/common/mtk-afe-platform-driver.c | 38 ++++++++++++-------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index 477284e12396..c1869b38c9e7 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -51,29 +51,39 @@ int mtk_afe_add_sub_dai_control(struct snd_soc_component *component)
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 	struct mtk_base_afe_dai *dai;
+	int ret;
 
 	list_for_each_entry(dai, &afe->sub_dais, list) {
-		if (dai->controls)
-			snd_soc_add_component_controls(component,
-						       dai->controls,
-						       dai->num_controls);
+		if (dai->controls) {
+			ret = snd_soc_add_component_controls(component,
+							     dai->controls,
+							     dai->num_controls);
+			if (ret)
+				return ret;
+		}
 
-		if (dai->dapm_widgets)
-			snd_soc_dapm_new_controls(dapm,
-						  dai->dapm_widgets,
-						  dai->num_dapm_widgets);
+		if (dai->dapm_widgets) {
+			ret = snd_soc_dapm_new_controls(dapm,
+							dai->dapm_widgets,
+							dai->num_dapm_widgets);
+			if (ret)
+				return ret;
+		}
 	}
 	/* add routes after all widgets are added */
 	list_for_each_entry(dai, &afe->sub_dais, list) {
-		if (dai->dapm_routes)
-			snd_soc_dapm_add_routes(dapm,
-						dai->dapm_routes,
-						dai->num_dapm_routes);
+		if (dai->dapm_routes) {
+			ret = snd_soc_dapm_add_routes(dapm,
+						      dai->dapm_routes,
+						      dai->num_dapm_routes);
+			if (ret)
+				return ret;
+		}
 	}
 
-	snd_soc_dapm_new_widgets(component->card);
+	ret = snd_soc_dapm_new_widgets(component->card);
 
-	return 0;
+	return ret;
 
 }
 EXPORT_SYMBOL_GPL(mtk_afe_add_sub_dai_control);
-- 
2.43.0


