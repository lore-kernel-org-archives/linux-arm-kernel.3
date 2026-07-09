Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD581C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=damSg+KRPsx8cUGtM6YEq9+rU5hH+rbnhhK5WWTTkmU=; b=z/P+GfvtrRy4W5sCbBSKBGPyPv
	4rejvOZk+lVhHNiameW+z2zU4wDj8/kVA8blh/p1CMY1i3032DfJclqAJEPUngEOJ3qzH4N84Tw7c
	6jvjYpZA9ezTs4DuvtwTzga/RMAj0GDFS0NS6IRm6x5RDeL9NikM650qdVhtoJ9Xrz3DYZJzjx+up
	aunA+zqhxqnRKxhezu7yQnSMaKAn220ViC7MIMcdA9oCUQwMUpzobwCD9iIiVjv7y32cMgxlWqYwb
	lN793U0A+nsu0dxBTr46NlskuPw7FW4eMyAnzpSF+1qyqwQwuxCmEf7YNDkaXsNgrlxPm4kKkJZXN
	RXgXSkjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmny-000000028ak-0BwE;
	Thu, 09 Jul 2026 11:20:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmnv-000000028ZH-3lTP
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 09 Jul 2026 11:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=damSg+KRPsx8cUGtM6YEq9+rU5hH+rbnhhK5WWTTkmU=; b=nCBmiyj3gjGn5/pBrbpN5Mnak1
	2Yhiz2LdX0kfTjvDcK6ZA3b8rc3cg9IQl2a+RBRuFodJzsvLbqc5n2SNwHvnrCeo5WZ3HXbP4c/UC
	65sV+UbZltrhP42Fy5ARa6VWZWS2EMgpG/vg/aGmuD0s6qJyoFUsUNkP+odCAd/I70PejaquqAboJ
	udjceymwbzRjdfaaUKRQ3bt5cUyWwAHEyBIkhsbSCzWpUDu87MUtf7sTXF8cCtTl8mKyUrFMka4WP
	LPHP0I7zQCgPAiEQftsMp7g14MYDBFOSlBq7NPZQ2C+PY2++mhaWHqjpEJE5q4+c2Iy0bwb2yBrQB
	YmzqhDzQ==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whmnq-000000097mt-0VwG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 11:20:28 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-493bf73ec2aso10531675e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 04:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1783596023; x=1784200823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=damSg+KRPsx8cUGtM6YEq9+rU5hH+rbnhhK5WWTTkmU=;
        b=fRCFS7WD+XBBBNn4FY9SJfAEEB88YhGI9UEkiME+B/hLLUPMiiFu7jbKmiahxTTQgY
         goUgoLJQue94O6KGilqtTkrOhcinHb+D4BReIxssfhp1tqkfwNDYiqrbZ0W5xMuvDPmk
         2mMXZBVQykQSuR/dJ/AhpN/y2JjcyKXFdFMJ3C7muqXwJ3vt1n39HZli8ELD87oDC3JI
         h9eyiFmerGg7ftdCDaQGaov8k5J2R+PuM+C8AMOmccjZwmEpdZYgPRvZ3pbNMQJYqOSm
         UYX4leqpA4MR1105Ez8UZ1IPC83EWtn/ZLeNeM0F8Rq4qTysSXuYbjWaZMJdpfiEvDOO
         lFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783596023; x=1784200823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=damSg+KRPsx8cUGtM6YEq9+rU5hH+rbnhhK5WWTTkmU=;
        b=Z2Mwe97TG1hloe9z8trBewCg1m9MbrFPYuRqRmustRt+/e93MrZOEBeFCvQWwsPNGj
         OS0wOsf9HRGQWMi7YOL7t5/qFstT4Hy8rGEL8gvjgROuX/v3P6clNOgeH0AzRGeY19nY
         MXQnTTorCDVfnJVhy+mO476+z0KcDhpEn/xlsycPbzCEFXfLJxh22lJboP+GV39tbBAL
         Ts4cua7e2ojFdSrcS1+91P6PuxLrNKACxS1zQNsMmKx8K8ExMJTd3DComFuLpROeiWwM
         hIY84DfqiQ+ZiHAkz+8NZ2sx90svyZGYYOjCjvDsfV9v/Mg7WrAoMlycwQ15uAL/dl3B
         b6hg==
X-Forwarded-Encrypted: i=1; AHgh+RoIREJ5rKjXHQ/B5uQDLirtHbntvRu4l6fI4F+tUm7rTgbdlYTorPPkADYrp6fdx4HsT+U3Q2HmjrEsJAvCmnhU@lists.infradead.org
X-Gm-Message-State: AOJu0YzQw2/wSieL59vrLFdAU8nW48ZDg2Qy/ER/9qWZTrthokitGSKT
	1sj1S49TJ0VXXPQCBYoACD+oKR7ErUFNX+dRzyYmksIJw0pnJn8KKsH8oshwZFk1jyA=
X-Gm-Gg: AfdE7clWkGmKkivEFoN8rPl24Yh1id3rIS3U6LLykxBARSVB4zILFoJsH6hw+hSxv4L
	wpglG7x7RKS8zJAFg/3B4uHrILauR326d+G8jbGQtMvkO9NWv0rMW2p6MN6AaJBmxCxu4cPMyj1
	PEtxx2bvdYeCZXIDiW14bYM4JXx3hopQHH+xoC0ZCm7T51h9qENUtbd4OEE2flzWrUY+VFiy9+1
	JW7jNGErOWI8BYYY3zRonKJ4M2DtIdJ8dg66uHCSEsDBRu0t1XtC+FtV9gKzWvk59XoyU1ntPHe
	Cgl/Xotp92/cJPWeSESdf4M2BniwSH4CRzhuJIp+zdA0RJzwxQgOaYi6naVkaTkv3Lal8a2bv6U
	IY0+pg9J7m+VOEZvx5L439AN3KWfE32I7O3TCUaDZWhncnzsQvOZTaoop7pR9v43k8M1VyBh7Q1
	MSE4+/orrp3bLED4lm9xIbt8EgHAJYXbSOwaCSSLQlSpdiTjq/3rn0/aLfdfNEhMo8ysAFLxIMa
	NBX+EE/mb3J7xKCyVQFjLUImlboG1u8b+o0QKAThTI=
