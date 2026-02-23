Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B51EA4FC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 14:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HF8zGd0aQsQ7XGLlCXNxkoglDdo4nbAe1+o0vmFJQiQ=; b=zPHQ8wEUpmCdlOJIw4pnz1Bckg
	8SJ8ZXrRb7dsThGNZ/l2UQ0h6hhJ4/PUUApKFp2tP/WHpa/cvQoc2Qfv40EikpVW81IX5OavvfmLD
	I+MkgaIsHY8m4QtHm9oLDxN0qh049HihAL7toBHaeIydXFJoc2sff6IQ9s9uctNapDMK9wyDyp8q+
	JBZjg10BoQONp60H5oxHu+WVHpmV6UVdW7iXlfZPeOBcTGYDW1VPPdmK41/xXzDYOL15MTiK1iRuz
	JAy59+HFCKhzjp6CyPfs9JsMaep9UjVl+BpftKILmxC8vtmD+vJ1hA6yvktx/Qqk4Xb6coH9jBQEx
	sQRLh8jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXB4-00000000UhA-0g4J;
	Mon, 23 Feb 2026 14:44:50 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXB0-00000000UgU-3lmZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 14:44:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771857887; x=1803393887;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Y32WQTAqs2UW8D2aV2XoqsENrdmy1i9tl4k6oIU2vyM=;
  b=hM78A/qRdcFgVC1KSKIT4YQCmWuAX9d2u2a/clcBYSy9bsicYa/ufrtI
   FwdMR+AXS2dGzssITr1Fsg1Usz1WbUa222TevxarZiGMDNQ60Hk0FTDF8
   yG1RkReYYTTu3/7W69cpQkmqAXAnvLs/UVBCd+AdHBhfxov7Os/UmIanT
   t2TdLBt10AF180d2qc2y7+mI0JTF6UlGgnJrK5B1QsXCh8Y7pcXEZ8kkP
   pvBI2j8zcl0nqVUZBTM1PYYqiM34cSgLmu/21eNS7NYmuKg0RnWInIcGk
   IfoEfs0eSR4TbxobYJaPqESAN6rZvyaqjWoDW8xHeg++SFaPw14XLjP3o
   A==;
X-CSE-ConnectionGUID: 0orXmt0AQ2SSERcXnNKm0w==
X-CSE-MsgGUID: x6icF0RgQVSm8xTCJNYP5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72952941"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="72952941"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:44:43 -0800
X-CSE-ConnectionGUID: sz06HygHSkKYk9AzfMvJnQ==
X-CSE-MsgGUID: QE4nOGsiTn6o4l29nknJHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="215600415"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 23 Feb 2026 06:44:41 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 060CC99; Mon, 23 Feb 2026 15:44:40 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 1/1] spi: pxa2xx: use min() instead of min_t()
Date: Mon, 23 Feb 2026 15:44:37 +0100
Message-ID: <20260223144437.2836369-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_064446_947318_67145E1F 
X-CRM114-Status: GOOD (  12.08  )
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

min_t(int, a, b) casts an 'unsigned long' to 'int'. This might lead
to the cases when big number is wrongly chosen. On the other hand,
the SPI transfer speed rate is unsigned and driver uses signed type
for an unknown reason. Change the type of the SPI transfer speed
to be unsigned and convert to use min() instead of min_t().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi-pxa2xx.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index f7881a31e4cc..23e40f410814 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -796,7 +796,7 @@ static irqreturn_t ssp_int(int irq, void *dev_id)
  * The function calculates parameters for all cases and chooses the one closest
  * to the asked baud rate.
  */
-static unsigned int quark_x1000_get_clk_div(int rate, u32 *dds)
+static unsigned int quark_x1000_get_clk_div(unsigned long rate, u32 *dds)
 {
 	unsigned long xtal = 200000000;
 	unsigned long fref = xtal / 2;		/* mandatory division by 2,
@@ -885,12 +885,12 @@ static unsigned int quark_x1000_get_clk_div(int rate, u32 *dds)
 	return q - 1;
 }
 
-static unsigned int ssp_get_clk_div(struct driver_data *drv_data, int rate)
+static unsigned int ssp_get_clk_div(struct driver_data *drv_data, unsigned long rate)
 {
 	unsigned long ssp_clk = drv_data->controller->max_speed_hz;
 	const struct ssp_device *ssp = drv_data->ssp;
 
-	rate = min_t(int, ssp_clk, rate);
+	rate = min(ssp_clk, rate);
 
 	/*
 	 * Calculate the divisor for the SCR (Serial Clock Rate), avoiding
@@ -902,8 +902,7 @@ static unsigned int ssp_get_clk_div(struct driver_data *drv_data, int rate)
 		return (DIV_ROUND_UP(ssp_clk, rate) - 1)  & 0xfff;
 }
 
-static unsigned int pxa2xx_ssp_get_clk_div(struct driver_data *drv_data,
-					   int rate)
+static unsigned int pxa2xx_ssp_get_clk_div(struct driver_data *drv_data, unsigned long rate)
 {
 	struct chip_data *chip =
 		spi_get_ctldata(drv_data->controller->cur_msg->spi);
-- 
2.50.1


