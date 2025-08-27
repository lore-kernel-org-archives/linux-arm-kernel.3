Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E4ECA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 06:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jlGG4PwO7Q2g4GI25TboaiXTHdCMwia2FH7s3JPHsc8=; b=aOwumoSES6eNI20i0LMCFYgUIH
	HM3ocwEmbZ500v/H88T2z/49z+Xq+GDUXMwzWb1gNEq3ke4jttlmYykP3S+Ya6DctfubE471Uzob2
	DtqAoDkFsLkbgrOmg1NNQ8gk/6iSI79r+Mvcwyhn2qrCKDn2m33Vctn8bXjf9+pTAGEpO25X86Eqt
	UGv0zSCo8Yp1qQAfrCL7osaLlIEARpHEChb68nTFNMRaU/4C/OgswT1VwB43qQxuEmW/OHszK+xfT
	9n5qNcpPIGgeBZVSzFaS6LPwy7ur32oKFdzWncBRWtelurrr98PB++2PDWiZqCpMHSrYXnDruInqk
	sO4i0b4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur9lN-0000000EHKG-42Tf;
	Wed, 27 Aug 2025 06:36:05 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur9b6-0000000EFu8-2Jic;
	Wed, 27 Aug 2025 06:25:30 +0000
Received: from mail.ideasonboard.com (unknown [223.190.80.94])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9CDE4300E;
	Wed, 27 Aug 2025 08:24:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756275864;
	bh=IE14bylnXzKuuTZLY5cfC2OGFjfl9F8r5qeSFNYtPMs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pSF4wJW02r03WD+U0XzXB0WgxRjxeuNmk53rX5N6E+n5wFBm/lQw2wE/LK/3bzd3d
	 l7fGkv/8ppLUK3dgkj8eKSRyDhb2y2zZZyLQQSPCAw6HmwjlyguPDTYD4q/xFiG6Dv
	 ifaXvqRmvjfitndW8JR2i2vRXYANSrObK/UXUmY8=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 27 Aug 2025 11:54:10 +0530
Subject: [PATCH 3/5] platform/broadcom: Destage VCHIQ interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-vchiq-destage-v1-3-5052a0d81c42@ideasonboard.com>
References: <20250827-vchiq-destage-v1-0-5052a0d81c42@ideasonboard.com>
In-Reply-To: <20250827-vchiq-destage-v1-0-5052a0d81c42@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kernel-list@raspberrypi.com, 
 Stefan Wahren <wahrenst@gmx.net>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9659;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=IE14bylnXzKuuTZLY5cfC2OGFjfl9F8r5qeSFNYtPMs=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBorqSb44bI+4ZR0Z4yqrBR4Yr8ObWwfpQdzXaw3
 LPAlyXEQo2JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaK6kmwAKCRBD3pH5JJpx
 RTzID/4omGkEfgUQ2Zbub4EbXqYd3wrapBLwoU5UeiZxTNzomITK+Agt7jHtcB1TJARGwynHbcm
 knKTnR+GuWA8tF8k0kLrwgIl5Xt6QhJhrHs2xD3xqydN+Ph322aaHhbw5Ew2ktRrOdJbz9MZIrN
 BCtZ3Dm46w0MGcYkeZGFuEhJBVhXaCNa9zabpL3JvbIaokkfbSJQlJ+jsMKQkrUo8xl2gz7QsQt
 Bjk3ef2tppozZ9GLUYP6t3r2nfI0JkgLunZWUXYiZoGziWbUb5/CpEGT1/Q/hRB6wAe3tuMiif/
 zpcn68aDkTj+JqjNAh6HNMNzwY3QUOGjxGv2ezulMeGlwDINXuoaUu+iIdGSkoclUhxdFDRoJ00
 /d5krM+t1PNevw3tPGPe3qt+T3lKe6++XVxU0bw8u8uZ0CyH6JgjQSAYf12a/yOfkUk0MsDslEq
 kERJZuMCo5yTiQhLHsBjDYI9b+mpb4VTvaB4YDbnBuWU+F7AH6q+XVoKfI7V4PgzPnmHPuS0UPN
 RJSi47366hMsWhMxNmqd/ee0ilxMX/gHVr21LwKeLTbCYi6EF2MyKvQLGuCDh/9l5qNnXubvmjD
 6ySQ0uJ05TgM8mObrUMWzwQ9Nq3n1UTQ9OCPmH448imk0gQXMzs+BprcFTE0AnDiHbEt/W1QFK5
 //9yM88Kqm55tGg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_232528_739223_C498A0C2 
X-CRM114-Status: GOOD (  20.58  )
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

Destage the VCHIQ interface driver to drivers/platform/broadcom.

The remaining TODO items are as follows:
1. Upstream the vc_mem char driver
2. Upstream the vc-sm-cma driver
3. Improve documentation

