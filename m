Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3298EC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 10:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QrMVZ4aXgdDOQEK1eAuHJO+N5MnoZXBYEmVjCNmWh4k=; b=BJBTeYl70pK/ODKbZnUa67ByNG
	6rCaDPnDRETlkPxpfSa6tHaVPj3rji5ul5uNWGND+mLdyK+Q5fDzbTMarRUrI9sxe6TVe7QQtHwMk
	ASxvtTeScJDohojnJaqU5WLjcmt/CWOIANXPlDS0q6Z0OMDdx8kSWJF/jrcWyJmNMjh37zsyuetbh
	oFc/NEyWid/daC7+kuzRqzdQmM3zYhd/QLozQvLMVxXz1NqKNovaRPiycfk++KMoQ44GGXDbWRSDZ
	/HwzA6h2Nahj50sN2r/pFBFG62QU7FbYvsZ6T/lmJZa6zywKfZTNGwv2y6zlSQEOWQ+/nPsJ3Gmlq
	IWChJbrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwfG-00000006YZU-0IFx;
	Tue, 10 Jun 2025 10:57:10 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvnl-00000006R2k-0QKy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 10:01:54 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso6457512a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 03:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749549711; x=1750154511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrMVZ4aXgdDOQEK1eAuHJO+N5MnoZXBYEmVjCNmWh4k=;
        b=MaoOZL1orlUk+Dr+Ym/C6u2LJF0aobSnDYNBNP0CQeXHRlW3z2jm2CW1ivIrwPF5O6
         6aSY5UXbqzSzxBxVKUnoS+27V3VOMsY1mXrPLLYZo+V0UPyGZW75hRrmbjeQTavs1src
         aDanwWPIoOsQ7mPiPdGA+1QDxNS2+cYETMfmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549711; x=1750154511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QrMVZ4aXgdDOQEK1eAuHJO+N5MnoZXBYEmVjCNmWh4k=;
        b=jJ7JynuovFD/qLFVz/pmIYx8xbijXol727YGJ9EwBy6SdF1hT30aDu2h45c3qOv4qg
         uyHBoo3xNj7dm5f5xy3cFX60oPtZ/iSh4r4PAMpxvxemrHtmcL3Y5ZrTkFqxc/wBkP6l
         cekOTszAgafitz7Hk07F/gMvGky86YYv5/M1W/gKVOTQeZek1iPq6TPuj2yw6jNqt5fL
         FbmXQU5F59RRDNKbetoltqdZ4xoWmhfCK5Ur+9X/ja/RE62YCVlC5aHB/DiePU84JOCA
         bKlSZMZrc+eyEyiPiI6wJQyJukikArDhfRayOy4cHcCluy9MjpjffprvHopmQap5CTiT
         guog==
X-Forwarded-Encrypted: i=1; AJvYcCXQrlyvnz40SFSYbmrSiF5MV2TX/WKyTa1m5FqYJmBZszLVemvGBj31z2M2z5UxKbIdXWlBORxMvA5ordBVnt00@lists.infradead.org
X-Gm-Message-State: AOJu0YzXOHEkTLMGH4/7r0OfeHEhWtxluZmXP4w75pkAdJYOJneQdu4T
	PifmoSXkWxJXVl/h4ryt8l0Un7EJWlDs36HXB2CyYjetn/2/CewkYncEFuWTfJnx8IA=
X-Gm-Gg: ASbGnct/AX10NMDjbFRLii4gZ3wxgXOo7MB0RKNOxfbLEfPtyBOPaWNGvlFEIm1+wxl
	rBkWWnX854NYRllfKjis4721eMgNApWXEF+KlZhwxEwC5T5uj3zmqDNY9nLmwAF1tPjqzDrm673
	Woshec6/Lcq8O7VQAkDgQZS4tnEzZ0f226PNdYjyChKFYg1IMJJ5+/+0pVew4NbAZA2H9DczMn0
	NKiZzQsUoug+OsZMILWkHip4yY+pxh8ibu3/c/58KNLFxLos9RRK2qs9HzxDfM/diGWmjAqPRyI
	OfnXq5HiPBIW9qS3SNpTHorir/fpPDvIAm7aP1hkht6JWBfIX4dP079ABCt9yHft+LihLIwYdEf
	u8VxHE7pKSReE1Ork56yuBKmJJMI=
X-Google-Smtp-Source: AGHT+IGyNfXDrAVHRg99NgKyrktXyFyokISHPSLZcyRnsN+JI48XmfGaoa0CtOMPPK9AO2NgFfb/OA==
X-Received: by 2002:a05:6402:50d2:b0:607:1c09:b0d6 with SMTP id 4fb4d7f45d1cf-607740c2a81mr14543357a12.8.1749549711188;
        Tue, 10 Jun 2025 03:01:51 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6077837ed0bsm5953438a12.36.2025.06.10.03.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:01:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 04/10] ARM: imx_v6_v7_defconfig: cleanup mxs_defconfig
Date: Tue, 10 Jun 2025 12:00:17 +0200
Message-ID: <20250610100139.2476555-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
References: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_030153_131170_30C7E729 
X-CRM114-Status: GOOD (  10.91  )
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

Generate imx_v6_v7_defconfig by doing:

make imx_v6_v7_defconfig
make savedefconfig
cp defconfig arch/arm/configs/imx_v6_v7_defconfig

