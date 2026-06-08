Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB32CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 06:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=trzFQSB2Wm8IfEtKAHfvmXUeOQsaaBc4Q94uE4SJiL4=; b=2WiCLYqDS40L04UFumnPsVDR3Y
	WcSvAE9aJJaZbx33IeM08rVcpOHwndjzPrSVX8J9L8WiEd1qC8yh5Bimj5RtbjG5tgvUE3gUDqHNZ
	l2jvJ9xWk4sw475JcTiO5bo0aSafhVjnkNyxRv6ym/y6lYHu67NmD1oI382uCec32+C8zokEHznQ0
	ECi8tWaWAo4PZmEP3wa3G29TtLzuVClE///iGmgjbI8T0JyKuU31aM/dxGVc2lEwBO6e67M3YgfWn
	XyyK4A6LeeRQ3mBqjUhgwomR67C48H+Se1lxmI+wS90vIBECkZNlWTFc7fzcEvNJ3JECM/4l/hzFm
	9Klb2p0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTBb-00000002sOq-35jy;
	Mon, 08 Jun 2026 06:10:11 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTBY-00000002sO7-2qme
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 06:10:09 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-36b903567fdso3919182a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 23:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780899007; x=1781503807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=trzFQSB2Wm8IfEtKAHfvmXUeOQsaaBc4Q94uE4SJiL4=;
        b=A9u4I3rGEb1As/d94jN6uyk8hVC9mWxu3Hrf9PkapQqvAiqY7NIpsGkHPasslTP4NH
         Q4UrTIPjIRcDDaiLIZitRWSD+SNvoMdXeadT86zLY/+fdXsUZQrY4ou42nM7H2Mn/R8r
         2kcfUNABCf5yb7BYwVgRidV387923hAb91Urq4QaMCgDddwD3OVhudMcw+KIkUGgLBco
         qNJjPlpekMRXxxk5c7/TbFw0kVDPEAV+kiV6/ORXnwNE5HAQB4Lr3FxL89P6YhoabPUC
         ytTXAEm9tt1W9AD3vqF9yHqvcgead1ciTkPItOnFBI3gf1r46xs9mVLaRqrUg/MAliuh
         KENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780899007; x=1781503807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trzFQSB2Wm8IfEtKAHfvmXUeOQsaaBc4Q94uE4SJiL4=;
        b=jGuNAjmR/gCheAtwSoYBvchwHNDQz1d736fkEpeFNmxhvTZnule5yHMp83n9ovMG3T
         0J5BjsEuReOqueS4d7U+Tz9jeTCMXsRVBf8cp5QG+XiZ9djHphCZTBZkvHz2ErKFvR2p
         NnNwlfpErl63nmJa6l4itCvAg6OxqejwdL+uA5su1TpHloEidYZ5+KXu+2boQM8AE2Kd
         Im1ihq25N4/qWIDNiya0WV+FYh2srLN7W91jAOfJe3fGAga6mV0JyjjaoutWu3wm2Rma
         z1QDuz4aTkFST3FmpBXtoWQujtzR7ao97DtRNcsnwe1QpDKhyma2RNLoo5YLHBZJnMja
         aTHg==
X-Forwarded-Encrypted: i=1; AFNElJ83Zga627TqBLxi49VdzKCv6n4h7ei9YpzZgkuSf3d8N3NBiPDOqvr59BJi0hv19bAA5CB3EAMn1NyWl57vK4Bx@lists.infradead.org
X-Gm-Message-State: AOJu0YwODDXvz2EkB2aZMF5aFs43tYTe/DKTwm9iadxnnPMvgd4cE72s
	vO+5RzQIzO2DjkuJ5U6P0IW8Lvvn5kzaT8sPUKh64hDEnQV76AQJKGtg
X-Gm-Gg: Acq92OE4hrObHbFs3rdVMc0mYXJMB5SHa4dVhbTNZJI3f/8XUQ2kVc+2L+SEl2j+6qx
	ZZykjvL0qtWFp8AgwxWdTDTpbQd1oh71tZR+XT4VJl1Jv0jOVzdJtcc6WSLVgWfjPuFnJAy4I03
	lQShxgvCdpq1HvKx0+MVfrhs4YzysX5qfE0FnAdTNyfO3H8TSakDHEZd7iUChYMUW+uqBgU4EoY
	Hs4nBdebi1FgZ+KIYqJSmCIVdWGujuIEFZFyll3J6/OzPzy73ZMU3jGEX/vcKGRsCGw3Mgfeu2i
	VzL/4SiKimjveFa6IQbyXrG8llcAWGPiCrkMf33nyptYUr9CD8shKP0ejqEZ0oDU4Uv1Ti26uti
	eI4sdtJEmKv4od7dn14Mkw5HzzEepTJMjlvd1idI0zcrAIMtZJX2T00nNsj0S6rLzjgOKaCs7Q5
	jcv7JWwkcSz1SAGn5nDXrqYV+FxglQasZ0QLLERJYmkvMESE2Erl8=