These can be handled separately, after destaging the main interface
here.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 MAINTAINERS                                        |  1 +
 drivers/platform/Kconfig                           |  2 ++
 drivers/platform/Makefile                          |  1 +
 drivers/platform/broadcom/Kconfig                  | 37 ++++++++++++++++++++++
 drivers/platform/broadcom/Makefile                 | 14 ++++++++
 .../broadcom/vchiq-interface}/TESTING              |  0
 .../broadcom/vchiq-interface}/TODO                 |  0
 .../broadcom/vchiq-interface}/vchiq_arm.c          |  0
 .../broadcom/vchiq-interface}/vchiq_bus.c          |  0
 .../broadcom/vchiq-interface}/vchiq_core.c         |  0
 .../broadcom/vchiq-interface}/vchiq_debugfs.c      |  0
 .../broadcom/vchiq-interface}/vchiq_dev.c          |  0
 .../broadcom/vchiq-interface}/vchiq_ioctl.h        |  0
 drivers/staging/vc04_services/Kconfig              | 35 --------------------
 drivers/staging/vc04_services/Makefile             | 12 -------
 15 files changed, 55 insertions(+), 47 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f17ebb1fa51bd7e4dcb2ae1b0fced6d41685dc84..f39f326a88d7332906ecdd1d9d90cc6848ba3205 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4753,6 +4753,7 @@ S:	Maintained
 T:	git https://github.com/broadcom/stblinux.git
 F:	Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
 F:	drivers/pci/controller/pcie-brcmstb.c
+F:	drivers/platform/broadcom/vchiq-interface
 F:	drivers/staging/vc04_services
 F:	include/linux/vchiq
 N:	bcm2711
diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
index 960fd6a82450a4c7b97d51ea3bc29795ee74efd1..325ae46a723a2e6cb15373ea1f94810e0d250e06 100644
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@ -18,3 +18,5 @@ source "drivers/platform/surface/Kconfig"
 source "drivers/platform/x86/Kconfig"
 
 source "drivers/platform/arm64/Kconfig"
+
+source "drivers/platform/broadcom/Kconfig"
diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
index 19ac54648586eb617af0f8a69e3205bd83e8c35b..2616a4585519acb45cd78adb1c2b67ee16ffb6a6 100644
--- a/drivers/platform/Makefile
+++ b/drivers/platform/Makefile
@@ -13,3 +13,4 @@ obj-$(CONFIG_CHROME_PLATFORMS)	+= chrome/
 obj-$(CONFIG_CZNIC_PLATFORMS)	+= cznic/
 obj-$(CONFIG_SURFACE_PLATFORMS)	+= surface/
 obj-$(CONFIG_ARM64_PLATFORM_DEVICES)	+= arm64/
+obj-$(CONFIG_BCM2835_VCHIQ)	+= broadcom/
diff --git a/drivers/platform/broadcom/Kconfig b/drivers/platform/broadcom/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..7dec1ca85d6c56bdb21a9cb170c1d0cdf7587e63
--- /dev/null
+++ b/drivers/platform/broadcom/Kconfig
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config BCM2835_VCHIQ
+	tristate "BCM2835 VCHIQ"
+	depends on BCM_VIDEOCORE && HAS_DMA
+	imply VCHIQ_CDEV
+	help
+		Broadcom BCM2835 and similar SoCs have a VPU called VideoCore.
+		This config enables the VCHIQ driver, which implements a
+		messaging interface between the kernel and the firmware running
+		on VideoCore. Other drivers use this interface to communicate to
+		the VPU. More specifically, the VCHIQ driver is used by
+		audio/video and camera drivers as well as for implementing MMAL
+		API, which is in turn used by several multimedia services on the
+		BCM2835 family of SoCs.
+
+		Defaults to Y when the Broadcom Videocore services are included
+		in the build, N otherwise.
+
+if BCM2835_VCHIQ
+
+config VCHIQ_CDEV
+	bool "VCHIQ Character Driver"
+	help
+		Enable the creation of VCHIQ character driver. The cdev exposes
+		ioctls used by userspace libraries and testing tools to interact
+		with VideoCore, via the VCHIQ core driver (Check BCM2835_VCHIQ
+		for more info).
+
+		This can be set to 'N' if the VideoCore communication is not
+		needed by userspace but only by other kernel modules
+		(like bcm2835-audio).
+
+		If not sure, set this to 'Y'.
+
+endif
+
diff --git a/drivers/platform/broadcom/Makefile b/drivers/platform/broadcom/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..a807571c59a47bb418cbb1dfcc389219d0d0ff22
--- /dev/null
+++ b/drivers/platform/broadcom/Makefile
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_BCM2835_VCHIQ)	+= vchiq.o
+
+vchiq-objs := \
+   vchiq-interface/vchiq_core.o  \
+   vchiq-interface/vchiq_arm.o \
+   vchiq-interface/vchiq_bus.o \
+   vchiq-interface/vchiq_debugfs.o \
+
+ifdef CONFIG_VCHIQ_CDEV
+vchiq-objs += vchiq-interface/vchiq_dev.o
+endif
+
diff --git a/drivers/staging/vc04_services/interface/TESTING b/drivers/platform/broadcom/vchiq-interface/TESTING
similarity index 100%
rename from drivers/staging/vc04_services/interface/TESTING
rename to drivers/platform/broadcom/vchiq-interface/TESTING
diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/platform/broadcom/vchiq-interface/TODO
similarity index 100%
rename from drivers/staging/vc04_services/interface/TODO
rename to drivers/platform/broadcom/vchiq-interface/TODO
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/platform/broadcom/vchiq-interface/vchiq_arm.c
similarity index 100%
rename from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
rename to drivers/platform/broadcom/vchiq-interface/vchiq_arm.c
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c b/drivers/platform/broadcom/vchiq-interface/vchiq_bus.c
similarity index 100%
rename from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
rename to drivers/platform/broadcom/vchiq-interface/vchiq_bus.c
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/platform/broadcom/vchiq-interface/vchiq_core.c
similarity index 100%
rename from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
rename to drivers/platform/broadcom/vchiq-interface/vchiq_core.c
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c b/drivers/platform/broadcom/vchiq-interface/vchiq_debugfs.c
similarity index 100%
rename from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
rename to drivers/platform/broadcom/vchiq-interface/vchiq_debugfs.c
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/platform/broadcom/vchiq-interface/vchiq_dev.c
similarity index 100%
rename from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
rename to drivers/platform/broadcom/vchiq-interface/vchiq_dev.c
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_ioctl.h b/drivers/platform/broadcom/vchiq-interface/vchiq_ioctl.h
similarity index 100%
rename from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_ioctl.h
rename to drivers/platform/broadcom/vchiq-interface/vchiq_ioctl.h
diff --git a/drivers/staging/vc04_services/Kconfig b/drivers/staging/vc04_services/Kconfig
index ccc8e15886482e8caa4aeb12440036183fc9b80c..3c01a1a304f1e6e6a03062b1a5f6af59643adf66 100644
--- a/drivers/staging/vc04_services/Kconfig
+++ b/drivers/staging/vc04_services/Kconfig
@@ -11,41 +11,6 @@ menuconfig BCM_VIDEOCORE
 
 if BCM_VIDEOCORE
 
