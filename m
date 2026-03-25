Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA6DFEA83B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 10:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2qgm28vxW7ZyUuryggwI2s/K/S1A8NHPUWsrpN08jQM=; b=0K+MYyr4BqdbJPuHfPgBrOTgN4
	Hve15qqqDD3mlUg2f3QBby9+DjS7H4jwPtXj65zTDdxhPMxzuQ54FikVHd3OHFEkuTTNtJM1sEycy
	FlDGlSLAog79koV8Y6Ipq9PK3IM0pqVQDYtZIrTfp1D5pcQ74U5iwhXze9rQFocnxitcq/TuXwaNl
	xchzWM//Snsk8j+9cr2MpMJJqm/54qyYYc5tTkm7ae+O6Z6CCwZHUi4PMZR8Z7l0xHt+8PghJcakL
	22JDIOuUw8CL6qL8cwm6pAU0cKqodNsWL/C6fQTubwEiysVDMjuL21eCjT8+VCLw7IVe2SUiJ7emq
	NDJd8C+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LQg-0000000390W-443B;
	Wed, 25 Mar 2026 10:25:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LQe-000000038yk-1enW;
	Wed, 25 Mar 2026 10:25:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B05C64401D;
	Wed, 25 Mar 2026 10:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B4ABC4CEF7;
	Wed, 25 Mar 2026 10:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774434335;
	bh=pdk69hgSxYlxrpI3vu+iS6YkL5ihSIa3ahhwcNkHEv8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ijRD0SWDtG7zppuyabc/ov9G2Kds2J6Ylhr/Mv70/f8CC4uOiCCbZScx+c3fjbN71
	 UlEFP4LS7QudKOumBqxcd4jVFd1AsXbWuz92YcR6JBk3M/146ZmNMWrrsU6ifocyjS
	 hTdlrCVdrPAVwks8jXkx1kgOk+B6vxZlKb+2L2YvQai9Whc/82K/Sh/OzVK95zP60i
	 cthq+50u0lQkmceeGIYPnsWNHcet3shy/Eg5rRzrGMwv9jbRcHBUYeLBQYuEeYipII
	 llpM8eJB7597HyNvDCKo1Qdb4AuAVShjCHQ5Ouv73/aHGRUNnyWIrd1blc8WmirYPH
	 oweVsqIPkSaVg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B7DFEA83E;
	Wed, 25 Mar 2026 10:25:35 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v3 0/2] media: synopsys: csi2rx: add support for rk3588
 variant
Date: Wed, 25 Mar 2026 11:25:33 +0100
Message-Id: <20260305-rk3588-csi2rx-v3-0-754473981f39@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB24w2kC/32NQQ7CIBQFr9KwFvOhpUVX3sO4+FBqiQgGlNQ0v
 bu0SxNdziRv3kySidYkcqxmEk22yQZfoN5VRI/or4bavjDhwFuoQdB4q4WUVCfL40SRsaHTTGA
 DSMpGYTJURfR6LCv/cq7IRzSDnbaT86XwaNMzxPf2mdlqf+Uzo0BB97LnauBSw0kH51CFiHsd7
 mStZf63wEuhO/TAVMtEI9vvwrIsH/WMf14FAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774434334; l=2260;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=pdk69hgSxYlxrpI3vu+iS6YkL5ihSIa3ahhwcNkHEv8=;
 b=I0HG7NrC2CzWSq5p3raWhME1EI5+Q/FWJexuv2OuVi82Sra0oPmeUy9yih67qO3RPrEsuk+3i
 /vW8Be4pNuFDCRmSp2jDuZU9TcqjKgY7ztIqI12zCvEHLx5s1FETiLh
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_032536_486650_AD2847AE 
X-CRM114-Status: GOOD (  12.54  )
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

Looking forward to your comments!

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
Changes in v3:
- rebased onto Sakari's cleanup branch (as Frank's patches were
  merged) (Sakari)
- added Rob's Acked-by
- Link to v2: https://lore.kernel.org/r/20260305-rk3588-csi2rx-v2-0-79d01b615486@collabora.com

Changes in v2:
- use fallback compatible instead of separate compatible (Krzysztof)
- dropped patch 2 and 4 (as a consequence thereof)
- Link to v1: https://lore.kernel.org/r/20260305-rk3588-csi2rx-v1-0-0cd8d2bf28c0@collabora.com

---
Michael Riesch (2):
      media: dt-bindings: rockchip,rk3568-mipi-csi2: add rk3588 compatible
      arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3588

 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 10 +++--
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 52 ++++++++++++++++++++++
 2 files changed, 59 insertions(+), 3 deletions(-)
---
base-commit: 66bd47face7d5d55e6c3b5dc16fb3c2d6e205360
change-id: 20260305-rk3588-csi2rx-a11f7c15a40a

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



