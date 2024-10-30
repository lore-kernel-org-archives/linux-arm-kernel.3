Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B19D5CC95
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 11:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q4baBbCVw8LJX8VUsNI0iSX+HaRxJY9Q26lFxilz6/c=; b=JuX5wgyzbve9qOF0ioGzqvEKDo
	h3709tcxDn7sqbGCrZf0s2UKbIWdEiWhpPH86qbS/Ud3kIbgu86Aba/aCrBK5JJtLydLRhKrrfBD0
	RRyyQllv/pIuCEXzZxtM4hSi8jRHEdZJT6lFa3KqA3Az6nARkCW6PWtC4hCpH6Cmm+qCPs+pbZCZJ
	NK63KvFZ+kFGoXlIGB8/HrRlg+sjUzM60KAuzySXXcmiApfaSzsFh1+gVqi7k/ZKm2vMBHOnKPe4q
	o322iZ+12ZpKs1sbZMOww3AsvqQPLC46xICBY+Yp6Vf6KOJwvDRR4Crc18J8ZOeQOmSkBiih/oLo8
	jUHU+TFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t66gb-000000006EP-3Cbk;
	Wed, 30 Oct 2024 11:16:25 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t66SJ-000000003eo-2WCg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 11:01:41 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43159c9f617so60613255e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 04:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730286097; x=1730890897; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q4baBbCVw8LJX8VUsNI0iSX+HaRxJY9Q26lFxilz6/c=;
        b=jWOiba4zFV64NwjvnCqrUez/j7zdCUXjCy2gKKOWUf5i+KlwsW+aqJkdbYfGPRd2Hj
         qrxqMzdQM3S86519HQRHRGXU268Ve7FU6tTgwMYF9AyJvJtQKDLe5vKyyMnUvI6EtE5z
         hPFZ0CaJYL3tTxrGLYSCragBJloWhD2JXVfZH2hpoDPiXguNLgMfdCK+0TzN9SZJww1y
         qSOineBWXqtbsa+kM+7BFFukhdC7s6jAxCjyoPC0sJm5UGuzcni/xivuolKeXPvf7LkF
         yyHH/kTu4ZNbELapXK82R86uWBT0rBU0hgiqm/EFvmmqgUoaDrJFhazx655uWKT8Zd3b
         k7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730286097; x=1730890897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q4baBbCVw8LJX8VUsNI0iSX+HaRxJY9Q26lFxilz6/c=;
        b=shKGACtsOP7vmiuPVIixW5OuS/Um3X5WZCLY9EvM9teiaP2PLbsPnrPRn4PKJNc73y
         X6nfSgirpDN9E4LtVf3By7cYorfoa+RvsIe2pAjzFDuy/dDnslgrPjgghXSWptSwcJr0
         m5rhalhMH1i2mZIxUb+MXo3nJMo4dioq6wSWG7ZITjNEJx2eBZlIBkqO+fNBxJKOqJch
         AOiJwghmjGmi+nCqsJJTx/8KXju+pob9TFM4ihbB+DeCXYd+MdgrlN6Q9xg1ZC5R8/CS
         SUXzIrlPyM0nIZRo8CLoKTA3tpuMgceXvMW9i7eUpk+Jf0ny2SyqiAvNA1cIufopKSnD
         PYdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCV1vPfRCu30E4U9YWfTasBYu+F3TtXpmSZLPHP4NgH7CJNhfpUNUIBkRP6qBkoi4CthnPEEn8U6SjUfDwA7Fu@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9xc+KiNIuU0DB7Kv71wx+IKfTf6Ul7O4YlSvnvpgXPXgSfrd/
	nZTAMLonDnPMYe1Gb8iTs36Pf0dfVlTt32oCoUn0OeidkIubRScdV6YD6EukXyotI2EoGMzKyxt
	1
X-Google-Smtp-Source: AGHT+IHiBr5VSVHKI/wJl7b1DUkZ2teiuj8d/e6AL9/92akooeT1FxovY4Chln4pchEghqU1vcv7kQ==
X-Received: by 2002:a7b:c5cc:0:b0:428:1310:b6b5 with SMTP id 5b1f17b1804b1-431aa802774mr100247035e9.34.1730286097169;
        Wed, 30 Oct 2024 04:01:37 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd99edebsm17956935e9.45.2024.10.30.04.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:01:36 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 00/10] Add RTC support for the Renesas RZ/G3S SoC
