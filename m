Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D147CFD317
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 12:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fDKTZtq86eDQ5SeG7e4CuOI1cFCNEBgsrLP645Z0Hmk=; b=JPObjBgxDGXLK0
	jQDVjuMkyL5sT/6thMOTL31EwjUNos7Qz7Nf4wYgPsn1Zu/WxYiE9FOH2vB5Ti77o4DPOo59v2puv
	CjP+7GpWqfGfGc1lgfXTB/dJxJzFwbZ6hyVcHyTuJydyrhwHc/tA5lpBF+2nHrhiX92EtNC8r8hWz
	hs+mSTIaL4IWNwBxqbdx5iYWLRsIg3P7mXJDBx6AaZ6AaupsXniKio111S956V6Wfptf0ttcnoCOG
	U7iNbFLDJvoTw++RpveuhHM5qKRkpXSk7XtttmJsptAFeAdDyUQt06+9lHku11KiHd6jEiGyS8+Ye
	7fU9ZThQPEK9cxQHHzMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVNJ-0000000Bbna-3X1p;
	Mon, 24 Nov 2025 12:08:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVNF-0000000BblS-2pju
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 12:08:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1763986133; x=1795522133;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=jMFPcEk6SvVZ6KZ631rfjxX8cix/wf+XMOzGx6usZoY=;
  b=DyJEOit0QeNnXZYBuhJQXF/qj7FQkhurd/crmAeHrQnSE7iHG4yyhMoC
   SSr9QLHNBLa7bEtaFGG5MhUMC9yD0msWPjcr/gAMmbdnqyVu4k7GZxS1i
   tGNEqWgyiU/RRs5Yfrxy8aGbZCK626luQ4LXojLw0bxBld7kSpNOEwIOa
   y4cPUGtqUGqq9Fi5GUJgU3CEIe3bQbHbFw0yCCZ5EsrAQfldqup1JzNE6
   gq9GVG9W+/qQeijOKbEv6AndEdPhvYyIu1tbOaifm/kJeKN/En8uI0WHE
   vAj9MmrmuwQMiBdsFHNMT2g53FPnIYMqlAjuTFmZWPj7jn2wjBa/kOckB
   w==;
X-CSE-ConnectionGUID: oKLeMsUBTbikmbNoceGrpg==
X-CSE-MsgGUID: XwzE9oi1R6uEqIHkdixDlg==
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="216913334"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 05:08:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Mon, 24 Nov 2025 05:08:02 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 24 Nov 2025 05:07:58 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Subject: [PATCH v3 0/5] drm/microchip: add GFX2D support for SAM9X60 and
 SAM9X75
Date: Mon, 24 Nov 2025 13:07:16 +0100
Message-ID: <20251124-cpitchen-mainline_gfx2d-v3-0-607f8c407286@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHVKJGkC/4XN0QrCIBTG8VcJrzOmMrd11XtEhOlxHmg6dMhi7
 N1zu4oguvx/cH5nIQkiQiLnw0IiZEwYfAlxPBDtlO+BoilNeMXrqmOM6hEn7cDTQaF/ood7b2d
 uqJSCQSdqrmxDyvUYweK8y9dbaYdpCvG1P8psW/+bmdGKmsaqB1OiZQCXAXUM2uF40mEgm5v5p
 9X+tnixpLZKd6aWkvFva13XN5T7Fu4OAQAA
X-Change-ID: 20250911-cpitchen-mainline_gfx2d-6631e9352af7
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	"Alexandre Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Russell King <linux@armlinux.org.uk>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Cyrille Pitchen <cyrille.pitchen@microchip.com>, Conor Dooley
	<conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3549;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=jMFPcEk6SvVZ6KZ631rfjxX8cix/wf+XMOzGx6usZoY=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ6aKV6PFu7wC0eiLG42jytfnzOF8XdSeYvLn+n4F1paLE
 48rpRR3lLIwiHExyIopshx6s7U38/irx3avRKVg5rAygQxh4OIUgInYWzIyPMtakjXJjGEf97yc
 1c/DgoqKDC5XK2b8DZZ+v3PPlw1l8owMi08f6nGf4Ws8veGdvm3M5vkb98wT+zD9lPa6eK159WX
 HWQA=
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_040853_786627_BB7C3F35 
X-CRM114-Status: GOOD (  16.22  )
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

