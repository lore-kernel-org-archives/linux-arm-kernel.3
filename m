Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA24CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 16:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZOW9HKlKoTKY1oUKJi7UP051gVLaLxiL0BRWcGTFTec=; b=KZriXm/EAcK9EKonVUb9tQBqGF
	Rr0+XNrT3y3JYdF4fFtH7S/wOk84Ot0vp11FE/Zp6eyatU/pEp0z+ngK19QTGhtS813af4jzva32s
	h1+i7o28U4ZrclaUk14sjXtbnq7ap3d/EGnynTsuWe/o3O/073hp/p4pAb70yfw4JiEw3UJ558yK6
	zpm6pMQKky4BWINGkn0vueL+KLBYyg2DM3GTapeENTI/8rPQVkYSU5pmdsgGsTw6q5L0/N5rc5DX+
	xK9VNy4I3pTYpCAkYHPQLpDTzQPqzNbDP17sF17Jkv4lkRRzRPpghBuGKPeGKYu6E0yb1QKeTyKH9
	0vikX6vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU59m-0000000BQmk-2hcQ;
	Mon, 01 Jun 2026 16:06:26 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU59k-0000000BQlv-2tgQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 16:06:25 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-36b9b15af73so4100242a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 09:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780329984; x=1780934784; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOW9HKlKoTKY1oUKJi7UP051gVLaLxiL0BRWcGTFTec=;
        b=Wq3sYFHAoKTHYim8jnMlwZJKcApySGFoFD/t1OTZOeDSbvA1CvNBxdXqI1EDI//QR5
         9fXV9l/6F42hIKrGAZxl0adElO4PwBv0lM66FgmyKVLPvNL4eZxstD6oHEevZ5nMdTTD
         K9m4HWNeufiyrl9guaPxudtKTmFenmmjY1NCPKRQGec2tqpCAgv/T6o3K8JUQnu7hS1A
         Gw8iTPT+DXgyHroUraRFo0ffXewCuIT6Do2Iqf5C5j+wEicJ5kvVm+NbvYGOy7u9WR8x
         tlF8AKSYHFW03duOBokBogJ5+kMFa+XXbjWAJrrmV7buY8xoQExlddpPpdskGVZWHnRV
         o/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780329984; x=1780934784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOW9HKlKoTKY1oUKJi7UP051gVLaLxiL0BRWcGTFTec=;
        b=O0HMZxcgE4wBWOLg10Dhuf0Se3tN+ZBSM6WULjotDMp4XIkc+K1JHvoKn8Xg5FIIxQ
         tC6/3j8XtElVwbjEASvKs8cuNBKo1xS+pWXRZceoMztPMNsocgBEHdluY2Hbz8sZZlWC
         A2rVEJct0qfoN+Lm+JtrEi4xkv1CKDke2lzFPuptRbeVc55ypSb4IlmNi+gb4FX/yuDn
         iz11iGO0J5DsvQOflC2WZNHJFEdKkFS8TlamKiG4okBg29iWFTAOvzmiFTrLPDY89H7U
         QlPK67Ot8x9I3JkQ1Xajm52RJq6ZPwSO0QPCoOJjCl07o4geiYzlrsT97aPZl3O0EUaY
         jAAQ==
X-Forwarded-Encrypted: i=1; AFNElJ93tvrDOXXamQ5Iup7WI1EJJf2scMPnbKS8Q5/ka3aG5LYg8DIj+0uSxiqnBkVzBcG9885qMmTkaPpggDsydmEo@lists.infradead.org
X-Gm-Message-State: AOJu0YzSrgBn0PhU/xtYfHCWeA3RHZynvEfIvWIgTpCJ3koed+AoTV6E
	HvcGdmKrgdPuuJM/YF3Z2OJiHo6BAOIpCm9y/r3lQCeauIH3NWDa7bhr
X-Gm-Gg: Acq92OF/2c5RApNzkFUHe8GYTYejVjz8v6zv+z2zSjOaBJqKsWeieksCED7zG1Nt6DJ
	NwQ33XXnmZprbj3rjQdzf/m6BC5/97ce3usnH+Lv1BVFwKV3nXn2ixOSDrtDT4VDMgVYTvNUnCs
	VbE82D8LCrhxArAnOlnKFPe4qyzFrYW4ys4rhGt+u0b2E2kX/kt0BY/zqOHU6o7D4AcDsa8AHVs
	L8Gt+W4j0PMRjqPksaJaraPVLgAf1zvSM9BopTz4S5b511XcW1UTJg80q06cNkl5ZzDHVUjPvjF
	JF2qKAhyetqcmjLUx5F50/2Afnt+CWzi2x3cI8OybgIoGlxUhQ3NbB3dm31t9wwGcrjm9JNdDvM
	Fx8/vo+AYj3YXrHLlOQmUHL/KhPMRk2i7vW7coDI32gIwvQfuvH/apPg4gtBgWxPfnYz6NvDmg9
	D4g9vKOjFYhpcLjVKHLScGYRdn7YH7E9ZhtEV04bVt
X-Received: by 2002:a17:90b:4cc8:b0:366:1172:597e with SMTP id 98e67ed59e1d1-36c4ff6496dmr11193976a91.9.1780329983689;
        Mon, 01 Jun 2026 09:06:23 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd9205ddasm64218a91.14.2026.06.01.09.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 09:06:23 -0700 (PDT)
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
Subject: [PATCH v5 0/3] arm64: dts: rockchip: add Vicharak Axon board support
Date: Mon,  1 Jun 2026 21:36:00 +0530
Message-ID: <20260601160603.167706-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_090624_733875_0DC2F3F3 
X-CRM114-Status: GOOD (  12.42  )
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
 .../dts/rockchip/rk3588-vicharak-axon.dts     | 983 ++++++++++++++++++
 4 files changed, 991 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts

-- 
2.47.3


