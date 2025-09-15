Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F313CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 15:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OFejQ0cdNa9qmbNTPF5Hw3J5X2zJAp7tBi6KMLn2gXc=; b=P2Pl0H4Ujo08ZEdCStwev/rgO2
	p6RiTQueyryqpb2BgOI7mQURp+8pUjTS9mYaIEzS4qDLv0Mtry6CuB2LMgysjAFr1b6RUeR7yh/63
	K51noum607NeqVj9+sbPGZ5B3sm+iKV1D2Wdi91Y/VMBS7d9VN4IOCva8lLT/IH45h5lqmVzpnIyA
	4BYTS4wV0D/2UglzkHLqnC8M+RjaQVFhd/+KkI0najGV7CWfwGnhFq2SPNb5E3OVP/q/1wtt0nuGR
	3dcy169yAf3rQp68qlPyTAR0GwZ5MTwYZmH0Wle8cST2BJx1CQLNMFUVj5O9DbJFBYjPmrDY13cwC
	IeJ5YrVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyB1G-00000004scy-20vo;
	Mon, 15 Sep 2025 15:21:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyB1C-00000004saV-3we0;
	Mon, 15 Sep 2025 15:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757949684;
	bh=gtM2QscaPzR4xfedL0O2h+0MwhbJv7L7+rVQtjSfix4=;
	h=From:To:Cc:Subject:Date:From;
	b=ZnQtBxEcdpoSZJludpjeppay19kRf+JxYUd/FXeWXaExetQRhHPXEq8GeTv+AKE6X
	 Hec/m03fwJJ8Glz4rfz1D1Pq+oOvIUVk3mit6IVjW13UaXAzIJDH+oOwiPmjLv+PAf
	 yZO8cJt+/mESmCPnINE4ij/5RA51wQSdYnGJetGyq5QguES+YEgE90tA9s36v0pQCt
	 2pl0nSpYCEeLBmMNWCpL/LAcs/tNKZCbDVhyrPldmxk1G54Zx1DVtOf12qygQYPKeT
	 WAa1whbf4UakRwCaxjdWKhEndFQTpAR/7/H+fj3YwyapYEs2ahy+dIGjqvTm1OFB9V
	 Vs7cIJZ2UN+rQ==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:1c8d:f5ba:823d:730b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6C69517E046C;
	Mon, 15 Sep 2025 17:21:22 +0200 (CEST)
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
Subject: [PATCH v6 00/27] Add support for MT8196 clock controllers
Date: Mon, 15 Sep 2025 17:19:20 +0200
Message-Id: <20250915151947.277983-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_082127_153079_B9C8F3C2 
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

This patch series introduces support for the clock controllers on the
MediaTek MT8196 platform, following up on an earlier submission[1].

MT8196 uses a hardware voting mechanism to control some of the clock muxes
and gates, along with a fence register responsible for tracking PLL and mux
gate readiness. The series introduces support for these voting and fence
mechanisms, and includes drivers for all clock controllers on the platform.

[1] https://lore.kernel.org/all/20250307032942.10447-1-guangjie.song@mediatek.com/

Changes in v6:
- Removed unnecessary braces in clk-mux and clk-gate
- Excluded clk26m from the parent lists of vlp_audio_h, vlp_aud_engen1,
  vlp_aud_engen2, and vlp_aud_intbus
- Reordered entries in of_match_clk_mt8196_mdpsys
- Converted mfg_eb clock into a mux with a gate

Link to v5: https://lore.kernel.org/all/20250829091913.131528-1-laura.nao@collabora.com/

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
 drivers/clk/mediatek/clk-gate.c               | 117 ++-
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
 drivers/clk/mediatek/clk-mt8196-vlpckgen.c    | 725 +++++++++++++
 drivers/clk/mediatek/clk-mtk.c                |  16 +
 drivers/clk/mediatek/clk-mtk.h                |  22 +
 drivers/clk/mediatek/clk-mux.c                | 120 ++-
 drivers/clk/mediatek/clk-mux.h                |  87 ++
 drivers/clk/mediatek/clk-pll.c                |  45 +-
 drivers/clk/mediatek/clk-pll.h                |   8 +
 .../dt-bindings/clock/mediatek,mt8196-clock.h | 803 ++++++++++++++
 .../reset/mediatek,mt8196-resets.h            |  26 +
 32 files changed, 6216 insertions(+), 35 deletions(-)
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


