Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357DDC02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 18:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DqV/FjhJj9DUjcirvqGcRVZyK8YP06tY6pUQMoRMhuw=; b=wVz9H3MvN8ZzvtL+zu7gK5P3Gb
	YRA6S0ZQ7PwLqmJIjCVmf7HmVfc5OZdMWtl3W2VcogFYqrRcFnHb/nazNvj/0Tw687TGa2Q50q4P3
	KfOPorvKGrhYXlHKttG1zpEHIzZQcwlAqTKJgwOHM2uMs65Ursj1OVWSjaUX1ww8Hw4AcO6OtwKpb
	L9cOqn4pijVU6rJG2QWlZuTtvXGeFemkgHty74OMRRUOeqA3p0vgGx0x2v+3P3JONktJOc0TTW2C6
	ZS7xuynuJpa6zWUYidIw89hhiNPexmIi49bEzCZzeZIIUVZ5n9ades02aeywc3bm6fp+qHpLhEFaP
	R5KQweSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZwrO-00000006GyG-3pml;
	Mon, 20 Jan 2025 18:50:54 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZwos-00000006GZo-08yZ;
	Mon, 20 Jan 2025 18:48:19 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3863494591bso2597145f8f.1;
        Mon, 20 Jan 2025 10:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737398896; x=1738003696; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DqV/FjhJj9DUjcirvqGcRVZyK8YP06tY6pUQMoRMhuw=;
        b=clKQVeRbefqSw6tJS+q7t1ba2aSPpCLVoISr9C+ADoNIZPaEcbiMOdm9Jv6dHs5rFO
         SummAMAcVFpb0vGROOH7V2Nzr/wrmEoS/Dz7JwopFiZ1H+E1UdOcR6Ai5ojD/VIWYTJB
         VSAJ22t/P+Um6VKUVGw0kDUuC7b0fxReKbge+6kievfmv1+pcND4+c3L+1hEqo3bHsZm
         gGpDvWljvkBSCuQ7BX+nreleLq49Rg2u7ZNe6TRs8qTL6ezal+bDQf1KbGAGNh4ZjxO7
         uIo9StuLrNPCPpXRk+Vt3gJh0zp9gWY7vyseSD//huUwwqJU6Wm90SQJ7hK8vG7I37aC
         j/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737398896; x=1738003696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DqV/FjhJj9DUjcirvqGcRVZyK8YP06tY6pUQMoRMhuw=;
        b=LR4g+5JUE0rbtuqkXm7PpJ9GtQVYnW9hfEHydsZNN+mZhVUwK/L9JwTOZtySbH41i+
         HqZF6phDXQb8XOTsfLFVjvbmjm6ytUPKneyeVDhxhlB3y0D2XbOKgn6rrlBhA3uTLi0I
         dKmMXxa0QosD1iMIXV13QU/as29gcZCCyv1PBKPZzJwqqKD5ieY14oU3kIFjYKLAZjim
         zb1CouttB8Bsh5OpSBSWMWlYymIy3fhTTFqmDu9Id3Imq1qJJ7NIig31YIXuulb9DGGM
         HDCpoMrkbeaTxju3OgLgKCgqqaRsX+jmAKfcYxUryKmihUsoKC+jneIGMpioHI2X9cO2
         41GA==
X-Forwarded-Encrypted: i=1; AJvYcCU/KzQo1PkASajs4uji5sdxQzD4/4if0hyJ8TI1O3+P8we53JqvwCGS6xhE25uj5bVHQah1mLZVAzw63rq7jp8r@lists.infradead.org, AJvYcCVxM6oZ/aHtQhUn2RblAXm/xUbGQIkQznzPXKpGRsDYsakbBc7D+gClgfjmYsF57Z9uwnSgc7FfjzfXDcUe5hk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6iypQ5H/TvPfaMnZo7kuq/p+5QC+K7cdGtOHQuKTiD+u2gPp3
	NdxkOMSjbh+dniNS9YD7CFWuIsSobnogLPeOVTVC4QucBgWSTQU+
