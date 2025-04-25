Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991F4C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 21:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2koMhN4hR5KSSnBsIlIFgfxzAiKDp/j1dG+oyh3qTA=; b=3Br0a60sAU/8NPJd3Z1wSHx7PF
	W8s3+oIzkOcVZfxUvGGZGFQrDXyTr5wxNeFNeV1ajTiL/9DllSuPIEVxE8eBf6cpoVParXgNRsMwl
	+Hj6lxRZg03FNRZeRXyLw5ux9mvzOTO2ArP9MBCzFt0Evd7ejk64aAfFFKf2VuqyA/b615l3W4Wl5
	cFZ+NZkSPzxX37WM5OHE2B1rinMQL5SPW7hSCcUtdI3OOtvGVHkccO1ryAYWFUFENdlWyeO1TD36D
	SsZfeRYQQXlzyrtDsTxPYjbFTGsntr/5hFn8DVEIZ7A8Vrg5tIlWLDWf1uKYF32Z2OcbkGbZ45Q/8
	oI+vsHEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QQs-00000000uOF-32US;
	Fri, 25 Apr 2025 21:18:02 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QIn-00000000tG2-0UCP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 21:09:42 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-72c13802133so709221a34.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 14:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745615380; x=1746220180; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2koMhN4hR5KSSnBsIlIFgfxzAiKDp/j1dG+oyh3qTA=;
        b=btOxC50t4b+L6pOIP3cuBfPC45nT0oQEmn+zaECZ5ty5OYbYSKRnuDPUjHEWkTtZ80
         atq3YpqdHGLSWjEsQgo7HC87TT2OvUn19Un2OZfcBp+dNOy3mQzKecFnOTgtO3mf8Ydn
         EBiaX70RsdbTVyaT66HAx+pcE5K34kNngiOuPg3OeAEAZaGczCcmdr25MzC+6dS+f9fk
         GuG7JRBSLdKF4I2IpLq0mi07wBhGtQphJdGDR4Z504OY1z14i6trmMPqIx2Nor8u7mjL
         emhSWOUE49Qh/8CY6Qp8zAKS4wac/UXA2jGNgEahpWPTMwOAztBeWnfI3t0SW/2Zxi/m
         thlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745615380; x=1746220180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2koMhN4hR5KSSnBsIlIFgfxzAiKDp/j1dG+oyh3qTA=;
        b=kc0Iij0KDuZr0FLlMJXuIwktAkLp2D9DV/Uffb3laxsf3JYLPDpTO9QMyVcRaX0Iw3
         7PQmltWqIXg19pCS6LN3304OfBFeGgvBbQ+Rt9WwU/RkoUfAlP/gcaXTt13N8hV4BH59
         aaQ3PfaCuBXRzaJ4oblc6H3oi1w7B8TklLV4PwKom8UJTZEqe6HP7hdaQLJplC+HJEc/
         dhiqobWIyHZggYwhwaTm7+TWO4kivdP/Z9eLzViDmGGB5G9YC/RL9OMfzr2q9FmGybfr
         1O/FzzQyzJVhurUiEqbfECTi367RjYl5tZmgPDjXZDemMEcvwXv6CLrs50L2uGoS4gf8
         /n8A==
X-Forwarded-Encrypted: i=1; AJvYcCWUQ+o0szIy64Hsb1uwRmULWrpL9wbXD6K+qF3+O4YXiJTwSxxPz5PSE848GI4yj2Wwpu6RNFDAS6ltOoWBMM2T@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx/qL+dmNxv2Ei/RP65k6DxhIzxuuZC1xW6OZvINZsOVLA/u5V
	awSA5cFBsSBDLRBf9pyUxTVxHv5XMhcpAQsr1Rc+r4zaLbkrPtddEuYWQ3w+O0o=
X-Gm-Gg: ASbGncuhLJR5NccbxP4mMQWtklb9tqKcvlbYuVBa2WuEji8eS2dCyz9CLqouMEcrSTl
	jdrYSWRciq8KqdFM2p3nJANTtVX7zWZrqzruy1ZiA/CBxfhCMNGuVANzcDqYjt/pFSYudT1xI81
	MRCvRw7cbIRAF35XvWjDhrjbe2m9D+H6P/wz3dX4sy2BxAtBN0L7TYiPdZwAI36BnzHHbzURG2f
	UAgppSwEmhORQVB1ueMAzFCqvsPCqyS/MPB4m9HVHnqzGxa8gUSnItusATHvvn0j5CqgHisX7wr
	kaLdv8hp+KBQitLyOOVDtZxxZm3f9tzfwU9HI6H+muEh
