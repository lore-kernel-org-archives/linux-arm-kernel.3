Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFF1CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 22:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7dyXKafz8ImkayNO8unQ7aikTx/yLC8/flyV0cIQnH0=; b=SJbVySS/TgxH5SmzuS1nxoBbca
	3wHk1fh/g3u7zVvAAym54ZD/ieWBOo6/XOXyNua3RWnhBhMD2b0zhu091ty+XwHqCzR7fUa1oR7qu
	SoI42E8G67t1rRgMj/hm00pAhIZEAXoiBmqNCyI/QJQBvhuiNzyUoBJcYp08G7or171my8ZAWq8ig
	TbvnzYmNWEv0lq8YvfMvs5HhbBsxuqaeWa5Ilqp6MXQGOnzG/naJkJooxaewu/Xmo+QzAipq9QLmv
	0iOYTT0T/fJ13lvj5EaRLCzp4AASGpcny/yQxKuXI6PRfayFnnQHk4s/f5yI7fSO4Y5WhzFPSgcbm
	FJz1iA7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrCh-0000000HG3c-3HmA;
	Mon, 05 Oct 2026 22:30:39 +0000
Received: from mail-pj2-x07.google.com ([2607:f8b0:4864:39::7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrCc-0000000HG1o-2KhF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 22:30:38 +0000
Received: by mail-pj2-x07.google.com with SMTP id 98e67ed59e1d1-3a7adbf1b3fso410728a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 15:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791239434; x=1791844234; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7dyXKafz8ImkayNO8unQ7aikTx/yLC8/flyV0cIQnH0=;
        b=MFYKuNNkI7EEbFhfif8MsOTUno035sztVjqfKeppGFON+eqBKMx/cSfZCdQrozGdCE
         dq7wA2oin+T0z33dmqfn2Znu1h7qJA9H98ApuqVKclIRUX+JfoHA1HbkD+Dc3B09cj9X
         yXM51m3cg97A8KXnfQbjni31P/vdQ5z/p5mixJvIvjcHfEfSuYbAYTky3xj7SFlntptg
         iXF3tLr9f/MQhF2FpU3VDLZTROnxJGhWqd2r1Pe1GeN57NAlliubN6DSJF8SfuOaAB/m
         PqyeDqGZUEh8IqvoOZ7HWfNQc3mSmwO1gPZ9iGkqxpufAxfwgf0OLP2BUIplDxMID3uG
         cIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791239434; x=1791844234;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7dyXKafz8ImkayNO8unQ7aikTx/yLC8/flyV0cIQnH0=;
        b=iOmcicNzwtQP6Qz6EOZ67NPlOoL3YXML23sjl+Y2e2itLbV/BRhpSp5hZSeb/jdGto
         nh10+EX9KVoPAEWjbGhlfLecaN0SNt5ur7wceBNmucP69OFScSglVUejW/G7Ksr10536
         03hONPZdPJe5sIfo7TONhG7S/aF78YYxP6lmf9crUp6XmZ3x4/2vAoMumhJH223sSISl
         txvaLsnX+swKWKUUprrhxXXiUUxs5pWYadvPv3sdSCh/99yfgTv3QHMIcdyBoApF0c67
         46PTFkqkTCcTBKGCgBhGKaT96w9jYhdBED55Qu9US+wUd61Gjx8thmh7Wp19Rgc4EsjO
         uo9g==
X-Forwarded-Encrypted: i=1; AKwUvBwsQeTDdPVk3/OWpxwL2zTarbaqfiy8+hmWcJbg7oOeySVhILX9r0d3Bm8zoJcy0j8AbYjZvnXS9Z0NfkcIWaNL@lists.infradead.org
X-Gm-Message-State: AFq9FYJTu/1nO2naO7byE+CsmN7KGj268IFRY+z+ncstdhtOgz7qXhFJ
	uEeXw2QjxqJpUQxty3VCiisU/AqsfiQTPcgdkPmN+EcbMjvACpNU6Ovw
X-Gm-Gg: AYBFou28fnuiLUYHSBKR5tUuY2KLcgngs8Df/exBCFh9DBF/02PwlOJe/wYjmBqKF7+
	5H+rD0A+KtWIv1C0XfCv2+1wi5thcLxumrR1Vvv6Fyp2t4SOfjtdfF225BqN5VZ6Wn7wW8wTWqh
	pEVQP5yTRuBfhDNbj/APF8ecO1+oExkWMQhH7cCN29aclQsRMpyR3+N+8kXMGIoKiKyJVY7axdO
	h82IHX8Zg+6MhLRuxTXnm/h0aTFA3fVxoF9OYewoTxRqD6hRt/po38tbC1RL6BDkVG9zhU5NYwy
	NwQW98gaP52F4Odum0Q6g9C5TnFIHYXFgr/RtnR0rpmW2YPdXWhtHhKXy4ADvgEmWeeNjdBYo76
	chRtiiaLcM+T0UFZpTRKIY01CshACL++GWp5tftjwhdvSPhUG8fFRC/4PIG9ih301HnGlLfKiwK
	FSCVhCkEDVluHEWR5c0iKDG+FQhAqiSWKS8uup/9CLjGQH3WoTWNvhzDSltCMbo+hDFGJ5
X-Received: by 2002:a17:90b:134f:b0:3a0:ca03:3e1f with SMTP id 98e67ed59e1d1-3a7872b2fdcmr6955612a91.32.1791239433477;
        Mon, 05 Oct 2026 15:30:33 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5f05321sm13203705ad.78.2026.10.05.15.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:30:32 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	David Wu <david.wu@rock-chips.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v10 0/6] net: pcs: add basic support for RK3568 XPCS
Date: Tue,  6 Oct 2026 06:30:02 +0800
Message-ID: <20261005223011.1124347-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_153036_546815_25B076B8 
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
  Patch 1: DT binding for Rockchip RK3568 XPCS
  Patch 2: add ANRESTART support for SGMII link recovery
  Patch 3: implement the Rockchip XPCS platform glue driver
  Patch 4: DT binding for Rockchip DWMAC PCS
  Patch 5: wire up SGMII support in dwmac-rk
  Patch 6: update MAINTAINERS

Dependencies
============
- Generic PM domain (genpd) changes:
  https://lore.kernel.org/all/20260925041751.495818-1-coiaprant@gmail.com/
- PHY binding+driver (Naneng Combo PHY SGMII MAC selection):
  https://lore.kernel.org/all/20261005221229.1095843-1-coiaprant@gmail.com/
- stmmac XPCS lifetime management fix:
  https://lore.kernel.org/all/20261005221749.1104430-1-coiaprant@gmail.com/

The DTS changes using the PHY property are sent separately to
Heiko/linux-rockchip. There is no hard build dependency; the pieces
can converge during the merge window.

Changelog
=========

- Resend and split: PHY binding+driver sent to linux-phy, stmmac
  lifetime fix and XPCS binding sent separately, DTS sent to
  linux-rockchip.

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
  dt-bindings: net: pcs: add rockchip,rk3568-xpcs support
  net: pcs: xpcs: add ANRESTART support for SGMII link recovery
  net: pcs: xpcs: add Rockchip RK3568 platform glue driver
  dt-bindings: net: rockchip-dwmac: document pcs-handle
  net: stmmac: dwmac-rk: add SGMII support for RK3568
  MAINTAINERS: add entry for Rockchip XPCS driver

 .../net/pcs/rockchip,rk3568-xpcs.yaml         | 110 ++++
 .../bindings/net/rockchip-dwmac.yaml          |  18 +
 MAINTAINERS                                   |   9 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 130 +++-
 drivers/net/pcs/Kconfig                       |  25 +
 drivers/net/pcs/Makefile                      |   5 +-
 drivers/net/pcs/pcs-xpcs-rk.c                 | 619 ++++++++++++++++++
 drivers/net/pcs/pcs-xpcs.c                    |  35 +-
 include/linux/pcs/pcs-xpcs-rk.h               |  11 +
 10 files changed, 935 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
 create mode 100644 drivers/net/pcs/pcs-xpcs-rk.c
 create mode 100644 include/linux/pcs/pcs-xpcs-rk.h

-- 
2.47.3


