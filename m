Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9065ECD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 16:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nC7fI2xlC+0mnJ55zqPpQ+tiYuAYGaZtwmTC8nFyd+Y=; b=A+oetEXK5ubiyg92GP2DY+xkb8
	RTuEIzcOWEg8cGIv0eEkCWqWlWR0MiDnvzzGM8epvnv+oPt5Z6USIcV69sRupxwKpe1HQUAsl8/hq
	TuCOEQIhE0ClMHCUlKA3bsVB2ZqcR1kUpF0j1kKnr3zc62JOQgrihqsBcNCLqMaXLhGUcwEDU+h9u
	9Rje7dLPLl5SD0F58EOrgU4J/imZ2/2mIA1BmpTr6WO2y7XDkFYu0G5Km29z9HAQC/H/OsbysI1/E
	6bDqaD0+pvIuu8hs+Stu999yZYnmF33YVraw9xCuNMj+pZhk1RbBpxmEa2D6QMeAu8DSHtRq+YEje
	nfMilP8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5Os-0000000BTK3-0L4c;
	Mon, 01 Jun 2026 16:22:02 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5Op-0000000BTJ2-3kVW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 16:22:01 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso15556665ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 09:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780330919; x=1780935719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nC7fI2xlC+0mnJ55zqPpQ+tiYuAYGaZtwmTC8nFyd+Y=;
        b=fWigyr9iwcmIINOG5wN1sgNshgd3srrQdpxNBx5NIF+AWFxX7/QXvXmILgcF8CB2ve
         PFlo0CARxpK6Bp6sTPN8BdGts7oe0k1Pqw+7MZ+PoVQe2kvpSo/pKxFuQUKQIlQsinLg
         KIChZc2Aw1l2suXrB8+4zdjIql8lJu+bSnemjPjd1psS/wHIpo56uIDVFZz4TPLwJwUq
         u3OBigBmLA9OWAE9kiuVT1NwI9WXikqI3QOH0XL9oklm/pHxmaDpOfI1PNvshMBgZ5Z4
         2+zhLmKgVCXcNrP8ojo1gdoKTSZjk30yQeZ0mueOr9WSifnU7vDoZujAEj2m7fd06Met
         dF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780330919; x=1780935719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nC7fI2xlC+0mnJ55zqPpQ+tiYuAYGaZtwmTC8nFyd+Y=;
        b=Z0581Yy5Q7fcWWWsU86ryPwdnBOei7cert/jJMCQqOv+g5Z4kHjD7Jb2A5TOg787ZI
         0rp/glLpi1uZ6+gUXx7gzRnY5hXrevi89b5nwNUQlcr4T/lb6Sg060b9Db+23uAfnGBn
         785Dsmgk5AEa5psMsuqH8KpXQITCl01smZO9ZkhauCaFe5EJiyKJXQsRZhUbWMBsp9cV
         pcSK645Yp7vyTwAtaIQwcpnhPDsUqO4aU0g2CmB+yj51F9M0s/AVovuOwMbNMuHyAoBJ
         S/IlJYRpZ4Pv1yZxT8hgdwNhDwkacEzp9sEDnfMfpNdf3BmAd9OtWajANsNeAGvRfPN1
         slog==
X-Forwarded-Encrypted: i=1; AFNElJ9mumGK9OukQb8Jw53osQe2nBo3imr1aySpBQYiGxl4kYQzabaVq9oJ9W5ejp8s2Bn+HARus/OVnHWwlbBPertC@lists.infradead.org
X-Gm-Message-State: AOJu0YzVNxvD3plxNs3YQKXrPRQEXaTPA4SQS/FDnFXNvJBpn2PWicQ+
	/KXog3cOAux2NwbkF2InO+C029BedktotxLsLiiRubsOnBaS3RANtqhC
