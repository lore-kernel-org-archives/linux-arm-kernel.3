Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BB2E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 11:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8rzjtBuAgsjfEiu6NQ3mIp5ZqWk3WnDSaX6HX0P2HP0=; b=0gBF5WYnCQv/2NzjiRrWEbByxM
	AUdJGoUfd8hK7NPnNiz3rJ8X4qgrZnIAf8WAl1y/oWQ0dXu2GqfLnd7VN2gdbdrVAmpsJFcYcr8xB
	XkxOTBLQT3dYTi9bosQR10TwhVcfgpzOZdbpS+y8JXnM6Ga42vWygYdodKfWMmO9JmQbMxR8XiF2z
	s3XR1huJ33SrFRfospXU7KoyN0zLX14/K4cdbatV3ROV2flhCIwwDSXxzLqNBjl8tGLuM6SxdOXgD
	HdTc9TJlpVwX9iTUNZVZ+UK2icnYbUm988Japxho/hCVYkMV8s7U7WkjhvZNS4Vy/2Y4Ff/nCRii+
	cTwgRoGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTfon-0000000CpZG-3smv;
	Fri, 03 Jan 2025 11:26:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTfjP-0000000CosR-2SiJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 11:20:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7C3875C6300;
	Fri,  3 Jan 2025 11:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C336C4CECE;
	Fri,  3 Jan 2025 11:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735903242;
	bh=uyrlwtQE4rMHn9I5GAmKy1khgpbtrM6HHWX2r3idiWo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Rz5rGoTUUIqZ5wPBXjA5r5mG8d+j9sK8RKMUabtBOHXlDUpL6dzaUo0Od9KSyF3dL
	 nG8KZrUTPySd/ef4wrD0fwGZz2RDAj/T+PWQTbwyxAQjPuqpefSgkEpTOwC/Gk5QuO
	 75IYhzAXie2UxYKtQEbafKMHN49LKT+Gutgt70HIE9WqtMQ/CKi1Oo3L6umxRPf0UC
	 kBbhpX8bBNvhorqs6n5cx4JI4n2Wt0oHejIjEZzUwj1dTicWN8/azjw2BmGNBTsoMB
	 l2R70IGcKj4q5v3jQ/gXLmUOAhcxBd77A38cORiN4WOeH6tcjPXIsBvUkep062DOnR
	 3c8Gsd1LvHeKQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 662ADE77188;
	Fri,  3 Jan 2025 11:20:42 +0000 (UTC)
From: Nayab Sayed via B4 Relay <devnull+nayabbasha.sayed.microchip.com@kernel.org>
Date: Fri, 03 Jan 2025 16:50:40 +0530
Subject: [PATCH] iio: adc: at91-sama5d2_adc: fix sama7g5 realbits value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-fix-sama7g5-adc-realbits-v1-1-1732d265c36a@microchip.com>
X-B4-Tracking: v=1; b=H4sIAAfId2cC/x2MQQqDMBAAvyJ77kISSaN+pfSwmo0uaJRsKQXx7
 4YeB2bmBOUirDA0JxT+isqeK9hHA9NCeWaUWBmccd5Y02KSHyptFGaPFCcsTOsoH8U2pKdLXe9
 8DFDzo3B1/+vX+7puS12KlmoAAAA=
To: Eugen Hristev <eugen.hristev@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Nayab Sayed <nayabbasha.sayed@microchip.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4982;
 i=nayabbasha.sayed@microchip.com; h=from:subject:message-id;
 bh=Za46OdRtTJEi9yRlw0XaUeuB5ttTzM/pmijAikNetGo=;
 b=owGbwMvMwCEmfMj/xNz7ei8ZT6slMaSXn+BIC/gt+P2Y6tTyP2WJ29d7aRSpWzVubtHgv3msc
 eNklUMtHaUsDGIcDLJiiizdm+fPNiz605n5k3MFzBxWJpAhDFycAjARw8UM/3OvJDdr7fi0+UnW
 ux0repqMJm/g5Ha9nsjNX7jxS5e2xBGG/2Vmf8N3/kj4q+227CqX+Yk1Z0oL5pyznaFgyOK57uZ
 BH04A
X-Developer-Key: i=nayabbasha.sayed@microchip.com; a=openpgp;
 fpr=E108A58C09FB2280B0AB41DAE24318EF3B3861A3
