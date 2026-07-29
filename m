Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D072BC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 13:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VUY5prEZuzu079/ijehiQd7Jr/No0FbniJJt1eZlTEs=; b=QHQNG3OA/1ZYK0nxyetuzttBQ5
	yYb9iTeXkuJaXJ6Idx6S4IfRPKApYih/v7La3VYxyNiNUGmUsUj81xvBbieVpJ6v6yE9a8orwIVE/
	tR3+bG2Iu25OdtZH+gO6H8CQIwjCCmBPGxTPPeUy0Ylutuo/L4nx6AqY8rq/ScmXUKF7VPU/JhAfR
	8AsFRp1RG5HBpeEVuaW3Qopc72FGYHJbvTyygTgCurh4/GXLV1DyAXKCT4MOLPGxsI8kMJWMcjluK
	C6H6PwsUWl8WzHAY1k3JT6vLZIRbUfySi0/NopzQ6E/L70HAGr2Ghek5JZlFMRQRBUkiKmIVmYwP1
	A9sE74Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4SP-000000087hj-2BmM;
	Wed, 29 Jul 2026 13:36:25 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4SL-000000087g1-2xgO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 13:36:23 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-6aca0f482e5so655876eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 06:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785332181; x=1785936981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VUY5prEZuzu079/ijehiQd7Jr/No0FbniJJt1eZlTEs=;
        b=KiyVzRf/dV3CgWUH1+3FAk9gAPY0ctvv6IPixxuW/6DrFpWPSa8LF+k/j4eLGHfpsW
         7eRuiP45FIpESFcyFuFghF0IUuJrZ4916K2ATBT9VH9WfmPTHOotQ1MEpLBYLOIHuN5X
         9WxtW59ArbzE3yC3yxZmWcaR6WIacS1Z1VWqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785332181; x=1785936981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VUY5prEZuzu079/ijehiQd7Jr/No0FbniJJt1eZlTEs=;
        b=YYZSVA32/4Cr0R2zOuIycKh96uVVajsUHMBrQl9GE21ISI4/gjAsyutkPTUwE0MdfX
         rQk+O/izTCjkt1w2Q/Z8aTO2xmNW84RsNpSz+FVUyxrwx1+alLh8lMl8FwqM2U2j9ZGo
         tgjZLvbt5O2jAUm0VIxoEoZw3XlCEAi84aayFpQt6y38QnuDOjknW0gPwKsJ+0jmji9x
         E/8nZ6BqrVRmo33EET0sakGaQxbsd+PwExUK/uopX/QkZATqGY6OE2nB/WBGCMsdi/w5
         H97exPlb0V0k3uflIU21q3GxqCDsEdujy2Z6TQ0009eZEj8PB/eRr0F1Jkv4dDT4MQVa
         9UCA==
X-Forwarded-Encrypted: i=1; AHgh+Rr6HIH5UwA+DtXn4cKueUnWSF6JZaEQY5jcAndWY53OCgVNw80aUTwgZwP4nHqw3Y/gayX6a+1GcKEfoObEQJXI@lists.infradead.org
X-Gm-Message-State: AOJu0YzhZug2m3UnggHMfzo2IpnTWU1ao+rJ1sINs0zZ6LQyWjEkFTyQ
	Pdd8iIJQC+EIs/YyMAzS32EHKfeFmsAsDSDPou6+YjXbPSHQlpIEPCJHBlXHGlPBLg==
X-Gm-Gg: AR+sD11yUUA+cqMlnBRAacDX6EvPUjUo7NmFwCtVbFadhWIoUFET5CsnCp9ywpT5fby
	yYWChC6+ziNiAo1iwV43UsISlMk/mPAV+T/+qBYMesD6rqIIvucZf++o9Yu8DsJ4DjGzTMFEbxQ
	byQWjClmjN1vQnQD1zLESaqiCMFX9F2Okvz9xItiVqL6TmT/AQSLXV7PFd4SVurzFJKOaDy9Hce
	vc/jDgcKhrIgiVY2Xo28lM7tNWuyBOx0oNjfAaYUKdLwsIVPmQV+mOPK8MddEFLmqVFYKjNzaj7
	UzhGcMPmjyhM4cHvE9rSc06DMPmhYtE1BzvgU53R9uoEg2ySlXz5GbQk4ux2DFT1T4W93TrGqXh
	WxWQGTAMlbwAH0+ybZ4ramA1nWf96G9rmDD9Z+Wf4yJV+lE44MWLbB7ue1Cgs+CZUBYaRQtC965
	hPIvKnDXrTTaJi8bX48A3Hxn+6X3y30eRUevfD2gA3E8zr3Y9J0MBmkRo=
X-Received: by 2002:a05:6820:189b:b0:6a1:7644:772f with SMTP id 006d021491bc7-6ac96d4e889mr3116221eaf.63.1785332180763;
        Wed, 29 Jul 2026 06:36:20 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aca527fe83sm1956196eaf.6.2026.07.29.06.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 06:36:19 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Fabio Estevam <festevam@nabladev.com>,
	linux-rockchip@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Albert Aribaud <albert.u.boot@aribaud.net>,
	Brian Masney <bmasney@redhat.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yao Zi <ziyao@disroot.org>,
	huang lin <hl@rock-chips.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] Add support for the Rockchip RV1106 and RV1103
