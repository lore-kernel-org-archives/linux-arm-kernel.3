Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA09CA6011
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 17:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9BwFMzvpnh5keZRavPMezlpByqLkrvmuKFAvrVdTgl0=; b=K49BrrBAFuxU/KTMfQmX2ZLepe
	EiUGw+4oYeYiZRhgh+otQm4402f5Bx+tuF45I47hxaqMBlCq3kEM8yGL2hpX2zEY/e9Td2aQtzdI+
	btxgvRSmj3bxYZG4MBh3av/HUF1AptxuJnZpMqMRqFa3uhbUcUdchn9uew535kNmX+DHUWYoJm7/6
	ck0NAup72BfGd+vRSfzumuO6y5QRbphgyItXDDh0RXNTlLVGLX2aMk2cT4XsxUDYYQGhR+reW+ik/
	JEVRGfDMiuNMlaAMW9prHUyC8HlT21KlfDK0SdyxoEH3srQHZVWksOSFghq83yXg/24VZZ83bpzLk
	33Nk6t8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEsIW-00000004obA-0Hsd;
	Thu, 08 Oct 2026 17:52:52 +0000
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEsIT-00000004oaM-2lBO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 17:52:51 +0000
Received: by mail-pj2-x0b.google.com with SMTP id 98e67ed59e1d1-398a384b5f7so892739a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 10:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791481969; x=1792086769; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9BwFMzvpnh5keZRavPMezlpByqLkrvmuKFAvrVdTgl0=;
        b=LKhrDLkM+OdDMzyo8I5+kmlTDm0coGkxUzwfIaM1gI89mP6O5WLr83pqqTuwaUKVqU
         C4MPOx/v8GVg2IrTdQGdUmExFW93mql8cTt4wR+r5A0GkihWph+gWr9Wp6ppDDqwU4H2
         OBVJAscOPQfSCdCDj4jEQ+ZaZuk+ZHPlWv8dgja8gTfsZO5wogk8/wGpARMalYhVOZ0u
         glRd8FmMxtLqp1h7+JH3hi8sa/w2oi1fW8WsuE5Cnag2OeYlB1DpLN/oflVbn2xTj2il
         ySfFis5Lf0bm+cVoGIU2ShbPMBz50fXekdlx5n9bTd7xSwcrbsinggI/Lqmv93zxpe93
         2doA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791481969; x=1792086769;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9BwFMzvpnh5keZRavPMezlpByqLkrvmuKFAvrVdTgl0=;
        b=gdONI5EN5Xbt9WTxHB2mtiJcDkUTRQP2jJSF6T3yZh/6iD/JWlaeEWgIsqRz5jRWxG
         FPhHZK0srtmgD6W3RHEk7Gd0rRnWf2So7Lwqp32yl7xAJg6FthzwIISL+Q4eerJzO/bo
         dfLB35vtkPKymEUmtOJ2XbabwAceRs/tPjM7UUVCwxREbGW1uCA9o8iDElxAfemYP3XZ
         PWrkCVRWeFjiTN28ReXQ++sRD1xv8jaTGQJDBQLCoGDx6VNHA5UPRukbMmpQ+lqob4j1
         84JNCElVEHlx+fPARDFqbs0FrZRBYN8G3+/OQ1w1TamYjQQQSkclx/07tV6+3hUHWSbh
         OLMA==
X-Forwarded-Encrypted: i=1; AKwUvBxIFyeVmGPZgWHdFgHtFSgX30jmyID15EtEAS4GvVsu/C08GyL6RDOKCcTgO6yCvnR8jClptF+zV3sqSOiVxtwy@lists.infradead.org
X-Gm-Message-State: AFq9FYJJ2F1TmhyzUnYJT88eVy+ZUEKCfFe+e8koSm02Bd5pq3a0IX/a
	kFsSrp/Cc7kusfKfaenYYPd+0AjQBwKFgDIFbMUFZtf8BByFVAKF0mqy
X-Gm-Gg: AYBFou2Q8GqTafIIG5rfPP1cc4NWisqMwV6tfAxOiWyyVVegH5kwUYm0RSDOruso2uf
	6m2wP4JMiWn1W2btbwOdsd2+u7JvXMJGSPCZbiDWq6uxbmGumWXrB+xlezbXVv05RRwvOjPt4FX
	oCYAhNCor4omDJSKBWfA2PlAhLQj7DDcycaRDjHRo5NCGmxnJYsUvkpy0H8Ys6n73rgkd9n4X+n
	xa3T8oL8jC09+6sGpKGD83zo/RlEnziBg26JgpHYE1hwDPJYUtHnqv6o7n+bDzwVv2fWR5x+74D
	lvTsgcrDoTe5gE0QME8Ekdo588VICCWHfbY0n1UKlrANIGYDqZh1t24vdkbgYw3iTL+HpkgvTLq
	2lzS4A2oyEEi1RHES0/GmgDaXGJbYzCe6j0Ky9f4eiKzsLBR1REpOD4DV3gOnIhQztrh233M2/S
	I5mUTzs9SxtU92Upp0Ak5cI1S49DYupMkzsVN2Sqs5kNBNDKkewftXO3AKrmD5yYYVpXQS
