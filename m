Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99751CCF2C0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 08:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fdiQVOV9kGikp3BjxuFAHEh6NTE83RldKRLkuMUOTzA=; b=yI4nbPaZAX3uqc
	lV3ZUmS67SEeKeii4CBfH2o3I5MFLelB5lV0HsF2Wg7gUX72T1FfXC3vYkT3/mjaAS3eP7p0WNntv
	Pe92lwu2QR+4Dq07JfrHatJk1MY9TevwXTktmTQT46h8e0hzHQt0BuFdaTm0ZCFPxC2bhZNo1yShd
	X0OnyOInXqHrPKJcl6YDaLNv6zaEesXY5sR57PVBw9q0PbBMVgwFRH7CO3xJkPUTQxHcLgZJL92Tp
	aK9kED2BYNeW1r9eYIWohndsIIZ1KmiewsbAG0FEbcIIEDbaIWyEQb4SONT1GtTuWJ/ZsdFzo9wFL
	qmdLFC2ERg2X7b3yuaxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdkA-00000002O3d-3QWq;
	Fri, 16 Oct 2026 08:56:50 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdk8-00000002O2V-1DHm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 08:56:49 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ddb35cf9a4so4473195ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 01:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141007; x=1792745807; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fdiQVOV9kGikp3BjxuFAHEh6NTE83RldKRLkuMUOTzA=;
        b=ChC5UJ7vay0fOGL27VGpS3quZ6ZSc4E0oCmy4hxhdkf6ERsqwR6bQdufKtZsXk9l/c
         0tp54skZdFKg9JaRrKNW6dBj5c1Lgj5S6qpYRTiy4JBWJNc6C9E43MTvIJvCpJ9hPHGJ
         j3hN1wuYWyDJ5yzliWBQRV4rH585xt4dG2aFk633bmq0Ra4p7aoHJtNJni4Rxn4KSPDe
         WVcn2CyvMEF1hYnSecLuC1f2pkTRKPrhyd+Y8L2N48VpcHXSnD3K1Aa9OfM6N3AJ1Uiq
         SR/pLcD5qPLG435Vlr5J0nHUD1SH6kw/p+6KB2v8hVWNE+sZr5q6czb4sEF05TEIR7Va
         SFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141007; x=1792745807;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fdiQVOV9kGikp3BjxuFAHEh6NTE83RldKRLkuMUOTzA=;
        b=uTsZbiha0HZ92+q0IA6h9FwMUtJ8Znhw4tuG3mxjngD8SiHVP9SF9dBNiFscF9KOfP
         evTNSmDoPuxPCFSPRpN9SqpMUdSMPFH/OKxhRaS+GM93Aojd6pn/MZxzjc3HcqxrGdg+
         aNKCw+h2B72b1B8CVWoB1V92wWgCi/rC1W9pkVcVnUR3xRlN7NIUdywxhEIuKIJrVefc
         wr93awEvdqdrCIfPnhjvIX26FJoynjutLJaXb+9MYLqyJunkn7r2ocjTIXEDUumF3Ngk
         575kPg7W65+JKVKOXD5NymIKUSMkopEVu9bMGCr3lWLrj5SqotZO5Ol44ef/mmMvjjfy
         oopw==
X-Forwarded-Encrypted: i=1; AKwUvByF/4VY4bR0KyQ+oW80lb76N65/FruhfXbBRRdqQnOLjmQe0NbkSiSH76mmdKpRowGonptE+MoR0vGJ/W+Bgosu@lists.infradead.org
X-Gm-Message-State: AFq9FYLrfmgjg0BoTqrppEjuVy0qyZglv2vyUPrizlfNI4rdBlRtQz8d
	efaINIcgybbykO/P1yG+bDTXN7ld5uWcrkGO/6nXybWgwvY2Ald3XoAF
