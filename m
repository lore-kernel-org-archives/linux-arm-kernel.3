Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C75C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 08:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GsKXjxj5TCnOfXiRILa1fjUfcKm3nh3qcaT1EI0Ql1I=; b=O12+0qT70jEenKz+2CfUN7s1pV
	oR5Wpj5/3ii2gNg7APDa9BXJRsEoxCEKHt/d/e7G791fjhUTsktLFtkYVzV++h+w+9xcv1x5zOduH
	xuCghMASUQniZY5bV72bUJ6BPl9QBcqABlY9n7y6EeXvmB0uZP8BEB8MSuCBX0HBqjLq5LBIR18tF
	DCVTM98jMr1sB8vpo65h9knhZYRFmaT6xUR6TLh4YVQI1UMePan0FLT+lf67fm2/OPC/F23xO7T6i
	6Y09Zb7rPB6EY4N6sfKZsFh67lxaOWWdVDVq1a2dKc1SHB7Gmz8WO2wXtyVb85fOMSpOnLXuipxTM
	UbiHlqTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77SX-0000000AthX-3SBh;
	Thu, 17 Sep 2026 08:27:09 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77SP-0000000AteV-3hrr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 08:27:02 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485933b24c3so286349f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 01:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1789633620; x=1790238420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsKXjxj5TCnOfXiRILa1fjUfcKm3nh3qcaT1EI0Ql1I=;
        b=iXzxjp8j3xDbXZOTec6QxdaFcCdjUoaBksktO1TIl00zJIQUMqBHJ+hX8Z3TrJYPRo
         /r/ipadl4bUyDOV1qdBsCqjiY7nguIN6D/oGhk5WL7tX8gpUlRpCxl4+HXSXDR2zJ8px
         jIib6paS4hzjXHtO2ZsQ1+WMwWrfLlU87StNJ6ht6WJfnTa1YqMVW8p06YMGOXupEn5v
         kcrp/JSfYQXWVeFsII4gJk31SV8bZy3eDK72K1xN9GqmodfZceEyNb7zQVhVSH8UfyXz
         TS/jw9YXHAPjaqR/i2M+qlPHKJ8QVnFJc2f2bzdD3tKvFGKhnKegZ/JdfH9sjBipXThK
         VamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633620; x=1790238420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GsKXjxj5TCnOfXiRILa1fjUfcKm3nh3qcaT1EI0Ql1I=;
        b=EJ/V1bSnaEgiZJodIKEe3UdwpOuBGVB3Ye+8Q40l2CLOApW+DmWOyPZXqPJN9aUlAr
         xy4wmh6t0qhtl9ttgKsCCmW2DmRdVeO8Y+MvhbSZHYQiD8O3jdQkgUIXHJAtOdy3YT56
         jRUlmdSQXKJtVLqd4kXRe3zriPtLJCdNt7P90nplAaFb1yEjz9C4D0ZYjW2y5wZmRG+7
         O+dj/qMgip+lRpGMWpeC+Gt7BXBykWSvBzXfUJGmyycoCiI2KBJ5MNCNcBLrxQ3eyAZH
         /zZrwAYD5q1SZ0V8+ryIW1s0Hcn3QLnwM/2jD1jM3EtHVts+OlDDIFotBhbGuwFhNWx4
         tiQA==
X-Gm-Message-State: AFuF++kKhHXMM1i/xpGRyUt3ObUPI4BE1tcKEP8WJ3rA83lnVvk8/g7z
	Tft7PrN3FK9a5Y1Q9+ruHRKWJl388taTolVEmO+n8VLJhMWQfdvSsmYcDA2QMH+o3sXbGtZGUdK
	lBdZVOPI=
X-Gm-Gg: AYBFou27tFXfCcnccXl0Vl03/bk0nTSDMfm3JwegYAszrW0TzM7w5fUQ42pYfD2dsgh
	R17n7BdaQjg5ohVlQQ9tsQ8WkvomN6MoF2x8wukcVpYo9LtxA5r6iZFSx5scq6FIVanXoLvD+Uw
	TSxbntAr7XKK8vDHYgtlyCcP5AXH3JOfvgVahX+6mUDz0iZxYFRQ9b56v23ZYXYq0htmayecj0f
	n41NM0QTuth5Q5JuwrxdQ0U5E4e5GgdG9adSbT/OmjgiI62XgyKZ/bYnw6ct8FQnmohcec3jFMO
	KT2kfrRHt0tDMlaSClf+mKEES7W2oNSDk3B5MtN5AouajF83VCrsLH4vDMpgQYlN1rAXTTCQ6kl
	BHJ0rlKMKZ+uBGMrRkONTu4LSgZS+67Tl+i3FIXjRtySjufBt1AsgRcvTJvaTDAq6bqloT6BwLm
	ZWFoXDAyKwtem/2ZhIcobCm+4ZbUAMTKcL3ED7ATrrq2ppxovxHYuUiAV3sDYKdsxcXBX/ySNjO
	vtaNo4PJ0wrKnb9vn74L0FTtX+ELF6lTMo5t5mHVUaEAvY=
X-Received: by 2002:a05:6000:22ca:b0:487:35f:f0f0 with SMTP id ffacd0b85a97d-4870cf3934emr7333896f8f.14.1789633620247;
        Thu, 17 Sep 2026 01:27:00 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf342a0sm13420395f8f.24.2026.09.17.01.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:26:59 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH 4/4] configs: sp7021: fix defaults and enable existing device drivers
Date: Thu, 17 Sep 2026 10:26:32 +0200
Message-ID: <20260917082632.626614-5-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917082632.626614-1-ag@ffroot.co.za>
References: <20260917082632.626614-1-ag@ffroot.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_012701_937457_A985B9D4 
X-CRM114-Status: GOOD (  12.21  )
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
- ARM_ERRATA_814220=y	# needed for Cortex-A7
- SMP is not set        # SMP is not yet implemented for this SoC
- CGROUP=y
  SECURITY=y
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
 arch/arm/configs/sp7021_defconfig | 33 ++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/sp7021_defconfig b/arch/arm/configs/sp7021_defconfig
index ec723401b440..e6a2debab8d4 100644
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
@@ -15,7 +18,8 @@ CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_PERF_EVENTS=y
 CONFIG_ARCH_SUNPLUS=y
 # CONFIG_VDSO is not set
-CONFIG_SMP=y
+# CONFIG_SMP is not set
+CONFIG_ARM_ERRATA_814220=y
 CONFIG_THUMB2_KERNEL=y
 CONFIG_ARCH_FORCE_MAX_ORDER=11
 CONFIG_VFP=y
@@ -24,11 +28,16 @@ CONFIG_MODULES=y
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
@@ -36,6 +45,26 @@ CONFIG_INPUT_EVDEV=y
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
@@ -51,6 +80,8 @@ CONFIG_NLS_CODEPAGE_437=y
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


