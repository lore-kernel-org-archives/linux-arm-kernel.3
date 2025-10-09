Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C63ECCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJdz2UUU/33e2bX/Qwu7QBFUGuN6OGivBHZdUWi6f7Q=; b=ekkBmdWvvO/Hl2ksOtk2qm9kCR
	iMpsWn9+YO4cFzAUvNurxLflrC1r0GPEO6PGDsxv/eJYpK7PGimExrIb1iQ+HQuPzCYpCff6ZkniN
	HirigbQOKxdJFgP3U68OFoJzSQzFbHfw8yQYmerieogxiNziqvYVduh3CNZ6aT07uLDSxRPrMMkD6
	bnJvaYDo9RWE5W46AosRMfbwlHKxFOPme1++PzyYdBgCuPDj14ucPNpcplqdvV9cDdPwdVEiFWwmp
	GfDXuQDJhrva3LFU9k+exNejhLok9QCt2xP9BN1bFaBYq9S2HvPscARcksllVWgAFXfUYxNP5PiLI
	lrFlGv4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sxw-00000006YR4-0iUY;
	Thu, 09 Oct 2025 15:54:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sxt-00000006YPo-0H54
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:54:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025241; x=1791561241;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HhopEnfXxoWrfgJ4xCvMufOgsASq4oytV0XNPkQ6TFE=;
  b=gY0ZeR4caLDMx9q+kwbO0CxoNEeOrDESD+zLeMB5u0rRf2HSOxQ5mSsH
   B9UW3DTMFeFCJ6MkNaUYWAZC2bIxxF51k7onCqeS3hTBf9/RdovXgAd9N
   6klY2p1a+qQU9o0NtK0gKTcu336VbiNPrRNf3Bgod6aUnL6kZHCU8Id8m
   YHDEvCY4kRO+GqxosEHgW43BkapKI9KnLKs4hX5Fe+M44U6nZZRJiQlPt
   fHNFO7/wUb8Y/910ODkTmpSjJwQQLAxU+rtQeyGJcpTYaAU5x4+7fFU6W
   Yn8QlWG/gm9OxL8Zm666cMR/Uhdxv5uWsPIRIJ+eWiYc1nUQrM5UR1/iA
   w==;
X-CSE-ConnectionGUID: /pWBC8reTeqGekq1nPl3zQ==
X-CSE-MsgGUID: D+FGj4Y6S3azHFbGcI4IEg==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="48057848"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:53:58 -0700
Received: from chn-vm-ex2.mchp-main.com (10.10.87.31) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:53:58 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.20; Thu, 9 Oct 2025 08:53:58 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:53:50 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Eugen Hristev <eugen.hristev@linaro.org>, Chas Williams
	<3chas3@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Balakrishnan Sambath
	<balakrishnan.s@microchip.com>, Hans Verkuil <hverkuil@kernel.org>, "Ricardo
 Ribalda" <ribalda@chromium.org>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Daniel Scally
	<dan.scally+renesas@ideasonboard.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-atm-general@lists.sourceforge.net>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 05/18] media: microchip-isc: Use channel averages for Grey World AWB
Date: Thu, 9 Oct 2025 21:22:38 +0530
Message-ID: <20251009155251.102472-6-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_085401_201121_A6416517 
X-CRM114-Status: GOOD (  15.72  )
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

From: Balakrishnan Sambath <balakrishnan.s@microchip.com>

Replace pixel counting with actual pixel intensity averages in Grey
World algorithm for more accurate white balance calculation.This
provides better color correction especially in mixed lighting
conditions.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../platform/microchip/microchip-isc-base.c   | 35 ++++++++++---------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index 956bdea830e3..bb2dd69a83f0 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1317,7 +1317,6 @@ static void isc_hist_count(struct isc_device *isc, u32 *min, u32 *max)
 static void isc_wb_update(struct isc_ctrls *ctrls)
 {
 	struct isc_device *isc = container_of(ctrls, struct isc_device, ctrls);
-	u32 *hist_count = &ctrls->hist_count[0];
 	u32 c, offset[4];
 	u64 avg = 0;
 	/* We compute two gains, stretch gain and grey world gain */
@@ -1328,10 +1327,10 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
 	 * them towards the green channel.
 	 * Thus we want to keep Green as fixed and adjust only Red/Blue
 	 * Compute the average of the both green channels first
+	 * Use channel averages for Grey World algorithm
 	 */
-	avg = (u64)hist_count[ISC_HIS_CFG_MODE_GR] +
-		(u64)hist_count[ISC_HIS_CFG_MODE_GB];
-	avg >>= 1;
+	avg = (ctrls->channel_avg[ISC_HIS_CFG_MODE_GR] +
+			ctrls->channel_avg[ISC_HIS_CFG_MODE_GB]) >> 1;
 
 	dev_dbg(isc->dev, "isc wb: green components average %llu\n", avg);
 
@@ -1340,6 +1339,11 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
 		return;
 
 	for (c = ISC_HIS_CFG_MODE_GR; c <= ISC_HIS_CFG_MODE_B; c++) {
+		u32 hist_min = ctrls->hist_minmax[c][HIST_MIN_INDEX];
+		u32 hist_max = ctrls->hist_minmax[c][HIST_MAX_INDEX];
+		u32 channel_avg = ctrls->channel_avg[c];
+		u32 total_pixels = ctrls->total_pixels[c];
+
 		/*
 		 * the color offset is the minimum value of the histogram.
 		 * we stretch this color to the full range by substracting
@@ -1373,23 +1377,21 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
 		 * decimals
 		 */
 		s_gain[c] = (HIST_ENTRIES << 9) /
-			(ctrls->hist_minmax[c][HIST_MAX_INDEX] -
-			ctrls->hist_minmax[c][HIST_MIN_INDEX] + 1);
+			(hist_max - hist_min + 1);
 
 		/*
-		 * Now we have to compute the gain w.r.t. the average.
-		 * Add/lose gain to the component towards the average.
-		 * If it happens that the component is zero, use the
-		 * fixed point value : 1.0 gain.
+		 * Grey World gain using channel averages
+		 * This is much more accurate than using hist_count
 		 */
-		if (hist_count[c])
-			gw_gain[c] = div_u64(avg << 9, hist_count[c]);
+		if (channel_avg > 0 && total_pixels > 1000)
+			gw_gain[c] = div64_u64((avg << 9), channel_avg);
 		else
 			gw_gain[c] = 1 << 9;
 
 		dev_dbg(isc->dev,
-			"isc wb: component %d, s_gain %u, gw_gain %u\n",
-			c, s_gain[c], gw_gain[c]);
+			"isc wb: component %d, black_level=%u, avg=%u, s_gain=%u, gw_gain=%u",
+			c, hist_min, channel_avg, s_gain[c], gw_gain[c]);
+
 		/* multiply both gains and adjust for decimals */
 		ctrls->gain[c] = s_gain[c] * gw_gain[c];
 		ctrls->gain[c] >>= 9;
@@ -1397,8 +1399,9 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
 		/* make sure we are not out of range */
 		ctrls->gain[c] = clamp_val(ctrls->gain[c], 0, GENMASK(12, 0));
 
-		dev_dbg(isc->dev, "isc wb: component %d, final gain %u\n",
-			c, ctrls->gain[c]);
+		dev_dbg(isc->dev,
+			"isc wb: component %d, final gain %u, offset %d\n",
+			c, ctrls->gain[c], ctrls->offset[c]);
 	}
 }
 
-- 
2.34.1