X-Endpoint-Received: by B4 Relay for nayabbasha.sayed@microchip.com/default
 with auth_id=304
X-Original-From: Nayab Sayed <nayabbasha.sayed@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_032043_725098_E47D6A54 
X-CRM114-Status: UNSURE (   9.59  )
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
Reply-To: nayabbasha.sayed@microchip.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Nayab Sayed <nayabbasha.sayed@microchip.com>

The number of valid bits in SAMA7G5 ADC channel data register are 16.
Hence changing the realbits value to 16

Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
---
 drivers/iio/adc/at91-sama5d2_adc.c | 68 ++++++++++++++++++++++----------------
 1 file changed, 40 insertions(+), 28 deletions(-)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index 8e5aaf15a921..c3a1dea2aa82 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -329,7 +329,7 @@ static const struct at91_adc_reg_layout sama7g5_layout = {
 #define AT91_HWFIFO_MAX_SIZE_STR	"128"
 #define AT91_HWFIFO_MAX_SIZE		128
 
-#define AT91_SAMA5D2_CHAN_SINGLE(index, num, addr)			\
+#define AT91_SAMA_CHAN_SINGLE(index, num, addr, rbits)			\
 	{								\
 		.type = IIO_VOLTAGE,					\
 		.channel = num,						\
@@ -337,7 +337,7 @@ static const struct at91_adc_reg_layout sama7g5_layout = {
 		.scan_index = index,					\
 		.scan_type = {						\
 			.sign = 'u',					\
-			.realbits = 14,					\
+			.realbits = rbits,				\
 			.storagebits = 16,				\
 		},							\
 		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
@@ -350,7 +350,13 @@ static const struct at91_adc_reg_layout sama7g5_layout = {
 		.indexed = 1,						\
 	}
 
-#define AT91_SAMA5D2_CHAN_DIFF(index, num, num2, addr)			\
+#define AT91_SAMA5D2_CHAN_SINGLE(index, num, addr)			\
+	AT91_SAMA_CHAN_SINGLE(index, num, addr, 14)
+
+#define AT91_SAMA7G5_CHAN_SINGLE(index, num, addr)			\
+	AT91_SAMA_CHAN_SINGLE(index, num, addr, 16)
+
+#define AT91_SAMA_CHAN_DIFF(index, num, num2, addr, rbits)		\
 	{								\
 		.type = IIO_VOLTAGE,					\
 		.differential = 1,					\
@@ -360,7 +366,7 @@ static const struct at91_adc_reg_layout sama7g5_layout = {
 		.scan_index = index,					\
 		.scan_type = {						\
 			.sign = 's',					\
-			.realbits = 14,					\
+			.realbits = rbits,				\
 			.storagebits = 16,				\
 		},							\
 		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
@@ -373,6 +379,12 @@ static const struct at91_adc_reg_layout sama7g5_layout = {
 		.indexed = 1,						\
 	}
 
+#define AT91_SAMA5D2_CHAN_DIFF(index, num, num2, addr)			\
+	AT91_SAMA_CHAN_DIFF(index, num, num2, addr, 14)
+
+#define AT91_SAMA7G5_CHAN_DIFF(index, num, num2, addr)			\
+	AT91_SAMA_CHAN_DIFF(index, num, num2, addr, 16)
+
 #define AT91_SAMA5D2_CHAN_TOUCH(num, name, mod)				\
 	{								\
 		.type = IIO_POSITIONRELATIVE,				\
@@ -666,30 +678,30 @@ static const struct iio_chan_spec at91_sama5d2_adc_channels[] = {
 };
 
 static const struct iio_chan_spec at91_sama7g5_adc_channels[] = {
-	AT91_SAMA5D2_CHAN_SINGLE(0, 0, 0x60),
-	AT91_SAMA5D2_CHAN_SINGLE(1, 1, 0x64),
-	AT91_SAMA5D2_CHAN_SINGLE(2, 2, 0x68),
-	AT91_SAMA5D2_CHAN_SINGLE(3, 3, 0x6c),
-	AT91_SAMA5D2_CHAN_SINGLE(4, 4, 0x70),
-	AT91_SAMA5D2_CHAN_SINGLE(5, 5, 0x74),
-	AT91_SAMA5D2_CHAN_SINGLE(6, 6, 0x78),
-	AT91_SAMA5D2_CHAN_SINGLE(7, 7, 0x7c),
-	AT91_SAMA5D2_CHAN_SINGLE(8, 8, 0x80),
-	AT91_SAMA5D2_CHAN_SINGLE(9, 9, 0x84),
-	AT91_SAMA5D2_CHAN_SINGLE(10, 10, 0x88),
-	AT91_SAMA5D2_CHAN_SINGLE(11, 11, 0x8c),
-	AT91_SAMA5D2_CHAN_SINGLE(12, 12, 0x90),
-	AT91_SAMA5D2_CHAN_SINGLE(13, 13, 0x94),
-	AT91_SAMA5D2_CHAN_SINGLE(14, 14, 0x98),
-	AT91_SAMA5D2_CHAN_SINGLE(15, 15, 0x9c),
-	AT91_SAMA5D2_CHAN_DIFF(16, 0, 1, 0x60),
-	AT91_SAMA5D2_CHAN_DIFF(17, 2, 3, 0x68),
-	AT91_SAMA5D2_CHAN_DIFF(18, 4, 5, 0x70),
-	AT91_SAMA5D2_CHAN_DIFF(19, 6, 7, 0x78),
-	AT91_SAMA5D2_CHAN_DIFF(20, 8, 9, 0x80),
-	AT91_SAMA5D2_CHAN_DIFF(21, 10, 11, 0x88),
-	AT91_SAMA5D2_CHAN_DIFF(22, 12, 13, 0x90),
-	AT91_SAMA5D2_CHAN_DIFF(23, 14, 15, 0x98),
+	AT91_SAMA7G5_CHAN_SINGLE(0, 0, 0x60),
+	AT91_SAMA7G5_CHAN_SINGLE(1, 1, 0x64),
+	AT91_SAMA7G5_CHAN_SINGLE(2, 2, 0x68),
+	AT91_SAMA7G5_CHAN_SINGLE(3, 3, 0x6c),
+	AT91_SAMA7G5_CHAN_SINGLE(4, 4, 0x70),
+	AT91_SAMA7G5_CHAN_SINGLE(5, 5, 0x74),
+	AT91_SAMA7G5_CHAN_SINGLE(6, 6, 0x78),
+	AT91_SAMA7G5_CHAN_SINGLE(7, 7, 0x7c),
+	AT91_SAMA7G5_CHAN_SINGLE(8, 8, 0x80),
+	AT91_SAMA7G5_CHAN_SINGLE(9, 9, 0x84),
+	AT91_SAMA7G5_CHAN_SINGLE(10, 10, 0x88),
+	AT91_SAMA7G5_CHAN_SINGLE(11, 11, 0x8c),
+	AT91_SAMA7G5_CHAN_SINGLE(12, 12, 0x90),
+	AT91_SAMA7G5_CHAN_SINGLE(13, 13, 0x94),
+	AT91_SAMA7G5_CHAN_SINGLE(14, 14, 0x98),
+	AT91_SAMA7G5_CHAN_SINGLE(15, 15, 0x9c),
+	AT91_SAMA7G5_CHAN_DIFF(16, 0, 1, 0x60),
+	AT91_SAMA7G5_CHAN_DIFF(17, 2, 3, 0x68),
+	AT91_SAMA7G5_CHAN_DIFF(18, 4, 5, 0x70),
+	AT91_SAMA7G5_CHAN_DIFF(19, 6, 7, 0x78),
+	AT91_SAMA7G5_CHAN_DIFF(20, 8, 9, 0x80),
+	AT91_SAMA7G5_CHAN_DIFF(21, 10, 11, 0x88),
+	AT91_SAMA7G5_CHAN_DIFF(22, 12, 13, 0x90),
+	AT91_SAMA7G5_CHAN_DIFF(23, 14, 15, 0x98),
 	IIO_CHAN_SOFT_TIMESTAMP(24),
 	AT91_SAMA5D2_CHAN_TEMP(AT91_SAMA7G5_ADC_TEMP_CHANNEL, "temp", 0xdc),
 };

---
base-commit: 0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
change-id: 20250103-fix-sama7g5-adc-realbits-37f62f8925d7

Best regards,
-- 
Nayab Sayed <nayabbasha.sayed@microchip.com>



