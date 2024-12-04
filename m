Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B43E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 16:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zuIWhcGBAplScg2os6iAfDWUQ3FLEQtTlLEfQLopLE=; b=u5fLmEMdpE5bWtIqxgZpSxkcyA
	ce1Mux43z0FRZRj/p9A236dDc3ufu0d0lalwMtKUT+p/dZykq/kcErK06xF42HOyjZ90g1d0f4yIR
	9mHlqqQbRxZ7hXOTOQD4VvzanfnpB93ae5BrdbvwocLxA3lUW3ctn9rdcCEBTOrWNnRg9BjYl+dI3
	Yt7dGpVFjvRjdwYfe8HoTWcIhzqLnp/l1hf46JP8/ZMFSCvUYJwHxUsGhvXZodW3gqBQKsPa6U1IK
	zW5gzXfRjVeO/VAMzypYe+IhvwQw/GNQE+RQNUiqJMiYb5Mu16d5C+S8UBbAFXcmFnVr+qxJKlRVv
	RiW2Yr4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrt0-0000000D6f8-1Ope;
	Wed, 04 Dec 2024 16:05:58 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrlP-0000000D4Ug-2S88
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:58:08 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2ffa8df8850so79964051fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 07:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733327885; x=1733932685; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7zuIWhcGBAplScg2os6iAfDWUQ3FLEQtTlLEfQLopLE=;
        b=J09N1dZkg5M5GMUCrfGaDvVIlVy6bO0wwttG6BzpCwmGbMKC35LzWU5IY+9oZ198T1
         3yfeSicuIS9KPvv5g3q81jWkZU0wW/YX773+V+tq5Ue4SovJHok4RWdhCLHyGKQirNSp
         I00Lrx68RxgLuz+IhpHKfgstpTQF54PhY+2k8FdXs/Oql2isfje+Ugo+8ZW+zAHBsa2m
         BA3UvZdBFmCNoxBKBMDZmapLkE20xWSHIzW7NujWlnytMs0Rmr88RDxmzsEbJswIFr2B
         8GQWVJ/S1rU3HHT/xwhe00FcLyB/s9ZQcQ3wHGD5E5Kba8/UqsCsJz0HzAVjGvNJHox/
         t95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327885; x=1733932685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zuIWhcGBAplScg2os6iAfDWUQ3FLEQtTlLEfQLopLE=;
        b=orvRh4vgvpHFckhvCKeEjfJy4KSTCVYH9pgHjAiwFvJ2VwpQyEJ0xKp4mcmDJJa0vE
         fI8By+CjTmMF8QOqowaykzNoXxoXBXmPAzFdRa92jz4DI6s+VuDj+ei7TZ4NFggLmWAV
         4+v4hUDZ7VYHldezlFkU9ljD2ePxIClnNGHC7I9IYt4QBB2H+tZ1eKfaPJthcczraMJY
         jU45d+pxG2z2sFzvcnLMwiF+4/hAi/0VlM+0Tvc+R7z9GYYxDI1a1lEHyvl13Ks7PTo4
         SY0uynosMoK7JwzFjw1z+9SEEL+ENGtbcu5oAU32zYJTy2+RJLLLOt+oAPoHuqSQ9jbe
         1RDA==
X-Gm-Message-State: AOJu0YyLipjhgDWozRxszrECye5uVpc6BI9iMDeDpxGtJ/VPLK1xNM/G
	kW8sKisw0pnwMLaJ8DbG0u8fOqdr/ZPb3lweJs4Xkxel8FbPkP7N
X-Gm-Gg: ASbGncsh3pN4cVb4AGV7UjIvq+xGmhT9EhJtR1q7AO9lYWkaqLRn5901czqZ/ksYC8j
	mTsh4thtYeTdi9KFk8omnX5vCAv3ZR79JaUug3uTbcx8BTXLI9FDBbV9o2CHK2lYYmBgqsfKvCD
	Z0jrpSfyvc/oq6NFjVp7Uo6nMlFkUvJmOn4RRK8Bw15Vea6wNz204YUAspMcCJ8+blApMJP6NX4
	TI1QALMz8+2MyVn2F3WtO0rPb4rHcILQq0RRALSS/lvUUpE3YkKAedpXIxkX2jaDfsAMKrilMW6
	fd/pVAUHQT7fJtI=
X-Google-Smtp-Source: AGHT+IGo8Nnu76WBeaIaLkheqWGYkapEm1beHtYyp08WviimH1Zbb3Iz0562zLKS+bMMzZamW+A87Q==
X-Received: by 2002:a05:6512:3b20:b0:539:f9b9:e6d2 with SMTP id 2adb3069b0e04-53e12a216a8mr4889690e87.35.1733327885166;
        Wed, 04 Dec 2024 07:58:05 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1f5498easm168999e87.105.2024.12.04.07.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:58:03 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 04 Dec 2024 16:56:49 +0100