X-Gm-Gg: AYBFou3/5gpO767aOiJW6ZFcuM7mRwviMJD1T1WmzHxThcdBUDHPSiPWT00uLfYOaSx
	FNLpLJS5pkUMADgnglZFZWVfjEfGfYrlnOxkHmuITiZ/KhppB8goNeKpP2V5RZiKBnyZLAt9NWn
	iHu1hBW8fYdma67X2fc0NoqlAhM2LjCJq5gKQO4vE/yS/VprRJzt3B1K9PLJUK26+Jt32tOyg7/
	33sgAQ0+C6xVCaggnXf8y155gawaGQm4mxVwhbuTgHEDPqrTXj5d13YoNjAbxukA+aCMEnXwCBD
	ZGbJeEYiGz0CTU+9g7lO6Pn/TeZBrrGS7jjVhnTtx2tj8FUHG6MsVdTQF18ZVagN63fRGwCL1Ay
	35ZMLi6LWYazuaT594YxSv2TEimvuJ9DgHKzpGdfaj0XSdupwFPyhAuU/ETHKKJgpYzSfr7ORWT
	kdB2GjSiB1QzzSj1G03ksz/XjxK2lA5S8nwyWy1Gx3gZDIwJhmFMrx3JI9lbBV7cy+SlxMilCLx
	/tyyhauQ1k97HhY5ACgAse5zTr6wA==
X-Received: by 2002:a17:903:2f92:b0:2df:8ab7:fe3a with SMTP id d9443c01a7336-2e842abf30fmr328222235ad.4.1792141006559;
        Fri, 16 Oct 2026 01:56:46 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e882a20sm6971025ad.62.2026.10.16.01.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:56:45 -0700 (PDT)
From: Jason Yang <jason98166@gmail.com>
Subject: [PATCH v5 0/8] phy: rockchip-samsung-dcphy: Add the MIPI D-PHY
 receiver
Date: Fri, 16 Oct 2026 16:56:34 +0800
Message-Id: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMPm0WoC/23OSwrDIBSF4a0Ux7Xo1TzsqPsoHchVE6F5oCUkh
 Oy9JpMmoeDkXPh+nEm0wdtI7peZBDv46Ls2jex6IVjrtrLUm7QJMMhZAZwa7OuJhpEOnCrtssI
 Ja5xRJIk+WOfHrfZ8pV37+OnCtMUHvl7/d9JjVDosBTJEjepRNdq/b9g1ZO0MsLf50UKy6BSik
 Fpy0Gcrfrbk7GhFshoMZAhKG4dnK3f2/GeZrOOFKnIhQQizt8uyfAFK5X41WgEAAA==
X-Change-ID: 20260721-dcphy-rx-v1-9af57f3edfd9
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141002; l=5449;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=grCjE6G8S4b3gnfZy+Q41OvGbpz8ziNIO6eKpGz6Ia8=;
 b=j3Hwnfcg9m7EnEJ19LuhgpVq8+zNnvVw4z6NbYtbJo0vjsl/Hy2288Wbn0t6aqMsriZIhX+rj
 C/X7Nqx2Wq8BkaPRwSJancYIlQWfIxzhi086JSEKmpcTFwbEApFXsul
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_015648_345639_CD92AD8E 
X-CRM114-Status: GOOD (  19.24  )
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

The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
for DSI and a receiver for CSI-2. Both can be used at the same time.

Mainline only supports the transmitter and models the block as a single
struct phy. The PHY core refcounts power_on() per struct phy, so the
receiver cannot be powered independently of it, and the single
devicetree cell selects the mode, so the provider cannot tell which of
the two a consumer refers to.

This series registers a struct phy for each of them, adds a second
devicetree cell with generic PHY_DIRECTION_TX and PHY_DIRECTION_RX
constants so that a consumer can select one of them, and implements the
D-PHY receiver. A single cell keeps referring to the transmitter, so
existing device trees are unaffected.

  1/8  adds PHY_DIRECTION_TX and PHY_DIRECTION_RX to the generic header
  2/8  allows a second cell in the rockchip,rk3588-mipi-dcphy binding
       to select the transmitter or the receiver
  3/8  moves the block-level setup to runtime resume
  4/8  names the transmitter helpers and ops (no functional change)
  5/8  registers the receiver's struct phy and takes the second cell
       in of_xlate()
  6/8  implements the D-PHY receiver bring-up
  7/8  switches the RK3588 DC-PHYs to two cells and lets DSI select
       the transmitter
  8/8  adds the MIPI CSI-2 receiver nodes on RK3588 and connects them
       to VICAP

Testing
=======

