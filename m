Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A79C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 11:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gry/qId0xLI5NaIoiwjOcD/I0yKD7SIYuW62PqqpQ3g=; b=2mx6vr8i0zwIHa
	CswBZVLap/z8pJCu9/z291IVdqyPxnSbrX2Ux5+03JGMua0ARhAF73V3eJxErn/xSXp5sYNmfOpc4
	JlNjhQyrOCLGcxJIw19tiNC6jOr5T505Lcawfj+khwDRrmE6VuuquojnDA7Ub7HPbwVkom3FO+I+C
	7gtTWCg+72IuIPSppiyfxu0yR851FZSK0Mzj79KDEePwr1T3dCAdyGDfSGXvELosJYmMFapWpQ20p
	+ydvewjsnV18COtVIgx1OaL17dmJvzq6hb5Yd3EOWDZOrarXHEjG8WIBV/LujMxNIllXZs4W1ntyM
	TbU9lKhG9/oHotW8kMWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6ui-0000000EPi4-1GIb;
	Fri, 27 Jun 2025 11:06:36 +0000
Received: from smtp-42af.mail.infomaniak.ch ([84.16.66.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6in-0000000EMv0-1dZt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 10:54:19 +0000
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bTC9J1vZfzGvr;
	Fri, 27 Jun 2025 12:54:12 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bTC9G5wQdzvtY;
	Fri, 27 Jun 2025 12:54:10 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH v4 0/5] rockchip: rk8xx: allow to customize PMIC reset mode
 on RK806
Date: Fri, 27 Jun 2025 12:53:52 +0200
Message-Id: <20250627-rk8xx-rst-fun-v4-0-ce05d041b45f@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEB4XmgC/3XMSw6CMBSF4a2Yjq25fVocuQ/jALm30piAaZFAC
 Hu3MJGQODwn+f6JJYqBErscJhapDym0TR76eGBVXTZP4gHzZhKkASMtjy83DDymjvtPw720otL
 wsAgVy+YdyYdh7d3uedchdW0c13wvlvdfqRccOJWu0Fjosya4VjXFOJ6Q2FLq5U9bMHstsxZao
 SjAFBZxr9VGC7fXKmtwwoNEhUq7rZ7n+Qt2GSuIJgEAAA==
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
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_035417_566554_5040CB39 
X-CRM114-Status: GOOD (  14.29  )
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
Changes in v4:
- removed not-so-useful dev_dbg message about missing property,
- unwrapped RK806_RST_FUN_MSK into the line above,
- reworded regmap_update_bits error message according to Lee's
  suggestion,
- Link to v3: https://lore.kernel.org/r/20250618-rk8xx-rst-fun-v3-0-081f02d3d348@cherry.de

Changes in v3:
- (hopefully) fixed missing bitfield.h include in driver as reported by
  Intel's kernel test robot,
- removed dt-binding header file,
- removed mentions to constants that used to be in dt-binding header
  file since they aren't anymore,
- added (patch 3) header file in arch/arm64/boot/dts/rockchip to make
  the value of rockchip,reset-mode easier to understand when reading the
  device tree,
- Link to v2: https://lore.kernel.org/r/20250605-rk8xx-rst-fun-v2-0-143d190596dd@cherry.de

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
Quentin Schulz (5):
      dt-bindings: mfd: rk806: allow to customize PMIC reset mode
      mfd: rk8xx-core: allow to customize RK806 reset mode
      arm64: dts: rockchip: add header for RK8XX PMIC constants
      arm64: dts: rockchip: force PMIC reset behavior to restart PMU on RK3588 Jaguar
      arm64: dts: rockchip: force PMIC reset behavior to restart PMU on RK3588 Tiger

 .../devicetree/bindings/mfd/rockchip,rk806.yaml     | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts      |  2 ++
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi      |  2 ++
 arch/arm64/boot/dts/rockchip/rk8xx.h                | 18 ++++++++++++++++++
 drivers/mfd/rk8xx-core.c                            | 12 ++++++++++++
 include/linux/mfd/rk808.h                           |  2 ++
 6 files changed, 57 insertions(+)
---
base-commit: b004ef1a3e9210ef9b9092ed8812ab8cc65b10e9
change-id: 20250526-rk8xx-rst-fun-f261c40b6d0c

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