Date: Wed, 29 Jul 2026 07:35:47 -0600
Message-ID: <20260729133609.3465563-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_063621_785207_72DD7FA6 
X-CRM114-Status: GOOD (  20.51  )
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

This series adds initial support for the Rockchip RV1106, a Cortex-A7
SoC aimed at IP cameras, and its RV1103 package variant, together with
the Luckfox Pico Mini B, a small and widely available RV1103 board.

The series follows the structure of the recently merged RV1103B
support. The clock driver is ported from the vendor kernel and is the
work of Elaine Zhang. As with the RV1103B, no resets are exposed yet
and the CPU pvtpll is initialised but not calibrated.

Following feedback on v1, several parts have been split out into
separate series: the pinctrl driver and binding, and the serial,
watchdog and iio bindings, are submitted separately to their
maintainers. The mmc binding is already applied for mmc-next. This
series carries the clock support, the GRF compatibles and the
devicetrees, which depend on the clock binding header.

The devicetrees cover the devices needed for a basic system: UARTs,
SD/eMMC, the SPI flash controller, SARADC, watchdog, GPIO and pinctrl.

This v3 is re-tested on the Luckfox Pico Mini B: the kernel boots to
the rootfs wait with a working console on UART2, timers, pinctrl and
GPIO, and an SD card running at high speed. It builds with W=1 without
warnings and dt_binding_check and dtbs_check are clean.

Changes in v3:
- Add IDs for the internal clocks, so that anonymous branches cannot
  overwrite the APLL entry in the clock array
- Register the CRU as a platform driver, like the RK3528
- Give the internal clocks real IDs so that they cannot overwrite the
  APLL entry in the clock array
- Drop the pre-mux write of the alternate divider, which overwrites the
  safe divider calculated by the CPU clock framework, and the post-mux
  write, which duplicates the framework's own clean-up
- Add CLK_SET_RATE_PARENT to clk_vicap_m1_frac, matching m0
- Use a separate compatible for each GPIO IOC block, since their
  register layouts differ
- Use the per-bank IOC compatibles
- Place the entry with the other Luckfox boards, in alphabetical order

Changes in v2:
- Renumber the clock IDs to be continuous, starting from 0
- Provide the MMC phase clocks from the CRU rather than a grf-cru
- Mention the MMC phase clocks in the rockchip,grf description
- Provide the MMC phase clocks from the CRU via an auxiliary GRF regmap
  rather than from a separate grf-cru clock provider
- Drop the grf-cru clock-controller child and use the syscon-only
  group for the main GRF, since the CRU now provides the MMC phase
  clocks
- Use a single gpio-ioc compatible for the per-bank IOC blocks in
  place of the ioc and pmuioc regions
- Take the MMC drive and sample phase clocks from the CRU and drop the
  grf-cru node
- Give each GPIO bank a syscon for its own IOC block, referenced by a
  rockchip,grf phandle in the bank node
- Add gpio aliases, which the pin controller and gpio drivers use to
  identify the bank; the rv1103 removes the gpio2 alias
- Split the series by subsystem: pinctrl, serial, watchdog and iio are
  now submitted separately
- Drop patch 'dt-bindings: mmc: rockchip-dw-mshc: Add RV1106
  compatible', which is applied for mmc-next

Simon Glass (6):
  dt-bindings: clock: rockchip: Add RV1106 CRU support
  clk: rockchip: Add clock controller for the RV1106
  dt-bindings: soc: rockchip: grf: Add RV1106 compatibles
  ARM: dts: rockchip: Add support for RV1106 and RV1103
  dt-bindings: arm: rockchip: Add Luckfox Pico Mini B
  ARM: dts: rockchip: Add Luckfox Pico Mini B

 .../devicetree/bindings/arm/rockchip.yaml     |    5 +
 .../bindings/clock/rockchip,rv1106-cru.yaml   |   60 +
 .../devicetree/bindings/soc/rockchip/grf.yaml |    6 +
 arch/arm/boot/dts/rockchip/Makefile           |    1 +
 .../rockchip/rv1103-luckfox-pico-mini-b.dts   |   93 ++
 arch/arm/boot/dts/rockchip/rv1103.dtsi        |   16 +
 .../arm/boot/dts/rockchip/rv1106-pinctrl.dtsi | 1398 +++++++++++++++++
 arch/arm/boot/dts/rockchip/rv1106.dtsi        |  321 ++++
 drivers/clk/rockchip/Kconfig                  |    7 +
 drivers/clk/rockchip/Makefile                 |    1 +
 drivers/clk/rockchip/clk-rv1106.c             | 1099 +++++++++++++
 .../dt-bindings/clock/rockchip,rv1106-cru.h   |  306 ++++
 12 files changed, 3313 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.yaml
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rv1106-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rv1106.dtsi
 create mode 100644 drivers/clk/rockchip/clk-rv1106.c
 create mode 100644 include/dt-bindings/clock/rockchip,rv1106-cru.h

---
base-commit: fc02acf6ac0ccde0c805c2daa9148683cdd01ba8
branch: rv1106a3

-- 
2.43.0


