Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDD5CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 23:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+9vGZlkRoSZQ0Ks2SNBNpWDygHq5rHUDx3YKvWRcfjk=; b=XkZgpRgaNntJdBbs7PjwIbQhyQ
	VarvNCcyRtzaMuV9lqkfIALX3don5q2zGckgKwZUMkOa1p/iG0ToSXTKrPJ3TP2sD11KpynUkteqJ
	kUfjBrzvYcbq+AEgtSiqZlnnFdaHs059RM+0qTETm1UHIxH6Ksd49lSPm54j5nze9otNTDaoSNldm
	wfodZI4v2fBbmxIfqdhzSuhiF1mDeyCYdEt2a6jXO1S5i34zGHY/gHSftQW1bIkNkt1pdAYE035bu
	CszN87Jwves+f4pVlqIhfUwrriAvziWlFSLbLoO7ixaB2ztnUnbPdGrZLRo+Hi4OmU1V6hbS9nELp
	R21E5LkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo98o-00000008u1C-2AHM;
	Mon, 18 Aug 2025 23:19:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo93i-00000008tSI-2R19;
	Mon, 18 Aug 2025 23:14:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E1E4443D0;
	Mon, 18 Aug 2025 23:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55D78C4CEEB;
	Mon, 18 Aug 2025 23:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755558873;
	bh=1a1Pkt0EvyEZQWW/s13OKuuiFcIkA40/CYxanM3w+9k=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=SX6CB5T5IQuFDl6QNBZasScEdnsovVSJ+iwEP+Q36FfYmng+oIzVVzUYaIGbQwc+u
	 4269NHtijTkQRh22vaDb5oEK9QHRoxqgioyVHlsm2g51x32C9Tt35V1KS13whMjh5U
	 otU3OnSguBtN37aLjdm0HSlwWPsJF1Xn7emGBqcfgP5tFCv1AJtX6iorTktQ1Ueyma
	 d1hzYnJxNm9Kt4VZygo3PYobBG9/V8xnf4hShABy8LvCAqFTzWd6/CDfTZc1fuflM1
	 444VvIIwOIWvsEDjGIaAiflFTF6gDHFTySnCrpemMARkfLu+xrvfmiHWTr/vseQOA/
	 R6pIeKhg1S1uw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 443DFCA0EC0;
	Mon, 18 Aug 2025 23:14:33 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v2 0/7] phy: rockchip: phy-rockchip-inno-csidphy: add
 support for rk3588 variant
Date: Tue, 19 Aug 2025 01:00:34 +0200
Message-Id: <20250616-rk3588-csi-dphy-v2-0-7a94f079b712@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJKwo2gC/3WNQQ6CMBBFr0Jm7RgoUMGV9zAsynSQiUhJaxoJ4
 e5W9i7fS/77GwT2wgGu2QaeowRxcwJ1yoBGMz8YxSYGlas614VG/yzrpkEKgnYZV6SWrTK2Its
 OkFaL50E+R/HeJR4lvJ1fj4NY/Oz/Viwwx6bivuyVuZSabuSmyfTOmzO5F3T7vn8BzFVvw7IAA
 AA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Diederik de Haas <didi.debian@cknow.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Collabora Kernel Team <kernel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>, stable@kernel.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755558041; l=2041;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=1a1Pkt0EvyEZQWW/s13OKuuiFcIkA40/CYxanM3w+9k=;
 b=nPWx2kQxGMIhjPK6/OMn3h27OpqKKGQap4h9iXwezh+pNZgwJI5wgHNJGT5ugJKzXmJGwuA3x
 H238ii8w0vMAthBf7d7rZZBqQpiXMsaK3VME5mQU+9AzI+SfK2iQaYb
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_161434_663123_75DE9330 
X-CRM114-Status: GOOD (  11.74  )
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

The Rockchip RK3588 features two MIPI CSI-2 DPHYs (not to be confused with
the two combo MIPI DSI/CSI CPHY/DPHY blocks). The CSI-2 DPHYs can be
supported using the existing phy-rockchip-inno-csidphy driver, the notable
differences being
 - the control bits in the GRF
 - the additional reset line
This patch series adds support for this variant.

As you may have guessed, this is part of the efforts to bring the support
for the RK3588 Video Capture (VICAP) unit mainline.

Looking forward to your comments!

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
Changes in v2:
- rebased onto v6.17-rc1
- added patch that makes 'power-domains' non-required (Diederik)
- added patch that allows for different sets of resets (Neil)
- introduced name for additional reset line (Neil)
- fixed example in bindings (Rob, Diederik)
- Link to v1: https://lore.kernel.org/r/20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com

---
Michael Riesch (7):
      dt-bindings: soc: rockchip: add rk3588 csidphy grf syscon
      dt-bindings: phy: rockchip-inno-csi-dphy: make power-domains non-required
      dt-bindings: phy: rockchip-inno-csi-dphy: add rk3588 variant
      phy: rockchip: phy-rockchip-inno-csidphy: allow writes to grf register 0
      phy: rockchip: phy-rockchip-inno-csidphy: allow for different reset lines
      phy: rockchip: phy-rockchip-inno-csidphy: add support for rk3588 variant
      arm64: dts: rockchip: add mipi csi-2 dphy nodes to rk3588

 .../bindings/phy/rockchip-inno-csi-dphy.yaml       | 61 ++++++++++++++++++--
 .../devicetree/bindings/soc/rockchip/grf.yaml      |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 33 +++++++++++
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c   | 67 ++++++++++++++++++++--
 4 files changed, 151 insertions(+), 11 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250616-rk3588-csi-dphy-c9ed2ad4cd9f

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



