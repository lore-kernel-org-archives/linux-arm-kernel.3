Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB72C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 23:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q4tJ4e3YFFwP8pJmLEIFgWm+skxWjvsYmYSFJ9yFxYc=; b=vmCPCtgX8TslPGHYFgMz1Izg7q
	a8q2QcStY4rq5/FE4vEsaMBQb6Lw2JSicUmfS9OqAqQNK0lTLW0IQ3xKWn/LM9fbUzrWO3W+6Djs6
	1bp21HVB+YnzKDQ4rm237G/X40EQLHIqnq2m7yVw3wD50DRUg0soL9+Dc6WhR5D4i9d7kF1JbnulA
	w6XCS1Zmi3xKRy+BH57HPkmE3W8B4rxorL1DhSwLd69bAtVLJKujvWyTwqXIVWbhB2uZ8lcwAs4ao
	tNk7KBO7WqSgkxMh6mjLV7SIkRcwwXQ2C23bPymNHQfmMpnLz7vSKsJPqh8fJZ3q3aevQZI502H7g
	ZnTZqzsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDB1l-000000022BG-3KqG;
	Thu, 08 May 2025 23:51:45 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDAzn-000000021v9-3W5z;
	Thu, 08 May 2025 23:49:45 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 64BA326050;
	Fri,  9 May 2025 01:49:42 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wtwmwACksPdI; Fri,  9 May 2025 01:49:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746748180; bh=PHkzmazZbYNFsZ8Z3dXZDpcjBGKxVGnG8Eabx+LYYTM=;
	h=From:To:Cc:Subject:Date;
	b=OzDZXw2KUUb2OxfCLHMDc5LhJyFyLcLncTZRGagZbFbXZSib+MDfa5fLDsyrrXbcz
	 KnayWORxO1F2EXRhsYGZJnUf5tScLUP5a37+bfc2+opyr170FfD3de9ADU3pzOJKWv
	 vbEleZo7153Nl0V5yF/dKmmE4KQIKQ6lWxeM4VQiz2+crq21WAeHrHA3KefodU1zKL
	 Ts/cfYztat8qUHpHbPgQ8zVlXYAmyd4WLZl37732a6chki9c3y6CHDxDRAuSi1mkVH
	 xRj1HMe5oW2GlkRy+l+c//NZkecCq0bzHNn1XBceyilB0ZmbHKfG+J048cfZx0QYmo
	 PHUWdayt7oLrA==
From: Yao Zi <ziyao@disroot.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] Support SD/SDIO controllers on RK3528
Date: Thu,  8 May 2025 23:48:28 +0000
Message-ID: <20250508234829.27111-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_164944_012498_DD7436D7 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

RK3528 features two SDIO controllers and one SD/MMC controller. This
series brings the SD/MMC one up on Radxa E20C board. Both HS and SDR104
modes are verified.

- Changed from v5
  - Drop applied clock patches
  - Rebase on top of linux-rockchip/for-next
  - Link to v5: https://lore.kernel.org/all/20250506092206.46143-1-ziyao@disroot.org/
- Changed from v4
  - rk3528 clock driver
    - Switch to auxiliary GRF
    - drop rockchip_clk_register_grf_branches
    - Rename branch_mmc_grf to branch_grf_mmc to make style consistent
      (with branch_grf_gate)
  - Link to v4: https://lore.kernel.org/all/20250417143647.43860-1-ziyao@disroot.org/
- Changed from v3
  - Drop applied binding patch of MMC controller
  - Rebase on top of linux-rockchip/for-next
  - Link to v3: https://lore.kernel.org/all/20250309055348.9299-1-ziyao@disroot.org/
- Changed from v2
  - Apply review tags
  - Rebase on top of linux-rockchip/for-next and drop applied patches
  - RK3528 devicetree
    - Fix accidentally dropped status property of saradc node
    - drop det and pwren pinctrls for SDIO{0,1} according to the
      reference design
    - Correct max-frequency for SDIO{0,1}
  - rk3528-radxa-e20c devicetree
    - Don't disable sdio for sdmmc as claimed in the hw design guide
  - Link to v2: https://lore.kernel.org/all/20250305194217.47052-1-ziyao@disroot.org/
- Changed from v1
  - Apply review tags
  - Rebase on top of linux-rockchip/for-next and saradc v2 series
  - rk3528 clock driver:
    - explicitly include minmax.h, replace MAX() with more robust max()
    - readability improvements
    - fix error checks: ERR_PTR(-ENODEV), instead of ERR_PTR(ENODEV), is
      returned when syscon_regmap_lookup_by_compatible() fails for missing
      such syscon
  - RK3528 devicetree
    - Add default pinctrl
    - Move the per-SoC property, rockchip,default-sample-phase, into the
      SoC devicetree
  - rk3528-radxa-e20c devicetree
    - Assign sdcard to mmc1
    - Add missing regulators
    - Apply no-sdio for the sdmmc controller
    - Sort nodes
  - Link to v1: https://lore.kernel.org/all/20250301104250.36295-1-ziyao@disroot.org/

Thanks for your time and review.

Yao Zi (2):
  arm64: dts: rockchip: Add SDMMC/SDIO controllers for RK3528
  arm64: dts: rockchip: Enable SD-card interface on Radxa E20C

 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 30 ++++++++
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      | 69 +++++++++++++++++++
 2 files changed, 99 insertions(+)

-- 
2.49.0


