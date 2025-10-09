Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F01CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJjVcdaZAhw8rmxhwhywhEYA0mGqh7snchIPxLgQTUc=; b=mG1BlTgLiY/rhtx3D6piNPYYW3
	YEPJtKAMWlYn2pBJn/4In1CulIDO77GLd+sZWadHGGJkUw3XJjXYkdUJjVaILyPWKUtnf2kpEeabS
	zEFhXtFx6GUBqpHZAyF/GmTV30Xmvh5BloxTZyRqvVXW6zyBooiYuTFZTXXz0kA9uliQyqiI/HRMt
	cbA9okOvDdgSMcnUsxmNsh+DGgFlrMDmxS3ZwBxD8x3x0ZUvcOGMPlqk9vRlMNsJrD8YB/4SHPxMN
	yHZf/W8ABX7F/DRp7nlwNJTLKgCa1yqdUUgrU5CeFae0UqmAW0vyF7X1Mj66RhJm4HRf6bzx2JzUj
	SAOd32RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6syx-00000006ZEm-2kOi;
	Thu, 09 Oct 2025 15:55:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6syq-00000006Z95-3hh8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:55:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025300; x=1791561300;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=haMO4wNGArj5kzag6iiHU5t/GWJrDKEc4cjZ18byMvQ=;
  b=dcQZB9pqC90kDQIc5nxhYTdcTiaGMpzEHmICjPqou5h4DO/2JqMNaO+g
   3qxRiBOtqTI4zLn4sAK7rLwtlT1CF52VVflxVLi/GzMW3tCop6EhODyqz
   eq2Z/6IU+ZrrLh2PJJRH/iU4qEnZzK+CTogiuRpsbc7LAZZV/knWogjVQ
   jua2qbpvGzFDGICaBmeHMB63aZYcCfgUyTnoLnkmKmhfX0gIIoA0XY1Jl
   zH0TX+TqrvaDjk1zcP2wA63hB18DU1oGj1MgO20U3Gm/0qcULCaG6B4qN
   TNvRm7BDKtl8OvQP3ysVkjMYGfERuYVcEWYoHM78RUOb1V7tt2M3GieVy
   Q==;
X-CSE-ConnectionGUID: 0EboOn8GRV2P1HnHTeE70A==
X-CSE-MsgGUID: hlxhRWc8QgmHEHsfeTSDRQ==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="46946046"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:54:59 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:54:39 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:54:32 -0700
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
Subject: [PATCH 10/18] media: microchip-isc: Always enable histogram for all RAW formats
Date: Thu, 9 Oct 2025 21:22:43 +0530
Message-ID: <20251009155251.102472-11-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_085501_054887_D1249295 
X-CRM114-Status: GOOD (  10.82  )
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

Remove AWB dependency to allow histogram collection even when AWB is
handled in userspace.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index 5b49b6ff5ae9..e6d7f59893ac 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -318,8 +318,7 @@ static int isc_configure(struct isc_device *isc)
 	 * The current implemented histogram is available for RAW R, B, GB, GR
 	 * channels. We need to check if sensor is outputting RAW BAYER
 	 */
-	if (isc->ctrls.awb &&
-	    ISC_IS_FORMAT_RAW(isc->config.sd_format->mbus_code))
+	if (ISC_IS_FORMAT_RAW(isc->config.sd_format->mbus_code))
 		isc_set_histogram(isc, true);
 	else
 		isc_set_histogram(isc, false);
-- 
2.34.1


