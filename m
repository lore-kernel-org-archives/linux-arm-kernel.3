Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42CCC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oH3dvIiif6Ezut/x+NGlXGEkxyluaoU8qD8m7W6CWsI=; b=Y1VVptF+bAMauFtQlHdHxcgtpm
	kFqPCcbsBvGJ5eQlXhzdb8aLpTktkdy4Fjgh53lV+IGFSJhszoYvhqLU7YTeXsyZXdwxnBjNleSRy
	kGW5vyuiBCYRwXxeybYfVyEtNI83fU0T424H/lKK17M9hSG5QiFtYUA9yd2CqiW38c+dVK2+Q85Ho
	lpQHr9FvvCS1dAYUYhWsMt+3L2r20Xd/sMr5kBAoIIJgMWST0QAkBFe7dFlZ86L5hb1vcMBIgnz10
	/YZE7InK1qg3hEHRvLNVy3JWJsSRwCVjwiH4+kj9qS3XpYSyZzbXOWwmmb8tv8J0GGF3M8YpiCiuu
	4YawcLZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwLk-0000000ENrj-3vIU;
	Wed, 15 Jul 2026 09:56:20 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwLi-0000000ENpO-2lbU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 09:56:19 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8453427d3f4so4652780b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 02:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784109378; x=1784714178; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oH3dvIiif6Ezut/x+NGlXGEkxyluaoU8qD8m7W6CWsI=;
        b=jF2eibiJQ5OrhtHpzu54q5a0uq0OpXbH7p8uus1Ts/34ectJJqn9n+FUxk2W0iZ/PW
         PHi3z4uHlaA39MtNxBWrLt8l7RCWO71t7Ji5LX/xQdL5poWqYVpnHYsDmmKCiM7Js3Vj
         ZyPT9kYiY+jTXspQ6x5XhMtdzjaxWtmSiCun6OdU9x8kmBtM2a5Hnb3AaaMqjT19ienn
         muXt4ozkAV5XxMp7jsf3gd2DQvR1bA8307a0n+Al/llRxE4qiVyBFHq9pTnUo7d1/jnF
         +dW7M3uM/dfNyAmcy4Ws7m8CPVhsB1Np3sATcAgJqVUrFZEAvEgFwldDVIXrbXP4Ynry
         VwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109378; x=1784714178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oH3dvIiif6Ezut/x+NGlXGEkxyluaoU8qD8m7W6CWsI=;
        b=HPizfrgT9hY29KIuXvDGU6It4/KS/JA53RYC0NHPB4maU0nFNLj7BHJl/DkatTLFXF
         ulVLuLfq4r08TKaix6hOMoFHZaamFcvdJN45l9ozuFS2oVDsT1a6Rkjd1IO++PzBnWVf
         fyuFGQc4oHpzivT19vax3KUPEFr+aiJ7OpkI77bcyyPXBQ4Ej9c2RlhDw2kCCdRe6fBM
         blLntCzTMw2YXbwPKGNqCPzXDW6bjgzrvAT8iVMaTWLrMxZh32Z3G2GEt0+mUOgUiLSz
         5AYO6KRRpgT5vEE16WHhlE9tie7bFMUp1PmQAZT5ylxfdVhFQpZCc9WzFJWyJ55rbI7Q
         NwHw==
X-Forwarded-Encrypted: i=1; AHgh+RrHOD8eW3v2pMScBRu+PeOcsOOsy+2/b61sa+PNBuQL0ecL1xkohaxVoQUxQx2LPE0cv0nQaxQgpKOFzf/63Wzk@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8owrjHjH6B4ymnifI78Z0CgCmyGduuLXRa8M4vFSXQqYNutnD
	hzK4uP9B8i6ju2TsCUT7vyuAGM9OkjRP6JwkARXi2afMrU4/56U/CBMA
X-Gm-Gg: AfdE7cmwtdfhMhxtwCMJMjIwRNbnhLbWT/7LV+0uqXU6mXtKqeTPweAIFxYWQaKjsRp
	Y2erZ/h2reirhNnbxbyYN8ACKzaS/YNTXdU952WObZdlOhRWoRU1hwjNGpDHNvHWVFs7STQkQGA
	co3L4tU/+xAeYjXHMJx2OWUMkAYl7cjUtiKwvss5xGyIADlqyXrfAM2n6r7uLHJl2g2hCl7fShl
	qUph9yV8MPy+HIXYzH+xdQrp+TWPpeJTGp9iXL7WT5aQKY/OqbZ0l09ls7cpGVJOzXTF2x4pG2J
	5R5bT7Z6MObpdcgyO6h55YDezLTTFzbNKQWpdsXsd01UxUBvz7uWSnhvmO4528nKVkINRNqmj5v
	7g7LIbTgnEGhI468aOP0+1K+gKhmKb60TYtAlU7IIxq3w99dxrZR1Jns1wcEsf6bM3taFop/hvo
	zTVXzUP0guhWELA9Pl1GId3ORBnsKRpQSqVXZtV83lUTipcno=
X-Received: by 2002:aa7:8891:0:b0:847:b2e4:9f68 with SMTP id d2e1a72fcca58-84a671da3aamr1648721b3a.9.1784109377872;
        Wed, 15 Jul 2026 02:56:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm11628908a12.22.2026.07.15.02.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:56:17 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Marcus Cooper <codekipper@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	u.kleine-koenig@baylibre.com,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 5/6] ASoC: sunxi: sun50i-codec-analog: Improve probe error handling
Date: Wed, 15 Jul 2026 16:55:24 +0700
Message-ID: <20260715095525.40668-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715095525.40668-1-phucduc.bui@gmail.com>
References: <20260715095525.40668-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_025618_702684_3C8DB3E8 
X-CRM114-Status: GOOD (  11.51  )
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

Drop the redundant error message after devm_platform_ioremap_resource(),
which already reports failures, and use dev_err_probe() for regmap
initialization errors.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sunxi/sun50i-codec-analog.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sunxi/sun50i-codec-analog.c b/sound/soc/sunxi/sun50i-codec-analog.c
index 9f5b067a8ccc..50c0dee8c433 100644
--- a/sound/soc/sunxi/sun50i-codec-analog.c
+++ b/sound/soc/sunxi/sun50i-codec-analog.c
@@ -551,16 +551,13 @@ static int sun50i_codec_analog_probe(struct platform_device *pdev)
 	bool enable;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base)) {
-		dev_err(&pdev->dev, "Failed to map the registers\n");
+	if (IS_ERR(base))
 		return PTR_ERR(base);
-	}
 
 	regmap = sun8i_adda_pr_regmap_init(&pdev->dev, base);
-	if (IS_ERR(regmap)) {
-		dev_err(&pdev->dev, "Failed to create regmap\n");
-		return PTR_ERR(regmap);
-	}
+	if (IS_ERR(regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(regmap),
+				     "Failed to create regmap\n");
 
 	enable = device_property_read_bool(&pdev->dev,
 					   "allwinner,internal-bias-resistor");
-- 
2.43.0


