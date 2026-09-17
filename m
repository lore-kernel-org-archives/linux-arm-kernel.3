Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78EFC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 08:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wp2vwFZZzOMv9v2Avuje0bNl8S2w6KTddO2YNiWFujY=; b=SFm39FOvJ7QZJPzhpV7feAbDyD
	t2qekyI/eMeBkzBDadVOsjvgZx6DsHj8SWKcUCh/mSKnJPNtox+C6vnEG8Lg6yZWunydOxg+8Htnw
	GnXACeITybCNoFGkxOWd5mUkbJL4G3BUwxD8hV85U2d8j84F79CtWd6fGI50Hru/aLK0+Kb4yn7w/
	bV+y8YBHfwTWJagCNmxKneRn8WyuU2LTr1faW3li7iiqokaQVtFE4bNzzX/StfOLtsFEOmcVHFdwk
	LlF3yQdCHmVtItapoVtG6KlzhqrXyXCBBd86VSumYzaSNyuODvM1xMm8aeY45DtyWbCcBwIdQGsQ0
	UrnlT/zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7730-0000000ApFS-3473;
	Thu, 17 Sep 2026 08:00:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x772z-0000000ApDf-37Z9;
	Thu, 17 Sep 2026 08:00:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 233BD60211;
	Thu, 17 Sep 2026 08:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B45F2C2BCB3;
	Thu, 17 Sep 2026 08:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789632044;
	bh=PWfCdpTKB1C6HQc7+rrgUdUSi/qDI88n3Csfp1Nb2cs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=HxS4RvAPUT6LGyJ5n0NJY6FeE//AbSRpzRiYqG7sHjFnYAtMIYj8Er2Bl56hQePio
	 ogfFeJOQBYLjRZiS+vSgSwXtDrS081N7omwFFSXm/KKKcc/Bs+1jxLU5LdafYAaXY1
	 xSVAmhJB+3QyZP5jL8HaRrMZ2XMGVmAPAKjG3QzIViE+60iEMydkZUqPIfsVK2vhHJ
	 1kEJtlL5yl1p6/gs/bkNUtb0HI9bPYj/4Y+EMWdGscL1cEd13VKqCEWfY6pgqS521H
	 OF5CBOXC8CdOJB5mSuxuzU+NILoHxK0vJZMSS18ojv2fwzxLs5YrOvPLtp2L7Pf4Et
	 AORKlcjOCfCFQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E1F5C982C1;
	Thu, 17 Sep 2026 08:00:44 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Subject: [PATCH v12 0/6] Add VIM4 MCU/FAN support
Date: Thu, 17 Sep 2026 09:58:59 +0200
Message-Id: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XSzW6DMAwA4FepOC9TnF/S095j2sH5W6MVugFFn
 aq++wI9gCLBcnMkf7Zs36s+dCn01fFwr7owpj5d2hwAezlU7oTtZyDJ54+KUaaooIyg96RxVxK
 xJV8n9NiTMTWCoANng5TcGVvl7O8uxHSb6fePZ9yFn2uuMDw/K4t9IO7SNGk4HtpwG8hcRHOop
 oRT6odL9zu3NsKc8W8TIxBKmAUWrECnLX3Dcwrn19jN5MjWDN9mWGY0lVxZxgQ3WDB8xYDeZnh
 mUKGOUlMLYAtGrBgG24zIjBAaQCCrI/MFI9eM2Gbk1E10ETVIbRkvGLUwEtQ2ozLj8jNWQRRKF
 oxeGLU3Yp0ZaYTFGo2Svi6YemH03sLraeFCxBCCAeSqYMzC1FRuM2ZauPRR1xqoNaFggC6OoTu
 rAjoNOThvjZESeXmAAGto75CnS5YRFFBfcxvX0OPx+AP+ztPfuQMAAA==
X-Change-ID: 20260402-add-mcu-fan-khadas-vim4-ac1cbe553c9b
To: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
 mfd@lists.linux.dev, Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5925;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=PWfCdpTKB1C6HQc7+rrgUdUSi/qDI88n3Csfp1Nb2cs=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9bqeewvjq5YceeHxLSsqKi+F9Jxi1P7JIMbjnzlTpjVl
 CgpYxjbUcrCIMbFICumyNI/1/LEu8tHz3zdo54CM4eVCWQIAxenAEwkwYuR4bvFboPZJqE58ub5
 XvlsHx6d8m6rt62TyXM48tBUYP3DGwz/Y3Jb+HezdSifnSXHeT1Ic0nkfsF7l7Y4Hz5S+rPJUHY
 3AwA=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The Khadas VIM4 board features a different MCU variant compared to
previous VIM boards.
While it shares the same I2C-based communication model,
it differs in some ways:

  - A distinct register map with its own volatile/writeable register set
  - A fan control with 0–100 levels instead of the 0–3 levels previously
  - A fan power supply gated through a regulator

This series adds support for this new variant by:

  1. Refactoring the khadas-mcu MFD driver to use per-variant data
     structures (regmap config, cells, fan platform data),
     and adding the khadas,vim4-mcu compatible string.

  2. Extending the fan thermal driver to retrieve the fan register
     and maximum level from platform_data,
     and to optionally manage a power regulator for the fan supply.

  3. Adding the corresponding DTS node for the VIM4, wiring the MCU to
     the I2C AO_A bus and exposing it as a thermal cooling device.

