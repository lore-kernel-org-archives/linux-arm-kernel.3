Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4F7C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 20:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vX3EEn9Z/BwCn094NqxmfD5ufgWykyRgzYkRme31G90=; b=egA8OTbdB//BVFh+eoNBpjrT3D
	qK7uONjssGtWfiUujBbjEJpCP53ez5uWo2SY55T7GHQTnnxsZCJoEta9AtehuUfzd12shAzZdZ6sW
	u5b/q8JHa7LK+6GHN/hazfVEyW1Wl0t5SuKnWZzXKCxZUwbaW9La3APcEq/8CZGGbz/h32EtwLs2U
	B+de2m16MEo0TBE/mT1w6sUxRIkDbYrQwUmtYB0dAdSMtuT7V1P4BV1Y9PrZdB4yv0WvdIh656tLW
	VA7g04pSaCPz2felQvvZkj+/Wm0B2iv7E+unpbVEX72TeFgswrgXuU66Bp9z1oLS0WISFSw87QY23
	9mqyk2Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUARQ-00000006nHd-05B5;
	Tue, 24 Jun 2025 20:40:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4iL-00000005vWS-2YH1;
	Tue, 24 Jun 2025 14:33:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750775611;
	bh=T4Clas5bzqxC87iLgxrgDlE8/O1YxVArn4WnJgBEpKA=;
	h=From:To:Cc:Subject:Date:From;
	b=Linbs5zYmDSJ0zkA/iGPLy8OFrGC6fGw+57BQTCTC71zIlT3Nyk9QKUjc771ILAch
	 xd1yU/vY6b+L1qWFFhX3FzCv3EAuQzptiptko7Z02We/fYsC7GqOvM1OWzi4wdODs7
	 L4uCgp2C+KBU08/zwq4qzpKSpsW1GnXqvLiGvKuFAMFknMrRAvwjd4rqm6skxoYP4L
	 dTRLsL3gBzmexBaIKpLlFCixY+2E3SSEw9xrdbI72jjUm7F/Vu4IK5GQrT4ruwEh2Q
	 50Ft5IDSE4L9+tqDn75PrER9Sd0H36uY7GQ66tFtxrNwHrYrXZGmXuFH2RMKpeJP7a
	 KKLDdpwfyab5g==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:d2c7:2075:2c3c:38e5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 72BA217E0DE3;
	Tue, 24 Jun 2025 16:33:30 +0200 (CEST)
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
Subject: [PATCH v2 00/29] Add support for MT8196 clock controllers
Date: Tue, 24 Jun 2025 16:31:51 +0200
Message-Id: <20250624143220.244549-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_073333_793385_A105B317 
X-CRM114-Status: GOOD (  12.70  )
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

Add support for MT8196 clock controllers

This patch series introduces support for the clock controllers on the
MediaTek MT8196 platform, following up on an earlier submission[1].

MT8196 uses a hardware voting mechanism to control some of the clock muxes
and gates, along with a fence register responsible for tracking PLL and mux
gate readiness. The series introduces support for these voting and fence
mechanisms, and includes drivers for all clock controllers on the platform.

[1] https://lore.kernel.org/all/20250307032942.10447-1-guangjie.song@mediatek.com/

Changes in v2:
- Fixed incorrect ID numbering in mediatek,mt8196-clock.h
- Improved description for 'mediatek,hardware-voter' in mediatek,mt8196-clock.yaml and mediatek,mt8196-sys-clock.yaml
- Added description for '#reset-cells' in mediatek,mt8196-clock.yaml
- Added missing mediatek,mt8196-vdisp-ao compatible in mediatek,mt8196-clock.yaml
- Fixed license in mediatek,mt8196-resets.h
- Fixed missing of_match_table in clk-mt8196-vdisp_ao.c
- Squashed commit adding UFS and PEXTP reset controller support
- Reordered commits to place reset controller binding before dependent drivers
- Added R-b tags

Link to v1: https://lore.kernel.org/all/20250623102940.214269-1-laura.nao@collabora.com/

AngeloGioacchino Del Regno (1):
  dt-bindings: reset: Add MediaTek MT8196 Reset Controller binding

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

 .../bindings/clock/mediatek,mt8196-clock.yaml |   87 ++
 .../clock/mediatek,mt8196-sys-clock.yaml      |   81 ++
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
 drivers/clk/mediatek/clk-mt8196-vdisp_ao.c    |   79 ++
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
 33 files changed, 6828 insertions(+), 24 deletions(-)
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


