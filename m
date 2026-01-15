Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC45D46607
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 18:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eLgN9jh25lXSf36ajf6PhDW8FVNv9PiJNFYp5YT/VP0=; b=CB+swwCqbItcyG/Zpe1X2enWmo
	6VXWL2siCyR3jRSOaRbdOAvb9leKSVpY8x2do61K5Br+ZyU044MzlwRWC889YnH7JNwfL8DYpsat1
	sp9dwo3iV/sBNY4h0sMpuOBxt6mE1tDYpzp7X/VBx68t+0Ag4jWSpw9t5A8uOzkmIW9cI/8tIe3XQ
	QIt7MBASOKB2w4JPZt+TT1u9oRUdGwlmtd7imhrpLrCc4s7Ihmjh7MxH8xzqUTHnmYN6T3/bABVE0
	7CxW53FtGmfT/tYeTbtoEH3KR1eN6b/c/eWv1UVIFolzt6KvmBk0KxfvbRbEtLWtbJWCa5uZtYoVo
	+E9CfF/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgS33-0000000Cxxc-1DxB;
	Thu, 15 Jan 2026 18:26:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgS30-0000000Cxwj-0Lhz;
	Thu, 15 Jan 2026 18:26:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FA2560130;
	Thu, 15 Jan 2026 18:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF741C116D0;
	Thu, 15 Jan 2026 18:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768501576;
	bh=TMv/2GMeJt7lNR4P7wDPkUHC6oexE2lmn2DPQBekD/o=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=rLXb5/tcQilVNU6so/oL38Xg9sfM/z6vztpPineB35xipUc53EDFlGYR5I+O+wyx1
	 M1k0/nP+aDppwLAu6UsjgRtnSegz4+zqRmZjFFcDhQqrMMEHYm4NeuYF2SS7yat7VL
	 lWj4vhL92XL+XdAu0PqDIIJqoSLKtKSTky7eiOWDaFcrmXUOYAJHcfSi3VYnWBdsYD
	 4LOUOIMGgQTF5xpxGP745cObWqzIF3sVzG02CCoV7HwhpcUT6avDLqge055960m3Rj
	 CiaqIhhoDhoVtzLdv5QIDN9M67lQtF/hhBzLj2c4H9YGdUlwbf3MToRgNWeGPGG+RU
	 tpcpU5awg4Y2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC137D46604;
	Thu, 15 Jan 2026 18:26:16 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v4 0/3] media: rockchip: add driver for the rockchip mipi
 csi-2 receiver
Date: Thu, 15 Jan 2026 19:26:06 +0100
Message-Id: <20251114-rockchip-mipi-receiver-v4-0-a9c86fecd052@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD4xaWkC/43OTW7CMBAF4Ksgr+vKf5CEVe+BurAnEzJqiKNxs
 YpQ7s7AskKC5XvSfG+uqiATFrXfXBVjpUJ5lhA+NgrGOB9RUy9ZOeO21tqgOcMPjLToEy2kGQG
 pImuT4uBCgA5aVHKcYkGdOM4wyvl8niYpF8aB/h5rh2/JI5XfzJfHeLX39uVOtdro3nrT7rC1p
 u+/IE9TTJnjJ+STurPVvUc5oTB1KXjfNAOEZ5R/j/JCWfnIx9gMvtv+p9Z1vQF9hzI1awEAAA=
 =
To: Michael Riesch <michael.riesch@collabora.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Kever Yang <kever.yang@rock-chips.com>, Frank Li <Frank.li@nxp.com>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768501575; l=2749;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=TMv/2GMeJt7lNR4P7wDPkUHC6oexE2lmn2DPQBekD/o=;
 b=wmch28e0Zrxj/on33s1llwpel66Pa1hYRFRrdet1fz0xaiL1YM4wVrkV7w3GZKt9oDvXKj07L
 T6ucjWHAyFDBz2VJbtSpCGMbYTusQp8JPXL2264+4aAogz+OIZq9FE5
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Habidere,

This series adds support for the Rockchip MIPI CSI-2 Receiver that is
integrated into recent Rockchip SoCs, such as the RK3568 and the RK3588.

According to Rockchip, this core is NOT the Synopsys MIPI CSI-2 Host, but
it features a compatible register layout (thanks Chaoyi for the
clarification).

As pointed out by Frank, we should thus rename the driver and place it
under drivers/media/platform/synopsys to facilitate re-use of this code
for similar IP cores.

As has been discussed in [0], it would be beneficial to add support 
for the split mode (a feature of the Rockchip CSI-2 DPHY) before
integrating the MIPI CSI-2 Receiver into the respective SoC device tree
includes. However, we can readily add the DT binding and the driver
as I am positive they will not need to be changed significantly when this
feature is introduced.

This constitutes a small step towards mainline video capture and camera
support on the Rockchip RK3588.

Looking forward to your comments!

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

[0] https://lore.kernel.org/r/20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com

---
Changes in v4:
- moved driver to drivers/media/platform/synopsys and renamed it (Frank)
- addresse review comments by Sakari
- Link to v3: https://lore.kernel.org/r/20251114-rockchip-mipi-receiver-v3-0-16e83aa7f395@collabora.com

Changes in v3:
- rebased onto v6.19/recent media-committers/next
- Link to v2: https://lore.kernel.org/r/20251114-rockchip-mipi-receiver-v2-0-eb9b43377fc4@collabora.com

Changes in v2:
- dropped one R-b by Bryan, as there were two of them on the same patch
  (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20251114-rockchip-mipi-receiver-v1-0-d13086e810dd@collabora.com

---
Michael Riesch (3):
      media: dt-bindings: add rockchip mipi csi-2 receiver
      media: synopsys: add driver for the designware mipi csi-2 receiver
      arm64: defconfig: enable designware mipi csi-2 receiver

 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 141 ++++
 MAINTAINERS                                        |   7 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/media/platform/synopsys/Kconfig            |   1 +
 drivers/media/platform/synopsys/Makefile           |   1 +
 .../media/platform/synopsys/dw-mipi-csi2/Kconfig   |  17 +
 .../media/platform/synopsys/dw-mipi-csi2/Makefile  |   2 +
 .../platform/synopsys/dw-mipi-csi2/dw-mipi-csi2.c  | 735 +++++++++++++++++++++
 8 files changed, 905 insertions(+)
---
base-commit: dc6c52205bdaddf1dc259497a958402b35c01fe2
change-id: 20251114-rockchip-mipi-receiver-0baf244c9c8e

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



