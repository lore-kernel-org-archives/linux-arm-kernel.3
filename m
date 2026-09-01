Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E911C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 19:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WyEFu62ujimxaQJil6RmK3n8Y5dLLUWHpcfLAU5G5Cc=; b=Fh3PwTzyb6gWcdqqkaRIUIt/dK
	cnFB8AcfHvvudj/tfo41oWOvlxv1JFyiOEEz25n+nKzQ8/ShWFOdTdB3+WI7wvWYeFFGhfD+JN5UN
	Tkjq1AfnvnyLSPwEToyXHS87anIl7XxFg+wRXkoB6/CE1jWeeTtCu3pW9JVhdru1G5KTkBwPZTYme
	F03TG5S563zMjsWdkiLHdNdbYaYBjRh5pqjQB/yhuAJN3tBik0dAIBZxcCpTFuLijUNNTa1xZwFW7
	D9koon1ORlWPI2r+1awwFvJT28tGxGvh8Kz9eXIFhwFuilfmlZjMfIIj5dsln8iMRxqTCeJY4ZPdo
	1a6TExsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1U80-0000000DCSk-1Sar;
	Tue, 01 Sep 2026 19:26:40 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1U7w-0000000DCQd-3UZe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 19:26:38 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6a6143cca69so287311a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 12:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788290795; x=1788895595; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WyEFu62ujimxaQJil6RmK3n8Y5dLLUWHpcfLAU5G5Cc=;
        b=omH+6c0o0QSo+LMGMvCds9OP0pMCTR1/Y3sl4K5Vh0508QXPvHmJ5PLogAMBWnC/JH
         S9P5NAsSl3WTuxiU30ltp//lSbOE31P/r1KyZTR6JoqTxMXiwurhb1vrUjkNjjbUb+Yy
         t16Jo+TXp9fCWI+RG0dnkfG/8vjLWaBSZ7MXZTD6ITIRKuSIKCqEDUNZcnhph62VnfYP
         phlrJdMYguoKmmwO8n4TYfTFZXJ7zxF0SqZfPMBBr8pOi/gXfnFVpfXU7AiXGY1x1TPr
         0MGb6/U8mZ2S2ZLAPaiN5e5jCYG3FT6WoCMwTxXEoq2kKV+a+plcrRhMlor+jf8wEiOY
         sDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788290795; x=1788895595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WyEFu62ujimxaQJil6RmK3n8Y5dLLUWHpcfLAU5G5Cc=;
        b=ATUeSEOa2UMnQm/4J93ZV2GacG8snKT7Bfcl045BAH1cUxQvdPVVA9K+KJyzccuEzr
         kHVODlKYwO0SjtbCI4pkClwVo8BVB9XtcEXBST/34b47AFzOAC6SOIQEvBgTkqJt9nwo
         beL8fCxZ4oTZmvBsvrlttm+O7IAE7wbFZhggapgl9TSay9beizq8A5hxgzCiNu7t6LnI
         sGOWwYNzIvjxloEoTpNVDEd2TKcz8lJXxap9oUAM4k3RqKJcFS6MA+zNyRk5m7BNDesk
         mlFmf038GF5KTgEpNXG7dDgHaEefvmMK25WVCA2VG7gESXcId3SLLzftCq7HjdcD7fqE
         33tg==
X-Forwarded-Encrypted: i=1; AKwUvBznKNZXIErf0vEsvTKWrxgXViWIApN1zGJTlBUCcH60FYD/URWXjMWd6e3Y64h8ZyAXaLUgLwkPKq11Qht6JPyV@lists.infradead.org
X-Gm-Message-State: AFuF++kkg5p3U39OhjF3eA/ONCNHFuMs2u16+n68pP3h5ezB73nU3+WZ
	qOO4SmMqHjs776FL87MtSPE9gwDHwoVrhFBzQQSADHx1k7iMsqcuKO3N
X-Gm-Gg: AYBFou21bDVpoFMcaJn/NNvk/ls6mOzD355B46svdmIpYan+UU69qXXKdr5OAXyO4FR
	m1c73qrkb2q4d1YPL0o8duT9QQ/S2o06+z+jyhKsSPawJUv5Kl0KLUBJbfJLqpld/Qzp5EUYUqT
	wQfKab+q8soLwJP30Q7zjaqxz5GpS8YVeRcXDGbtOWMTRtSdrTn/55DYaVHu5cZXqcofWJJQYlQ
	CCoSoPdhAClhHRl+cSIeyDZe2mYD7kPQwPzZhb7bQ5yj7JgeyuDXPc9WLavnc+Z9WrO5+5MSQxs
	KBfgZLJohvuN/y6MlqKggvaGXgvpjVsgTYTIEouzo7Z6oZkdjsUYYSC/GaWD+217U6QZE/kuPfo
	J4nB+SjV93yGrrv0GdOhIcIaz5K/pF8bqrKwhBNhtxpCAEdB2boJS076AL1KaEx+zMDRVSFBISY
	klUKrw1Et4wHCiz9AOG4JN6YytMOgCcZj+kISsm2NIvGQ+UnjnYWh895O6+xan006G7UeW5iCr
