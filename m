Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3738CC02185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 08:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rfc7yHRU9A77/4BsuDwrRLLhbG0qYCnEUsOYkaHwtVM=; b=qvdpE8ICf0HulITdtAB2aMKPT7
	Z3c7+k6/qEWgv27cOKqsyW/BvIGs0T7xI1QgRpkkb6y2dMTz4L89shwSuYQ0Wj18rWgrEFVDaoISr
	tJeqhDrBEPklbiGGQA3bHYLZeIQXzXLlDdPbEgK5T0UOla+enQ7KyABT0xtT7/ljnsGtVTPAkYyiT
	bdi+shuLavOb+2cLTGVKyBYvWiQSzk8seWvyXOr/0UNDlqgaqWCIcVUyfKqBGu3csVhzb6KwtiGhV
	di2Iu9MPHBOmiRfvOEWRae79Tw1xf9IXRdu+Hoq/qCxVwl/4V7EhV85ILm4vzucHL3Z9l+lQd4USl
	iSV5WYnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXypE-0000000B6VR-0ETX;
	Wed, 15 Jan 2025 08:32:32 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxrc-0000000AwZm-1nXL;
	Wed, 15 Jan 2025 07:30:57 +0000
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43634b570c1so45264135e9.0;
        Tue, 14 Jan 2025 23:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736926254; x=1737531054; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfc7yHRU9A77/4BsuDwrRLLhbG0qYCnEUsOYkaHwtVM=;
        b=KlL1LBrg3iPwt20xZ+IdqbzwkSAeKs9BvoqzbwT4jzRDUTlf/W20+pQULMerl4q+lD
         nz2m+JcTQVQ6kPW9EOb4zzZKzZr3rQHQdj84oxegL+jDNDwt7HCenR4xmpfWzcxRuR2I
         fGeCsgPYSNc3+DZX1T9xAeZxfVI94qYeqLms0ckm3w4xoEttuZSjnGLRCRVHqH/4orzx
         782b/szuzWW18PvV1bryWRMwEf3Gxrn5jG032WEXyMNJc2D5XiOOm18KUPUQF7/e3JhO
         GuWxjKRkbN3kBm/u0oAkmXq0epqyyXJdMBjQ6A7p2wZQ1n5PMJxpZWmao8jJg/TrCs0Q
         a+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736926254; x=1737531054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfc7yHRU9A77/4BsuDwrRLLhbG0qYCnEUsOYkaHwtVM=;
        b=qnC2Vogl4A3CNdCjM2n57fm9IT5u/VoQAtIiAsCH/xPa8JcnfsnrNBUVCGn685Z/o5
         csd/28EmoNYjh6TDVH0lLCddeYSSpxSofFxkfcILRb+WDZaWXgU1nHM07QfGF3ZhcnA4
         JzRmr3J7SMAB02mYf7YHFKml/e4MEADjE1Hbli7FdzqS506HcOQ976UnneuhlTwIfewx
         o3bZMRdAI0wy1eRfaqMbW3mVDEyYlj2nZUDRf8vV+dGrE6Nz+BLYsJKDzyc21ZLCchhV
         DALyBMxzrpgX7Zfsyg+FzVlT7uPUXI+ukXBd+LyQIv97wruRMbaHfofM0d9v4NGGDdUU
         g6tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfuYgnTYOyOQnJlTMvRFlcDAjJICh5tI9edwUj6a5jcSwwM/TrmPmR0PCjUYsMzWImhDjpRu910YlbqlhCXzje@lists.infradead.org, AJvYcCV3D4CYxcF7oU9wdnC0RPQ9WRa+CKmiH0hwg5PKTqVGv5+YOZDRZTn7MLtXSSYrCJ5OmielGJGHPfBuArVruJk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzU+73W8M4aE2AuqWAOpijHgAcr/XUqiqCa75XAkYnIRSNaAWYP
	uHlZ3iQ7T+wYQogUCEqPBshM1+ZMcdq2P1GLCnyUTleMe9/6lOZ2