Hi all,

This series of patches adds GFX2D support.
The GFX2D is a 2D GPU embedded in some Microchip SoCs such as the
SAM9X60 and SAM9X75.

Patches have been developped on top the 'linux-6.12-mchp' branch of the
https://github.com/linux4microchip/linux.git repository and tested on
mainly on a sam9x75-curiosity board and also on a sam9x60-ek board.

Then patches have been rebased on top of the 'drm-misc-next' branch
of the https://gitlab.freedesktop.org/drm/misc/kernel.git repository
for mainlining.

About the tests, the GFX2D driver was used with the M2D (Multi 2D)
library: https://github.com/linux4sam/libm2d

This is an open source library that abstracts 2D GPUs like the Microchip
GFX2D (and later the Vivante GC520UL), providing graphics applications
of libraries with a unified API, inspired from OpenGL but focused on 2D
GPUs. The libm2d library itself relies on the libdrm library to send
commands to the relevant DRM driver in the Linux kernel.

M2D comes with a m2d_test program to run basic unitary tests.
In addition, libm2d has been integrated to two graphics frameworks:
- EGT: https://github.com/linux4sam/egt
- LVGL: https://github.com/lvgl/lvgl/pull/8729

BR,

Cyrille

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
---
Changes in v3:
- Collected Acked-by tag from Conor Dooley on patch 1
- Rebased onto the 'drm-misc-next' branch on 2025-11-24.
- Link to v2: https://lore.kernel.org/r/20250918-cpitchen-mainline_gfx2d-v2-0-6cfac9d56612@microchip.com

Changes in v2:
- Renamed microchip,gfx2d.yaml into microchip,sam9x60-gfx2d.yaml.
- Removed the 'clock-names' property from the DT bindings.
- Renamed the GPU node from 'gfx2d' to 'gpu' in sam9x{60,7}.dtsi files.
- Link to v1: https://lore.kernel.org/r/20250911-cpitchen-mainline_gfx2d-v1-0-d7fab1a381ee@microchip.com

---
Cyrille Pitchen (5):
      dt-bindings: gpu: add bindings for the Microchip GFX2D GPU
      drm/microchip: add a driver for the Microchip GFX2D GPU
      ARM: dts: microchip: sam9x60: Add GFX2D GPU
      ARM: dts: microchip: sam9x7: Add GFX2D GPU
      ARM: configs: at91_dt_defconfig: enable GFX2D driver

 .../bindings/gpu/microchip,sam9x60-gfx2d.yaml      |   46 +
 MAINTAINERS                                        |   10 +
 arch/arm/boot/dts/microchip/sam9x60.dtsi           |    8 +
 arch/arm/boot/dts/microchip/sam9x7.dtsi            |    8 +
 arch/arm/configs/at91_dt_defconfig                 |    1 +
 drivers/gpu/drm/Kconfig                            |    2 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/microchip/Kconfig                  |   21 +
 drivers/gpu/drm/microchip/Makefile                 |    8 +
 drivers/gpu/drm/microchip/mchp_gfx2d_cmd.c         | 1808 ++++++++++++++++++++
 drivers/gpu/drm/microchip/mchp_gfx2d_cmd.h         |  169 ++
 drivers/gpu/drm/microchip/mchp_gfx2d_drv.c         |  350 ++++
 drivers/gpu/drm/microchip/mchp_gfx2d_drv.h         |  132 ++
 drivers/gpu/drm/microchip/mchp_gfx2d_gem.c         |  263 +++
 drivers/gpu/drm/microchip/mchp_gfx2d_gem.h         |   90 +
 drivers/gpu/drm/microchip/mchp_gfx2d_ioctl.c       |  274 +++
 drivers/gpu/drm/microchip/mchp_gfx2d_ioctl.h       |   17 +
 include/uapi/drm/microchip_drm.h                   |  286 ++++
 18 files changed, 3494 insertions(+)
---
base-commit: 715cbb21c6fe2fe5760ea05e873f12473aa5884e
change-id: 20250911-cpitchen-mainline_gfx2d-6631e9352af7

Best regards,
-- 
Cyrille Pitchen <cyrille.pitchen@microchip.com>


