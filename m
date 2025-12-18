Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FEDD6ACF5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 13:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qIIWv/lDaJ98udQxJrqhIpRjXw8Qs3mFGfYWACCArgQ=; b=ZrZEUBk3bDJGZt
	8o+pT+Tzij9oDMm3DNFX8B+VQ5lJiG8V9A1wrqyxIL3dyZybBVm6BWc/J03SJVsgaimLVlTqcYp+E
	AEHCb5lLdkinUrONHU2aYJ5BW67chwWDLWpOF83c2uYNz23q93/SHh+SiU2t4VMQy+4I787ysWRRc
	6nJneie2gg12Q13zF0c2q+BlR9ebSUDxir9k05AC9UhmD+Ugh2pCbWZP4HWwppxtiOg9G5p5xPPNo
	tNKdgyvWJZuAvxZUARLqd3TQP6NSKWiG77mdaNjjN63pvN35RSAKu0Zfd4XKs9HV+ra4np4nCP2oi
	hxEFyWKbnW1865wvwyAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWE1u-00000008WTI-1rks;
	Thu, 18 Dec 2025 13:26:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWE1r-00000008WRT-154u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 13:26:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1766064409; x=1797600409;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=ZfhUQ/Qln635AZ6ZIhDB/wMpfxr83fRZuqUcc7Y7628=;
  b=LNFYtLhNyKoA6m/zePR9NO/M0Sy7dgxR6EE4qb0RmEkTdDcT0imzXxBA
   Uuc+LLHcAySHH2vSIdE67kOXgvZQLLIZz/1X29q3A37dFemMrO4/C5wMZ
   vO4PyVTCzn59F5ojxe9+3UHk+zci+f0YnzlRBgiUpqcw0aFcTH7GnFOIi
   1qlMto5GB3yIYbNFGwzEhD43xS9cW9wG4HKfvEfjXyMbXbCIeoZDRTKg2
   Qgh6tharns5R9ZnyhzUr//PIAMGC1LljOnTwT8S5lE68pxScP6zKywGCu
   i5ZcMG6QddzKHNz+gWsDuUf69DKjbmUbvWQsxzjYVG4/1zVaJACZXr7CN
   w==;
X-CSE-ConnectionGUID: 2/lmXmCJRTiQR6o8m97H0g==
X-CSE-MsgGUID: L9oAnKaAQa2PAQ7/IieSPg==
X-IronPort-AV: E=Sophos;i="6.21,158,1763449200"; 
   d="scan'208";a="218051098"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 06:26:46 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Thu, 18 Dec 2025 06:26:13 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 18 Dec 2025 06:26:10 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: [PATCH v2 0/8] drm/atmel-hlcdc: make more use of helpers
Date: Thu, 18 Dec 2025 14:25:58 +0100
Message-ID: <20251218-lcd_cleanup_mainline-v2-0-df837aba878f@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOcARGkC/4WNQQ6CMBBFr0JmbQ1tLKgr7mEIKcMgk0CLLRAN4
 e5WXLh0+V7y318hkGcKcE1W8LRwYGcjqEMC2Bl7J8FNZFCp0lIqKXpsKuzJ2HmsBsO2Z0uizgx
 irmtt0gvE6eip5eeevZVf9vSYY336yY7D5Pxrv17kx/55WaRIhdLnnLKWTk2WFwOjd9jxeEQ3Q
 Llt2xtIml1p0QAAAA==
X-Change-ID: 20251121-lcd_cleanup_mainline-b6acc75b5a09
To: Manikandan Muralidharan <manikandan.m@microchip.com>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ludovic Desroches
	<ludovic.desroches@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=ZfhUQ/Qln635AZ6ZIhDB/wMpfxr83fRZuqUcc7Y7628=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpRADxV9uOLZwSsnjqone9aQET3NQfrYDsaqhOh
 HbqDNPxLR6JAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaUQA8QAKCRA+OeYT93tk
 LVMuD/wOQGRO1YpOEPrvkpJ8dcPSKsfy0YpV0kLqgI8f0oNExLcgc5RFE4MtPkUBnELll/NzkD1
 PxaJwWEiXJFgNqfesvmi3CzDZ7mn7aPkpj98t31Ga7SSYV6VLB7knYEqxSsSG0GP1xuJhWmDJl9
 tECV/sGxITN+wGw3SIlfWvLqrASwMuLiSdOazAVGdc7axjBe8gWDtoGTdpudJ22dwzhoJhjWoa3
 8tsE73n6yjs2qlWHH+BwJvXJHjaDMYwvs+gKHT12GtQ2WpwHaaOZpaFh9WwUD2pGmV1eZ3z3qVg
 LPN3yj3omXKYakfyiAiNi/unk0++eU4pA3IX8dELAEiKLrVeRr0/aBOr0t9Kp7rvI1xoDDZBQl/
 gsYj1dbU7gK6Nu9ad3y1AMvo1hc7Fv45rfbVxtI+yGBPlubBAbkZX2WxrFn19X1o1ylOEeyqqXT
 wWrKBmobLwe27M3QD6U7/3wK2j32jH2SNibsyfADY5YJREkXgl1+NlLYBHEsjo18TtqhNZMdvIq
 hfGcOuUljLlcNIuE69J97Wk3MjBVP+hr1MniwhTtp8jSPT8zZtn6MuGQ1IHeiOShhxgPXDLMZSD
 6s6Pm3gjjPfcmCVBSsp/27QNHOgjcLzfoCS4HUXykhQw5SxGPEOlq2iL9G01M1nZkOkg4QJxBMP
 sfs+IZJDw7hlkEg==
X-Developer-Key: i=ludovic.desroches@microchip.com; a=openpgp;
 fpr=665BAA7297BE089A28B77696E332995F09DCC11A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_052651_537312_481DD3F1 
X-CRM114-Status: GOOD (  10.00  )
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

Hi,

This set of patches is mostly about using available helpers when
possible to simplify the code and ease the maintenance.

There is a dependency on "drm/panel: simple: restore connector_type
fallback", otherwise the atmel-hlcdc driver may fail during the probe.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
---
Changes in v2:
- Fix patch 5 warning about uninitialized use of ret.
- Link to v1: https://lore.kernel.org/r/20251121-lcd_cleanup_mainline-v1-0-2587e6fe4d67@microchip.com

---
Ludovic Desroches (8):
      drm/atmel-hlcdc: use managed device resources for the display controller
      drm/atmel-hlcdc: add support for the nomodeset kernel parameter
      drm/atmel-hlcdc: use drmm_simple_encoder_alloc()
      drm/atmel-hlcdc: use drm_crtc_mask()
      drm/atmel-hlcdc: use devm_drm_of_get_bridge()
      drm/atmel-hlcdc: use drmm_crtc_alloc_with_planes()
      drm/atmel-hlcdc: use drmm_universal_plane_alloc()
      drm/atmel-hlcdc: destroy properly the plane state in the reset callback

 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c   | 32 ++---------
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c     | 40 +++++++------
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h     |  1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c | 50 +++++-----------
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c  | 73 +++++++++++-------------
 5 files changed, 75 insertions(+), 121 deletions(-)
---
base-commit: 88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
change-id: 20251121-lcd_cleanup_mainline-b6acc75b5a09

Best regards,
-- 
Ludovic Desroches <ludovic.desroches@microchip.com>


