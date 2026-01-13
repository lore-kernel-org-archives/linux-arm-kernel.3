Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AD7D2D0F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 13:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfSuhfTTjfrgbpjKtMUwVk4vgDTTQ6DN1hEyfT3Ju1M=; b=0UQQkoeCL1IC0n4+n6ptRTOoIN
	kGJGS/GnXKP95dV/dU8W1yNQaeo6IntmEgKmJe5XcpYGN1//jEPx00uP+7cGnv1QZfqMWAPeNu3xf
	NGfr3t/ifAjHUq+88i9x7KBjeapXgU6oYTY4uF8U/FgjRJGTLv/Rudm14dexunWSjsog9lN1q8xEL
	MLhtpc8ViHAHcmNqIY64miinFiMhomH8ZYg7uTEbhh2hYrZ4DIyMXfT66vHP0qtqU3sJL/Uj/zixu
	xigwVtUQ0GbpiLh1fp5ErJwDgKbcYVUMy0YiP1HK4gnN5PqU5aFf11DEpAA5/GHWz/GnFa6RKoPoN
	XWnhvg2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfeBq-000000078ge-3XaI;
	Tue, 13 Jan 2026 13:12:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfeBo-000000078fI-37Hs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 13:12:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768309925; x=1799845925;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=0szjEvMiEGlcssl+EUr72h1PstkrFcFYIOp9mvH/YK0=;
  b=1iQe4Y7EYPh+Q+QXKLAoRAAun0ZS5ybmTRhgZeNRW95Yot3Uon8klOz1
   3bCg3j75ECi91p+ruI4u4S7dq3dXyFckWPYGRC7QNM8HpXcLN50y1SCFt
   tH4iu4mA+LUxnZhYZ3VVJlbtx1r+iU56aKFElvHIOp+vh77tDS29J3nUA
   CoiOOXcJPTvnWkdZSj0gijo2et9mtnoYeLSKLd2obK5zHHuIiYRjbqfi8
   /SAAUu11kDqsveacXBy7jcEZrIu7dBuiDxXKcd+x52dSakD9MWn3pzlYR
   /7lXnQEH5kaMYR8ToSf+BXDCsslQ9AfRkUbyd/exfdLHVmeE5ge0g8ms5
   A==;
X-CSE-ConnectionGUID: K3fsZ9jvThKFT3GTY22Zkg==
X-CSE-MsgGUID: uCOFkcT9RIGqYXSHpZRY+A==
X-IronPort-AV: E=Sophos;i="6.21,222,1763449200"; 
   d="scan'208";a="283170665"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Jan 2026 06:12:04 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 13 Jan 2026 06:11:28 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 13 Jan 2026 06:11:25 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Tue, 13 Jan 2026 14:10:41 +0100
Subject: [PATCH v5 5/5] ARM: configs: at91_dt_defconfig: enable GFX2D
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260113-cpitchen-mainline_gfx2d-v5-5-9cdab8fa699b@microchip.com>
References: <20260113-cpitchen-mainline_gfx2d-v5-0-9cdab8fa699b@microchip.com>
In-Reply-To: <20260113-cpitchen-mainline_gfx2d-v5-0-9cdab8fa699b@microchip.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	"Alexandre Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Russell King <linux@armlinux.org.uk>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Cyrille Pitchen <cyrille.pitchen@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=751;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=0szjEvMiEGlcssl+EUr72h1PstkrFcFYIOp9mvH/YK0=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ2aaS3bA8SVbX2kGVc9qc9jBk3fubUTbtBnRcnX35ly9p
 JDI6F/cUcrCIMbFICumyHLozdbezOOvHtu9EpWCmcPKBDKEgYtTACbif4KRocu12KHOsehqVveP
 Pgu9jYV7Lm44/fio/5byBTc/aO1LEmb4X7q4+VhrXl6BVTBHvuOCRK0iO4X5v2UuR126/kXjt8w
 ZZgA=
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_051204_784543_6E1D9D25 
X-CRM114-Status: UNSURE (   9.42  )
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

The GFX2D GPU is embedded in both SAM9X60 and SAM9X75; enable the
driver to use it.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
---
 arch/arm/configs/at91_dt_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
index 4f1153098b16f4a93ff21f05ec73cc569f4ebe64..b38fb185670c05e74e09f6341128be5908c86451 100644
--- a/arch/arm/configs/at91_dt_defconfig
+++ b/arch/arm/configs/at91_dt_defconfig
@@ -144,6 +144,7 @@ CONFIG_VIDEO_OV2640=m
 CONFIG_VIDEO_OV7740=m
 CONFIG_DRM=y
 CONFIG_DRM_ATMEL_HLCDC=y
+CONFIG_DRM_MICROCHIP_GFX2D=y
 CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PANEL_EDP=y

-- 
2.51.0


