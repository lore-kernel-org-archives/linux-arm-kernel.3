Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A555C98324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P68C7Vlkji+f3VJLEWVDL5OVYui2OrjrYq5XTyy7xDA=; b=mkJ2OAqu7u1J2PhJ1f6yZlio8a
	pgndaLt4JO+QnHAjHoBrKOGN5XppwGx/1/8dB6T4DBrAI21rDPxTdkLQhzCLVR7Z1Fr4Y4rwwThTj
	OJaQLnOU+MXUAQ80VYvpb2pBg4408p7hqRlRYGGHfK7vR2RlO5OLHY6e8pGNBPRXofmQZRdWmDG/c
	VBw/ehdyk0AQoWxvUm1bUe2kjovbbJq9k/YvKTNRPxx2v5G+tuT8N3XSF1ofQ+gmRkJVmHIVmzr/b
	3DkzYHbBRd/Uecmcv5CgMAY+8ptomT5IOaOtpBqylkXXrnd3G8W+XjzzNwwKaCdp8im4mz9iR4amy
	DEnC/dWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9meR-0000000BeGX-0NM2;
	Thu, 24 Sep 2026 16:50:27 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9meI-0000000BeBv-1psg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:50:19 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-48439feca17so13667f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 09:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790268617; x=1790873417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P68C7Vlkji+f3VJLEWVDL5OVYui2OrjrYq5XTyy7xDA=;
        b=edwuGlZajHRD5j4utucq4jE2hsO6Cp/m3fXmLlgLRfoKMSiNiYPE5qqjS6/UKm/mg2
         9WU25PbVrwp3kndoQl3XdMhJP+WnqXVWkH8loU8KpNd6tCTGjXPX2eGrkCQJYu+Zqt21
         ATK4KE2hBGdCkGSKxF4n1Fu9Yl3t+1ycwckBV35Fi9DZod7xIXNqPj0/cRiFBBEKgw8m
         03RkO79LluCfdBTkGMGSkrgqJQoaQxM0TZLOxqMOu2D8rPLi6qLMHkXBowYOjnv2oXpt
         lacfHkvd/4AjoshHt9kvU1EfoEwL3SEM6Nt3C5IYVPS5Y1JT2zFd2XdJNOpecARH3BDP
         Nlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790268617; x=1790873417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P68C7Vlkji+f3VJLEWVDL5OVYui2OrjrYq5XTyy7xDA=;
        b=tm2Rlw+4znC2j56hd45rbZ0VDDxKxKKVRCEM64Sj1l7JfnNBw1bfwpuQ/5SQNrm3tM
         mhB3bmL3ruabJ+GugKJ8laT3A7fLeBM8ipQJzk5K0rQvjAaVPQ1eAu6yttm0cgXaXrxV
         Nl7yQErGS5V6xRCniRDbZbefA3JZ4U44+CZkFoBk407BetCf1TLCbxL5kGBY6tRuoXQm
         uS/t0f4qhiDYv16wc3oDl1p8AFqrO1l1540a8uZb8rohrRh0SGaO7Zz2zDfpSFICuzh3
         0mium19vaxrE6+yL56uXRDKzceQrzDKHCOVDrBkpXgVlDQuDg5ohFcGAAj0yW3YtAgpd
         ZE4A==
X-Gm-Message-State: AFuF++n+GkubfBRSNIfEnsXzIPhTZiEOXeFjt875722z3u7yMKt4GZxl
	J7XjLcgLX35UrcOOMCB+wH6DiZaX2O55pzTw1qc7BASakkUILUQr37WG2WlOycTWyzem35euXEa
	C/rSvG6k=
X-Gm-Gg: AYBFou2X3b+4lePokmVT1LHcBtHyHx2njYaH+TyQejKv/wTNPLL05IocfqLPdEm8J6U
	8iWh+ikbrVzq9PAEsk1QIE0P0x1lAFRc4kTS+HkcUR5KFEuFzhi+S9gIL5/wygBdo7fs2G7pYFR
	+63obM2/eyjQiUqH9wO3qrQvap2jHDy5ypl4SFYX4wN5fr/Oh+TtTNdx/awcgqWuRTJsf2qbWGX
	Z+z/M12yVEbB7ZsXDrVs4YpQhJN0taFaUVHklHs+CfSttbGCJx2W7h3ybKWzIl8648IMd9V6irl
	xaDxgOQVBEurWQ4YxNgHbAOe9Paf2KMfCrtiDT/lsoHQ/j+jiU/Z0i8bEEa3vCFTQVML6c1fm/Q
	NxfTmRttZK+Y2pTAJbYdkGjEVmCxeqmWwC0XU9t6t8X/Mo57xov6HgutzZf7K5vCM13Njzs6FGV
	CiNGaIcnf1uglPviiXpdCmi2HkJ9LmuDbsDfggBaGkJoX83nG2MVV5pTituRd57JKoD7VqmTod0
	aZz/WSddZZ/zoqFOCOdV7KBxBw+5WNC/fba
