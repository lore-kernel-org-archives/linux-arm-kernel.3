Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BFDC44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yoY75yqFw5mb7tU/+ruk6fsKo/hettBezB5T0NFLox0=; b=vPJr/kmMXeU9TJhBFXSDxjiXu8
	ORsWf1Xne1DHln9GWNaPSHDUNXIoIr4800zWtbXH5pPlbljSpaLvd15CdSwjIA+0LegZQWqXc82mg
	IrFpK5W1SY/z2LSxwHL6o1xx1YCAOnTy9RdZnlYyuNNGRSWnCOUClKZihJRZGJ8vRVES68e7++Pzf
	SxmJYT+ZTgouriFuOVwExIROGkV9y4tgNTZZ95YKSgcGZyq0f6QkV3LpWIt6SxS2rEr2Cv91uBEKR
	gyD3E9qaAPzc89ATseRb/qWTG264COJyvc7H38m8+GJtTAJ88CBska5GGe8ZGZMMVBnxFr68Lasw+
	TZXS1n0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiwJ-0000000D80T-2dzz;
	Tue, 14 Jul 2026 19:37:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiwI-0000000D7zi-2l4N
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jul 2026 19:37:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=yoY75yqFw5mb7tU/+ruk6fsKo/hettBezB5T0NFLox0=; b=l347JcH51XOM34i8zs/yUwox8Z
	32K8tvqqeC+E5Ef4QYbjycTidXoIG5ttu91asHEiGS3ex166i8UPK1VgRGny/rkFHjq7LtAZDuQi4
	21UEvrRH4aShp0FWHKc6tpGvqlnqGca8dXvPxZoiVxqnI1D4FtMYhKzLnCMgbgvufrwt/e1QfPC/M
	HymvBIA2SWT4S4Ue5Ms2kl0xWjEcPJii9HdlMTgRsVyVxPHR7hXhU5o085u0vBUqjy6kb/yroUoU6
	xWoKNWr7OBzkwyghPRshsIwOD5Z5nE9vWgD38X8U6ohAsH/l9+3k+IfpajYpKMbi4WtM7BYfq9U/Q
	IW05c1cw==;
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjiwE-0000000CokF-2RtF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 19:37:09 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7e9f69ee6f4so1012464a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 12:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784057823; x=1784662623; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yoY75yqFw5mb7tU/+ruk6fsKo/hettBezB5T0NFLox0=;
        b=LB05mXtBzj1JT0J15f+tdyIU1iydAZeG506mF9YdZV9MUJvxlcZ8yzvrNE99IPIPw9
         A5vW2CAZRM/oedFNasUvzp3x2DugwhXA/Zh2OQDk7iZeoVB7l1rlR7EAJ9ES8jH4SHkZ
         iV74xWVkfJVkPJMshp0DEwI8eYO2tcmvwzE7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057823; x=1784662623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yoY75yqFw5mb7tU/+ruk6fsKo/hettBezB5T0NFLox0=;
        b=CQ4g3cBuYnbUj6OPJqChstKFe5g/BhDDwLxmwjc6HZiwCAccTcyI9eLjSlSgB34T80
         iUNwBqSom3E5OdGpKZR5TD5Wousuop0lH9dn3E3iaDm9i92HuD5b2Dwfpa2gQTB4WLbf
         wWBtzfrMXeAsJNAEaS83wnSWTFmYHXMTE1ydj7S/DJ4ieZqHG1ae3DlniClFm/fljcyO
         5KrPOD+u/80jCcUzfnVhn285DhFbB42TftEV1aIGMJH6NMJB7sebAfM3kDTaZEju8znD
         7gN4ADMbzrjzgXNWirlXZIgOGP2VJ3rQFAuUjntlW5J/hySJdXCGiw17d4lE4U0iSo7t
         9HJg==
