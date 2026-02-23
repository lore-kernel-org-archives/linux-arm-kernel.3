Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D177AEA4FD5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 15:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MtFVfaoWdvUSrrcevOGzw3YmUDbfj41SYF7DuNQcPLU=; b=k0FW6b6SX0NW5mdBVv0LWcOHr7
	ysl0ArS4GHA0GdhhDQ+M6lONW+WinPTXgG7j2MHCL6T5aJcnG33R6U+APcy3n34Y7k3FtJO83HHMr
	P9Fjvs7jN087jdvxgw2UYkrnUZswJoAcx8qLq8z48IR4PEBTB9vNqdflP2cyYgDV23fLTDinUk3R9
	gdeVdfd7M0phJwfJQePumfnTA7NFybE6YbNXkRqFPH0ceoDVDT/L59qGMuEad1B8f4aReIneRDXYR
	fB/H969DPr4fFLEnMwWTwc5iztADPC3ef3PvPHh6kAdM1d1N2VTeNrDIZON0R1KAXoozZdJreM6vj
	HsOauv5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXuA-00000000Zpe-04C5;
	Mon, 23 Feb 2026 15:31:26 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXu6-00000000ZpA-1gk3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 15:31:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771860682; x=1803396682;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RTrWdFZssRl42W6iXmUkyx50O+uru7AE76dymReZQyE=;
  b=m1gPSrQFj0Erb09Ii++NpuhCQVHLJXhBjTOmmFa2mVkaOkbzwPx3/duf
   36ATTO5qcOmAPJetHMsuj5Z6DHUkbP6nrpqY8b/1bHEeGDgYTrmLzNvPk
   FObAV0Xtcj9ANgAZOxDan4jSzqG3e3LDEEK0WLlLmnLQOExZkbtgC5Eto
   D3KT8HhfjTvgiYzeGMm2ZT+JWfRIKQEZsP7+p0qYhGTXlDufwgrUQAVX7
   LclFX+VttueKoESDXQps8pr+RRmLioNmq7VlpoYoigb4k+DNXsPiYtKfO
   Y23qfOASNbmGtZZ0aiGk4Eq4UCsI4Xmvd+vR7+NhEBZBO8jUjZyqwb408
   w==;
X-CSE-ConnectionGUID: 8e7RGEqhSumSIKBH4y/zKQ==
X-CSE-MsgGUID: KVFCpjoFT829weHTznx7Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72760308"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="72760308"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 07:31:21 -0800
X-CSE-ConnectionGUID: 5J+watY/SiuJkLEqas+JOg==
X-CSE-MsgGUID: bGt+aK5aTOmSsieGJwTZWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="213524184"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 23 Feb 2026 07:31:19 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id BDE4B99; Mon, 23 Feb 2026 16:31:18 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 1/1] spi: pxa2xx: use min() instead of min_t()
Date: Mon, 23 Feb 2026 16:30:54 +0100
Message-ID: <20260223153117.2838840-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_073123_379908_0B18DE01 
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

min_t(int, a, b) casts an 'u32' to 'int'. This might lead to
the cases when big number is wrongly chosen. On the other hand,
the SPI transfer speed rate is unsigned and driver uses signed type
for an unknown reason. Change the type of the SPI transfer speed
to be unsigned and convert to use min() instead of min_t().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v2: used u32 instead of unsigned long (David)

 drivers/spi/spi-pxa2xx.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index f7881a31e4cc..6291d7c2e06f 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -796,7 +796,7 @@ static irqreturn_t ssp_int(int irq, void *dev_id)
  * The function calculates parameters for all cases and chooses the one closest
  * to the asked baud rate.
  */
-static unsigned int quark_x1000_get_clk_div(int rate, u32 *dds)
+static unsigned int quark_x1000_get_clk_div(u32 rate, u32 *dds)
 {
 	unsigned long xtal = 200000000;
 	unsigned long fref = xtal / 2;		/* mandatory division by 2,
@@ -885,12 +885,12 @@ static unsigned int quark_x1000_get_clk_div(int rate, u32 *dds)
 	return q - 1;
 }
 
-static unsigned int ssp_get_clk_div(struct driver_data *drv_data, int rate)
+static unsigned int ssp_get_clk_div(struct driver_data *drv_data, u32 rate)
 {
-	unsigned long ssp_clk = drv_data->controller->max_speed_hz;
+	u32 ssp_clk = drv_data->controller->max_speed_hz;
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
+static unsigned int pxa2xx_ssp_get_clk_div(struct driver_data *drv_data, u32 rate)
 {
 	struct chip_data *chip =
 		spi_get_ctldata(drv_data->controller->cur_msg->spi);
-- 
2.50.1


