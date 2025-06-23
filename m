Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36D4C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 16:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3HAjkzYZUma9pbWZESrolyVEEun+raP2leMd7ac6gE0=; b=pNOe1cYu3PKVFqq8B1kbp4dblX
	EQqZdQJWr8n4GKxzH0jYhcG/s8pKL9y6SYBKwX3VK5bEoZdhQQb036aeODnrBdpQRfP7TUXTMsEPq
	h/0x1Fysq3S90r0QaYVqV20XWS9LBywD9MS9qb1mAvQ13c+dAG6PaRzdH/jvLFzgYFLzzSYYuiXW7
	JmhbiCBlmH/CoyynAxkzobqB5o0VgDbkfvOQ9DmHcnOh7KC8+4UFwAGXeJH5DBR1nDRZxM4hEOPVx
	hx2NU3G6ayvN9RfRZMmYLqkCW+YN3AsqyNGzZTZlF4V4SmrvC8C+HEa2LpFEVOt8XGz95tb2RUCGV
	9WP3Ffyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjw2-00000003OwB-2set;
	Mon, 23 Jun 2025 16:22:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeRY-00000002LzV-1WaC;
	Mon, 23 Jun 2025 10:30:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750674626;
	bh=WcdYiRrSUeJaJ1vmQuBR2TYhYYx6iD5jWduuKdPBCyg=;
	h=From:To:Cc:Subject:Date:From;
	b=QKuq8sfM66+nYpdFgYI0t/5eDoDgvDJGADbGpPuIkBer1LFQ8i971+EoV6WnQqFCj
	 Dfo/OPkY+KNskyIK6hEpsosVMOhExcqHQ0hlaXnjR3cYxh+qr+i9iPjW1prVJ8RMDy
	 X4FDEUvDLD2PGcBEvw6EJ0K6/q6ZqO7k+6fK/dMgegPRjw9vtWdD9YKEKUw36wTtPx
	 VBM18+qepKGI2Tq3q+wNq+/orCx78uFtg/4zKWkNpi5n/ybDWRz2NPj+WqoVEcGiQ3
	 Qeygw5E/tKvfbyG3KDiVrKsicmUoKyI4d4N0Iplbg/4j/gw12YefxMQIE/8qtqspTf
	 4IHzyn82eAftA==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:e046:b666:1d47:e832])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0512017E0D64;
	Mon, 23 Jun 2025 12:30:24 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	richardcochran@gmail.com
Cc: guangjie.song@mediatek.com,
	wenst@chromium.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH 00/30] Add support for MT8196 clock controllers
Date: Mon, 23 Jun 2025 12:29:10 +0200
Message-Id: <20250623102940.214269-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_033028_548760_F161083B 
X-CRM114-Status: GOOD (  11.43  )
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

This patch series introduces support for the clock controllers on the
MediaTek MT8196 platform, following up on an earlier submission[1].

MT8196 uses a hardware voting mechanism to control some of the clock muxes
and gates, along with a fence register responsible for tracking PLL and mux
gate readiness. The series introduces support for these voting and fence
mechanisms, and includes drivers for all clock controllers on the platform.

[1] https://lore.kernel.org/all/20250307032942.10447-1-guangjie.song@mediatek.com/

AngeloGioacchino Del Regno (2):
  dt-bindings: reset: Add MediaTek MT8196 Reset Controller binding
  clk: mediatek: mt8196: Add UFS and PEXTP0/1 reset controllers