Tested on an RK3588 board, with a DSI panel and an IMX219 camera on
DCPHY0, and an LVDS panel behind a DSI-to-LVDS bridge on DCPHY1.

  - The transmitter and the receiver run at the same time: with 7/8
    and 8/8, both panels light from boot, and the camera stream is
    shown live on the DCPHY0 panel.
  - The two can be powered independently: the DCPHY0 panel is turned
    off and back on during a 1200-frame capture, and the capture
    completes.
  - The receiver does not need the transmitter: with dsi0 disabled,
    the camera alone brings the block up and streams, which relies
    on 3/8 moving the block-level setup to runtime resume.
  - Existing device trees keep working: with a single PHY_TYPE_DPHY
    cell in dsi0 as before 7/8, the DCPHY0 panel lights.

No WARNING, underflow, "Internal error" or Oops in dmesg in any of
these.

Not covered: the receiver of DCPHY1, the 3- and 4-lane receiver
paths, and RK3576.

The DSI panels only light with the U-Boot SPLL fix [1] applied:
without it the bootloader leaves the SPLL at its 351 MHz bootrom
default while the devicetree describes it as a 702 MHz fixed clock,
halving the rate of both DSI hosts. The receiver path is unaffected;
the camera captures exercise it independently.

[1] https://lore.kernel.org/u-boot/20260804002643.2308515-3-jonas@kwiboo.se/

---
Changes in v5:
- Rebase onto phy/next. The runtime PM fix this series applied on top
  of is now commit 261e84f9278f ("phy: rockchip-samsung-dcphy: Enable
  runtime PM at PHY core level"), so it is no longer carried here.
- 1/8: use PHY_DIRECTION_TX and PHY_DIRECTION_RX instead of
  PHY_TYPE_DSI and PHY_TYPE_CSI. (Michael)
- 2/8: use PHY_DIRECTION_* for the second cell and rewrite the
  description.
- Drop v4's 5/7: it has no benefit over the switch, and it moved a
  DC-PHY shared function into a D-PHY helper. (Michael)
- 5/8: rename protocol to direction in of_xlate() to follow 1/8.
- 6/8: use a switch in the receiver's power_on() and power_off(), as
  the transmitter does.
- New patches 7/8 and 8/8: switch the RK3588 DC-PHYs to two cells and
  add the MIPI CSI-2 receiver nodes.
- Link to v4: https://lore.kernel.org/r/20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com

Changes in v4:
- Put the second cell back: the first cell selects the mode, the
  second the transmitter or the receiver.
- Drop the private use count and mutex; the runtime PM usage count
  does the same job.
- New patch 3/7: move the block-level setup to runtime resume.
- Split v3's 3/5 into 4/7 and 5/7.
- of_xlate() rejects a mix of D-PHY and C-PHY consumers.
- The runtime PM probe-order fix is now a separate patch [1] that this
  series applies on top of.
- Bryan O'Donoghue's Reviewed-by from v2 is not carried over; that
  patch was rewritten.
- Link to v3: https://lore.kernel.org/r/20260810-dcphy-rx-v1-v3-0-a2d25c29adfc@gmail.com

---
Jason Yang (8):
      dt-bindings: phy: Add PHY_DIRECTION_TX/RX definitions
      dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add a cell to select TX or RX
      phy: rockchip-samsung-dcphy: Move block-level setup to runtime resume
      phy: rockchip-samsung-dcphy: Name the transmitter helpers and ops
      phy: rockchip-samsung-dcphy: Add a second PHY for the receiver
      phy: rockchip-samsung-dcphy: Add MIPI D-PHY receiver support
      arm64: dts: rockchip: use two phy cells for the rk3588 mipi dcphys
      arm64: dts: rockchip: add mipi csi-2 receiver nodes for the dcphys on rk3588

 .../bindings/phy/rockchip,rk3588-mipi-dcphy.yaml   |  20 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  76 ++-
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c  | 529 +++++++++++++++++++--
 include/dt-bindings/phy/phy.h                      |   3 +
 4 files changed, 580 insertions(+), 48 deletions(-)
---
base-commit: 8f56fdf3d8cb9f1dbdc93bf9ac816698aa6f70b7
change-id: 20260721-dcphy-rx-v1-9af57f3edfd9

Best regards,
--  
Jason Yang <jason98166@gmail.com>


