Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC21C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhFmxksn93jaqEPBP5cg3W4kPZXQ3iAg4tUPjfm3otE=; b=mJNgLnFilmLbESZK6yU1Nr0H1H
	kBQIw45wQPrTVLMRw0SavNLoGJlZO/iGutwr3ARgMuLDrdHnnvLIT5vOBX0sCdfi1EpuNqxtbAaWv
	SdnhJxVNkyfAbJR3rElSklGcWVyXn51krAhPYeID0yoSRXyAajB+9g06+thEfMVNDNxGlWVUh0QDH
	+ClqN5f+5D1LxM9os4SV1RS/X93p0yo74/RjRZOmRy+Vcj/wA3NJXYbxxDu/A9T+wHQyNxDG/lwFY
	Qh9EPujsUqHzrAvJuVc57zpP+bVsUXzTbFEri2Ul2aq4ktuNkCmyQFMAphvR8zM8otpn5oB9njb5k
	L9Hn9cwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMI-0000000EObl-190l;
	Thu, 10 Sep 2026 12:58:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMG-0000000EOa6-373F
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 12:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DhFmxksn93jaqEPBP5cg3W4kPZXQ3iAg4tUPjfm3otE=; b=STOdbUbMnrCqWIewGVUywoV7Y9
	niuiQ7JT8LYo8wV2j49IedEd1FxfS6zM5sEzzywPfikm26lAbIgEBuHqaaNGXzomhaasVen12vbJ7
	lOMeNTvBYiJTpl5ow/H2HaU2sHuB2KT4QACCPhnbNwPZUvkJ1Hd4QG2KIeKRDDDLiBO9QmCmXyhDi
	2ldNXItBANcuXni0P6/kQjm1jYsGojawWQ3y6a1Fsh5gWrV6Y1iQ0ZrBuFXrTG1LrWKVZidPy4YA7
	aPs+FLNWekY9JsLyiWdDTuTj85upBPhmtx+rJ4+cRHep7AAhwAXYE3tEBh9wvFCi0Tk1kfc3xEsSm
	HAGCI/+A==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4eME-00000002UzD-023y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:58:27 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3964e480f76so8205434a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 05:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045104; x=1789649904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DhFmxksn93jaqEPBP5cg3W4kPZXQ3iAg4tUPjfm3otE=;
        b=FI9eV6AzO7EeRv9fVR/Bd2SsD22yyr2C/fpzPRt+feqPawbPPM9rEas50c1jU12gW4
         wzrvCRPLXl+thlfrivvDEQ/Yb8PT2gVkkhOpft2in3UurMccBtOlTx7K6y8G9dHT7zIh
         9KfCvEvMqx4tNiHquJXBXLlX1H/ATlkMd8CgsTwpCvzkvrJNIgXX1ZJgVPMUS4VRqx/a
         gyoAGVDtcoRSwH8U+T5HxkSoO2jdPOJ8DwPCzxW43I4hjhCYoGWw0RODku0HNgvEwPD8
         wnMkszSXT4eOMCRdeoji6jOR4/+DrqkMN2OVKogbF67lGm1BvQ9RTp7IH9yu5EuR6WR3
         tviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045104; x=1789649904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DhFmxksn93jaqEPBP5cg3W4kPZXQ3iAg4tUPjfm3otE=;
        b=jkPJbrcHPltsBaJXeSWK0QCCI794QszwxLGrGIU5EUd+vkl49Aht126pVEf4A51aIX
         NHYSOu0/7/48qHjD6DygSpmKrUK1pOFIcArQwygR7yunMFhmgfiXW/lgga9WNdhYKxSi
         zEshyFS0fard403p0tzpHhyKN3b4xh/pinwcfOlLb+ScVOg06RUECH7GX/tHKcUzmi2M
         Wqs+iH9YduDDUiyfZKKTu7j5OoyTFop57JbRVxW7YLspkZgp3OG+RHroRwplRDEG8lOv
         ttwdoAn1pKLvzDutq8yRh4G17c0XlYQzYfpUZD0eAsFT+Ie44NqlbNZBwjSZk/3mRh3e
         XJfA==
