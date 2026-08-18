Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E07C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 10:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=shmmSGcBhVr0mO/l9YtNu+PS04UbaQ1RsT84Z7QOJuU=; b=RdZS9f26pFR/fZfLvj/ZBoyxQo
	Hauc1GAk9lJe1k++aRM8C9Wpxz6000/MHL358QNS3E4Saj+XQPOeAfL5SUzWFoFVbWjde6wfNKnGt
	qyN6jV5Dj6vkr813WHDHbMQFBb1sCzSxw7V4jpSROCKAoRDKPCmisfAWsUI6GkpUohnmKOIHXWYXS
	1dF82AlbdPs27I10pTluEf0GNDxIta1vQI04CVW5zZzigk0mrM3wwDWJxc6ALZ9BY1TihCX+6C6Jt
	aP04zAK4jnLedIJCiz7OxU/lyxKDcz1CqJJ8kAEJAZJsuTMEmgwcUDJKQindNmFrOuuqw6HORDpQY
	w6rRnCUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHKF-00000007mOr-2YR1;
	Tue, 18 Aug 2026 10:45:47 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHKB-00000007mN1-439T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 10:45:45 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3811f512167so6216519a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 03:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787049943; x=1787654743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=shmmSGcBhVr0mO/l9YtNu+PS04UbaQ1RsT84Z7QOJuU=;
        b=SLQGjG1/MDXg+CthXB6aHgDePCifgz5NyK/DewJPkvOXOVBhK9CFJk4rJg/cApp81P
         IWxgN53Sa0dT+K4tAt0RipCW3NCrnSUeQ3CHeYW4Ne48uxyWK7dF0o2///+XTeXLMiaK
         hEVcTZEwGoizi3aiDmuBrjeGU5DJ3AwA5JFaYzL+o95gbCTdIcQgSYlDEXmTXvOgRCYD
         L2slIL6I3llxxeqdFRAqpQQg7BkPAPrSVdiqf9L+UihjSl3lV1z6k0o0xS1hC2Hy3/gh
         f6Gal6Nb15u1xiTIXvOK4QwiaRSRJWT3w5rpSJgZWY41f1RB+NMu+QkCZA24oN7G/1Xh
         4dKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049943; x=1787654743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=shmmSGcBhVr0mO/l9YtNu+PS04UbaQ1RsT84Z7QOJuU=;
        b=OmG0F2hLn5t3dRLDifbRBUfxTRpKJ5eiPAW+7pb2Nxn9nfYQqMLi+EAW+MVSskGZ81
         23uH5/+R+VLfLIBwrsKQNUisByjvGmJBw517GK4XW0jqr3oKIa9JT41m0WkcGJzGl+Zy
         Kv+HL3EzQQYJ2JWYZqT1ReCqbvkmtnfaAmXMph9PZtCqg1IIaOXjXnE6JxgrMXHpmWlI
         jUxK0memTB0YzEjFKLINGEsrKM6DfpFOVWkN2PBE59ghVNAG8ShTGRJmDWq3Dk5fpXYM
         jDZ3i1L+oIKROI80w2iKUDMFnsOsitabzJ1CG7uCa2u4tly626CxT5t4dJ5/brATYHn3
         JCdw==
X-Forwarded-Encrypted: i=1; AHgh+RqB6WQdMnq3ngVkQiVIsfG2nzdqgGzNVqSwxxt4UI1D17kHbPEzXWCdh5GSsAXOQ/LkGVt2qYKwRb1SBh2I3U61@lists.infradead.org
X-Gm-Message-State: AOJu0YwJupesWFYtMPQvBIzhY7sRukxsw3PXqyYQhsDIufnPiEoZS+An
	BR75uUhsxj6BsR2LQELny4773+GfJvkM+v+GWlLMAtGp3W+uEo4umDSc
