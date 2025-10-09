Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CD1CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1f7+xSpgDaEJP+b5juXQPs7wOhNQ2CmkXnDOW0kSsg=; b=v3D1nRqgKkV0wUNDO5peEh4b0r
	YxeJTp/u4xkuOJ1TJxMAg/KWr94hmD3nsfquHNYCzrkcbNAtAm+LDiqzHwKW6UX+zD1YIr3HC/g+h
	POIDN0O96QcaZKt24Zttr4P5xH/QF5OPMs5NT7VB293TGjeV6g36WkCAR/lgJwZ7GrId92w6Jovyk
	W8zqRxMfUdbYiWhWHMnp4JyQ4tXQMcH8kp/+8p19AYkuFz/GSJPjZ5mVQfg3hwZQkxwbXC+IHu12N
	uXEDYWIKiJao//BukIrchf3ArYI23ZeSKjahtvAcTmN2x6IL7lj21/VKR9nHtTtmc4UhMkoDTAX3B
	/nu0bTxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sxv-00000006YQy-3ipO;
	Thu, 09 Oct 2025 15:54:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sxs-00000006YPn-3blj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:54:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025240; x=1791561240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eZRfFP4QYpbbBFwWWF7KOqKZTWGgp1G+7gJDqrkniAw=;
  b=M4PAFHgA90TEE3Bus5HC4L6pnzGQPads5Fz1VKNzVpFECqXbybOrNIX5
   3jqePI7s1EXTqJF/7tH6E/dT5JFHH7di+lnsRxr+kIO0t36GyNH+MWYU+
   U6XNYHkEjJyq+6CHP1TVEMKpRHaiORJpNsJTuNzhztaVorYvxxHEVL9fI
   Ilo5nAupH7KvIKo33fdrNqpI1xsxOdRx8FBisZSZKThB2rYURTXjm0jQM
   r4fou5oK9D8wY5uAhZj7FLPAr4WlhzvfvgOomGAAdfVcv+NM8Q4fAfm0Q
   3cJc0YFtrFRZqYXZoBesfiRZ+fgnwiW2P9MDQjNZXOIuY2d2YhBLI6Q8p
   Q==;
X-CSE-ConnectionGUID: cxE1NKlcTy6ijIhpLPFRrQ==
X-CSE-MsgGUID: X+w3SBkHT/uckuP5ZIYqvQ==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="48057846"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:53:58 -0700
Received: from chn-vm-ex1.mchp-main.com (10.10.87.30) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:53:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.20; Thu, 9 Oct 2025 08:53:27 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:53:20 -0700
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
Subject: [PATCH 01/18] media: platform: microchip: set maximum resolution for sam9x7
Date: Thu, 9 Oct 2025 21:22:34 +0530
Message-ID: <20251009155251.102472-2-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_085401_200179_1E1F3F9A 
X-CRM114-Status: GOOD (  11.29  )
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

The maximum resolution for sam9x7 is 2560x1920. And its is 3264x2464 for
sama7g5.

Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
 .../media/platform/microchip/microchip-sama7g5-isc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index b0302dfc3278..36c3f4ba1962 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -55,6 +55,9 @@
 #define ISC_SAMA7G5_MAX_SUPPORT_WIDTH   3264
 #define ISC_SAMA7G5_MAX_SUPPORT_HEIGHT  2464
 
+#define ISC_SAM9X7_MAX_SUPPORT_WIDTH    2560
+#define ISC_SAM9X7_MAX_SUPPORT_HEIGHT   1920
+
 #define ISC_SAMA7G5_PIPELINE \
 	(WB_ENABLE | CFA_ENABLE | CC_ENABLE | GAM_ENABLES | CSC_ENABLE | \
 	CBC_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
@@ -432,8 +435,13 @@ static int microchip_xisc_probe(struct platform_device *pdev)
 	isc->gamma_table = isc_sama7g5_gamma_table;
 	isc->gamma_max = 0;
 
-	isc->max_width = ISC_SAMA7G5_MAX_SUPPORT_WIDTH;
-	isc->max_height = ISC_SAMA7G5_MAX_SUPPORT_HEIGHT;
+	if ((of_machine_is_compatible("microchip,sam9x7"))) {
+		isc->max_width = ISC_SAM9X7_MAX_SUPPORT_WIDTH;
+		isc->max_height = ISC_SAM9X7_MAX_SUPPORT_HEIGHT;
+	} else {
+		isc->max_width = ISC_SAMA7G5_MAX_SUPPORT_WIDTH;
+		isc->max_height = ISC_SAMA7G5_MAX_SUPPORT_HEIGHT;
+	}
 
 	isc->config_dpc = isc_sama7g5_config_dpc;
 	isc->config_csc = isc_sama7g5_config_csc;
-- 
2.34.1


