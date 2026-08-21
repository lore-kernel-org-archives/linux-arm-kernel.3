Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C16C5DF8E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 12:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gGl1wn1tthVVpzXm7BgSd3YBH4Pka/KCiti4HDh7cGM=; b=mk6aC3wXC+tC0E9N0oRqpSLTbG
	C9qgvoXKrjpif6KtfrO7lPKGHbr/BxIS5yxaaipLHZRK1yJ0AWmKpJKecyii0a8ZVNwKDVuEMQOaR
	OCNv4Fm8pPYgdykTwQ0qEcFWOyiz/PMYE7Z2YIm8flw/9s2fc1VccT82xUmhDTHUbNhjLEwrQkdbg
	6SxZ7Ql/g7mXfwXX3Z+9Enx4x8sCb+ioJh1E+rH3lIYiO4oxRG0RRV4z2oIk5iSq5cnKoWvyHdc3m
	Un0koh9fdT8BDrVbQlvJS70qXdp/2nWx1A4QxqmVJ1hJtjHzRDRvhQAbUdUhc5K8Wlt7P1vHuMkCl
	WV/a4rGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOOt-0000000DKGi-2cGi;
	Fri, 21 Aug 2026 12:31:11 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOOo-0000000DKDJ-3AaT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 12:31:08 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2d5655cc850so11472255ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 05:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315466; x=1787920266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gGl1wn1tthVVpzXm7BgSd3YBH4Pka/KCiti4HDh7cGM=;
        b=DOMlp6oTxYQ3c+x0z+ZOio+CU5o0f3C2qjqpOCu6vnsyXvyXEHODTLppca49/XLcMo
         zHgbcwi71Hqcm9gLkmgiEni75SHOcB/hjcRcefKPhnQ37KyDpFncm3q3VUtxzGWZiCBr
         NH+6GogKhXEWHctyofF77tQcKNZPzscNG6+1dVt5nkhL9u7mLYJZq2yeuN5NmlfX3/E5
         7sk6xm/Q7/D8iVIhNu0zWXnHsMyNMAFyw/l7l+braMNk/uymH8Wp7zv+Wub5fk81XPtr
         pr0Om2zwNt05IJsP90Ox0MvgvrYRIPlAyRWmwqZ9nwNGKVqlP3dhQQa0nRKslGO0EQDA
         98vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315466; x=1787920266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gGl1wn1tthVVpzXm7BgSd3YBH4Pka/KCiti4HDh7cGM=;
        b=a//cJOvlZLusbu5pE9sQHicAoHLnCgFHC64DQU0tgSC4DSmS/Rm6Kwp9R/cYo3i78H
         lf48rn+1T6VUHZxo1NuY+DffAzjNXcksP3MV0sIeLjy784ZrkzW1tIm7WdQH1GYVIxni
         vvhE44Fx/mglFBDFcEySkEa21LXT/GGt14/sWGja5D0gf3+3ZQRchgumKwAXXlv9kMz3
         qGrFGwNMGjYagC/IuWehnfP4Ffc7aryvd/VNDrKCgTLZYiA2sdSXhFp/rHdSPY4KJau6
         Nvssw47jQ1W9LM3g1d02MlAVt9mUMSwxD/Acu66uQ3+SWM7wuAFAPGWBCY+kN2IVH2bS
         FppA==
X-Forwarded-Encrypted: i=1; AHgh+RrcdjdduyG0b1j5jALTqE4YE/My+2tWY2kLxZIaa6sNhf2t4Tmbbl4BQmjhe0i/8/gCejn8vJ+NQ/03Hnjx7Z9r@lists.infradead.org
X-Gm-Message-State: AFuF++l0wySuo5cZL4BIbyIo+D0bl1hIwdflgUrgfH8R633IJZUC8qLG
	dPVFPObAtReDIpo+7KrZ0jKsxpnEXaP5xEJcH5X09jDmnEtsPhdAX69G
X-Gm-Gg: AR+sD10/qD4QYR+lPmP72Rr79Pi2PGdkLqj7jY6L4Wk8rwIrPSMoB+18EOBiWfP13CT
	apRfM3IHZvuTCetgSReeUavYq+Agsnf4uFM8mytWEzzSI2zU/dK89Cbvl2agDifkRVcfhiQfy+M
	yT9WQLxpV6YmONnKOem8IvUytmZkGhpP8tUxkBMHjVPvT5PZ9NTEwA9AQQS8NBVXLlczAaGkdJw
	F4MTLgh+1kCpV3T3XsQdojsliID1+RliijUV32Z0+lsz+wQuAKR/UAcmK3QwuO7dO1uVhpDAEPf
	dIqtsxk3msGbpT+/VPMM/4nq+t1I3+Ey4ahHigK/2qBEcr3S2cr461zsPlP6FJ3lQi96n3Qyrqi
	hZRXjnYDJ0r5/SLTCRWD6oqjytF4PvnTBVp+InkDwGSM3R9kAyVWmaiFlvlO+nBuzE+9vlY1Lba
	iHi3NHjCnf9FlI9Qlwo/NGKsNmHfeoCD2tkF5RAIM1j5+qTXOvHk6P3MVND5a4/yoF+ozG5bE1R
	TuoONQKrsrflU/mmHIOU+LanVv4HEIS0EoI6axRn810/T4PsgQLPo224ccdzXxmAGbAF7KsOeJ7
	TeuE
X-Received: by 2002:a17:903:3546:b0:2c7:f2c6:89e0 with SMTP id d9443c01a7336-2d64adf3b42mr124052375ad.4.1787315450332;
        Fri, 21 Aug 2026 05:30:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e36e1besm18302235ad.53.2026.08.21.05.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:30:50 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 3/4] ASoC: mediatek: mt8186: Fix APLL enable error handling
Date: Fri, 21 Aug 2026 19:30:20 +0700
Message-ID: <20260821123021.41390-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821123021.41390-1-phucduc.bui@gmail.com>
References: <20260821123021.41390-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_053106_798971_BBDD1372 
X-CRM114-Status: GOOD (  12.23  )
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

Currently, the mt8186_apll*_enable() functions call mux_setting(afe, true)
but do not check its return value to handle failures.

In addition, the cleanup paths of mt8186_apll*_enable() do not call
mux_setting(afe, false) when the enable operation fails, while the
mt8186_apll*_disable() functions do.

Add error handling for apll*_mux_setting() and call mux_setting(afe, false)
in the cleanup paths when mt8186_apll*_enable() fails.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 94bcaf92e396..d6b0174e2655 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -359,7 +359,9 @@ int mt8186_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		goto err_apll1_mux_setting;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
 	if (ret) {
@@ -384,9 +386,10 @@ int mt8186_apll1_enable(struct mtk_base_afe *afe)
 	return 0;
 
 err_clk_apll1_tuner:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL1_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
 err_clk_apll22m:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
+	apll1_mux_setting(afe, false);
+err_apll1_mux_setting:
 
 	return ret;
 }
@@ -412,7 +415,9 @@ int mt8186_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		goto err_apll2_mux_setting;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
 	if (ret) {
@@ -437,9 +442,10 @@ int mt8186_apll2_enable(struct mtk_base_afe *afe)
 	return 0;
 
 err_clk_apll2_tuner:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL2_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
 err_clk_apll24m:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
+	apll2_mux_setting(afe, false);
+err_apll2_mux_setting:
 
 	return ret;
 }
-- 
2.43.0


