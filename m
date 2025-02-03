Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7360FC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 21:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4Gjqc8HHj1JHZsFFjHjXiiKMSNUmeADcnjjmKnOGZ8=; b=pplJVHLALVcj+heQMdF6LYX5cH
	k3LK3SiVjzEtKs+Uc2X8GHlAsZTwm2hRVghk8ktzSlySeqWPoRiLHMvs982p+4lEe3/a6Bqm7X4n7
	8H2HITuZ4gTTNwtr3KjVzPoQGu5oUDHihxZ9NLsQXlbdEyBCY9NeSZyK9QK9jc6xlCbJNRCfZ8s3V
	C3GTOEMne/01p0RLjdtJ+hQTDxqFvglgd9R2Lmjkl+nI2kXWdzYdm9ASz+RJ86Cb/+Ce07dsbBRxo
	fuVle6pSfsPY24VfZBgylwzgPYG2jarqHIpNVTLwDHYXzDSmU3j5xcqe7dFMSxwhdmIABG+XXAO5t
	DYqClzEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3bH-0000000GbiI-1Fno;
	Mon, 03 Feb 2025 21:03:23 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3E1-0000000GYbe-1XKP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 20:39:22 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 34FD325BAE;
	Mon,  3 Feb 2025 21:39:20 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ha58dUourWTk; Mon,  3 Feb 2025 21:39:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615159; bh=DKaXj47Da+oOZ2DQcNgkyu4NCrw4Nc+uxn3h436NOGA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mLcR2Uwi7DqCRxQ1H6HEipsfV44p499+wKRi5P+kkMQFdMgG80Cm01b26+jisdynS
	 AIOizB0AxTODPXvz1BoTfb54Zz8qNx9kSFfx9afx9nmoYlZhgCQy/o6tVt2cMeVfA8
	 QVicNIai8jxipJ+xjvMjapdemlzRh+1wg8f5U8aIECnXQ/npnmzmtbpWsM5+Tk+lJ1
	 Z7X8gpSgilD9WB4zyDy71P/ZR769JjBahusvYOtPf+ypv4pjS3VXM4ZOygSPCsstyX
	 IIlo8bEAxqugSmMQ/dizW3ae2yE11MYwmeTAV6NHmQsLiVL2+IQDbwTHBf6wPY6ZAh
	 /OT8EJopXK+Yg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:08:46 +0530
Subject: [PATCH 2/2] tty: serial: samsung: add support for exynos7870
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-uart-v1-2-06be6aa96284@disroot.org>
References: <20250204-exynos7870-uart-v1-0-06be6aa96284@disroot.org>
In-Reply-To: <20250204-exynos7870-uart-v1-0-06be6aa96284@disroot.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738615135; l=2740;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=DKaXj47Da+oOZ2DQcNgkyu4NCrw4Nc+uxn3h436NOGA=;
 b=uj2Sv/xe9gU7Vno2GXb4hXmkwM4+V3tMayUPmGNYurOU/cBfU224pzOtAKyGtsyPxjLkZ89Ho
 9kt/g05uNIWAZiql7CULnC0iOrktD2mU6F60DONet+ZNg+JZ1zL/vQr
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_123921_545065_D8EBB9B2 
X-CRM114-Status: GOOD (  13.13  )
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

Add serial UART support for Exynos7870. The FIFO sizes are not defined
in the driver, and they must be provided in the devicetree with the
samsung,uart-fifosize property.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/tty/serial/samsung_tty.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 210fff7164c138e315d20ccaa4a29ce6a7bb2dfe..c8607633fea40df2ec221cfd3653c726094127cb 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2493,6 +2493,12 @@ static const struct s3c24xx_serial_drv_data exynos5433_serial_drv_data = {
 	.fifosize = { 64, 256, 16, 256 },
 };
 
+static const struct s3c24xx_serial_drv_data exynos7870_serial_drv_data = {
+	EXYNOS_COMMON_SERIAL_DRV_DATA,
+	/* samsung,uart-fifosize must be specified in the device tree. */
+	.fifosize = { 0 },
+};
+
 static const struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
 	EXYNOS_COMMON_SERIAL_DRV_DATA,
 	.fifosize = { 256, 64, 64, 64 },
@@ -2533,6 +2539,7 @@ static const struct s3c24xx_serial_drv_data gs101_serial_drv_data = {
 
 #define EXYNOS4210_SERIAL_DRV_DATA (&exynos4210_serial_drv_data)
 #define EXYNOS5433_SERIAL_DRV_DATA (&exynos5433_serial_drv_data)
+#define EXYNOS7870_SERIAL_DRV_DATA (&exynos7870_serial_drv_data)
 #define EXYNOS850_SERIAL_DRV_DATA (&exynos850_serial_drv_data)
 #define EXYNOS8895_SERIAL_DRV_DATA (&exynos8895_serial_drv_data)
 #define GS101_SERIAL_DRV_DATA (&gs101_serial_drv_data)
@@ -2540,6 +2547,7 @@ static const struct s3c24xx_serial_drv_data gs101_serial_drv_data = {
 #else
 #define EXYNOS4210_SERIAL_DRV_DATA NULL
 #define EXYNOS5433_SERIAL_DRV_DATA NULL
+#define EXYNOS7870_SERIAL_DRV_DATA NULL
 #define EXYNOS850_SERIAL_DRV_DATA NULL
 #define EXYNOS8895_SERIAL_DRV_DATA NULL
 #define GS101_SERIAL_DRV_DATA NULL
@@ -2622,6 +2630,9 @@ static const struct platform_device_id s3c24xx_serial_driver_ids[] = {
 	}, {
 		.name		= "s5l-uart",
 		.driver_data	= (kernel_ulong_t)S5L_SERIAL_DRV_DATA,
+	}, {
+		.name		= "exynos7870-uart",
+		.driver_data	= (kernel_ulong_t)EXYNOS7870_SERIAL_DRV_DATA,
 	}, {
 		.name		= "exynos850-uart",
 		.driver_data	= (kernel_ulong_t)EXYNOS850_SERIAL_DRV_DATA,
@@ -2651,6 +2662,8 @@ static const struct of_device_id s3c24xx_uart_dt_match[] = {
 		.data = EXYNOS5433_SERIAL_DRV_DATA },
 	{ .compatible = "apple,s5l-uart",
 		.data = S5L_SERIAL_DRV_DATA },
+	{ .compatible = "samsung,exynos7870-uart",
+		.data = EXYNOS7870_SERIAL_DRV_DATA },
 	{ .compatible = "samsung,exynos850-uart",
 		.data = EXYNOS850_SERIAL_DRV_DATA },
 	{ .compatible = "axis,artpec8-uart",

-- 
2.48.1