Subject: [PATCH 7/9] ARM: pxa_defconfig: rebuild default configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-defconfigs-v1-7-86587652d37a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8964;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=sP2kruZeY8VqPnZT+Tk6nsXT2ukb3lZN9LQ84YRu29c=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnUHvmJYmUH2Th+Ac6bUqgT6YbZ4b4CtJsDK6cD
 CtUaOUqA5yJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1B75gAKCRCIgE5vWV1S
 MpzkEADXKBk/cSIGtWkRwYb5HOBJbpUacGPmQy6lWIxxeqDjinZQoI2xM71o4CW7E7iRARohwYx
 DTT+zoiX3XL83ziOVj3fxMcVrhcUPQGAO7QwJGq11BWqJuF+Yemcy3Nkuql3mgrnBbk9/d0PEYd
 hbNRbNqJJY4ICJAr8YdO1W3nrO4P0rysEtei2JIb3LDJmXyVWviR5UZvjfbPPn6upxKUgaXoPaW
 ilaepmN6RXjXBe2II1u7whIV5rLTx/GmHSLHSXTeMVz5twdEBLUIM4+FoE7e5YCA2IcOSsV1loV
 hL+eRSpHlBjnU1ANWG318OyW2AUGrTXJk4sjn/Heu1gX/4LmGAz1EUm+jFImdeb19xgx2WD22DF
 7ALgwg0btobwGtkfmWuVSydv+9ZTKSoN6YbXZ18b+Xsfq/Noig0/I//Fp8h26XP5N1ERkgrSDDf
 S2J/EznAkO7KBIf7Y3uQS2mLFWPOyrDFu9ex7cQzgrkdSehYZpD7mph6ok4IObQOQoVJzWhcT6N
 T8/2x5QE5edeC+ybxTGMXgceDD3w5Xz6kzQEgcq2DMExH4ZFkONJd+Dug2wJGZPP3z/ZuOlui4f
 mdObn/dimOb7BX1QkCc5/tKgRmpnnr+O0VWOd2IllvOSRgWOJPIfTrZE1ZpqN1WEsaV4nxtjQHS
 w7Zt5O/OODEEBCw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_075807_669927_C52581BF 
X-CRM114-Status: GOOD (  10.22  )
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
make ARCH=arm pxa_defconfig
make ARCH=arm savedefconfig

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 arch/arm/configs/pxa_defconfig | 69 ++----------------------------------------
 1 file changed, 2 insertions(+), 67 deletions(-)

diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index 38916ac4bce481a17ced58faad73ceeef31fae0f..dbac3b6dbb99b13b21c8f6461b4063346363acab 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -1,6 +1,5 @@
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
-CONFIG_FHANDLE=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
@@ -80,7 +79,6 @@ CONFIG_BT_HCIBFUSB=m
 CONFIG_BT_HCIDTL1=m
 CONFIG_BT_HCIBT3C=m
 CONFIG_BT_HCIBLUECARD=m
-CONFIG_BT_HCIBTUART=m
 CONFIG_BT_HCIVHCI=m
 CONFIG_BT_MRVL=m
 CONFIG_BT_MRVL_SDIO=m
@@ -123,7 +121,6 @@ CONFIG_MTD_ROM=m
 CONFIG_MTD_COMPLEX_MAPPINGS=y
 CONFIG_MTD_PHYSMAP=y
 CONFIG_MTD_PXA2XX=m
-CONFIG_MTD_M25P80=m
 CONFIG_MTD_BLOCK2MTD=y
 CONFIG_MTD_DOCG3=m
 CONFIG_MTD_ONENAND=m
@@ -131,7 +128,6 @@ CONFIG_MTD_ONENAND_VERIFY_WRITE=y
 CONFIG_MTD_ONENAND_GENERIC=m
 CONFIG_MTD_RAW_NAND=m
 CONFIG_MTD_NAND_SHARPSL=m
-CONFIG_MTD_NAND_TMIO=m
 CONFIG_MTD_NAND_BRCMNAND=m
 CONFIG_MTD_NAND_GPIO=m
 CONFIG_MTD_NAND_PLATFORM=m
@@ -140,13 +136,11 @@ CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED=y
 CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0x4000000
 CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH=y
 CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=y
