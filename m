Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389EE109317E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 05:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5b+AvpbAhrlw+l0BVotlT16dih7xoXzrmNNvcHP2DhY=; b=U1BQ1bqdlZhNTULyD1j7nGYzK8
	ig5in8JIbzivLYebW3X1SVyEQvhAXYu59CPMHlpWTSYk+DnNTmBMApG0EXuAw7KE59RBpl1Aq1Ubo
	0farOEDna86GXF3eoSzxwBuakYNzahBa+U+Y9UZ6jitRqhiDXIivRPqqMCyQKvvYwbe94VcwiCl39
	/ZADDrfKtwtEt0jppcFp4aWp7WTFU7yRPTyXdKfbdF2KPjcRpJdEqIV7Az+f7i3A9GeJCVyS3za1D
	mrQ/ERjzQbf6fzzuVwebBBPDzoOSclUEcY5kDwCBI2o0M6Ny90VxqaP7/atRaDafrt9l8sOI4sKYY
	vgAHjVXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ShK-0000000C72K-1Fzw;
	Fri, 20 Mar 2026 05:47:02 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ShG-0000000C6zr-29Sq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 05:46:59 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 20 Mar
 2026 13:46:40 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 20 Mar 2026 13:46:40 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Fri, 20 Mar 2026 13:46:36 +0800
Subject: [PATCH v3 2/4] iio: adc: Enable multiple consecutive channels
 based on model data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260320-adc-v3-2-bc0eac04ef7c@aspeedtech.com>
References: <20260320-adc-v3-0-bc0eac04ef7c@aspeedtech.com>
In-Reply-To: <20260320-adc-v3-0-bc0eac04ef7c@aspeedtech.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<morris_mao@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773985600; l=1731;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=NmmhJK7uvUVre1uvvr5Vjz5lKqP/DkupFhrPhytp+BM=;
 b=gjpKlIm9OA6WHPNLApb+1XgFzo7WUdGq9UT4iOA2UGLsak9TbZYPWpTilmInbAtps5oQztHh0
 5xUT1/v5ZAlDgV06+pcVwoPjla6BPWGia5EpXe9BoSVfqmeYFm13uVZ
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_224658_563227_12668E09 
X-CRM114-Status: GOOD (  11.09  )
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
 drivers/iio/adc/aspeed_adc.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 8eebaa3dc534..3ff24474f394 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -123,6 +123,24 @@ struct aspeed_adc_data {
 	struct adc_gain		battery_mode_gain;
 };
 
+/*
+ * Enable multiple consecutive channels starting from channel 0.
+ * This creates a bitmask for channels 0 to (num_channels - 1).
+ * For example: num_channels=3 creates mask 0x0007 (channels 0,1,2)
+ */
+static inline u32 aspeed_adc_channels_mask(unsigned int num_channels)
+{
+	if (num_channels > 16)
+		return GENMASK(15, 0);
+
+	return BIT(num_channels) - 1;
+}
+
+static inline unsigned int aspeed_adc_get_active_channels(const struct aspeed_adc_data *data)
+{
+	return data->model_data->num_channels;
+}
+
 #define ASPEED_CHAN(_idx, _data_reg_addr) {			\
 	.type = IIO_VOLTAGE,					\
 	.indexed = 1,						\
@@ -612,7 +630,9 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	/* Start all channels in normal mode. */
 	adc_engine_control_reg_val =
 		readl(data->base + ASPEED_REG_ENGINE_CONTROL);
-	adc_engine_control_reg_val |= ASPEED_ADC_CTRL_CHANNEL;
+	FIELD_MODIFY(ASPEED_ADC_CTRL_CHANNEL, &adc_engine_control_reg_val,
+		     aspeed_adc_channels_mask(aspeed_adc_get_active_channels(data)));
+
 	writel(adc_engine_control_reg_val,
 	       data->base + ASPEED_REG_ENGINE_CONTROL);
 

-- 
2.34.1


