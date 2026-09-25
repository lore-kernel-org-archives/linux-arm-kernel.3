Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F321CC98306
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 04:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=; b=LIOb9bdeQ+ByAHl/hZspQDRvV+
	jAJ8bZUgdOcYQBLY5yLUKKo0MlhSwky5SjKoAnJTdDwBsM6v+EOtZE0qT7xZ9LEZm9R7cCCN358/5
	KiDeKHVlxo1o1Wq79ycRHaW+BR6dJ92zARBNpXVCBhRxi7Jtddn+0BAOukG8SIMq7Il0q14C18jzc
	3kgDpDgLiPyF2rEprMnexzawlaI3JcFOYE1bJdryMDKZuzsO7AZPEeM6L/WfUiZwjmMNAKHKcjb2b
	bi+JGXz4AI8t06yvHClJsOJ1q6QrR6jtJ9dsb6IcWWDFDY7gH2PWinDoWEUkOIv5TLbZ9C9+HZaIa
	yfsq6yrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xsP-0000000Cd6h-1J1a;
	Fri, 25 Sep 2026 04:49:37 +0000
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xsK-0000000Cd5L-0mNt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 04:49:33 +0000
Received: by mail-pj2-x0d.google.com with SMTP id 98e67ed59e1d1-3a0b18f811cso396612a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 21:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311771; x=1790916571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=;
        b=Zt8fYkebU8FOl+//Cd0j7MYOqTFdXa91no1dtuK18z5S0cZ96+6srgbF72Wg26687s
         fLhSHBKgoS61TuVaVhvVw42GwmL0jLdvY0RRBzZcM0Hw+l31FoLgHsH6a2HwPkZM2N2b
         gXk1r7/38P2/+e7SQffAAduDYApWgSD5OnQYJWTq1aZ4QKDxGVc+EwUFsDp0loRiaCD2
         XgdROMOEPFp6ZJ4od98GDezVMlkkduUQ6RAMuTpRPifeUGe+1rrqW1izaeKegRZlG/Ds
         Epxw8/ZaLOQfDg7cBxLgGFT0dqZoyJmELVDp1Afss73k/eGzl/AD2+kBxWbgWI5pxC42
         +3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311771; x=1790916571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=;
        b=sALV9zSt6EmOsHaxZ2MJDn0BQWf3p4qsomhOXnJNmM6tDl6Q9YyCdXey006iPx3a3c
         7hI87mukjmxyxvmND5XRRyihbPM4/vnpzxQz0hCknpOqOGQsNpDVFEoc/XGdJyriZL6g
         juDesF8mYSesiZvl42wOIgk5e2nsSo3UV7Y0yfJqlmIrDaebamZ1J09KPE8AE0p9FHJG
         mxa2c7ZIxd4DnDRj4qDWU9lCiACKoWjH2v2W3T/xo828ON5Vzld+ac6BseqU3K+PiXTS
         xvNPF05HhhVlSMPjg0cxCRINhWoMBLBJKQ2S5piFVioT+RblwBcV7ylARAyu3zbDEg36
         jWdg==
X-Forwarded-Encrypted: i=1; AKwUvBynbu/B0tF8JPeoWIpX1oLFp2//TXayO/4cakzpnqvU71uQ8wUyCM7M93C7OGEhntcEKH18AQXkoU0AbhhSThtR@lists.infradead.org
X-Gm-Message-State: AFuF++lStW62Eb0BJl2xMtVsujyp0VPLyEaohKdUNgbfCXV7cGAQjgoO
	LgXfsZ8nkKY65NLiwC5qsYC7iF2emRttyk2x/XO8pLFI/gbVnu0706ae
X-Gm-Gg: AYBFou34ri0DDkKbaTy9tulO4ACIJhdcyxnMf9yDE9VpHAFqLLj8RTUZZspLiXpIr5s
	Aye6K5Runr9dBuLW2j9qoWTc/pyazzjogXzQgPM8K5UfFiX8QdnvNqsdtLOqWUDV1x4E17J6OiC
	TRVhJzY2zPsjhOAsN/yxXq7hSByoO5OmpD4IKvtGIaGo95dVdsSsbQr6nNDAM7NS30uyPz9/AKZ
	zJq63yiwnS3a82aHjvCfBbzFK180UZQf1S6eZFQoacCv1eVvTK957/g/TyT0FDRhWb3bFrEl3R+
	d4L514P2AdmMrWQm6JC78cXwKKwU69DbUIB12PSer9LQXpi9RyaRswzBjpj/Ebk8KLuvXfClOQi
	AAA8PKNMcmRXQ2OeIi7suEhsWsQBWt3pXYnNq2n8IYndEJ+T9g5y0viqVOj0Z3kY57LsclMcvzJ
	ZMnWTZcpfm1xh3GvqeZneMLfDSTlvfH0SjeI1HL82ClZm435NeMZshB0WH+WFv8OzDKw+iCr+2U
	wgdvvpCq8+vGedE7jLn29OJz6/rLLjuIeWPCjQJLLQtJXnsU1ySnj0GV4BXiSQWvtZXUckA0BDf
	DarV9Nbizn/FEg==
X-Received: by 2002:a17:90b:17c8:b0:39e:433:23b5 with SMTP id 98e67ed59e1d1-3a098b973c5mr4047368a91.5.1790311771625;
        Thu, 24 Sep 2026 21:49:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:49:31 -0700 (PDT)
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
Subject: [PATCH 01/14] ASoC: mediatek: mt8195: Fix tuner clock error handling
Date: Fri, 25 Sep 2026 11:48:55 +0700
Message-ID: <20260925044908.450775-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_214932_256739_259ED0B1 
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

Check and propagate errors from mt8195_afe_enable_clk(). If enabling
the tuner clock fails, disable the previously enabled APLL clock.

Fixes: ff5a90173d98 ("ASoC: mediatek: mt8195: enable apll tuner")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 24 +++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 618d8400913a..ec1ea5b988ff 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -241,21 +241,35 @@ static int mt8195_afe_enable_tuner_clk(struct mtk_base_afe *afe,
 				       unsigned int id)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int ret;
 
 	switch (id) {
 	case MT8195_AUD_PLL1:
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
+		if (ret)
+			return ret;
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
+		if (ret) {
+			mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
+			return ret;
+		}
 		break;
 	case MT8195_AUD_PLL2:
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
+		if (ret)
+			return ret;
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
+		if (ret) {
+			mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
+			return ret;
+		}
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mt8195_afe_disable_tuner_clk(struct mtk_base_afe *afe,
-- 
2.43.0


