Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F7BC9EC80
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 12:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7K96o9PfB6wlxTIuc4FqOnAFIU3qJ4/WcE8q4TkwfB8=; b=rYAWrq+TWzIdO1rZRUhI0f6K5F
	X0ZNWbJzcicwEUb+umjuQeqIjQEZ/jnDpLALhTfc2ebpIMBumrArcnuTUj8NDL1/5M0yMW0QycSYG
	H2WLntR9XRlTamW5ynHCzPsyLMIWpBbrjfPO0dDqooh0H5v7eOdi7a7WutpYwMBx2TH/NtgmsNw9v
	ZajVO1zY8BquCEag+awWFroYYyj+tBnC04WIfFKDn5zcC81tp12OGrY/3ZxWtW8mCwsMHpxQ54o5f
	CpziZ+KTHYRBm7GO07tATg4ef1QjiELj9hgEjkMzITgFdKMOzAzmuigRr9XdEXfHRAEdwrW6BfWgp
	w0b6o1Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHHL-00000005L4T-3GQe;
	Mon, 12 Jan 2026 12:44:15 +0000
Received: from mail-m49194.qiye.163.com ([45.254.49.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHHI-00000005L2g-0CGr;
	Mon, 12 Jan 2026 12:44:13 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 305730432;
	Mon, 12 Jan 2026 20:44:08 +0800 (GMT+08:00)
From: Joseph Chen <chenjh@rock-chips.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Joseph Chen <chenjh@rock-chips.com>
Subject: [PATCH v3 0/3] Add RK801 PMIC support
Date: Mon, 12 Jan 2026 20:43:48 +0800
Message-Id: <20260112124351.17707-1-chenjh@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bb23c332509d2kunm3fddfe07a776
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx0ZGVZCHx1CH0JPGhlLTkhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=TkK8JX0KXZcpy90oV5dsPlnE7CtnXOhMVV/0yuvoGZF2anvjt205KjzvqyNQ+yMiAFv7VG7AL06UXUceZw4LP8ZMPvIs5Tj8+AeeEjdVm8IchwIJ8ndM/WndA7FzoONzuHbipPRHFXMjwBpcJ5fQGl+u4y/4gkJtoIGtMjKc5sU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=7K96o9PfB6wlxTIuc4FqOnAFIU3qJ4/WcE8q4TkwfB8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_044412_612995_4C995885 
X-CRM114-Status: GOOD (  13.14  )
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

This patch series adds support for the Rockchip RK801 Power Management
Integrated Circuit (PMIC) to the Linux kernel.

The RK801 is a PMIC designed for multimedia and handheld devices. It
includes:
- 4 BUCK regulators (DCDC)
- 2 LDO regulators
- 1 SWITCH regulator
- Interrupt support for power key events

The implementation follows the existing rk808 MFD driver architecture
and integrates RK801 as a new variant in the RK8XX family.

Patch 1 adds the device tree binding documentation for RK801, describing
the compatible string, regulators configuration, and example usage.

Patch 2 adds the MFD core support for RK801, including device detection
and register definitions.

Patch 3 adds the regulator driver support for RK801, implementing the
4 BUCK regulators, 2 LDO regulators, and 1 SWITCH regulator.

Changes in v3:
- Fix patch split issue: MFD patch incorrectly removed the entire
  drivers/regulator/rk808-regulator.c file in v2
- Kconfig description: use "Rockchip RK8xx Power Management Chips"
  instead of listing all individual chips (suggested by Heiko)

Changes in v2:
- Include all necessary To/Cc entries
- Rename pmic/regulator names from uppercase to lowercase(dcdc[1-4]|ldo[1-2]|switch)
  to align with DT coding style
- Drop 'rockchip,system-power-controller'
- Remove unused 'pwrctrl-gpios' from DT binding example
- Split regulator support into a separate patch (was part of mfd patch in v1)

Joseph Chen (3):
  dt-bindings: mfd: Add rk801 binding
  mfd: rk8xx: Add RK801 support
  regulator: rk808: Add RK801 support

 .../bindings/mfd/rockchip,rk801.yaml          | 197 ++++++++++++++
 drivers/mfd/Kconfig                           |   6 +-
 drivers/mfd/rk8xx-core.c                      |  81 ++++++
 drivers/mfd/rk8xx-i2c.c                       |  33 ++-
 drivers/regulator/rk808-regulator.c           | 243 ++++++++++++++++++
 include/linux/mfd/rk808.h                     | 118 +++++++++
 6 files changed, 674 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml

--
2.25.1


