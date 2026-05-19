Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2ECCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ptbmMIOAdFt8BwqaadDYqNNx+RpR3u9xuziAA/vIwXs=; b=1hOrd3LFMFgUJW6rFAuwjIzN2V
	JXIMCIXjK2WYL2FKZrtmDnXTr0IZNZ2kvner9tcO8m0aam7sOHBfRxKejY9oVhxdYidJ/uf/9GaW1
	YhSQNv5qIi75GY/v3KmCJaUF/bMASGKR53VJqKOeh0CYA6rXVTCE/6Un5kt0q6WHj99JzR50JVOIr
	otOEqsFgQPbloVX/WgapQu/PsbG170pk+oV3FrCVRTg6TqPdFodlvllT8Y9DBpq1PbPGSzMeTgWsy
	9cwuFVVom73f0OzED0rvNikV4se6sRDUPmj53RJmsw6AVcADAIj6mN7u/38VNHcu5uPopVSECHUgo
	SUd+iHSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGKt-00000000nxO-2pSy;
	Tue, 19 May 2026 09:01:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGKs-00000000nx0-0tte
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779181318; x=1810717318;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bVqS1Abfd3XhxVTJJMr1uiuME/oE+EUAC30jYZW157c=;
  b=AVNLzRIsj+4opuCYWE9Vk0sCASWGgVJ9vvLLxHLkKmieJD2YZoRAQfq5
   KhRvjnb6HfwzlQVZsR8oapxgphEtifppHFpSrQmEwHfNTKJZlCWzI+KOn
   Qw88uFgrZty0r5pnPcPAKYPIc2uyukKnbEMtSzOQp0hSDWrAZvWMn9X1O
   4S2ifvWNCzsWGUfcsFli/cig6h6HhhqPepDI27mu3O91HCQxdyeT1D5uY
   LqtJuriBKFvgF7sBdSNerWmb5Fi3PLO6bNZf7YlGmmh9BDpSuSGXvkK+9
   eB3A+Grf8opyChgnpTZ2bfss7t4jjcb7O7Yqs+vLWV3/4mMSptdto6Ozc
   Q==;
X-CSE-ConnectionGUID: ax/201G4TeWRIhxu7tRlag==
X-CSE-MsgGUID: Sj3WJHEnQjSuGAIDTdsJ8Q==
X-IronPort-AV: E=Sophos;i="6.23,243,1770620400"; 
   d="scan'208";a="289088331"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 May 2026 02:01:55 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 19 May 2026 02:01:55 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 19 May 2026 02:01:51 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH 0/8] drm: atmel-hlcdc: fix clock handling and add LVDS support
Date: Tue, 19 May 2026 14:31:27 +0530
Message-ID: <20260519090135.1188405-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_020158_262227_D422D500 
X-CRM114-Status: UNSURE (   9.37  )
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

This series fixes several issues in the atmel-hlcdc CRTC clock handling
and adds LVDS display support for XLCDC-based SoCs.

The first patch fixes a pre-existing off-by-one error in the vertical
back porch register calculation. The following patches progressively
clean up the clock divider logic by introducing DIV_ROUND_CLOSEST,
defining a named maximum divider constant, and extracting clock setup
into a dedicated helper. Clock bypass support is then added for XLCDC
hardware when the computed divider is less than 2.

The final two patches introduce LVDS PLL clock support, configuring the
PLL to 7x the pixel clock rate before the timing engine is programmed,
and add an LVDS output mode handler to map LVDS bus formats to the
appropriate display output modes.

Manikandan Muralidharan (7):
  drm: atmel-hlcdc: Fix off-by-one in vertical back porch setting
  drm: atmel-hlcdc: simplify clock divider selection with
    DIV_ROUND_CLOSEST
  drm: atmel-hlcdc: define ATMEL_HLCDC_CLKDIV_MAX and fix divider
    fallback
  drm: atmel-hlcdc: extract clock setup into a dedicated helper
  drm: atmel-hlcdc: add XLCDC clock bypass support for small dividers
  drm: atmel-hlcdc: add and configure LVDS PLL clock support
  drm: atmel-hlcdc: add LVDS output mode support

Ryan Wanner (1):
  drm: atmel-hlcdc: reorder timing register writes after clock setup

 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 190 +++++++++++++-----
 include/linux/mfd/atmel-hlcdc.h               |   2 +
 2 files changed, 139 insertions(+), 53 deletions(-)

-- 
2.25.1