X-Gm-Gg: ASbGncsE9HQPCZGea2HiBLGk9Jf+vp+8Ig/uY3Q0+1oNjkxU51j5crWywYMaFHSQMGX
	NeiTQghaYi251enmK8cXg8MJlf3cbD3c3//t2GVz1BIyDSSjV1fco89KTli6+JPppBwJVEvUf51
	ryu7Yzz2sc6FJJr1tKr7Kb2zUF2u2nGHZxJf56310XMdECF97HVquc5BoP/dn5OhwAqazKK5PFo
	/cx+qE/8wJ0sjUI7Rusm2WfeeZgLx6ArPhRMeaZQeJGKH/47o21Orwo5QecNnCo/YiRt+9To8TM
	eWx0JMYpWL6hxYlLQnZacgxHfw==
X-Google-Smtp-Source: AGHT+IGfNQA9MdWtZcu0lFIOOfKNshqX7g+GdY8i9HXPqYU4BO9lxCOaxNz5u34Tmlm4uc6Zmf8FEQ==
X-Received: by 2002:a05:600c:510a:b0:434:faa9:5266 with SMTP id 5b1f17b1804b1-436e26adfc9mr244453335e9.13.1736926254141;
        Tue, 14 Jan 2025 23:30:54 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-437c7499932sm13313065e9.7.2025.01.14.23.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 23:30:53 -0800 (PST)
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
Subject: [PATCH 2/2] mmc: mtk-sd: add support for AN7581 MMC Host
Date: Wed, 15 Jan 2025 08:29:51 +0100
Message-ID: <20250115073026.31552-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250115073026.31552-1-ansuelsmth@gmail.com>
References: <20250115073026.31552-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_233056_467539_6AFC6FB6 
X-CRM114-Status: GOOD (  19.55  )
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
 drivers/mmc/host/mtk-sd.c | 55 ++++++++++++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index efb0d2d5716b..9d6868883c91 100644
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
@@ -1600,6 +1614,10 @@ static int msdc_ops_switch_volt(struct mmc_host *mmc, struct mmc_ios *ios)
 	struct msdc_host *host = mmc_priv(mmc);
 	int ret;
 
+	/* Skip setting supply if not supported */
+	if (!mmc->supply.vqmmc)
+		return 0;
+
 	if (!IS_ERR(mmc->supply.vqmmc)) {
 		if (ios->signal_voltage != MMC_SIGNAL_VOLTAGE_330 &&
 		    ios->signal_voltage != MMC_SIGNAL_VOLTAGE_180) {
@@ -1699,7 +1717,9 @@ static void msdc_enable_sdio_irq(struct mmc_host *mmc, int enb)
 				dev_dbg(host->dev, "SDIO eint irq: %d!\n", host->eint_irq);
 			}
 
-			pinctrl_select_state(host->pinctrl, host->pins_uhs);
+			/* Skip setting uhs pins if not supported */
+			if (host->pins_uhs)
+				pinctrl_select_state(host->pinctrl, host->pins_uhs);
 		} else {
 			dev_pm_clear_wake_irq(host->dev);
 		}
@@ -2036,6 +2056,10 @@ static void msdc_ops_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 
 	msdc_set_buswidth(host, ios->bus_width);
 
+	/* Skip regulator if not supported */
+	if (!mmc->supply.vmmc)
+		goto skip_regulator;
+
 	/* Suspend/Resume will do power off/on */
 	switch (ios->power_mode) {
 	case MMC_POWER_UP:
@@ -2071,6 +2095,7 @@ static void msdc_ops_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 		break;
 	}
 
+skip_regulator:
 	if (host->mclk != ios->clock || host->timing != ios->timing)
 		msdc_set_mclk(host, ios->timing, ios->clock);
 }
@@ -2816,9 +2841,12 @@ static int msdc_of_clock_parse(struct platform_device *pdev,
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
@@ -2926,10 +2954,13 @@ static int msdc_drv_probe(struct platform_device *pdev)
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
@@ -3010,6 +3041,12 @@ static int msdc_drv_probe(struct platform_device *pdev)
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
2.45.2


