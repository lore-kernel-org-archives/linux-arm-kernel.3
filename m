Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A862C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 06:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YAULGZLWc6SAqK0Dioq5lqgfD/qTstWfbGKNHnJErvI=; b=wJIkb/YD2Hjez/Y7mo+/a0NX38
	+ueAg4Fd/5/3RWp/BN1yaANBhqYj7jeJJGxqiMtePfS+EfBUnaQ316Gpl9leFT3b3nH1ik5HNmG95
	IYPCiwod5NTYcf5Tw9eBhILrl9rVq8PtUTrFtufXWbhtnnPnKjvM0DoNwp5qW3rMG5GdR2iC8iBF5
	pzggPIyDqm8wFf+U8DiMfcgVhsextkNtjvZcMUIOkcV5RcVTGzDRtmLGTL5NC7i/+Z2w/R12XZiR8
	Iaq3wzcKue5HsaH1HC+5XvWhzenoQ4XpZYu3MIOIDjItB82TbbbROgfCUOaz3AAqxVeheaJFizLRY
	7zDn1ZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur9o4-0000000EHlv-2xTc;
	Wed, 27 Aug 2025 06:38:52 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur9bY-0000000EFyp-27t1;
	Wed, 27 Aug 2025 06:25:57 +0000
Received: from mail.ideasonboard.com (unknown [223.190.80.94])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C978F300E;
	Wed, 27 Aug 2025 08:24:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756275892;
	bh=cbo7llanDE5LHGG6DHoyS/LY5b862RclitNiMZVMu2Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jhBOgG2Qa8MPoMf3SqT6KR8ZmFV8+zJVEQ0mQFimqZ7W+4apR5QPabPyxt7MOqX4T
	 KRCBu8N8qTBh+Cc5pHzdamGH/W8TJZxtaGvSK0GOcG/GLCBidUf27slZri84dVoYk9
	 O3vyKgLSL8LYiW3M/Y3e+WEKM9yTTecUjUkeqj48=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 27 Aug 2025 11:54:12 +0530
Subject: [PATCH 5/5] platform/broadcom: Destage VCHIQ MMAL driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-vchiq-destage-v1-5-5052a0d81c42@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6730;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=cbo7llanDE5LHGG6DHoyS/LY5b862RclitNiMZVMu2Q=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBorqSd/7nD8vgl1r3/5VYyYJFkndddKs9fbEgwy
 k8w+IQz1MGJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaK6knQAKCRBD3pH5JJpx
 RWqMEACnM9Ho6g9QM4F5OYBVA2dV3VhyS1IL3RckZCw2K7xa9IEs9YDn8baG64HhI+Vdjv48bex
 fBtfivW82AeskhKNZLeGSAo2Q4V6CVNQ6IcaJRG+zjHl/9EkXgMgm+2t7S2R/PsvxMqx5D2RZbn
 WzuZY3j8HVfDr94eHH8eWNZYkipDtqgh1fj4i6zVpuPKjtyfm8xHY+x9bfRCpwmI/t/LnZ55Cj1
 oBfuvRY+n00LAUQSRp/qgLttaS+qgKk1EMlfILSo+ydDSyxXHUOvQOpOI+gTHIeMw/8Yg2BYXsQ
 r2EFg3vsMX2AbliCBLW83cD1S9YqEdMgObSdeRUXhGQpsrtKlWXi22pwDcFBdLDjK9hobC+QM6U
 /vN/kKMrA2k9cDUS0WF3spemTpYzgehS7NL/d7yES8qu45u1b0zxGaH6+8m3e330PiYAH1G4py4
 +Q1j6fZlIeEpLZYK8RWlf3ldaaKvCAoLHEtYE6ur8uDx9nXcKGrv/3OHYl/vTEbvpvSMKk/NT9F
 LqfaHcz7rqBTju9WQo3xEhzVmZ59HJHptiTtY5ljpH+fqk2w405NqW8mDsx8rhFPpb7sDhGbo0/
 kEVVe+60XP3wodftE0XU8x7Mw2Hd2LCKfO+DkFgfHZg78HzKs1zX5kaoF2uJZvrSlvB8kOQnzFX
 iyj1ys/Z7kOwxTw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_232556_690959_F7A3656A 
