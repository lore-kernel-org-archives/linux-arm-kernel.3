Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7B9C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 04:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pABNnyGxDf0HWJPslows1Wypf0nJAcgv8KSSagBrIHM=; b=dSgpRPkEEgU1I/FDPr/nvEib0q
	SaYtwvzU6FBRwJH19nzlLIBPUngHYOKGLGrT4oc8f+6zQ5yTtoIelK7Z2Mdaf1CVYaLaSOo10NXG5
	ecLHlhz17KZTlnxrfllF3yq7tMBpHiz+C1tXegcrZo3rfBGfpj0TffQOkj1sY/0mXbrQ99BntrN3c
	JxMJ1bzzy5isH1iM7LNiV7XnFLx24xUKBgT2S/wYDy9T1X92dQtdvSQ/gFHpz5IXQBxgKm2CF3KcS
	G/NGVYQkYoGcNtFFxUQR3obN7X4zdxe0E0PiPUEf0ROFJ2ebXj7+Hg11yJFJFgzr1eCP5JXPi5EQt
	UeSbZtKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tinUO-0000000DcQ8-3Upy;
	Fri, 14 Feb 2025 04:39:44 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tinOy-0000000Dbmr-1njt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 04:34:09 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-4ba722d3916so497808137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 20:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739507647; x=1740112447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pABNnyGxDf0HWJPslows1Wypf0nJAcgv8KSSagBrIHM=;
        b=nTR0T/ddu6DHne+eI9tcFvM5liiG4vwJHW0Cd5zMde//epKjOsx7H9Cvr2M5lhOqUk
         t8LTsY47oApkJp/QNaIFtyspL7QkduoX72aaN31X0lSoZukxvBiBlRq7AqejIh6hqzKp
         Hzn7FM5QkVNg6Mf9VoRzVEWYrUxB1Gylq06tSnB/ihKmZOz9kKsiIPlXm2m3HMEqMGOX
         AqXySyJUXfWwIYlTMh8y35QKH1tj5YARIyaFrDFsLwpC8QQuKkm6jRNwQOncTzhrWy0E
         T9879U8JJ1ie7ve9Xwueq/z4tqBZeyHnhYAayA8kmDoTKw+0IITMP3TSnMjmp7RHw3pQ
         4rSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739507647; x=1740112447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pABNnyGxDf0HWJPslows1Wypf0nJAcgv8KSSagBrIHM=;
        b=BHXQQZ3SLzpeEQLi1byjfNuuBcpa7wzPXjeZrXSWn7TmMEGKH41sGUoskn9/DCJ/77
         iQ1R2a9TRZ/pUjC9o3lX5XB7Si4r6z53+ZhnmILcmZU585YvmsRJR1flP3UM1ekrldCD
         /0t2Kbdt3r90QJZZJzSf8w9S26leaY1kivzvIEzhdyauxRTBsi8W7NkKbR2/oxmfbtN7
         jdpyLjAJidpIwWr8630MPb0fPAYRqzS+WYmrnCkaLZnc83GdVelJBQHEtMV7dLjIoKJR
         Hf5Pu/RumVo4HW7ADWNQadhCwGpZf7QwY+H2yUIPC7bwLaM5E2o/pPaU9nbc+/eRWRw6
         QwNg==
X-Forwarded-Encrypted: i=1; AJvYcCWP+KJ5A31uo+U+9zl4b1nLfCsuNNgNcdXCrfLT69k/QcwUx3x0uITZu7M/NDXfg6xfZ19KXdxRsjGpjt34By7m@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8q2zmjAD4qsI2nz67I5Py0BbSZPeR5uFTlZXJ3GGlM4IAoRHH
	KW1j2mCKzFiV3a5AwU85F+2vIBRplCKMZKqBrceRL/GiYgKvPOtH
