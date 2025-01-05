Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853C3E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 23:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKrjgKCnZKreaXJ2E0ycjM5Ra7ABafmAz9pY9R2DnqQ=; b=kfwELjckkW6i6g63vY7WJvdylE
	ccAcXLiqo0Go14HHQ5TyH0Xy05OTIyZ5KwVATJG0KNBeF+bkqu/MN47kCVGadQGG2SB6+lGMXzegs
	ndG9JZQnCVNgJpgYqy0mo7OC30c8U/UjyJM2dVbb11lzz89Wh58fzU9y5KrDK8fIwUDrus5XR9dCF
	NgJl/7LDrDDjphdiiSaTyw8kf9vrLZlOcZ5+jpRlRm1bHnPtbPEM1xp1VJyexC4YuZuur7jtCQ4TR
	KjLVsCDVwAqS3R3elEQetwLv3HQ0cemcbfElwz7G62HGNtbuWhieKqbj8wg2GgURiOZPpPB+lUWVg
	RarcdlwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUZdw-0000000HUs6-0zUC;
	Sun, 05 Jan 2025 23:02:48 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUZbc-0000000HUbe-3N84
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 23:00:25 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-540218726d5so14355798e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 15:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736118023; x=1736722823; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GKrjgKCnZKreaXJ2E0ycjM5Ra7ABafmAz9pY9R2DnqQ=;
        b=npn8n4WaUSo7uVDpxirj+KJ44LSt8ax48y6OYHGg6t9X14j8TNunRj1dKnEoqnp9hQ
         dq+BSnVW0y672DiFo+jKE1htPA8tfaKnMOFuCJmMqfXNozVlY4mkTZ+7n+cGGwLtJdYd
         3BECh/D8YnNTudgmcKltS5LXXW3GeMcNICg9Q4v5ND48Ib9+Be6QLgn1qHA/dce1T80b
         a4O2xaXFJDjfkb7XXyIglFEYjOacCdL/NRiN1oURWV/Xbdi5XI5w0nCJpQ27+PoYkxez
         2lcHRq6Kq3QvsRpcJKQTjakOyVPbjdOayLB3urc+/1H7Sw21XHYR6lM3jivJEms6/FCO
         ZsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736118023; x=1736722823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GKrjgKCnZKreaXJ2E0ycjM5Ra7ABafmAz9pY9R2DnqQ=;
        b=DLtmUiBSxwSPLWyy+O1vOMplUlIRo88iAnQno5/VLrRd+5B9o7nKDESMKk6phjfxoe
         jWg1ZLLLJuZroLXEjAtA4kHo9nNgzSSkcuIwQBm6ErgzrZNjMjb0soSgrXFZaBZN5Bd7
         gffgxid0f9OCfUGBXffGYtOAOIvzOVi+ojZkWOGoQFro+1VFCFWCN46FV7y2/2Zcw9vA
         f3+BIi4tsOI/fWsgAGTrfbm3zDnEelqoYcWiso+E2wl50a/VG/jRn6l8HrCVjd96S7PD
         yZ6vkfcpE4iJFmUznuB8uzZfpeNyCGWJA4zah7y9TXpfuLbjR5ecajkGwM8Zd/zJ/oOS
         +UKA==
X-Forwarded-Encrypted: i=1; AJvYcCVna5yCbNKE59SdR+qftnL6iVx7q+liMItmq7pEu7P3XVViTb6zPiiE+i6eS8PkER3W92UIXIkolxW+STr3jISx@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9llQGqqW+D+ni/sruSiR1iRuwzQ59scwhh+IV8KZ5adcXhdeu
	VXLIO+sAnOXnLAskjbmoNHHsnFcKxR1XL5fCTLGiXqOHrL2RkpswlHcViD8l8t0=
X-Gm-Gg: ASbGncs7opHbaESAQ4iTD/ql8bKkpJEtjVC3AS38k0J1RbZ9S6iLfRe2cEFWPqwKsd6
	5YfBB4YQAFb0SAodwsGyrY//9ci0bZ/ShBYK5DmDEzUbRK2Odlc1A7T8jcCVL6S6X7bX7CU+nix
	xr5LuDqw6Hl50Rg+bCT5dx08YHm8+2iYcceyvGYTly6ATbnNM3d1EpJRSi6H1/mNMXF410Cvkr4
	9lokubkQjCHtRpe6YPh0jUO08VgNoXdbR5R5B+CW8f0HEnPZlLpN4XyXNzKBhZz
