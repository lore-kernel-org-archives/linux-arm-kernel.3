Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFBBCC6B2A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 05:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ijVuixKGbcFzhxPljdKSrg9qSldEjkdopCfbyGu/Rtc=; b=WTfWJmX6wYb4a7lcP0nSvFyrhf
	SKFH1iGYabs2dUAHRSdSM7CqyVs/NcRUtb6L2SjkwVrsFzhBenQOq2CkcY70pmNDdZedBGryCiRDP
	xkHZVFGJVocbFhLKOS/+DxJdwks8NoCERofYoq56h95D6QuVDDs6wGdAc3vW7ixprHorFpTSnO6ag
	Nyveilsg680d02z7GWxJFHLVdJyKzcvs+TlMPrelUgl6Bt9sUozRrk22Hr617bw2EY8JnEiKjevJp
	/QHVc6Dzn1X3+Zzi+HiFbJdet+bk6attZu09ptqmEig1v7CwOh4QDLNG1j0NBdOd/X3LKssmqEYPi
	wMcNH3PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHxDo-00000004SHi-1lq7;
	Sat, 17 Oct 2026 05:44:44 +0000
Received: from mail-pz2-x04.google.com ([2607:f8b0:4864:3b::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHxDl-00000004SGu-2WRv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 05:44:42 +0000
Received: by mail-pz2-x04.google.com with SMTP id 41be03b00d2f7-ccc451ef3a7so103515a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 22:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792215880; x=1792820680; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ijVuixKGbcFzhxPljdKSrg9qSldEjkdopCfbyGu/Rtc=;
        b=bWcsiRsHITpRlNyS4W14XKogpYgevsU8JmByNBeFpcTAudol+lGVohf92DkxGqHjQ+
         BUepHJiheqAuRPs8670NCOSlASeiNb3Ze8Y4eoD3R0jzgYiBqLN4Zgcpe43GbWSuy9Wd
         nl0b7xBHHbTxn8Rjs2UYaDlhWLQhaZYhcelThXjOTDxHyIDJw/jdBcrJmMcX24+tjdgD
         Gre98lDmvXh3uNI5EOwsFaVQuzYYFSOSBKAjZ+zVR2LYzbQjKp1y8mOWtskkf2M97VXo
         5qmqYGu+S95SWd7isPMTVFtD2u1Udjxt3vjG6/WJIj59MJc2CBqzHP0b10auc95DTPl7
         pZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792215880; x=1792820680;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ijVuixKGbcFzhxPljdKSrg9qSldEjkdopCfbyGu/Rtc=;
        b=14AEMQz5zu4IC8SrE4RkeFFbr2hlmNRzMJ8pSOv9umOKHKpke7XZIrcQ8nl0453G3M
         AG4+x1/dqv2ct68X9MP0LcebmswPYpigAW50CdlE7iWPMdZxjRmy6XPJ18K7XT8BBzJJ
         6XVdE4vDAruSRNwKvRPSiczzf+TRBQjhqNV19sUouyyOWM5EnuMOF09T46usMiGUdqBW
         +o9NuJ6TNS5UsoUc4cN2qxq69ApNr1Mmhr9IssS5cOyWZdIJrYouVU3o9ayxaL+Hh/Ej
         E84Sg4wrkYcKDIPLW1iZa17c/Ax3ppmMKT7rWdmXDRAhsjATn47imy/2CEInLyFohwHl
         m4XQ==
X-Forwarded-Encrypted: i=1; AKwUvBwui4yDDxuZhrtnV2DPNnE3efeCm/3dPWmRofQOurZ+imoZgz4mYvVveERfS4TsmnSMSI6a6Dv/kkhy8PKHlksq@lists.infradead.org
X-Gm-Message-State: AFq9FYIVmjm2ErwXLh78T2da1T4l/7m16BfRHRTvQER67Kxf28rBuq0z
	YfNvkQ17GgAKGr/LONUdgc+Eg4FR6RWHD8YZKahqvk3M2tjpb1YlyObb
X-Gm-Gg: AYBFou3vdSCbFDqjga8E3EcviHWiMEmBwFbTzErPxK/NvyAZJTqMz19yifHaVqQ34VA
	NQwd7fk7Yfb6Z/xsX/xpAHn6wt9+TZBr+4RIC4S3J/5dN4QdGoBcDZhsHN/IV2zuAqy3GZcTSex
	MgksxM0kFoDd99yPt6xjVBLlEAH/HdEYPo5dhHj2Hbcui7+Anr2tSfc17W5QLh16eWApNaYBQlT
	vuEUTEsYtjX65EJ5Xe+NZcAdPzksGRA3AZ7KGnyT5IOQUgLJyMpjWxXJq5oFPBTAXWgkXcfxUwl
	56kCkvpowsX3jNIGEeWfnsVpCWW9OLVEsFcf2qMo7etatqKzXBCjgQZDGwusrdV6wI8APJP9r13
	5vuZNHLCAoTPNfrX272VX2orTStTrA8BqOnJNuF0/cUQ+AdL9pCRqWCSX6ijI+vIYZVjCVKRV59
	HCFDDJxz2AREE5XoobUH5j1g0nYljqOUBfA6ltPbGR7plJnM6nlYLPOL2ZgO7P9aYe8bWrZQ==
X-Received: by 2002:aa7:88c7:0:b0:891:6aeb:84fc with SMTP id d2e1a72fcca58-8a04be250efmr1456271b3a.22.1792215880096;
        Fri, 16 Oct 2026 22:44:40 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57269315sm1958225b3a.23.2026.10.16.22.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 22:44:38 -0700 (PDT)
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
Subject: [PATCH net-next v12 0/6] net: pcs: add basic support for RK3568 XPCS
Date: Sat, 17 Oct 2026 13:43:58 +0800
Message-ID: <20261017054406.1828061-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_224441_680213_E7BAE09E 
X-CRM114-Status: GOOD (  18.20  )
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

The DTS changes using the PHY property are sent separately to
Heiko/linux-rockchip. There is no hard build dependency; the pieces
can converge during the merge window.

Changelog
=========

Changes since v11:

- Drop the "default PCS_XPCS" for PCS_XPCS_PLATFORM and the
  "default ARCH_ROCKCHIP" for PCS_XPCS_ROCKCHIP. There is no in-tree
  user of the generic snps,dw-xpcs glue that needs it selected by
  default, and new symbols defaulting to enabled on olddefconfig are
  something we should avoid (Jakub).

- Update the PCS_XPCS_PLATFORM commit message accordingly.

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
 drivers/net/pcs/Kconfig                       |  23 +
 drivers/net/pcs/Makefile                      |   5 +-
 drivers/net/pcs/pcs-xpcs-rk.c                 | 598 ++++++++++++++++++
 drivers/net/pcs/pcs-xpcs.c                    |  35 +-
 include/linux/pcs/pcs-xpcs-rk.h               |  11 +
 10 files changed, 881 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
 create mode 100644 drivers/net/pcs/pcs-xpcs-rk.c
 create mode 100644 include/linux/pcs/pcs-xpcs-rk.h

-- 
2.47.3