X-Received: by 2002:a17:90b:1ccd:b0:368:a297:bd38 with SMTP id 98e67ed59e1d1-370eedfff8dmr15054026a91.7.1780899006793;
        Sun, 07 Jun 2026 23:10:06 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6c668e98sm15065026a91.5.2026.06.07.23.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:10:06 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v7 0/2] arm64: dts: rockchip: add Vicharak Axon board support
Date: Mon,  8 Jun 2026 11:39:38 +0530
Message-ID: <20260608060940.52549-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_231008_747047_080450E0 
X-CRM114-Status: GOOD (  12.37  )
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

This series adds initial device tree support for the Vicharak Axon
single-board computer, which is based on the Rockchip RK3588 SoC.

The Vicharak Axon is a feature-rich SBC targeting developer and embedded
use cases. It ships with:

  - Rockchip RK3588 (4x Cortex-A76 + 4x Cortex-A55)
  - RK806 PMIC providing all SoC power domains
  - eMMC 5.1 (on-board) and microSD slot
  - Gigabit Ethernet via RGMII (RTL8211F)
  - Dual HDMI 2.1 output and one HDMI 2.0 input (receiver)
  - PCIe 3.0 x4 and two PCIe 2.0 slots
  - SATA 3.0
  - USB 2.0 host ports (EHCI/OHCI)
  - NXP PCA9554 I/O expander for status LEDs
  - Haoyu HYM8563 RTC

Changes since v6:
- Dropped vendor-prefixes patch; the vicharak prefix was already
  submitted upstream by another contributor.
- Added Acked-by from Krzysztof Kozlowski to the binding patch.
- Removed redundant status = okay from newly-defined nodes (leds,
  hym8563, pca9554) as noted by Krzysztof Kozlowski.
- Removed stale mmc2 = &sdio alias (sdio was removed in v4).
- Removed leftover #include <dt-bindings/usb/pd.h> (TypeC removed).
- Removed unused fixed regulators: pcie20_avdd0v85, pcie20_avdd1v8,
  pcie30_avdd0v75, pcie30_avdd1v8, sata_vcc_5v0, vcc0_4v0/vcc4v0_sys.

Changes since v5:
- Enabled i2s5_8ch and i2s6_8ch CPU DAIs to resolve probe deferral
  for hdmi0_sound and hdmi1_sound.

Changes since v4:
- Re-enabled combphy2_psu, required PHY for pcie2x1l1.
- Fixed alphabetical sorting of rk3588-vicharak-axon.dtb in Makefile.

Changes since v3:
- Removed sdio_pwrseq and wireless-wlan pinctrl nodes (Wi-Fi removed).
- Removed unused u2phy0, u2phy0_otg, u2phy1, u2phy1_otg nodes.

Changes since v2:
- Split the dt-bindings patch into separate patches as requested.
- Removed invalid enable-gpios from HDMI nodes.
- Fixed copy-paste error in rk806_dvs1_null pinctrl node.

Changes since v1:
- Renamed rk3588-axon.dts to rk3588-vicharak-axon.dts.
- Added binding patch for board (rockchip.yaml).
- Renamed regulator nodes to the standard regulator-name pattern.
- Removed mem-supply properties from cpu nodes.
- Fixed pcie20_avdd0v85 vin-supply mismatch.
- Removed obsolete regulator-compatible property.
- Removed invalid regulator-init-microvolt property.
- Removed dangling enable-active-high from fixed regulators.
- Cleaned up unneeded i2c3 / es8388 nodes.
- Added missing vpcie3v3-supply properties to PCIe nodes.

Hrushiraj Gandhi (2):
  dt-bindings: arm: rockchip: add Vicharak Axon board
  arm64: dts: rockchip: add Vicharak Axon board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588-vicharak-axon.dts     | 926 ++++++++++++++++++
 3 files changed, 932 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts

-- 
2.47.3


