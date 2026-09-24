Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA44C98325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P68C7Vlkji+f3VJLEWVDL5OVYui2OrjrYq5XTyy7xDA=; b=3sB/Uimiufnf25vp+1T2EbdoTU
	XSZAQJPWFkL+8FED4m0sM883wEW7h/xHf8CvmG9g6Vjb5Ks0atprQE3/RfFmIPBLSSjT7g6HiRBhf
	vq1oGZuTD075E7XBp3v3rEidcYPrsqgNLV+Uab9EC4Fn0gTdTVfcOBvvboRpT2kfoIsJTGbXsyM9k
	a/wYuCbkJPAPw/wHXYI0i5kgU4aALKuuD8p7q4BiKOSWBTq8+8fvbaRhlwO99Dxc1TAedL6KU3T8m
	2Zjc4Pe5OIUKjShsIZzxV5T3ffJk2EuOWA2F7Qo6/47PaAQNId0hlTCNAoBtMAoo1Kx+hLsjieqm6
	pZeDyi+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lOZ-0000000BPvY-29LN;
	Thu, 24 Sep 2026 15:29:59 +0000
Received: from mail-wr2-x0c.google.com ([2a00:1450:4864:30::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lO1-0000000BPYD-1v2H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 15:29:26 +0000
Received: by mail-wr2-x0c.google.com with SMTP id ffacd0b85a97d-482f6350f91so1414421f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 08:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790263763; x=1790868563; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P68C7Vlkji+f3VJLEWVDL5OVYui2OrjrYq5XTyy7xDA=;
        b=psflcxT24SoOuA3+mH8F/BIhZtpUZqsPgyEU8z1ci+4oaBDvBRSJ1g7vkuy0vBOhRG
         dSFCuo1UUHg9TgTFnCtbzMOXOrSvdY/u/RbYc8h8BGAOhDsEssnwWP4SMm+TRTS8+Xbd
         t3Mtxy0S4uKiwcIY5g0Rv9m7al3ixRRXGCO304OQ9m9ijH9ULIYe/mtT9Lf6ETroGPia
         H2EPCSsHhnWhUOx2wBGxvRVS+E9CEJrgJWc4vqaf9rU38NrAqD7ZnbIyssYzpn5WTTYE
         39zNXu6N6rrauwMS4jBgAzBG63TJeTChgBvlHZxNTRZlEMc9LKpfbNMP+mwHph0bC86m
         LIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263763; x=1790868563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P68C7Vlkji+f3VJLEWVDL5OVYui2OrjrYq5XTyy7xDA=;
        b=F/sokcL/Vz/9JIXnuO1wL5g2hXCGwMh1b4pAWRSfJCbzNI7COtltfeHjQAKzuazZJC
         ch2+hGwvsQVawvfvZ03gjX0sxH0AL0lQEzv1+PylyzWNW1qRzilVcJ95vM+VOXxdTeyh
         U2RpSl/oFe9AsxuF0vspO4DvzzHed0E1Q8HOBfdPMB0iIz/glCAO0pgdPO1T43RAAbRF
         2QCi+I+CzGIaDffb6G/e7i+Ab85VwrBjSirvsnZHhE6EX6Ok8pUgF+9WKH9i4ZBPBITv
         KAWaCUwo3WfFIm2Sbr1PZfCokhH7LW+DE8ON/0ZaygSLQxN2X3/P0i8hF3diz1IJ/lu8
         HQ+A==
X-Gm-Message-State: AFuF++lkOR7sUWM20+KHmpPQ9rFmmxR6cUvhAKbabWe85OiRDpDLEWzH
	tqnAwadxuUekABOOYJaQ8A/FXOxND54jaq4EZc/19Kr8ZIHRtQCwX72CuR8bvm9KfKxgGzsjnNu
	iGr2k0Jw=
X-Gm-Gg: AYBFou0APWuzd7/pQaj14Au0K1MUTcf5EMmMYoOPV2LTdj4yTBhGpFJqe8kGhc2xF3n
	RlvxUkkVvsO3HljV76UvBvdBUa0Tk2StFnwfOLE/EtY3GM3eVKBIMnHbHkpBj/Q01MM4YtwyGXO
	jcZExbB9i+LmO1fFrtE0SCX0BDC1HtXIhc5Qy01NkHzfXoXOQwENH2p6gnzxYlLrNxRjIjFHxw9
	yfPspizpBwMIWTrZKyb3SO3CL3FGtTpw4rMzt9wCUNQOWE0lIwQeMNpHUzzAyX7Q0rhf2zKZtU9
	MhLH/WQDRKXeq65XffO+DBuwpiFvQjwxBz8lISZmTN3BApPatCSDj25b0LOX62AVA/KpNe+7paw
	dgaL+pRF1MENqc0tuJ7ZvWArG2uDhRoFV0JMvJ1NkUlj4fQYBm0aGYtGT7CvR4A/4NyUtf8Tp8u
	QnL1Aogu01RAT42Dvb3BIvWu5EZOvpZK4Oimms/00cLiVnrSSx7xrx4YYF4KE+la8Y+CpBZjIS2
	Yo+ialj4sXkaefcZ+Ce1KEtYew6SWLKkWTc
X-Received: by 2002:a05:6000:4711:b0:488:6523:e15c with SMTP id ffacd0b85a97d-48871751996mr4474862f8f.32.1790263763490;
        Thu, 24 Sep 2026 08:29:23 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48867b49661sm14781552f8f.0.2026.09.24.08.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:29:22 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v4 6/6] configs: sp7021: fix defaults and enable existing device drivers
Date: Thu, 24 Sep 2026 17:28:44 +0200
Message-ID: <20260924152844.81705-7-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924152844.81705-1-ag@ffroot.co.za>
References: <20260924152844.81705-1-ag@ffroot.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_082925_519402_5F2C3C03 
X-CRM114-Status: GOOD (  11.40  )
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