X-CRM114-Status: UNSURE (   9.35  )
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

Destage the VCHIQ MMAL driver to drivers/platform/broadcom.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 MAINTAINERS                                                             | 2 +-
 drivers/platform/broadcom/Kconfig                                       | 2 ++
 drivers/platform/broadcom/Makefile                                      | 1 +
 drivers/{staging/vc04_services => platform/broadcom}/vchiq-mmal/Kconfig | 0
 .../{staging/vc04_services => platform/broadcom}/vchiq-mmal/Makefile    | 0
 .../vc04_services => platform/broadcom}/vchiq-mmal/mmal-common.h        | 0
 .../vc04_services => platform/broadcom}/vchiq-mmal/mmal-encodings.h     | 0
 .../vc04_services => platform/broadcom}/vchiq-mmal/mmal-msg-common.h    | 0
 .../vc04_services => platform/broadcom}/vchiq-mmal/mmal-msg-format.h    | 0
 .../vc04_services => platform/broadcom}/vchiq-mmal/mmal-msg-port.h      | 0
 .../{staging/vc04_services => platform/broadcom}/vchiq-mmal/mmal-msg.h  | 0
 .../vc04_services => platform/broadcom}/vchiq-mmal/mmal-parameters.h    | 0
 .../vc04_services => platform/broadcom}/vchiq-mmal/mmal-vchiq.c         | 0
 .../vc04_services => platform/broadcom}/vchiq-mmal/mmal-vchiq.h         | 0
 drivers/staging/vc04_services/Kconfig                                   | 2 --
 drivers/staging/vc04_services/Makefile                                  | 1 -
 16 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f39f326a88d7332906ecdd1d9d90cc6848ba3205..5a554add28a65dd42c5d08e01ecbf14c771e9925 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4753,7 +4753,7 @@ S:	Maintained
 T:	git https://github.com/broadcom/stblinux.git
 F:	Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
 F:	drivers/pci/controller/pcie-brcmstb.c
-F:	drivers/platform/broadcom/vchiq-interface
+F:	drivers/platform/broadcom/vchiq-*
 F:	drivers/staging/vc04_services
 F:	include/linux/vchiq
 N:	bcm2711
diff --git a/drivers/platform/broadcom/Kconfig b/drivers/platform/broadcom/Kconfig
index 7dec1ca85d6c56bdb21a9cb170c1d0cdf7587e63..606f3f19774989cbb41d2a207a10a32edd420622 100644
--- a/drivers/platform/broadcom/Kconfig
+++ b/drivers/platform/broadcom/Kconfig
@@ -33,5 +33,7 @@ config VCHIQ_CDEV
 
 		If not sure, set this to 'Y'.
 
+source "drivers/platform/broadcom/vchiq-mmal/Kconfig"
+
 endif
 
diff --git a/drivers/platform/broadcom/Makefile b/drivers/platform/broadcom/Makefile
index a807571c59a47bb418cbb1dfcc389219d0d0ff22..2a7c9511e5d8bbe11c05680eea016ef40796b648 100644
--- a/drivers/platform/broadcom/Makefile
+++ b/drivers/platform/broadcom/Makefile
@@ -12,3 +12,4 @@ ifdef CONFIG_VCHIQ_CDEV
 vchiq-objs += vchiq-interface/vchiq_dev.o
 endif
 