X-Google-Smtp-Source: AGHT+IGKc5OoUlGqAMHb8DxpInuVuqSVZZrq1V/GWDAa8RVUKrWc/HhQWHVIWR6LgXFCY+EudsWgsg==
X-Received: by 2002:a05:6830:6103:b0:727:423c:95d5 with SMTP id 46e09a7af769-7306507d10cmr827931a34.3.1745615380147;
        Fri, 25 Apr 2025 14:09:40 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:96a3:e28:3f6:dbac])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7304f188052sm847673a34.8.2025.04.25.14.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 14:09:39 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 25 Apr 2025 16:08:44 -0500
Subject: [PATCH v3 2/6] iio: adc: ad4695: use u16 for buffer elements
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-2-f12df1bff248@baylibre.com>
References: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-0-f12df1bff248@baylibre.com>
In-Reply-To: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-0-f12df1bff248@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2149; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=NLK9rHWGxHgHc450e6JA3Kx5J3+N1Fpz21XOi57G4v0=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoC/ntGikd68zhc3eGez4DLRFRcNXynKp9dhqTH
 axf3aMkGNaJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAv57QAKCRDCzCAB/wGP
 wAgDB/0auzgk1L/frm29yKaf4b3PEH/of/+PWSRx7XnDdBIbgId0dZU5fPeSrZtK//pb6MguHyN
 pTTAJcteQG4JB7+lSY0FCltwzuC5VL5jILT78ZTc1OQSZOLlXMv5G/33kUicVLCye+/ZcIXb2Rf
 THjJLuO79tWICuwLYeVk2U0crzcotqLF7rh2Fu//4nJSwLA2M/fdrYuiM4qEDJlOoefh8JF7yzn
 XtNeHkRbFNpzbav0+yO0YJaZcvWqhlO38PygEOGYZx2PqrEf1nCTf0H1GcUW12Q5d2k3VtsuIWJ
 nmljWyL2JcplY+E4L/eTEtrhLk28n0o4NXRxjJBaGpjmBBOr
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_140941_168271_783A12F8 
X-CRM114-Status: GOOD (  16.82  )
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

Change the type of the buffer elements to u16 since we currently only
support 16-bit word size. The code was originally written to also allow
for 32-bit word size when oversampling is enabled, but so far,
oversampling is only implemented when using SPI offload and therefore
doesn't use this buffer.

AD4695_MAX_CHANNEL_SIZE macro is dropped since it no longer adds any
value.

AD4695_MAX_CHANNELS + 2 is changed to AD4695_MAX_CHANNELS + 1 because
previously we were overallocating. AD4695_MAX_CHANNELS is the number of
of voltage channels and + 1 is for the temperature channel.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad4695.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/ad4695.c b/drivers/iio/adc/ad4695.c
index 68c6625db0d75f4cade7cb029e94191118dbcaa0..0c633d43e480d5404074e9fa35f1d330b448f0a2 100644
--- a/drivers/iio/adc/ad4695.c
+++ b/drivers/iio/adc/ad4695.c
@@ -106,8 +106,6 @@
 
 /* Max number of voltage input channels. */
 #define AD4695_MAX_CHANNELS		16
-/* Max size of 1 raw sample in bytes. */
-#define AD4695_MAX_CHANNEL_SIZE		2
 
 enum ad4695_in_pair {
 	AD4695_IN_PAIR_REFGND,
@@ -162,8 +160,8 @@ struct ad4695_state {
 	struct spi_transfer buf_read_xfer[AD4695_MAX_CHANNELS * 2 + 3];
 	struct spi_message buf_read_msg;
 	/* Raw conversion data received. */
-	u8 buf[ALIGN((AD4695_MAX_CHANNELS + 2) * AD4695_MAX_CHANNEL_SIZE,
-		     sizeof(s64)) + sizeof(s64)] __aligned(IIO_DMA_MINALIGN);
+	u16 buf[ALIGN((AD4695_MAX_CHANNELS + 1) * sizeof(u16),
+		      sizeof(s64)) + sizeof(s64)] __aligned(IIO_DMA_MINALIGN);
 	u16 raw_data;
 	/* Commands to send for single conversion. */
 	u16 cnv_cmd;
@@ -660,9 +658,8 @@ static int ad4695_buffer_preenable(struct iio_dev *indio_dev)
 	iio_for_each_active_channel(indio_dev, bit) {
 		xfer = &st->buf_read_xfer[num_xfer];
 		xfer->bits_per_word = 16;
-		xfer->rx_buf = &st->buf[rx_buf_offset];
+		xfer->rx_buf = &st->buf[rx_buf_offset++];
 		xfer->len = 2;
-		rx_buf_offset += xfer->len;
 
 		if (bit == temp_chan_bit) {
 			temp_en = 1;

-- 
2.43.0