X-Google-Smtp-Source: AGHT+IGJxgfPUfQOhY6Li6RsbogVRq6RGnpuosjAEzvi+7xDTfLNkIU+jZvZPDSUtn8b1BLQ/xPk1w==
X-Received: by 2002:a05:6512:308d:b0:541:3587:9d4d with SMTP id 2adb3069b0e04-54229524687mr16678010e87.7.1736118021787;
        Sun, 05 Jan 2025 15:00:21 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223821583sm4614034e87.203.2025.01.05.15.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 15:00:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 06 Jan 2025 01:00:13 +0200
Subject: [PATCH v3 1/2] drm/nouveau: incorporate I2C TV encoder drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-nouveau-encoder-slave-v3-1-1d37d2f2c67f@linaro.org>
References: <20250106-nouveau-encoder-slave-v3-0-1d37d2f2c67f@linaro.org>
In-Reply-To: <20250106-nouveau-encoder-slave-v3-0-1d37d2f2c67f@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11380;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jZgQ8jsx9IvUwfG9AGdf5L+CCi3TiGpXqyw83nnGk6k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnew8AeOvmqiw012/pef6mfb5OTHNE+HIxXeW9q
 M7jUMaP4waJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3sPAAAKCRCLPIo+Aiko
 1Z7HB/94O6lnA3X34i1T37/4WFh3a6vXNePjVpGOVHZUgDVX51HAXJRB5qtjZXqJOraVoIZJnJA
 gDBXHK0qgxJTpG56n+/W8BB3gQB/7fKbeasmx7RWZGx8Li9vuokRbxX3rucMLnbeUMv5WshCu3R
 Ameoh6Gp8rsW7a8PTMfPc/ieOlDBpFXXUf5za26g7HYtQMDRqsb3DsEsZaUWM5YZeAVR+hXRYSU
 IsNQXIM4vb/SHEIHKKX+HNuaLAY0raV+kZDl06lyBYdxVIeDTmggxLDeLoYLZ/eGOirgBV7zoX8
 PkMoYwRJScTslSlHAdzEn+Bd6MdXz/iu/hDXKYjpKjpD6m5P
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_150024_853494_F80DCAD3 
X-CRM114-Status: GOOD (  21.87  )
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

Chrontel CH7006 and Silicon Image sil164 drivers use drm_encoder_slave
interface which is being used only by the nouveau driver. It doesn't
make sense to keep this interface inside the DRM subsystem. In
preparation to moving this set of helpers to the nouveau driver, move
the only two I2C driver that use that interface to the nouveau driver
too.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/configs/multi_v7_defconfig                    |  4 ++--
 arch/parisc/configs/generic-32bit_defconfig            |  4 ++--
 arch/parisc/configs/generic-64bit_defconfig            |  4 ++--
 drivers/gpu/drm/i2c/Kconfig                            | 18 ------------------
 drivers/gpu/drm/i2c/Makefile                           |  6 ------
 drivers/gpu/drm/nouveau/Kconfig                        | 18 ++++++++++++++++++
 drivers/gpu/drm/nouveau/dispnv04/Kbuild                |  2 ++
 drivers/gpu/drm/nouveau/dispnv04/dfp.c                 |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/i2c/Kbuild            |  5 +++++
 .../gpu/drm/{ => nouveau/dispnv04}/i2c/ch7006_drv.c    |  0
 .../gpu/drm/{ => nouveau/dispnv04}/i2c/ch7006_mode.c   |  0
 .../gpu/drm/{ => nouveau/dispnv04}/i2c/ch7006_priv.h   |  7 ++++---
 .../gpu/drm/{ => nouveau/dispnv04}/i2c/sil164_drv.c    |  3 ++-
 drivers/gpu/drm/nouveau/dispnv04/tvnv04.c              |  2 +-
 .../gpu/drm/nouveau/include/dispnv04}/i2c/ch7006.h     |  4 ++--
 .../gpu/drm/nouveau/include/dispnv04}/i2c/sil164.h     |  4 ++--
 16 files changed, 43 insertions(+), 40 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 758276027dbcd0d444dac995745076b4e33457ff..4b100ddb0c54cb8f8ba81758c2f59d24f0fe82e9 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -713,10 +713,10 @@ CONFIG_VIDEO_ADV7604_CEC=y
 CONFIG_VIDEO_ML86V7667=m
 CONFIG_IMX_IPUV3_CORE=m
 CONFIG_DRM=y
