Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFFEC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 19:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAcZy7EP1wYymX+WTQasCXu23XJ3kyVzZE5V/ow6XtQ=; b=Hni48upZ+Y3P/4/v9LMDy6iMhN
	LfbmbVUzI3rSnG8ODPQZL3AxOYaby+c6gcfysqGmqgc0woIodydxPdKC6rnBtnRnnLydzEnt71e1P
	knjtv5Bwd5EPtV7zw0tCKVwn9fs5/RtD3sEdkj2/q7BYy5pM4mLHJaBfnfE1iOA4mLkm2Mys5pahC
	RxkPjvZMplVZvrrXaDi7aRTroX56kOapQ5UcYnG7lbuu0aGBXK7eVOKUqvvDbczzXyAyjhdTcwWV4
	2rzSXD/36iZa5kB8k/bEuQ/fkC08Xvt9NSyiOjmSgZXlVSjEW1oZ7BuVbnoF5/+V3/pLUY5bzesWh
	VgxixB+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIEb-00000008bwl-0761;
	Wed, 12 Feb 2025 19:17:21 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIAW-00000008bG5-2Pfg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 19:13:09 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21f5268cf50so204065ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 11:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739387588; x=1739992388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAcZy7EP1wYymX+WTQasCXu23XJ3kyVzZE5V/ow6XtQ=;
        b=CaG0aYCm8lqrUblYIXhdWWFIEvy76Q0JR37ul5RJOQGYUkJWFn5+N+RvzyfpQm8PGb
         JfZvLKN8XEfm+1MR9YGUGYICbeenY94bxQYOxNLrcUIuB1Wp6qqSLhmICO6TDZ7u5jnV
         CK4NdPyPw50sa4jafwKVI0RZt/lhivafzNExeByuGYYoNsQKvL6xa1a6AU64JwexiqnS
         yjarEu6YjlQ9AO+KAm5ugW2vDWvolY1ESkjqAl5bNemMLifgiGOo28/HO0sWuW0mTufi
         D6mwk/WZ1BBZlKzaVV/0rO4TLbYctzIJYcaff5p6wYGBeqP8AGKv8dBb0vAHOo5PFq74
         4Ttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739387588; x=1739992388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EAcZy7EP1wYymX+WTQasCXu23XJ3kyVzZE5V/ow6XtQ=;
        b=jNAjBsAtM7atJ2ijgZQaAbQerEGdJwaOtCdtdQloMCIRYZvrPrDUexGQzSsM/SFoyR
         NfbdC10VdootYC9QgKUEge13ZDuttxg5hCSQP7A67Kam/8hz0uyBGyJyCe5DOw82O2ur
         YteB7OoLSw1DnTmgtuZ9LM3Gi1WNwOnyRWBm/DhCPSRBWYLOdL5UPsoCehO2tEySZyI5
         KmyXVolCBAXd04sTtnRvmNsiIBhbPpLA/jImECzFoeZjXlrGOzT83MrIxBzFzPHy+0Mf
         KCZicnJIO0dAq30ZgFFvMvP9pasfiiahQETGNeVh2X/ARp/7CnMR+z6JZRlPNBirxRIp
         59bw==
X-Forwarded-Encrypted: i=1; AJvYcCWj2xklZbIx6s9gR8BWHvcDl+sFY+XZBdo5j3vH+Ypp/60KSZXKcBrP/wFf/K6/swQg6NxM9c9xO34FyOH8NzAR@lists.infradead.org
X-Gm-Message-State: AOJu0YykqUbJ9bSGmWo5tSRQJzghROu27FIaSEnKLcNS/NMTT37ihfpZ
	wTDm9ZjmQ8xWSYwmf3khUdNFC6Qhx2+12NMo8bSKu78E2SBk7p3d
X-Gm-Gg: ASbGncvWWlNMonsxf/UeYuo0WpdLEvAZXQylMcEMFG4de4pkIxHyOmt9paZxVXngvhD
	HkujDXnZc9xZW2udTU20qYT4WbG3DETfSN2kBnDwawSNUQiZRwavW6vtx9naXPHFnkjORXi/8e6
	OjqXMvRvzsgXQrETPu5h+8KkuXszyQ24/Yd5JoeEYYTloreQ3NIVkLQXRmj3BibsbMtVTDGc1XH
	44VECmGurzJaXVKvKNN4nzLzfXb/J2sCZfSHWAs5OWO5GDeSp6SIcV0szD2kYGnQi9LOhtP8z21
	W3oYSZG02DQZDc1dYdwcq6+raIPtLb3+O5EuVIS5rnLbDsZyKAW6e6Brf0sffj3eYhN7IXQa99Z
	O1w==
X-Google-Smtp-Source: AGHT+IES8zzy1yn8GqIWJCTaFt+Q+QP4q0ZQlGuxDgXLN2Jp97ZBCOEbgBu+OmwDFI8AnMw/Zk7ZPw==
X-Received: by 2002:a05:6a20:7345:b0:1ee:3576:7299 with SMTP id adf61e73a8af0-1ee5e530c55mr7739207637.3.1739387587650;
        Wed, 12 Feb 2025 11:13:07 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ae7f79sm11536944b3a.77.2025.02.12.11.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 11:13:07 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: andi.shyti@kernel.org,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	peter.griffin@linaro.org,
	andre.draszik@linaro.org,
	tudor.ambarus@linaro.org,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1 2/2] spi: s3c64xx: add support exynos990-spi to new port config data
Date: Wed, 12 Feb 2025 19:12:41 +0000
Message-Id: <20250212191241.280-3-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250212191241.280-1-wachiturroxd150@gmail.com>
References: <20250212191241.280-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_111308_613379_FFB38F2C 
X-CRM114-Status: GOOD (  16.54  )
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
index 389275dbc..790034d2d 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1586,6 +1586,20 @@ static const struct s3c64xx_spi_port_config exynos850_spi_port_config = {
 	.quirks		= S3C64XX_SPI_QUIRK_CS_AUTO,
 };
 
+static const struct s3c64xx_spi_port_config exynos990_spi_port_config = {
+	/* fifo-depth must be specified in the device tree. */
+	.fifo_depth	= 0,
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
@@ -1664,6 +1678,9 @@ static const struct of_device_id s3c64xx_spi_dt_match[] = {
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


