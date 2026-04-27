Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A99FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 21:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6Y7WZoOaL5XpQeMokBemc3GxIU4ukhNWflL/DLGDOhI=; b=4sTtfxtBjw8Uwg
	VOAX1Kq8GfvOU6Y9CaJVwYKJebuw4oUQ07pXRgRaV9Eazwzn2/apytY9ZM6KKN+4cAOJXFVyXEuLr
	0cvGqLmq7tp8hnr1BD++8qjy8PJ+kZt0Jb2lALma6X2+07MNWkOBZ1V+K7cpE3qBKPpJltqceEbSD
	vcid2wtZdBJ3axhW0JhvWCMySQUIAGk68F74NKF6vUvKemvUPj5rYriQT+qummC0ry/3c8Eq0EYyT
	2Wf8dOJM6bLBwnqJVLVxOy05/aHjIvACjF28BmAlibAskHbHsb1Hin393/3LX7YrQktFPekhXliuG
	5+xMub5Tlfq3yDGmagOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTxd-00000000DFy-0iSp;
	Mon, 27 Apr 2026 21:57:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTxZ-00000000DET-3gdx;
	Mon, 27 Apr 2026 21:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777327062;
	bh=uWU06PV+eLEGXA1QlwT32JGIwdV2LTYGAZ+bIHKDUeM=;
	h=From:Subject:Date:To:Cc:From;
	b=RWuZw4x0YkQlS2q1np47mdToA2QJD+dl99IQxojZkAoK1l3OHZHdLhnCxGdqjqna/
	 lhwBplktTtQ980RzspFcW8Wf0EGvecVXM+RmqRsmADWidzmch6tTc++iSTO7vTw/DT
	 6NnZ7RYbYJ/zMFqxzMut9jH/Ds3VrtfBDMLCru6essIGb6jkTmMXey23GxMr2dnWJ2
	 qibMI6+VKw7dKfeoGzq2SbyDcwtDtzGR0WfMg0dXzeUL5X0NM3Kvt7tQACI4oN5mo1
	 SBjDL6rg2jN4Cun+5RIF5yjwC6BUWeFhj5+X2JyttKraUWYVqK85h5qRh6MOcKsaAT
	 aCzAaA0OChpMA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A3B1017E0D23;
	Mon, 27 Apr 2026 23:57:42 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v2 00/13] arm64: dts: rockchip: Wire up frl-enable-gpios
 for RK3576/RK3588 boards
Date: Tue, 28 Apr 2026 00:57:18 +0300
Message-Id: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr2K6dkyLitaV9zAs2ukUqpWSDhIN4
 e4CHsDlS95/fxRMORCLy2YUmYbAIbUzFNuNwMa0NUFwM4tCFqU8qBO4niE/wOcI1BobCeouJAY
 krffSWX9EI+Z1l8mH91q+VT/ml70T9ktuMZrAfcqf9XpQi/f/ZVAgwSiN0rkzal9eMcVobMpmh
 +kpqmmavgURTqvUAAAA
X-Change-ID: 20260417-dts-rk-frl-enable-gpios-ce9930dbf5ca
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_145746_264627_744391F6 
X-CRM114-Status: GOOD (  16.79  )
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

Several boards based on the RK3576 and RK3588(S) SoCs use a
GPIO-controlled voltage bias circuit on the HDMI data lines that must be
switched according to the active link mode: asserted for HDMI 2.1 FRL
and deasserted for HDMI 1.4/2.0 TMDS.

This series adds the frl-enable-gpios property to the HDMI nodes of all
boards for which the GPIO configuration could be identified from vendor
BSP kernel sources and/or schematics where available.  In a small number
of cases it was necessary to extract and disassemble the DTB from the
vendor firmware image.

One board remains unhandled (rk3588-edgeble-neu6a-io), pending
clarification from the vendor.

For each affected board the patches:
- set frl-enable-gpios with the appropriate GPIO reference and
  GPIO_ACTIVE_LOW polarity (inverted relative to the BSP enable-gpios /
  GPIO_ACTIVE_HIGH convention, which effectively acts as
  tmds-enable-gpios)
- extend pinctrl-0 of the HDMI node to include the new pin group
- add the corresponding pinctrl definition under &pinctrl

It's worth noting the Rockchip platform glue driver for the DesignWare
HDMI QP TX controller already drives the frl-enable GPIO, but since FRL
is not yet supported, TMDS mode is unconditionally selected.  This
ensures a consistent setup independent of hardware reset defaults and
bootloader state.

Furthermore, this allows removing a few DT quirks hardcoding the active
link mode and paves the way for a follow-up series enabling HDMI 2.1 FRL
support.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Squashed common changes into one patch per SoC; the more invasive
  changes remain in board specific patches