-# CONFIG_DRM_I2C_CH7006 is not set
-# CONFIG_DRM_I2C_SIL164 is not set
 CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_NOUVEAU=m
+# CONFIG_DRM_NOUVEAU_CH7006 is not set
+# CONFIG_DRM_NOUVEAU_SIL164 is not set
 CONFIG_DRM_EXYNOS=m
 CONFIG_DRM_EXYNOS_FIMD=y
 CONFIG_DRM_EXYNOS_MIXER=y
diff --git a/arch/parisc/configs/generic-32bit_defconfig b/arch/parisc/configs/generic-32bit_defconfig
index 5ce258f3fffaf0e3aac5f8f5450dd65bad305879..f5fffc24c3bc5baf0d77b845e3ac77fae49b276e 100644
--- a/arch/parisc/configs/generic-32bit_defconfig
+++ b/arch/parisc/configs/generic-32bit_defconfig
@@ -132,11 +132,11 @@ CONFIG_I2C=y
 CONFIG_HWMON=m
 CONFIG_DRM=m
 CONFIG_DRM_DISPLAY_DP_AUX_CEC=y
-# CONFIG_DRM_I2C_CH7006 is not set
-# CONFIG_DRM_I2C_SIL164 is not set
 CONFIG_DRM_RADEON=m
 CONFIG_DRM_NOUVEAU=m
 # CONFIG_DRM_NOUVEAU_BACKLIGHT is not set
+# CONFIG_DRM_NOUVEAU_CH7006 is not set
+# CONFIG_DRM_NOUVEAU_SIL164 is not set
 CONFIG_DRM_VGEM=m
 CONFIG_DRM_UDL=m
 CONFIG_DRM_MGAG200=m
diff --git a/arch/parisc/configs/generic-64bit_defconfig b/arch/parisc/configs/generic-64bit_defconfig
index 19a804860ed5b355f82396c2314bd0d8f3fb768a..704f68fbf960fb865206c8f8ab1751c9f0db6de3 100644
--- a/arch/parisc/configs/generic-64bit_defconfig
+++ b/arch/parisc/configs/generic-64bit_defconfig
@@ -193,11 +193,11 @@ CONFIG_MEDIA_SUPPORT=m
 CONFIG_AGP=y
 CONFIG_AGP_PARISC=y
 CONFIG_DRM=y
-# CONFIG_DRM_I2C_CH7006 is not set
-# CONFIG_DRM_I2C_SIL164 is not set
 CONFIG_DRM_RADEON=y
 CONFIG_DRM_NOUVEAU=m
 # CONFIG_DRM_NOUVEAU_BACKLIGHT is not set
+# CONFIG_DRM_NOUVEAU_CH7006 is not set
+# CONFIG_DRM_NOUVEAU_SIL164 is not set
 CONFIG_DRM_MGAG200=m
 CONFIG_FB=y
 CONFIG_FB_PM2=m
diff --git a/drivers/gpu/drm/i2c/Kconfig b/drivers/gpu/drm/i2c/Kconfig
index 6f19e1c35e30b0e595c1a60628a6b8cf313fcabc..d5200f67958e68a8ec73401f1d3b79cbe0aa303d 100644
--- a/drivers/gpu/drm/i2c/Kconfig
+++ b/drivers/gpu/drm/i2c/Kconfig
@@ -2,24 +2,6 @@
 menu "I2C encoder or helper chips"
      depends on DRM && DRM_KMS_HELPER && I2C
 
-config DRM_I2C_CH7006
-	tristate "Chrontel ch7006 TV encoder"
-	default m if DRM_NOUVEAU
-	help
-	  Support for Chrontel ch7006 and similar TV encoders, found
-	  on some nVidia video cards.
-
-	  This driver is currently only useful if you're also using
-	  the nouveau driver.
-
-config DRM_I2C_SIL164
-	tristate "Silicon Image sil164 TMDS transmitter"
-	default m if DRM_NOUVEAU
-	help
-	  Support for sil164 and similar single-link (or dual-link
-	  when used in pairs) TMDS transmitters, used in some nVidia
-	  video cards.
-
 config DRM_I2C_NXP_TDA998X
 	tristate "NXP Semiconductors TDA998X HDMI encoder"
 	default m if DRM_TILCDC
