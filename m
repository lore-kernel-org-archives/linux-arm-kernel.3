Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB126C982DF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=84KmttxwxJZo38Fsi4kV8h//UiHGZgZirQkHOuGC9Ho=; b=2y7NnpvqJieXqzKdWgZOUB4rBX
	Y04cpm3zwlnbT8QZ7JIEFzv3SSch5RbswPGTp/cwBEwKWII9irdg2GJj2k6q6IyFW/d7LMmKHrY6r
	Y3dTIQB/81mBMdTJm3eBW+jdBe3zz1xuKQCdwcyU+8H4nKzWhsDYpkZr54E3rpNn6Ei6x4pcdu4kO
	CDSg114lyZQFgt1q3BVFNq6LrFEyCT35TG0qo1tL+Ixd2oWEUFi3a5Dum8X7ZuKKwnIq0oz2Acpx4
	XlqvaQsl1OPD+S8+j1i4WZ3bETsojlV35nVHdQdvGwf5c11Wj/AM5jj0frCN5OjuZxLli0TtI56+c
	iKLDRLuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ypp-0000000EbTf-1eO8;
	Fri, 18 Sep 2026 13:41:01 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ype-0000000EbIq-29dg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:40:52 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-398a1676000so653656a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 06:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738850; x=1790343650; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=84KmttxwxJZo38Fsi4kV8h//UiHGZgZirQkHOuGC9Ho=;
        b=jKKcJcKRN/lRBB39qfr4enYgp7JoGRmZaMh8CbqI6N/Pb4gpVWSDs8XQgnV7thSicC
         Axv/3r6c7ajcTmu2EDLxpdDuy1nq5TtfyrLX3J4MzhKnUU10Jay19ovISz+oxo/6w/uC
         KGieqdOkgNmQW0nVHI539x1GGdoAK4Tk+Qa1zrB+nNmUQq7pbhCQafRUaKiQF5v85pzH
         gQAjKCRQd77e7aUqht94SqGiBT4YBlFy4GnccWZS9xECXiBFSWX/ZJBx4HLSO+F0brYQ
         aDG8UjLyoiRN6CjbfcSDbovc6HG7NvvqD+/ov/emjvCZBid8tRTs7WtrppHyXByAyp1c
         eHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738850; x=1790343650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=84KmttxwxJZo38Fsi4kV8h//UiHGZgZirQkHOuGC9Ho=;
        b=HLxRsj/HdkxfMZHg6/iby5W9Q0mu/rRp6pSsx7N2cglVMLuJsbME5XxX8IHcpBzW5B
         5JzD/apwihpVMMp6kzlCARKC3V8ztrkt0xHrmhOEKRYhMW2kH6oOMfi50/kH4pW7yz9F
         R3Aoa8b2JXE5X8YPI2Iq/YpfmA7AbyMMlMzCv9iOlfVu5GUSa1NmgG+X1CWcsLMMgrwl
         Mp118lh3cKvMGGVZBcTDcDpuZcF2m6oBXM1Qvp5+uWrU0dK8EEOSIiinz+HmqQjK8SHi
         PKY7kPRT/DMdTWOVzVejWFftXx5Z0rAeElIC25ehFXeShdmif7pxrUSO3FMIWmkwwWkQ
         oLuw==
X-Forwarded-Encrypted: i=1; AKwUvByikSBATSwiyewFFGmrP60vzDYS4U/2KxBPuSYTa6xNFKzyPyG6CFfOImih0NPPVwduEfQoBUNStKYNGIi3bpEh@lists.infradead.org
X-Gm-Message-State: AFuF++l2tY5ACmuMB7cSOA3WH/EOyJD0gcOHng0fjy3KVBfW1WM5I4JG
	QJ1vYXVOkdowaCbTwP2GyUsCLTR5B+w/pPLcqX4MQWDGhJuwfncBwp/y
