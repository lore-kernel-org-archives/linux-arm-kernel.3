Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946DFE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 09:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5lmhyTT2gnZ9bY0N8ST8GSpbytof12mEhpjxb7D+L9U=; b=o+4KXwXnpIXx2cGsmK8ZhdgfDv
	2EhBGue/AJqjWtOFJuuTkqnM3yhp7d/wwMEEkUF51VpXCaDWLGs60qq0xLh6s6lCBbn4vYTX9l2cK
	i5G8eugnMa0aYAiXnlb1tedwLgbBHQQvtuUzZLfW1LWrJjUMOwy/lWEuUg1OH4UIzswImk3O6PKNS
	hG3jS8DQ8d1SVBWEKOGPWm6xJtM7epSDhAsKHhjCsHgwK+05JpeWVgshNLe95dNs+dGYFdpG9XABl
	y6LXOio3b2t1o/qqdYY2qSIytKZdl2E1SuCjifmL2WoPqW6w4PXn/C0r8NHWa/Pdh9PjVvaRB1DZe
	SK2CunnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlko-0000000C3fi-3Pvp;
	Wed, 04 Dec 2024 09:33:06 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlgy-0000000C2fX-1oLW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 09:29:09 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7fcdb53cca6so2113036a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 01:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733304547; x=1733909347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lmhyTT2gnZ9bY0N8ST8GSpbytof12mEhpjxb7D+L9U=;
        b=JJLfAW0j9ZzbJyR5J6nctm9QtlMY2T5fxEvzdEtGCXaV1iXvzQBZr4TBmY2Vdo04LL
         E/466yEx7H6+4dX9rO6faqVws8fFZXsARjfL+SZjzJlRldqWPgQceSrrqkvuhl69Pxsu
         zh42hdwzjiQFC9tEWUEg6v2ODKNOWaMUxwzP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733304547; x=1733909347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5lmhyTT2gnZ9bY0N8ST8GSpbytof12mEhpjxb7D+L9U=;
        b=Xf2plOpGM2zH7/fx9eH5ZOlwgYPyWeqGJMWx2rcqjIBm95Wr2DpT0aQB1LCSg8vF3B
         54CZm+MjyV+cbP/6oxBV6rvREi6x9PUzdr7H8wOcNftfNbGILbf2afHOlDInfsLUZSn5
         pukeYQI+MFtE1DiYz6K2admoCk8YSzSNM5yhruULitGwSWkSzfg2vJBBA0SlbryKetl8
         nzGtATqfKc0/T3jrzDXtkx2cLW8pedHUJnURtRjo19eGSwRsiaIAmK95GszYWuldnt+h
         eS3HNnyV8Rg4Zd9N1gEQ6PXFgG8oXFjekuxkNcjg2B9PJX3uDoyfj62C5EFGB4ntFGad
         xkJg==
X-Forwarded-Encrypted: i=1; AJvYcCUA83pmbqh+5GztMnIK0zLCP1tKNy+kam2/0QcHRZcuNtS/V4WxfwdoJw3IvpNT3VC22U3dEH8iCQ0km0iNawtO@lists.infradead.org
X-Gm-Message-State: AOJu0YyfVxcf3X0j8weW69LDPww5TopBaEk9ALYT1Uydf9TFD9MzByIF
	d1r/oVTJxpnX39rB2jiMoNAsQyI9AQNTYfoSrEOs4BjJ6iLTIucXdFzij0MmWw==
X-Gm-Gg: ASbGnctMe0jokKSVEwBzx4KSAHpMKVc4et8rEfjSqzIMzKiPv+lEgB+sgNqQWshDT+3
	jLAeyeZAxQviV2pRf4hcEVk2XjRPI1Kr4l6mXCUo9bS6A4r+m9A0cm8hxXX+BDnJaCPs2oPGuYA
	RVVN0bd+YWKqpQdndWi+5xlzZ7mVO5VwvkyCY+CmZlPLjWsi392HsYTwXZPHsA2mX2055EanXVj
	iwPdJTaIlCITNlRinpRBfKZEXlkghUte1JbnP824Qri4DbkGBYTJBAn4ix+x3ZXO/xq