-config BCM2835_VCHIQ
-	tristate "BCM2835 VCHIQ"
-	depends on HAS_DMA
-	imply VCHIQ_CDEV
-	help
-		Broadcom BCM2835 and similar SoCs have a VPU called VideoCore.
-		This config enables the VCHIQ driver, which implements a
-		messaging interface between the kernel and the firmware running
-		on VideoCore. Other drivers use this interface to communicate to
-		the VPU. More specifically, the VCHIQ driver is used by
-		audio/video and camera drivers as well as for implementing MMAL
-		API, which is in turn used by several multimedia services on the
-		BCM2835 family of SoCs.
-
-		Defaults to Y when the Broadcom Videocore services are included
-		in the build, N otherwise.
-
-if BCM2835_VCHIQ
-
-config VCHIQ_CDEV
-	bool "VCHIQ Character Driver"
-	help
-		Enable the creation of VCHIQ character driver. The cdev exposes
-		ioctls used by userspace libraries and testing tools to interact
-		with VideoCore, via the VCHIQ core driver (Check BCM2835_VCHIQ
-		for more info).
-
-		This can be set to 'N' if the VideoCore communication is not
-		needed by userspace but only by other kernel modules
-		(like bcm2835-audio).
-
-		If not sure, set this to 'Y'.
-
-endif
-
 source "drivers/staging/vc04_services/bcm2835-audio/Kconfig"
 
 source "drivers/staging/vc04_services/bcm2835-camera/Kconfig"
diff --git a/drivers/staging/vc04_services/Makefile b/drivers/staging/vc04_services/Makefile
index dad3789522b80420f1f72ca8f740c816fb3d9843..51c9466ec7a28141cf66508f602f43cd89ad408b 100644
--- a/drivers/staging/vc04_services/Makefile
+++ b/drivers/staging/vc04_services/Makefile
@@ -1,16 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_BCM2835_VCHIQ)	+= vchiq.o
-
-vchiq-objs := \
-   interface/vchiq_arm/vchiq_core.o  \
-   interface/vchiq_arm/vchiq_arm.o \
-   interface/vchiq_arm/vchiq_bus.o \
-   interface/vchiq_arm/vchiq_debugfs.o \
-
-ifdef CONFIG_VCHIQ_CDEV
-vchiq-objs += interface/vchiq_arm/vchiq_dev.o
-endif
-
 obj-$(CONFIG_SND_BCM2835)		+= bcm2835-audio/
 obj-$(CONFIG_VIDEO_BCM2835)		+= bcm2835-camera/
 obj-$(CONFIG_BCM2835_VCHIQ_MMAL)	+= vchiq-mmal/

-- 
2.50.1


