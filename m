Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A0F10AB82E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 23:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tVyhphJK+clUipdds2l0+XhFRXXaUfbC65Q+avDTm9s=; b=QrrTR/ZTjFbdCFCneALPpaPwmq
	wYf8VWbDf4GbiSggrp0VSOkS3H8q2WaQ/ZufwrGC9YPbqG+LUYPIvCAaIkIvU6IsznD7y6no+yzYZ
	BteOYq47yuM7D7htrFDA2S4cGe9996qISQ5rDj1PvAWPHGc64idhtPsy9rsoLnuK1YZszpgRFnh1n
	iG2SQqXrwPeBrQFYTVtyCncYf16HDi7WUEvI1lfBiqsRxq+FEPoEqnbSHRCenBKTAsup6AyEzE4nH
	cLuxpil6Tez/zlNOi29Di6O0o4m0xcLaAwmVNG4Amdr15vYyF8LlE3IRAC63yRfd6gQVmIedIhzBI
	uVPukwzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5tqC-00000006MoT-4Bqz;
	Thu, 26 Mar 2026 23:10:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5tpz-00000006MhX-0wws;
	Thu, 26 Mar 2026 23:10:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D589F4418C;
	Thu, 26 Mar 2026 23:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AADA2C116C6;
	Thu, 26 Mar 2026 23:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774566601;
	bh=F+kzzca6Z4BmvXweVJwbOgdkmwl7lP2kz+U6gv7BBLA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=oIne2RvdPcoDbq+Kwfa5qWAA3ZZzYjM/bhYHjOnZ9XoQ7QB21ZumiDlPbGBIELqlC
	 vxFTU6B0B3w5zIQN4KsQEnt4PU+gVbW4UUfXXtxYKNDYjxWDEwrH8iIo26k3YQnbS+
	 iHR9hJp2bSx4DOnp9VaMymDi/Wr7of90PSOiCPF1/wkxajh6VVqRHw1ZXhOuzTiC/S
	 LIfcTbXHKaF7+0DmlL1umZhK3gleQCHUs8MeK83Ro9nr1d8YzcVojbKr2a4Uuz6rWV
	 45ojr/+MPXlamah3r45qvfMxT0KdjPxtsAn1qWuO2pK3cXgphi+v7earYif+KsYZRH
	 /qaBtNyXS66eA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A41510AB82F;
	Thu, 26 Mar 2026 23:10:01 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v4 0/2] media: synopsys: csi2rx: add support for rk3588
 variant
Date: Fri, 27 Mar 2026 00:09:59 +0100
Message-Id: <20260305-rk3588-csi2rx-v4-0-81c6bcfefa63@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMe8xWkC/33NSw7CIAAE0KsY1mL4ttSV9zAu+FpiBQNKapreX
 dql0S5nknkzgWyTtxkcdxNItvjsY6iB7XdA9zJcLfSmZkAQaRBFHKYb5UJAnT1JI5QYu1ZjLhm
 SoG6UzBaqJIPu6yq8hqGWj2SdH9eT86Xm3udnTO/1s+Cl/ccXDBFE2ghDlCNCo5OOwyBVTPKg4
 x0sWiGbAqlC2xmEVYM5E80vgW4KdBE4Yy3tBHa0+xbmef4AvALURkcBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774566600; l=2509;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=F+kzzca6Z4BmvXweVJwbOgdkmwl7lP2kz+U6gv7BBLA=;
 b=Q31Ushq3MPm7/rk/deCaFnjvfmVxk9/KY9/ptu4vESyDcHaREKfCWa+676qoOfzvkuVYr5Aae
 cbQSVm2trRLBMNUxDD+5gf6NZwQhNeHbeOBdu4LveLZPK3i8dL1Rq8M
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_161003_312938_2C89491C 
X-CRM114-Status: GOOD (  12.41  )
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
Changes in v4:
- rebased onto media-commiters/next again (as Frank's patches
  are now there)
- changed "oneOf entries to enum in dt binding (Rob)
- Link to v3: https://lore.kernel.org/r/20260305-rk3588-csi2rx-v3-0-754473981f39@collabora.com

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

 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 11 +++--
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 52 ++++++++++++++++++++++
 2 files changed, 60 insertions(+), 3 deletions(-)
---
base-commit: 4fbeef21f5387234111b5d52924e77757626faa5
change-id: 20260305-rk3588-csi2rx-a11f7c15a40a

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



