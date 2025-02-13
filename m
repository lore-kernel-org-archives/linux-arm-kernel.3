Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E46FC021A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 20:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUETjozF1sAV1HRzCHDJTOKm9OqmezyE1AGTSwfrSB0=; b=ZRk0lR3IYL9hwX5/kQBpTxQvnZ
	WWn261X2neNiwO8G5lJpYKByqN1CasuBOnQlE/vYbO3s7YdDeV0v896J6amtvl79dSsxOcyZmxrgn
	ESCdJ26BKmoPRQTi0HmIWpcoPGByOyCs10fAW6puzNbUEhpTLX1hYod4zPz9hvzLilZMv59m73PcC
	hdORqEN2ZIoTJrXFoNcishOGsCMYLtVqQ18P7kDQG/XzBBmMviASeAZipOj3E26uzSoPfiO59u1eM
	k/mcIDrCLgaCfoZLA108GAexf4DsOZgmOIuWaKrdB9o1VLwABJULPH1ROBZfFdWdfvAyklkIHe9BS
	RzylzTBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tig5P-0000000Cacb-27gV;
	Thu, 13 Feb 2025 20:45:27 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tig1G-0000000CZNj-0bW6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 20:41:11 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-5205d9da0d7so364881e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 12:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739479269; x=1740084069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUETjozF1sAV1HRzCHDJTOKm9OqmezyE1AGTSwfrSB0=;
        b=RciVVidvnjK13frOFjkBjeGwxTaK16lyJ7aYZYzn2ZFwx+GVi9kf+O6A4Vp4ZkwHt2
         PAmvQvF/MRmzXbnyPJdCWUNaLabZzXx3VyiVgKZLfvCnDqcry3tGEiZGWKYwGiOfp/el
         1GbXbmFbJ6ZG62jx3haz6UD2PiZc6A3eclkoDVb6D1B6azRvApugnyet7XuSlPpBPs93
         RSPFSEn2DY4DHSEu5qUGFYIVxNqvecZaC4qwgpslN0QZQXbWAXqaZ1kCiWjDLFYuE63H
         mKsN4KI+wIChnwZFiPwLQkkMtBZHo2U924SRBYPp4/x049KHsBgZZGpxvaZGuR7NkOyb
         4KQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739479269; x=1740084069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUETjozF1sAV1HRzCHDJTOKm9OqmezyE1AGTSwfrSB0=;
        b=H8kZgmusrGU3VLZGGYCq2ZOzC2l8Qrz9hhFg0epFMAKeuEByBtb76cdmsnwInJ8z3G
         ivgDUlBbu19h0CtPFHPvvP2WRH/1ealf4e8a5nd16gVROjaNDz14bYBxwB8YnpDnVt8y
         cgZNMAzcU2b+emgiq7lu0frsmYyUOVoP3sNXgsm0Ul7nAYySodzCmTL9dOSOsA508Zhz
         p+DYOxN4KgKM7bhlniPzCYf3oETDul3A0Tv3IzJgo0e25RdpC8R02XuyJ+1tpXGPWkl/
         7e579oFJtcJ9/xK0TVk5lmUR0+MsEx+RW2Yfj2Zel1Mx0OYAtxWgzIpCAD5SDdkpleyT
         8OUg==
X-Forwarded-Encrypted: i=1; AJvYcCVZAeSXIErAggZa4WVUah9zditRA9IcgLYexlgBTYb9FWAFc55qn3ag95jglF/c6pEgxNgNPOnhNuYo0sTbi9mo@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9iW4AjJ4lhL7WYJdHAtSvxW6FQhnfE+xxgSIpEK3VUNV/N4RZ
	vMkuCLvhM0Nvo3DW5u7bEmA3EIQeZZLAffLPQZIWiuKNf0SbHzDk
X-Gm-Gg: ASbGncuxyLaRij8eG3N8zkO7FmMwMD+V9yFhLqbxRUFkRLOhm7hs71m3oN1xeIPSJHe
	f4x413X4YSOEibXGcxm1siC9ZTtKKPjSyepBTOPRmNvgYKkHdUx41jWrBcisS3W6wQfZ4dwLTKc
	2IoBnBXtnMFtWY2oCu38h61ubL9R7nguKeEZpr5MIeIenkV0lDnJwsteTJAXBiccCuy+Nq3HRGE
	bueR/rn76Mg4+kVs3uJsvbuM8PO8zmQD6LDcDLE/OEjwkwh+yBrbhRn+yNLtej4ymPtQDkM3S9i
	KrmNr4aVrggP2L/55KXlY9q4/iZM14Foa2xyGqD2VLBpqeoR8faU5GW1iygKBgCO7MaA6XGm2sY
	KAA==
X-Google-Smtp-Source: AGHT+IHXSWpNKt7Pd1wu4O/V5ZcIgriucI8y2fDXNJrEQw8A9Foh3kO6pxXQxDdlqsXOjqgU4No96Q==
X-Received: by 2002:a05:6122:32cb:b0:520:5f0a:b5a5 with SMTP id 71dfb90a1353d-52077ee259emr3992376e0c.6.1739479269272;
        Thu, 13 Feb 2025 12:41:09 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5207aa40088sm285572e0c.10.2025.02.13.12.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 12:41:08 -0800 (PST)
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
Subject: [PATCH v2 2/2] spi: s3c64xx: add support exynos990-spi to new port config data
Date: Thu, 13 Feb 2025 20:40:44 +0000
Message-Id: <20250213204044.660-3-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213204044.660-1-wachiturroxd150@gmail.com>
References: <20250213204044.660-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_124110_180646_667D4871 
X-CRM114-Status: GOOD (  16.17  )
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
- To prevent potential issues when fifo-depth is not explicitly set in
  DT, a default value of 64 is assigned to ensure stable operation.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/spi/spi-s3c64xx.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 389275dbc..5f55763f9 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1586,6 +1586,20 @@ static const struct s3c64xx_spi_port_config exynos850_spi_port_config = {
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


