Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12954C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7BpJzZu2JI6YrdHbblIuBNywzFxSYtVh1mg+KZtTDf0=; b=GSx5sKIUIUyc7tHwQbX61a/BCD
	Z/EghAS4w25mWjCB/VlS/NtOAWgNc+idfHKBaSe63jw5PCd/ufS7+q6/LczX+L68NYoIxXEp+o1qa
	n1/4vIt/fgsjFfUy2iykRBoR9gQAxUcLs5lysFwTp9fFJ5+UGymk7Cx5asK7zBqd6IhCyrMTESB1c
	QphRKVgaFebJDwQXrW/CAPYq0OTD1tnFgcVHq/ABC1Dl1ZNbvtDorhCN4g/912kcfZfafqh8lFsVY
	W8IsLR8ecQuMJ59z3OEZuFq0rXeKWq3VRKLjxPf/JNxEe3cO2ZxqWQWajqW6jSJmkUd4R2QimVnCO
	trADqURQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwLN-0000000ENgJ-31ei;
	Wed, 15 Jul 2026 09:55:58 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwLL-0000000ENfm-2ssy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 09:55:56 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c88a4d79ba5so3412220a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 02:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784109355; x=1784714155; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7BpJzZu2JI6YrdHbblIuBNywzFxSYtVh1mg+KZtTDf0=;
        b=RtSLP+DbJxz7kpDjpucIGxRD0Bbwn77oeUIgiZ/RtfwHVyE1MT+cvtukFwRwLqtf+v
         CI2CNkOCreExEGHVv1cs6jF8Udnq/wcfhCXcdb7iA77LmK+Ith8/e0GsB9gmytILbJ7G
         2YWaKwZW/S5iVWGZCN5NVg33LR98snZ4Cuj3BhOPZ7MViZetHlBqquy4+9FVbyknWBKB
         SZWvAR40IJAlAfdEhgqstko15S0gawnCKuhl6Fm8y0RiC1TBr1+nxNpXzcQQK2UCo1Gj
         QznBqpFM8Q3oCN8hddXFRzTYc+X8NfybWIQk9BYoK/xUy3WTO7vJs3Q7TsJDeKMiC36g
         aQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109355; x=1784714155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7BpJzZu2JI6YrdHbblIuBNywzFxSYtVh1mg+KZtTDf0=;
        b=P8X2Wd/H7ol85esbxoPDfgAtJ8o4atEvYR//yz1cmEj8m2gN6hJOJwMlODlas4K9PG
         0FDuL8na/T0CVer8cQnlKQQQXSMeqLwxRCjcQCwh3PLHzd6ELXTNLPX0zPot3onzBkgR
         2eOgWNciM/P5d0K5nfzbw+aU768rUZJYUnoOh0HUTq2IadtCYKm1zliiV0orpubUjvK6
         RTYyVKcma5gHBiqkOjCm0TVl3kV1XktH2He/F7IUP2H5l3j4eLY6SPdAyL/skIyEe1ri
         TyvxmeYDG8AP+3vtP9ETlltytVVTY4me7tPurU3h0Jaf4APYl3cTGTwaYSKRFIojgWHX
         yxsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rruh8uEazqfKQKqrzHeCCrIK+N/ySlPcCSXcF+gleZKS/s3XeeRKE6eYlasqqYlwNKTX6ZgNeIh68eM6f63AMxV@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0OEVOslVqNCbDJsYwCVWuMNbxSEkFJJAh0vsPs6AF0G2MlOHI
	ZawvbTgFMiyaE5TXtUbP+UqSaUttatsXXIskgGVGW8S0netrNHJeMK8U
X-Gm-Gg: AfdE7cnqA6pA543EspXF41CB+/D/3sDKYKHLJAc4R4qDKqgW/AUg4eFQkjHzbJaXPPT
	jpkZ7JF58cnHhGjjudS34baD2x/CJosH8rwLiv2SgWfWjPJodI9q2mhcxIb+c/3ZFN09WFG4n/7
	QA0DgOkp9z+yAvZF79ORXEHxlakEEtdA226lm1O8ggF2gGMItbdaJIMF8goYKVgMiTTBemtW1ct
	3yoxbMhf+KtkqKeI8KsExmUFBKJXdecZUS1i+CPH/KReefdNIFFzf3m0q0bTwWBDYKXo9+yAsXT
	vKNjTuNXo8k+rSu1NG6QOXb2MGo1fHm8Ejo3GFg7qKrQgPG9hVZbgIHebaz6NYAojeJ7LMJrknM
	TG5GcNYF4ndr5vxZaM6f7k+yqdF8l+j8bt+BEF4tVzaJJmtzqfh8b1lgZTsO0TBoalxdrD6TKup
	biE9gtIKewPHPg+BDuYxyBBQKAblvgMJFQ1m00z8O9BHM3XDQ=
X-Received: by 2002:a05:6a20:3d8b:b0:3b4:931c:3c7c with SMTP id adf61e73a8af0-3c357553dfcmr7448713637.44.1784109354620;
        Wed, 15 Jul 2026 02:55:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm11628908a12.22.2026.07.15.02.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:55:54 -0700 (PDT)
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
Subject: [PATCH 1/6] ASoC: sunxi: sun4i-codec: Use dev_err_probe() for probe error handling
Date: Wed, 15 Jul 2026 16:55:20 +0700
Message-ID: <20260715095525.40668-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715095525.40668-1-phucduc.bui@gmail.com>
References: <20260715095525.40668-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_025555_763076_F6043B34 
X-CRM114-Status: GOOD (  13.51  )
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