X-Received: by 2002:a05:600c:6286:b0:493:cc25:85cb with SMTP id 5b1f17b1804b1-493e6892d8bmr65828845e9.8.1783596022660;
        Thu, 09 Jul 2026 04:20:22 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-57.xnet.hr. [88.207.15.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3c42sm53910475e9.1.2026.07.09.04.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 04:20:22 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	tudor.ambarus@linaro.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 4/5] spi: atmel-quadspi: add LAN969x QSPI support
Date: Thu,  9 Jul 2026 13:19:10 +0200
Message-ID: <20260709112006.390742-5-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709112006.390742-1-robert.marko@sartura.hr>
References: <20260709112006.390742-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_122026_491714_BD7F524E 
X-CRM114-Status: GOOD (  16.13  )
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

Microchip LAN969x has two QSPI controllers based on SAMA7G5 QSPI.

It requires pad calibration, supports DMA, and supports 100 MHz operation.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/spi/Kconfig         |  2 +-
 drivers/spi/atmel-quadspi.c | 66 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 8782514bb89b..bb3773f99ad9 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -189,7 +189,7 @@ config SPI_AT91_USART
 
 config SPI_ATMEL_QUADSPI
 	tristate "Atmel Quad SPI Controller"
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_MICROCHIP || COMPILE_TEST
 	depends on OF && HAS_IOMEM
 	help
 	  This enables support for the Quad SPI controller in master mode.
diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index d1aec14e3978..f05e2617fa89 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -1152,6 +1152,58 @@ static int atmel_qspi_sama7g5_init(struct atmel_qspi *aq)
 	return ret;
 }
 
+static int atmel_qspi_lan969x_init(struct atmel_qspi *aq)
+{
+	u32 val;
+	int ret;
+
+	atmel_qspi_write(QSPI_CR_DLLOFF, aq, QSPI_CR);
+	ret = readl_poll_timeout(aq->regs + QSPI_SR2, val,
+				 !(val & QSPI_SR2_DLOCK), 40,
+				 ATMEL_QSPI_TIMEOUT);
+	if (ret)
+		return ret;
+
+	ret = atmel_qspi_set_gclk(aq);
+	if (ret)
+		return ret;
+
+	/* Start the DLL before resetting the controller. */
+	atmel_qspi_write(QSPI_CR_DLLON | QSPI_CR_STPCAL, aq, QSPI_CR);
+	ret = readl_poll_timeout(aq->regs + QSPI_SR2, val,
+				 (val & QSPI_SR2_DLOCK) &&
+				 !(val & QSPI_SR2_CALBSY), 40,
+				 ATMEL_QSPI_TIMEOUT);
+	if (ret)
+		return ret;
+
+	atmel_qspi_write(QSPI_CR_QSPIDIS, aq, QSPI_CR);
+	ret = atmel_qspi_reg_sync(aq);
+	if (ret)
+		return ret;
+
+	atmel_qspi_write(QSPI_CR_SWRST, aq, QSPI_CR);
+	ret = atmel_qspi_reg_sync(aq);
+	if (ret)
+		return ret;
+
+	ret = atmel_qspi_set_pad_calibration(aq);
+	if (ret)
+		return ret;
+
+	aq->mr = 0;
+	aq->scr = 0;
+
+	ret = atmel_qspi_set_serial_memory_mode(aq);
+	if (ret)
+		return ret;
+
+	atmel_qspi_write(QSPI_CR_QSPIEN, aq, QSPI_CR);
+	return readl_poll_timeout(aq->regs + QSPI_SR2, val,
+				  (val & QSPI_SR2_QSPIENS), 40,
+				  ATMEL_QSPI_TIMEOUT);
+}
+
 static int atmel_qspi_sama7g5_setup(struct spi_device *spi)
 {
 	struct atmel_qspi *aq = spi_controller_get_devdata(spi->controller);
@@ -1679,6 +1731,15 @@ static const struct atmel_qspi_caps atmel_sama7g5_qspi_caps = {
 	.has_dllon = true,
 };
 
+static const struct atmel_qspi_caps atmel_lan969x_qspi_caps = {
+	.max_speed_hz = SAM9X7_QSPI_MAX_SPEED_HZ,
+	.init = atmel_qspi_lan969x_init,
+	.has_gclk = true,
+	.has_dma = true,
+	.has_padcalib = true,
+	.has_dllon = true,
+};
+
 static const struct of_device_id atmel_qspi_dt_ids[] = {
 	{
 		.compatible = "atmel,sama5d2-qspi",
@@ -1708,7 +1769,10 @@ static const struct of_device_id atmel_qspi_dt_ids[] = {
 		.compatible = "microchip,sama7d65-qspi",
 		.data = &atmel_sama7d65_qspi_caps,
 	},
-
+	{
+		.compatible = "microchip,lan9691-qspi",
+		.data = &atmel_lan969x_qspi_caps,
+	},
 
 	{ /* sentinel */ }
 };
-- 
2.55.0


