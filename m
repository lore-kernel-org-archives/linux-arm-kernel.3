Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DC5C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 18:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P68C7Vlkji+f3VJLEWVDL5OVYui2OrjrYq5XTyy7xDA=; b=r0kk2SwvwPQtHEoa1b/fN73G2f
	USHJC8mu323MYPdePmH2dqI3hOKibbtniGPo5f0/etABZRuukNEc7gCp9m1XWQ2DDiNowd7enD4lA
	BtDDy0RCFD7E85ch3dxE0Y8M3MeB/cS9RckcNQ/5+PNXmkIzb7xyTde8N8l/O65ZxCBzh3rWZIc2u
	+eoNxE5oJdyOGhUs8jiU3A/xMCXKTDTwAwIJxfYjkzA9DmxMUgCNO7sZHDEBhC68RsN7YQAqZC/mk
	dNtXq719Yzb6X7ON4zbKeHysmn/u81vu4nfLKlFwy2D/fvdTuHutCXukCYSJE6WgOdPLhOelqWBQA
	3iX/1fuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ijD-000000037Ao-40L3;
	Mon, 21 Sep 2026 18:26:59 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ij9-00000003789-1Qle
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 18:26:57 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-4885d4825adso547432f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 11:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790015213; x=1790620013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P68C7Vlkji+f3VJLEWVDL5OVYui2OrjrYq5XTyy7xDA=;
        b=z/LyF5ay8vC4aQ0XzTinajYyYuawMcBPWEFFCMgTgqrQOq3kmXFjxiIEPjhwoOgE18
         FPo5/yQ7GLiEkeby2kGnVOUKC6naj8u6/WNe1WyP5m6NYuR4HtHS9nmFaKwzi1xD+iWW
         IFv7aHkN017ixU9k6AuRt0V1lrxdFTXZqx0bog4iL2m3UM53o5CFXgiqkfbg/cEiDtEw
         2ZmYxHKZWnwV+VzP2zbj9lXkmAiCmQ8JFYlLTV8eI5G1YOZR8oUsFRPzfdmfgkiPN4Dn
         Y6o54R2VhSnXfRb43b9RG16ns5xTp9DkTqA/Mz75Rd8khRU1aS3gkENS6qCa343Llf5q
         pdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015213; x=1790620013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P68C7Vlkji+f3VJLEWVDL5OVYui2OrjrYq5XTyy7xDA=;
        b=XfHSSLOuSyKuHG3DwjB+qwe8+shGeRHwKDGZdEI7WsFuUrF9N7YgZ2Yid0x0DfB4E6
         gRKDMeisllCWLRzwgzKtkvyf/iWsOtcAqmLNVvPcGxwe5QzTF1o50ZRicEYq0l2/kWp1
         aXw98SD3cBF8YD8JLHiAWVfc6GdGyMtk31o/jQS3oBELAxmfIV3d9+TdzaRH3+meSKKo
         O3JWc2TFxKXjuWMTS/iPlH0LocpjRUgv/gxgq3ClCMo27uwyqAHf6xrt6w7ldAouplvj
         abam70HS7peh73oU0rMaxDQuqqHKcAT0eIMok4NSAWx5IlhHeyoWSSsjIr0vT371kEIw
         YaJQ==
X-Gm-Message-State: AFuF++nw0z7F/OeR0Vw9NddGB5tKDLF62GCkgGFH1dfJxHwRvUAFxKnH
	0t86etSQ2MOqFLc2CQUJuwKrjQwGjjW+N9SmwcfKpv2RNNrYe8EvQs7ivQ9xKs0Q7dDvpDsJ0ju
	fRl0BFdk=
X-Gm-Gg: AYBFou3vihRHE3CEAAawNshvjP3WnnZyIxW9R0as5OdU4C/wqVeQBbRe3lKeN/YAsqd
	RnBAMTutnXCsFa6rZAczqBsm/TYsbt8GNIlrtMrSd7qYm6ANTMIthmwu61OnSDrn3FpgTJB4lX7
	j3ekZ7ZsbbJDeDbL9tKF30yZjBVy2OOCBNNzCCT8TBfEbdO32sRQE99U4nyLsemQT8zJMP8VXbr
	B5NKbiRQOyoB0vh2My1m4HFpOaA2hnrjAGx9lXFsZOCk3EQzaJ3TULK+gCFQ325Bfwx+tsJi9nz
	C46hdsZAfsg71PhgH12pcQhZp2XZpwJv1gJ++E2urHwAOUqattrDCXzaxOlE8s01vCIQ9/4mQVN
	VotCR+6ZFenp8czqumk22mU6rNiobUtQNQ1A+qChltbwdT53f3GeGTzLv/dq47BAht2b4d2CBpR
	RYgA5FxDbDVFQOdVhiWGVdLnirh9d2Yu/Nk8AYCHH2K6balWyNUiWIKjvTINtOu9HEpWgEEbK0G
	vETo7fYl49XL8cXxnHUpHvi+drilcxF9Lib
X-Received: by 2002:a5d:5f4f:0:b0:486:f4ae:72a2 with SMTP id ffacd0b85a97d-4871e2131a7mr17423344f8f.1.1790015213349;
        Mon, 21 Sep 2026 11:26:53 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872446067asm25126184f8f.12.2026.09.21.11.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:26:52 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v3 6/6] configs: sp7021: fix defaults and enable existing device drivers
Date: Mon, 21 Sep 2026 20:26:20 +0200
Message-ID: <20260921182620.17597-7-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921182620.17597-1-ag@ffroot.co.za>
References: <20260921182620.17597-1-ag@ffroot.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_112656_568781_A4BFE73C 
X-CRM114-Status: GOOD (  11.67  )
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


