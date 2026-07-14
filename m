Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C77C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZvralJAhtjQC0agihnqVt6yZC+MGkbFen1qSIili9Nc=; b=umbaHHVYYrpfLA5rQuXsCnDbkX
	p9oHtvjCkBssPrEmhvXSlJNFI6Y9sM62LhZ/mF2GTjGwSVdn1bm1EpYzIhMX2w7SI+12zXMXiCfcy
	L8OYM548AKgIj1ldCvczddGXTTnzSBdOxqdfzluXp6y0RXEPrYzQ/n+EuEI8bA2s3HKSEpB49hTzW
	kMEaLwQw73x+Kf/aiIosdZ8Yr+W+egK5A9nosgdXaZPK8QqWvC3eYhGlfipDSynoSvZIC7JxgJItF
	fN+OnzBlYl1xja+v5tSjrnuolQAC3JxjozobNIUYgLJ4c8XP8gpJ8hC43t7MZ24swAR6ljMMlW7wz
	M1Wl7l6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiZp-0000000CzgX-1GWi;
	Tue, 14 Jul 2026 19:13:57 +0000
Received: from mail-pj2-x00.google.com ([2607:f8b0:4864:39::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiZm-0000000CzfW-44nx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 19:13:56 +0000
Received: by mail-pj2-x00.google.com with SMTP id d9443c01a7336-2cc7a345f51so32732255ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 12:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784056434; x=1784661234; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZvralJAhtjQC0agihnqVt6yZC+MGkbFen1qSIili9Nc=;
        b=XhmjQuHyMA74l6LwAgHjKFQlxY/276V668RWwpg7ipcKt+S31WtBcm3Ok2ygGB1ibh
         +AQRjr0RiDV1Il4tU4lAGeRLvIbdHJtdjJAO2SDwaMOElJfKiQRfMA5VTKxUw2zKV8Bl
         8LiWsfbYGyJ3lUkzqwvTosPDicESLrsqxOFhqBrxdXdxUsUDdrI6NPSt9puO6EppJCZT
         uhg1862jvf0rjSd+tTMloJGdduocoWEpAwaxdgBS2knEUxRaK+0cN1jWD07KrmIcerKm
         oAHUit5v75JbvGdnmlYlBxSLPgN5PqrYJH/2Aet8B7sA3g4ZGMqfTCce+OkEFbJtTsyk
         rUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784056434; x=1784661234;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZvralJAhtjQC0agihnqVt6yZC+MGkbFen1qSIili9Nc=;
        b=mixWGb3i1pKln5ImjpKsF0f2hFyqyTzUxldP07ZE9qGcOsYnt1rvjWXEan99hxu7Nt
         M0riC1Nh3KqrpXpxbP1tuRebVNd3prSowKzqBnXemDVT3JjyAZfXoRgcLUDrfxDUgtnz
         clhAgqd4SMOgug3L02MHFbb3cnpyjXHcpH5go3XpeO0qGJoLauCiFroli/ieHJpqbzlf
         QQS/b3cV0Y+AeCON5faNDMxQlWoJtkyMD5+9u8NkBftoW8IXp/K9q7i+waK/mBdYz6Ry
         QxaeJeD9uSuSsK6bRookeuBZ6Z/QPGPErsNkvzvfE5RNDPGTNGQC8kn09r4Skhymxwbe
         btdQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro5KF4fTj6VCh4+J4+XbDsqXXGVPJM8xqmB39Glcuevopam68jhCYvUHwEUoX5b+ggjUFFe5T0SbFi+MLWxx6Pz@lists.infradead.org
X-Gm-Message-State: AOJu0YxaNvvi5BIFnxdYClnTRA3YSbi2fHQOv1cxIF+g17J9K7kBou09
	vrYIQ4WXVeZn1yXTakehWUHzWA22aT7qWDm2X5eqFn5r3PjnWIT3oiCO
X-Gm-Gg: AfdE7ckju/8MfZlhAdnoz7q6LdfUGLcBifHKdMTPMIeEsW4CxUrm41szVBSscIr+g/C
	XGzX++f3bfhI0NAuIF++Kz5WqMd+lA9ThxnxIH0pk1WhxW4J4psWeqkfMugdEp7J2zsHPcePOlj
	M3O+lDXdly92SajUa3VZ1MQ97iCtQ2s72EZwOHsLpsfQiigcWWqHZhijsaZ28IktFpQFPNacJqz
	xisQ+zJwrKZXj9yMGB8OVpFKJ9VoRI06bgVqjvae6d5VJNJCDzN/IMdZ6H6qBOqRB1SpoJX9vk7
	mT/mDdXEVUzoaJc4ggwXnOhDN3E9Ajywe5PPf+lvv+CQJrG7EjqIds8uouG3YOxPAiLatgZr0hn
	melV0oNUIXvXf7tavcEAxrPtOIP7NbdGUJT4Z9I5KYPwlND1rLLMk8lWc1WEUa7Yxv+0ipHlGJC
	EOCWjY98JsUZ0=
X-Received: by 2002:a17:903:2f0f:b0:2ce:ed59:7044 with SMTP id d9443c01a7336-2ceed597127mr47465305ad.30.1784056433646;
        Tue, 14 Jul 2026 12:13:53 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d451sm120763245ad.65.2026.07.14.12.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:13:53 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: kuba@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	heiko@sntech.de
Cc: netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [RFC PATCH 00/10] net-next: add basic support for RK3568 XPCS
Date: Wed, 15 Jul 2026 03:08:28 +0800
Message-ID: <20260714191341.690906-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_121355_024975_27FC5516 
X-CRM114-Status: GOOD (  22.93  )
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

This series adds proper SGMII support for the Rockchip RK3568 SoC
using the integrated Synopsys DesignWare XPCS, along with necessary
fixes and refactoring in the stmmac core and XPCS driver.

Motivation
==========
The RK3568 integrates a DW XPCS accessed via APB3 and connected to
a Naneng Combo SerDes PHY.  Several boards (e.g., Ariaboard
Photonicat) use this interface for Gigabit Ethernet.  However, the
current upstream stmmac driver does not support this configuration,
and the XPCS driver has issues in SGMII poll mode that cause the
link to be reported incorrectly.

This series addresses these issues by:
- Fixing the XPCS driver's SGMII AN state handling
- Refactoring stmmac PCS lifetime management to allow platform drivers
  full control over PCS creation/destruction
- Adding a Rockchip XPCS platform glue driver and wiring it up in
  dwmac-rk

Series overview
===============

Generic:
  Patch 1: move XPCS lifetime management to platform drivers
           (introduces pcs_init/pcs_exit callbacks)

PHY:
  Patch 2: DT binding for Naneng Combo PHY SGMII MAC selection
  Patch 3: implement the PHY SGMII MAC selection in driver

RK3568 XPCS/SGMII:
  Patch 4: DT binding for Rockchip RK3568 XPCS
  Patch 5: add XPCS and fixed-clock nodes to rk3568.dtsi
  Patch 6: improve SGMII AN state handling (fixes link-down recovery)
  Patch 7: implement the Rockchip XPCS platform glue driver
  Patch 8: wire up SGMII support in dwmac-rk
  Patch 10: update MAINTAINERS

Board enablement:
  Patch 9: enable SGMII LAN port on Photonicat board

Key design decisions
====================
- The stmmac core now delegates XPCS creation entirely to platform
  drivers via pcs_init/pcs_exit.  This is necessary because the
  generic XPCS creation logic would override any XPCS set up by the
  platform driver.

- The Rockchip XPCS driver creates a virtual MDIO bus over the APB3
  registers and implements address remapping.  The generic XPCS core
  handles all PCS configuration via phylink_pcs_ops.

- On RK3568 in SGMII mode, the MAC clock is fixed at 125 MHz and
  cannot be dynamically changed.  In-band mode is used, and the
  generic stmmac set_clk_tx_rate callback is disabled to prevent
  incorrect clock updates that would break RX.

- The SerDes and power domain are attached to the XPCS device tree
  node rather than the MAC node. This reflects the actual hardware
  topology and simplifies the dwmac-rk driver by keeping all PCS-related
  resources self-contained. It also prepares for possible future QSGMII
  support, where a single SerDes serves multiple MACs and would be
  more naturally managed under the XPCS node.

Testing
=======
Board: Ariaboard Photonicat (RK3568)
OS: Armbian (trixie)
Kernel: 6.18 (backports)
Result: The SGMII interface obtains an IP address, SSH works, and
        ping traffic passes without loss.

Notes
=====
- When testing out-band mode with set_clk_tx_rate, only 1000Mbps
  works on both TX/RX; 10/100Mbps only works on TX side.
- I also noticed that the PHY (YT8521) reports 100Mbps/Half in out-band
  tesing while the PCS reports 100Mbps/Full if using in-band.
  This looks like a separate PHY driver bug.
  I will address/report it independently after this series lands
  (or if a maintainer points me to the right list).

Dependencies
============
None. All patches apply cleanly on top of torvalds master tree (v7.2).

Questions
=========
1. Patch 6 (SGMII AN state handling) touches generic pcs-xpcs code and
   may affect Wangxun NICs.  I don't have Wangxun hardware to test.
   The original Wangxun-specific path is kept unchanged, so I believe
   there is no regression risk.

2. Would Heiko Stuebner be willing to be listed as a co-maintainer
   for the Rockchip XPCS driver?  I've added myself in MAINTAINERS,
   but having a more experienced Rockchip maintainer on board would
   be ideal.

Related discussion
==================
Previous attempt at SGMII support on RK3568 by others:
https://lore.kernel.org/all/20221129072714.22880-2-amadeus@jmu.edu.cn/

Also related (runtime PM fix for xpcs-plat, sent separately):
https://lore.kernel.org/all/20260704214808.1566710-1-coiaprant@gmail.com/

Acknowledgments
===============
This work was inspired by and builds upon the excellent work of others:
- Serge Semin's Synopsys DesignWare XPCS platform driver (pcs-xpcs-plat.c)
- Clément Léger's Renesas MIIC driver (pcs-rzn1-miic.c)
- The Rockchip TRM and downstream OEM drivers

This is my first kernel driver series.  I've spent many nights
debugging the hardware quirks on this board.  I hope this can finally
replace the out-of-tree OEM code with a clean upstream solution.
Any guidance during review is greatly appreciated.

Thanks in advance,
Coia Prant
---
Coia Prant (10):
  net: stmmac: move XPCS lifetime management to platform drivers
  dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel
    property
  phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
  dt-bindings: net: pcs: add rockchip,rk3568-xpcs binding
  arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
  net: pcs: xpcs: improve SGMII AN state handling for Rockchip RK3568
  net: pcs: xpcs: add Rockchip RK3568 platform glue driver
  net: stmmac: dwmac-rk: add SGMII support for RK3568
  arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port
  MAINTAINERS: add entry for Rockchip XPCS driver

 .../bindings/net/pcs/rockchip-dwxpcs.yaml     | 126 +++++
 .../phy/phy-rockchip-naneng-combphy.yaml      |   7 +
 MAINTAINERS                                   |   9 +
 .../boot/dts/rockchip/rk3568-photonicat.dts   |  77 ++-
 arch/arm64/boot/dts/rockchip/rk3568.dtsi      |  45 ++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  44 +-
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      |   7 +-
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    |  87 ++-
 .../net/ethernet/stmicro/stmmac/dwmac-rzn1.c  |   7 +-
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |   7 +-
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c |  37 +-
 drivers/net/pcs/Kconfig                       |  22 +
 drivers/net/pcs/Makefile                      |   7 +-
 drivers/net/pcs/pcs-xpcs-rk.c                 | 526 ++++++++++++++++++
 drivers/net/pcs/pcs-xpcs.c                    |  31 +-
 .../rockchip/phy-rockchip-naneng-combphy.c    |   8 +
 include/linux/pcs/pcs-xpcs-rk.h               |  11 +
 18 files changed, 1008 insertions(+), 51 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
 create mode 100644 drivers/net/pcs/pcs-xpcs-rk.c
 create mode 100644 include/linux/pcs/pcs-xpcs-rk.h

-- 
2.47.3


