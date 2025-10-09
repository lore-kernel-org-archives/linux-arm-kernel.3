Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094DBCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4HQXTAEJ7k+ddx5IWzjKsytrYbylgpBhJU70YcY9pg=; b=GpXlUtwaql6K2gXR/8g4krGzDv
	CrVzEWGuHKY/vzvHQt8ibMxTRYHhBm8V6K38VCXMOidfPbgFJIERJrIv/CizJZsVRYz8ItUGS2BGc
	qBzKyfl3RELLf1Raf0t5maYP+7/lyialR2hswjfl7ZXfCYfjBNLd/rIWxpPOO3u/d3IuBnHhhLO51
	LfLEk5cFQYcBRMDYIz5JV6UEJ5VauZCd+kph8FjeMczDKZzZ3lDzs326uyi8KaxE39V5DJRBTMI1j
	OnAijQX1SyweF1dP8Ni6OWdGpxqZEQu+yvW3magcL9Wf2eoeUdjedoB1vqWbxXrUspk0Y00ABXnYD
	dx1W18fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sz0-00000006ZH6-09Qc;
	Thu, 09 Oct 2025 15:55:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6syw-00000006Z95-27hk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:55:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025306; x=1791561306;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HnJXNWDH9Usfh1fp5D5yBCiM1tYerwb8Pj7KlbBwaCM=;
  b=fZrZV9l8qKwMr/UZTN2Pf97/XiRtAdZGP6GCbsdQR44/ODVEkFI//RQ5
   qhf4JZnHWdfaZiU7MeUTUlMp+JmTlKHMBBEt+9nVZWhn5Nc06dz/t27D9
   yavw106Ga2nbIYNzjlcdRTnCdzzRFmhbMLCDqRBkcgeCLAqSp9dUXFf9X
   8Phqal6jDaZmBHaqs0jOVePolRg6AyQM+dm7QfOA6bwFyljADR5iCuG8x
   mmBOs8VSziSsiCyCsnGJrzwOj8O0Gn/aiF9PaF11IGYKwnfblT87JBo5Y
   V6HOcL/JztpwKLpS/9RTudIxbNFR8qAcvmEd00lq2G8nRykoeYHXDQZEM
   w==;
X-CSE-ConnectionGUID: 0EboOn8GRV2P1HnHTeE70A==
X-CSE-MsgGUID: GkfuCNVbTgm4xxOSCfUpBw==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="46946049"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:55:00 -0700
Received: from chn-vm-ex3.mchp-main.com (10.10.87.32) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:54:56 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.10; Thu, 9 Oct 2025 08:54:56 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:54:48 -0700
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
Subject: [PATCH 12/18] media: microchip-isc: Rename CBC to CBHS
Date: Thu, 9 Oct 2025 21:22:45 +0530
Message-ID: <20251009155251.102472-13-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_085506_611908_879127CF 
X-CRM114-Status: GOOD (  14.46  )
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

As per the datasheet the more relevant name for this enable bit is
"Contrast, Brightness, Hue and Saturation Control Enable"

Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c  | 10 +++++-----
 drivers/media/platform/microchip/microchip-isc.h       |  2 +-
 .../media/platform/microchip/microchip-sama5d2-isc.c   |  2 +-
 .../media/platform/microchip/microchip-sama7g5-isc.c   |  2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index ce22b4789ebd..e9bd191f042b 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -790,7 +790,7 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline = CFA_ENABLE |
 				WB_ENABLE | GAM_ENABLES | DPC_BLCENABLE |
-				DPC_GDCENABLE | CBC_ENABLE | CC_ENABLE;
+				DPC_GDCENABLE | CBHS_ENABLE | CC_ENABLE;
 		} else {
 			isc->try_config.bits_pipeline = 0x0;
 		}
@@ -800,7 +800,7 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline = CFA_ENABLE |
 				CSC_ENABLE | GAM_ENABLES | WB_ENABLE |
-				SUB420_ENABLE | SUB422_ENABLE | CBC_ENABLE |
+				SUB420_ENABLE | SUB422_ENABLE | CBHS_ENABLE |
 				DPC_BLCENABLE;
 		} else {
 			isc->try_config.bits_pipeline = 0x0;
@@ -811,7 +811,7 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline = CFA_ENABLE |
 				CSC_ENABLE | WB_ENABLE | GAM_ENABLES |
-				SUB422_ENABLE | CBC_ENABLE | DPC_BLCENABLE;
+				SUB422_ENABLE | CBHS_ENABLE | DPC_BLCENABLE;
 		} else {
 			isc->try_config.bits_pipeline = 0x0;
 		}
@@ -823,7 +823,7 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline = CFA_ENABLE |
 				CSC_ENABLE | WB_ENABLE | GAM_ENABLES |
-				SUB422_ENABLE | CBC_ENABLE | DPC_BLCENABLE;
+				SUB422_ENABLE | CBHS_ENABLE | DPC_BLCENABLE;
 		} else {
 			isc->try_config.bits_pipeline = 0x0;
 		}
@@ -834,7 +834,7 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline = CFA_ENABLE |
 				CSC_ENABLE | WB_ENABLE | GAM_ENABLES |
-				CBC_ENABLE | DPC_BLCENABLE;
+				CBHS_ENABLE | DPC_BLCENABLE;
 		} else {
 			isc->try_config.bits_pipeline = 0x0;
 		}
diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/media/platform/microchip/microchip-isc.h
index 7afba3c04dfb..35dfd2501ea2 100644
--- a/drivers/media/platform/microchip/microchip-isc.h
+++ b/drivers/media/platform/microchip/microchip-isc.h
@@ -88,7 +88,7 @@ struct isc_format {
 #define GAM_RENABLE	BIT(9)
 #define VHXS_ENABLE	BIT(10)
 #define CSC_ENABLE	BIT(11)
-#define CBC_ENABLE	BIT(12)
+#define CBHS_ENABLE	BIT(12)
 #define SUB422_ENABLE	BIT(13)
 #define SUB420_ENABLE	BIT(14)
 
diff --git a/drivers/media/platform/microchip/microchip-sama5d2-isc.c b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
index 66d3d7891991..239aac170472 100644
--- a/drivers/media/platform/microchip/microchip-sama5d2-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
@@ -54,7 +54,7 @@
 
 #define ISC_SAMA5D2_PIPELINE \
 	(WB_ENABLE | CFA_ENABLE | CC_ENABLE | GAM_ENABLES | CSC_ENABLE | \
-	CBC_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
+	CBHS_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
 
 /* This is a list of the formats that the ISC can *output* */
 static const struct isc_format sama5d2_controller_formats[] = {
diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index d3ed9cfe6686..985281c4dc76 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -61,7 +61,7 @@
 #define ISC_SAMA7G5_PIPELINE \
 	(DPC_DPCENABLE | DPC_GDCENABLE | DPC_BLCENABLE | \
 	WB_ENABLE | CFA_ENABLE | CC_ENABLE | GAM_ENABLES | CSC_ENABLE | \
-	CBC_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
+	CBHS_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
 
 /* This is a list of the formats that the ISC can *output* */
 static const struct isc_format sama7g5_controller_formats[] = {
-- 
2.34.1


