Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEE1CA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 13:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=akBGkOEOlGYhEbnp+4TPffwtf+bndS3xlT3KFEyzqHY=; b=0b/yrmc9NMjrq3YyfNCcqhLXe/
	4Iiz6j3Bpkh5kkn2pCZzFhDPIS0xhJaDjHRjdmahZYJZDaS+Pj6/Krf+VMAsrLzBEra8iVXq7r6r1
	U3pYDLcOhvfe6VL1PJeiP02HuEHlMLVGO/FQiVgc6s1muirRvuczcW070NUvFI8mjo3w+2KquKBWc
	brGAlaCmnNT7OfaqDoT1CP+sVUL49BQunp6dABXPhcLL4skYDnrF4qE8+6u01q1P0VJ8oL1XZhPl0
	Zyt3UtM84J0/7VZdm2s3Oe7JXAhOYPnkNZXpZY/T5Fwe9pDLY6GQMshVyFMzZM25HdRqj+a5cYLoa
	8m1+lqZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEo2J-00000004Rd1-2Ffs;
	Thu, 08 Oct 2026 13:19:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEo2G-00000004RbI-0c3q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 13:19:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791465588; x=1823001588;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=+Q3Zno1VCYhLi025pNDCmJZ5SJkmktbvvlNyIe3ul58=;
  b=rdRT6NprgEPwy8jpmV0S1A7FlYVJX6lqSs8TxE7ZQp/GOtgfb+GQPGkh
   wFZek81jio3iRrfgvY2WxvAzAYfo9YoOgPIlt10wgdm0JXxbC7/wnhbsM
   dKCorVDJqBRKumcpOsAWfYBDPvFoh5+whKhSAF7oYOmiE90hrajBmO+XX
   To+RQQXOSucCYQ/rcNLtzQd0kvGqpDVAK1EKU/IReQ9R8MTh4hVTjvt7e
   q+emauwRk8umNw9hTKKsT/aSJsLfcMWjUeef2MYuUeQbndTtNGcbLxtP1
   I+OcFIIiW01YtndpRGtSipdJGkLmlMc3hSnzuZW55l5G91PgEwzKvBXQ6
   w==;
X-CSE-ConnectionGUID: RiY43zkkRCC0hmDKHauqLg==
X-CSE-MsgGUID: huQZLqcbR0Wd8tnYoaYSMw==
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="65038463"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Oct 2026 06:19:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 8 Oct 2026 06:19:47 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 8 Oct 2026 06:19:43 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Thu, 8 Oct 2026 15:19:05 +0200
Subject: [PATCH v10 5/5] ARM: configs: at91_dt_defconfig: enable GFX2D
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261008-cpitchen-mainline_gfx2d-v10-5-67ca2477b3d5@microchip.com>
References: <20261008-cpitchen-mainline_gfx2d-v10-0-67ca2477b3d5@microchip.com>
In-Reply-To: <20261008-cpitchen-mainline_gfx2d-v10-0-67ca2477b3d5@microchip.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=806;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=+Q3Zno1VCYhLi025pNDCmJZ5SJkmktbvvlNyIe3ul58=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ9bxGWFyYXlXzErf5WeGSFm/ufi2PmWXeOKezU8XhL9ZP
 Ecja5lRRykLgxgXg6yYIsuhN1t7M4+/emz3SlQKZg4rE8gQBi5OAZjImU2MDCfMvlybtvwlb9aq
 p0dmN/gdbdSp6jpsNF/S/FJ9QPjFez0M/92XH1Pf7N2WX+KqILqjrThwgqnlxIOPVOX3X70ZcXD
 3MnYA
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_061948_335909_2A8ED478 
X-CRM114-Status: UNSURE (   8.57  )
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

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
---
 arch/arm/configs/at91_dt_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
index 830c6c0dbdaf..2a4a2d4c1865 100644
--- a/arch/arm/configs/at91_dt_defconfig
+++ b/arch/arm/configs/at91_dt_defconfig
@@ -142,6 +142,7 @@ CONFIG_VIDEO_OV2640=m
 CONFIG_VIDEO_OV7740=m
 CONFIG_DRM=y
 CONFIG_DRM_ATMEL_HLCDC=y
+CONFIG_DRM_MICROCHIP_GFX2D=y
 CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PANEL_EDP=y

-- 
2.53.0


