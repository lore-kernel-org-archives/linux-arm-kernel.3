Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1073CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uhj9tVDfVZmsGf3k7Lh3jcol6frPJK89aUbhqXCpu88=; b=IYK3LM13FNZrowwV1t9a6UYS60
	gQCENhVjfVECwQ88PJdCyjbhjOh7dkt1XP4hJNJLb7y5xhc/RMpu9ebWFKNIxxZTNggqeDJyJ8J9e
	dbvKGW9caEPdAIg1BjUDNVYu+v3GrDuadMWgkTaVb4lXnZNnSHMDQdQR+UHEqoLnBuz9L748pL+ko
	07gPi2LAKLnhApgje+C8Wfw+2HJ5wrfosv0wmPiCb7QRFHKewDwTbEoE7nSaCnkV71WsDnyprneRY
	2GK3oMRbuaItl/9HAGH9RnedcOH/EC0Oyy7hycUSSM07C603cMkKXrrP7Xu4LdRtjn1BcxLdBjZPZ
	8rqyB3Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sy8-00000006YYV-3j55;
	Thu, 09 Oct 2025 15:54:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sy5-00000006YUz-0yrM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:54:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025253; x=1791561253;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qXM0Jk9e9PDmlzrnKOt8OyL9XYsdR0MVRMfDApa5rJg=;
  b=DwgDI9OvVKZByjtJhIV+KncEJrBZrhra72vvAg2RAKOjuXbziqxnJQRZ
   C5w1Wgb3OiL41LOXo1/k7gp2SYqz08AqTVVNBkjpd46nd1XGhLViOPIwi
   EynzdhO1LZR3sgi7wD1j80eZOb92dBqh5R9FD6aEUlCv8gRJFBybcyQlY
   YG33urOSkNYoCIHZBhiLqDs30hLScJb5a+omERZdIBn6n2zYmhEJgi2E8
   DFyVFHZuupkKtP2TckfMwOI5PJp4JfblukPKvXeBeEQZTAF6WjgV5/Il+
   R2Ar+ece2jeXwg6bBQ8txPiL4sSfit2mO8CgV95skhdYK9haIuvGGmWMu
   g==;
X-CSE-ConnectionGUID: lBmy0Ek5QtOpGZTOa4YF8Q==
X-CSE-MsgGUID: frcHL7zpRxCKgrAqNEreXA==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="278928715"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:54:11 -0700
Received: from chn-vm-ex1.mchp-main.com (10.10.87.30) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:53:35 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.20; Thu, 9 Oct 2025 08:53:35 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:53:28 -0700
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
Subject: [PATCH 02/18] media: platform: microchip: Include DPC modules flags in pipeline
Date: Thu, 9 Oct 2025 21:22:35 +0530
Message-ID: <20251009155251.102472-3-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_085413_302604_929DB1B1 
X-CRM114-Status: GOOD (  10.81  )
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

Add DPC_DPCENABLE, DPC_GDCENABLE, and DPC_BLCENABLE enable bits to
ISC_SAMA7G5_PIPELINE macro to prevent isc_sama7g5_adapt_pipeline() from
masking out DPC modules during pipeline configuration

Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
 drivers/media/platform/microchip/microchip-sama7g5-isc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index 36c3f4ba1962..03f7a46acd47 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -59,7 +59,8 @@
 #define ISC_SAM9X7_MAX_SUPPORT_HEIGHT   1920
 
 #define ISC_SAMA7G5_PIPELINE \
-	(WB_ENABLE | CFA_ENABLE | CC_ENABLE | GAM_ENABLES | CSC_ENABLE | \
+	(DPC_DPCENABLE | DPC_GDCENABLE | DPC_BLCENABLE | \
+	WB_ENABLE | CFA_ENABLE | CC_ENABLE | GAM_ENABLES | CSC_ENABLE | \
 	CBC_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
 
 /* This is a list of the formats that the ISC can *output* */
-- 
2.34.1


