Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481FDE77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 16:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSJIaNwMpBSVKM3jz7waFi0qzaqRh8xMyWjRSkgvN1w=; b=gtDnGWHYDhatAbjxvQcLP5MhvF
	GIJn3c8RQLWDNeQGNijDDnB94/zGSM7A5SxC6iSW8tMb3UZjGd0RYcKOseo4NZcjg0n3aZFN3lSbl
	B0v8ypgaxREaZEFpak/GnP+e6oS8hOrk9xXwN6HZxoUbnLYVn1SXR596yj8eOSvuCDqjycvL0vRO5
	8WNnFQOME2GcZratBuhEQDbkbNeiob/+egOO4L9JZlz3qyQsR+YsLuBenBkSBp9gSQpxJfSWOznLs
	OaLphJm9g692JHaGvRZhnnQjsnAA+s/UxA5V0lefo4SPzCxVdXgtFJa4uj0V7koi1dwaA9kzhOPza
	ufkqgK1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIro4-0000000D5L1-3Zm0;
	Wed, 04 Dec 2024 16:00:52 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrlB-0000000D4QF-0S2J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:57:54 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-53dd57589c8so1155937e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 07:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733327871; x=1733932671; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GSJIaNwMpBSVKM3jz7waFi0qzaqRh8xMyWjRSkgvN1w=;
        b=X5rvOUbXyxm0ttoY+Y6JMdM77tZNXdh794ywxKWZy4R+MkPUli3CIknA76+dodvWe8
         wIPlUDuWVgc18ZAqKqHLJZaNb1PT0ix9kGR1Stt7ZwBNUTVWWmyVf5Y3+Qwxo6BAQmUb
         PH9tREw2PZ+AyA3Q7MzoABZc5zgTKNcZJVyVh0ELMs6ZtoGG8FJzlACdKG1O7LIfkcF6
         iHKYhsX92C8mPaRkpGqtgMAx1EIsGuuxPRSz4+kz9ixp8zHF9bQ2h8UqdOTizsgKjlUq
         bnjpGFw1+9AOqdh0iP7LAcys6Xw26TzMFe55tIKIVAQPnij/v7bWmMkymJMFUXKWRfU8
         /Drg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327871; x=1733932671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSJIaNwMpBSVKM3jz7waFi0qzaqRh8xMyWjRSkgvN1w=;
        b=t0KcwHQ9w5zldy+2G/j+mQs7aMuefskuQRY11Ufmae5OzI3cu4gxzvpxyTdHfQsC4x
         v4sIdg2HSNVQB4p/jipPG9e+5cl5zJw/yZvEBU5aIaI65hpsW6dj50iLhDViVR73vjs1
         /rdy1MZ2CY98n3LYSfpCEDkHIMr4y1KnZJD8lFcUbBMMdCPUN5p1mTEtcINEbYfABi+0
         pT4nzSCihGSmeMf0dfnFXs17zzDrTQ48m0VRGp+iMP3LjmAmTScKuAmNis2rvFRv56Js
         qLb1ltJ4taRoxVNzqIFV3RLGpstmwK3I8Hts73VCRR3L26xAwh9L7wF6NQbhKaNnLvZ9
         PECA==
X-Gm-Message-State: AOJu0YydiTnf1NZqzevi4aCnIbHew4f5YuGU3Xs8J57d3ZTqlJhXaWYs
	7Pieszu4rBhjmVnpxO8zODhOtdcmjHEdyzuxX5tvcj49rYeDicmy
X-Gm-Gg: ASbGncuwhuzKEOrMR38/83iyII68o3uDi8nCgdr6Qwd+rkq5/0t/OdhqxTSXh8B290Q
	pmt3OhuPrUH6uyDWHRIZM0gS54BfM/9Fcjpvwx2rrFJ3t96FsASVUkIg79mfepiARpBKwoywK/R
	nCij++QuU84ReiHezaijnJ1Q3eHLV4ekjJ9IJeqLSnRJKhIUYBJoanq/zujQM2Odi40FPTWnh4e
	16zlj0xdm2p8LY6XDGbz8P1Az69O+OSvycqUyJmmTpauyw3BmnidAZsB/IbHpl4Z8L1usfAzSS/
	VCfoEVKr00YZJVM=
