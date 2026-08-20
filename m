Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403F9C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 12:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uKRxZy2kSNN7s+copbhEGB2/08qX7fHBu0PpcU+cI4Y=; b=KbDzut49lOvWDrjcmqtUC/pkq+
	6Jc9neUFHfFg2tixqp/hFRkXIjIsT/Bf/NmOP4jfqD3cESx/4ufQLTdwziC+z2jumdZc9rZ8yOCG8
	VrAMle2zmZwhT9rCzjYxILYa4/jD3jVJjTzRQqMSjWaQ9FFATGykQKEaI1BN7UU4A3mgWTSt9cO3p
	6CUPS81zzkuMT6XsB7F4xeH4AVnUhW8HCuhwafxENimL7RS3q8EbJlV5BQtV1fW6EOciwGOr27u12
	yq/7cmIoOrZ3H7Ctju58ejJywZ+LI0WBHuHQM6wU074F+TUnovOsJt9rXhHAmuYz1gF7aROx7zg/S
	GvjW5/aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1qo-0000000BXEE-2xUR;
	Thu, 20 Aug 2026 12:26:30 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1qm-0000000BXCK-0RRZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 12:26:29 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4980dc26022so22286815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 05:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787228786; x=1787833586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uKRxZy2kSNN7s+copbhEGB2/08qX7fHBu0PpcU+cI4Y=;
        b=SKcSViZ6vqD/csrZZpjwyxBaYDWvzrGqoVhPktGC8mPZ9ykSOAmGMoZyHwQS7ughhw
         ZngaVmAxohPsns1do4Hh2IU+4yrnozkOg+8dcxb9IiYBserc5NYFZGcbboWR7mXSdXxH
         BFfbkRK1HR2lUdb5mpCbmQP+HALvcef6QphQXEXczeku3nvPpjQE/zK/JAcIBxr4MN45
         kF0mDoDGnNzN2Ev5TcqpsSZo3a0pGMGSZsGswnRV06WEYCXYR8RIKz4F0n0xtS87DZax
         kJAu76sTdxINPsnlQTkW/ASS9TEC43h0+6/4x1AGW1IrxYa+a7hCgnFT8M10deQw2kTU
         cjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787228786; x=1787833586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uKRxZy2kSNN7s+copbhEGB2/08qX7fHBu0PpcU+cI4Y=;
        b=ScUt4G8+823//G8gN095oFFIEcUISePWSVmPEK3yZNdu0vSqAROHD6RQm2Vj3qs3x3
         9wZi/qTyXGpR2kwR3aflb9cJsXtrQDunnIgHw1HYNodp4EZlrupWHqZuEc3IQ4JxGZar
         7KQOddIwAVYt2MG+uzyF+2XDaMhrvtlgH6IGWDE/CdMGlICD1LlS5weKJGhNNi82jOzN
         bpUP3zAepXC1gxoQVTXJbUKz4/FYPFs2gr20HUCUR7PIirx9BcelPOxH0Z+LyBu/LsZK
         x5u3qKmpWmENWdNBjgONEfgsd0OlNW0EgJxt4eQCjBV+nf/2s0h6GnC1ou55KCqlbaCA
         X2TA==
X-Forwarded-Encrypted: i=1; AHgh+Rr4EKfw/GYKT/wYucYi2piwI+emRkusscRJfY4G9GKVvuwzOUI5fFpXrL7JtakBfyf2ReRJVAKL/mvjIabQcpYD@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3YVF0KyIKbkCeZfSl6GT+Lc/JD/Mhkfa9ZrFK/SoRIH+PptD+
	GxSFhqX4GtzWF0HSwSuvI7xKUQYX0LBjB1y2x+TzuSvwTuvxmJmMlxgO
