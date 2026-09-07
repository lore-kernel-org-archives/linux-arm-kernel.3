Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866E4C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 12:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5w7cNdqAAPAfRdm2XbkiqT/MAUxRyfM6lBKgPA3/pXM=; b=Ma+diLhTBnoW7SZ8Gc936G2Bf/
	wPHlgcy95iqkpih6Z4YxkrpBfNgn4vN9LxaLIz/o4gCqrrzoJfPnU5RlRDWED+cl7gBEKomuhDLyI
	rScVCBsgtBSpVgaNfvTZ18p5/0aao5va66RZsAqu+8COCqRwZ3MKzOhIM1YBP4ViNsmTWSq/75A26
	mu2PNRYcs/3cBsDG++ukS0/XFLPcXFrTnqTY9zqA+KWsffI4+rsz4kln4uc6sjR0owGivEaLUSCVk
	9xuteGvfpDugif11thM9K9oiwzYDKamG0ZRyfwrzlVXmdAitUYGBxNxuFKxvJArhGSlEt+wO34H82
	c1VUpxVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y50-00000006ka3-0Kv7;
	Mon, 07 Sep 2026 12:04:06 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y4x-00000006kWP-3GpE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 12:04:04 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2d91ff7d9acso29016095ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 05:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782643; x=1789387443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5w7cNdqAAPAfRdm2XbkiqT/MAUxRyfM6lBKgPA3/pXM=;
        b=HONxEV5NT71ynQ7/mzzzGq2JVH79nxVhbtvcFDLzcLHr9LZX4pVPyUjR2NN6LgrG01
         PmdPK24VdD4z9bGfIjsAS5OE0sDvmUmjHlmsqGXjgIpKx8fJiOUgMsGSGUQNjasu9CRT
         fcRv+GbU3Bl7Px2EtXyG3eBx6nDMCJCOvOavciA9XH3xIsL5U8TToZyWgVwePagios1O
         bndVUIRPxUiL/xLoGaBxssBAgsOJ81+14uvzo1CReGVsFdz/IYe2Vf3W/AnWQxVreAYP
         OQiPjnuhd7rq5Ehmhs8c6mTVKotd7LAi46hVXnmD7mN69ke2liVk6ePf8rZPmcq0FBHz
         BwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782643; x=1789387443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5w7cNdqAAPAfRdm2XbkiqT/MAUxRyfM6lBKgPA3/pXM=;
        b=P3O3Gq77a8scVlogZAugnNZ0W7IfydUAJ6WfNHU2RnFqcZZsTtAQ9rgv9l8Rf/J1Mo
         tXw/fGSVPJIfvZaGjYqFS7S1VPi88jSVOV6bkFgvVAzmSbhyDMvXAPEtJRQKJZzHpARW
         ZuE7vdeEiai7EIejLwwxh9zMzHVHRL08iF4hxtgGCkLp0IcrzPBVmrWY/qzNywpaeba5
         Q0Fb5d/G0tq5Z0S7boWHe28TZhyDbb6VGPINNwQmkrAoonaw4+PoHn5rJi/nFj13vB+o
         V8QFKlDKuh2KKXU69qwtwkZUJI/WH38uowPRxrqb8eBUAlvjAyqh5AXlio7zgrkY7Y47
         cudA==
X-Forwarded-Encrypted: i=1; AKwUvBwZ+scwHuRkIFaUsGZHVYjMcUWyPYhfgPch7mDZIP9cXInfTz2ur9WYKHSfIGjCuhnf6bGolysAwdieOLLDSDRr@lists.infradead.org
X-Gm-Message-State: AFuF++nLRgJh3whUywhJURq1BDNaCLP+NWelnHb7sdSFQDfM4w97e2Y5
	oH6wpgVjIMxSMIx8oVgRw5uzdh5NJaCAiaMgpXKuTx0790daK54mU0pg
