Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD54E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 16:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3nkKg1tuuHFEH5PqoMy9MV06rNk95ek43/M1WdoCMPo=; b=b47P5DKQ2pZttv2el+omHQU1Ap
	61gY82oR/l8W2Gyw4fzF3E3RO80oNIvMXfB4cBlTGglcopkHhHkKDT5cQpje2gBklqDY9ohTvhF7i
	095lBDubq/bO2u8/bCdv69m85dCxqtGk0dFp38jnr+8SWIvFDpJDu0M5QNn3urc4Mv76K1TYCte/r
	xYwIuUPkhKl0Vh5B2xcvC30JYhlQrkcdSV5crpGXrLGMYTvhF45yiLTcRtWA+XJIO2S8PY7aWmOlA
	LPgCJU5DkWcPuem03RYRmzVlpaSFAqEsKWv/HWzRACoa8xoSAz4y5UiVkryJdl82BT6Idg8m9CPus
	DuAM/hGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrn6-0000000D4z3-0Bim;
	Wed, 04 Dec 2024 15:59:52 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrl8-0000000D4PM-1S0E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:57:51 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-53dd57589c8so1155827e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 07:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733327868; x=1733932668; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nkKg1tuuHFEH5PqoMy9MV06rNk95ek43/M1WdoCMPo=;
        b=JAKj/Q6FXhKdSgw2EEinP10Ce120+UWuspc60Fp9Sro2gThbU5WT9apu8MB765loYy
         KPU6xix1gjbxVoDMP79+4rFGyR9IlYdBffmUzsvLoU/1rOddUdzsa+u/pbMsYrBWP8h9
         F7hQkzshi/M3E659YOKiN4EzlDN13lvrXONIIWP6zKt4OKZ+8jA8fLvcOAJBk8vRPZqc
         JvWRr8EA10oPKTfgcSIqu9ZskCXlN1LbIaP85QubKaE9Hfqpn+WEr90jLFNdviv6URIQ
         cBgLT4sqPw+X5AYuLDCuDJc1+SVJRCKmJRlpaNbZONaRIvj+DC2lrOnUr+pBsnfqFFd4
         LIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327868; x=1733932668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3nkKg1tuuHFEH5PqoMy9MV06rNk95ek43/M1WdoCMPo=;
        b=AlML7SUjBfJKLGNhLbaD9iwv5ggnow3S1Q/dGUpz3MdAgGZeWIXaQkfk9psXd7+n3y
         zKdbKH6oPF0PcgXA1yWGkf6A8aQ6B2lcTkdMX30mFc0NrFOyEWn3RHQzeDHFCRdA8wKK
         Rk3uB+Ynq4IX7Y2ZS/+TxoDMWTSV0xZn25xjJ0AUPARwL2L1RJmVtpDI/3g8GsaOG8AU
         v+kVSfXIsDdiLmy/06xy9neyF+E6dLq3oDSjflmBwforiN/JL8ee7sMXCEWgZSXVg4a8
         O3lC1vkXNn3sigVc5HV0UCOi/+a4NYlnKay2KmmjJB97fz32z8SHLxSWyIgBQNcxdE05
         hWhw==
X-Gm-Message-State: AOJu0YwymzwpzhA3WeLYP3GYT/03JlGi9h/+jDywpS4K+M/FahvhAsAP
	5mmdJkVnsEsUoMDwNhgfPdCZL3vt5wE2X8Knj5wn+8NB6G65ReaG
X-Gm-Gg: ASbGncuKUD+oIrKsIeM0o8YuJLdLmTV4+1eeQKhnkC2WPPYURyyjXLOGSfEsmx7IAtK
	PrjvJsiMhB03twBD2zQSCkUEV6MAoGyXHQeGbWjsFCHCFKnRV4JWZWjSVCRNNLdfDJPSZVfKoq5
	eZODI/CiaDGY4icwdGq2ZRqaZsLyB8B7OjDJCKqRCP3tGP13JGzz8p1r56EnYx9AiCF0/zmBxU9
	XpiO88f8my/E77Um/LyxchS7uOrNHicKnbFUv0RDhUMW7PwePmasRthxLBqmcDlzNr9gMowdhIN
	a0thsfpn8ONefMk=
X-Google-Smtp-Source: AGHT+IHAcb5udTy8nhI2YPMmDYf9btt3l6VlGD8R5t5Rr1u9eOFtISjwR/bSWUTbOGgS5xor4NF4lQ==
X-Received: by 2002:a05:6512:159b:b0:53d:ed29:43ac with SMTP id 2adb3069b0e04-53e12df00a2mr2112889e87.28.1733327867939;
        Wed, 04 Dec 2024 07:57:47 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1f5498easm168999e87.105.2024.12.04.07.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:57:46 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 04 Dec 2024 16:56:43 +0100
