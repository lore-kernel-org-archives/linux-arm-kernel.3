Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9D2C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 05:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=teLAShLua5VCgT/jcx7hzSu9pxqI7I/30dsuHzraqHI=; b=RBjPcLnBIH74sca2dbHRdRX25y
	fJEqZB0GQS1Ck7Bb0dSpUzVGAT1mihvfVTkhbVBfNm+FV5k1358jHydMRQMjn2f0edvdOsNVQIIV3
	7+P+HD6cJNi4cjAAGko90skLcPit8pgQ5cfKLUVnOBHdzJSNTJazRw+/WFW5myMZHi+DWMH1KT5oe
	01BTjfOet0LXI8G366el/DY2m0ep/T/d5Wle3EmdnVSd6HsnJTq0rXn5braIuCePaswjOOh/zgIUc
	r3Hh2e1t7+n/vFJjVhh5o/ccFiM45NN7165NWrlEjSiUWtyA/V53BkDlJpPM5BEtreXPMYnz0Radd
	IOGZ+m+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkU-0000000GN09-3Kk8;
	Thu, 03 Sep 2026 05:12:30 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkS-0000000GMxN-0tKA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 05:12:29 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-ca12086c06eso1589881a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 22:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412347; x=1789017147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=teLAShLua5VCgT/jcx7hzSu9pxqI7I/30dsuHzraqHI=;
        b=rDwvpwr8taGfO6Lag7FxOw/mHkU+g5WYlHJlkE4PafYB16lh3u3ah5HcjYN+BuqZFL
         FpHhZUnFQ/wLQy90he00Mb7yk6aExeZvHMDyMsmGcktr0S+WQ2xQd9yBixOoHZWPimn8
         g1WkgfVmN7ULy0bL2iBqb3lors7YvNCq4ClGJkiGXTzjdYUUYLjcgsfVRlTWUAZjAL83
         Ej3HtiTyH6u00UkLxjPclN3rNhpMOuWvc2LlXXENVPROlzPgLjkAUer24S5cL6/WxPjv
         e6WXN2r8pr514wjD+d54Y0R0gE6LoeIIY6ojLdPZUaznOpiJtoEvV1kcDu5KSikrLxUa
         tsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412347; x=1789017147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=teLAShLua5VCgT/jcx7hzSu9pxqI7I/30dsuHzraqHI=;
        b=B5C6rtHae2UeF+uK/asXGNFe6jSJ+rbxBe7aYFUTNDmH/XjbP3nuto0TBQnxOeC3tu
         c1GsHSsCNGyhG1C+xcxEFbcksw8LteSmAj5uwtb4413pOpvw++LbuAXEZ3BxU2JtO/WU
         EEKutgo35J4Ws58/yzsWNFCoqYy+H06iJSIDNdW0dd9mbnWlaD6s5DKuui8Sg85LrQe9
         MTJaPJvIwIEBW0H9+dx8nWPoosDIA9Qb9sK0zPBV7HCyy7UW021BubQqKQxcEisrssi5
         pLFRkQgBMoL4qYRnNHsOwJc5cx8Stj2m8xdCPat3Q/8jSVati2h+KVI36i6GmvYpAh+f
         5e0A==
X-Forwarded-Encrypted: i=1; AKwUvByVrLLCb1afqJgjWZLn7wINXitsbtYcwCxAIA0Il0SUBXCuFL4t2mOdaMLYitkrmf4FgoovqKFhlFJs0jPzoAOA@lists.infradead.org
X-Gm-Message-State: AFuF++lQt/2ij0sCeezlTNz69nIYLJzttqd/U+rRfCjXEk/E9WO9E+94
	K0fJpmf6w8YTcUk6R+bOTndgcRMVmVf+Yvlv9/Bsg+MLAkYKfDDx9a/s
X-Gm-Gg: AYBFou2S1WOqodk5Dgz+KCBJkblYzOaMNAg5Oa9psqGbGHHTgcnjaiQJ4gyFSCwxhVc
	B0buzfp1m2HkH1s8v9jjYAplvyr7C1lgFnkBSFzJsKbcu5BRjxJJotMfjvXrlVWhG3UfKnUerxR
	2tIf/K41TWEKPZ0eVnYB62esal2IKoYjTXhM7z3/01O9zDtdYpCpLjmATH3T/XkP4NOVxtbLk/P
	Fv2z4Vml0y8UPahw6ylsI9et8OAM/rITy13CYTlTQly/0MZREKc3iS0/es3ku3J5XN/zzm00gxD
	jCGKdpabGLTdLR60E2KIuFv/QFz4Mr5Uf2wuAbFa+4tdSAkmcmBRvrvhIoSuGcy2fNQHMcl7GFk
	IH/JNMkui8PtGc2jNthYKur8aLCHrocknHKx4kgmYPffpb+5x/JDsctXebjKYeVrIyQHc+YSy6B
	fIdTpEqxmO3P+cWeanNY2fCNa9ITQZRsVQjpI98IyxRaP8nQQ4VDqYsurqLIUQ665WKLdU0DPKy
	NwLTbFWNiqQa951j61HXUrVbaIPwVncJgpVnvUtYs1/6MA8+pV4yPtgo/nGeHEi4X+RvVB5FXZ/
	Fni5m/Jc3XsR+bs=
X-Received: by 2002:a17:90b:520f:b0:398:9c00:29e9 with SMTP id 98e67ed59e1d1-39aee1b72e5mr16164501a91.17.1788412347415;
        Wed, 02 Sep 2026 22:12:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 4/8] ASoC: mediatek: mt8186: Fix APLL enable error handling
Date: Thu,  3 Sep 2026 12:11:46 +0700
Message-ID: <20260903051150.178057-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903051150.178057-1-phucduc.bui@gmail.com>
References: <20260903051150.178057-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_221228_255833_ABBBE1FE 
X-CRM114-Status: GOOD (  13.25  )
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

Changes in v3:
 - Return directly from apllx_mux_setting() instead of using a goto label

 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 685dc27c7780..77a0cbc8ee24 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -353,7 +353,9 @@ int mt8186_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
 	if (ret) {
@@ -378,9 +380,9 @@ int mt8186_apll1_enable(struct mtk_base_afe *afe)
 	return 0;
 
 err_clk_apll1_tuner:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL1_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
 err_clk_apll22m:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
+	apll1_mux_setting(afe, false);
 
 	return ret;
 }
@@ -406,7 +408,9 @@ int mt8186_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
 	if (ret) {
@@ -431,9 +435,9 @@ int mt8186_apll2_enable(struct mtk_base_afe *afe)
 	return 0;
 
 err_clk_apll2_tuner:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL2_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
 err_clk_apll24m:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
+	apll2_mux_setting(afe, false);
 
 	return ret;
 }
-- 
2.43.0


