Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C949C105F79A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 11:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HYixqQ6eXgSERY7xZl0DETt+oRc6gzvhBy6ijcF2bBY=; b=mpobhJ68MVa3jzVAQ1UkJ2L9B8
	P2iF1esupF7DcnCjZdzuDEgSxjHodjhcsyxwpGQPWItDLutRcS49jzDIh0CHfRe5HzU8glHCZblu4
	qRLxip9xlWJxf/VLXqjOBQwsheKUiFkg31BARXXee8KBt7ktafGPeAarDbTg7WYJ+Lq+T0f2gC9Il
	rmIcz6wuigVig4ligthV80khYTDea/84iRnoHqEebiz7Dy2gv1jFLmVbKzLl/Xo51O5SIo7aYjO0J
	qbW/XdQ/nthYe69f5aWI1fKzKgordcdSMqoAJh3Vhueds5qKyCWJOCKkKk1IYPx+FnF2pNY0D3r4Z
	VKl3sDXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10Nt-0000000HZrQ-1Kc4;
	Fri, 13 Mar 2026 11:08:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10Ns-0000000HZqQ-0YPL;
	Fri, 13 Mar 2026 11:08:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4579E6012B;
	Fri, 13 Mar 2026 11:08:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E45E8C19421;
	Fri, 13 Mar 2026 11:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773400127;
	bh=1o+QrPDOJChWf+XukZ3IFOH3/4JgpISUONKoL1ZBE2Q=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=O91bA33ey1zRFfid/ji/LfsfqI58fuhnpR4ZqgJVkyfCOlO2jb5yBrznL/XjHaKFb
	 AF66f7uB1kMZzhuTdfTk73ilR7B6XnbK5bnV7Y24d+P0PatpBO33M8MHJA9sSMq56A
	 cl1/SNjmx0QRsSf5fIUBrxrG5mZdoMF/3esiovmuUSpPHG6zIbdgfV09WHExgvVWj5
	 hC+lkXFydRDzDoUeka6fEEvzGduwSMvnVFdwHggm9QcOO9IczNbLV32us8q4GhuaV3
	 03a9/LDQ8w76J4jd9PoAEYSkL0WNvWF3V2U6ddnNhiH2hY06uT1MRkVamVFqJ3p+m/
	 Bg+NiW9sNkb9g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFDFF105F78C;
	Fri, 13 Mar 2026 11:08:46 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v2 0/2] media: synopsys: csi2rx: add support for rk3588
 variant
Date: Fri, 13 Mar 2026 12:08:44 +0100
Message-Id: <20260305-rk3588-csi2rx-v2-0-79d01b615486@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADzws2kC/3WNQQ7CIBBFr9KwdgxQq8SV9zBdDFNqiQhmUFLT9
 O5i9y7fS/5/i8iOvcvi3CyCXfHZp1hB7xpBE8abAz9UFlrqo2xlB3xvO2OAstc8Ayo1nkh1eJA
 o6sZidmAZI011Fd8hVPlkN/p5i1z7ypPPr8SfrVnUz/67LwokSBrMoO2oDckLpRDQJsY9pYfo1
 3X9ArGcVNXDAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773400125; l=2036;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=1o+QrPDOJChWf+XukZ3IFOH3/4JgpISUONKoL1ZBE2Q=;
 b=J+4k2TTV7k5qog3CWEp7rZ7ezRflWtpvTccUCsyTa67YHiKsxVARNg1aLF4W6nuAZ2NzcvT3r
 U0fniiW+lgrBlFkHKPMU4iy54GTsFTcGkK6M1sDyYHCHRvzdPHvJqzM
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
Changes in v2:
- use fallback compatible instead of separate compatible (Krzysztof)
- dropped patch 2 and 4 (as a consequence thereof)
- Link to v1: https://lore.kernel.org/r/20260305-rk3588-csi2rx-v1-0-0cd8d2bf28c0@collabora.com

---
Michael Riesch (2):
      media: dt-bindings: rockchip,rk3568-mipi-csi2: add rk3588 compatible
      arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3588

 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |  8 +++-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 52 ++++++++++++++++++++++
 2 files changed, 58 insertions(+), 2 deletions(-)
---
base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
change-id: 20260305-rk3588-csi2rx-a11f7c15a40a

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



