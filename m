Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6576DE98E14
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dF8woYYWVdUzyW/BBWzxWSX4U7ZuUG+iBq1//eM8ykg=; b=t7bK3uGEpNDcRo4aNeCMGzSHf2
	iahZQj6h8K6PdBw/JxTF4hJJxYv6S7tOlwB8hJnvShGGWFTvhQz5NTybHkJ4fgYAF3DUzjkRvVD9E
	L72PbCQbAC7rYFwKgyrFHzpW05pWFu3/7VT2/iD59lJp9h3H7/BaR6rQSKFmF72s1KUlgrGxwxYcm
	AaKjIVX0dQzgElOsrkt1wneYjcVknt1SyWlmJ5u2N77SQY7pfXHklDM7Y8ItDJTQw/n7oaHC2teOv
	mVcdWoW7kA658Tf66r2hnfgZYehYdkMS9VKJoDb+YGiFyKFejEKIFzePK13Y4k2XkcM9Gb8CAn281
	tCJ3GHNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuT3C-000000002GT-2rK1;
	Mon, 23 Feb 2026 10:20:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuT35-000000002EZ-2lf5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 10:20:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1771842019; x=1803378019;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SlO0Q8vJ+yci4yGpTaLDlVlevoqk4pzFvMHvGyAYDTE=;
  b=YlkMoh8hjzH6zBINYhcuEmjAoa5Op7a9ZjqO3CBea8CuQ+mPE3e6p2IP
   4a2Te37ahHd3JFFsXzm7uHCHn5fghX7F7JU4OVWJnnDyk1ZAG1HvGmgVj
   HJcewuEgi6HcPTmuAJNAKoShS3zOrSVl++KDEdYFDq/Ty3xCG6130XNLV
   7zZqeIduJE1N4cr35kVX3WaTzfp8U2V3VyLI/RIUtX4J1uw0IsAJiMsv8
   9CLpyLc11Jdoyttb2mRHZgXMcq+yXd8cunNkiyZxWkndGWLNWLF8lvGKv
   EEA18X3pW+jc38vH5ZaPktciFUc0rMVuuqVgZPdKZpSxcPvoBH/Hfw6Bi
   A==;
X-CSE-ConnectionGUID: dKUGnVN8SY6a+wGmQv7obw==
X-CSE-MsgGUID: By9YC4OeSqy+Ol2Ny+ULhg==
X-IronPort-AV: E=Sophos;i="6.21,306,1763449200"; 
   d="scan'208";a="220994662"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Feb 2026 03:20:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 23 Feb 2026 03:20:04 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 23 Feb 2026 03:20:00 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v3 3/4] drm: atmel-hlcdc: bypass clock divider for LVDS displays
Date: Mon, 23 Feb 2026 15:49:19 +0530
Message-ID: <20260223101920.284697-4-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260223101920.284697-1-manikandan.m@microchip.com>
References: <20260223101920.284697-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_022019_792563_E797D09C 
X-CRM114-Status: GOOD (  15.12  )
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

For LVDS displays with pre-configured PLL clock, bypass the clock
divider calculation by setting ATMEL_XLCDC_CLKBYP flag.
For non-LVDS displays, retain existing clock divider calculation logic
to determine appropriate clock scaling based on display requirements.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
changes in v3:
- Introduce ATMEL_XLCDC_CLKBYP to this series
---
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 65 ++++++++++---------
 include/linux/mfd/atmel-hlcdc.h               |  1 +
 2 files changed, 36 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index 26c9fbdfd871..73ac5ebbe121 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -127,39 +127,44 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 		     (adj->crtc_hdisplay - 1) |
 		     ((adj->crtc_vdisplay - 1) << 16));
 
-	prate = clk_get_rate(crtc->dc->hlcdc->sys_clk);
-	mode_rate = adj->crtc_clock * 1000;
-	if (!crtc->dc->desc->fixed_clksrc) {
-		prate *= 2;
-		cfg |= ATMEL_HLCDC_CLKSEL;
-		mask |= ATMEL_HLCDC_CLKSEL;
-	}
+	if (crtc->dc->hlcdc->lvds_pll_clk) {
+		cfg |= ATMEL_XLCDC_CLKBYP;
+		mask |= ATMEL_XLCDC_CLKBYP;
+	} else {
+		prate = clk_get_rate(crtc->dc->hlcdc->sys_clk);
+		mode_rate = adj->crtc_clock * 1000;
+		if (!crtc->dc->desc->fixed_clksrc) {
+			prate *= 2;
+			cfg |= ATMEL_HLCDC_CLKSEL;
+			mask |= ATMEL_HLCDC_CLKSEL;
+		}
 
-	div = DIV_ROUND_UP(prate, mode_rate);
-	if (div < 2) {
-		div = 2;
-	} else if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK) {
-		/* The divider ended up too big, try a lower base rate. */
-		cfg &= ~ATMEL_HLCDC_CLKSEL;
-		prate /= 2;
 		div = DIV_ROUND_UP(prate, mode_rate);
-		if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK)
-			div = ATMEL_HLCDC_CLKDIV_MASK;
-	} else {
-		int div_low = prate / mode_rate;
-
-		if (div_low >= 2 &&
-		    (10 * (prate / div_low - mode_rate) <
-		     (mode_rate - prate / div)))
-			/*
-			 * At least 10 times better when using a higher
-			 * frequency than requested, instead of a lower.
-			 * So, go with that.
-			 */
-			div = div_low;
-	}
+		if (div < 2) {
+			div = 2;
+		} else if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK) {
+			/* The divider ended up too big, try a lower base rate. */
+			cfg &= ~ATMEL_HLCDC_CLKSEL;
+			prate /= 2;
+			div = DIV_ROUND_UP(prate, mode_rate);
+			if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK)
+				div = ATMEL_HLCDC_CLKDIV_MASK;
+		} else {
+			int div_low = prate / mode_rate;
+
+			if (div_low >= 2 &&
+			    (10 * (prate / div_low - mode_rate) <
+			     (mode_rate - prate / div)))
+				/*
+				 * At least 10 times better when using a higher
+				 * frequency than requested, instead of a lower.
+				 * So, go with that.
+				 */
+				div = div_low;
+		}
 
-	cfg |= ATMEL_HLCDC_CLKDIV(div);
+		cfg |= ATMEL_HLCDC_CLKDIV(div);
+	}
 
 	if (connector &&
 	    connector->display_info.bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
diff --git a/include/linux/mfd/atmel-hlcdc.h b/include/linux/mfd/atmel-hlcdc.h
index 07c2081867fd..19504d3ea12c 100644
--- a/include/linux/mfd/atmel-hlcdc.h
+++ b/include/linux/mfd/atmel-hlcdc.h
@@ -44,6 +44,7 @@
 #define ATMEL_XLCDC_HEO_UPDATE		BIT(3)
 
 #define ATMEL_HLCDC_CLKPOL		BIT(0)
+#define ATMEL_XLCDC_CLKBYP		BIT(1)
 #define ATMEL_HLCDC_CLKSEL		BIT(2)
 #define ATMEL_HLCDC_CLKPWMSEL		BIT(3)
 #define ATMEL_HLCDC_CGDIS(i)		BIT(8 + (i))
-- 
2.25.1


