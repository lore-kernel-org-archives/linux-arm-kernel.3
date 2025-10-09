Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88A2CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+a9iYqJpqXVwIHWraOT5j0C97VuoW2Ie5dr4EbbPbxg=; b=htxeCNGRuL9ITSPqKsQQthkhAz
	/op2Qe4m/nbZLnLdsLGO13ST2cqGqr1oclN766asRP7D0lrmH3O9Yfo10I2vYmO1TGSTLWTj8EJd2
	M659guHDBMV70vsJWeyUiov19/ykaHukprZXzUF4J4oF72r/+4hPMAO413w3H6aJJ7DOJaMvQXUze
	+yECnTNTqGGQTiVwiwSrsFOLjHgGj5tdz6PPWfPx2yMpc8MZymypgfeN0Y8mHoDY4eufrb3nP4d5d
	252ZV9U49zDB/wwqCjwMZzYbOuq4W6KFoW9w67PBJFEx2LC8N8QUQ7ErVWBSp0ajWwA4Y+CHqVGQ4
	o9GNkkKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6szM-00000006ZZy-2wdb;
	Thu, 09 Oct 2025 15:55:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6szJ-00000006ZXz-0s1w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:55:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025329; x=1791561329;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ldr0J4d8oLQ9xg/bEwW76/C7Vo+NvP/FYftwus6rV+g=;
  b=GMZCxAM86NXwwRcdRD9q3qL3c+mpCCqTRkBapgWl5pvJamk7PkBxqyrX
   5wCNFGdcNCH9RTnLw4WRwPb2CR8uf4HNe3wBteLC4oxNRzIC0TQ9z4+0h
   aOoAQU3AfCZDhSlVouqe/PCfBkj2xRzYe4/qI771C94Ew3iLEzSQ2RtaK
   yfc9nQaWYNcsl++ydGjA4SjmebTFW8jZqt44wLi5AZ/1EhKEOnnAnrBap
   42cV3KaWLPIBgezgW1Y8hxBjQTafqT0bYvI9kn/Heyi00yxp7pLkhrt7K
   mCfncbtH2NFZUXuDho/KKgiZwW+/AoyQbxu1QbvZFbJuJi+rUNp7S5/iP
   g==;
X-CSE-ConnectionGUID: oiXu0ae6SEGA7hK0w89rgw==
X-CSE-MsgGUID: QSddFo6vQrKs2L3VXBkHtQ==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="278928772"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:55:29 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:55:05 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:54:57 -0700
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
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Subject: [PATCH 13/18] media: microchip-isc: Store histogram data of all channels
Date: Thu, 9 Oct 2025 21:22:46 +0530
Message-ID: <20251009155251.102472-14-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_085529_266066_8ECA1893 
X-CRM114-Status: GOOD (  13.68  )
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

Store the histogram data for all 4 channels(R, B, GR, GB). The data of each
channel is available on one interrupt. We need 4 interrupt cycles to get
all four channels. Store all the channels in a 2D array. This data is later
passed to the application buffer when it requests for a dequeue.

Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c  | 2 +-
 drivers/media/platform/microchip/microchip-isc-stats.c | 2 +-
 drivers/media/platform/microchip/microchip-isc.h       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index e9bd191f042b..6651be6fcb57 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1225,7 +1225,7 @@ static void isc_hist_count(struct isc_device *isc, u32 *min, u32 *max)
 	struct regmap *regmap = isc->regmap;
 	struct isc_ctrls *ctrls = &isc->ctrls;
 	u32 *hist_count = &ctrls->hist_count[ctrls->hist_id];
-	u32 *hist_entry = &ctrls->hist_entry[0];
+	u32 *hist_entry = &ctrls->hist_entry[ctrls->hist_id][0];
 	u32 i;
 
 	*min = 0;
diff --git a/drivers/media/platform/microchip/microchip-isc-stats.c b/drivers/media/platform/microchip/microchip-isc-stats.c
index d7813c9d95ac..1f3d1ea75005 100644
--- a/drivers/media/platform/microchip/microchip-isc-stats.c
+++ b/drivers/media/platform/microchip/microchip-isc-stats.c
@@ -298,7 +298,7 @@ static void isc_stats_fill_data(struct isc_stats *stats,
 
 	/* Copy existing histogram data from AWB work function */
 	for (c = 0; c < HIST_BAYER; c++) {
-		memcpy(pbuf->hist[c].hist_bins, isc->full_hist_data[c],
+		memcpy(pbuf->hist[c].hist_bins, &isc->ctrls.hist_entry[0][c],
 		       sizeof(pbuf->hist[c].hist_bins));
 
 		pbuf->hist[c].hist_min = ctrls->hist_minmax[c][HIST_MIN_INDEX];
diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/media/platform/microchip/microchip-isc.h
index 35dfd2501ea2..fcb20669ef69 100644
--- a/drivers/media/platform/microchip/microchip-isc.h
+++ b/drivers/media/platform/microchip/microchip-isc.h
@@ -151,7 +151,7 @@ struct isc_ctrls {
 	u32 gain[HIST_BAYER];
 	s32 offset[HIST_BAYER];
 
-	u32 hist_entry[HIST_ENTRIES];
+	u32 hist_entry[HIST_BAYER][HIST_ENTRIES];
 	u32 hist_count[HIST_BAYER];
 	u8 hist_id;
 	u8 hist_stat;
-- 
2.34.1


