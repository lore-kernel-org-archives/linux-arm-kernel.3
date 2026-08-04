Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6126EC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7r8iZsa4EFD7LRQXVCVW9FMeh53EBj3eyxUC5DEXkhg=; b=lESromkAOOYejfbkSukW58AIeL
	FlHiDjJ3F72pNQYZ8Nm0rnZqFGCFaIGMos/cL2GJl984GLMbxjVF4kZx+c+jgzU4n6v1JwnG4cd3T
	CHPuN09DLUQQVUIChs4KR6mOMMdH/4cQ4btgZoHw2pkQcA+xdFIQpV2wI9arw0avKts1dm3f2jRkX
	WzNP1H8+gy6oLe4z6XqnCIzjyueegqMr9zOxAZedbbY3ZXHRZLrz7WwAeICETclmjKsnBtWrwWkq0
	WEH3BAL01IZDV1+REToveXjd6ribMBHrXmJIRoi4TiUZaaVA2phhGiojZXxmtk3lv/8aspN8sAl2V
	dBR2cYTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9D7-00000001BAi-1G6r;
	Tue, 04 Aug 2026 07:05:13 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9D4-00000001B9y-3Trv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 07:05:12 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso3997236a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 00:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785827110; x=1786431910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7r8iZsa4EFD7LRQXVCVW9FMeh53EBj3eyxUC5DEXkhg=;
        b=me4iyS1/0LpRbdgzgXkKR4k2SPSNCmZZ3Axe1jkIgwg4Um3pDwpUw28pgVwGp3n2En
         jnH+e5qJ0pzM3pVM4hmlzAnMmtAnekxWkmAxkppgkFJqSw0yd1AjYGonD0sTqsrRP7ln
         Q3olbhYOan6yufN6HtdI5hDB34h3A7YZAftc3udIVjvWtzt/Bz/Hlh3khWNDYVqKlcNj
         wDxnb60qg84ro44bDt3qxeJnjeoIYkBkXbkfgxMU9dAynbjRl/aqI+iwNedmOQVz3pVP
         X1YSS09m/e5dCpsMv8OmNSF7zss5X9huKHopFLjB0oY+EqbDSh/OSppMUVkdHXXU0kiu
         j4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785827110; x=1786431910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7r8iZsa4EFD7LRQXVCVW9FMeh53EBj3eyxUC5DEXkhg=;
        b=djbIsusxRr8Uwi+2C01bd13Q8UjggdjyZUK6bcXQPJP4BprazZ5/YMtgX/d2VC1aHj
         XXekhgDPSoA4PNWFmm2NovVL/oAjFztYJpSTatJNDhIVZFWMfEYyHbLISfKzIWbrk9Gw
         PV/qCE8V2NIuQDKsixFWVvrFSayXErWLsa+oseTFMAOdoD9Wge44L8u0KLn4Hu76vTDp
         7+E+03DvCPbtWWwugfd2/fP+NxFBZCSLyD1GK1rIcTqqjUqBLr4SH4lvy8LKOLejeGeK
         xr7oyBX8rO2rOS5jooNbBPgfl2zyF7oafirdz+GpMNe61rblOzinKiPMl5qD+hqBV/bf
         Vo1w==
X-Forwarded-Encrypted: i=1; AHgh+Rr3rNzlLhV1Kac0fLP1lkkY7folHm437x/AUQIia9qIA8mCUHnyfogW8pOvkIj2lFM2Vq9OQPSZuFUTPqqgqY/J@lists.infradead.org
X-Gm-Message-State: AOJu0YztgUqo8IbAlet6t7+cuSXKw7HgaABq4odT7lPOEva9W0m4sqTj
	dZRiPPX7aAP9HeI1CyAPnM92PKDLKNLoht4t4K385/DSGZYeMrx2d/ws