Date: Wed, 30 Oct 2024 13:01:10 +0200
Message-Id: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_040139_827288_26A365D3 
X-CRM114-Status: GOOD (  25.82  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

On the Renesas RZ/G3S SoC the RTC clock is provided by the VBATTB
IP. A 32 KHz crystall oscillator could be connected to the VBATTB
input pins. The logic to control this clock (and pass it to RTC)
is inside the VBATTB IP. For this, the clk-vbattb driver was added
(patches 01-03/12).

Patches:
- 01-03/10: add VBATTB support that provides the RTC clock
- 04-05/10: add the RTC driver
- 06-09/10: update the device trees with proper nodes to enable RTC
-    10/10: enable proper config flags for RTC to work on RZ/G3S SoC

Merge strategy, if any:
- clock patches (01-03/10) need to go though the same tree because of
  patch 03/10 using the devm_clk_hw_register_gate_parent_hw() introduced
  in patch 02/12
- RTC patches (04-05/10) can go though RTC tree
- DTS and defconfig patches can go though Renesas tree

Thank you,
Claudiu Beznea

Changes in v5:
- dropped patches already applied
- fixed build on rtc yaml file
- fixed indentation in patch 01/10 description
- collected tags
- per patch changes are listed in individual patches

Changes in v4:
- added patches
  "dt-bindings: clock: r9a08g045-cpg: Add power domain ID for RTC"
  "clk: renesas: r9a08g045: Add power domain for RTC"
- squashed the following patches from v3:
  "Add clock IDs for the VBATTB controller"
  "dt-bindings: clock: renesas,r9a08g045-vbattb: Document VBATTB"
- fixed typos in commit description
- moved assigned-clocks, assigned-clock-parents from the RTC
  documentation to the VBATTB documentation; same adjustment has been
  done on the device tree patches
- renamed include/dt-bindings/clock/r9a08g045-vbattb.h to
  include/dt-bindings/clock/renesas,r9a08g045-vbattb.h
- used quartz-load-femtofarads
- used RTC_TIMESTAMP_BEGIN_2000 and RTC_TIMESTAMP_BEGIN_2099 in the RTC
  driver and added a comment in remove API to mention RTC cannot power
  on the system
- squashed defconfig patches
- collected tags
- per patch changes are listed in individual patches

Changes in v3:
- dropped patches "mfd: renesas-vbattb: Add a MFD driver for the Renesas
  VBATTB IP"
- added patches:
-- dt-bindings: clock: r9a08g045-vbattb: Add clock IDs for
   the VBATTB controller
-- clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
- moved Documentation/devicetree/bindings/mfd/renesas,r9a08g045-vbattb.yaml
  to Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
- addressed review comments
- per patch changes are listed in individual patches

Changes in v2:
- dropped patch "clk: renesas: r9a08g045: Add clock, reset and power domain
  support for the VBATTB IP" as it was already integrated
- kept only a documentation file for both VBATT MFD and clock drivers as
  suggested
- addressed review comments
- used cleanup.h lock helpers
- update startup sequence for the RTC driver
- switch to 24 hours mode on the RTC driver
- fixed range for the RTC driver
- added a generic compatible for the RTC driver as this will also be
  used by RZ/V2H
- used clkin/xin clock names for the VBATTB clock driver to determine
  if bypass should be configured on registers instead of having
  dedicated DT property
- added mfd driver for VBATTB
- updated Kconfig flag names to include vendor name
- removed DT node labels from Documentation files
- used items to describe the interrupts and clocks


Claudiu Beznea (10):
  dt-bindings: clock: renesas,r9a08g045-vbattb: Document VBATTB
  clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
  clk: renesas: clk-vbattb: Add VBATTB clock driver
  dt-bindings: rtc: renesas,rzg3s-rtc: Document the Renesas RTCA-3 IP
  rtc: renesas-rtca3: Add driver for RTCA-3 available on Renesas RZ/G3S
    SoC
  arm64: dts: renesas: r9a08g045: Add VBATTB node
  arm64: dts: renesas: r9a08g045: Add RTC node
  arm64: dts: renesas: rzg3s-smarc-som: Enable VBATTB
  arm64: dts: renesas: rzg3s-smarc-som: Enable RTC
  arm64: defconfig: Enable VBATTB clock and Renesas RTCA-3 flags

 .../clock/renesas,r9a08g045-vbattb.yaml       |  84 ++
 .../bindings/rtc/renesas,rz-rtca3.yaml        |  84 ++
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  34 +
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  16 +
 arch/arm64/configs/defconfig                  |   2 +
 drivers/clk/renesas/Kconfig                   |   4 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/clk-vbattb.c              | 205 ++++
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-renesas-rtca3.c               | 899 ++++++++++++++++++
 .../clock/renesas,r9a08g045-vbattb.h          |  13 +
 include/linux/clk-provider.h                  |  18 +
 14 files changed, 1379 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
 create mode 100644 drivers/clk/renesas/clk-vbattb.c
 create mode 100644 drivers/rtc/rtc-renesas-rtca3.c
 create mode 100644 include/dt-bindings/clock/renesas,r9a08g045-vbattb.h

-- 
2.39.2


