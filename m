Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86950C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 09:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O28qAmYDQtgK9Y67h6VNYLousdi9GmznEuxxlZe6y6g=; b=t5Y9EzQNXMiGSc3jBwrPgZzwkP
	apkjSrKdT2Wn2MLTUcJqlSS7EvZ1si7l0ZjHHOBjE4AcAJv79yl3AM6PKb8pJ/YnkNSu2A0d57FyA
	cq4ZxF2zvoCmFXWi3GrchzgConpDXxCQ+GzVxDtnZfuaf9UyjPbR1zdrS6Sed5TtfwZraER89BunU
	Pe/yJUasuxuh+llX5Wx5GO+nnje0soC3qa3bWV2Zp3vBzo+ky/Cmt30b4eJn3iuYHBESgWU43W3W0
	3J4s0qF+CN6Uc4GJ50ugZtGiziWD9LjX80MsSPuN0088DrJtqhJTtJh2dE/gDYHbKtMnVLJlP1fa6
	hfXFJU6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSXdl-0000000F8z0-3XS5;
	Fri, 20 Jun 2025 09:02:29 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSX6D-0000000F3QD-05v2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 08:27:50 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-441ab63a415so17173245e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 01:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750408068; x=1751012868; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O28qAmYDQtgK9Y67h6VNYLousdi9GmznEuxxlZe6y6g=;
        b=A2jRLkqMmiak3FDtob7CHgLadALHMR2XNmJta/FL8qAObMWy5790lPMkv4r8qpK9g7
         6Wk4HZACuP+YagO1bg1sxDGqVwSfU9Jd+s69hojDLFlaF50JWr1xOXOxifC/26cFLD++
         e6NqJViFf6o9n4cljkJ6/Gdobcd6wEgxtVYZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750408068; x=1751012868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O28qAmYDQtgK9Y67h6VNYLousdi9GmznEuxxlZe6y6g=;
        b=p9H6CU5S9OZiWfsFtUb/7Uzt2x4EdDzBsKA0adYahmpW6StVTIaElOuP6J0xP4Lx3C
         0xUAbZHxNvA0zi3lhsSOcU1ATj01KMhG0Hm7Eg2sYTmV71YN6t1Myk+aGPKwGyFcXrxH
         zjmcv05YncVfCm6m48YUcwBfjjWv5srr98MeCOv4+fUmTajZzGyHuRlpeUKKkGfIKH9T
         CJm9RWpIVj+/ZrQE/4B36teQ5XN5+HuP1kj8ep7jkS9ybWnijEpX4R/fQHZEKSoyL1Hw
         klrMEYN7bDkg4FY8uNdwjl21sucJNiRmViAYtQRXaG3Ym6UVv3Er6GlZGH9y9Le1lOTm
         0zMQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4/kGDbXaOVQVnAhrVLZ5fAlI3hO9/Wl76kKlTog+1hlMTy3wH3SSuWFTTr42JOJibORFCQQDcM4gLbyM6sv4n@lists.infradead.org
X-Gm-Message-State: AOJu0YxaHNWMAwl4HMm7xhXVpBx3oJYv1AgpcitDjFEpfbDQ0uSXfSd9
	CqzTpjF+aBIyDUqXLQ8DAkYeys+5PKdgRjSnYwCVC/tFgsxREyFHGcV21jW9bGQGooU=
X-Gm-Gg: ASbGnctb9s8+6lR2nquWDdwMNVwjpwfMO4yYKR3kgs+TzYfdZRiDTulLlg6UG42X/D4
	EOu+QWxQXJn4Nr6aRLGtAW+VcKdwf7w7qQYF1IzYnvwsOOYwD/g8K/vFxeQvi87zX7/UoIWBs0V
	sSSB8izl9Xz0A9BvkKYYPmRXXWyewlU893iNLl1joO9D8mnDaGsKJfYg1o6jX8SahQkG8E3Q934
	4IN8+7m78usehtJFcn2sG6159VmCW2arnlU5BN5GhyRJJxXtkfryC3DWq6N+i8fa+JuuEcJLBgh
	VQncudTs0QReuW2sypPAxtFcwaoEETc98u3BH+rcntSFrAcLW7yeh/D+XfrMEYJvwxiAM9eg6pL
	3nN4wbBL0MLJ1VoA87ZDBmhxtiBrKrXR/WtVqCY2xpKSQgZnAGvjO1uZAXaypL4I=
X-Google-Smtp-Source: AGHT+IE6799z70WQfBU1IcgH3oBxGNspG8cVG3rmAiTDaD82iSiOfSFLbYc4fh6FZFb4zd+WUFFT4w==
X-Received: by 2002:a05:600c:1e0d:b0:442:e9eb:cba2 with SMTP id 5b1f17b1804b1-45364791b6cmr20461665e9.0.1750408067639;
        Fri, 20 Jun 2025 01:27:47 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e9844a9sm52274285e9.12.2025.06.20.01.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:27:47 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH v4 04/10] ARM: imx_v6_v7_defconfig: cleanup with savedefconfig
Date: Fri, 20 Jun 2025 10:27:08 +0200
Message-ID: <20250620082736.3582691-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
References: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_012749_070124_2B1D32FE 
X-CRM114-Status: GOOD (  10.59  )
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

Changes in v4:
- Fix commit title. It was referring to a wrong configuration

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