+obj-$(CONFIG_BCM2835_VCHIQ_MMAL)	+= vchiq-mmal/
diff --git a/drivers/staging/vc04_services/vchiq-mmal/Kconfig b/drivers/platform/broadcom/vchiq-mmal/Kconfig
similarity index 100%
rename from drivers/staging/vc04_services/vchiq-mmal/Kconfig
rename to drivers/platform/broadcom/vchiq-mmal/Kconfig
diff --git a/drivers/staging/vc04_services/vchiq-mmal/Makefile b/drivers/platform/broadcom/vchiq-mmal/Makefile
similarity index 100%
rename from drivers/staging/vc04_services/vchiq-mmal/Makefile
rename to drivers/platform/broadcom/vchiq-mmal/Makefile
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-common.h b/drivers/platform/broadcom/vchiq-mmal/mmal-common.h
similarity index 100%
rename from drivers/staging/vc04_services/vchiq-mmal/mmal-common.h
rename to drivers/platform/broadcom/vchiq-mmal/mmal-common.h
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-encodings.h b/drivers/platform/broadcom/vchiq-mmal/mmal-encodings.h
similarity index 100%
rename from drivers/staging/vc04_services/vchiq-mmal/mmal-encodings.h
rename to drivers/platform/broadcom/vchiq-mmal/mmal-encodings.h
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-msg-common.h b/drivers/platform/broadcom/vchiq-mmal/mmal-msg-common.h
similarity index 100%
rename from drivers/staging/vc04_services/vchiq-mmal/mmal-msg-common.h
rename to drivers/platform/broadcom/vchiq-mmal/mmal-msg-common.h
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-msg-format.h b/drivers/platform/broadcom/vchiq-mmal/mmal-msg-format.h
similarity index 100%
rename from drivers/staging/vc04_services/vchiq-mmal/mmal-msg-format.h
rename to drivers/platform/broadcom/vchiq-mmal/mmal-msg-format.h
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-msg-port.h b/drivers/platform/broadcom/vchiq-mmal/mmal-msg-port.h
similarity index 100%
rename from drivers/staging/vc04_services/vchiq-mmal/mmal-msg-port.h
rename to drivers/platform/broadcom/vchiq-mmal/mmal-msg-port.h
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h b/drivers/platform/broadcom/vchiq-mmal/mmal-msg.h
similarity index 100%
rename from drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h
rename to drivers/platform/broadcom/vchiq-mmal/mmal-msg.h
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h b/drivers/platform/broadcom/vchiq-mmal/mmal-parameters.h
similarity index 100%
rename from drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
rename to drivers/platform/broadcom/vchiq-mmal/mmal-parameters.h
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/platform/broadcom/vchiq-mmal/mmal-vchiq.c
similarity index 100%
rename from drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
rename to drivers/platform/broadcom/vchiq-mmal/mmal-vchiq.c
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h b/drivers/platform/broadcom/vchiq-mmal/mmal-vchiq.h
similarity index 100%
rename from drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
rename to drivers/platform/broadcom/vchiq-mmal/mmal-vchiq.h
diff --git a/drivers/staging/vc04_services/Kconfig b/drivers/staging/vc04_services/Kconfig
index 23b5e3dde11447064d084ea5a6d36b8041dceb08..65116b171e88bec7b7f453b17b33478c967b66cf 100644
--- a/drivers/staging/vc04_services/Kconfig
+++ b/drivers/staging/vc04_services/Kconfig
@@ -13,7 +13,5 @@ if BCM_VIDEOCORE
 
 source "drivers/staging/vc04_services/bcm2835-audio/Kconfig"
 
-source "drivers/staging/vc04_services/vchiq-mmal/Kconfig"
-
 endif
 
diff --git a/drivers/staging/vc04_services/Makefile b/drivers/staging/vc04_services/Makefile
index 7a716a5c781530b673027b9f82ec94ebfd615f8a..ba15ec663af0fabaf0060456fc997deb5e5e0533 100644
--- a/drivers/staging/vc04_services/Makefile
+++ b/drivers/staging/vc04_services/Makefile
@@ -1,4 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_SND_BCM2835)		+= bcm2835-audio/
-obj-$(CONFIG_BCM2835_VCHIQ_MMAL)	+= vchiq-mmal/
 

-- 
2.50.1