Subject: [PATCH 1/9] ARM: axm55xx_defconfig: rebuild default configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-defconfigs-v1-1-86587652d37a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4266;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=8KQt7pjdBn+B5huSjAB+LdsFv0g/yxS7A8zqbMHAK4c=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnUHvJS7ip8U7wYAMpzFqthb2ew9xg5v3/G9C43
 N2EKshFRlCJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1B7yQAKCRCIgE5vWV1S
 MsraEADLx49LPm9PHTLMe85Mz5h71JDNAkwmSyHU6u59/ljroYOIe9DrWljN+1DdNXr/V4vKxyZ
 CH9lScPP7/IpKgYy+bGw73H0Tc9JL/LMZFcxu3tQCPdoomELb4kbZ8ReGEN9TeaW8PdFrpLkBBK
 C4SamEjUkw6bEV5CyIpFUqpM5CEudbN1XAStGKSeuChoa1sUUJxmOJDSaFuB+BXWP7nz/bACWK5
 mRX9zbrddiK1aAN5R7yUzocj/cMYTgRxdJMIgsT1SztNzmA5ORac9o9WXEPLaNUxNFqiUzfa3nR
 +tPFHPiZVI14PtR5B0v2MKCrazaHYUQjGMZEk6HJ+cAe/lCuSqm/BSg72L2a4sWAwQM19+Y0Xtm
 4oW70fAMWHttfEK80RcKHYaKkaX82hssAwb7o2QiYkC3FVqHQQkXS14vykXhi3iKdgiq9SjrkBI
 eZn+U6w+1Yjr06eJ3ehoBJP9CiYbbP26qDTqBRAhKnfswHEZX9/kZM63ddVYH60DI8NPzPST/pj
 SfZ7AIMqemTcA1KXCFC6CiMjq8R6A/Q0bthmVJoE6Qb2eLa28s5TZaTRFJtRNJ2c+J7jPwrN+5D
 QrrCDpTMjzYw5bedxN9Au2mlxW43ZdVd+RikFGAtY/BKB3NWebUBvSSOwMJng/rDsdU1qVfwIO+
 T9Mg6jPWc1T6ZAA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_075750_389245_A338BF21 
X-CRM114-Status: GOOD (  10.40  )
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
make ARCH=arm axm55xx_defconfig
make ARCH=arm savedefconfig

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 arch/arm/configs/axm55xx_defconfig | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/arch/arm/configs/axm55xx_defconfig b/arch/arm/configs/axm55xx_defconfig
index 516689dc6cf16407f2b82370ed08df8da1b5770f..d30e8a350ed26e07af6722666cde763ab3196c85 100644
--- a/arch/arm/configs/axm55xx_defconfig
+++ b/arch/arm/configs/axm55xx_defconfig
@@ -1,6 +1,5 @@
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
-CONFIG_FHANDLE=y
 CONFIG_AUDIT=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
@@ -27,18 +26,15 @@ CONFIG_ARCH_AXXIA=y
 CONFIG_ARM_LPAE=y
 CONFIG_ARM_THUMBEE=y
 CONFIG_ARM_ERRATA_430973=y
-CONFIG_ARM_ERRATA_643719=y
 CONFIG_ARM_ERRATA_720789=y
 CONFIG_ARM_ERRATA_754322=y
 CONFIG_ARM_ERRATA_754327=y
 CONFIG_ARM_ERRATA_764369=y
 CONFIG_ARM_ERRATA_775420=y
 CONFIG_ARM_ERRATA_798181=y
-CONFIG_PCIE_AXXIA=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=16
 CONFIG_HOTPLUG_CPU=y
-CONFIG_AEABI=y
 CONFIG_OABI_COMPAT=y
 CONFIG_HIGHMEM=y
 CONFIG_ARM_APPENDED_DTB=y
@@ -85,8 +81,6 @@ CONFIG_MTD_CFI_AMDSTD=y
 CONFIG_MTD_CFI_STAA=y
 CONFIG_MTD_PHYSMAP=y
 CONFIG_MTD_PHYSMAP_OF=y
-CONFIG_MTD_M25P80=y
-CONFIG_PROC_DEVICETREE=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_EEPROM_AT24=y
@@ -94,7 +88,6 @@ CONFIG_EEPROM_AT25=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_SG=y
 CONFIG_ATA=y