X-Forwarded-Encrypted: i=1; AFNElJ8BoZ0pZQcY1CYO2pUIa+bYYmYShcwrTQD1SEsvKBbvyK7fiPX5Zpii9CIRRdOza2ZvcCO+K0gNX00oPW//Sh26@lists.infradead.org
X-Gm-Message-State: AOJu0YxnisTS94SNlUt6cMNGr3B11Dkx2NL/RiSWFz3IYVs/CAANrBnZ
	eG8m0ME4liiGrH1CEK3cLUqHNjT0lSm5Pg0/QdHL+H71yKh6zmfEIqGszZ5TtcRzow==
X-Gm-Gg: AfdE7clPeUa3uQnRrMOXhD/YWniTYgGkcTrifeLfq5WoecDZezg0FKwq+mK8OoUnlDs
	E1mCuG5fstKX8JKZX/aZPJrvBglDb4TerPYL4QdUA3x175uIsLm5FtI9BiswurZXm397pypouUF
	hQZB+toAYz5BCsiRqf+9xUE2S4x+fQgcawWSS44sUI+S5SNl1CSJxjC10Xb8FUB1Yds5D9e8Y/1
	27VGYylQm7AjIfI9ZL7PequDSuFi0nZKViZJ46kObzXB9PS+Ag/gQ34J3+hc3JImI4IkUHn2iri
	MUCQlCjlTYCEyRdYzgFKtg5RLu5xBd9pT++dEFjmVu29WVfi8NQcBW4PB8FB6fT8mbOFGT5xlhE
	8xBkvjRh53//GmS/2harFpBUZb8/mE2CHaLxjUNcp1KkG9mbN2VqhVKJOV+/sGrEpVeCdTy7F3+
	xBrjohNegk2N9iEcRppQ==
X-Received: by 2002:a05:6830:2306:b0:7e9:ead3:4449 with SMTP id 46e09a7af769-7ec0967b3e2mr9214494a34.6.1784057823394;
        Tue, 14 Jul 2026 12:37:03 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcaf742e1sm16004026a34.8.2026.07.14.12.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:37:02 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Fabio Estevam <festevam@nabladev.com>,
	devicetree@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Albert Aribaud <albert.u.boot@aribaud.net>,
	Bartosz Golaszewski <brgl@kernel.org>,
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
Subject: [PATCH v2 0/6] Add support for the Rockchip RV1106 and RV1103
Date: Tue, 14 Jul 2026 13:36:37 -0600
Message-ID: <20260714193656.2196447-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_203707_329065_A14BAFC2 
X-CRM114-Status: GOOD (  19.63  )
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

This v2 is re-tested on the Luckfox Pico Mini B: the kernel boots to
the rootfs wait with a working console on UART2, timers, pinctrl and
GPIO, and an SD card running at high speed. It builds with W=1 without
warnings and dt_binding_check and dtbs_check are clean.

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
 .../devicetree/bindings/soc/rockchip/grf.yaml |    2 +
 arch/arm/boot/dts/rockchip/Makefile           |    1 +
 .../rockchip/rv1103-luckfox-pico-mini-b.dts   |   93 ++
 arch/arm/boot/dts/rockchip/rv1103.dtsi        |   16 +
 .../arm/boot/dts/rockchip/rv1106-pinctrl.dtsi | 1398 +++++++++++++++++
 arch/arm/boot/dts/rockchip/rv1106.dtsi        |  321 ++++
 drivers/clk/rockchip/Kconfig                  |    7 +
 drivers/clk/rockchip/Makefile                 |    1 +
 drivers/clk/rockchip/clk-rv1106.c             | 1100 +++++++++++++
 .../dt-bindings/clock/rockchip,rv1106-cru.h   |  300 ++++
 12 files changed, 3304 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.yaml
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rv1106-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rv1106.dtsi
 create mode 100644 drivers/clk/rockchip/clk-rv1106.c
 create mode 100644 include/dt-bindings/clock/rockchip,rv1106-cru.h

---
base-commit: 3b029c035b34bbc693405ddf759f0e9b920c27f1
branch: rv1106a2

-- 
2.43.0