X-Gm-Gg: ASbGncsUFyZ9GeKzVyauI6uFEDO8edcK7xDB4d7gvZS8JYnGJpkzyOcIOZX1/RRwnf7
	CS1To3nEOfXlvMS83NoIXERzZEg/VOqM2aE2CPJzAJdWIQvAK71sodu3XshlSKI0iSxpvJI27bm
	wDnXqX+rGB8lQyukkEErdfTGcFwyogvVEf7fHdBHxYlWIYl4hGQUNsnTXhb1JujrIsK0aA9svlw
	qT58d48S83RjQ8Ldoje8unttKgLsZlPEU+b+BqHwAeymJPjVm5tGYlAo1tk+5G+Z8u6zXIhlnHV
	v2KOdMaTN7VJjllW5Y5iwUeEXpRqEvFdmLeso/U=
X-Google-Smtp-Source: AGHT+IH9PM2GibsFcQmyWQQGrxcXpJ+kncPmt3vY8dQwqwdzD60YCwZnKsd2BQmHXXaTAhz6p7SP5A==
X-Received: by 2002:a05:6000:1f85:b0:38b:e32a:109d with SMTP id ffacd0b85a97d-38bf59e1d83mr11668430f8f.34.1737398896238;
        Mon, 20 Jan 2025 10:48:16 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38bf3215023sm11095390f8f.9.2025.01.20.10.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 10:48:15 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	upstream@airoha.com
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 2/2] mmc: mtk-sd: add support for AN7581 MMC Host
Date: Mon, 20 Jan 2025 19:47:02 +0100
Message-ID: <20250120184728.18325-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250120184728.18325-1-ansuelsmth@gmail.com>
References: <20250120184728.18325-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_104818_078780_7BA6D181 
X-CRM114-Status: GOOD (  19.13  )
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

Add support for AN7581 MMC Host. The MMC Host controller is based on
mt7622 with the difference of not having regulator supply and state_uhs
pins and hclk clock.

Some minor fixes are applied to check if the state_uhs pins are defined
and make hclk optional for the new airoha compatible.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Drop redundant if condition where regulator is not supported
- Correctly set pin in msdc_ops_switch_volt

 drivers/mmc/host/mtk-sd.c | 59 +++++++++++++++++++++++++++++----------
 1 file changed, 45 insertions(+), 14 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index efb0d2d5716b..f76f20502409 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -666,6 +666,20 @@ static const struct mtk_mmc_compatible mt8196_compat = {
 	.support_new_rx = true,
 };
 
+static const struct mtk_mmc_compatible an7581_compat = {
+	.clk_div_bits = 12,
+	.recheck_sdio_irq = true,
+	.hs400_tune = false,
+	.pad_tune_reg = MSDC_PAD_TUNE0,
+	.async_fifo = true,
+	.data_tune = true,
+	.busy_check = true,
+	.stop_clk_fix = true,
+	.stop_dly_sel = 3,
+	.enhance_rx = true,
+	.support_64g = false,
+};
+
 static const struct of_device_id msdc_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-mmc", .data = &mt2701_compat},
 	{ .compatible = "mediatek,mt2712-mmc", .data = &mt2712_compat},
@@ -680,7 +694,7 @@ static const struct of_device_id msdc_of_ids[] = {
 	{ .compatible = "mediatek,mt8183-mmc", .data = &mt8183_compat},
 	{ .compatible = "mediatek,mt8196-mmc", .data = &mt8196_compat},
 	{ .compatible = "mediatek,mt8516-mmc", .data = &mt8516_compat},
-
+	{ .compatible = "airoha,an7581-mmc", .data = &an7581_compat},
 	{}
 };
 MODULE_DEVICE_TABLE(of, msdc_of_ids);
