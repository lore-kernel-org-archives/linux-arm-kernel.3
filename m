Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48881C44503
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 16:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=damSg+KRPsx8cUGtM6YEq9+rU5hH+rbnhhK5WWTTkmU=; b=BVytbLtSImD5aWr3qkOC6fgctf
	Tuoo7qQ7KVB6OPoImYtDHqZ3HGvQiQP6dw+BARyur7BRXpx8WYfF+XqiSguaP9pqXOMqeaJ2fKSdp
	t/kFLqgbW9AJStMqIdY+zj6mCUDDzkhfQlzw6nekVCQHfeWVosgjkb4PVdlGVAXuxWivdHowfOm4j
	WLJpvKJnJSxFc9FJLqzy4UwgW2kClj8qg3rAWV72ogY/oZnK9vA3RmlsnAlCZKks4Pj9SzLVAZZgA
	uXG8882YfvK6/YVqr0OfM9cEi/2uOC/MsPZK3LpxKIqK19z43Q5g0H315/z7TLMC3NIjJPFzpuE2J
	1Js8GeGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVVT-000000001tE-2YUV;
	Wed, 08 Jul 2026 16:52:19 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVVQ-000000001rS-1rZX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 16:52:17 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-4798bea72f9so656252f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 09:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1783529534; x=1784134334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=damSg+KRPsx8cUGtM6YEq9+rU5hH+rbnhhK5WWTTkmU=;
        b=MeKVWGcOhFklwNlSA8HN3BSWnFeBafF5vl5surdhy56T4sMaZ8TIdUuYiwEpX88WAX
         a+X+v3vcBrfDNMpO8mTNypupS3ywNkyhatKhvn+ldrvuxbIpqxCfK5ofSxcLoTl1HCh4
         c6UU8oN3bQ/N/FPtxQw3mgaMlQ+FMp6yx/39rCpHCAv+jVrat5OZYlrDPmToIk59g4qU
         CsFHPDtrp4ZUT2GCrWREuJt3W1BvqS7ykiYHyDb7UJWoO8+SERwD2+wGutk25AceaFJm
         jGhBpjTSmFkxkXNWpdrUh4YkkM27xuc8iA3sTzqMDcArZfy52WgQjKPcxWdTjgXwZSda
         s3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783529534; x=1784134334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=damSg+KRPsx8cUGtM6YEq9+rU5hH+rbnhhK5WWTTkmU=;
        b=QGEDZ4eaamBp+IuEF6vpIBVNYEs9mIu3+rRIEaTK5FOVWQid+qFQtj7BV/2dytt/sW
         pFSuN4XBfVQ0LYtby+wbbs68a1Q+wupoLWyTgUo4ni2epJgANlVcFwdZCYOfWexY7Dm9
         PH5PipJyh+c6LooTuLSMvwHHTw+ZuDFIMHtmI4Qg2BVXokABwA2NeIIsnUaRyl0MIx/b
         RxVX/qtUHrpmKokuDcd3YhpW2HFPE4u84ZhSpssH1mEuAYT/mgCQf3OxvcQHeFgD1pSv
         PCaG93kqlu0tfa3cXeHHhJELU9GkyDK3tDlh4QWb14lTy6sCEvAkZZpU22zmNjqqPKri
         ySpQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7UBKCcQpI79Y60gGZTvZ/ZdqHiXghnjs0dMp1xjGfQAXDbC4Z01hLtZbi28E++e0fOM0Ezl1aSHqkR8euYOFW@lists.infradead.org
X-Gm-Message-State: AOJu0YwUoNcBftO15QPys7CgcUUxMtTjioZ2ee0FbaiVl6nrcZozoELv
	O/E8sehyCMlJNEuyBlF8lr6nP0Euq4pqYLnWQjAVDOLiKpYHw1RS+9Hq0o61XnYeeUU=
X-Gm-Gg: AfdE7clAchl3L6hlqLSWCkfKS8bIcqrFUNV5KcfWAjOTqmuFJhnY5qR44c3mbzG+BGr
	uyXq/tvGohTlLqM12tVA3twKnMCJANzY7wugiq3ArMAASjimKYZvmXx175Zy2BOmgOGzdvGF/ie
	zwpWTnGCPhSnadowCBf+hq+kPulerV7FCq2oGtwJfbZPb5+OSExxEVNgm3mlQo15opLc9nej+Zl
	GvEgFS+1VmNd6d5POSYOeGi9Vki9oT6jTnlj+By6QXLAVaL95/UklLlIYMzq8GUIPHNsDQYzxr5
	JmYildXjpHyQJnSS3FcraUIwrcbP6TKYedcTWH+1OhnQ+tRymDYwmOuWW54JsJNQqOsHGr4oakx
	OGvlvmLL1JQQNqIxnL1xP8KxsjhlihV27Q1OPkeLZauABwNAdX0+SPROHpGNB4r+WesKfkb44kj
	CChX5EvIs3mRYCb2Zcy5VqIamVrkvrp/FHPcH+Vr7hvAmWWq5g+ZkU2KBk+uuLNvuMnA8pHC6uP
	puqkMBkjKKzb4x6U6KnimDbRFTaIHOwcjQIPtfHdDg=
X-Received: by 2002:a05:6000:1acf:b0:46e:27ed:6d0d with SMTP id ffacd0b85a97d-47df071c1bdmr3937027f8f.8.1783529534551;
        Wed, 08 Jul 2026 09:52:14 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-57.xnet.hr. [88.207.15.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm42902679f8f.33.2026.07.08.09.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:52:13 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: conor@kernel.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	robh@kernel.org,
	krzk+dt@kernel.org,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 3/4] spi: atmel-quadspi: add LAN969x QSPI support
Date: Wed,  8 Jul 2026 18:51:10 +0200
Message-ID: <20260708165201.624271-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708165201.624271-1-robert.marko@sartura.hr>
References: <20260708165201.624271-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_095216_512251_8EA69974 
X-CRM114-Status: GOOD (  16.67  )
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


