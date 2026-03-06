Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9516F51406
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aTmhdpcwzlmJrsF527Wxo39i/GfPTpgqP88iG67JnWg=; b=Py6LWF9KSNA1IY61Zmhz0zzqax
	N4auiPfvhNu6qVVJ6cUrc3FB9IBrByVXgp7kuY0jn1LywtvDzhmXC4nLdY9/wGiTEJ4E9DUXB030Q
	zngJeY7aBg/7u/Z8A2nK14CIM5SEDZ32a4+f19Ph+yVzVVE6QeNa2+p5yM2DEdLSWPHkWxKrDeAlF
	00uz/sLVzr9nSkcEiWPOq7FR8JA75TaKXGwwuM+RWiUX9eXC/7qYgV2PSgSk3Aall7jB6NGcXoDUU
	Gv6zEpJITga3uenTCZ2SN0MdKesmVNRxwboXjGJiEDfnLAq0Tl3ypiwsNOwxnPrl/IbcfH2nzKr9C
	wAqKofag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVsL-00000003rvm-26BB;
	Fri, 06 Mar 2026 14:09:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVsG-00000003rrT-0MDU;
	Fri, 06 Mar 2026 14:09:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F08E943317;
	Fri,  6 Mar 2026 14:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C063EC4CEF7;
	Fri,  6 Mar 2026 14:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772806190;
	bh=QAEkleb6IVGK5L78+HXxLeZCePSBUtX84+LuF5RCLcQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=IQRlj30TaF5FwIKhWPfQrnBwYLtspSXKjdkakMyqSka9OqdS+2ziLg8DEAc3Y1Hoy
	 dDLYOQ7AQgI3SAVtzdZeTW/C5e2Z3gLgyJfk1sA+pr55R9TXDcaVR+WWOLGoLp4hp7
	 5Lyy12R6EcxInUYa5TbTI1OQaPjJ19MttN8zCMjlxDhUx5qPOH+S2ysSXlWQCY9j9q
	 QOeWn48T2O2DCKbDpsZCK6XVLG58+p7geej/6cVLM2pVY1/sccY4ciPgCYPtmAuq6r
	 IvkwCpvJv3XTlyR02IsaDxWkfKzp6IMEE1CTRNHroYL3KUEQmBOJ/GQJdZDYdUcN1Z
	 NLTvPdJ0+Hpeg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5DFF0181F;
	Fri,  6 Mar 2026 14:09:50 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH 0/4] media: synopsys: csi2rx: add support for rk3588
 variant
Date: Fri, 06 Mar 2026 15:09:47 +0100
Message-Id: <20260305-rk3588-csi2rx-v1-0-0cd8d2bf28c0@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACvgqmkC/x2NQQqDQAwAvyI5N7C7uir9SukhbmMNlW1JaBHEv
 zd4nIFhdjBWYYNrs4PyT0ze1SFeGigL1SejPJwhhdSHNmTUV5vHEYtJ0g0pxnkoMVMXCLyZyBg
 npVoWr+p3XV1+lGfZzsntfhx/AsxoBXQAAAA=
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Collabora Kernel Team <kernel@collabora.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772806189; l=2252;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=QAEkleb6IVGK5L78+HXxLeZCePSBUtX84+LuF5RCLcQ=;
 b=+z1lAM+K34CYNMrpDG4Vre36ujGjSJtdNTMfHFjGBxHcLTuD65Qq7K+Px6e8p2q3OwnGFIp62
 NqLrn7qvsTHBOWIwzloMo39o8x8PtoJjfJAz4fBU1hvQX/HBnS8oizi
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_060952_195371_73D59FB3 
X-CRM114-Status: GOOD (  11.04  )
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

The Rockchip RK3588 features six MIPI CSI-2 receiver units:
 - MIPI0: connected to MIPI DCPHY0
 - MIPI1: connected to MIPI DCPHY1
 - MIPI2: connected to MIPI DPHY0
 - MIPI3: connected to MIPI DPHY0-1 (only with split DPHY0)
 - MIPI4: connected to MIPI DPHY1
 - MIPI5: connected to MIPI DPHY1-1 (only with split DPHY1)

The MIPI DCPHYs (at least the CSI-2 features of them) as well
as the split DPHY mode of the DPHYs are not yet supported by
mainline. However, we can already provide support for the
MIPI2 and MIPI4 units.

When support for the split DPHY mode is introduced, the DPHY
nodes should have the property
    #phy-cells = <1>;
and the MIPI CSI-2 receiver nodes should have the property
    phys = <&csi_dphy{0,1} {0,1}>;
in case the split mode is desired. Since this is a board
specific hardware design, the properties need to be changed
in the board device tree (or any overlays).

As reasonable default, however, we can define, e.g., 
    #phy-cells = <0>;
and
    phys = <&csi_dphy{0,1}>;
in the SoC device tree include.
This series introduces initial support for this default
configuration.

In a related note, the split DPHY allows for different
integrations of the MIPI CSI-2 receiver into the different
SoCs. Therefore, we introduce a separate compatible (and not
only a fallback compatible) in the DT bindings.

Looking forward to your comments!

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
Michael Riesch (4):
      media: dt-bindings: rockchip,rk3568-mipi-csi2: add rk3588 compatible
      media: synopsys: csi2rx: add support for rk3588 variant
      arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3588
      arm64: defconfig: enable designware mipi csi-2 receiver

 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 52 ++++++++++++++++++++++
 arch/arm64/configs/defconfig                       |  1 +
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c   |  3 ++
 4 files changed, 57 insertions(+)
---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260305-rk3588-csi2rx-a11f7c15a40a

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



