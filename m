Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D43CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCIpLyzNsd1I00FwKGMVaGgVrkAUH2FzF39SGyYf8uk=; b=eo0Jz4u6bkGvoUV/FpmUz8abCM
	8jBtWHjds24QekN/8f9jgIpsBYzX2UMQIPciGD4P9z5tENy+JrRGey9Gmn7iuyMPzAiFgwgbu7RRY
	LyoTs2LEZWzNJTWr5Zp9NMOZBXBXxZ52DCe/1jlLwFdA7Rd/HV7suleoium8uetN+KOlUZzYKPcZ8
	DhnXydTeKFW3PLN0zM7+XxdNmUgi0vrcNXkvTY2DJTGXjq+N5EnJMnKAP1+Inw/7cBV7lVgmClWfw
	En4NekHboTmNEqdzWFJlASPxjxcx7wud1sLLnpJvfASnUhUl4SReJbKl6RhlhnocOeGRLXs7OhaSO
	5zwWABBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6szD-00000006ZSt-1PxJ;
	Thu, 09 Oct 2025 15:55:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6szA-00000006ZQv-3zOT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:55:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025320; x=1791561320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2Se7zj33Lgo/YtUKTOpJ2DSK5Pf7p9rJmkBLoSnWiHc=;
  b=vvDU8MsFjxF2RVj4Nz1cwOKn8ZIjRoLYixcXxSb6kU5gLaPbKGPovR4R
   Is3My+e+DMr+jD4Xp2rlPB+BkfzMHxFp4KKnYmfaN0WdgFWKWI2soV/H2
   6wkjYzZQXx2enK3SfmKZHrHqOETIKSYxSlRm358Y8peXa2tWpI7uTek7+
   QU56H3TVvL3O5YuubCf5UAzBAUwx5GV80MPxTqOHfUkRR8Oz3ZJWszyNj
   7qL1jsIzyxGNbVaSMFOm1hykzNkehsOmprosKF636YSFuMjiO02I4OkHr
   eYb+gqf8cJ++Q7x/L8IBD1FkKVsbLTIDk3NgraOrpZXed9oxkVWuhHkzR
   g==;
X-CSE-ConnectionGUID: zFf2VAeJSDmWhPAONYY24w==
X-CSE-MsgGUID: 7xgqSkgPTC+yiXsQ9TcNyg==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="214905374"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:55:19 -0700
Received: from chn-vm-ex1.mchp-main.com (10.10.87.30) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:55:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.20; Thu, 9 Oct 2025 08:55:13 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:55:05 -0700
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
Subject: [PATCH 14/18] media: microchip-isc: fix histogram state initialization order
Date: Thu, 9 Oct 2025 21:22:47 +0530
Message-ID: <20251009155251.102472-15-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_085521_056642_1448C4B3 
X-CRM114-Status: GOOD (  11.47  )
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

Move hist_stat assignment before profile update to ensure histogram state
is properly set when update_profile triggers register writes. This prevents
race conditions during histogram initialization.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index 6651be6fcb57..e9f14de7ae32 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -275,10 +275,10 @@ static void isc_set_histogram(struct isc_device *isc, bool enable)
 			     ISC_HIS_CTRL_EN);
 		regmap_write(regmap, ISC_INTEN, ISC_INT_HISDONE);
 		ctrls->hist_id = ISC_HIS_CFG_MODE_GR;
+		ctrls->hist_stat = HIST_ENABLED;
 		isc_update_profile(isc);
 		regmap_write(regmap, ISC_CTRLEN, ISC_CTRL_HISREQ);
 
-		ctrls->hist_stat = HIST_ENABLED;
 	} else {
 		regmap_write(regmap, ISC_INTDIS, ISC_INT_HISDONE);
 		regmap_write(regmap, ISC_HIS_CTRL + isc->offsets.his,
-- 
2.34.1


