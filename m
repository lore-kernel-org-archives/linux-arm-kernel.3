Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E070CD5BA3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7yhIoBd2EHQbyWMsw57ZkMQnNP8FBl7jkpbSSgpYlo=; b=29VQGJyFTouOcTS9u/aohvptWw
	ct6eBxt/LPGlFYv9q/I615LNNhW9FxcdR3aRQ1rV4XTgJwEfK3r/ORVk3Y5/MCE6GFFvqpQPHYaWY
	fHV0/Z2A7+jXTh/6tSK8f13C7vBVZpnHB/Tosj63UdFXX7EYQvJSrCi/gfIo/AKP3DfazhPz5NkGt
	L7PCEprrilOnDkNfKUZkRzuEEk9ZVpMpXckROx04gW9LVYBuswQWfpRi19WF2yvh/gJXF1kDjnqKp
	jE1TU9p3UUp3NI3GMP6ggFNK0EuUkjOlJhDW9HaacrmOpF+kzKp02YvuSloaNnY1hcJ1VVsbUuKTb
	DWUpnRTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGLT-00000000oMU-3vOT;
	Tue, 19 May 2026 09:02:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGLI-00000000oD3-0Awk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:02:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779181343; x=1810717343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FGxZyUqCZ0jZxo+9CRdWfsvZXgcZ2nFVcizJ+OoI7P0=;
  b=12DOGYV2hLGjk8rcfAaOQ8rb0trmllKFTKV05g4KJ7dFhR0zJX1yxGKS
   vMZEjF2zcoqixuXaYxZL/r6Oc1k9jAFEWUpKaRjhVrPNqY30dmEgOzfpX
   WlDql9hqNuO9oQJlYwFHKJ9k0kOu681WIxDxmhWtVoiErnhPYaXP6G/2b
   v8fck6j0Pyrb3JnM6pGO7jLRDYhqyDrS1nHxe0ews5bqPbbz+lF6/yETm
   pv3asOwNgpVKPXhPXzTV8J/9jNkeDM8jL+6oHblKW961SOXzc8yngnG6x
   V7c8JDBdwUXo4TMKwaIL3GM9iJP2C5MmECMAMbfJHggJTa0j7+OUAIhUd
   w==;
X-CSE-ConnectionGUID: h8SKNaLgSjKCVDhFiSGa1A==
X-CSE-MsgGUID: eP4Ycsd8QwuNwr7YuOvjRA==
X-IronPort-AV: E=Sophos;i="6.23,243,1770620400"; 
   d="scan'208";a="66488484"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 02:02:23 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Tue, 19 May 2026 02:02:23 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 19 May 2026 02:02:17 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH 5/8] drm: atmel-hlcdc: extract clock setup into a dedicated helper
Date: Tue, 19 May 2026 14:31:32 +0530
Message-ID: <20260519090135.1188405-6-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260519090135.1188405-1-manikandan.m@microchip.com>
References: <20260519090135.1188405-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_020224_092576_6285E526 
X-CRM114-Status: GOOD (  14.13  )
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

Factor clock enable, rate calculation, and divider selection out of
atmel_hlcdc_crtc_mode_set_nofb() into a new
atmel_hlcdc_crtc_setup_clock() helper, preparing for the addition
of LVDS and XLCDC clock bypass support.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 66 +++++++++++--------
 1 file changed, 39 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index c7e77bb2941a..6da428361c19 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -66,6 +66,42 @@ drm_crtc_to_atmel_hlcdc_crtc(struct drm_crtc *crtc)
 	return container_of(crtc, struct atmel_hlcdc_crtc, base);
 }
 
+static int atmel_hlcdc_crtc_setup_clock(struct atmel_hlcdc_crtc *crtc,
+					unsigned long mode_rate,
+					unsigned int *cfg,
+					unsigned int *mask)
+{
+	unsigned long prate;
+	int div, ret;
+
+	ret = clk_prepare_enable(crtc->dc->hlcdc->sys_clk);
+	if (ret)
+		return ret;
+
+	prate = clk_get_rate(crtc->dc->hlcdc->sys_clk);
+	if (!crtc->dc->desc->fixed_clksrc) {
+		prate *= 2;
+		*cfg |= ATMEL_HLCDC_CLKSEL;
+		*mask |= ATMEL_HLCDC_CLKSEL;
+	}
+
+	div = DIV_ROUND_CLOSEST(prate, mode_rate);
+	if (div < 2) {
+		div = 2;
+	} else if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK) {
+		/* The divider ended up too big, try a lower base rate. */
+		if (!crtc->dc->desc->fixed_clksrc) {
+			*cfg &= ~ATMEL_HLCDC_CLKSEL;
+			div = DIV_ROUND_CLOSEST(prate >> 1, mode_rate);
+		}
+		if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK)
+			div = ATMEL_HLCDC_CLKDIV_MAX;
+	}
+
+	*cfg |= ATMEL_HLCDC_CLKDIV(div);
+	return 0;
+}
+
 static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 {
 	struct atmel_hlcdc_crtc *crtc = drm_crtc_to_atmel_hlcdc_crtc(c);
@@ -76,12 +112,10 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 	struct atmel_hlcdc_crtc_state *state;
 	struct drm_device *ddev = c->dev;
 	struct drm_connector_list_iter iter;
-	unsigned long mode_rate;
 	struct videomode vm;
-	unsigned long prate;
 	unsigned int mask = ATMEL_HLCDC_CLKDIV_MASK | ATMEL_HLCDC_CLKPOL;
 	unsigned int cfg = 0;
-	int div, ret;
+	int ret;
 
 	/* get encoder from crtc */
 	drm_for_each_encoder(en_iter, ddev) {
@@ -100,33 +134,11 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 		drm_connector_list_iter_end(&iter);
 	}
 
-	ret = clk_prepare_enable(crtc->dc->hlcdc->sys_clk);
+	ret = atmel_hlcdc_crtc_setup_clock(crtc, adj->crtc_clock * 1000,
+					   &cfg, &mask);
 	if (ret)
 		return;
 
-	prate = clk_get_rate(crtc->dc->hlcdc->sys_clk);
-	mode_rate = adj->crtc_clock * 1000;
-	if (!crtc->dc->desc->fixed_clksrc) {
-		prate *= 2;
-		cfg |= ATMEL_HLCDC_CLKSEL;
-		mask |= ATMEL_HLCDC_CLKSEL;
-	}
-
-	div = DIV_ROUND_CLOSEST(prate, mode_rate);
-	if (div < 2) {
-		div = 2;
-	} else if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK) {
-		/* The divider ended up too big, try a lower base rate. */
-		if (!crtc->dc->desc->fixed_clksrc) {
-			cfg &= ~ATMEL_HLCDC_CLKSEL;
-			div = DIV_ROUND_CLOSEST(prate >> 1, mode_rate);
-		}
-		if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK)
-			div = ATMEL_HLCDC_CLKDIV_MAX;
-	}
-
-	cfg |= ATMEL_HLCDC_CLKDIV(div);
-
 	if (connector &&
 	    connector->display_info.bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
 		cfg |= ATMEL_HLCDC_CLKPOL;
-- 
2.25.1