X-Gm-Gg: AR+sD12f8K9cckdi+CPcb/qfyZuoFywaxSCwUFp2WKtQDfaqYGnpFThyi2J5OLzL7fd
	Ucvtez3/xGcNjvOoAF6vUdGxCagAroX8Kuc8UuRrNvZxgAKYLemSL2qwaAz/mPvh1OMSIwB9CKY
	iCvITV62fp5Fb5tPsZTVB0QUmfjU9HEsi4OKpaNzk0JNNemiY8X2GxW1at9kEPA2MeZdht5x1T6
	AllpqQxKER59bg0YC/Curwzwe0Qvm48yr4tgxwedhi+oGL9ykRZ6fC7QraF1aLV8pBdZ1/dv35a
	hY6iOTapz/UpFiQ3PQWKi9I49Mb+RhqLb8Lv/Mwy1kxC3KINpjDnTZWHI0yHRZvc/z+/T8dG/e+
	9BjsgVZuDNnoSmHZRUQzmIgBEKhMrM2fulrwACVq68GnS9DZXikbfmSIERvRg8gyJnIqncMfQk8
	edTDLA+JcxzTwo4S4gKjZJPyw8q+FOTeI2iHEIMP+d9w2lijQWJ5pbEvu+s9cEyVFQLm7dPX93G
	Dnxeg7b0TQ5HZdOUT3ONHq7DqFfWtJs1SrZas1wiYLJHwM=
X-Received: by 2002:a17:90b:57e6:b0:38d:e658:5959 with SMTP id 98e67ed59e1d1-38fbc3e596cmr12071256a91.5.1785827109823;
        Tue, 04 Aug 2026 00:05:09 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38febfd8ff8sm859815a91.4.2026.08.04.00.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:05:09 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v3 0/3] watchdog: ma35d1: Add support for MA35D1 Watchdog
Date: Tue,  4 Aug 2026 15:03:48 +0800
Message-Id: <20260804070351.1846165-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_000510_901950_F8CDF311 
X-CRM114-Status: GOOD (  16.78  )
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

This patch series introduces watchdog timer support for the Nuvoton MA35D1
SoC platform.

The MA35D1 watchdog timer hardware provides a programmable countdown timer
capable of triggering a system reset upon timeout expiration or generating
an interrupt to wake up the system from low-power states.

Key features supported in this driver:
 - Standard watchdog operations (start, stop, ping, set_timeout).
 - Boot status detection to identify watchdog reset events (WDIOF_CARDRESET).
 - Power management support including suspend/resume and wakeup functionality.

Series breakdown:
 - Patch 1: Add DT binding documentation for Nuvoton MA35D1 watchdog.
 - Patch 2: Add the watchdog driver implementation for MA35D1.
 - Patch 3: Add the watchdog node in the MA35D1 SoC DeviceTree file.

Testing:
 - Tested on the Nuvoton MA35D1 development board using standard watchdog
   test utilities (e.g., watchdog-test from tools/testing/selftests/watchdog).

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
Changes in v3:
 - Added check for watchdog_hw_running in suspend/resume.
 - Add set_timeout in probe before devm_watchdog_register_device.
 - fix spelling mistake in Kconfig help text.
 - Drop redundant "binding" wording from patch 1 subject.

Changes in v2:
 - Added `watchdog_stop_on_reboot()` and `watchdog_stop_on_unregister()`.
Addressed automated review feedback (Sashiko AI) and reviewer comments:
 - Remove redundant 'struct device *dev' from driver private structure.
 - Add ma35d1_wdt_wait_sync() after writing WDTEN to REG_WDT_CTL in
   ma35d1_wdt_start().
 - Preserve wdt_dev->timeout when requested timeout exceeds hardware maximum.
 - Replace dev_pm_set_wake_irq with devm_pm_set_wake_irq.
 - Set WDOG_HW_RUNNING if watchdog was already enabled by bootloader.
 - Fix IRQ variable type from u32 to int.
 - Removed unnecessary `select MFD_SYSCON` from Kconfig.

 Note: RMW operations on REG_WDT_CTL have no runtime side-effects on W1C
       flags as IF/WKF are only utilized during PM suspend/resume window.

Zi-Yu Chen (3):
  dt-bindings: watchdog: Add MA35D1 Watchdog
  watchdog: Add Nuvoton MA35D1 watchdog driver support
  arm64: dts: nuvoton: Add WDT node for MA35D1 SoC

 .../bindings/watchdog/nuvoton,ma35d1-wdt.yaml |  55 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |   7 +
 drivers/watchdog/Kconfig                      |  10 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/ma35d1_wdt.c                 | 363 ++++++++++++++++++
 5 files changed, 436 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/nuvoton,ma35d1-wdt.yaml
 create mode 100644 drivers/watchdog/ma35d1_wdt.c

-- 
2.34.1


