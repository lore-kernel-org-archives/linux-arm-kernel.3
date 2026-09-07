Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03E8C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 12:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jz0kWZe5bmFipVumA0Zj41BqLLQGOY62dKowlWDNz90=; b=cGhaeBrCWf4R/Q+ebALyNfabWF
	oQFPt4qON43/gd+R70tZZJP488MFBtfaPG8XxOlVee+82WkqN7PhfFUX3wU7yKmeVFeB4pLbKRME1
	TS3Z8/wyvQchVKdGx5m6RTH7EGoW+xLhOlNcPhD7VNY2kGsw8/Kr35Fr6AqYgTJfH8lMcMVmMqlNG
	b3O5cpfFEi7OlKRsDBvORQROkJhF5BdXFp+hQKdQTHkbeRVMfyLSDIqtR02HBv/Wkjt7LTcuRRM5a
	kf7/4SWucYw6bY85xcpyldiwEQIxAbK48SrkeMRMETcYkfGS4gCDBTIcaQztiTF/pGmu08G2V5FV4
	4Acg+C2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y4q-00000006kP2-0wEX;
	Mon, 07 Sep 2026 12:03:56 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y4o-00000006kMX-28iy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 12:03:55 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2d71ae3455aso51686945ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 05:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782633; x=1789387433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jz0kWZe5bmFipVumA0Zj41BqLLQGOY62dKowlWDNz90=;
        b=eiBW48Wm75acKWoA3751DYFoVKM8fkO9JyiXccZNu2KqhhqbdXatha7mNgLafDgbPq
         N581CpqylsNhmpn5kY8Ww+tNPCK4Rp4y2LefdWWDbMSGFI9l1iFv/PEI/3xQ0AEsIX8z
         9mqvo16qXIn8nolJL5y+TyrDsoXhPc6o9mriQ5KlO05edvwkjYF4YmGcfFNUMuj5pBRr
         8WI1fb4HtbpNsWqRxPcuyDg64QYEv3bdG1DKCBpSW5CSgK4u6VakW8uHOba9QWZXEbLc
         y/VZRipJiFUMpHckA994GX+DC14TpnzDMWlKe8yESlOE8AWz/wzXDnLq1cJpETe1VxP3
         Q9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782633; x=1789387433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jz0kWZe5bmFipVumA0Zj41BqLLQGOY62dKowlWDNz90=;
        b=HbROyFMdzjETlSoi2umYxDJ4vvp55ukwhTnH8PCZ4xur35RQMYOZJ+cgRNO8onT5Op
         1BKHLsHo3XRCHTf4e2QG4+scqHs74UFyXc40HNv5KEWlhFH4LAzWDVX3wlhuqmzfhH/K
         lk2XIHOMtjstTwnhC0Q2joKJA10gcLpnYM8e/pPZGiywt6D5q6c9TFNakX4daUwEg/WL
         PAqHGlhW38ZTL0yDhojpCiBhvRr9dilTXHVetOMMj9DFImUFwryzoS85L3bha30mHKPs
         Ih1floFnXdDfcgFqwg0Ri2YXoJSDS2K9OJPuzIJ5dEmK+ZXPiYs4pAFtbFCjEOeRyd2P
         nLOA==
X-Forwarded-Encrypted: i=1; AKwUvByLzXH5j9MTPIweDnU2G0FX4Z8ef1ODJwAKt7mT7zX7e13ENtbCXscmW42QoIvjy+Dg5u8SgmZGpYHciucmudou@lists.infradead.org
X-Gm-Message-State: AFuF++nUXRj512icXSSrBUvjViK2ah/EGxeS7/cZqnNjrn53afhibWid
	hcmakhFRwKfstg73eCF+wgQRFjt2FI65iP1jDmixFBPsZ4hYbWBWQuQu
X-Gm-Gg: AYBFou2d1MznNyopQn3/wXRNFIfc9U5EAXEtFqQmcAT5NXMcZHxV2Acpw/tqVGM3mmX
	u+kPJdrtEURa28KxA/1e57/8FdzvTVFV5u8KKFnyb3lgiA9zMAX20l9Gh6DCtddmMLIdFoEmyRG
	WYSgedHZEEMYybH1KsxgPrxyKiuLFN+othlAZC2gGa5N87qKq5fB6Puh2bi8MRwwpIg/DvRB7Jf
	78FyUHdWwnKxoUkiu4VROohyaAvMN3KYbcmWIWtkDyLNaltclKBseoja7tNtbTNLxXByr6tCZSN
	HZz7BTa/GLtFYjUv9iq3Hw94+RrWJvVUzoOoi1iUaJSgP1SVMPmaPTdG3RCen2WAxxa0ciWEDm6
	OjPfO8hxEpddfqBG3PRiHtmN35wD55ukGd4Qut9sV+30B6rfdb/l/VFgogYkaWlu0EyC9RiEAGA
	Z1ROz9lzkze+w8TTdvLani9lc15yvAxkiJlAiE9VFNnR5+0YAw6Fsb9WcFN4QD/bnGYHIgypQhB
	Bdn4by60nhzvFqgMfQgkEkuXuzc7//5NIww3G/j5VNejcmMHZuZT92XOplMMWW/il//KFCIt4aU
	kOKU
X-Received: by 2002:a17:903:4501:b0:2da:f7ad:cfea with SMTP id d9443c01a7336-2db126679c3mr222996345ad.8.1788782633459;
        Mon, 07 Sep 2026 05:03:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:03:53 -0700 (PDT)
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
Subject: [PATCH 3/7] ASoC: mediatek: mt8188: mt8188-afe-clk: Propagate regmap update errors
Date: Mon,  7 Sep 2026 19:03:06 +0700
Message-ID: <20260907120310.135693-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_050354_544669_31A725F3 
X-CRM114-Status: GOOD (  11.22  )
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

The return values from regmap_update_bits() are currently ignored
by the clock and AFE control functions.
Propagate the errors to allow callers to handle regmap update
failures.

Fixes: f6b026479b13 ("ASoC: mediatek: mt8188: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
index ecba13eda440..77511f6fba41 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
@@ -564,9 +564,7 @@ static int mt8188_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned int cg_ty
 	unsigned int mask = get_top_cg_mask(cg_type);
 	unsigned int val = get_top_cg_on_val(cg_type);
 
-	regmap_update_bits(afe->regmap, reg, mask, val);
-
-	return 0;
+	return regmap_update_bits(afe->regmap, reg, mask, val);
 }
 
 static int mt8188_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type)
@@ -575,9 +573,7 @@ static int mt8188_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_t
 	unsigned int mask = get_top_cg_mask(cg_type);
 	unsigned int val = get_top_cg_off_val(cg_type);
 
-	regmap_update_bits(afe->regmap, reg, mask, val);
-
-	return 0;
+	return regmap_update_bits(afe->regmap, reg, mask, val);
 }
 
 int mt8188_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
@@ -617,14 +613,12 @@ int mt8188_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
 
 static int mt8188_afe_enable_afe_on(struct mtk_base_afe *afe)
 {
-	regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x1);
-	return 0;
+	return regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x1);
 }
 
 static int mt8188_afe_disable_afe_on(struct mtk_base_afe *afe)
 {
-	regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x0);
-	return 0;
+	return regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x0);
 }
 
 static int mt8188_afe_enable_a1sys(struct mtk_base_afe *afe)
-- 
2.43.0