X-Google-Smtp-Source: AGHT+IFK+sV7O4icijjKv457E5UuddczGGVpjLjFLjjS3CacPYgnaEiA3MVt7SsciegK+X62jTjZDA==
X-Received: by 2002:a05:6512:118a:b0:53e:1d35:802b with SMTP id 2adb3069b0e04-53e1d3580aemr870242e87.22.1733327871107;
        Wed, 04 Dec 2024 07:57:51 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1f5498easm168999e87.105.2024.12.04.07.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:57:49 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 04 Dec 2024 16:56:44 +0100
Subject: [PATCH 2/9] ARM: davinci_all_defconfig: rebuild default
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-defconfigs-v1-2-86587652d37a@gmail.com>
References: <20241204-defconfigs-v1-0-86587652d37a@gmail.com>
In-Reply-To: <20241204-defconfigs-v1-0-86587652d37a@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3651;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=zjQeF+lHLGXt0nBZef6OKhZZCWLAYAtCLWguUvf+RB8=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnUHvO2C97zXXxQW6czHz2jFaB/m+N9evB/PHNu
 48CzcfkS8GJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1B7zgAKCRCIgE5vWV1S
 Mkd9EACa7dWnhdxZ/VRwCKnmJRA7zIPAmC7tIzR+zRXuXs+a95upoo/ZyESKuqLwNTsfZ1kCK01
 rNz9PIIJIGTjWWZpiZQ+teoVg4Mi15eNNCqGTwjVpaLDS9EAwZ3S8FJhSleO5LihSDE45XAEDhJ
 UIFRg89f3IvmQTLMmpKDeLTukzruYLiPEvD2bXJw9REYeKz7O7XWa9Jfn+ePN9whWU6zoe6Xhqw
 CL+x6oK8/NC0rTcueevwDvEnsM5bD8iInLmTd6bHT9J1XJTt9ek+5qHe4h2+6L94FwnFZqior7/
 WgM8wJX/mAX62sP0xcP4GlnNMnpyARZfnGFOy6gy4P/MwPx6byCnQ11tI5E3ASVO8B52rBsqWoA
 UHO4ulHPZoVApKf2/TN0H2J5bduRAxn0rBCw0NEvyksi0qNj7HM5gVIBq0IU1Ydf51zgoJToKyB
 fw54yqJLZ82kcwuw3wb9tztcrm8tnMuVry32orTB2JhtDt+RxKKqA266UCGaIpn049fYsyYe/rQ
 F6XQXxiAjuVuweKehGCZagm6lxG9BNcDtU/wXv7Vpz3YKGaM77mFRX2Gk23nA/Ojf91yqXv7TzD
 hyE4DqyOdYzkqAMBu22/KOQT8BoXp0WgOCpNGRoS6cVbL10ADb+KTqqbQU+V96K+Hb8K/Q4zXQp
 gLGrJSIi6PlnmkQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_075753_149247_2368ED46 
X-CRM114-Status: UNSURE (   9.86  )
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

This configuration contains obsolete configuration options e.g.
CONFIG_MTD_M25P80 which is integrated into MTD_SPI_NOR.

Rebuild this configuration by run:
make ARCH=arm davinci_all_defconfig
make ARCH=arm savedefconfig

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 arch/arm/configs/davinci_all_defconfig | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/arch/arm/configs/davinci_all_defconfig b/arch/arm/configs/davinci_all_defconfig
index 3474e475373ae89a90bb5af8f11fca2aa9c289dc..6465a56cb51f5cf89b6bb1b00e1ff82707758e6a 100644
--- a/arch/arm/configs/davinci_all_defconfig
+++ b/arch/arm/configs/davinci_all_defconfig
@@ -10,8 +10,6 @@ CONFIG_CGROUPS=y
 CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
-CONFIG_ARCH_MULTIPLATFORM=y
-CONFIG_ARCH_MULTI_V5=y
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_DAVINCI=y
 CONFIG_ARCH_DAVINCI_DA830=y
@@ -19,10 +17,8 @@ CONFIG_ARCH_DAVINCI_DA850=y
 CONFIG_DAVINCI_MUX_DEBUG=y
 CONFIG_DAVINCI_MUX_WARNINGS=y
 CONFIG_AEABI=y
-CONFIG_SECCOMP=y
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
-CONFIG_AUTO_ZRELADDR=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
 CONFIG_CPU_FREQ_GOV_PERFORMANCE=m
