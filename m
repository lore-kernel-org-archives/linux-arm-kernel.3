Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A2FC982DF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZ46FG5TVo6218myQRpLPBR3Fij1s0mvVbflmMAQD4M=; b=zqUD2EZjBi603WL/D644mqQYmS
	Rb69oM3r3M5fgMviHHDxyQvucpESVKm8d6Yh+9rsYBbzhBImdV9iMsMoNYQUwlxwxKHEwsZm962H5
	tsmlCPFOAstnWS9fDkNge0CCXrjkTPl98HXCja5S1crUqlWjzFCp6JOtRyp8bIcwj5RdRrmzjwn8t
	6EJFaSfMmwAPDPIlwp6c65Syr/T0HCUZMeay4/IC1hisfgTgveTjx3CKkrT85TbBab/+cDIDd1gkA
	Jx/pfS348OubFLQLP8/5FYu4QJX6thxNX4E5Mhk5vwdNq0BEAnxzzrF/nSCGX1Y2J5XReDzScKf1p
	LtUS6vng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yoq-0000000EaSo-1RDX;
	Fri, 18 Sep 2026 13:40:00 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yon-0000000EaQW-1yhK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:39:58 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccd5cef0so536922a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 06:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738797; x=1790343597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xZ46FG5TVo6218myQRpLPBR3Fij1s0mvVbflmMAQD4M=;
        b=HTjnTRxGRlA54HsHxUr3OIlGE8b2eOXcsNA1W1kjQ1WnVzF3GSKXlKnhq7ohCj4cbN
         7ikgUNHVmNh5pJhEuXtkU2Zgdcl43+X2xrqrEhCycWdb0PoqgJauC5kvP8IBLEiki+Sz
         kMFWNc0no5dOmOagpMFxZEvUWHeMew3rM/AI+M3pfWm5IFyhUc23+tRRtuNm24t3ffcl
         f0n3r6IuToDkXyUAqBKpvoDtb08EPUg6c0V5q39RkDmzzPLXeGp27ZDRZAdp8Xw5aqaW
         E02dYi0V9Z89X/cj1Zw4wFPHFUFTIf3uATQAIOFUJcAC2yPxoWzBsDK1NhHKTwnyxqJR
         9b4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738797; x=1790343597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xZ46FG5TVo6218myQRpLPBR3Fij1s0mvVbflmMAQD4M=;
        b=Ij5MhMGHkanBLh07nKOlvq+xMOJMpiyIKhCc4GXHPOh+a/LxnR1g1x3BsjoCmEu8f/
         3bNPBqCLHBVFcpjG7vcDwt5eyFYOQqL41JoBSiZ5WYlO4Ig7RqH08xKVygz4qIKBQQWz
         D09a5IWbjKl9gR+SL7EgWHR0dCsUv/RjVwNzbK1cm3PQhynVFPPGVx+XqEmmc2VjsNuK
         AEig9xt++/+180aTXEwxG957baHoClZzt0BL3bp7zBZrTSOTjSYWwyaad53iuhNShhYf
         mx8pnv4BuGRwOvA2UJvBvYJ8JkCWcwTf1QpQ+ogp5vU2LfcHTcupltW1EtjJnqvicAH9
         po5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxlPrR3GgFnIV3u/a4mPUG/IrlHj5Q7eho0Z2KR0H3MEcBP3nobblSqgUM4FXBl8q0Z+wLnr+HSA1LcF7/qcGnC@lists.infradead.org
X-Gm-Message-State: AFuF++llI/X8B5mv6ESfwBXr1z7dU8W8Drg/sDClst2BRW3VmYinjC4r
	f23PjUWAn7khkU49l56g0FDnSjFxX8B+qa9pc0shwC7CSUMil/yvxVuW