No functional change. The goal here is to cleanup imx_v6_v7_defconfig
file to make easier and cleaner the addition of new entries.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/configs/imx_v6_v7_defconfig | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 062c1eb8dd60..d40ca9edd264 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -12,6 +12,7 @@ CONFIG_RELAY=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 CONFIG_PERF_EVENTS=y
+CONFIG_KEXEC=y
 CONFIG_ARCH_MULTI_V6=y
 CONFIG_ARCH_MXC=y
 CONFIG_SOC_IMX31=y
@@ -32,7 +33,6 @@ CONFIG_ARM_PSCI=y
 CONFIG_HIGHMEM=y
 CONFIG_ARCH_FORCE_MAX_ORDER=13
 CONFIG_CMDLINE="noinitrd console=ttymxc0,115200"
-CONFIG_KEXEC=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_STAT=y
 CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
@@ -129,7 +129,6 @@ CONFIG_CS89x0_PLATFORM=y
 CONFIG_QCA7000_SPI=m
 # CONFIG_NET_VENDOR_SEEQ is not set
 CONFIG_SMC91X=y
-CONFIG_SMC911X=y
 CONFIG_SMSC911X=y
 # CONFIG_NET_VENDOR_STMICRO is not set
 CONFIG_MICREL_PHY=y
@@ -153,9 +152,7 @@ CONFIG_MWIFIEX_PCIE=m
 CONFIG_WL12XX=m
 CONFIG_WL18XX=m
 CONFIG_WLCORE_SDIO=m
-# CONFIG_WILINK_PLATFORM_DATA is not set
 CONFIG_INPUT_EVDEV=y
-CONFIG_INPUT_EVBUG=m
 CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_SNVS_PWRKEY=y
 CONFIG_KEYBOARD_IMX=y
@@ -190,9 +187,7 @@ CONFIG_SERIAL_IMX_CONSOLE=y
 CONFIG_SERIAL_FSL_LPUART=y
 CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
 CONFIG_SERIAL_DEV_BUS=y
-# CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_MUX=y
 CONFIG_I2C_MUX_GPIO=y
 # CONFIG_I2C_HELPER_AUTO is not set
 CONFIG_I2C_ALGOPCF=m
@@ -204,14 +199,9 @@ CONFIG_SPI_FSL_QUADSPI=y
 CONFIG_SPI_GPIO=y
 CONFIG_SPI_IMX=y
 CONFIG_SPI_FSL_DSPI=y
-CONFIG_PINCTRL_IMX8MM=y
-CONFIG_PINCTRL_IMX8MN=y
-CONFIG_PINCTRL_IMX8MP=y
-CONFIG_PINCTRL_IMX8MQ=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_MXC=y
 CONFIG_GPIO_SIOX=m
-CONFIG_GPIO_VF610=y
 CONFIG_GPIO_MAX732X=y
 CONFIG_GPIO_PCA953X=y
 CONFIG_GPIO_PCA953X_IRQ=y
@@ -225,7 +215,6 @@ CONFIG_W1_SLAVE_THERM=m
 CONFIG_POWER_RESET=y
 CONFIG_POWER_RESET_SYSCON=y
 CONFIG_POWER_RESET_SYSCON_POWEROFF=y
-CONFIG_POWER_SUPPLY=y
 CONFIG_RN5T618_POWER=m
 CONFIG_SENSORS_MC13783_ADC=y
 CONFIG_SENSORS_GPIO_FAN=y
@@ -283,13 +272,13 @@ CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_ADV7180=m
 CONFIG_IMX_IPUV3_CORE=y
 CONFIG_DRM=y
-CONFIG_DRM_I2C_NXP_TDA998X=y
 CONFIG_DRM_MSM=y
 CONFIG_DRM_PANEL_LVDS=y
-CONFIG_DRM_PANEL_SIMPLE=y
-CONFIG_DRM_PANEL_EDP=y
 CONFIG_DRM_PANEL_SEIKO_43WVF1G=y
+CONFIG_DRM_PANEL_EDP=y
+CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_DISPLAY_CONNECTOR=y
+CONFIG_DRM_I2C_NXP_TDA998X=y
 CONFIG_DRM_LVDS_CODEC=m
 CONFIG_DRM_SII902X=y
 CONFIG_DRM_TI_TFP410=y
@@ -310,7 +299,6 @@ CONFIG_LCD_PLATFORM=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
 CONFIG_BACKLIGHT_GPIO=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
 CONFIG_SOUND=y
 CONFIG_SND=y
@@ -380,11 +368,8 @@ CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_SDHCI_ESDHC_IMX=y
-CONFIG_NEW_LEDS=y
-CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_PWM=y
-CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_TIMER=y
 CONFIG_LEDS_TRIGGER_ONESHOT=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
@@ -453,7 +438,6 @@ CONFIG_EXT3_FS_POSIX_ACL=y
 CONFIG_EXT3_FS_SECURITY=y
 CONFIG_QUOTA=y
 CONFIG_QUOTA_NETLINK_INTERFACE=y
-# CONFIG_PRINT_QUOTA_WARNING is not set
 CONFIG_AUTOFS_FS=y
 CONFIG_FUSE_FS=y
 CONFIG_ISO9660_FS=m
@@ -490,5 +474,4 @@ CONFIG_PRINTK_TIME=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
 # CONFIG_SLUB_DEBUG is not set
-# CONFIG_SCHED_DEBUG is not set
 # CONFIG_FTRACE is not set
-- 
2.43.0