Use dev_err_probe() for probe error handling to simplify the error paths
and handle -EPROBE_DEFER correctly.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sunxi/sun4i-codec.c | 70 ++++++++++++++---------------------
 1 file changed, 28 insertions(+), 42 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index f4e22af594fa..05308df3ae5b 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -2316,67 +2316,54 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 
 	scodec->regmap = devm_regmap_init_mmio(&pdev->dev, base,
 					       quirks->regmap_config);
-	if (IS_ERR(scodec->regmap)) {
-		dev_err(&pdev->dev, "Failed to create our regmap\n");
-		return PTR_ERR(scodec->regmap);
-	}
+	if (IS_ERR(scodec->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(scodec->regmap),
+				     "Failed to create our regmap\n");
 
 	/* Get the clocks from the DT */
 	scodec->clk_apb = devm_clk_get_enabled(&pdev->dev, "apb");
-	if (IS_ERR(scodec->clk_apb)) {
-		dev_err(&pdev->dev, "Failed to get the APB clock\n");
-		return PTR_ERR(scodec->clk_apb);
-	}
+	if (IS_ERR(scodec->clk_apb))
+		return dev_err_probe(&pdev->dev, PTR_ERR(scodec->clk_apb),
+				     "Failed to get the APB clock\n");
 
 	scodec->clk_module = devm_clk_get(&pdev->dev, "codec");
-	if (IS_ERR(scodec->clk_module)) {
-		dev_err(&pdev->dev, "Failed to get the module clock\n");
-		return PTR_ERR(scodec->clk_module);
-	}
+	if (IS_ERR(scodec->clk_module))
+		return dev_err_probe(&pdev->dev, PTR_ERR(scodec->clk_module),
+				     "Failed to get the module clock\n");
 
 	if (quirks->has_reset) {
 		scodec->rst = devm_reset_control_get_exclusive_deasserted(&pdev->dev, NULL);
-		if (IS_ERR(scodec->rst)) {
-			dev_err(&pdev->dev, "Failed to get reset control\n");
-			return PTR_ERR(scodec->rst);
-		}
+		if (IS_ERR(scodec->rst))
+			return dev_err_probe(&pdev->dev, PTR_ERR(scodec->rst),
+					     "Failed to get reset control\n");
 	}
 
 	scodec->gpio_pa = devm_gpiod_get_optional(&pdev->dev, "allwinner,pa",
 						  GPIOD_OUT_LOW);
-	if (IS_ERR(scodec->gpio_pa)) {
-		ret = PTR_ERR(scodec->gpio_pa);
-		dev_err_probe(&pdev->dev, ret, "Failed to get pa gpio\n");
-		return ret;
-	}
+	if (IS_ERR(scodec->gpio_pa))
+		return dev_err_probe(&pdev->dev, PTR_ERR(scodec->gpio_pa),
+				     "Failed to get pa gpio\n");
+
 
 	scodec->gpio_hp = devm_gpiod_get_optional(&pdev->dev, "hp-det", GPIOD_IN);
-	if (IS_ERR(scodec->gpio_hp)) {
-		ret = PTR_ERR(scodec->gpio_hp);
-		dev_err_probe(&pdev->dev, ret, "Failed to get hp-det gpio\n");
-		return ret;
-	}
+	if (IS_ERR(scodec->gpio_hp))
+		return dev_err_probe(&pdev->dev, PTR_ERR(scodec->gpio_hp),
+				     "Failed to get hp-det gpio\n");
 
 	/* reg_field setup */
 	scodec->reg_adc_fifoc = devm_regmap_field_alloc(&pdev->dev,
 							scodec->regmap,
 							quirks->reg_adc_fifoc);
-	if (IS_ERR(scodec->reg_adc_fifoc)) {
-		ret = PTR_ERR(scodec->reg_adc_fifoc);
-		dev_err(&pdev->dev, "Failed to create regmap fields: %d\n",
-			ret);
-		return ret;
-	}
+	if (IS_ERR(scodec->reg_adc_fifoc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(scodec->reg_adc_fifoc),
+				     "Failed to create regmap fields\n");
 
 	scodec->reg_dac_fifoc = devm_regmap_field_alloc(&pdev->dev,
 							scodec->regmap,
 							quirks->reg_dac_fifoc);
-	if (IS_ERR(scodec->reg_dac_fifoc)) {
-		ret = PTR_ERR(scodec->reg_dac_fifoc);
-		dev_err(&pdev->dev, "Failed to create regmap fields: %d\n",
-			ret);
-		return ret;
-	}
+	if (IS_ERR(scodec->reg_dac_fifoc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(scodec->reg_dac_fifoc),
+				     "Failed to create regmap fields\n");
 
 	/* DMA configuration for TX FIFO */
 	scodec->playback_dma_data.addr = res->start + quirks->reg_dac_txdata;
@@ -2422,10 +2409,9 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 	snd_soc_card_set_drvdata(card, scodec);
 
 	ret = snd_soc_register_card(card);
-	if (ret) {
-		dev_err_probe(&pdev->dev, ret, "Failed to register our card\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to register our card\n");
 
 	return 0;
 }
-- 
2.43.0


