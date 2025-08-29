Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65224CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 10:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZN8PS3ExopBQyWUfko6U7RKnnjRps8I7ZcuzT80DxB4=; b=s9xRTWhDRcQY/tj68ZUR460r4V
	K/+eDjWUf4xMx93+CQ4CfCur0aYjdZqN33Fj04Iug74oUYsc8LiQR8V0d6nHtDtEydN1T0Ce02G2n
	28kA+xOEaY4H6YIirGHjK1T9V4J1aGVNLNpsqV5YBhNDXScj/fISf8FOjsBtrAZ9qs6gjcVghdn6s
	hdUCnyKL0g2SWSE2BliGtjRG69/DXFFRcMzzr9KjRvEMzPxmrHnE1wj0NnLWQr+naJ4yIgmgw+0Ct
	gWrS0f1pnSd66iRV7YfFnNbk7n07zJrto6YJMs+Y/jHgT7oZHWD8amc6D+/Ji1IeFAAwVgNY4m2Ok
	mcjqr2ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urwM8-00000005K7x-45rU;
	Fri, 29 Aug 2025 10:29:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvHz-000000057ew-45N2;
	Fri, 29 Aug 2025 09:20:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756459253;
	bh=bbhdKh1r1EnPchJMRAZm27A3o+cqajSQJpAToKjB2gw=;
	h=From:To:Cc:Subject:Date:From;
	b=k7jNmAJBn6mV870W0svbNED8c3nmXJZMhGO5ulHEFcClCi7NBvTb+IaZhRTD2acVl
	 y7hAGV/SsEh9+C0cFZP6zNQSm5VlP9kOaBJW0ogyXBiDfRG46vSCxo8g7QyjoaJSdN
	 FlzZE5dhh7U9n0U0zmZnL848rwGoSXly7DIDP60Y3GUnwWNJMA5dzV53gpmxB3ecFk
	 3j63ECfQGJONmbgKhWAYukbFK1liIhij2DQC+6WBRLHvHTMHvdJpm2E2HEtTa2DAV0
	 hUE4lv9FI5YBwGKpaMgHIRLP7Wd6qT4Oh/wD3dxOCFasdNAIjuOOOakXvt8o/Pwey/
	 dkmF/AFL6Z7Xw==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:f5b1:db54:a11a:c333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C3BA317E10F3;
	Fri, 29 Aug 2025 11:20:52 +0200 (CEST)
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
Subject: [PATCH v5 00/27] Add support for MT8196 clock controllers
Date: Fri, 29 Aug 2025 11:18:46 +0200
Message-Id: <20250829091913.131528-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_022056_212962_1E9039F9 
X-CRM114-Status: GOOD (  13.98  )
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

Changes in v5:
- Used double negation in clk-mux/pll to return strict true/false values
- Dropped fenc_mask from clk-pll.c / clk-pll.h
- Moved MTK_WAIT_FENC_DONE_US definition to clk-mux.c
- Switched to dev_err_probe() / dev_err_ptr_probe() where applicable
- Added blank lines for separation when including binding headers
- Added struct mtk_gate * pointer in struct mtk_clk_gate, removed
  duplication in mtk_clk_register_gate()
- Dropped CLK_OPS_PARENT_ENABLE from gate macros when defining gates
  with different parents
- Used default COMMON_CLK_MT8196 for config COMMON_CLK_MT8196_MDPSYS in
  Kconfig

- Added vlp_clk26m definition in vlpckgen
- Renamed top_divs -> vlp_divs in vlpckgen
- Moved clk-mtk.h inclusion in clk-mux.c to the commit “clk: mediatek:
  clk-mux: Add ops for mux gates with HW voter and FENC”
- Renamed adsppll_ck -> adsppll in topckgen
- Fixed checkpatch warning in clk-mt8196-mdpsys.c (line too long)

- Dropped R-b tags on patches 6 (refactoring), 13 (vlp_clk26m defined,
  reparented audio clocks), 14, 15, 16, 19, 22 (dropped
  CLK_OPS_PARENT_ENABLE, changing the behavior of the
  affected clocks).

Link to v4: https://lore.kernel.org/all/20250805135447.149231-1-laura.nao@collabora.com/

Laura Nao (27):
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
  dt-bindings: clock: mediatek: Describe MT8196 clock controllers
  clk: mediatek: Add MT8196 apmixedsys clock support
  clk: mediatek: Add MT8196 topckgen clock support
  clk: mediatek: Add MT8196 topckgen2 clock support
  clk: mediatek: Add MT8196 vlpckgen clock support
  clk: mediatek: Add MT8196 peripheral clock support
  clk: mediatek: Add MT8196 ufssys clock support
  clk: mediatek: Add MT8196 pextpsys clock support
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

 .../bindings/clock/mediatek,mt8196-clock.yaml | 112 ++
 .../clock/mediatek,mt8196-sys-clock.yaml      | 107 ++
 drivers/clk/mediatek/Kconfig                  |  71 ++
 drivers/clk/mediatek/Makefile                 |  13 +
 drivers/clk/mediatek/clk-gate.c               | 119 ++-
 drivers/clk/mediatek/clk-gate.h               |   3 +
 drivers/clk/mediatek/clk-mt8196-apmixedsys.c  | 204 ++++
 drivers/clk/mediatek/clk-mt8196-disp0.c       | 170 +++
 drivers/clk/mediatek/clk-mt8196-disp1.c       | 170 +++
 .../clk/mediatek/clk-mt8196-imp_iic_wrap.c    | 118 +++
 drivers/clk/mediatek/clk-mt8196-mcu.c         | 167 +++
 drivers/clk/mediatek/clk-mt8196-mdpsys.c      | 186 ++++
 drivers/clk/mediatek/clk-mt8196-mfg.c         | 150 +++
 drivers/clk/mediatek/clk-mt8196-ovl0.c        | 154 +++
 drivers/clk/mediatek/clk-mt8196-ovl1.c        | 154 +++
 drivers/clk/mediatek/clk-mt8196-peri_ao.c     | 142 +++
 drivers/clk/mediatek/clk-mt8196-pextp.c       | 131 +++
 drivers/clk/mediatek/clk-mt8196-topckgen.c    | 985 ++++++++++++++++++
 drivers/clk/mediatek/clk-mt8196-topckgen2.c   | 568 ++++++++++
 drivers/clk/mediatek/clk-mt8196-ufs_ao.c      | 108 ++
 drivers/clk/mediatek/clk-mt8196-vdec.c        | 253 +++++
 drivers/clk/mediatek/clk-mt8196-vdisp_ao.c    |  80 ++
 drivers/clk/mediatek/clk-mt8196-venc.c        | 236 +++++
 drivers/clk/mediatek/clk-mt8196-vlpckgen.c    | 729 +++++++++++++
 drivers/clk/mediatek/clk-mtk.c                |  16 +
 drivers/clk/mediatek/clk-mtk.h                |  22 +
 drivers/clk/mediatek/clk-mux.c                | 122 ++-
 drivers/clk/mediatek/clk-mux.h                |  87 ++
 drivers/clk/mediatek/clk-pll.c                |  45 +-
 drivers/clk/mediatek/clk-pll.h                |   8 +
 .../dt-bindings/clock/mediatek,mt8196-clock.h | 803 ++++++++++++++
 .../reset/mediatek,mt8196-resets.h            |  26 +
 32 files changed, 6224 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8196-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8196-sys-clock.yaml
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