- Ensured overridden pinctrl-0 properties in the hdmi nodes are followed
  by the pinctrl-names property
- Move the newly introduced frl-enable-gpios entries before pinctrl-*,
  to keep the items ordered alphabetically
- Renamed hdmi[0-1]?-frl-en pinmux nodes to hdmi[0-1]?-tx-on-h, to match
  the naming commonly used in boards schematics
- Added a new patch to drop unnecessary #{address,size}-cells from
  rk3588-jaguar
- Added patches to provide the missing pinctrl-names to pinctrl-N
  overrides for all non-hdmi nodes, e.g. i2c, i2s, pcie, pwm, sdmmc,
  spdif, spi, uart, etc
- Rebased series onto next-20260427
- Link to v1: https://patch.msgid.link/20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com

---
Cristian Ciocaltea (13):
      arm64: dts: rockchip: Add frl-enable-gpios to rk3576 boards
      arm64: dts: rockchip: Add frl-enable-gpios to rk3576-luckfox-core3576
      arm64: dts: rockchip: Add frl-enable-gpios to rk3576-nanopi-r76s
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588 boards
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588s boards
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-gameforce-ace
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-khadas-edge2
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-orangepi-cm5-base
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-roc-pc
      arm64: dts: rockchip: Drop unnecessary #{address,size}-cells from rk3588-jaguar
      arm64: dts: rockchip: Add missing pinctrl-names to rk3576 boards
      arm64: dts: rockchip: Add missing pinctrl-names to rk3588 boards
      arm64: dts: rockchip: Add missing pinctrl-names to rk3588s boards

 .../boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts | 10 +++++++++
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 10 +++++++++
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   |  9 ++++++++
 arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts   |  9 ++++++++
 .../boot/dts/rockchip/rk3576-luckfox-core3576.dtsi | 22 ++++----------------
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts  |  9 ++++++++
 .../arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts | 16 +++------------
 arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts     | 10 +++++++++
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts    | 10 +++++++++
 .../boot/dts/rockchip/rk3588-armsom-sige7.dts      | 11 ++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts  | 19 +++++++++++++++++
 .../boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts    | 18 +++++++++++++++-
 .../dts/rockchip/rk3588-coolpi-cm5-genbook.dts     | 12 ++++++++++-
 .../arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi |  4 ++++
 .../boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts   | 20 ++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts   | 11 ++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-fet3588-c.dtsi |  1 +
 .../dts/rockchip/rk3588-firefly-core-3588j.dtsi    |  1 +
 .../dts/rockchip/rk3588-firefly-icore-3588q.dtsi   |  1 +
 .../boot/dts/rockchip/rk3588-firefly-itx-3588j.dts | 12 +++++++++++
 .../rockchip/rk3588-friendlyelec-cm3588-nas.dts    | 18 ++++++++++++++++
 .../arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts | 11 ++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     | 24 +++++++++++++++-------
 .../arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts | 12 +++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 21 +++++++++++++++++++
 .../boot/dts/rockchip/rk3588-orangepi-5-max.dts    | 18 ++++++++++++++--
 .../boot/dts/rockchip/rk3588-orangepi-5-plus.dts   | 20 ++++++++++++++++++
 .../boot/dts/rockchip/rk3588-orangepi-5-ultra.dts  | 11 ++++++++--
 .../arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts     | 19 +++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts | 12 ++++++++++-
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   | 19 ++++++++++++++++-
 .../boot/dts/rockchip/rk3588-tiger-haikou.dts      |  4 +++-
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     | 20 ++++++++++++++++--
 .../arm64/boot/dts/rockchip/rk3588-toybrick-x0.dts |  1 +
 .../arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi |  2 ++
 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts | 16 +++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts  |  1 +
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts    | 15 +++++++++-----
 .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts  | 13 +++++++++++-
 .../boot/dts/rockchip/rk3588s-khadas-edge2.dts     | 15 ++++++++++----
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 11 ++++++++++
 arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts | 10 +++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi      | 11 ++++++++++
 .../dts/rockchip/rk3588s-orangepi-cm5-base.dts     | 12 +++++++----
 .../boot/dts/rockchip/rk3588s-orangepi-cm5.dtsi    |  3 +++
 .../boot/dts/rockchip/rk3588s-radxa-cm5-io.dts     | 10 +++++++++
 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts    | 17 ++++++++++++---
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts   | 13 ++++++++++--
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts   | 13 ++++++++++--
 51 files changed, 519 insertions(+), 70 deletions(-)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260417-dts-rk-frl-enable-gpios-ce9930dbf5ca