X-Received: by 2002:a05:6000:4282:b0:487:64c:240f with SMTP id ffacd0b85a97d-488717699edmr5374197f8f.28.1790268616757;
        Thu, 24 Sep 2026 09:50:16 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a3625ccsm327139f8f.22.2026.09.24.09.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:50:16 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v5 6/6] configs: sp7021: fix defaults and enable existing device drivers
Date: Thu, 24 Sep 2026 18:49:22 +0200
Message-ID: <20260924164922.117236-7-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924164922.117236-1-ag@ffroot.co.za>
References: <20260924164922.117236-1-ag@ffroot.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_095018_492459_B27893C1 
X-CRM114-Status: GOOD (  11.38  )
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

The LTPP3G2 is based on a SP7021 and has a Cortex-A7 CPU, Ethernet,
eMMC, SPI, EEPROM via I2C via GPIO, watchdog, RTC, NVMEM, and LEDs.

Apply these settings:
- ARM_ERRATA_814220=y   # needed for Cortex-A7
- ARM_PSCI=y            # needed to boot SMP
- CGROUPS=y
  CGROUP_SCHED=y
  MEMCG=y
  NET=y
  UNIX=y
  INET=y
  NETDEVICES=y
  SECURITY=y
  SECURITY_NETWORK=y    # needed to boot the shipped rootfs

Enable these drivers:
- SP7021_EMAC
- SPI_SUNPLUS_SP7021
- I2C_GPIO
- EEPROM_AT24
- MMC_SUNPLUS
- SUNPLUS_WATCHDOG
- RTC_DRV_SUNPLUS
- NVMEM_SUNPLUS_OCOTP
- LEDS_GPIO

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 arch/arm/configs/sp7021_defconfig | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/configs/sp7021_defconfig b/arch/arm/configs/sp7021_defconfig
index ec723401b440..29c200d2bdb7 100644
--- a/arch/arm/configs/sp7021_defconfig
+++ b/arch/arm/configs/sp7021_defconfig
@@ -1,4 +1,7 @@
 CONFIG_SYSVIPC=y
+CONFIG_CGROUPS=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_MEMCG=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
@@ -16,6 +19,8 @@ CONFIG_PERF_EVENTS=y
 CONFIG_ARCH_SUNPLUS=y
 # CONFIG_VDSO is not set
 CONFIG_SMP=y
+CONFIG_ARM_PSCI=y
+CONFIG_ARM_ERRATA_814220=y
 CONFIG_THUMB2_KERNEL=y
 CONFIG_ARCH_FORCE_MAX_ORDER=11
 CONFIG_VFP=y
@@ -24,11 +29,16 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODVERSIONS=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_NET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
 CONFIG_UEVENT_HELPER=y
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_BLK_DEV_LOOP=y
+CONFIG_NETDEVICES=y
+CONFIG_SP7021_EMAC=y
 CONFIG_INPUT_SPARSEKMAP=y
 CONFIG_INPUT_EVDEV=y
 # CONFIG_INPUT_KEYBOARD is not set
@@ -36,6 +46,26 @@ CONFIG_INPUT_EVDEV=y
 # CONFIG_LEGACY_PTYS is not set
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
+CONFIG_SPI=y
+CONFIG_SPI_SUNPLUS_SP7021=y
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_GPIO=y
+CONFIG_EEPROM_AT24=y
+CONFIG_MMC=y
+CONFIG_MMC_SUNPLUS=y
+CONFIG_WATCHDOG=y
+CONFIG_WATCHDOG_SYSFS=y
+CONFIG_SUNPLUS_WATCHDOG=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_SUNPLUS=y
+CONFIG_NVMEM=y
+CONFIG_NVMEM_SUNPLUS_OCOTP=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_RESET_CONTROLLER=y
 CONFIG_EXT4_FS=y
@@ -51,6 +81,8 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ASCII=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
+CONFIG_SECURITY=y
+CONFIG_SECURITY_NETWORK=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DYNAMIC_DEBUG=y
 CONFIG_MAGIC_SYSRQ=y
-- 
2.53.0