-CONFIG_MTD_NAND_CM_X270=m
 CONFIG_MTD_NAND_ECC_SW_BCH=y
 CONFIG_MTD_SPI_NOR=m
 CONFIG_MTD_UBI=m
 CONFIG_MTD_UBI_BLOCK=y
 CONFIG_BLK_DEV_LOOP=m
-CONFIG_BLK_DEV_CRYPTOLOOP=m
 CONFIG_BLK_DEV_NBD=m
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_COUNT=8
@@ -160,7 +154,6 @@ CONFIG_SENSORS_LIS3_SPI=m
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=m
 CONFIG_CHR_DEV_ST=m
-CONFIG_CHR_DEV_OSST=m
 CONFIG_BLK_DEV_SR=m
 CONFIG_CHR_DEV_SG=y
 CONFIG_ATA=m
@@ -169,7 +162,6 @@ CONFIG_SATA_AHCI_PLATFORM=m
 CONFIG_SATA_MV=m
 CONFIG_PATA_PXA=m
 CONFIG_PATA_PCMCIA=m
-CONFIG_PATA_PLATFORM=m
 CONFIG_NETDEVICES=y
 CONFIG_DUMMY=m
 CONFIG_MACB=m
@@ -184,12 +176,8 @@ CONFIG_R8169=m
 CONFIG_SMC91X=m
 CONFIG_SMSC911X=m
 CONFIG_STMMAC_ETH=m
-CONFIG_PHYLIB=y
-CONFIG_SMSC_PHY=m
 CONFIG_BROADCOM_PHY=y
 CONFIG_ICPLUS_PHY=m
-CONFIG_MICREL_PHY=m
-CONFIG_FIXED_PHY=m
 CONFIG_MARVELL_PHY=m
 CONFIG_AT803X_PHY=m
 CONFIG_MDIO_BITBANG=y
@@ -211,13 +199,6 @@ CONFIG_USB_NET_SMSC75XX=m
 CONFIG_USB_NET_SMSC95XX=m
 CONFIG_USB_NET_MCS7830=m
 CONFIG_BRCMFMAC=m
-CONFIG_HOSTAP=m
-CONFIG_HOSTAP_FIRMWARE=y
-CONFIG_HOSTAP_FIRMWARE_NVRAM=y
-CONFIG_HOSTAP_CS=m
-CONFIG_HERMES=m
-CONFIG_PCMCIA_HERMES=m
-CONFIG_PCMCIA_SPECTRUM=m
 CONFIG_LIBERTAS=m
 CONFIG_LIBERTAS_SDIO=m
 CONFIG_MWIFIEX=m
@@ -225,7 +206,6 @@ CONFIG_MWIFIEX_SDIO=m
 CONFIG_RT2X00=m
 CONFIG_RT73USB=m
 CONFIG_RT2800USB=m
-CONFIG_INPUT_FF_MEMLESS=m
 CONFIG_INPUT_MATRIXKMAP=y
 CONFIG_INPUT_MOUSEDEV=m
 CONFIG_INPUT_MOUSEDEV_SCREEN_X=640
@@ -243,7 +223,6 @@ CONFIG_MOUSE_PS2_ELANTECH=y
 CONFIG_MOUSE_SERIAL=m
 CONFIG_MOUSE_CYAPA=m
 CONFIG_MOUSE_ELAN_I2C=m
-CONFIG_MOUSE_NAVPOINT_PXA27x=m
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ADS7846=m
 CONFIG_TOUCHSCREEN_ATMEL_MXT=m
@@ -260,7 +239,6 @@ CONFIG_TOUCHSCREEN_TOUCHIT213=m
 CONFIG_TOUCHSCREEN_PCAP=m
 CONFIG_TOUCHSCREEN_ST1232=m
 CONFIG_INPUT_MISC=y
-CONFIG_INPUT_AXP20X_PEK=m
 CONFIG_INPUT_UINPUT=m
 CONFIG_INPUT_GPIO_ROTARY_ENCODER=m
 CONFIG_INPUT_PCAP=m
@@ -275,10 +253,7 @@ CONFIG_SERIAL_PXA=y
 CONFIG_SERIAL_PXA_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_I2C_CHARDEV=m
-CONFIG_I2C_MUX_PCA954x=m
-CONFIG_I2C_MUX_PINCTRL=m
 CONFIG_I2C_DESIGNWARE_CORE=m
-CONFIG_I2C_DESIGNWARE_PLATFORM=m
 CONFIG_I2C_GPIO=y
 CONFIG_I2C_PXA_SLAVE=y
 CONFIG_I2C_XILINX=m
