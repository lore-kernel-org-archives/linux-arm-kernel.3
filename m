Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5CFD2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 12:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJKyPjuDPh4JLzSakx8kFMwVPRpWytmyQiFUSPburUU=; b=xpN+xJ6HfcPbfRz0TEXTHx6MBN
	Va+4EogDw8FsqL6F9ybSvRx6Gd4H0AMzIGJOGdtsage3Uj5Vi/IL/aNWzo16zL6AbrQwgIAR1EcqD
	tCuv0qxY/ilbbtEP6W6sJHbgG8yokyu3RIevlgVdHLO1Fe2Kh0VKIzBSzWI+LPRGYloapK/akb73i
	R6wtUWToUHDeyOYK9Xolcvc3gg3DDfzTAv3nSUVubHqDePtCovapIkHN2G/bnMO6L+hcdhSXVLQgq
	/7uaM1hzG/mznEUN1KKuq2LsAUe6s/E96Fpqnz3DJu80N5DSuATIdnxdrAtpFVOgpouQOOMah/Sp7
	4fp7WlEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAVT-00000003mtl-1KbR;
	Tue, 20 Jan 2026 12:06:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAVJ-00000003mnb-1q5m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 12:06:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768910798; x=1800446798;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=zW32RwnIsEz7fOz8TD2RSEABIp8rSUUmOobwC1rnwYg=;
  b=YKLuPFc4DdRwA8eAW4S5NsMg4v8URuH1ErGyuOfZXRk0T+Jee5UPDntD
   NaaWBtgmGaXcmBrsj34ZFmgYk4pCProTtdHlB6vKsxlmU39wgjfLfeoOf
   YLfKRUi7M85UumBlxGz3Khfdys/90aFWb0b9X6MLQgi6PXKGxmxPeFa+o
   LlyNoUkX+ZIvsDhsfIMEha0UDx+nX6BOavWPQyzd3BzzGOU6tdAcJHnvx
   om/ycffo7UoebB5OrHvqojZdMdz6EFVH6o33eDcJL6vhH0ZuA58ualIqT
   cYye7pLUpEr9vwnaWYrqGkDN/dDc6/bbEe8YJ3KBaxshgudpHKTYrBYoJ
   Q==;
X-CSE-ConnectionGUID: 8Ko/DY5eTo6gdSTGYm53tQ==
X-CSE-MsgGUID: zQJPafm9Q4CM5MmDH9GCQA==
X-IronPort-AV: E=Sophos;i="6.21,240,1763449200"; 
   d="scan'208";a="283519278"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Jan 2026 05:06:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 20 Jan 2026 05:06:19 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 20 Jan 2026 05:06:15 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Tue, 20 Jan 2026 13:05:38 +0100
Subject: [PATCH v6 5/5] ARM: configs: at91_dt_defconfig: enable GFX2D
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260120-cpitchen-mainline_gfx2d-v6-5-1a16cd1d70b8@microchip.com>
References: <20260120-cpitchen-mainline_gfx2d-v6-0-1a16cd1d70b8@microchip.com>
In-Reply-To: <20260120-cpitchen-mainline_gfx2d-v6-0-1a16cd1d70b8@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=806;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=zW32RwnIsEz7fOz8TD2RSEABIp8rSUUmOobwC1rnwYg=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ2Z+/sL7S3a6uc7IPPuxcsfylu+hdSxXf/17ZH+RQ5qTW
 3zCwbVqHaUsDGJcDLJiiiyH3mztzTz+6rHdK1EpmDmsTCBDGLg4BWAiGYUM/+xeHdh1aUmu2VcD
 CYFlJqf15V+ssP+3QbnDPXSi1Euf1VGMDF35xn5S+z7eE43K4V3zhSHsUsaD5DwX7dQylTjvTN/
 ZjAA=
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_040637_488528_19B809E1 
X-CRM114-Status: UNSURE (   9.38  )
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