X-Gm-Gg: AR+sD10RNL8R9gKpydC0+D12FIMI37CYfnO2C8fzQz+SlPTWSHe5LaHsZrGfyBfPiAY
	Er4whG82sRjUWZG2EEt32akOd/kjj/O3w+9HmP+yElnC/PRUnC7V1Q0QHrsYQcNdUF+GJ5LWurL
	w9KoTKYrpF4vUZmqS12eZufkZyJCs79bJBCgC17AiSQQ5INY1Q5QR2rI8R0YnapkYyUc6XRNvdL
	cUsghRz3DxKbYS4fkMR8aBvf+fxdu+Z3O/YB8qgepoK2dz0y71/bg6HEbZLws++figq7HMNGh24
	v8VHOjPffW1Y7ey2YduHxBTvz/yhJobe0eQ1fkbLx18k5XFV98BsQMig+y0UIuys3GDCtvEslgm
	6UWer6GhsTWZ3zz0Lz3npGA2iMOJgQPfcCfJoofOVm89AwUciOIUopsAC00Lgbcwgg2QIzYTYIV
	OKNIdOdKmxDZFlQ4LSsHW5MOMRKKM0FxA1eeYUaTulOLEgVX9GLADBcg==
X-Received: by 2002:a05:600c:4e8e:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-499aa17dd15mr187045085e9.2.1787228786074;
        Thu, 20 Aug 2026 05:26:26 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499ab2a8b34sm170494645e9.8.2026.08.20.05.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:26:25 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v9 4/9] mfd: mt6397: Use MFD_CELL_* to describe sub-devices
Date: Thu, 20 Aug 2026 14:20:02 +0200
Message-ID: <20260820122242.120039-5-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820122242.120039-1-l.scorcia@gmail.com>
References: <20260820122242.120039-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_052628_190473_EC972DDB 
X-CRM114-Status: GOOD (  13.30  )
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

