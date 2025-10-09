Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF7FCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jmpE8+kYqw0KUlZcDwP9gvVfVdbZMVRD+EPwoGEvH/w=; b=ppZOdXOVbHSxQn1endd35qRvrR
	8tAsMPpYJTgp5HPe9u0exuK7Uu0xhIgZI2rTKIoFi7v6LKr5Oy805Bf3U5A2WysppiQYb1/bCn3mz
	K6Pmsfj8FJPoiYs9HuR1hVTBtKuJUiqgI6fbDQc8Nz0BZxTeOeCDLIlylm6XnrDg0whYcLxugPLNz
	h4LQCFWxSeJNurGs/ZGdGoRw2HwTI86FHP8k9ZC+Fg/eta2w+ZdjrSYm87Vr2jg/gjk5gxASjCn9u
	Ziu0q52+RmR5gmiDebOKx1yy6mq8IeTCvoB11+zXagFq/ToACLZ2ItkQ7ZZpPffVZBPaCk/WFpJS9
	8Ik/zO+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sya-00000006Yu7-0RMg;
	Thu, 09 Oct 2025 15:54:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6syX-00000006YrS-3kYk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:54:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025281; x=1791561281;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eJf4UTMPqJkln5EdhKh/6cOT12g2cjSMKWCXo8sdgV8=;
  b=d6TsC7vculwGrapEDelwALzt/1/KTLaxwKCjg4AW5M1n6qoZL536yM7W
   vJ80g77ndCkm8qm/4oMKpxPw/eAJ9mJvSu6wtZauAt01+RPA74jT+sKkm
   WXW4cYYF+NOCVntmPYYOK8EW88tOCfod0wfcNvbT2Z/P5WxQQJ+/wFdUY
   2IIleapyOuw/smKyjW1xFIZa7ba+LHeYn3f97kdIDlrF5oFq3Vwzny/LQ
   Ye3zbg4Nr3thrY8+hjXOgIXEQIbIIV+ubpAYtMTtX8weXMKwevkBvvEz7
   RWNZm1P9xOVghTS4WbNMd0eeh0a6sLBCRb3cIGs8d713gsRtYd6Gdizlq
   w==;
X-CSE-ConnectionGUID: /X4p8s51R2m1uwZxUki7lw==
X-CSE-MsgGUID: qBNcf2BOSxaZUSryRrMOiQ==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="214905334"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:54:38 -0700
Received: from chn-vm-ex3.mchp-main.com (10.10.87.32) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:54:06 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.10; Thu, 9 Oct 2025 08:54:06 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:53:58 -0700
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
Subject: [PATCH 06/18] media: microchip-isc: Add range based black level correction
Date: Thu, 9 Oct 2025 21:22:39 +0530
Message-ID: <20251009155251.102472-7-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_085441_991669_095AB9D7 
X-CRM114-Status: GOOD (  15.07  )
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

Add adaptive black level offset based on histogram minimum and pixel
statistics. Apply conservative correction for high black levels and
gentle correction for low levels to prevent overcorrection and improve
dynamic range.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../platform/microchip/microchip-isc-base.c   | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index bb2dd69a83f0..2706a27a2506 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1349,7 +1349,27 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
 		 * we stretch this color to the full range by substracting
 		 * this value from the color component.
 		 */
-		offset[c] = ctrls->hist_minmax[c][HIST_MIN_INDEX];
+		if (hist_min > 5 && hist_min < 60 && total_pixels > 1000) {
+			/*
+			 * Basic adaptive black level offset correction
+			 * (Simplified version for kernel fallback)
+			 */
+			if (hist_min > 20)
+				/* Conservative for high levels */
+				offset[c] = hist_min - 4;
+			else if (hist_min > 10)
+				/* Moderate correction */
+				offset[c] = hist_min - 2;
+			else
+				/* Gentle correction */
+				offset[c] = hist_min - 1;
+
+			offset[c] = max(1U, offset[c]);  /* Ensure minimum of 1 */
+		} else {
+			/* Use default behavior for edge cases */
+			offset[c] = hist_min;
+		}
+
 		/*
 		 * The offset is always at least 1. If the offset is 1, we do
 		 * not need to adjust it, so our result must be zero.
-- 
2.34.1


