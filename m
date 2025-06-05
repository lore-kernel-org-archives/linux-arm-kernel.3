Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805FAC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 15:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=la5ugvQScao9QtdoP9HvwH6IreoAMZc1Kxcodvxonk4=; b=2PQ8igkmEDd96C
	GIuj6xKOzBsrSE+8y8rU8lgluT5nhdh0dtUY1POnUHK6WR8MMyaXqeUuWnlh+IGyAh/F0NaprZEXh
	kQF/IOGY/SwoCfsZz5rlLx9jwTN1Cm4jCbX4PPWs/vGrmPmte1NawbatffV6M45Cydiv6nqrj9mf8
	5PF0TIq+Hc7xGRO0nDrzf18nypTvZWI/X5DEY0zhGCWgKlHQT2BJfiQNzdhsjuNWtliDnzsfNpHnv
	xA1dzFgLB5qe6B3rFQAPQVCFnh/sRQMO5HSFfKfh5F5Uoz7mzsgbGhiauWEQ5tbrP2gNMDjeerHZ5
	sIBjJ2nSnYN2A4WPE6bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNCmv-0000000FwFr-28q2;
	Thu, 05 Jun 2025 15:45:53 +0000
Received: from smtp-42ac.mail.infomaniak.ch ([84.16.66.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNCiY-0000000FvYU-1djv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 15:41:25 +0000
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bCpZl23Znz2f6;
	Thu,  5 Jun 2025 17:41:19 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4bCpZk11YKzppn;
	Thu,  5 Jun 2025 17:41:18 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH v2 0/4] rockchip: rk8xx: allow to customize PMIC reset mode
 on RK806
Date: Thu, 05 Jun 2025 17:41:05 +0200
Message-Id: <20250605-rk8xx-rst-fun-v2-0-143d190596dd@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJG6QWgC/3XMQQ6CMBCF4auQWTumNKWCK+9hWGA7lYkJmCk2E
 NK7W9m7/F/yvh0iCVOEa7WDUOLI81RCnypw4zA9CdmXBq10oxptUV7tuqLEBcNnwqBt7Yx6WK8
 clM9bKPB6ePe+9MhxmWU7+FT/1n9SqlEhDW1nfGcuhtTNjSSynT1Bn3P+Ap2qUSyqAAAA
X-Change-ID: 20250526-rk8xx-rst-fun-f261c40b6d0c
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, 
 Daniel Semkowicz <dse@thaumatec.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_084122_580375_4D400A38 
X-CRM114-Status: GOOD (  12.18  )
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

This allows to customize the PMIC reset method (also called RST_FUN) on
RK806 PMIC from Rockchip, mainly found on RK3588 devices but also on
RK3576.

Finally, this is required on the two RK3588 devices from Theobroma as
U-Boot changes the silicon-default (which is suitable for us) to
something that breaks our companion microcontroller's reboot detection
which breaks a bunch of assumptions in the MCU FW code.

To validate this works on those devices do the following:

On Tiger:
i2cset -y -f 6 0x6f 0x9 0x62
On Jaguar:
i2cset -y -f 0 0x6f 0x9 0x62

You hear a nice (loud :) ) beep, then reboot and it should stop right
before entering U-Boot TPL again.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v2:
- moved rst_fun variable declaration out of the switch-case,
- initialized rst_fun variable to make kernel test robot happy even
  though the variable wouldn't be used uninitialized due to breaking
  before using it,
- renamed rockchip,rst-fun to rockchip,reset-mode
- rewrote rockchip,reset-mode binding description to not mention the
  relation to registers or register values,
- added binding header file to make it easier to understand what the
  mode is when reading a Device Tree without having to read the binding,
- Link to v1: https://lore.kernel.org/r/20250526-rk8xx-rst-fun-v1-0-ea894d9474e0@cherry.de

---
Quentin Schulz (4):
      dt-bindings: mfd: rk806: allow to customize PMIC reset mode
      mfd: rk8xx-core: allow to customize RK806 reset mode
      arm64: dts: rockchip: force PMIC reset behavior to restart PMU on RK3588 Jaguar
      arm64: dts: rockchip: force PMIC reset behavior to restart PMU on RK3588 Tiger

 .../devicetree/bindings/mfd/rockchip,rk806.yaml    | 23 ++++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |  2 ++
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     |  2 ++
 drivers/mfd/rk8xx-core.c                           | 14 +++++++++++++
 include/dt-bindings/mfd/rockchip,rk8xx.h           | 17 ++++++++++++++++
 include/linux/mfd/rk808.h                          |  2 ++
 6 files changed, 60 insertions(+)
---
base-commit: ec7714e4947909190ffb3041a03311a975350fe0
change-id: 20250526-rk8xx-rst-fun-f261c40b6d0c

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