Use the MFD_CELL_* macros to describe sub-devices. No functional changes.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mfd/mt6397-core.c | 197 ++++++++++++--------------------------
 1 file changed, 63 insertions(+), 134 deletions(-)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 1bdacda9a933..ccd97d66d7f1 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -124,159 +124,88 @@ static const struct resource mt6323_pwrc_resources[] = {
 };
 
 static const struct mfd_cell mt6323_devs[] = {
-	{
-		.name = "mt6323-rtc",
-		.num_resources = ARRAY_SIZE(mt6323_rtc_resources),
-		.resources = mt6323_rtc_resources,
-		.of_compatible = "mediatek,mt6323-rtc",
-	}, {
-		.name = "mt6323-regulator",
-		.of_compatible = "mediatek,mt6323-regulator"
-	}, {
-		.name = "mt6323-led",
-		.of_compatible = "mediatek,mt6323-led"
-	}, {
-		.name = "mt6323-keys",
-		.num_resources = ARRAY_SIZE(mt6323_keys_resources),
-		.resources = mt6323_keys_resources,
-		.of_compatible = "mediatek,mt6323-keys"
-	}, {
-		.name = "mt6323-pwrc",
-		.num_resources = ARRAY_SIZE(mt6323_pwrc_resources),
-		.resources = mt6323_pwrc_resources,
-		.of_compatible = "mediatek,mt6323-pwrc"
-	},
+	MFD_CELL_OF("mt6323-rtc", mt6323_rtc_resources, NULL, 0, 0,
+		    "mediatek,mt6323-rtc"),
+	MFD_CELL_OF("mt6323-regulator", NULL, NULL, 0, 0,
+		    "mediatek,mt6323-regulator"),
+	MFD_CELL_OF("mt6323-led", NULL, NULL, 0, 0,
+		    "mediatek,mt6323-led"),
+	MFD_CELL_OF("mt6323-keys", mt6323_keys_resources, NULL, 0, 0,
+		    "mediatek,mt6323-keys"),
+	MFD_CELL_OF("mt6323-pwrc", mt6323_pwrc_resources, NULL, 0, 0,
+		    "mediatek,mt6323-pwrc"),
 };
 
 static const struct mfd_cell mt6328_devs[] = {
-	{
-		.name = "mt6328-regulator",
-		.of_compatible = "mediatek,mt6328-regulator"
-	}, {
-		.name = "mt6328-keys",
-		.num_resources = ARRAY_SIZE(mt6328_keys_resources),
-		.resources = mt6328_keys_resources,
-		.of_compatible = "mediatek,mt6328-keys"
-	},
+	MFD_CELL_OF("mt6328-regulator", NULL, NULL, 0, 0,
+		    "mediatek,mt6328-regulator"),
+	MFD_CELL_OF("mt6328-keys", mt6328_keys_resources, NULL, 0, 0,
+		    "mediatek,mt6328-keys"),
 };
 
 static const struct mfd_cell mt6357_devs[] = {
-	{
-		.name = "mt6359-auxadc",
-		.of_compatible = "mediatek,mt6357-auxadc"
-	}, {
-		.name = "mt6357-regulator",
-	}, {
-		.name = "mt6357-rtc",
-		.num_resources = ARRAY_SIZE(mt6357_rtc_resources),
-		.resources = mt6357_rtc_resources,
-		.of_compatible = "mediatek,mt6357-rtc",
-	}, {
-		.name = "mt6357-sound",
-		.of_compatible = "mediatek,mt6357-sound"
-	}, {
-		.name = "mt6357-keys",
-		.num_resources = ARRAY_SIZE(mt6357_keys_resources),
-		.resources = mt6357_keys_resources,
-		.of_compatible = "mediatek,mt6357-keys"
-	},
+	MFD_CELL_OF("mt6359-auxadc", NULL, NULL, 0, 0,
+		    "mediatek,mt6357-auxadc"),
+	MFD_CELL_NAME("mt6357-regulator"),
+	MFD_CELL_OF("mt6357-rtc", mt6357_rtc_resources, NULL, 0, 0,
+		    "mediatek,mt6357-rtc"),
+	MFD_CELL_OF("mt6357-sound", NULL, NULL, 0, 0,
+		    "mediatek,mt6357-sound"),
+	MFD_CELL_OF("mt6357-keys", mt6357_keys_resources, NULL, 0, 0,
+		    "mediatek,mt6357-keys"),
 };
 
 /* MT6331 is always used in combination with MT6332 */
 static const struct mfd_cell mt6331_mt6332_devs[] = {
-	{
-		.name = "mt6331-rtc",
-		.num_resources = ARRAY_SIZE(mt6331_rtc_resources),
-		.resources = mt6331_rtc_resources,
-		.of_compatible = "mediatek,mt6331-rtc",
-	}, {
-		.name = "mt6331-regulator",
-		.of_compatible = "mediatek,mt6331-regulator"
-	}, {
-		.name = "mt6332-regulator",
-		.of_compatible = "mediatek,mt6332-regulator"
-	}, {
-		.name = "mt6331-keys",
-		.num_resources = ARRAY_SIZE(mt6331_keys_resources),
-		.resources = mt6331_keys_resources,
-		.of_compatible = "mediatek,mt6331-keys"
-	},
+	MFD_CELL_OF("mt6331-rtc", mt6331_rtc_resources, NULL, 0, 0,
+		    "mediatek,mt6331-rtc"),
+	MFD_CELL_OF("mt6331-regulator", NULL, NULL, 0, 0,
+		    "mediatek,mt6331-regulator"),
+	MFD_CELL_OF("mt6332-regulator", NULL, NULL, 0, 0,
+		    "mediatek,mt6332-regulator"),
+	MFD_CELL_OF("mt6331-keys", mt6331_keys_resources, NULL, 0, 0,
+		    "mediatek,mt6331-keys"),
 };
 
 static const struct mfd_cell mt6358_devs[] = {
-	{
-		.name = "mt6359-auxadc",
-		.of_compatible = "mediatek,mt6358-auxadc"
-	}, {
-		.name = "mt6358-regulator",
-		.of_compatible = "mediatek,mt6358-regulator"
-	}, {
-		.name = "mt6358-rtc",
-		.num_resources = ARRAY_SIZE(mt6358_rtc_resources),
-		.resources = mt6358_rtc_resources,
-		.of_compatible = "mediatek,mt6358-rtc",
-	}, {
-		.name = "mt6358-sound",
-		.of_compatible = "mediatek,mt6358-sound"
-	}, {
-		.name = "mt6358-keys",
-		.num_resources = ARRAY_SIZE(mt6358_keys_resources),
-		.resources = mt6358_keys_resources,
-		.of_compatible = "mediatek,mt6358-keys"
-	},
+	MFD_CELL_OF("mt6359-auxadc", NULL, NULL, 0, 0,
+		    "mediatek,mt6358-auxadc"),
+	MFD_CELL_OF("mt6358-regulator", NULL, NULL, 0, 0,
+		    "mediatek,mt6358-regulator"),
+	MFD_CELL_OF("mt6358-rtc", mt6358_rtc_resources, NULL, 0, 0,
+		    "mediatek,mt6358-rtc"),
+	MFD_CELL_OF("mt6358-sound", NULL, NULL, 0, 0,
+		    "mediatek,mt6358-sound"),
+	MFD_CELL_OF("mt6358-keys", mt6358_keys_resources, NULL, 0, 0,
+		    "mediatek,mt6358-keys"),
 };
 
 static const struct mfd_cell mt6359_devs[] = {
-	{
-		.name = "mt6359-auxadc",
-		.of_compatible = "mediatek,mt6359-auxadc"
-	},
-	{ .name = "mt6359-regulator", },
-	{
-		.name = "mt6359-rtc",
-		.num_resources = ARRAY_SIZE(mt6358_rtc_resources),
-		.resources = mt6358_rtc_resources,
-		.of_compatible = "mediatek,mt6358-rtc",
-	},
-	{ .name = "mt6359-sound", },
-	{
-		.name = "mt6359-keys",
-		.num_resources = ARRAY_SIZE(mt6359_keys_resources),
-		.resources = mt6359_keys_resources,
-		.of_compatible = "mediatek,mt6359-keys"
-	},
-	{
-		.name = "mt6359-accdet",
-		.of_compatible = "mediatek,mt6359-accdet",
-		.num_resources = ARRAY_SIZE(mt6359_accdet_resources),
-		.resources = mt6359_accdet_resources,
-	},
+	MFD_CELL_OF("mt6359-auxadc", NULL, NULL, 0, 0,
+		    "mediatek,mt6359-auxadc"),
+	MFD_CELL_NAME("mt6359-regulator"),
+	MFD_CELL_OF("mt6359-rtc", mt6358_rtc_resources, NULL, 0, 0,
+		    "mediatek,mt6358-rtc"),
+	MFD_CELL_NAME("mt6359-sound"),
+	MFD_CELL_OF("mt6359-keys", mt6359_keys_resources, NULL, 0, 0,
+		    "mediatek,mt6359-keys"),
+	MFD_CELL_OF("mt6359-accdet", mt6359_accdet_resources, NULL, 0, 0,
+		    "mediatek,mt6359-accdet"),
 };
 
 static const struct mfd_cell mt6397_devs[] = {
-	{
-		.name = "mt6397-rtc",
-		.num_resources = ARRAY_SIZE(mt6397_rtc_resources),
-		.resources = mt6397_rtc_resources,
-		.of_compatible = "mediatek,mt6397-rtc",
-	}, {
-		.name = "mt6397-regulator",
-		.of_compatible = "mediatek,mt6397-regulator",
-	}, {
-		.name = "mt6397-codec",
-		.of_compatible = "mediatek,mt6397-codec",
-	}, {
-		.name = "mt6397-clk",
-		.of_compatible = "mediatek,mt6397-clk",
-	}, {
-		.name = "mt6397-pinctrl",
-		.of_compatible = "mediatek,mt6397-pinctrl",
-	}, {
-		.name = "mt6397-keys",
-		.num_resources = ARRAY_SIZE(mt6397_keys_resources),
-		.resources = mt6397_keys_resources,
-		.of_compatible = "mediatek,mt6397-keys"
-	}
+	MFD_CELL_OF("mt6397-rtc", mt6397_rtc_resources, NULL, 0, 0,
+		    "mediatek,mt6397-rtc"),
+	MFD_CELL_OF("mt6397-regulator", NULL, NULL, 0, 0,
+		    "mediatek,mt6397-regulator"),
+	MFD_CELL_OF("mt6397-codec", NULL, NULL, 0, 0,
+		    "mediatek,mt6397-codec"),
+	MFD_CELL_OF("mt6397-clk", NULL, NULL, 0, 0,
+		    "mediatek,mt6397-clk"),
+	MFD_CELL_OF("mt6397-pinctrl", NULL, NULL, 0, 0,
+		    "mediatek,mt6397-pinctrl"),
+	MFD_CELL_OF("mt6397-keys", mt6397_keys_resources, NULL, 0, 0,
+		    "mediatek,mt6397-keys"),
 };
 
 struct chip_data {
-- 
2.43.0