@@ -1614,12 +1628,15 @@ static int msdc_ops_switch_volt(struct mmc_host *mmc, struct mmc_ios *ios)
 			return ret;
 		}
 
-		/* Apply different pinctrl settings for different signal voltage */
-		if (ios->signal_voltage == MMC_SIGNAL_VOLTAGE_180)
-			pinctrl_select_state(host->pinctrl, host->pins_uhs);
-		else
-			pinctrl_select_state(host->pinctrl, host->pins_default);
 	}
+
+	/* Apply different pinctrl settings for different signal voltage */
+	if (!IS_ERR(mmc->supply.vqmmc) &&
+	    ios->signal_voltage == MMC_SIGNAL_VOLTAGE_180)
+		pinctrl_select_state(host->pinctrl, host->pins_uhs);
+	else
+		pinctrl_select_state(host->pinctrl, host->pins_default);
+
 	return 0;
 }
 
@@ -1699,7 +1716,9 @@ static void msdc_enable_sdio_irq(struct mmc_host *mmc, int enb)
 				dev_dbg(host->dev, "SDIO eint irq: %d!\n", host->eint_irq);
 			}
 
-			pinctrl_select_state(host->pinctrl, host->pins_uhs);
+			/* Skip setting uhs pins if not supported */
+			if (host->pins_uhs)
+				pinctrl_select_state(host->pinctrl, host->pins_uhs);
 		} else {
 			dev_pm_clear_wake_irq(host->dev);
 		}
@@ -2816,9 +2835,12 @@ static int msdc_of_clock_parse(struct platform_device *pdev,
 	if (IS_ERR(host->src_clk))
 		return PTR_ERR(host->src_clk);
 
-	host->h_clk = devm_clk_get(&pdev->dev, "hclk");
-	if (IS_ERR(host->h_clk))
-		return PTR_ERR(host->h_clk);
+	/* AN7581 SoC doesn't have hclk */
+	if (!device_is_compatible(&pdev->dev, "airoha,an7581-mmc")) {
+		host->h_clk = devm_clk_get(&pdev->dev, "hclk");
+		if (IS_ERR(host->h_clk))
+			return PTR_ERR(host->h_clk);
+	}
 
 	host->bus_clk = devm_clk_get_optional(&pdev->dev, "bus_clk");
 	if (IS_ERR(host->bus_clk))
@@ -2926,10 +2948,13 @@ static int msdc_drv_probe(struct platform_device *pdev)
 		return PTR_ERR(host->pins_default);
 	}
 
-	host->pins_uhs = pinctrl_lookup_state(host->pinctrl, "state_uhs");
-	if (IS_ERR(host->pins_uhs)) {
-		dev_err(&pdev->dev, "Cannot find pinctrl uhs!\n");
-		return PTR_ERR(host->pins_uhs);
+	/* AN7581 doesn't have state_uhs pins */
+	if (!device_is_compatible(&pdev->dev, "airoha,an7581-mmc")) {
+		host->pins_uhs = pinctrl_lookup_state(host->pinctrl, "state_uhs");
+		if (IS_ERR(host->pins_uhs)) {
+			dev_err(&pdev->dev, "Cannot find pinctrl uhs!\n");
+			return PTR_ERR(host->pins_uhs);
+		}
 	}
 
 	/* Support for SDIO eint irq ? */
@@ -3010,6 +3035,12 @@ static int msdc_drv_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "Cannot ungate clocks!\n");
 		goto release_clk;
 	}
+
+	/* AN7581 without regulator require tune to OCR values */
+	if (device_is_compatible(&pdev->dev, "airoha,an7581-mmc") &&
+	    !mmc->ocr_avail)
+		mmc->ocr_avail = MMC_VDD_32_33 | MMC_VDD_33_34;
+
 	msdc_init_hw(host);
 
 	if (mmc->caps2 & MMC_CAP2_CQE) {
-- 
2.47.1


