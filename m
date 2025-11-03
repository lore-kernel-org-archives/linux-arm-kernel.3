Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB52CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2iXB5W67n7YO4OssVtAEv8fDCZhOHZ+N8v9CZniUss=; b=hUAm7hkPH4TBfrxvH09xVTJDDe
	iSujlfJzkdHrDg7o1mhtGCZqh7fqEgt1cJZ1Ppl6etCTXJNBroyTSCZG69980NhsKnrhAVoGJm5MC
	r+6ZgJ9q0lu0Y3I3qTBmx/hYnvHycumF6LeO2to9eEOTdNXUyT2Dpv/6/6z0xRGWQzuGmeRuWIF8p
	331XqfjVp2N38kozsk1T6RhT/AG/bUuEKkJsa4bhO2GQXfOghseYLsD1sp+iHT4nJ54UmsMDComsB
	okwsW2t2G+KG/EnRpgSnS4NV1VcbqtBOZj3N9bHljnHLalZzecEdzEb2bOceEtns1vJ7h2ZOFLN2r
	K8QvNs0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFsAm-00000009ftB-2MGz;
	Mon, 03 Nov 2025 10:52:28 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFsAj-00000009fre-3n30
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 10:52:26 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 3 Nov
 2025 18:52:17 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 3 Nov 2025 18:52:17 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <jic23@kernel.org>, <dlechner@baylibre.com>, <nuno.sa@analog.com>,
	<andy@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<billy_tsai@aspeedtech.com>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/2] iio: adc: aspeed: Add AST2700 ADC support
Date: Mon, 3 Nov 2025 18:52:17 +0800
Message-ID: <20251103105217.1764355-2-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251103105217.1764355-1-billy_tsai@aspeedtech.com>
References: <20251103105217.1764355-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_025225_941599_B40CD1DF 
X-CRM114-Status: GOOD (  10.97  )
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

This patch adds support for the ADCs found on the Aspeed AST2700 SoC,
which includes two instances: "ast2700-adc0" and "ast2700-adc1". While
they are functionally similar to those on AST2600, the OTP trimming data
is located at the same offset (0x820), but uses different bitfields.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/iio/adc/aspeed_adc.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 8ab29948214a..9df6e7f68f19 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -646,6 +646,16 @@ static const struct aspeed_adc_trim_locate ast2600_adc1_trim = {
 	.field = GENMASK(7, 4),
 };
 
+static const struct aspeed_adc_trim_locate ast2700_adc0_trim = {
+	.offset = 0x820,
+	.field = GENMASK(3, 0),
+};
+
+static const struct aspeed_adc_trim_locate ast2700_adc1_trim = {
+	.offset = 0x820,
+	.field = GENMASK(7, 4),
+};
+
 static const struct aspeed_adc_model_data ast2400_model_data = {
 	.model_name = "ast2400-adc",
 	.vref_fixed_mv = 2500,
@@ -690,11 +700,35 @@ static const struct aspeed_adc_model_data ast2600_adc1_model_data = {
 	.trim_locate = &ast2600_adc1_trim,
 };
 
+static const struct aspeed_adc_model_data ast2700_adc0_model_data = {
+	.model_name = "ast2700-adc0",
+	.min_sampling_rate = 10000,
+	.max_sampling_rate = 500000,
+	.wait_init_sequence = true,
+	.bat_sense_sup = true,
+	.scaler_bit_width = 16,
+	.num_channels = 8,
+	.trim_locate = &ast2700_adc0_trim,
+};
+
+static const struct aspeed_adc_model_data ast2700_adc1_model_data = {
+	.model_name = "ast2700-adc1",
+	.min_sampling_rate = 10000,
+	.max_sampling_rate = 500000,
+	.wait_init_sequence = true,
+	.bat_sense_sup = true,
+	.scaler_bit_width = 16,
+	.num_channels = 8,
+	.trim_locate = &ast2700_adc1_trim,
+};
+
 static const struct of_device_id aspeed_adc_matches[] = {
 	{ .compatible = "aspeed,ast2400-adc", .data = &ast2400_model_data },
 	{ .compatible = "aspeed,ast2500-adc", .data = &ast2500_model_data },
 	{ .compatible = "aspeed,ast2600-adc0", .data = &ast2600_adc0_model_data },
 	{ .compatible = "aspeed,ast2600-adc1", .data = &ast2600_adc1_model_data },
+	{ .compatible = "aspeed,ast2700-adc0", .data = &ast2700_adc0_model_data },
+	{ .compatible = "aspeed,ast2700-adc1", .data = &ast2700_adc1_model_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, aspeed_adc_matches);
-- 
2.25.1