X-Gm-Gg: AYBFou0iX2yHZxPNwX6NUSfBkLCW40GaySB1hEg7q378msROOYw1sC9iATQdHC9nfRx
	MvikhQzaBtk1hCnbs4AmMNEpaPUc/OOp4/IKmJFirR+PGSlHnauZjodcLCvh/dqigjtzjxN5D7P
	SVAgtMBPiMQ3fBQ+symgp1NMrU3t4mAGSkUt6RSxpHU5JXpBjLoAG9bEFzobkPQc/fZOCJFVvyF
	UbEeqhbMHJqMx2zRPaEsO/pTTEsw8zkjZb4y4sOTmpJya0kKZh0Q9VbRGPUA0mHi25wihq0MT3Y
	iKNmkeZJgWIkbeTpRUZP8xfbgSRGTWz4ME4OBQSr8xoHCe7hnjlFNKt4BgXRy/xwWxI6kL0pv7v
	Hjiis88Qf9DZD9Om2N7wBjM/2tiLu4zHmaRZIbl/+g7E1n6nxWmyLcxfmiUYgCfoD7k0H4YY620
	LhjaFe/oq6mXz/sJC4l9FbY1/VmRxUGuY4RrrFRZG+3/qxKpstLjPBkjZnHsLemxdqNGgGkRlQx
	0cgd9r28S2l4SZfCZPnyHKqEem+u4tDSlVPNWPnKuL70tyVllAWgApLKsBZvRStVKWKhsbUwyhU
	vO6E
X-Received: by 2002:a17:903:1a4e:b0:2db:39da:90f4 with SMTP id d9443c01a7336-2db39da9336mr157104885ad.6.1788782642761;
        Mon, 07 Sep 2026 05:04:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:04:02 -0700 (PDT)
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
Subject: [PATCH 5/7] ASoC: mediatek: mt8188: mt8188-afe-pcm: Handle runtime resume errors
Date: Mon,  7 Sep 2026 19:03:08 +0700
Message-ID: <20260907120310.135693-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_050403_839360_567338C3 
X-CRM114-Status: GOOD (  13.20  )
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

Errors from clock enable and regcache synchronization are currently
ignored during runtime resume.
Check the return values from mt8188_afe_enable_reg_rw_clk(),
regcache_sync(), and mt8188_afe_enable_main_clock(), and abort the
runtime resume if any of them fails.
On failure, disable the previously enabled reg_rw clocks and restore
the regmap to cache-only mode.

Fixes: bf106bf09376 ("ASoC: mediatek: mt8188: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 7b1f5d05f4d6..f8cbe7bac36d 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3030,22 +3030,33 @@ static int mt8188_afe_runtime_resume(struct device *dev)
 	struct mtk_base_afe *afe = dev_get_drvdata(dev);
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
 	struct arm_smccc_res res;
+	int ret;
 
 	arm_smccc_smc(MTK_SIP_AUDIO_CONTROL,
 		      MTK_AUDIO_SMC_OP_DOMAIN_SIDEBANDS,
 		      0, 0, 0, 0, 0, 0, &res);
 
-	mt8188_afe_enable_reg_rw_clk(afe);
+	ret = mt8188_afe_enable_reg_rw_clk(afe);
+	if (ret)
+		return ret;
 
 	if (!afe->regmap || afe_priv->pm_runtime_bypass_reg_ctl)
-		goto skip_regmap;
+		return 0;
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret)
+		goto err;
+
+	ret = mt8188_afe_enable_main_clock(afe);
+	if (ret)
+		goto err;
 
-	mt8188_afe_enable_main_clock(afe);
-skip_regmap:
 	return 0;
+err:
+	mt8188_afe_disable_reg_rw_clk(afe);
+	regcache_cache_only(afe->regmap, true);
+	return ret;
 }
 
 static int init_memif_priv_data(struct mtk_base_afe *afe)
-- 
2.43.0