diff --git a/drivers/gpu/drm/i2c/Makefile b/drivers/gpu/drm/i2c/Makefile
index a962f6f085686674ed33010345730db776815ebe..31fd35527d99d7eb23851d290175a3ff0c756772 100644
--- a/drivers/gpu/drm/i2c/Makefile
+++ b/drivers/gpu/drm/i2c/Makefile
@@ -1,10 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-ch7006-y := ch7006_drv.o ch7006_mode.o
-obj-$(CONFIG_DRM_I2C_CH7006) += ch7006.o
-
-sil164-y := sil164_drv.o
-obj-$(CONFIG_DRM_I2C_SIL164) += sil164.o
-
 tda998x-y := tda998x_drv.o
 obj-$(CONFIG_DRM_I2C_NXP_TDA998X) += tda998x.o
 obj-$(CONFIG_DRM_I2C_NXP_TDA9950) += tda9950.o
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index ce840300578d8a4011c448b61caf830cef3805bf..ac76c0787010396af5eda901581d9894ccda43d0 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -109,3 +109,21 @@ config DRM_NOUVEAU_GSP_DEFAULT
 	help
 	  Say Y here if you want to use the GSP codepaths by default on
 	  Turing and Ampere GPUs.
+
+config DRM_NOUVEAU_CH7006
+	tristate "Chrontel ch7006 TV encoder"
+	depends on DRM_NOUVEAU
+	default m
+	help
+	  Support for Chrontel ch7006 and similar TV encoders.
+
+	  This driver is currently only useful if you're also using
+	  the nouveau driver.
+
+config DRM_NOUVEAU_SIL164
+	tristate "Silicon Image sil164 TMDS transmitter"
+	depends on DRM_NOUVEAU
+	default m
+	help
+	  Support for sil164 and similar single-link (or dual-link
+	  when used in pairs) TMDS transmitters.
diff --git a/drivers/gpu/drm/nouveau/dispnv04/Kbuild b/drivers/gpu/drm/nouveau/dispnv04/Kbuild
index 975c4e2269366d57e928eedbbbc669d24744379f..949802882ebd53c15e124c218a092af9693d36bc 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/Kbuild
+++ b/drivers/gpu/drm/nouveau/dispnv04/Kbuild
@@ -10,3 +10,5 @@ nouveau-y += dispnv04/overlay.o
 nouveau-y += dispnv04/tvmodesnv17.o
 nouveau-y += dispnv04/tvnv04.o
 nouveau-y += dispnv04/tvnv17.o
+
+include $(src)/dispnv04/i2c/Kbuild
diff --git a/drivers/gpu/drm/nouveau/dispnv04/dfp.c b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
index 504c421aa176ef3d944592a0109cb72e21fd47b7..25fa41edcb3c75a1f8d6ae42617c76640baa27b4 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/dfp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
@@ -35,7 +35,7 @@
 #include "hw.h"
 #include "nvreg.h"
 
-#include <drm/i2c/sil164.h>
+#include <dispnv04/i2c/sil164.h>
 
 #include <subdev/i2c.h>
 
diff --git a/drivers/gpu/drm/nouveau/dispnv04/i2c/Kbuild b/drivers/gpu/drm/nouveau/dispnv04/i2c/Kbuild
new file mode 100644
index 0000000000000000000000000000000000000000..3fddfc97bcb399ef3821c6065e5868363883ac74
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/dispnv04/i2c/Kbuild
@@ -0,0 +1,5 @@
+ch7006-y := dispnv04/i2c/ch7006_drv.o dispnv04/i2c/ch7006_mode.o
+obj-$(CONFIG_DRM_NOUVEAU_CH7006) += ch7006.o
+
+sil164-y := dispnv04/i2c/sil164_drv.o
+obj-$(CONFIG_DRM_NOUVEAU_SIL164) += sil164.o
diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c
similarity index 100%
rename from drivers/gpu/drm/i2c/ch7006_drv.c
rename to drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c
diff --git a/drivers/gpu/drm/i2c/ch7006_mode.c b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_mode.c
similarity index 100%
rename from drivers/gpu/drm/i2c/ch7006_mode.c
rename to drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_mode.c
diff --git a/drivers/gpu/drm/i2c/ch7006_priv.h b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_priv.h
similarity index 98%
rename from drivers/gpu/drm/i2c/ch7006_priv.h
rename to drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_priv.h
index 052bdc48a339df47073ab305f224f96c8630d66c..d7a91e17510f7ea6bd2f087078dee73f85de53ee 100644
--- a/drivers/gpu/drm/i2c/ch7006_priv.h
+++ b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_priv.h
@@ -24,12 +24,13 @@
  *
  */
 