X-Gm-Gg: AR+sD13dRzIowPyaImhafO49Ql5T+MeNTh0WlTCXFBbjgqSprid404ak4rYu8/eDGE3
	6YVFq90KUOrLPXDCpoXToBjKZRKrLitaCCR3eP1Vzw+JFuEqcGgoR6HxpT9GQ+AQBY6FYKqgPzv
	dQmCRWOnExaSLf0/qKiJk1LsgIRlPUX8Jjz4y9VlWdej3nRKRiwM+S3vu1h3YhkhjinHAelbggi
	e8CAsMjpWp4Awcd2rN1QPh0zzu4wqwY1/TZ8mRIsHA2p1PI5LQBCkQXF7KncttATtUWT3NmcoMb
	AS2xp2GqgUF8D7nlTDT5OrX63HEBwgW+/+MN01qUM442CRz28yQY6NWC9Esb63dqoLWKaWjSCbJ
	pLCH+dUfGQJ880WcTbT/FnJrvUAFDdit86Oim/sUW8kNzeMuWdbhYODqVWj60/LSVIwlEGyEPCc
	WGFvZE6nSbVXbIxVizZp3CEx94xgBmO+FxkX25ojH2Y6bMCGevVs2mvRboTFB3O5ezHCvBccXyo
	EPbgO/NyQ2tKXriWYfa4F3cf46eYzb/UzBcj7Nc3WL3dfXIOaoaF1Q+hsPTp9zpocoKLPIQt1TU
	v9PN
X-Received: by 2002:a17:90b:3f47:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-3955a774dbfmr9754597a91.9.1787049942887;
        Tue, 18 Aug 2026 03:45:42 -0700 (PDT)
Received: from phuc-desktop.. ([14.160.25.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267bf83fb2sm15056847eec.19.2026.08.18.03.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:45:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt7986: Drop redundant probe error messages
Date: Tue, 18 Aug 2026 17:45:26 +0700
Message-ID: <20260818104526.37904-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_034544_028225_448243B1 
X-CRM114-Status: GOOD (  14.69  )
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

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c  | 8 ++++----
 sound/soc/mediatek/mt7986/mt7986-dai-etdm.c | 2 +-
 sound/soc/mediatek/mt7986/mt7986-wm8960.c   | 4 +---
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c b/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
index 7a6ad9116e55..e7ecb2761b4d 100644
--- a/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
+++ b/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
@@ -334,7 +334,7 @@ static int mt7986_init_clock(struct mtk_base_afe *afe)
 
 	ret = devm_clk_bulk_get(afe->dev, afe_priv->num_clks, afe_priv->clks);
 	if (ret)
-		return dev_err_probe(afe->dev, ret, "Failed to get clocks\n");
+		return ret;
 
 	return 0;
 }
@@ -414,7 +414,7 @@ static int mt7986_afe_runtime_resume(struct device *dev)
 
 	ret = clk_bulk_prepare_enable(afe_priv->num_clks, afe_priv->clks);
 	if (ret)
-		return dev_err_probe(afe->dev, ret, "Failed to enable clocks\n");
+		return ret;
 
 	if (!afe->regmap || afe_priv->pm_runtime_bypass_reg_ctl)
 		return 0;
@@ -484,7 +484,7 @@ static int mt7986_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* initial audio related clock */
 	ret = mt7986_init_clock(afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "Cannot initialize clocks\n");
+		return ret;
 
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
@@ -535,7 +535,7 @@ static int mt7986_afe_pcm_dev_probe(struct platform_device *pdev)
 	ret = devm_request_irq(dev, irq_id, mt7986_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "Failed to request irq for asys-isr\n");
+		return ret;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
diff --git a/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c b/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
index fc55ff47b7bc..49f5b2bf565f 100644
--- a/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
+++ b/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
@@ -124,7 +124,7 @@ static int mtk_dai_etdm_startup(struct snd_pcm_substream *substream,
 
 	ret = clk_bulk_prepare_enable(afe_priv->num_clks, afe_priv->clks);
 	if (ret)
-		return dev_err_probe(afe->dev, ret, "Failed to enable clocks\n");
+		return ret;
 
 	regmap_update_bits(afe->regmap, AUDIO_TOP_CON2, CLK_OUT5_PDN_MASK, 0);
 	regmap_update_bits(afe->regmap, AUDIO_TOP_CON2, CLK_IN5_PDN_MASK, 0);
diff --git a/sound/soc/mediatek/mt7986/mt7986-wm8960.c b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
index f1dc18222be7..4517af9e2d14 100644
--- a/sound/soc/mediatek/mt7986/mt7986-wm8960.c
+++ b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
@@ -135,10 +135,8 @@ static int mt7986_wm8960_machine_probe(struct platform_device *pdev)
 	}
 
 	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to parse audio-routing: %d\n", ret);
+	if (ret)
 		goto err_of_node_put;
-	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
-- 
2.43.0


