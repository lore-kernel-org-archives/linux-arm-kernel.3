Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E155CFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H8uEiNo0VeIE4vtDSlGUOoatFGJMh/Ck5o4u3qlBpIc=; b=C6ceM6COuCkHXqHzHbMBaJM9ZT
	xN5QL+lkb3V4XUqztcZ9BG0drUUwxfLlacVx5B8GsHWEwSXJpPmro3stNGSzT+O6rhLSA8q7vxEeu
	Lu6ONuU2BAjCL+dqYBDzr/Nx7+3E7cMztWSJMyofUByO+DXk7lqFOdte973eJ6PpqG2zmviNB7fuu
	dxB/fJE6iFearRTNkBkgfMJx71j5tacWvUlYU5ysLHaChbkfCDzJZY7p/TLRS1dCNz9YZl47D/srU
	pzueL4YlIt//MziIXhzx38EbYsKFk9pRFhb3vvOy1izLGtL8u7OVF56bL3KazUAmEQoGUWtZoUb+N
	pzHuim0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcqy-00000000lmE-36x6;
	Tue, 28 Apr 2026 07:27:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcqt-00000000lj4-0ark;
	Tue, 28 Apr 2026 07:27:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9BE6143E90;
	Tue, 28 Apr 2026 07:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 729A2C2BCAF;
	Tue, 28 Apr 2026 07:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777361245;
	bh=cOCFZjd7RXNktRNhFi+WwngiMUpyxWBbJzfzYRqEYPM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=MXAjMJu7qhBYxlsWu1m6Z+YyoADU4pq3AHR/FtGTA+dXri+XlsJzi2BzYDt8ewVIM
	 59X4t/jSEfy38wzaQ45KTxS+bnXK5y+JYaDxkLAi43f/9mejh6rO0kGVNhpSxuQl+t
	 FASjZQuvUOo0v2BttYdfv8WfDuQkYE9DOT04J/7dM3IwCYKAQ4IIG5c5nqahm/Ha1v
	 s9w79cmm9jCvbt3U0y+YNqX06ZtHbfsNnS2/5QP9foDiFVvITGNvxtYI9nDCQd5hWW
	 QZaF6CuBqgacZsVevs23k1mgMvUfQR7HcUIhxmg/CwqbOe+neoBVL4ij8dzaCw7Ceo
	 WBLP05no3EFEw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E6CDFF885D;
	Tue, 28 Apr 2026 07:27:25 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v5 0/2] media: synopsys: csi2rx: add support for rk3588
 variant
Date: Tue, 28 Apr 2026 09:27:22 +0200
Message-Id: <20260305-rk3588-csi2rx-v5-0-3b7061d043ea@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFph8GkC/33NzW7DIBAE4FeJOJeK5c+4p7xH1MOyhhrVNRUkV
 qrI716cY5T4OCPNNzdWQ0mhso/DjZWwpJry3IJ5OzAacf4KPA0tMymkFUoYXr6VcY5TTbJcOQL
 EjsCgFsjaxmMN3BecaWyr+TJNrfwtIabr/eT02fKY6jmXv/vnAlv7il+ACy5ocIP0UToSR8rTh
 D4XfKf8wzZtkbuCbELXDwK8BaOdfSaoXUFtgtG6U72DqPpngt4VdBMckPUUQ0SrHoV1Xf8By+V
 gWokBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777361244; l=2718;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=cOCFZjd7RXNktRNhFi+WwngiMUpyxWBbJzfzYRqEYPM=;
 b=b8eDH2iJ05fbZA2wyw0TtBzDDkPV2Zzh+lBJWn6y5BFw94DYqjngvqOHPn1r3X/lhDIcFPnw6
 uzKk2S0vf5+CBJx+SUaJ4mpulhuEzqL5FaXORdcnnCz35Umel6rJMt4
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_002727_228590_0C1A8346 
X-CRM114-Status: GOOD (  12.47  )
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

The MIPI DCPHYs (at least the CSI-2 features of them) as well as the split
DPHY mode of the DPHYs are not yet supported by mainline. However, we can 
already provide support for the MIPI2 and MIPI4 units.

When support for the split DPHY mode is introduced, the DPHY nodes should 
have the property
    #phy-cells = <1>;
and the MIPI CSI-2 receiver nodes should have the property
    phys = <&csi_dphy{0,1} {0,1}>;
in case the split mode is desired. Since this is a board specific hardware 
design, the properties need to be changed in the board device tree (or any 
overlays).

As reasonable default, however, we can define, e.g., 
    #phy-cells = <0>;
and
    phys = <&csi_dphy{0,1}>;
in the SoC device tree include. This series introduces initial support for 
this default configuration.

Looking forward to your comments!

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
Changes in v5:
- rebased onto new media-committers/next (= v7.1-rc1)
- reflowed commit messages (Sakari)
- Link to v4: https://lore.kernel.org/r/20260305-rk3588-csi2rx-v4-0-81c6bcfefa63@collabora.com

Changes in v4:
- rebased onto media-commiters/next again (as Frank's patches
  are now there)
- changed "oneOf entries to enum in dt binding (Rob)
- Link to v3: https://lore.kernel.org/r/20260305-rk3588-csi2rx-v3-0-754473981f39@collabora.com

Changes in v3:
- rebased onto Sakari's cleanup branch (as Frank's patches were merged)
  (Sakari)
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
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260305-rk3588-csi2rx-a11f7c15a40a

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