As the thermal patch depends on MFD, it should go through MFD tree.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
Changes in v12:
- PATCH 1,3,4: Remove platform data in MFD, and use platform name to get the fan variant.
- Link to v11: https://lore.kernel.org/r/20260902-add-mcu-fan-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr

Changes in v11:
- PATCH 4: Use of_node_get to avoid reference count underflow.
           Check pdata for NULL pointer on probe.
           Manage rollback for regulator_disable failure on suspend.
           Remove regulator disable on resume failure, managed by devm reset.
- Link to v10: https://lore.kernel.org/r/20260901-add-mcu-fan-khadas-vim4-v10-0-aecdb9955a30@aliel.fr

Changes in v10:
- PATCH 1: makes KHADAS_MCU_GENERIC explicitly non-zero to remove the ambiguity with
           of_device_get_match_data() returning NULL/0 on a failed match. Reported by Sashiko.
- PATCH 4: devres for the regulator and cooling device are now attached to the child device (not the parent),
           closing a leak/use-after-free window. Also adds proper regulator teardown on unbind,
           fixes a level-vs-index mixup in shutdown/suspend, and disables the regulator if resume fails.
- Link to v9: https://lore.kernel.org/r/20260805-add-mcu-fan-khadas-vim4-v9-0-75df78710b9e@aliel.fr

Changes in v9:
- Rebased on next-20260731 (patches 1/8, 2/8 and 6/8 already applied, dropped from this series).
- PATCH 1: Add levels table and nlevels in khadas_mcu_fan_pdata struct.
- PATCH 2: Use MFD_CELL_* macros instead of open-coding mfd_cell.
- PATCH 3: Provide levels table and nlevels to platform data.
           Check match_data before the switch.
- PATCH 4: Use levels[] and nlevels from platform data. VIM4 levels is (0, 30, 40, 55, 75, 100).
- Link to v8: https://lore.kernel.org/r/20260702-add-mcu-fan-khadas-vim4-v8-0-244feee91a36@aliel.fr

Changes in v8:
- PATCH 4: Define constant for fan max level, remove extra space for unnecessary alignment.
           Thanks to Lee's review.
- Link to v7: https://lore.kernel.org/r/20260603-add-mcu-fan-khadas-vim4-v7-0-594ba8a965d8@aliel.fr

Changes in v7:
- PATCH 3-4: Simplify the per-variant handling by using local variables in khadas_mcu_probe()
             instead of introducing a dedicated data structure. Thanks to Lee's review.
- Link to v6: https://lore.kernel.org/r/20260516-add-mcu-fan-khadas-vim4-v6-0-cccc9b61f465@aliel.fr

Changes in v6:
- PATCH 4: Address Lee's review comments:
  - Use an enum to discriminate between MCU types instead of passing
    MFD data through the DT match table
  - Fix error code from -EINVAL to -ENODEV when no MCU type is matched
  - Make khadas_mcu_fan_cells and khadas_mcu_cells const
  - Use dev_err_probe() for regmap initialization error
  - Document fan speed levels for max_level
- Link to v5: https://lore.kernel.org/r/20260424-add-mcu-fan-khadas-vim4-v5-0-afcfa7157b23@aliel.fr

Changes in v5:
- PATCH 5: Replace devm_regulator_get_optional() with devm_regulator_get()
           to simplify error handling and remove NULL checks, also
           ordering as reverse christmas according to Neil's feedback.
- Link to v4: https://lore.kernel.org/r/20260421-add-mcu-fan-khadas-vim4-v4-0-447114a28f2d@aliel.fr

Changes in v4:
- PATCH 1: limit fan-supply property by compatible according to Conor's feedback.
- Link to v3: https://lore.kernel.org/r/20260417-add-mcu-fan-khadas-vim4-v3-0-a6a7f570b11b@aliel.fr

Changes in v3:
- PATCH 1: adding comment on vim4 compatible saying it is not discoverable,
           thanks to Rob's and Neil's feedback.
- Link to v2: https://lore.kernel.org/r/20260403-add-mcu-fan-khadas-vim4-v2-0-70536b22439a@aliel.fr

Changes in v2:
- PATCH 5: Add regulator_disable on suspend thanks to Neil's feedback.
- Link to v1: https://lore.kernel.org/r/20260402-add-mcu-fan-khadas-vim4-v1-0-2b12eb4ac7b0@aliel.fr

---
Ronald Claveau (6):
      mfd: khadas-mcu: Add per-variant configuration infrastructure and VIM4 support
      mfd: khadas-mcu: Use MFD_CELL_* macros for cell declarations
      mfd: khadas-mcu: Add support for VIM4 MCU variant
      thermal: khadas-mcu-fan: Add fan config from platform data Add regulator support
      arm64: dts: amlogic: t7: Add i2c controller node
      arm64: dts: amlogic: t7: khadas-vim4: Add i2c MCU fan node

 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  |  13 +++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        |  10 ++
 drivers/mfd/khadas-mcu.c                           | 104 ++++++++++++++++----
 drivers/thermal/khadas_mcu_fan.c                   | 108 ++++++++++++++++-----
 include/linux/mfd/khadas-mcu.h                     |  19 +++-
 5 files changed, 214 insertions(+), 40 deletions(-)
---
base-commit: 9dba66b6217aacb924d997de3866e7e4c0dcf952
change-id: 20260402-add-mcu-fan-khadas-vim4-ac1cbe553c9b

Best regards,
-- 
Ronald Claveau <linux-kernel-dev@aliel.fr>



