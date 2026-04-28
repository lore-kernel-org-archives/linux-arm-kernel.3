Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B89FF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GpSZYdL+40d9Sdi7dZZPl57mcBlFVw4mHgHNUsV/BoI=; b=cohsJBILl8kqJT
	AthuIK8wAJIC6KMIls/U+pKdSGTGdOsAcKljvs+MXz64460ln7W3BX+z8Vj2B+U/K/gT4GGRnmt2O
	FvC1tsSIX5HRU1vMu/CU+7+MZGor+f8ZVq+d4Qp89vLk4NK5TubU8W0wFE4vy60vxi2Fr3MHHXKzY
	u8KN+zhUJxI83HMCCS483MIapf7MLzfSFW8Ktidmhh1cQV5j5L0BD1TaswhQHq8arYaQehodx3uhX
	+5pII9NyyppJiiCKy8g8/kxbpCptjqT6dxs4N6XmIuSkLR+XWHLFlISLllg++rbe4EacYsTHN3Ag2
	2bNXxJGz7jVikDj2Nmvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4b-00000001sjF-2ORt;
	Tue, 28 Apr 2026 16:14:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4X-00000001sfC-1aaa;
	Tue, 28 Apr 2026 16:14:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777392842;
	bh=qykRsMDcguHlP2jNIALoTrAWL1JNtvKt8qOtBH3+vFw=;
	h=From:Subject:Date:To:Cc:From;
	b=jYMf3PUlWrNAodfxX/o2djAU2WxbOsuOgLGFLLtaioICGm7/sVsFFJ5EomTioZZgH
	 F7M/y9rFAebV9h0o7YVi8uVetaKBOYFFzjVojyPQ8Cu98TN3UnBiNrbNKg9bnrbRCw
	 tlsfVl+fiGXUGp7N1slyf2veWIDXMup3NBLlvkW5JZNqyI1zA4TOP0bLZYtvDJ+WST
	 bLbl88mBZPYTB2mz/JXzj6ZQjXQBwmGJeRx6WaPaqWVpkVc3ixsdxOAn3Q1Z9k06VV
	 sg+IZ9rxCIgWQ08VZvq2RUXYFxwPh0GlGrhrRRpb++1ImrGncwBfGOQRgndKLTcPNl
	 Pdlm/JzF439bA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C92C717E1513;
	Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 7E86248002C; Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v4 00/16] phy: rockchip: usbdp: Fixes, DP 1-lane support
 and cleanups
Date: Tue, 28 Apr 2026 18:13:39 +0200
Message-Id: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALPc8GkC/4XPSw7CIBCA4asY1mJ4CG1deQ/jAuhgibUQsI2m6
 d2l3WiMj+U/yXyTGVGC6CCh3WpEEQaXnO9ybNcrZBrVnQC7OjdihEnCCMfRm7NpXMB90nXApgX
 V9QELLaraaiGp4igvhwjW3Rb4cMzduHT18b7cGeg8/UsOFBNMpZK2YlDTQu6Nb1ulfVQb4y9oZ
 gf2QtHvFMuUlgUYxoStJHyi+JPiPyieKQ6lhbJSPL/9Tk3T9AAqUHs/VgEAAA==
X-Change-ID: 20260203-rockchip-usbdp-cleanup-5b59dfb561a3
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 William Wu <william.wu@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3288;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=qykRsMDcguHlP2jNIALoTrAWL1JNtvKt8qOtBH3+vFw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnw3Mg6MrE43uBsdB5nEHn4nfke9zSNw3v3X
 O6V7tVIDkUlJIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp8NzIAAoJENju1/PI
 O/qagK4P/RRBziuTuVdFuCdrd+Z+aeCoVbRquVq3uj8OePyD9PbBtjHMxTnWQzWhxNazbgxipyZ
 buEMtei1fzi5HMaIGgBgUhemv+an/NUx1MFp+Ox8IxQpuauWzyhXqisdxzrAfPVSkOz3cPr0/J4
 W3df/thgqq9jkUvdwy4KqIO0WnHpK/D43M44wIVq1YZN2PYITIsoo7bNzhotsK33wDmeQVUyzFh
 g0OS/Rm4nZ/sZ7Zqrxrqbit9JSMkwUME7HFyHqCKei8dWJQFdN/dhHIU7YrhDashssXQbCxtASQ
 +3CLfu62xM5mzImuRRZkFZQ/2yTfwsfJuTFAZtDdQBOQSqrPLzmBmlRbfnBSdnuX1qvkLmMkVNB
 5Xv6CUYlnXt4geNjktQlIly6y4wqIRYh6A09YP70VZg/U2zr6aZBtt77nM2zf5VEhI2MmuGo6JS
 XH75bBY6X1QsrvqWhSSGg2nUTs11SkZ7ydn2CJhB+7Hp/QxgkMNClqCHziSREtzNTHCvA0/VJM0
 4ZGK7LXVQ74bP3SLInSUYoCYTU4GmeTMHcFtRAMmP3x5G6geC539cb89qx7sVcKjp7EMOA8UcES
 Br2oPewzC1QbYYikVMJFSS7cE/Dt+UJ7rA7c4ggRMu/wrFjjXpuFjNBdboWG4IGJluvRS5PJpc/
 wtFz1hUQloHphlD8PcsMy+A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_091405_569041_F30D010A 