X-Gm-Gg: AYBFou1782F7Tu+3snPcFRlVCQ3ujsKXxeF48jmJxDGg0bW5v4yJC7/YBYIuuAYiLtl
	c5AubK7koFAPOAc78+VNUO5OUKFwAH6KM9uuPeEVElygsICC/FHfa9THFlk8OlHySu9AE9Qhuq7
	6CTODNo2b4aeIfXlJm4wkupTOpSSCFPbnjs1FFx3hWk0jWjYqvlZbmqErh68FnkgIDuNTXw9u9c
	x7wmpmveIXZEnYXaqjL0nSVCnySqdq3EULaApMKwwzFDbsPLV+qSGAyNQs8fCvH5Pe95wKxV9kO
	hSN7cxpO/4Q/FT9twfj1bOnhI+MeToUQoV4hb5Zmd4CZXDeINiNqa/kl5SwXeu2ZiiD2rtK8aDh
	Rof+DNJ2kMtndSkGeRRCLOXZPZCdOAJ+mi5AUOb9pG1MdhEJj/+sO+Zvtt/G6avGPu/25kPGYmo
	vonAg3Pe6RwW3NfHXZc7eldlLLwEs2j48ApLo1C+sS1UEOYe0CG22EB/CERIxbtadLRmNgWFQ/I
	YwFKdez8H21bxJ+4p9JZXrqYg/GfsH5SHZ0XGvE56Qvs4Wz2+4BqMOuW0Q5tUTWaENmX9F36M7K
	xQ9rUYOmC5AisA==
X-Received: by 2002:a17:90b:2d44:b0:39d:8794:5564 with SMTP id 98e67ed59e1d1-39e54ce36fdmr6605508a91.12.1789738796691;
        Fri, 18 Sep 2026 06:39:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:39:56 -0700 (PDT)
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
Subject: [PATCH 03/15] ASoC: mediatek: mt8192: fix error handling in APLL enable functions
Date: Fri, 18 Sep 2026 20:38:59 +0700
Message-ID: <20260918133912.133799-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_063957_592657_115C7F07 
X-CRM114-Status: GOOD (  12.81  )
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

If a clock operation fails in mt8192_apll1_enable() or apll2_enable(),
the functions return without checking the return value of mux settings or
unwinding previously enabled clocks and MUX configurations.

Fix this by checking the return value of apll1_mux_setting() and
apll2_mux_setting(), and adding proper unwind handling on failure.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-clk.c | 32 ++++++++++++++++------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
index 7647bdd463d9..118dd4819682 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
@@ -308,20 +308,22 @@ int mt8192_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_APLL22M], ret);
-		goto EXIT;
+		goto err_disable_mux_setting;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL1_TUNER]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_APLL1_TUNER], ret);
-		goto EXIT;
+		goto err_disable_apll22m;
 	}
 
 	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
@@ -332,7 +334,13 @@ int mt8192_apll1_enable(struct mtk_base_afe *afe)
 			   AFE_22M_ON_MASK_SFT,
 			   0x1 << AFE_22M_ON_SFT);
 
-EXIT:
+	return 0;
+
+err_disable_apll22m:
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
+err_disable_mux_setting:
+	apll1_mux_setting(afe, false);
+
 	return ret;
 }
 
@@ -358,20 +366,22 @@ int mt8192_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_APLL24M], ret);
-		goto EXIT;
+		goto err_disable_mux_setting;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL2_TUNER]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_APLL2_TUNER], ret);
-		goto EXIT;
+		goto err_disable_apll24m;
 	}
 
 	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
@@ -382,7 +392,13 @@ int mt8192_apll2_enable(struct mtk_base_afe *afe)
 			   AFE_24M_ON_MASK_SFT,
 			   0x1 << AFE_24M_ON_SFT);
 
-EXIT:
+	return 0;
+
+err_disable_apll24m:
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
+err_disable_mux_setting:
+	apll2_mux_setting(afe, false);
+
 	return ret;
 }
 
-- 
2.43.0


