Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CB6C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 09:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XWkx9sDw2l9Oj12uX51/QV+iNNPhdJGAXVY8YBNeoPI=; b=fykaSi3vWWqxBXfDbgkPBB2vVh
	S+Nk3vVJKuk2RrQiPIZJE0MHD5Pz36n+Nnil0QqL3Zv14aZv+sAmvBY2Nk2rwUbOTRR7siNuaIs27
	yhsDmD91QtgfmODnovD1KLb0a4t+1vWawPJmviffRD5yiNoUZeM3vnlfY9XIIoh7kkeqvOPh8jgrJ
	gC5UhQUrdRUlxvOHJg0xhBiu6mnCoj0koxK20rKJZAM/kKffLyCbTFB6HT+a5o7kzb8CGat/i6b0V
	YxXZZwlTs4IjaU1G3i2gSmn+J9+J6vXMVUj7mCtqhEz2k0ZXRwt4CE1YSd8ONyIBgzLtH5oQnrAj2
	TGD1F05A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBzo-0000000FwSX-3YFg;
	Fri, 24 Jul 2026 09:15:08 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBzm-0000000FwRo-2R6b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 09:15:07 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so202170b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 02:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784884505; x=1785489305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XWkx9sDw2l9Oj12uX51/QV+iNNPhdJGAXVY8YBNeoPI=;
        b=FGdVCTUTx4VZyCPqwoDhCh7EHxd6rVjVLHOqhPc4NzPhF+BRKI6n0kOQsQJ5Uzl9Ju
         Or+dP+S6qaJkRWtAp3+VASP/+hoTySox+rm5Sc758cBJ5PejdTe8VfyVx4g3LQgS00dQ
         73Fgxix41BVGGNAV+4CWrXgYuQDmS7q04gtEkoeTOxbqWWi32hhP6BdKrfCQar3g/3zR
         e2GMDSCtYewZAFkg0X8HxSuaE5X879zvzE+3nmzlvPT0f7DLcr3kLHnfp0MsAYbyRDON
         d/qFmcj0hJLfRuRfEWXI0e5DJ8kCEMIkyFqsHcPaIx+Ypris+e4gOOIrRQHZDmVdxtVv
         Ewvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784884505; x=1785489305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XWkx9sDw2l9Oj12uX51/QV+iNNPhdJGAXVY8YBNeoPI=;
        b=X8TH6m+s+bcIgqCMzKY7/TlZFLZScFM2qC9AO4q66hOtooN48XjYapvvGlItnorBXH
         ejiBUH7sJj4dUKCRLwRrDCqQquLJ3FQoa8eSuo2LFiYgl+/C8CDu3ojPm8j8u0Ja7Hsw
         q6FEzs/U6fLeMSXeArk/TnKv9/JshY2AX90sR1Dw2AwfWMv3U07E92ZimLVNsr18zZ+Z
         NQouBgM96qgO6ZaxrTvNddVAWpzW2nyCNTcSUJNavwNCVyvmcXb4bQ6awSbXHRivvnxe
         1fArUAQu7Ff7ZRqYF9sOvh9K6XqT0BYxWJYog4Gb0AnCEJRbXT5UQmkmpG8xLTNq1ZyB
         Ao3A==
X-Forwarded-Encrypted: i=1; AHgh+Rq+TN972TPxpeMt0fbnRXGj3OC4jDiTGD1IcN27a+eHkZo+OjTKTEwe7T905BQN1ObNc8zwEYOMRCMOMCTIISrk@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2qNVTCvAw0H7s8S3zc5hDxCOopwmylzoV1JkPZRMXC7ZWTQx+
	QXp8+3X/AAhlS1khYeO1LEFhQDEYAplgPBtbC8a7OmAoHB2SraYTFxOa
X-Gm-Gg: AR+sD13xrOGd4ZdyUknFA9nq0O3ow7ihCD98JedfZxeAnOEXh4QaN31Jg958ApfxnpR
	4O6iVLNccwSPLxkYTl33sybtcnJqdUC9+aY6U27/wWLyoTOz1iCi3ToZxvfmZ4gAkdbblUay5P5
	2QFhYTTwD8lMks1f7f/FIjUCcWrB64Hma2HKbZ+CkW6EUZnpkGTgHNwtEM7BY6HgYR4AKUDqeVA
	Tl/d25SubVwd6oq+64OifLcZ35QbX2HRI2M4ZGlJ6mhwpdJjmWOpW1eVQVMy0vJj+UU3x68ZCOS
	xC7Fn/aRAOdbBHZD/YC0rQ9XKq72uPPb1moXDr6Gr49PnTFydx/E0mzqr85tZuRqM5Q8C9n/T7I
	Zs2cwL0RpOJIqukOodwl8jpL95OocwzT2sIA25v1bcnXB28XwE1sTOSYqifCdv7DyE/DG/K9pm8
	+M3WsCEaW6pc6TtFfHPpUb/q3xmNkK5KDeJD/GHhTTEv5IMze02QKe7TuGO2i1
X-Received: by 2002:a05:6a00:1bcb:b0:848:587f:8acc with SMTP id d2e1a72fcca58-84e2c20833amr7114627b3a.54.1784884505358;
        Fri, 24 Jul 2026 02:15:05 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17237c3fsm4410519b3a.9.2026.07.24.02.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:15:05 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v2 0/3] watchdog: ma35d1: Add support for MA35D1 Watchdog
Date: Fri, 24 Jul 2026 17:14:24 +0800
Message-Id: <20260724091427.1689980-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_021506_647132_27610AE4 
X-CRM114-Status: GOOD (  15.39  )
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
  dt-bindings: watchdog: Add MA35D1 Watchdog binding
  watchdog: Add Nuvoton MA35D1 watchdog driver support
  arm64: dts: nuvoton: Add WDT node for MA35D1 SoC

 .../bindings/watchdog/nuvoton,ma35d1-wdt.yaml |  55 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |   7 +
 drivers/watchdog/Kconfig                      |  10 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/ma35d1_wdt.c                 | 358 ++++++++++++++++++
 5 files changed, 431 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/nuvoton,ma35d1-wdt.yaml
 create mode 100644 drivers/watchdog/ma35d1_wdt.c

-- 
2.34.1