-#ifndef __DRM_I2C_CH7006_PRIV_H__
-#define __DRM_I2C_CH7006_PRIV_H__
+#ifndef __NOUVEAU_I2C_CH7006_PRIV_H__
+#define __NOUVEAU_I2C_CH7006_PRIV_H__
 
 #include <drm/drm_encoder_slave.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/i2c/ch7006.h>
+
+#include <dispnv04/i2c/ch7006.h>
 
 typedef int64_t fixed;
 #define fixed1 (1LL << 32)
diff --git a/drivers/gpu/drm/i2c/sil164_drv.c b/drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c
similarity index 99%
rename from drivers/gpu/drm/i2c/sil164_drv.c
rename to drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c
index c17afa025d9d917892055f8e8765d5f9e6259003..ca488f52a84a02773dac4a270b63544901a0e232 100644
--- a/drivers/gpu/drm/i2c/sil164_drv.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c
@@ -30,7 +30,8 @@
 #include <drm/drm_encoder_slave.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/i2c/sil164.h>
+
+#include <dispnv04/i2c/sil164.h>
 
 struct sil164_priv {
 	struct sil164_encoder_params config;
diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
index d3014027a8122be499b85459b038fdcce5800720..4ffd8af6bf8bff6f688f87ffede7a815bfc0789c 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
@@ -32,7 +32,7 @@
 #include "hw.h"
 #include <drm/drm_modeset_helper_vtables.h>
 
-#include <drm/i2c/ch7006.h>
+#include <dispnv04/i2c/ch7006.h>
 
 static struct nvkm_i2c_bus_probe nv04_tv_encoder_info[] = {
 	{
diff --git a/include/drm/i2c/ch7006.h b/drivers/gpu/drm/nouveau/include/dispnv04/i2c/ch7006.h
similarity index 97%
rename from include/drm/i2c/ch7006.h
rename to drivers/gpu/drm/nouveau/include/dispnv04/i2c/ch7006.h
index 5305b9797f938626c8f6c464ddc9bf424a39b4a0..1a6fa405f85b2a0d0f9a4d1c786defc527fa1d3b 100644
--- a/include/drm/i2c/ch7006.h
+++ b/drivers/gpu/drm/nouveau/include/dispnv04/i2c/ch7006.h
@@ -24,8 +24,8 @@
  *
  */
 
-#ifndef __DRM_I2C_CH7006_H__
-#define __DRM_I2C_CH7006_H__
+#ifndef __NOUVEAU_I2C_CH7006_H__
+#define __NOUVEAU_I2C_CH7006_H__
 
 /**
  * struct ch7006_encoder_params
diff --git a/include/drm/i2c/sil164.h b/drivers/gpu/drm/nouveau/include/dispnv04/i2c/sil164.h
similarity index 96%
rename from include/drm/i2c/sil164.h
rename to drivers/gpu/drm/nouveau/include/dispnv04/i2c/sil164.h
index ddf248693c8be8809777723c272f82af8d334c99..b86750d7abe1c2e7142eac32898398475fd42531 100644
--- a/include/drm/i2c/sil164.h
+++ b/drivers/gpu/drm/nouveau/include/dispnv04/i2c/sil164.h
@@ -24,8 +24,8 @@
  *
  */
 
-#ifndef __DRM_I2C_SIL164_H__
-#define __DRM_I2C_SIL164_H__
+#ifndef __NOUVEAU_I2C_SIL164_H__
+#define __NOUVEAU_I2C_SIL164_H__
 
 /**
  * struct sil164_encoder_params

-- 
2.39.5


