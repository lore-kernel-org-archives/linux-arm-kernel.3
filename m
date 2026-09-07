Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68149C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 12:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ea6lVpnhWbYQ3wI5UpSM25XcXKci0dt7/GlZ6PuirvE=; b=Pozmn+mZ2gTsIbUO7jHPLBEpye
	i0W2gejLC02/9DIWFqoNobPDSdcJuJQk25knMh4o4najRwCNWG3ZrgudFell1L1373j0uSthYQjpt
	+tuXaRGSC1vcHipfLxKssUu8eHs5AMtCSz7DZdcqvqTtkX0IIhXpDynzswiYyGesDu7LV1VlrKide
	FRUuOeP1BsisQFoHBjHWtu9L7nR/v7Au2QGcZI0fDPMFq8LsC5xhGPf2SOLYlsy5+TABjkutoC3yT
	zjaCWhiiBoXhvdAtkYNH1PNhDzNIjX2Au/APt9OzsvCuDdtAFcwyE4KvkG/RF6FJIna5xOfrrbeU8
	GsWHkVuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y4k-00000006kKW-3ygX;
	Mon, 07 Sep 2026 12:03:50 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y4j-00000006kJI-2dYa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 12:03:50 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2d560775ca2so23335155ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 05:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782629; x=1789387429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ea6lVpnhWbYQ3wI5UpSM25XcXKci0dt7/GlZ6PuirvE=;
        b=a1+OMETWJDnpmrubOnHwY8w6g//5YF7568H+4a1QSK/HFt7q4LIvsIxilQUH0rlIKG
         /0p3RvnPwFSZAmjBSMenA0eyGxhQ3pJNcwsm5gnRLJh5zJrdLJcj1nYX1HlnKFFxFD3W
         SdvzblpWUm3Hff6t2ZbKlncyawU3aAu13M9cC8sUlDAsq9L7bUgDDu+s+hTMsMN1OMgN
         DmYIehoKoBqmIrDFRDNPPvlZyfr9yxQfKMqtacCc98r+CbtmS61QegkNHMtzw6v83m3+
         cfhOdEsJdYX5jjLxiIKtrZtn9hmFxb1869q6fRq1HIV1IxQ1+wKcVC2ICb96P4PFkj23
         7p+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782629; x=1789387429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ea6lVpnhWbYQ3wI5UpSM25XcXKci0dt7/GlZ6PuirvE=;
        b=JYUYc2r1aJXxt3sKTUDuiry/4ckLSKnX8gco61ispgJhjqXoVvXh89cBaG3dVCRAHu
         Rx2ZelQPZlGQkOhfK8X8Z64gtMcv5+NRi4YuOYOw1031RsZvx8PBbl6hhxpwSKjXdLfy
         l9momX/qAFNe8L6SNk5V8pavbkv21u8TAZQRyiB7NtfrEl+LklaELlrQtDU/rOlh5K+i
         PcJ3wXDqZJDyveMSLrgOAtdHe+KF91VjYGfOLXdNgWYgCqSjLi4HNUuZVHaTcbL11ZFk
         B0UYjBdSlwLzeqrE0iwCZKkD11LTGqf4zI9PHdcByE5fxFcKHOP7AmCjqOxWx7Tu+R2D
         0fCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbKFiechZJOTJl6tQJmj3C45vgoJygp5RFaUGPHIra02ifusr9Wc5HVGoRc9fXwe7OoYYoioFKw8tKe9ZjpEPc@lists.infradead.org
X-Gm-Message-State: AFuF++mg0fvZZRzuUjjSLaOTJ86aPNJr8X1FiNg4n29cbDlWwAL0+XuC
	nsqcFTC6+zpoUOkHi/lTQnDhRxE9NAs+5gxST18JvegZIKqvIK7gri8a
X-Gm-Gg: AYBFou0Zygbe/6MNo3v5Xz8MZyEYfAMOHet29TzlWZaUx736G3m+kFDaVp6qcu3Tj+A
	o+QMwhcfJS+BBsndqtP/oK5Qm4o2TW+S6xzllR3FDZnzU2p5ys9P0I/58s9/mnw5jq8VMX3ESgg
	Qf97cnV3ORT525uezK09pAOST6izjhMkXK7GVPISiippunuW+JjwWcrIPKoqElWVn7NauDR0vni
	8zCdOI/6baXnL9NQbBb5RUKTH5SgM7JiJT01psvHoDAbG8nuoNMTnAupe7tFTKG7fSKY8sFtYsS
	s/hPASsWRzUkXXqCn4RaVPspapjuGHYG40HzSlsv+zyGaTUn6+5LEG/+yQLO13T74PZ44Jm/v5K
	CsckyEAwH+efavfF7egbo9AgOUOEI/4EOh1MMg8DF3XuZLS7V+PFn60RmFcbAK3Usew23Tv1yBD
	yKNTWcX9bMwNOfAXjw0VwBzStLUYVgQci0w9RWfFShGhqZym4ltaUJFAlcp+IWdxFLjXZbDsfPH
	DDzK/N5V9tQ8pDHlHsG0YkkBIX/2mKKeDfYovnvXwko58XkQo+7afK3iBQQiKI1QMLeUZBnqyLG
	TpsUn+ix67QhssU=
X-Received: by 2002:a17:903:40c9:b0:2d6:f6ba:263d with SMTP id d9443c01a7336-2db124b451cmr310785685ad.7.1788782628815;
        Mon, 07 Sep 2026 05:03:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:03:48 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/7] ASoC: mediatek: mt8188: mt8188-afe-clk: Handle tuner clock enable errors
Date: Mon,  7 Sep 2026 19:03:05 +0700
Message-ID: <20260907120310.135693-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_050349_675239_D9537E70 
X-CRM114-Status: GOOD (  12.76  )
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

Clock enable errors are currently ignored when enabling the APLL
and tuner clocks.
Check the return values and roll back the APLL clock if the tuner
clock fails to enable.

Fixes: f6b026479b13 ("ASoC: mediatek: mt8188: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
index 42878c8a6529..ecba13eda440 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
@@ -260,15 +260,28 @@ static int mt8188_afe_enable_tuner_clk(struct mtk_base_afe *afe,
 				       unsigned int id)
 {
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
+	int ret;
 
 	switch (id) {
 	case MT8188_AUD_PLL1:
-		mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL]);
-		mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL1_TUNER]);
+		ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL]);
+		if (ret)
+			return ret;
+		ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL1_TUNER]);
+		if (ret) {
+			mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL]);
+			return ret;
+		}
 		break;
 	case MT8188_AUD_PLL2:
-		mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL2]);
-		mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL2_TUNER]);
+		ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL2]);
+		if (ret)
+			return ret;
+		ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL2_TUNER]);
+		if (ret) {
+			mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL2]);
+			return ret;
+		}
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0