@@ -288,10 +263,8 @@ CONFIG_SPI_BITBANG=y
 CONFIG_SPI_CADENCE=m
 CONFIG_SPI_GPIO=m
 CONFIG_SPI_PXA2XX=m
-CONFIG_SPI_ROCKCHIP=m
 CONFIG_SPI_XILINX=m
 CONFIG_SPI_SPIDEV=m
-CONFIG_PPS=y
 CONFIG_DEBUG_GPIO=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_DWAPB=m
@@ -305,7 +278,6 @@ CONFIG_GPIO_TPS6586X=y
 CONFIG_GPIO_TPS65910=y
 CONFIG_GPIO_MAX7301=m
 CONFIG_POWER_SUPPLY_DEBUG=y
-CONFIG_PDA_POWER=m
 CONFIG_BATTERY_SBS=m
 CONFIG_BATTERY_DA9030=m
 CONFIG_BATTERY_MAX17040=m
@@ -313,7 +285,6 @@ CONFIG_BATTERY_MAX17042=m
 CONFIG_CHARGER_MAX14577=m
 CONFIG_CHARGER_MAX77693=m
 CONFIG_CHARGER_TPS65090=m
-CONFIG_SENSORS_ADM1021=m
 CONFIG_SENSORS_MAX6650=m
 CONFIG_SENSORS_LM75=m
 CONFIG_SENSORS_LM90=m
@@ -325,30 +296,21 @@ CONFIG_XILINX_WATCHDOG=m
 CONFIG_SA1100_WATCHDOG=m
 CONFIG_MFD_AS3711=y
 CONFIG_MFD_BCM590XX=m
-CONFIG_MFD_AXP20X=y
-CONFIG_MFD_CROS_EC_DEV=m
-CONFIG_MFD_ASIC3=y
 CONFIG_PMIC_DA903X=y
-CONFIG_HTC_PASIC3=m
 CONFIG_MFD_MAX14577=y
 CONFIG_MFD_MAX77693=y
 CONFIG_MFD_MAX8907=m
 CONFIG_EZX_PCAP=y
-CONFIG_UCB1400_CORE=m
 CONFIG_MFD_SEC_CORE=y
 CONFIG_MFD_PALMAS=y
 CONFIG_MFD_TPS65090=y
 CONFIG_MFD_TPS6586X=y
 CONFIG_MFD_TPS65910=y
-CONFIG_MFD_T7L66XB=y
-CONFIG_MFD_TC6387XB=y
-CONFIG_MFD_TC6393XB=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_DEBUG=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=m
 CONFIG_REGULATOR_ACT8865=m
 CONFIG_REGULATOR_AS3711=m
-CONFIG_REGULATOR_AXP20X=m
 CONFIG_REGULATOR_BCM590XX=m
 CONFIG_REGULATOR_DA903X=m
 CONFIG_REGULATOR_DA9210=m
@@ -370,9 +332,6 @@ CONFIG_REGULATOR_TPS65090=m
 CONFIG_REGULATOR_TPS6586X=m
 CONFIG_REGULATOR_TPS65910=m
 CONFIG_MEDIA_SUPPORT=m
-CONFIG_MEDIA_CAMERA_SUPPORT=y
-CONFIG_MEDIA_CONTROLLER=y
-CONFIG_VIDEO_V4L2_SUBDEV_API=y
 CONFIG_MEDIA_USB_SUPPORT=y
 CONFIG_USB_VIDEO_CLASS=m
 CONFIG_V4L_PLATFORM_DRIVERS=y
@@ -384,23 +343,16 @@ CONFIG_FB_PXA=y
 CONFIG_FB_PXA_OVERLAY=y
 CONFIG_FB_PXA_PARAMETERS=y
 CONFIG_PXA3XX_GCU=m
-CONFIG_FB_MBX=m
 CONFIG_FB_VIRTUAL=m
 CONFIG_FB_SIMPLE=y
-CONFIG_LCD_CORGI=m
-CONFIG_LCD_PLATFORM=m
-CONFIG_BACKLIGHT_PWM=m
-CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_TILEBLITTING=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
 CONFIG_LOGO=y
 CONFIG_SOUND=m
 CONFIG_SND=m
-CONFIG_SND_MIXER_OSS=m
-CONFIG_SND_PCM_OSS=m
 CONFIG_SND_DYNAMIC_MINORS=y
-CONFIG_SND_VERBOSE_PRINTK=y
 CONFIG_SND_DEBUG=y
 CONFIG_SND_SEQUENCER=m
 CONFIG_SND_USB_AUDIO=m
@@ -413,7 +365,6 @@ CONFIG_SND_SOC_AK4642=m
 CONFIG_SND_SOC_WM8731_I2C=m
 CONFIG_SND_SOC_WM8978=m
 CONFIG_SND_SIMPLE_CARD=m