X-Gm-Gg: ASbGncsqgWgrhPfRA+Rlt6P0UqojfN/RD//7KjaRO7RN9Z/WGWk4vz4qP/sIdrkJoVq
	vnm1YuHE8JGBMaIZtGE0q1QIuCNdHzk+nMnRb1gs+3RezbdQre667vW5OKNefNCA/O2F/IMNNHb
	9tgWv7CGGpUVffhIhlJg590gXqSUQIMvnjmE305E0UMqroRH9wG7lF5pnxMqSckb+gSK+zrU/CH
	o6viKHgoqMyRtCRAfM/5AObH8yNbn3fGTitDtRmumRouT0JGNaJ9sdjzdEbL/fQH32mtIW6KDlj
	nKI3FCiXP0SZnm/0or5sIpHdZnsTiTkt9WClS+TlRkqlEDQNoQaNfgz38Vw6NbuclJ9MEhl2AL3
	heQ==
X-Google-Smtp-Source: AGHT+IGYT0xEanrn1VszJ1wJSKytc/CMY4TaQR5OCqX/LZsid53fc32kk2bD91HzBNyw8KyfmgwniA==
X-Received: by 2002:a05:6102:4191:b0:4bb:c24b:b623 with SMTP id ada2fe7eead31-4bbf568bd5amr8493930137.19.1739507647222;
        Thu, 13 Feb 2025 20:34:07 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-868e857f2desm422800241.10.2025.02.13.20.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 20:34:06 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: andi.shyti@kernel.org,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v3 3/3] spi: s3c64xx: add support exynos990-spi to new port config data
Date: Fri, 14 Feb 2025 04:33:43 +0000
Message-Id: <20250214043343.263-4-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250214043343.263-1-wachiturroxd150@gmail.com>
References: <20250214043343.263-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_203408_466082_EE08826C 
X-CRM114-Status: GOOD (  15.95  )
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

Exynos990 uses the same version of USI SPI (v2.1) as the GS101.
Removed fifo_lvl_mask and rx_lvl_offset, and changed to the new data
configuration port.

The difference from other new port configuration data is that fifo_depth
is only specified in fifo-depth in DT.

Exynos 990 data for SPI:
- The depth of the FIFO is not the same size on all nodes.
  A depth of 64 bytes is used on most nodes,
  while a depth of 256 bytes is used on 3 specific nodes (SPI 8/9/10).
- The Exynos 990 only allows access to 32-bit registers.
  If access is attempted with a different size, an error interrupt
  is generated. Therefore, it is necessary to perform write accesses to
  registers in 32-bit blocks.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/spi/spi-s3c64xx.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index dae63a105..88d751c69 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1588,6 +1588,20 @@ static const struct s3c64xx_spi_port_config exynos850_spi_port_config = {
 	.quirks		= S3C64XX_SPI_QUIRK_CS_AUTO,
 };
 
+static const struct s3c64xx_spi_port_config exynos990_spi_port_config = {
+	/* If not specified in DT, defaults to 64 */
+	.fifo_depth     = 64,
+	.rx_fifomask    = S3C64XX_SPI_ST_RX_FIFO_RDY_V2,
+	.tx_fifomask    = S3C64XX_SPI_ST_TX_FIFO_RDY_V2,
+	.tx_st_done     = 25,
+	.clk_div        = 4,
+	.high_speed     = true,
+	.clk_from_cmu   = true,
+	.has_loopback   = true,
+	.use_32bit_io   = true,
+	.quirks         = S3C64XX_SPI_QUIRK_CS_AUTO,
+};
+
 static const struct s3c64xx_spi_port_config exynosautov9_spi_port_config = {
 	/* fifo_lvl_mask is deprecated. Use {rx, tx}_fifomask instead. */
 	.fifo_lvl_mask	= { 0x1ff, 0x1ff, 0x7f, 0x7f, 0x7f, 0x7f, 0x1ff, 0x7f,
@@ -1666,6 +1680,9 @@ static const struct of_device_id s3c64xx_spi_dt_match[] = {
 	{ .compatible = "samsung,exynos850-spi",
 			.data = &exynos850_spi_port_config,
 	},
+	{ .compatible = "samsung,exynos990-spi",
+			.data = &exynos990_spi_port_config,
+	},
 	{ .compatible = "samsung,exynosautov9-spi",
 			.data = &exynosautov9_spi_port_config,
 	},
-- 
2.48.1


