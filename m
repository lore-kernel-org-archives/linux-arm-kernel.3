Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41833CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GdRAW6MpAFqVudk9V/h/TviOMVqaW2CAuDWN+M3IXgo=; b=qLKyqKHnFRq43oH+PGllHWDh5r
	k3N9FvM2ZZnPKwAbkZZm5IKtTdMBiUOw6ll7qVN10HJDB/2z9kssMqH9UjHLL95CdrB9/40iFeq9n
	1ThX/nEzboyOAVe5VAW2RvgpyGh9coKlhItUUVtiBSJ474VQyEt4J+x7rzJC/zdYA24zrTpia3bW1
	vTSQr/0yCvQGm2hbPNuMfqPNEk+zQ8xeBOcqFZ9QChVUFRD43M09Z6VF3h04GFHj78tuUB4m66BJp
	zEkHs9irrW6BPkQ+ISBQA+ySMBnnaeBrY9dTb1AEuT6c0RHvPztnHQUp1DNHviwcnnA7tkKiFAM3n
	0fzETwHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGL8-00000000o46-0dEv;
	Tue, 19 May 2026 09:02:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGL1-00000000nyU-0uzt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:02:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779181326; x=1810717326;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t4dc/uQKHAV33hkQ7VeDETtoUrrUhDgC2o3bONeq+AU=;
  b=xfMhTF6Emb1HQAD3oWxen0qsJm6yoG+jzVVtDERBl9zcwQn5K+laJTQJ
   DbPr9IyyTy1KafPxNDyRAn0AX1RfUVjcgWVTBIjb5qYWozDz13x7LUNEc
   Jyg539dLT6EIhRrGnBdXzg2/uJsG5mfRvgtInAa1qTwzCOFf+BPSoubix
   TjPZq6ChBILxU0p5bELnvlJldCMsVwg28apiOO9Rp17bqVCYHVZA43oaj
   OUFrOfGPI1OlDzpgUn+AxNMOjER7wSj2shTWbWmi2D/hvUKRXGWXKyNng
   VlwFLNcJ/Plyag6IM3nmMD46N8l5/PJ2qV0wlNnyvNGBijm95Tv6K19sf
   A==;
X-CSE-ConnectionGUID: mYWIWAQ5SfKk/NCNR6kc+Q==
X-CSE-MsgGUID: VMn+Al8yR2qab3sd17nVOQ==
X-IronPort-AV: E=Sophos;i="6.23,243,1770620400"; 
   d="scan'208";a="224955538"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 May 2026 02:02:06 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 19 May 2026 02:02:06 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 19 May 2026 02:02:01 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH 2/8] drm: atmel-hlcdc: reorder timing register writes after clock setup
Date: Tue, 19 May 2026 14:31:29 +0530
Message-ID: <20260519090135.1188405-3-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260519090135.1188405-1-manikandan.m@microchip.com>
References: <20260519090135.1188405-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_020207_326379_7874B476 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Write CFG(1-4) timing registers after CFG(0) clock configuration
rather than before, as required by the datasheet procedure.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 43 ++++++++++---------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index 7932d666e9ec..9673fbce42a7 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -104,26 +104,6 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 	if (ret)
 		return;
 
-	vm.vfront_porch = adj->crtc_vsync_start - adj->crtc_vdisplay;
-	vm.vback_porch = adj->crtc_vtotal - adj->crtc_vsync_end;
-	vm.vsync_len = adj->crtc_vsync_end - adj->crtc_vsync_start;
-	vm.hfront_porch = adj->crtc_hsync_start - adj->crtc_hdisplay;
-	vm.hback_porch = adj->crtc_htotal - adj->crtc_hsync_end;
-	vm.hsync_len = adj->crtc_hsync_end - adj->crtc_hsync_start;
-
-	regmap_write(regmap, ATMEL_HLCDC_CFG(1),
-		     (vm.hsync_len - 1) | ((vm.vsync_len - 1) << 16));
-
-	regmap_write(regmap, ATMEL_HLCDC_CFG(2),
-		     (vm.vfront_porch - 1) | ((vm.vback_porch - 1) << 16));
-
-	regmap_write(regmap, ATMEL_HLCDC_CFG(3),
-		     (vm.hfront_porch - 1) | ((vm.hback_porch - 1) << 16));
-
-	regmap_write(regmap, ATMEL_HLCDC_CFG(4),
-		     (adj->crtc_hdisplay - 1) |
-		     ((adj->crtc_vdisplay - 1) << 16));
-
 	prate = clk_get_rate(crtc->dc->hlcdc->sys_clk);
 	mode_rate = adj->crtc_clock * 1000;
 	if (!crtc->dc->desc->fixed_clksrc) {
@@ -164,6 +144,29 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 
 	regmap_update_bits(regmap, ATMEL_HLCDC_CFG(0), mask, cfg);
 
+	vm.vfront_porch = adj->crtc_vsync_start - adj->crtc_vdisplay;
+	vm.vback_porch = adj->crtc_vtotal - adj->crtc_vsync_end;
+	vm.vsync_len = adj->crtc_vsync_end - adj->crtc_vsync_start;
+	vm.hfront_porch = adj->crtc_hsync_start - adj->crtc_hdisplay;
+	vm.hback_porch = adj->crtc_htotal - adj->crtc_hsync_end;
+	vm.hsync_len = adj->crtc_hsync_end - adj->crtc_hsync_start;
+
+	regmap_write(regmap, ATMEL_HLCDC_CFG(1),
+		     (vm.hsync_len - 1) |
+		     ((vm.vsync_len - 1) << 16));
+
+	regmap_write(regmap, ATMEL_HLCDC_CFG(2),
+		     (vm.vfront_porch - 1) |
+		     ((vm.vback_porch - 1) << 16));
+
+	regmap_write(regmap, ATMEL_HLCDC_CFG(3),
+		     (vm.hfront_porch - 1) |
+		     ((vm.hback_porch - 1) << 16));
+
+	regmap_write(regmap, ATMEL_HLCDC_CFG(4),
+		     (adj->crtc_hdisplay - 1) |
+		     ((adj->crtc_vdisplay - 1) << 16));
+
 	state = drm_crtc_state_to_atmel_hlcdc_crtc_state(c->state);
 	cfg = state->output_mode << 8;
 
-- 
2.25.1