X-Received: by 2002:a17:90b:288c:b0:3a6:fec5:c186 with SMTP id 98e67ed59e1d1-3a8a0f3be3emr5184679a91.46.1791481968566;
        Thu, 08 Oct 2026 10:52:48 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3277c459sm144332a91.16.2026.10.08.10.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 10:52:48 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	David Wu <david.wu@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v11 0/6] net: pcs: add basic support for RK3568 XPCS
Date: Fri,  9 Oct 2026 01:51:54 +0800
Message-ID: <20261008175225.3375274-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_105249_729897_2F64E4EF 
X-CRM114-Status: GOOD (  23.20  )
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
- Adding ANRESTART support for SGMII link recovery
- Adding a Rockchip XPCS platform glue driver and wiring it up in
  dwmac-rk

Series overview
===============

RK3568 XPCS/SGMII:
  Patch 1: add ANRESTART support for SGMII link recovery
  Patch 2: DT binding for Rockchip RK3568 XPCS
  Patch 3: implement the Rockchip XPCS platform glue driver
  Patch 4: DT binding for Rockchip DWMAC PCS
  Patch 5: wire up SGMII support in dwmac-rk
  Patch 6: update MAINTAINERS

Dependencies
============
- Generic PM domain (genpd) changes:
  https://lore.kernel.org/all/20260925041751.495818-1-coiaprant@gmail.com/
- PHY binding+driver (Naneng Combo PHY SGMII MAC selection):
  https://lore.kernel.org/all/20261006162807.2843858-1-coiaprant@gmail.com/
- stmmac XPCS lifetime management fix:
  https://lore.kernel.org/all/20261005221749.1104430-1-coiaprant@gmail.com/

The DTS changes using the PHY property are sent separately to
Heiko/linux-rockchip. There is no hard build dependency; the pieces
can converge during the merge window.

Changelog
=========

Changes since v10:

- XPCS binding: drop the ethernet-pcs-mii child nodes and the phy-names
  property. The MII port used by SGMII is derived from the MAC it is
  routed to (GMAC0 -> port 0, GMAC1 -> port 1), so the ports do not need
  to be described.

- dwmac binding: require phy-mode for rockchip,rk3568-gmac, and require
  pcs-handle only when phy-mode is "sgmii". Without the explicit
  required: [ phy-mode ], the "if" would match even when phy-mode is
  absent (Rob).

- XPCS glue driver: use pdev->dev.links.status instead of
  link->supplier->links.status, and drop the unused reg argument from
  the read remapping helper.

- dwmac-rk: document that the MII port passed to xpcs_rk_create() is the
  GMAC id, matching the hardware routing. Rewrite the in-band vs
  out-of-band section of the commit message to match the driver
  behavior and the actual clock rates.

- DTS: drop the ethernet-pcs-mii sub-nodes; pcs-handle now points at the
  XPCS node itself.

- Commit messages updated.

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

Acknowledgments
===============
This work was inspired by and builds upon the excellent work of others:
- Serge Semin's Synopsys DesignWare XPCS platform driver (pcs-xpcs-plat.c)
- Clément Léger's Renesas MIIC driver (pcs-rzn1-miic.c)
- The Rockchip TRM and downstream OEM drivers

Thanks in advance,
Coia Prant
---
Coia Prant (6):
  net: pcs: xpcs: add ANRESTART support for SGMII link recovery
  dt-bindings: net: pcs: add rockchip,rk3568-xpcs support
  net: pcs: xpcs: add Rockchip RK3568 platform glue driver
  dt-bindings: net: rockchip-dwmac: document pcs-handle
  net: stmmac: dwmac-rk: add SGMII support for RK3568
  MAINTAINERS: add entry for Rockchip XPCS driver

 .../net/pcs/rockchip,rk3568-xpcs.yaml         |  69 ++
 .../bindings/net/rockchip-dwmac.yaml          |  27 +
 MAINTAINERS                                   |   9 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 131 +++-
 drivers/net/pcs/Kconfig                       |  25 +
 drivers/net/pcs/Makefile                      |   5 +-
 drivers/net/pcs/pcs-xpcs-rk.c                 | 598 ++++++++++++++++++
 drivers/net/pcs/pcs-xpcs.c                    |  35 +-
 include/linux/pcs/pcs-xpcs-rk.h               |  11 +
 10 files changed, 883 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
 create mode 100644 drivers/net/pcs/pcs-xpcs-rk.c
 create mode 100644 include/linux/pcs/pcs-xpcs-rk.h

-- 
2.47.3


