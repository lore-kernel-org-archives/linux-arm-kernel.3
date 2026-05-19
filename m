Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD86CD5BA6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdzeE3trticxmlvStRyP4y55QP6kiFfT55UAQCj5rO0=; b=kqETuGYz9xD8SmsoJRbvMvgoDM
	U1cYXwmfqeVTJDbLdysTk3lfkUIxZy9fw6w8h0KYMSta94qPXsBS4DrHlBBBh49IDi5/vpJ0hT36j
	lwCHSS0CMYqFbtTq+LHLANRMcndldGJEGWC3d8nJ2wOWxWx1SBBN2DdLkQh9s+C4UF2YZbZjzL439
	YEN0TAjT2+dsWfGEgK3ZW3Tb3OSD0ZidjgGv3u2o9k99b9ArvmgziZGUJwx+uXbZSuJL72Lbq2OTf
	qHxXw5poBnPY2ND9fQTWrM9Qr8GZXxuerDqWTo5nYxOlS5uLsZX+vALBoZMUh3B+BVJkCyQ6PmjgQ
	XM+E5I7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGLE-00000000o92-1qyo;
	Tue, 19 May 2026 09:02:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGL7-00000000o3H-0QPS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:02:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779181333; x=1810717333;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LJEEPChwdcM1KLq1Y/q8j56wOB4WvOPShmezx9DGSgE=;
  b=Br0O6lEIIkqrU+ec3LNsx0g1Q3PDWR85at7ec1aXTC0kNx9bI+hNetNJ
   YMy1U6zex1RK3APyTnAZiVwZyQQ77eCiYhBB8rFH/yLFi26IrMpOKEC3e
   hr43UFwxkz4vUiBDiqYAdIaKS0rev1aUpv57CzR7bbkBCdc42as5jLvZ1
   BuZ/09AiL9KnYNWop+8TecgVVsuhiBBaTAlzC3B+IiEoLGUrS7ylIwvI4
   +UXkKjWlruDewBgb8lhKHKZec4e3zcsD/3mxlt0Ckg7cmsT/O3J1EpWPT
   GuxuvfAKpoXpmKUbEhFMa24XsBIctJYaDvOEzOKwL62YDCyHcAN+vMVfI
   A==;
X-CSE-ConnectionGUID: ELPhaqqSSbm0Etnr8wDe8w==
X-CSE-MsgGUID: ckea46Z1S+epLY2sBN5gKQ==
X-IronPort-AV: E=Sophos;i="6.23,243,1770620400"; 
   d="scan'208";a="57719362"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 02:02:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Tue, 19 May 2026 02:02:11 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 19 May 2026 02:02:06 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH 3/8] drm: atmel-hlcdc: simplify clock divider selection with DIV_ROUND_CLOSEST
Date: Tue, 19 May 2026 14:31:30 +0530
Message-ID: <20260519090135.1188405-4-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260519090135.1188405-1-manikandan.m@microchip.com>
References: <20260519090135.1188405-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_020213_146344_C02ACA85 
X-CRM114-Status: GOOD (  12.02  )
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

DIV_ROUND_CLOSEST naturally selects the nearest divider, making the
manual 10x proximity check redundant. Drop it and switch from
DIV_ROUND_UP accordingly.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index 9673fbce42a7..f30138da1ed8 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -112,28 +112,16 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 		mask |= ATMEL_HLCDC_CLKSEL;
 	}
 
-	div = DIV_ROUND_UP(prate, mode_rate);
+	div = DIV_ROUND_CLOSEST(prate, mode_rate);
 	if (div < 2) {
 		div = 2;
 	} else if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK) {
 		/* The divider ended up too big, try a lower base rate. */
 		cfg &= ~ATMEL_HLCDC_CLKSEL;
 		prate /= 2;
-		div = DIV_ROUND_UP(prate, mode_rate);
+		div = DIV_ROUND_CLOSEST(prate, mode_rate);
 		if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK)
 			div = ATMEL_HLCDC_CLKDIV_MASK;
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
 	}
 
 	cfg |= ATMEL_HLCDC_CLKDIV(div);
-- 
2.25.1


