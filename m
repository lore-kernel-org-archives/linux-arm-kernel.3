Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946BEC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 22:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5xkd5rT9wUgRW3DUsokQnKDvE7TCE8CtMzGLaY1JBw=; b=rOb939YRbQVQPN1TXOCbYnWkVh
	Jxx79Rf14thN9q+g2ZD9H18lkWe5G6NiZYJRKpOyTOcqQi5Xu91Vl5uWQzR50o32dLevVkOhUz0RN
	+RyswRuuCZQFtUQTEt0E+2PF9CRLSPh4gz7eq3QJUNplY3SsoP3BpJXHl4kXvZck17eRf0xgAVFPq
	lcl0QJZ9HMteQ5qJUzWXxrFYjFxnZ9PXqQh4HgBg31ik9P9ufWT9NVJiN2H+m/QWt/U/sb8tXs8+n
	uCLtP4Rlr/dlVyvOwJxCPX8MIDvuecx4mOH+EO4bqIn4EI87DwiQ+hJKR7lGuWN/SmM4rdNP6AaDL
	10xx9Jbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfo1O-00000004klA-2ej5;
	Wed, 05 Feb 2025 22:37:26 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfnpy-00000004j6B-0QbJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 22:25:39 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-4afe4f1ce18so85842137.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 14:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738794337; x=1739399137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5xkd5rT9wUgRW3DUsokQnKDvE7TCE8CtMzGLaY1JBw=;
        b=irdHHkNOAnfwY0YXpIB7il0MwDOJd/XvtveoinhxenaCMQab2o7OkJbztg5NCIe9Fu
         Q/myS0Bhqa9ywKW15rcBsw/NpPRA2Yh27R44JL9yfxOp6qMbCOykYTcPzgKhYvgv64Y8
         SMG2jcuJ/A1aD/iKGctttY5QbKyStV8JY2EkbsxBfinGb9LDBbyMznqI9RQ9QtA3kYqY
         3ss2vM+nRzRjuhPwDAlIdpvAN4Tkk0o4QoYqL+Kn5YdjLNrK6n6SkFmUA+NlpPozQrb7
         iVVjkjkoRtOpgEozgnkbe6AV4zSspzBSWrthGoXHs++Gqij2tHgnRL8LrAUtBoDW9zTq
         Vxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738794337; x=1739399137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5xkd5rT9wUgRW3DUsokQnKDvE7TCE8CtMzGLaY1JBw=;
        b=X2zJ59TIgODHtZ0Sqr8xvvvYeXMRpzHCofarrLOAIFA4JIrNTwMvTpXrP/hzZI6JLt
         bSc9Yp1r+hOGXAOmceYRMn66v3Cj2rlRqU+OvUj7yyOV9iuzf7pJGQNp09MO1t2Bgoow
         Le14jwrHLasUsmbFeoZE7qaVNMUQsj0PgDiXRjcbFHaNs4wXUj+LZC5tP0P00hYskeXX
         +GxmL7Lz02ENbGF/Wmt3syn7jKgiLF2z0LG8O2ADqlw7PmmBRXZQQk8M+r202WRduJ+w
         r7jTTtoCfXEJhUN2NI9gpFmrFL4gTn0tbZpH9Keh1HMT6aWEcQQOR7dnntFffT6TzIhP
         cxqw==
X-Forwarded-Encrypted: i=1; AJvYcCWg+WU3yBopjsH63oP3uDwtSg9iMOQv9sLfmWi28JUEgprzyuy/QnrigDua+lj3ysDbcBzj44SRaZVKYoHFB2s3@lists.infradead.org
X-Gm-Message-State: AOJu0YzedJu4DUbRoWArCTlcs2WerMiaQR3g0Ft8hOqvhlWAnWo569Fu
	DpkBZo4X4Dn+3m1oZefyBzzvhuhaDw68WMDgzYQzY2Grsku6UEVc
X-Gm-Gg: ASbGnctSeylYppl1fQC4RfCAyNLRloTZwWVthKMRsQidA/Reg4USm8otMdQSKuSTkPE
	x9LHKp6StX1OU4ZTag2aVX4OnkGV524L4kTbqjcXve9SkcQNPkabnXpXKu/E90N8ugzUmWvznIC
	YolmMyXYve6X0GTLHB3+1IrXk0SZcNRapQbtGH7UnMaynfSyo+SEK4q+pM8R7uHxBCgd5cbwPhG
	NecxDVCX8pYyy3hiTfei7LrqlzMPrnm5e0NFkpMtBxb6FMguwHRUcYu3RFJ6LzfZplAJdXacwor
	Z0LmGH9hJa7HdBksCT+Zxjkw6AtWItq23jnWoya47RksqaEgGHS1OBo0ZdxTJ4CNz6B/G8qJLbV
	DUw==
X-Google-Smtp-Source: AGHT+IGX27jCqcI1MnR7gOhw8BskvTBlBSzOqYsxe/kPSS2u9T2tZ7z6U3M/YmSUWd09bAr2G7LKUA==
X-Received: by 2002:a05:6102:418d:b0:4b2:7996:6ba4 with SMTP id ada2fe7eead31-4ba47ae4d3amr3246093137.25.1738794336852;
        Wed, 05 Feb 2025 14:25:36 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866941edbefsm2475354241.28.2025.02.05.14.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 14:25:36 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1 8/9] spi: s3c64xx: add support exynos990-spi to new port config data
Date: Wed,  5 Feb 2025 22:22:22 +0000
Message-Id: <20250205222223.613-9-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205222223.613-1-wachiturroxd150@gmail.com>
References: <20250205222223.613-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_142538_142991_FB5C9776 
X-CRM114-Status: GOOD (  13.46  )
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

Exynos990 has the same version of USI SPI (v2.1) as GS101.
Drop the fifo_lvl_mask and rx_lvl_offset and switch to the new port
config data.

Exynoos990 data for SPI:
- the FIFO depth is always the same size for exynos990
  (64 bytes and 256 bytes), sizes of 256 bytes will be put in DT.
- Exynos990 allows only accesses to 32-bit registers; otherwise, An
  error interrupt is generated. Perform write register accesses in
  32 bits.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/spi/spi-s3c64xx.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 389275dbc..d4cbbaa9a 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1586,6 +1586,19 @@ static const struct s3c64xx_spi_port_config exynos850_spi_port_config = {
 	.quirks		= S3C64XX_SPI_QUIRK_CS_AUTO,
 };
 
+static const struct s3c64xx_spi_port_config exynos990_spi_port_config = {
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
@@ -1664,6 +1677,9 @@ static const struct of_device_id s3c64xx_spi_dt_match[] = {
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
2.47.1