X-Google-Smtp-Source: AGHT+IF/J9a4qflcZHiUbg+VHivDCNAN5kL5imj4FjGYpM9OWcUYV3cXUXaClbk0sydJ7WHWfxLZ0A==
X-Received: by 2002:a05:6a20:8407:b0:1db:c20f:2c4d with SMTP id adf61e73a8af0-1e1653a6515mr8672949637.2.1733304547503;
        Wed, 04 Dec 2024 01:29:07 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2eb1:a68a:2625:b944])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d38dbsm11049024a12.15.2024.12.04.01.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 01:29:07 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wenbin Mei <wenbin.mei@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Frank Wunderlich <frank-w@public-files.de>,
	Andy-ld Lu <andy-ld.lu@mediatek.com>
Subject: [PATCH 2/2] mmc: mtk-sd: Limit getting top_base to SoCs that require it
Date: Wed,  4 Dec 2024 17:28:53 +0800
Message-ID: <20241204092855.1365638-3-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241204092855.1365638-1-wenst@chromium.org>
References: <20241204092855.1365638-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_012908_466730_41B6FD89 
X-CRM114-Status: GOOD (  18.77  )
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

Currently the mtk-sd driver tries to get and map the second register
base, named top_base in the code, regardless of whether the SoC model
actually has it or not. This produces confusing big error messages on
the platforms that don't need it:

    mtk-msdc 11260000.mmc: error -EINVAL: invalid resource (null)

Limit it to the platforms that actually require it, based on their
device tree entries, and properly fail if it is missing. There is
no MMC node in the MT6779 dts, so it's currently unknown if that
platform needs it or not.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/mmc/host/mtk-sd.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index e2c385853eef..1bb7044f4ca1 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -414,6 +414,7 @@ struct mtk_mmc_compatible {
 	u8 clk_div_bits;
 	bool recheck_sdio_irq;
 	bool hs400_tune; /* only used for MT8173 */
+	bool needs_top_base;
 	u32 pad_tune_reg;
 	bool async_fifo;
 	bool data_tune;
@@ -587,6 +588,7 @@ static const struct mtk_mmc_compatible mt7986_compat = {
 	.clk_div_bits = 12,
 	.recheck_sdio_irq = true,
 	.hs400_tune = false,
+	.needs_top_base = true,
 	.pad_tune_reg = MSDC_PAD_TUNE0,
 	.async_fifo = true,
 	.data_tune = true,
@@ -627,6 +629,7 @@ static const struct mtk_mmc_compatible mt8183_compat = {
 	.clk_div_bits = 12,
 	.recheck_sdio_irq = false,
 	.hs400_tune = false,
+	.needs_top_base = true,
 	.pad_tune_reg = MSDC_PAD_TUNE0,
 	.async_fifo = true,
 	.data_tune = true,
@@ -653,6 +656,7 @@ static const struct mtk_mmc_compatible mt8196_compat = {
 	.clk_div_bits = 12,
 	.recheck_sdio_irq = false,
 	.hs400_tune = false,
+	.needs_top_base = true,
 	.pad_tune_reg = MSDC_PAD_TUNE0,
 	.async_fifo = true,
 	.data_tune = true,
@@ -2887,9 +2891,13 @@ static int msdc_drv_probe(struct platform_device *pdev)
 	if (IS_ERR(host->base))
 		return PTR_ERR(host->base);
 
-	host->top_base = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(host->top_base))
-		host->top_base = NULL;
+	host->dev_comp = of_device_get_match_data(&pdev->dev);
+
+	if (host->dev_comp->needs_top_base) {
+		host->top_base = devm_platform_ioremap_resource(pdev, 1);
+		if (IS_ERR(host->top_base))
+			return PTR_ERR(host->top_base);
+	}
 
 	ret = mmc_regulator_get_supply(mmc);
 	if (ret)
@@ -2951,7 +2959,6 @@ static int msdc_drv_probe(struct platform_device *pdev)
 	msdc_of_property_parse(pdev, host);
 
 	host->dev = &pdev->dev;
-	host->dev_comp = of_device_get_match_data(&pdev->dev);
 	host->src_clk_freq = clk_get_rate(host->src_clk);
 	/* Set host parameters to mmc */
 	mmc->ops = &mt_msdc_ops;
-- 
2.47.0.338.g60cca15819-goog