X-CRM114-Status: GOOD (  12.69  )
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

This series overhauls the Rockchip USBDP driver; apart from a
a bunch of cleanups and small improvements the main goal is to
get the driver ready for proper USB-C DP AltMode support.

Once this series has landed, it unblocks enabling proper USB-C
DP AltMode on the RK3588 and RK3576 platforms incl. runtime PM
for the Synopsys DesignWare DisplayPort controller.

Apart from this series, further changes are required on the
DRM side. There are no compile-time dependencies between the
DRM side and the PHY side, but the PHY side must be applied
to avoid SErrors once runtime PM is added to the DisplayPort
controller driver. Thus it would be really good to land this
series in the next merge window.

Changes in v4:
- Link to v3: https://lore.kernel.org/r/20260313-rockchip-usbdp-cleanup-v3-0-3e8fe89a35b5@collabora.com
- rebased to v7.1-rc1 (no changes)
- Update DRM bridge registration patch to avoid registration when DP aux
  port is not connected to anything, since this results in errors and some
  boards use USBDP instances for USB3 only.
- Add patch renaming mode_change into phy_needs_reinit
- Add patch to re-init PHY on orientation change
- Add patch to factor out lane_mux_sel setup
- Add patch to handle mutex via guard functions

Changes in v3:
- Link to v2: https://lore.kernel.org/r/20260213-rockchip-usbdp-cleanup-v2-0-b67ec225f96e@collabora.com
- Add patch to register the USBDP PHY as DRM bridge
- Add patch to describe ports in DT binding (used by the DRM bridge)
- Add patch to drop HPD handling from the PHY

Changes in v2:
- Link to v1: https://lore.kernel.org/r/20260203-rockchip-usbdp-cleanup-v1-0-16a6f92ed176@collabora.com
- Added new patches to fix USB3 SError

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Frank Wang (1):
      phy: rockchip: usbdp: Amend SSC modulation deviation

Sebastian Reichel (13):
      dt-bindings: phy: rockchip-usbdp: add improved ports scheme
      phy: rockchip: usbdp: Do not loose USB3 PHY status
      phy: rockchip: usbdp: Keep clocks running on PHY re-init
      phy: rockchip: usbdp: Add missing mode_change update
      phy: rockchip: usbdp: Rename DP lane functions
      phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
      phy: rockchip: usbdp: Cleanup DP lane selection function
      phy: rockchip: usbdp: Register DP aux bridge
      phy: rockchip: usbdp: Drop DP HPD handling
      phy: rockchip: usbdp: Rename mode_change to phy_needs_reinit
      phy: rockchip: usbdp: Re-init the PHY on orientation change
      phy: rockchip: usbdp: Factor out lane_mux_sel setup
      phy: rockchip: usbdp: Use guard functions for mutex

William Wu (1):
      phy: rockchip: usbdp: Fix LFPS detect threshold control

Zhang Yubing (1):
      phy: rockchip: usbdp: Support single-lane DP

 .../bindings/phy/phy-rockchip-usbdp.yaml           |  23 ++
 drivers/phy/rockchip/Kconfig                       |   2 +
 drivers/phy/rockchip/phy-rockchip-usbdp.c          | 302 +++++++++------------
 3 files changed, 149 insertions(+), 178 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260203-rockchip-usbdp-cleanup-5b59dfb561a3

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