X-Gm-Gg: AYBFou2Tk/eNtyOAYXbg5pdOHRJcy7/tdA4CZnKwrDtlizbR+/nZMIiDwZdOnotWkca
	I3h02B47d2iYOPHhR0Wa9xAfK/8PypW5xqGak3IYYTe4D64S0d4Q0H9EvfX5bqbzSwWfYemhbKw
	UTeMYprPxUc8jjCkubx5Q46vWlZbnRzfeiB1gBOGSVkwEJQw/Wr0cD78dAWi0dJclPt/fk/cqvX
	UHoYo3/bKEO4sL0/9PuwG5FJ/8DsOuQZBbLMcT9JcbnDKv29jnEJbWzu50dMxDmlNd7fuRh55fF
	ockZCXhCKhrio6/g0QKV83Ywix7Jj8h2TA+KQcjA/fgO9bM12SkFi9Md/0bjoS0IKLce70toNyT
	bkqoqvtsm4HRUvMjUyS1GBKGdcF9DBpuFK+Dhl6pzj7MdQ2cAwGaNVo1ZzZoPuaPvjiQJR8wi4q
	3JAu1/Hv/8UunWSc7FssJgWqVM7EhP9nIFCBHN21I5UOL4oLA+9TlQ7gvOqLx/swR1vdl9ckf7J
	96C2Rx6P/PVnZmhRNU9eMSZ85tNjexTVNI1L2XhX6D0v/APtekMCCou7BABB00sWY0JdD52b/c0
	8y/0e5TYGoDQpMgHoc3YTeQE
X-Received: by 2002:a17:90b:17c1:b0:398:e86b:ce14 with SMTP id 98e67ed59e1d1-39e54e3f526mr5588018a91.20.1789738849715;
        Fri, 18 Sep 2026 06:40:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:49 -0700 (PDT)
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
Subject: [PATCH 14/15] ASoC: mediatek: mt8192: Propagate errors in I2S DAI DAPM event handlers
Date: Fri, 18 Sep 2026 20:39:10 +0700
Message-ID: <20260918133912.133799-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_064051_341502_1DE9128D 
X-CRM114-Status: GOOD (  13.75  )
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

Currently, DAPM event handlers in mt8192-dai-i2s.c ignore return values
from mt8192_afe_gpio_request(), mt8192_apll1_enable(),
mt8192_apll2_enable(), and mt8192_mck_enable(). If GPIO configuration or
clock setup fails during DAPM events, the error is silently ignored.

Fix this by checking and propagating error codes properly in all I2S DAI
DAPM event handlers.

Fixes: 2c37b4ed730b ("ASoC: mediatek: mt8192: support i2s in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
index 1632fc94776d..5608b534af0d 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
@@ -586,6 +586,7 @@ static int mtk_i2s_en_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
+	int ret;
 
 	i2s_priv = get_i2s_priv_by_name(afe, w->name);
 
@@ -599,16 +600,17 @@ static int mtk_i2s_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_afe_gpio_request(afe->dev, true, i2s_priv->id, 0);
+		ret = mt8192_afe_gpio_request(afe->dev, true, i2s_priv->id, 0);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		mt8192_afe_gpio_request(afe->dev, false, i2s_priv->id, 0);
+		ret = mt8192_afe_gpio_request(afe->dev, false, i2s_priv->id, 0);
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mtk_apll_event(struct snd_soc_dapm_widget *w,
@@ -617,6 +619,7 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	int ret;
 
 	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
 		__func__, w->name, event);
@@ -624,9 +627,11 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
-			mt8192_apll1_enable(afe);
+			ret = mt8192_apll1_enable(afe);
 		else
-			mt8192_apll2_enable(afe);
+			ret = mt8192_apll2_enable(afe);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
@@ -704,6 +709,7 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
+	int ret;
 
 	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
 		__func__, w->name, event);
@@ -716,7 +722,9 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
+		ret = mt8192_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		i2s_priv->mclk_rate = 0;
-- 
2.43.0


