Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0588F30298
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 03:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZq94bRpo7cGkttwyFmGsJCg1SQgg/xbvhSZBlF7Ta0=; b=O0RCIcy6CSEnfyFNFyciH/ij1l
	cyy5MutKX6z88SOxpykOxq1cGpznNJs8IqQYEuQUtJ74megauQsm5AXv5zNe2bxg1z4ZbtScJP8Qq
	eAFZzGOqTnUJ3aBJq9sl7fJYnisOyBJevJDzxIFNKF2fZnCTaUMtVY2rEVvR5C/ToGk1hGZwF8L7S
	87pVZmoKQ9f/d8q/uBNimNS8+dSshS6BOed7KlfDPdZboNSgUk5mNY+NnEY/TxHodHn5UH4DNkAoJ
	r8MsOH7KcMfaVU6eXGKCjv8ztWaXlgqsFbUuFWGoxDE4bnUGCCWCA72WO5mBgyLvnPESJiAqfjyH6
	wjWx3ZPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1yCY-00000003F4O-2oYj;
	Mon, 16 Mar 2026 03:01:06 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1yCV-00000003F1K-0Qmh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 03:01:04 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 16 Mar
 2026 11:00:47 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 16 Mar 2026 11:00:47 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Mon, 16 Mar 2026 11:00:47 +0800
Subject: [PATCH v2 2/3] iio: adc: Enable multiple consecutive channels
 based on model data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260316-adc-v2-2-21475a217b09@aspeedtech.com>
References: <20260316-adc-v2-0-21475a217b09@aspeedtech.com>
In-Reply-To: <20260316-adc-v2-0-21475a217b09@aspeedtech.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<morris_mao@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773630047; l=2441;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=rESyvr9FI4k+pXWuBtBd2BjqM1Hm5GV8Bt0NdXlFyLU=;
 b=wCLeoY6AJwRWGyZ1g6zFZX4s/XiFltkM0W8fkuHXuM4R27q8k+whENeJ0ChcMS3z7I/N2jwWp
 DVR6/UOGxzzBOujREyHpD2AHRU8pjL7ulY08ZsbltKXMEKLLN+gHfFl
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_200103_164438_691FEFB6 
X-CRM114-Status: GOOD (  13.49  )
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

Add helpers to generate channel masks and enable multiple ADC channels
according to the device model's channel count.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/iio/adc/aspeed_adc.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index af9a95d31d81..81a2dd752541 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -72,6 +72,29 @@
 #define ASPEED_ADC_BAT_SENSING_ENABLE		BIT(13)
 #define ASPEED_ADC_CTRL_CHANNEL			GENMASK(31, 16)
 #define ASPEED_ADC_CTRL_CHANNEL_ENABLE(ch)	FIELD_PREP(ASPEED_ADC_CTRL_CHANNEL, BIT(ch))
+
+/*
+ * Enable multiple consecutive channels starting from channel 0.
+ * This creates a bitmask for channels 0 to (num_channels - 1).
+ * For example: num_channels=3 creates mask 0x0007 (channels 0,1,2)
+ */
+static inline u32 aspeed_adc_channels_mask(unsigned int num_channels)
+{
+	if (num_channels == 0)
+		return 0;
+	if (num_channels >= 16)
+		return GENMASK(15, 0);
+	return GENMASK(num_channels - 1, 0);
+}
+
+/*
+ * Helper function to enable multiple channels in the control register
+ */
+static inline u32 aspeed_adc_enable_channels(unsigned int num_channels)
+{
+	return FIELD_PREP(ASPEED_ADC_CTRL_CHANNEL, aspeed_adc_channels_mask(num_channels));
+}
+
 /* Battery sensing is typically on the last channel */
 #define ASPEED_ADC_BATTERY_CHANNEL		7
 
@@ -123,6 +146,11 @@ struct aspeed_adc_data {
 	struct adc_gain		battery_mode_gain;
 };
 
+static inline unsigned int aspeed_adc_get_active_channels(const struct aspeed_adc_data *data)
+{
+	return data->model_data->num_channels;
+}
+
 #define ASPEED_CHAN(_idx, _data_reg_addr) {			\
 	.type = IIO_VOLTAGE,					\
 	.indexed = 1,						\
@@ -610,9 +638,10 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 
 	aspeed_adc_compensation(indio_dev);
 	/* Start all channels in normal mode. */
-	adc_engine_control_reg_val =
-		readl(data->base + ASPEED_REG_ENGINE_CONTROL);
-	adc_engine_control_reg_val |= ASPEED_ADC_CTRL_CHANNEL;
+	adc_engine_control_reg_val = readl(data->base + ASPEED_REG_ENGINE_CONTROL);
+	adc_engine_control_reg_val |=
+		aspeed_adc_enable_channels(aspeed_adc_get_active_channels(data));
+
 	writel(adc_engine_control_reg_val,
 	       data->base + ASPEED_REG_ENGINE_CONTROL);
 

-- 
2.34.1


