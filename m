Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A46DCA100D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KxIb3qQperGU2Lvo4UCrc+/Exb5douXvp5f5vS6HC3g=; b=N5SPmb9EKjqdGG/EVE4SyEcsOS
	VUElL6vWPb0D3S8XefPOLtzNqAzQa9O7hg68KsGK1kNrjGi2Q0OSk0jvP18uQ9lLdizTl9vmRZp1m
	7KXjAPn/ySmayHpyYi7sHVFBeg/LwqxBTNWnW8oll5xXPTqNRUPcsx1crS4hg13jRUNHF2l0Dg8hA
	4JebQKjDJc06QI5RGAEhsSOt6Aor4wKQIoyOpsSlkzTRVx+ml1iYv2BjeDQ2ivE1q7CaPtY2ep/fK
	LK7ZYf0NL65KYiJhnnLfWAV6jNJc8TuszbI2MEoh3dw+tUFP0DFytb+EbtrRl/RjhD4kN8h1beTqc
	jbl4ZpSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFGZ-0000000EYwu-0EPP;
	Tue, 02 Sep 2025 00:52:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utBez-0000000Dtsu-2saE;
	Mon, 01 Sep 2025 21:01:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B6F39419E0;
	Mon,  1 Sep 2025 21:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88844C4CEF0;
	Mon,  1 Sep 2025 21:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756760512;
	bh=4CrokqEf8Oyhtq/Lgi/8eYv79LyWQCJPt1fZ+7MTR/k=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=AgLv11YIOm6/5UW8gHlkMmitCgN67jbXhaXRccK58g9Pj1acxJWe1J0amHJs7UKQ2
	 sBTSs2UgOmZTFUB+3XBsFLUaJyUOaBTU2fvnPrXLEQwfMJlS+FuucG3JOWfmm3HGrd
	 snLK/ZjPwhrZRCRlv4XsttQ0tqZnTy9LF63aivTd4whhLxpJkV61nut+GblFflp1Md
	 HYEu+3r5QbsTAbjy/dID3FqyqmRhDjDJG8zDw09sS6ajA5Ww8FcjFvdn+TiHPMd/BD
	 SeE2675Xm1ulS+iTpEsZ/FIHSRchdsa5TjsPob7nWnOIXXtFNpgkwdbYjVss1wbn4Q
	 Ws6W3kJphxEWA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76732CA1007;
	Mon,  1 Sep 2025 21:01:52 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v3 0/7] phy: rockchip: phy-rockchip-inno-csidphy: add
 support for rk3588 variant
Date: Mon, 01 Sep 2025 22:47:41 +0200
Message-Id: <20250616-rk3588-csi-dphy-v3-0-a5ccd5f1f438@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG0GtmgC/4XNyw6CMBCF4VchXTumF6DUle9hXPSGTFRKWtNIC
 O9uYWliXP4nmW8WknxEn8ipWkj0GROGsYQ4VMQOerx5QFeacMob2rIW4l00XQc2IbhpmMEq77h
 2tXWqJ+Vqir7H9y5erqUHTK8Q5/1BZtv628oMKHS1N8JwLUVrzzY8HtqEqI82PMnmZf7H4MWQW
 tU9lcpIxr+NdV0/6MrL3PYAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756759662; l=2265;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=4CrokqEf8Oyhtq/Lgi/8eYv79LyWQCJPt1fZ+7MTR/k=;
 b=Ua9pG946E3TVXk5J62FKrlwGkZTP22Uscs6kARSnHiU729If4wNnfo3rRTNLKeRzPr4I95I9T
 rxGX2eQ3tZtB4d7gaKaCIh37SKK8uyTDkB18w+wbdN14BL2dT5jBWdj
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_140153_776928_0967FB54 
X-CRM114-Status: GOOD (  12.50  )
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
Changes in v3:
- added if:then: for required 'power-domains' (Krzysztof)
- fixed restriction of resets/reset-names (Rob)
- Link to v2: https://lore.kernel.org/r/20250616-rk3588-csi-dphy-v2-0-7a94f079b712@collabora.com

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

 .../bindings/phy/rockchip-inno-csi-dphy.yaml       | 65 ++++++++++++++++++++-
 .../devicetree/bindings/soc/rockchip/grf.yaml      |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 33 +++++++++++
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c   | 67 ++++++++++++++++++++--
 4 files changed, 158 insertions(+), 8 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250616-rk3588-csi-dphy-c9ed2ad4cd9f

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