Laura Nao (28):
  clk: mediatek: clk-pll: Add set/clr regs for shared PLL enable control
  clk: mediatek: clk-pll: Add ops for PLLs using set/clr regs and FENC
  clk: mediatek: clk-mux: Add ops for mux gates with set/clr/upd and
    FENC
  clk: mediatek: clk-mtk: Introduce mtk_clk_get_hwv_regmap()
  clk: mediatek: clk-mux: Add ops for mux gates with HW voter and FENC
  clk: mediatek: clk-gate: Refactor mtk_clk_register_gate to use
    mtk_gate struct
  clk: mediatek: clk-gate: Add ops for gates with HW voter
  clk: mediatek: clk-mtk: Add MUX_DIV_GATE macro
  dt-bindings: clock: mediatek: Describe MT8196 peripheral clock
    controllers
  clk: mediatek: Add MT8196 apmixedsys clock support
  clk: mediatek: Add MT8196 topckgen clock support
  clk: mediatek: Add MT8196 topckgen2 clock support
  clk: mediatek: Add MT8196 vlpckgen clock support
  clk: mediatek: Add MT8196 peripheral clock support
  clk: mediatek: Add MT8196 ufssys clock support
  clk: mediatek: Add MT8196 pextpsys clock support
  clk: mediatek: Add MT8196 adsp clock support
  clk: mediatek: Add MT8196 I2C clock support
  clk: mediatek: Add MT8196 mcu clock support
  clk: mediatek: Add MT8196 mdpsys clock support
  clk: mediatek: Add MT8196 mfg clock support
  clk: mediatek: Add MT8196 disp0 clock support
  clk: mediatek: Add MT8196 disp1 clock support
  clk: mediatek: Add MT8196 disp-ao clock support
  clk: mediatek: Add MT8196 ovl0 clock support
  clk: mediatek: Add MT8196 ovl1 clock support
  clk: mediatek: Add MT8196 vdecsys clock support
  clk: mediatek: Add MT8196 vencsys clock support

 .../bindings/clock/mediatek,mt8196-clock.yaml |   79 ++
 .../clock/mediatek,mt8196-sys-clock.yaml      |   76 +
 drivers/clk/mediatek/Kconfig                  |   78 +
 drivers/clk/mediatek/Makefile                 |   14 +
 drivers/clk/mediatek/clk-gate.c               |  106 +-
 drivers/clk/mediatek/clk-gate.h               |    3 +
 drivers/clk/mediatek/clk-mt8196-adsp.c        |  193 +++
 drivers/clk/mediatek/clk-mt8196-apmixedsys.c  |  203 +++
 drivers/clk/mediatek/clk-mt8196-disp0.c       |  169 +++
 drivers/clk/mediatek/clk-mt8196-disp1.c       |  170 +++
 .../clk/mediatek/clk-mt8196-imp_iic_wrap.c    |  117 ++
 drivers/clk/mediatek/clk-mt8196-mcu.c         |  166 +++
 drivers/clk/mediatek/clk-mt8196-mdpsys.c      |  187 +++
 drivers/clk/mediatek/clk-mt8196-mfg.c         |  150 ++
 drivers/clk/mediatek/clk-mt8196-ovl0.c        |  154 ++
 drivers/clk/mediatek/clk-mt8196-ovl1.c        |  153 ++
 drivers/clk/mediatek/clk-mt8196-peri_ao.c     |  144 ++
 drivers/clk/mediatek/clk-mt8196-pextp.c       |  131 ++
 drivers/clk/mediatek/clk-mt8196-topckgen.c    | 1257 +++++++++++++++++
 drivers/clk/mediatek/clk-mt8196-topckgen2.c   |  662 +++++++++
 drivers/clk/mediatek/clk-mt8196-ufs_ao.c      |  109 ++
 drivers/clk/mediatek/clk-mt8196-vdec.c        |  253 ++++
 drivers/clk/mediatek/clk-mt8196-vdisp_ao.c    |   78 +
 drivers/clk/mediatek/clk-mt8196-venc.c        |  235 +++
 drivers/clk/mediatek/clk-mt8196-vlpckgen.c    |  769 ++++++++++
 drivers/clk/mediatek/clk-mtk.c                |   16 +
 drivers/clk/mediatek/clk-mtk.h                |   23 +
 drivers/clk/mediatek/clk-mux.c                |  119 +-
 drivers/clk/mediatek/clk-mux.h                |   76 +
 drivers/clk/mediatek/clk-pll.c                |   46 +-
 drivers/clk/mediatek/clk-pll.h                |    9 +
 .../dt-bindings/clock/mediatek,mt8196-clock.h |  867 ++++++++++++
 .../reset/mediatek,mt8196-resets.h            |   26 +
 33 files changed, 6814 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8196-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8196-sys-clock.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt8196-adsp.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-apmixedsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-disp0.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-disp1.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-imp_iic_wrap.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-mcu.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-mdpsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-mfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-ovl0.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-ovl1.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-peri_ao.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-pextp.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-topckgen.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-topckgen2.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-ufs_ao.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-vdec.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-vdisp_ao.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-venc.c
 create mode 100644 drivers/clk/mediatek/clk-mt8196-vlpckgen.c
 create mode 100644 include/dt-bindings/clock/mediatek,mt8196-clock.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt8196-resets.h

-- 
2.39.5


