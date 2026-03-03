Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB34EB3659
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 02:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=la8uvUv1qO8zP+Ss4g/iC0LJ7sZtMGgACg8BJ3Lah6s=; b=VsiVTJPd15VxHhDGP33GhLnXXA
	Sup1mO15dY1nHQ5xUC60ofg+YL0mFXRXp1R1/cnInOpEoeYWcgSG+KoYKV+hHwSbli1Ti01LHlv4+
	Lr/w/ZjoXGTmwedgOoCrUvwJvBB32XctgEalrhVZN7WWoZf9OrkFi6R4bmngJsv7f5+8PSWQ/zzSF
	zh6vf1e/LXTIfEyO8O4onxBJ3AGr8qnz5uFFe6UvG40kRwJaTZXGbATlTLdJerp2VL6jUHPT+pV6b
	nzvAAO1PstII/ilXD1U2NkYXBPGCTgbrqXvm35UAhzvwtvHIxyazVCtlNGoZo4cSPrSSwE8U7gTiX
	7eoqA3xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxFec-0000000EPgg-0QmV;
	Tue, 03 Mar 2026 02:38:34 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxFea-0000000EPgB-2AM5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 02:38:33 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 3 Mar
 2026 10:38:25 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 3 Mar 2026 10:38:25 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Tue, 3 Mar 2026 10:38:26 +0800
Subject: [PATCH v3] iio: adc: aspeed: clear reference voltage bits before
 configuring vref
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260303-adc-v3-1-10570f23d3ce@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIAKFJpmkC/zWMQQqDMBBFryKzbiRR0xpXvUcpJSaTOqBGklBax
 Lt3KHT1efDf2yFjIswwVDskfFGmuDK0pwrcZNcnCvLM0MjmLFvZCuud6C6ox+BDb5wBfm4JA71
 /ldudOaS4iDIltH9XK9n0Unc8tTK601xSYqR5/jxKtnS1eUP0Bd1Uu7jAcXwB6v/QJ5oAAAA=
X-Change-ID: 20260303-adc-47e5bfdf89c9
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	<linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772505505; l=1172;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=vyRSNAFGP/y8QafqAEY2QSHcXxBy39wt1+hBkhXUcbY=;
 b=21ac4yo0r6x7x/tJeAkxkZ/VU17Pf2KeA7eGaRWUcCnyEzaf6AgHmYvSx46CZcRbHG9+9xTDI
 iIB0a/DyuZPBd77hGpNz0mL20hh8AiqGWmJl1NIBVIHQH/1TBW3bccp
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_183832_559980_C24821A4 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
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

Ensures the reference voltage bits are cleared in the ADC engine
control register before configuring the voltage reference. This
avoids potential misconfigurations caused by residual bits.

Fixes: 1b5ceb55fec2 ("iio: adc: aspeed: Support ast2600 adc.")
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
Changes in v3:
- Added the missing Fixes: tag

Changes in v2:
- Remove Gerrit Change-Id's
---
 drivers/iio/adc/aspeed_adc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 4be44c524b4d..83a9885b9ae4 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -415,6 +415,7 @@ static int aspeed_adc_vref_config(struct iio_dev *indio_dev)
 	}
 	adc_engine_control_reg_val =
 		readl(data->base + ASPEED_REG_ENGINE_CONTROL);
+	adc_engine_control_reg_val &= ~ASPEED_ADC_REF_VOLTAGE;
 
 	ret = devm_regulator_get_enable_read_voltage(data->dev, "vref");
 	if (ret < 0 && ret != -ENODEV)

---
base-commit: af4e9ef3d78420feb8fe58cd9a1ab80c501b3c08
change-id: 20260303-adc-47e5bfdf89c9

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