@@ -53,7 +49,6 @@ CONFIG_BT_HCIUART=m
 CONFIG_BT_HCIUART_LL=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_FW_LOADER=m
 CONFIG_DA8XX_MSTPRI=y
 CONFIG_MTD=m
 CONFIG_MTD_TESTS=m
@@ -63,7 +58,6 @@ CONFIG_MTD_CFI=m
 CONFIG_MTD_CFI_INTELEXT=m
 CONFIG_MTD_CFI_AMDSTD=m
 CONFIG_MTD_PHYSMAP=m
-CONFIG_MTD_M25P80=m
 CONFIG_MTD_RAW_NAND=m
 CONFIG_MTD_NAND_DAVINCI=m
 CONFIG_MTD_SPI_NOR=m
@@ -77,7 +71,6 @@ CONFIG_EEPROM_AT24=y
 CONFIG_BLK_DEV_SD=m
 CONFIG_ATA=m
 CONFIG_AHCI_DA850=m
-CONFIG_PATA_BK3710=m
 CONFIG_NETDEVICES=y
 CONFIG_NETCONSOLE=y
 CONFIG_TUN=m
@@ -116,12 +109,10 @@ CONFIG_I2C_DAVINCI=y
 CONFIG_SPI=y
 CONFIG_SPI_DAVINCI=m
 CONFIG_PINCTRL_DA850_PUPD=m
-CONFIG_PINCTRL_SINGLE=y
 CONFIG_GPIOLIB=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_PCA953X=y
 CONFIG_GPIO_PCA953X_IRQ=y
-CONFIG_RESET_CONTROLLER=y
 CONFIG_POWER_RESET=y
 CONFIG_POWER_RESET_GPIO=y
 CONFIG_SYSCON_REBOOT_MODE=m
@@ -133,32 +124,26 @@ CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_TPS6507X=y
 CONFIG_MEDIA_SUPPORT=m
-CONFIG_MEDIA_CAMERA_SUPPORT=y
 CONFIG_MEDIA_USB_SUPPORT=y
 CONFIG_USB_VIDEO_CLASS=m
 CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_VIDEO_DAVINCI_VPIF_DISPLAY=m
 CONFIG_VIDEO_DAVINCI_VPIF_CAPTURE=m
-# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
 CONFIG_VIDEO_TVP514X=m
 CONFIG_VIDEO_ADV7343=m
 CONFIG_DRM=m
 CONFIG_DRM_TILCDC=m
 CONFIG_DRM_SIMPLE_BRIDGE=m
-CONFIG_DRM_TINYDRM=m
 CONFIG_TINYDRM_ST7586=m
 CONFIG_FB=y
-CONFIG_FB_DA8XX=y
 CONFIG_FIRMWARE_EDID=y
 CONFIG_BACKLIGHT_PWM=m
 CONFIG_BACKLIGHT_GPIO=m
-CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
 CONFIG_SOUND=m
 CONFIG_SND=m
 CONFIG_SND_USB_AUDIO=m
 CONFIG_SND_SOC=m
-CONFIG_SND_SOC_TLV320AIC3X=m
 CONFIG_SND_SOC_DAVINCI_MCASP=m
 CONFIG_SND_SOC_DAVINCI_EVM=m
 CONFIG_SND_SIMPLE_CARD=m
@@ -204,14 +189,12 @@ CONFIG_MMC_DAVINCI=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=m
 CONFIG_LEDS_GPIO=m
-CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_TIMER=m
 CONFIG_LEDS_TRIGGER_HEARTBEAT=m
 CONFIG_LEDS_TRIGGER_DEFAULT_ON=m
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_OMAP=m
 CONFIG_DMADEVICES=y
-CONFIG_TI_EDMA=y
 CONFIG_COMMON_CLK_PWM=m
 CONFIG_REMOTEPROC=y
 CONFIG_DA8XX_REMOTEPROC=m
@@ -254,5 +237,4 @@ CONFIG_DMA_CMA=y
 CONFIG_DEBUG_FS=y
 CONFIG_DEBUG_RT_MUTEXES=y
 CONFIG_DEBUG_MUTEXES=y
-# CONFIG_ARM_UNWIND is not set
 CONFIG_DEBUG_USER=y

-- 
2.47.0