X-Gm-Gg: Acq92OFMYcCrGr3pPMBqJp6MD4RDjIa2OtPKHIWXJVSmh7Im34QhNkOx6cAtTbml814
	E4BS01wHlqxTO3uAN2uJEZ11zBQFGq1K2akbgrPNDNrlG+8naKBNSL+aKofYdPHZXP+iOWuc5WC
	Zhb8vdWTK9m3jVPbIeRm2tEYdtAzGrqkCLQRiHqO3oqKsySWNfSRsGdfvMgkNwVlGoL7WymWrE/
	yyEHActQ6jXvlK3JbPmvKk1QmnQCBdmfbVn3mG9gBRhET7xt/HX7ahdU4lZynO5kY7tVGS+rODh
	z8vEe8DfVo/2wrdCstER/l76hxZwiPM/ZHEaCVeV2s0as+mVr++76DkeAhK9g2UT/nITEx0oxkf
	yAsZvef4B1q5sotSahfgvcFn38b+8uA7QpcF6UzqgEaWj//oUxEZ36VXLPYXm3x254+BLO8qZmt
	b3n8FT1poU2FxKt+O8wRoEB/WvgiYMhHx/gxg2AhQ9
X-Received: by 2002:a17:902:e842:b0:2c0:dd75:e834 with SMTP id d9443c01a7336-2c0dd75eaa8mr57620815ad.5.1780330918890;
        Mon, 01 Jun 2026 09:21:58 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e5d83sm116647455ad.8.2026.06.01.09.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 09:21:58 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v6 0/3] arm64: dts: rockchip: add Vicharak Axon board support
Date: Mon,  1 Jun 2026 21:51:39 +0530
Message-ID: <20260601162143.170030-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_092159_935602_D8914DAD 
X-CRM114-Status: GOOD (  13.02  )
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

Changes since v5:
- Enabled `i2s5_8ch` and `i2s6_8ch` CPU DAIs to resolve probe deferral issues for `hdmi0_sound` and `hdmi1_sound`.

Changes since v4:
- Re-enabled `combphy2_psu` which is a required PHY for `pcie2x1l1`. (It was incorrectly removed in v4 during the unused PHY cleanup).
- Fixed alphabetical sorting of `rk3588-vicharak-axon.dtb` in the Makefile.

Changes since v3:
- Completely removed `sdio_pwrseq` and `wireless-wlan` pinctrl nodes as Wi-Fi/SDIO was already removed.
- Removed unused `u2phy0`, `u2phy0_otg`, `u2phy1`, `u2phy1_otg` nodes to fix orphaned PHY warnings, since the USB 2.0 host ports utilize `u2phy2` and `u2phy3`.

Changes since v2:
- Split the dt-bindings patch into two separate patches: one for the vendor prefix and one for the board binding as requested by Heiko.
- Removed invalid `enable-gpios` property from HDMI nodes (ignored by dw-hdmi-qp binding)
- Fixed copy-paste error in `rk806_dvs1_null` pinctrl node (gpio_pwrctrl2 -> gpio_pwrctrl1)

Changes since v1:
- Renamed the dts file from rk3588-axon.dts to rk3588-vicharak-axon.dts
- Added binding patches for the board (rockchip.yaml) and vendor (vendor-prefixes.yaml)
- Renamed regulator nodes to the standard `regulator-name` pattern
- Removed `mem-supply` properties and phandles from cpu nodes (vendor-kernel specific)
- Fixed pcie20_avdd0v85 vin-supply mismatch
- Removed obsolete `regulator-compatible` property
- Removed invalid `regulator-init-microvolt` property
- Removed dangling `enable-active-high` properties from fixed regulators
- Cleaned up unneeded i2c3 / es8388 nodes
- Added missing `vpcie3v3-supply` properties to PCIe nodes

Hrushiraj Gandhi (3):
  dt-bindings: vendor-prefixes: add vicharak
  dt-bindings: arm: rockchip: add Vicharak Axon board
  arm64: dts: rockchip: add Vicharak Axon board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588-vicharak-axon.dts     | 991 ++++++++++++++++++
 4 files changed, 999 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts

-- 
2.47.3