X-Received: by 2002:a05:6402:21d4:b0:6a0:dda3:83db with SMTP id 4fb4d7f45d1cf-6a6818d24f1mr115922a12.0.1788290795093;
        Tue, 01 Sep 2026 12:26:35 -0700 (PDT)
Received: from khalil-hp.home ([62.250.116.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f94242csm146373a12.21.2026.09.01.12.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:26:34 -0700 (PDT)
From: Khalil <khalilst@gmail.com>
X-Google-Original-From: Khalil <khalil@rentman.nl>
To: Mark Brown <broonie@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-spi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Khalil <khalil@rentman.nl>,
	Khalil <khalilst@gmail.com>
Subject: [PATCH v3 3/3] spi: pxa2xx: Handle clock gating for GPIO chip select devices
Date: Tue,  1 Sep 2026 21:26:25 +0200
Message-ID: <20260901192625.1497791-4-khalil@rentman.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901192625.1497791-1-khalil@rentman.nl>
References: <20260901192625.1497791-1-khalil@rentman.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_122636_884944_8EFED3A6 
X-CRM114-Status: GOOD (  16.93  )
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

On Intel LPSS SPI controllers (Cannon Lake and later) with dynamic
clock gating (cs_clk_stays_gated=true), the SPI clock is gated when
no native chip select is asserted. When using a GPIO chip select
(via SPI_CONTROLLER_GPIO_SS), the SPI framework toggles the GPIO
and also calls the controller's set_cs callback.

Handle this in the pxa2xx cs_assert/cs_deassert functions: when the
device uses a GPIO chip select on an LPSS controller, assert native
CS in the control register to enable the clock, and force the clock
gate on. On deassert, restore both.

This is needed on platforms where serial-multi-instantiate installs
a GPIO chip select from the peripheral's ACPI GpioIo resource to
work around an incomplete cs-gpios property on the SPI controller.

Signed-off-by: Khalil <khalilst@gmail.com>
---
 drivers/spi/spi-pxa2xx.c | 45 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 41 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index 6291d7c2e0..fe57620630 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -419,20 +419,43 @@ static void cs_assert(struct spi_device *spi)
 {
 	struct driver_data *drv_data =
 		spi_controller_get_devdata(spi->controller);
+	const struct lpss_config *config;
 
 	if (drv_data->ssp_type == CE4100_SSP) {
 		pxa2xx_spi_write(drv_data, SSSR, spi_get_chipselect(spi, 0));
 		return;
 	}
 
-	if (is_lpss_ssp(drv_data))
-		lpss_ssp_cs_control(spi, true);
+	if (is_lpss_ssp(drv_data)) {
+		config = lpss_get_config(drv_data);
+
+		if (spi_is_csgpiod(spi)) {
+			/*
+			 * GPIO handles the actual chip select to the device.
+			 * On LPSS controllers with dynamic clock gating, the
+			 * SPI clock won't run unless the native CS state says
+			 * "asserted" in the CS control register. Assert native
+			 * CS in the register to enable the clock, and force
+			 * the clock gate on.
+			 */
+			lpss_ssp_cs_control(spi, true);
+			if (config->cs_clk_stays_gated) {
+				__lpss_ssp_update_priv(drv_data,
+					LPSS_PRIV_CLOCK_GATE,
+					LPSS_PRIV_CLOCK_GATE_CLK_CTL_MASK,
+					LPSS_PRIV_CLOCK_GATE_CLK_CTL_FORCE_ON);
+			}
+		} else {
+			lpss_ssp_cs_control(spi, true);
+		}
+	}
 }
 
 static void cs_deassert(struct spi_device *spi)
 {
 	struct driver_data *drv_data =
 		spi_controller_get_devdata(spi->controller);
+	const struct lpss_config *config;
 	unsigned long timeout;
 
 	if (drv_data->ssp_type == CE4100_SSP)
@@ -444,8 +467,22 @@ static void cs_deassert(struct spi_device *spi)
 	       !time_after(jiffies, timeout))
 		cpu_relax();
 
-	if (is_lpss_ssp(drv_data))
-		lpss_ssp_cs_control(spi, false);
+	if (is_lpss_ssp(drv_data)) {
+		config = lpss_get_config(drv_data);
+
+		if (spi_is_csgpiod(spi)) {
+			/* Deassert native CS and restore clock gating */
+			lpss_ssp_cs_control(spi, false);
+			if (config->cs_clk_stays_gated) {
+				__lpss_ssp_update_priv(drv_data,
+					LPSS_PRIV_CLOCK_GATE,
+					LPSS_PRIV_CLOCK_GATE_CLK_CTL_MASK,
+					LPSS_PRIV_CLOCK_GATE_CLK_CTL_FORCE_OFF);
+			}
+		} else {
+			lpss_ssp_cs_control(spi, false);
+		}
+	}
 }
 
 static void pxa2xx_spi_set_cs(struct spi_device *spi, bool level)
-- 
2.43.0