-CONFIG_PATA_PLATFORM=y
 CONFIG_PATA_OF_PLATFORM=y
 CONFIG_MD=y
 CONFIG_BLK_DEV_DM=y
@@ -103,7 +96,6 @@ CONFIG_NETDEVICES=y
 CONFIG_TUN=y
 CONFIG_VETH=y
 CONFIG_VIRTIO_NET=y
-# CONFIG_NET_CADENCE is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
 # CONFIG_NET_VENDOR_CIRRUS is not set
 # CONFIG_NET_VENDOR_FARADAY is not set
@@ -116,7 +108,6 @@ CONFIG_VIRTIO_NET=y
 # CONFIG_NET_VENDOR_STMICRO is not set
 # CONFIG_NET_VENDOR_VIA is not set
 # CONFIG_NET_VENDOR_WIZNET is not set
-CONFIG_BROADCOM_PHY=y
 # CONFIG_WLAN is not set
 # CONFIG_MOUSE_PS2_ALPS is not set
 # CONFIG_MOUSE_PS2_LOGIPS2PP is not set
@@ -132,10 +123,8 @@ CONFIG_VIRTIO_CONSOLE=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MUX=y
-CONFIG_I2C_AXXIA=y
 CONFIG_SPI=y
 CONFIG_SPI_PL022=y
-CONFIG_DP83640_PHY=y
 CONFIG_GPIOLIB=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_PL061=y
@@ -150,10 +139,7 @@ CONFIG_PMBUS=y
 CONFIG_SENSORS_LTC2978=y
 CONFIG_WATCHDOG=y
 CONFIG_ARM_SP805_WATCHDOG=y
-# CONFIG_LOGO_LINUX_MONO is not set
-# CONFIG_LOGO_LINUX_VGA16 is not set
 CONFIG_HID_A4TECH=y
-CONFIG_HID_APPLE=y
 CONFIG_HID_BELKIN=y
 CONFIG_HID_CHERRY=y
 CONFIG_HID_CHICONY=y
@@ -164,7 +150,6 @@ CONFIG_HID_KYE=y
 CONFIG_HID_GYRATION=y
 CONFIG_HID_TWINHAN=y
 CONFIG_HID_KENSINGTON=y
-CONFIG_HID_LOGITECH=y
 CONFIG_HID_MICROSOFT=y
 CONFIG_HID_MONTEREY=y
 CONFIG_HID_NTRIG=y
@@ -182,7 +167,6 @@ CONFIG_USB=y
 CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
 CONFIG_USB_EHCI_HCD=y
 # CONFIG_USB_EHCI_TT_NEWSCHED is not set
-CONFIG_USB_EHCI_HCD_AXXIA=y
 CONFIG_USB_STORAGE=y
 CONFIG_MMC=y
 CONFIG_MMC_ARMMMCI=y
@@ -195,18 +179,9 @@ CONFIG_PL320_MBOX=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
-# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
-CONFIG_EXT4_FS=y
 CONFIG_AUTOFS_FS=y
 CONFIG_FUSE_FS=y
 CONFIG_CUSE=y
-CONFIG_FSCACHE=y
-CONFIG_FSCACHE_STATS=y
-CONFIG_FSCACHE_HISTOGRAM=y
-CONFIG_FSCACHE_DEBUG=y
-CONFIG_FSCACHE_OBJECT_LIST=y
-CONFIG_CACHEFILES=y
-CONFIG_CACHEFILES_HISTOGRAM=y
 CONFIG_ISO9660_FS=y
 CONFIG_UDF_FS=y
 CONFIG_MSDOS_FS=y
@@ -218,19 +193,14 @@ CONFIG_CRAMFS=y
 CONFIG_NFS_FS=y
 CONFIG_NFS_V4=y
 CONFIG_ROOT_NFS=y
-CONFIG_NFS_FSCACHE=y
 CONFIG_SUNRPC_DEBUG=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_CRYPTO_XCBC=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
-CONFIG_DEBUG_FS=y
 CONFIG_MAGIC_SYSRQ=y
 # CONFIG_SCHED_DEBUG is not set
 CONFIG_RCU_CPU_STALL_TIMEOUT=60
 # CONFIG_FTRACE is not set
 CONFIG_DEBUG_USER=y
-CONFIG_CRYPTO_GCM=y
-CONFIG_CRYPTO_SHA256=y
-# CONFIG_CRYPTO_ANSI_CPRNG is not set

-- 
2.47.0