-CONFIG_SOUND_PRIME=m
 CONFIG_HID=m
 CONFIG_HID_A4TECH=m
 CONFIG_HID_APPLE=m
@@ -498,7 +449,6 @@ CONFIG_USB_LEGOTOWER=m
 CONFIG_USB_LCD=m
 CONFIG_USB_CYTHERM=m
 CONFIG_USB_IDMOUSE=m
-CONFIG_USB_GPIO_VBUS=y
 CONFIG_USB_GPIO_VBUS=m
 CONFIG_USB_ISP1301=m
 CONFIG_USB_GADGET=m
@@ -519,7 +469,6 @@ CONFIG_SDIO_UART=m
 CONFIG_MMC_PXA=m
 CONFIG_MMC_SDHCI=m
 CONFIG_MMC_SDHCI_PLTFM=m
-CONFIG_MMC_TMIO=m
 CONFIG_MMC_DW=m
 CONFIG_MMC_DW_EXYNOS=m
 CONFIG_NEW_LEDS=y
@@ -539,7 +488,6 @@ CONFIG_LEDS_TRIGGER_GPIO=m
 CONFIG_LEDS_TRIGGER_DEFAULT_ON=m
 CONFIG_LEDS_TRIGGER_TRANSIENT=m
 CONFIG_LEDS_TRIGGER_CAMERA=m
-CONFIG_EDAC=m
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DEBUG=y
 CONFIG_RTC_DRV_DS1307=m
@@ -555,21 +503,18 @@ CONFIG_RTC_DRV_S35390A=m
 CONFIG_RTC_DRV_RX8581=m
 CONFIG_RTC_DRV_EM3027=m
 CONFIG_RTC_DRV_S5M=m
-CONFIG_RTC_DRV_V3020=m
 CONFIG_RTC_DRV_PXA=m
 CONFIG_RTC_DRV_PCAP=m
 CONFIG_DMADEVICES=y
 CONFIG_PXA_DMA=y
 CONFIG_DW_DMAC=m
 CONFIG_UIO=y
-CONFIG_CROS_EC_CHARDEV=m
 CONFIG_CHROME_PLATFORMS=y
 CONFIG_CROS_EC=m
 CONFIG_CROS_EC_I2C=m
 CONFIG_CROS_EC_SPI=m
 CONFIG_COMMON_CLK_S2MPS11=m
 CONFIG_PM_DEVFREQ=y
-CONFIG_EXTCON=y
 CONFIG_MEMORY=y
 CONFIG_IIO=m
 CONFIG_AD5446=m
@@ -587,9 +532,8 @@ CONFIG_XFS_FS=m
 CONFIG_AUTOFS_FS=m
 CONFIG_FUSE_FS=m
 CONFIG_CUSE=m
-CONFIG_FSCACHE=y
 CONFIG_FSCACHE_STATS=y
-CONFIG_CACHEFILES=y
+CONFIG_CACHEFILES=m
 CONFIG_ISO9660_FS=m
 CONFIG_JOLIET=y
 CONFIG_ZISOFS=y
@@ -623,7 +567,6 @@ CONFIG_NFSD=m
 CONFIG_NFSD_V3_ACL=y
 CONFIG_NFSD_V4=y
 CONFIG_CIFS=m
-CONFIG_CIFS_STATS=y
 CONFIG_CIFS_XATTR=y
 CONFIG_CIFS_POSIX=y
 CONFIG_NLS_DEFAULT="utf8"
@@ -634,9 +577,7 @@ CONFIG_NLS_ASCII=m
 CONFIG_NLS_ISO8859_1=m
 CONFIG_NLS_ISO8859_15=m
 CONFIG_NLS_UTF8=m
-CONFIG_TIMER_STATS=y
 CONFIG_SECURITY=y
-CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_CRYPTD=m
 CONFIG_CRYPTO_AUTHENC=m
 CONFIG_CRYPTO_TEST=m
@@ -644,19 +585,13 @@ CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
 CONFIG_CRYPTO_FCRYPT=m
-CONFIG_CRYPTO_KHAZAD=m
-CONFIG_CRYPTO_SEED=m
 CONFIG_CRYPTO_SERPENT=m
-CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_LRW=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_VMAC=m
-CONFIG_CRYPTO_SHA512=m
-CONFIG_CRYPTO_TGR192=m
 CONFIG_CRYPTO_WP512=m
-CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_DEFLATE=y
 CONFIG_CRYPTO_LZO=y

-- 
2.47.0


