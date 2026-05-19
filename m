Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E404ECD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CrigC20nd8UA32B5f6ZhE33n1HPv41Ag+a4xch3uSkw=; b=Za6XNG0VpAKNHtdQwFF4g/hyrR
	xVQjRhelxqiyuKtEjucFIvRMDUpO/0hyXI2HvhKEYf3rHm+Ww6mmhxy+XeVvlzVWrCHd8UHttsA+r
	W+iWImr/J47hCqHIXPDv7xmlOtnmGYCWvo9WsZuxpf2P8vLDmnjukYL4Aw2GqUXRGKgMbz76K3D67
	EIGiV2GduNc5+pixhemqH5CiTTiLLNSHPByMIRdB8dJnJJbl6n3C3kwAiWsoaOhFjZzoOa8t+66Ug
	/0BVQzPNJTIycHzIBg1OkVCJlEA2TrXYyI3iDDoXdpbvZfPssPUZOlRckbjNfe2+d36dsmT3L4+50
	WFjME/+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGLU-00000000oNh-1Xxe;
	Tue, 19 May 2026 09:02:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGLM-00000000oHw-48uu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:02:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779181348; x=1810717348;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jMsgCKlmkEe87bVAn7RqMCuhljgwv9IJFsxQpoWrUvM=;
  b=z21DReGMxzbNtibI7Vm/xnKogX3T71X1IZla+OsOM9eruRuFht6E/VlI
   +KoEnnMmDSg9DU5tkEVDpFD9Ud/BDkqRaX/LnKo8xkwi1xCdjiU8DwjUz
   dnUBEmq755vz+3eurAv1EMiwhX2j1rQROM0lowm6U/BsgOYOeU2Dj2vmI
   LufjclPBoHZ0e+fUDMuDUJEqBta6CFrMeX4+7l8sMTM1uJ+C38hWnNIt/
   I8G+auzxTOHTLH0W/vizXRv/SoMpDGYEryL4kfYnrlbHRBaA/N4Ibs82k
   5juOBgFOMCieDAgH19dO6JTIWZDdQj/lPcookjM9tE3iVJKfPvPAb74mP
   g==;
X-CSE-ConnectionGUID: UhwUzNcxQYenxhztrBU4xA==
X-CSE-MsgGUID: sBXINErWS3GRAFZWhBEO9Q==
X-IronPort-AV: E=Sophos;i="6.23,243,1770620400"; 
   d="scan'208";a="289088359"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 May 2026 02:02:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 19 May 2026 02:02:28 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 19 May 2026 02:02:23 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH 6/8] drm: atmel-hlcdc: add XLCDC clock bypass support for small dividers
Date: Tue, 19 May 2026 14:31:33 +0530
Message-ID: <20260519090135.1188405-7-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260519090135.1188405-1-manikandan.m@microchip.com>
References: <20260519090135.1188405-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_020229_035651_288CE5FA 
X-CRM114-Status: GOOD (  13.17  )
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

Define ATMEL_XLCDC_CLKBYP and set the clock bypass bit on XLCDC
hardware when the computed divider is less than 2, avoiding an
invalid divider value. Non-XLCDC hardware retains the existing
minimum divider clamp of 2.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c | 7 +++++++
 include/linux/mfd/atmel-hlcdc.h                | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index 6da428361c19..f837684654ea 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -87,6 +87,13 @@ static int atmel_hlcdc_crtc_setup_clock(struct atmel_hlcdc_crtc *crtc,
 
 	div = DIV_ROUND_CLOSEST(prate, mode_rate);
 	if (div < 2) {
+		/* XLCDC: bypass divider when div < 2 */
+		if (crtc->dc->desc->is_xlcdc) {
+			*cfg  |= ATMEL_XLCDC_CLKBYP;
+			*mask |= ATMEL_XLCDC_CLKBYP;
+			return 0;
+		}
+		/* Enforce minimum divider for non-XLCDC */
 		div = 2;
 	} else if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK) {
 		/* The divider ended up too big, try a lower base rate. */
diff --git a/include/linux/mfd/atmel-hlcdc.h b/include/linux/mfd/atmel-hlcdc.h
index 8e86219293b7..1463c7db0e64 100644
--- a/include/linux/mfd/atmel-hlcdc.h
+++ b/include/linux/mfd/atmel-hlcdc.h
@@ -44,6 +44,7 @@
 #define ATMEL_XLCDC_HEO_UPDATE		BIT(3)
 
 #define ATMEL_HLCDC_CLKPOL		BIT(0)
+#define ATMEL_XLCDC_CLKBYP		BIT(1)
 #define ATMEL_HLCDC_CLKSEL		BIT(2)
 #define ATMEL_HLCDC_CLKPWMSEL		BIT(3)
 #define ATMEL_HLCDC_CGDIS(i)		BIT(8 + (i))
-- 
2.25.1


