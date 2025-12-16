Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D941BD5E12E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 11:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4kLGH3W9CRPvlSHMuYo7bafMtREMUmy74t3ou4jJCw4=; b=JPYaB+sXXUw2HHtnqpW/GRMOyC
	aNpn0QesO/HQbVnBEgf7LUg6CjA3u852n8S0D9pmQ19wcUs6sVJs+/3WT58eswXX0DGz4lHyPTKzl
	siQgxbbAEkEyXa+dTsMpO7k5WfhlzOrNqptWerCoxU+wvBXoC0ktNW1qXtqW+vUizTH+25G4r3lTF
	TIEzenVsXLf1fFz+U0YPZq39Onnzn1F7myUun+/pgQ+nak2AQhTpqQyDMzLmkClKRRg6sFUtDYd05
	BLHp+UjRWpPlrxI0Zd8h7Qu/xZY9ObfyR3zveqerrKFqsqyl5zf1FWxmPgCiuFEafwQVUTEg+g0rv
	+KNsSu4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVT7i-0000000577V-05bh;
	Tue, 16 Dec 2025 11:21:46 +0000
Received: from mail-m49222.qiye.163.com ([45.254.49.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVT7d-000000056ga-3m5W;
	Tue, 16 Dec 2025 11:21:44 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2d6ee1f8a;
	Tue, 16 Dec 2025 19:20:54 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com
Subject: [PATCH v3 0/7] pinctrl: rockchip: Add RK3506 and RV1126B pinctrl and RMIO support
Date: Tue, 16 Dec 2025 19:20:46 +0800
Message-Id: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b26e44a7f09d8kunm7ab62e1d2a7b102
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0xCGVYfHhpPQ01MTUNDTRpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=PM3HT6vHKkrd+ZNtMf38L3ESv1LeBysidyL+GMMd2Wouwm5QLl8Fl1HG1+mFbEPzsqqWdHX4T18bVniz4uD4j3BNjt+G8KqByc9x7RXrKtYsBnqEUmq5N4SbuZJ85eTgdWvI9zFhwQRzw9suBIzC5zM5vLQvz0wIO+MiJMwNH1k=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=4kLGH3W9CRPvlSHMuYo7bafMtREMUmy74t3ou4jJCw4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_032143_092879_99AD89F0 
X-CRM114-Status: GOOD (  12.42  )
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

This series adds pinctrl support for the Rockchip RK3506 and RV1126B SoC,
and adds support for RMIO (Rockchip Matrix I/O).

The series includes:
- RK3506 pinctrl driver implementation
- RV1126B pinctrl driver implementation
- RMIO controller binding and driver support
- GPIO driver update to support new version GPIO

Note on grouping:
The RV1126B support patches are included in this series because the RV1126B
pinctrl driver implementation depends on the PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS
macro, which is introduced in the RK3506 support patches. Splitting these
patches into separate series would break the build for RV1126B if applied
independently.

Changes in v3:
- Drop already merged patches (rk3506 basic support).
- Remove unhelpful mappings in rockchip,rk3506-rmio.h
- Improve YAML schema: fix constraints and examples for RMIO.

Changes in v2:
- Added RV1126B pinctrl support (patches 3 and 4)
- Updated GPIO driver to support new version GPIO (patch 5)
- Added header file for RK3506 RMIO (patch 6)
- RMIO is now implemented as a separate pinctrl device (patches 7, 8)

Ye Zhang (7):
  pinctrl: rockchip: Add rk3506 pinctrl support
  dt-bindings: pinctrl: Add rv1126b pinctrl support
  pinctrl: rockchip: Add rv1126b pinctrl support
  arm64: dts: rockchip: rv1126b: Add pinconf and pinctrl dtsi for
    rv1126b
  gpio: rockchip: support new version GPIO
  dt-bindings: pinctrl: rockchip: Add RMIO controller binding
  pinctrl: rockchip: add rmio support

 .../bindings/pinctrl/rockchip,pinctrl.yaml    |   10 +
 .../bindings/pinctrl/rockchip,rmio.yaml       |  106 +
 .../boot/dts/rockchip/rv1126b-pinconf.dtsi    |  660 ++++
 .../boot/dts/rockchip/rv1126b-pinctrl.dtsi    | 3218 +++++++++++++++++
 drivers/gpio/gpio-rockchip.c                  |    2 +
 drivers/pinctrl/pinctrl-rockchip.c            | 1192 +++++-
 drivers/pinctrl/pinctrl-rockchip.h            |   47 +
 .../pinctrl/rockchip,rk3506-rmio.h            |  109 +
 8 files changed, 5250 insertions(+), 94 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml
 create mode 100644 arch/arm64/boot/dts/rockchip/rv1126b-pinconf.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rv1126b-pinctrl.dtsi
 create mode 100644 include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h

-- 
2.34.1


