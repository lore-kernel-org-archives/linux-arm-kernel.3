Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1E5C9EC66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 10:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JANRds0JTJSP9J51OSj0NJw6bCvgunMVHLtK63EJKKo=; b=Y4jWb8k85QPwRfgpgITmkXphxE
	raYf1KO4t62mrC1hpNWnHlOBC7pAEISflPCv3Z2bBu/uK40e0gMSy76gf87Zzym4GL5HQB0mbjluk
	3sq35qNUACQBuGOtTM8R7Fo2gigpBJu3/QDzCFj3jR8UYaJvIxuhJMy4mTtzGLGK06X9OH5wSjikI
	5snVCpohr06M2wQTMLElRct5m6XTS2vsPi5ui5aV04m8PR45SAtg4r1hsQbCXZz5E9FEJnoKboSLj
	0lX5dIXbMXIZjzFwXVntdPqmXUN0uWGdc0lPdB1WyhkOtyJnTJRsJmlJfU5yAqRCbi2lbLuTNErFO
	oPAi/2ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFAj-00000005AhI-2MuK;
	Mon, 12 Jan 2026 10:29:17 +0000
Received: from mail-m15593.qiye.163.com ([101.71.155.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFAf-00000005AgK-26jE;
	Mon, 12 Jan 2026 10:29:16 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3053af572;
	Mon, 12 Jan 2026 18:29:06 +0800 (GMT+08:00)
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
Subject: [PATCH v2 0/3] Add RK801 PMIC support
Date: Mon, 12 Jan 2026 18:28:46 +0800
Message-Id: <20260112102849.1479-1-chenjh@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bb1c092a509d2kunm68a7e29c4d1efc
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk0ZT1ZCQ0NDHhpCSExMTBhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=IjUolPXGBI32U2/6Hp1ZxtsmY1GZzhC6zNLHxQc+MdRk5m0mCm9dbMm2Xh6FXnQPIOsVDm+3YyuIil8NjbLCJW6Qu0zzCOBJs9EIwyFniA8nlH4m0+aWe0+cLkLiiIZJ+WU7f28jHkCBzqjHeghND+jel6tT5bGanADyBtv+kQ0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=JANRds0JTJSP9J51OSj0NJw6bCvgunMVHLtK63EJKKo=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_022914_906514_9771F0D1 
X-CRM114-Status: GOOD (  13.01  )
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