X-Forwarded-Encrypted: i=1; AKwUvBxAyzHxRaAvkEQjyKeYM9omMqJcwoiqAEA2VDH4RNtQXfl4xwF/f97ONBo5Fr2k4NvgpfgIlP/RQyJ3Swbj2kXW@lists.infradead.org
X-Gm-Message-State: AFuF++mJOfY/0Yejmhloxkdl82SoN44PrgdRNKqGS5OKh2Ex9kDqXZbG
	s+PSGpX2fd89C4xzAiVqVR0FpAv51FL8RVv178PDyBrwlfW7yFnWS/KG
X-Gm-Gg: AYBFou2AFNCZuy1dpXQtolhvVBlC4Trw9lMBzK8C01+6Mpq13qFuHfun0i2Jli1Scaa
	8w6Cgo0teMqjw2fp95aLCVsNejd+h3D1q8xk+3wyFmDscShQKfeN/KS6yCEyRdiZl7NEW6cPujf
	3MuY0Sn3ZRJYSZ1vWWpp+3WiiZ+kImR9U9qeONkax0e6+sXG7A7Z9JddD10LDfZpNcUSEBy0YwC
	Ux4qLn9KRdMvD9/zyytJXfSlsW99nCuPh8+eQ5a+OGRMK0VLUL12JwblhmJUmp1UbGnthWYyXXy
	a5PvmbSls2woTpdC7hRFzRBaRKBl49T8vFFH/btSPlRtQjIZjo/sbvHporRbOIuPxJ2kRytJH8M
	dK3HPUHFTlmcK7NifwsVqIRgJ5FAKh7dNGF0zl7ug6wMc43nM6PK50XGaQ1yz5S0g5Gr6kcMUMt
	7fTQs6yIrUKKSzgd//8Rg7qFGSFR7EOPhgWJEEL2VGFijuYnUS7C8JGJ/nG7KrGEMYvaQ5hQhhx
	CEWlvLXYh55raX9utqsDGFH845f8GfAxj+FP4Jr4FlnXpAzS3HRXzqXXuzIjobxNk8rGRrGdGTF
	fuwo1/4oAndFCrg=
X-Received: by 2002:a17:90b:2e0e:b0:398:9be5:b419 with SMTP id 98e67ed59e1d1-39b2622bfecmr60688528a91.20.1789045103695;
        Thu, 10 Sep 2026 05:58:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:23 -0700 (PDT)
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
Subject: [PATCH 05/13] ASoC: mediatek: mt8189: Propagate reg_rw clock errors
Date: Thu, 10 Sep 2026 19:57:34 +0700
Message-ID: <20260910125742.150902-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_135826_234831_D96E88F3 
X-CRM114-Status: GOOD (  12.35  )
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

mt8189_afe_enable_reg_rw_clk() currently ignores errors from clock
enable and parent operations.

Propagate these errors and clean up the clocks before returning the
error.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 31 +++++++++++++++++-----
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 88f15a9c2513..435914aafb44 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -700,17 +700,36 @@ int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
 int mt8189_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 {
 	struct mt8189_afe_private *afe_priv = afe->platform_priv;
+	int ret;
 
 	/* bus clock for AFE internal access, like AFE SRAM */
-	mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS]);
-	mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS],
-				  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS]);
+	if (ret)
+		return ret;
+
+	ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS],
+					afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	if (ret)
+		goto err_audiointbus;
+
 	/* enable audio clock source */
-	mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
-	mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H],
-				  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+	if (ret)
+		goto err_audiointbus;
+
+	ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H],
+					afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	if (ret)
+		goto err_audio_h;
 
 	return 0;
+
+err_audio_h:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+err_audiointbus:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS]);
+
+	return ret;
 }
 
 int mt8189_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
-- 
2.43.0


