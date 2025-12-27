Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFF0E92710
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 11:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dV28SK6+Gm42e/jjqz4QnjJtKhxGLkRJ5zgDMZyozSI=; b=UJreK7xnr02kAWsWeDZkhHJ0us
	PeztTt8d5TBGRrmZ1315GdyCg8TCervFXUfUG3MPN3t6j6a+kJHZydPH+jt8s5GK7ouoQd7tRdYE3
	22QVj9ZduwRhNGVKq40UL/m5WlbT4WmwUaEb6wlBRdHROEKyVNNaP8Hetwy7M/fsrY5NrIr3mAbQi
	u99Bl7AbS8RRHtMVRW7o6CmoQvKW33sbGWy/DpOlTA04p4M+IVPw0NGTmUMxaYNLg7g+LwU5wmLPa
	orsCTJdjBivV5vjoPEZ0mDxgCIvttXicVqY6813EWfobp5jct7IgCCTg2urrzwQgSElvU0MowXgH5
	hGEbjWiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZSoO-00000001tqF-2cod;
	Sat, 27 Dec 2025 11:50:22 +0000
Received: from mail-m49227.qiye.163.com ([45.254.49.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZSoF-00000001tky-1km3;
	Sat, 27 Dec 2025 11:50:14 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2ebf64df3;
	Sat, 27 Dec 2025 19:49:59 +0800 (GMT+08:00)
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
Subject: [PATCH v4 0/7] pinctrl: rockchip: Add RK3506 and RV1126B pinctrl and RMIO support
Date: Sat, 27 Dec 2025 19:49:50 +0800
Message-Id: <20251227114957.3287944-1-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b5fa4e03509d8kunm85cc97d2e30872
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR5JS1ZCT0hJSRlLSxoeQ09WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=iZSar4ymSjyHwz3MeShOijNn1bq6sIzFgQe1hAVsA8K8rzzaW3c8mKcMtiBOKTJrSXlyvo85sbu0PzSjEKJINiBE2PBGok12UNre4UkdtlRe2vxUG2GKz4gzJxw48yg/fYxVrpijXrOY8REoB+KiKKl7G8PMQASWDl9GkC1837Y=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=dV28SK6+Gm42e/jjqz4QnjJtKhxGLkRJ5zgDMZyozSI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_035011_960746_E123D696 
X-CRM114-Status: GOOD (  13.63  )
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

Changes in v4:
- Remove rockchip,rmio.yaml and drop the separate RMIO child node.
- Remove rockchip,rk3506-rmio.h
- Refactor RK3506 RMIO implementation:
  - RMIO is now handled as a separate list within the pin group, allowing
    flexible mapping (e.g., multiple RMIO configs per group).
  - The driver now retrieves the RMIO regmap via a syscon phandle defined
    in the pinctrl node.
- Add RK3506 pinctrl and rmio DTS to match the new RMIO binding format.

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
  dt-bindings: pinctrl: Add rv1126b pinctrl support
  pinctrl: rockchip: Add rv1126b pinctrl support
  arm64: dts: rockchip: rv1126b: Add pinconf and pinctrl dtsi for
    rv1126b
  gpio: rockchip: support new version GPIO
  dt-bindings: pinctrl: rockchip: Add rk3506 rmio support
  pinctrl: rockchip: Add RK3506 RMIO support
  ARM: dts: rockchip: rk3506: Add pinctrl and rmio dtsi for rk3506

 .../bindings/pinctrl/rockchip,pinctrl.yaml    |    25 +
 .../dts/rockchip/rk3506-pinctrl-rmio.dtsi     | 25162 ++++++++++++++++
 .../arm/boot/dts/rockchip/rk3506-pinctrl.dtsi |  1795 ++
 .../boot/dts/rockchip/rv1126b-pinconf.dtsi    |   660 +
 .../boot/dts/rockchip/rv1126b-pinctrl.dtsi    |  3218 ++
 drivers/gpio/gpio-rockchip.c                  |     2 +
 drivers/pinctrl/pinctrl-rockchip.c            |   282 +-
 drivers/pinctrl/pinctrl-rockchip.h            |    20 +
 8 files changed, 31160 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506-pinctrl-rmio.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rv1126b-pinconf.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rv1126b-pinctrl.dtsi

-- 
2.34.1


