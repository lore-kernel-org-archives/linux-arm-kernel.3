Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AA4C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 10:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TP9f7hSqJCVzHb0I9w8mWKyCt7AaUu2NBZnB54bRCoE=; b=qsoQuqxstaTdCs
	fPAsabus6+st5INmQNatJJE+i5FDi8wWdLZfHwygkKbv0oaSUauy4Y63v3sUfwVKigxQmdjvPbfR/
	LZTea/3KnMvvE4XvH69t631Q2NhaAsXg0/69Sx2oPSOxIZGXXNmzEbrXYaJmPFiOm7cRln3lVb7fK
	jcQ6j+jBeDVUNX3I86IE2T8JpDSkwrx49k/d6cupTXF46MaD/CljXgf1EpZf8w6iOVl42otQhHhsi
	4cDTan98/6g2X6kFwKwUczioq6b0EuNgTzY5V0o0Qnj8+Fxrz1uHds8l4e+/7p54EYnjrq8iGi7La
	X13rFt+Fe8oG/d09SyVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp187-00000007S11-24c9;
	Wed, 29 Jul 2026 10:03:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp184-00000007Rzv-1EWH;
	Wed, 29 Jul 2026 10:03:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785319389;
	bh=vSlx1YR8yuwqabNxdGdT5bOCw3FjxlNU3NevIxUKNuU=;
	h=From:Subject:Date:To:Cc:From;
	b=c/soOaXNb5PxoIfIOHLXE2UzIIV8kVDu4oURvh1ZyOnCIoDggkm0MIF1C/kH1wQgB
	 4drjTQqlS6zISIf3pttrHK2Fmo1btop2riP6gYMjHjf/K1vfu8ROQ/CJpAL2dME7AS
	 5+SGRGaO887kQA0f3retMCOkb0MxLJ+bkyQ1LOaF3sFbLwGu4QwL7RdBKZc9IFoCuF
	 aUnytaOmlPB1OBW43bUTX0ky6vkMapDi25ZaEhOuFGrKorf9YHr8FeHwpW0EeUuz+8
	 Js9uEmHmSH2uFVAFlCq1rHQMAnmslGBdNO7dE5fws1zvPEzGtd0DfklFYWgyZJh6LK
	 faXV3R3b2kFkQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1EB5917E0048;
	Wed, 29 Jul 2026 12:03:08 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH v4 00/24] MT8189: Add support for system and base clock
 controllers
Date: Wed, 29 Jul 2026 12:02:44 +0200
Message-Id: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Qy27DIBBFf8ViXSoeLsZZ9T+qLgY8NKi2aYGiR
 JH/vQRvoqry8s7onDuaG0kYPSZy6m4kYvHJh7WG/qkj9gzrB1I/1UwEE4opyeiSNdcjtXOwn4m
 ma8q4UAMJ6cAG3mPvnAAglf+K6Pylud/e9xzx+6dW5H1IGmbDsvh86la8ZNpqBqHJHTj7lEO8t
 tsKb8S+Z/zgjMIpo8KwXjtEeGHwasM8gwkRnmtXMxfxaBuPbOJuG4WaQE5GWfefTT7YxNGLiqw
 2jWoaRzASJvHXtm3bL5XaD3OTAQAA
X-Change-ID: 20260630-mt8189-clocks-system-base-70714e4ff2aa
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 Irving-CH Lin <irving-ch.lin@mediatek.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785319387; l=9420;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=vSlx1YR8yuwqabNxdGdT5bOCw3FjxlNU3NevIxUKNuU=;
 b=HMumC0T/jkieBml2dcRLtePL/Wdf21tvYbX4ZO+zOonIJ7CHj3Be1sg6VMgJkpzMmnVGHFHs5
 bVN05+Effr9DBvpaE9bQxt66tvYsK5dysuoHGbozQYBuheZPgo99o7u
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_030312_526158_5221EAD9 
X-CRM114-Status: GOOD (  20.35  )
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

This series is a continuation by AngeloGioacchino Del Regno and I of a
previous series ([1]), that adds the clock controller support for
the Mediatek MT8189 SoC and its variants (MT8371, MT8391).  

The first major changes is the split of the series in two:
- one for all basic clock controllers including system ones (this
series)
- one for the multimedia and graphics related clock controllers (to be
send in the future)

We chose to separate the multimedia clock drivers from the base system
ones, as there is currently an unsolvable inter-dependency between the
power domains and multimedia clocks; the power domains need a
dual-stage bring-up, where only a part of the multimedia clocks are
accessible in the first power domain powerup stage, and the rest when
the second stage (SRAM enablement) is done.
The current workarounds for this issue, such as removing the is_enabled
operation from the impacted clock controllers clk_ops table or
let the multimedia power domain always on, were quickly discarded
for upstream.

The second major change is the dt-bindings patch ([2]) that got heavily
reworked, not only because of the split choice. We took the opportunity
to regroup in the MT8186 clock and system clock dt-bindings the
description of several other Mediatek SoC (MT8188, MT8192 and MT8195)
and add in them the MT8189 new ones.
The rationale is to ease maintainability and have common files for
several currently supported SoC or new future ones, that have the same
kind of clock controller design.

Finally the pending remarks from peer reviews on the v6 revision of [1]
were also taken into account and new fixes and cleanups were also
added.

A more detailed changelog between [1] and this series:
- Removed multimedia and graphics related clock controllers code and
  definitions from series
- Added new dt-bindings patches to factorise existing MT8188, MT8192
  and MT8195 in MT8186 clock dt-bindings
- Heavily modified the MT8189 dt-bindings to add new compatibles 
  in MT8186 clock dt-bindings
- Created a new dt-bindings include for the MT8189 reset controller
  definitions (include/dt-bindings/reset/mediatek,mt8189-resets.h)
- Removed unnecessary `syscon` compatible fallback from MT8189 base
  clock controllers
- Added missing 'mediatek,mt8189-fhctl' compatible declaration in
  dt-bindings
- Modified Kconfig to COMMON_CLK_MT8189 be tristate (and not bool) to 
  allow all MT8189 clock controller drivers to be built as modules (it
  was partial) 
- Fix pll unregisters in clk_mt8189_apmixed_probe error case
- Reparent several clocks to correct 26M references in clk-mt8189-bus.c,
  clk-mt8189-topckgen.c and clk-mt8189-vlpckgen.c
- Removed CLK_SET_RATE_NO_REPARENT flag from mfg_sel_mfgpll
- Rename TOPCKGEN_fmipi_csi_up26m clock to fmipi_csi_up26m to remove caps usage
- Implemented reset controllers in clk-mt8189-ufs.c
- Updated all file headers to update copyrights and add all authors
- Added all co-developed-by trailers

The series is based on linux-next tree (tag: next-20260728) and has
been tested on Mediatek Genio 520-EVK (MT8371) and 720-EVK (MT8391)
boards, with hardware enablement patch series ([3]), and on Genio
510-EVK (MT8370, variant of MT8188) and Genio 1200-EVK (MT8395,
variant of MT8195).

[1]: https://lore.kernel.org/linux-mediatek/20260309120512.3624804-1-irving-ch.lin@mediatek.com/
[2]: https://lore.kernel.org/linux-mediatek/20260309120512.3624804-2-irving-ch.lin@mediatek.com/
[3]: https://lore.kernel.org/linux-mediatek/20260701-add-mediatek-genio-520-720-evk-v2-0-19d5da4ef984@collabora.com/

---
Changes in v4:
- Rebased on next-20260728 tag
- Added patches 9 to 14 to add new clock ops data set for PLL and
  PLL-FHCTL to handle a new PLL switch logic for PLL control and BAR
  reset, supported by MT8189 SoC
- Patch 15:
  - Removed useless includes (B. Masney)
  - Fixed variable declaration order in clk_mt8189_apmixed_probe (B.
    Masney)
  - Added missing pwr_reg setting setting in PLL_SETCLR macro (B. 
    Masney, Sashiko)
  - Added en_set_reg, en_clr_reg, rst_bar_reg, rst_bar_set_reg and
    rst_bar_clr_reg fixed offsets and new mtk_pll_setclr_ops ops
    setting in PLL_SETCLR macro
  - Added pwr_reg offset values in apmixed_plls array
  - Fixed rst_bar_mask for mainpll univpll, and mmpll in apmixed_plls
    array to match rst_bar set/clr reg settings
- Fixed factor ratio for mainpll_d4_d8, tvdpll1_d16, tvdpll2_d16 and
  osc_d16 clocks (Sashiko)
- Link to v3: https://lore.kernel.org/r/20260720-mt8189-clocks-system-base-v3-0-8e6d99ab3ad2@collabora.com

Changes in v3:
- Rebased on next-20260717 tag
- Added Fixes tags to patches 1, 2 and 3
- Reworded patch 8 subject and description messages
- Updated Reviewed-by and Acked-by trailers
- Link to v2: https://lore.kernel.org/r/20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com

Changes in v2:
- Rebased on next-20260708 tag
- Added patch 1,2 and 3 to make the #clock-cells a required property in
  MT8186, MT8192 and MT8195 clock controller dt-bindings
- Patch 5:
  - Removed conditional blocks to check clock-cells property presence
    for MT8188 clock controller compatible
  - Reworded commit message to remove the note (no more applicable)
  - Fixed incorrect property value in else block for #reset-cells
    property check.
_ Removed from patch 9 conditional blocks to check clock-cells property
  presence for MT8189 clock controller compatible
- Fixed missing MODULE_DEVICE_TABLE in patches 10, 11 and 12.
- Added devicetree series link in cover letter
- Link to v1: https://lore.kernel.org/r/20260701-mt8189-clocks-system-base-v1-0-2b048feea50a@collabora.com

---
Louis-Alexis Eyraud (24):
      dt-bindings: clock: mediatek: Make '#clock-cells' required for MT8186
      dt-bindings: clock: mediatek: Make '#clock-cells' required for MT8192
      dt-bindings: clock: mediatek: Make '#clock-cells' required for MT8195
      dt-bindings: clock: mediatek: reorder MT8186 compatibles
      dt-bindings: clock: mediatek: regroup MT8188 dt-bindings into MT8186
      dt-bindings: clock: mediatek: regroup MT8192 dt-bindings into MT8186
      dt-bindings: clock: mediatek: regroup MT8195 dt-bindings into MT8186
      dt-bindings: clock: mediatek: Add MT8189 system/base clocks and resets
      clk: mediatek: Harmonize mtk_pll_fenc related symbol names
      clk: mediatek: pll: Add BAR reset register offsets
      clk: mediatek: pll: split default prepare/unprepare callbacks
      clk: mediatek: pll: Add ops for PLLs using set/clr regs
      clk: mediatek: pllfh: Add configurable clock ops to mtk_pllfh_data
      clk: mediatek: pllfh: Add ops for PLLs using set/clr regs
      clk: mediatek: Add MT8189 apmixedsys clock support
      clk: mediatek: Add MT8189 topckgen clock support
      clk: mediatek: Add MT8189 vlpckgen clock support
      clk: mediatek: Add MT8189 vlpcfg clock support
      clk: mediatek: Add MT8189 bus clock support
      clk: mediatek: Add MT8189 dbgao clock support
      clk: mediatek: Add MT8189 dvfsrc clock support
      clk: mediatek: Add MT8189 i2c clock support
      clk: mediatek: Add MT8189 scp clock support
      clk: mediatek: Add MT8189 ufs clock support

 .../bindings/clock/mediatek,mt8186-clock.yaml      |  128 ++-
 .../bindings/clock/mediatek,mt8186-fhctl.yaml      |    1 +
 .../bindings/clock/mediatek,mt8186-sys-clock.yaml  |   24 +-
 .../bindings/clock/mediatek,mt8188-clock.yaml      |   93 --
 .../bindings/clock/mediatek,mt8188-sys-clock.yaml  |   58 --
 .../bindings/clock/mediatek,mt8192-clock.yaml      |  191 ----
 .../bindings/clock/mediatek,mt8192-sys-clock.yaml  |   68 --
 .../bindings/clock/mediatek,mt8195-clock.yaml      |  238 -----
 .../bindings/clock/mediatek,mt8195-sys-clock.yaml  |   76 --
 drivers/clk/mediatek/Kconfig                       |   79 ++
 drivers/clk/mediatek/Makefile                      |    8 +
 drivers/clk/mediatek/clk-mt8189-apmixedsys.c       |  203 ++++
 drivers/clk/mediatek/clk-mt8189-bus.c              |  200 ++++
 drivers/clk/mediatek/clk-mt8189-dbgao.c            |   98 ++
 drivers/clk/mediatek/clk-mt8189-dvfsrc.c           |   58 ++
 drivers/clk/mediatek/clk-mt8189-iic.c              |  122 +++
 drivers/clk/mediatek/clk-mt8189-scp.c              |   77 ++
 drivers/clk/mediatek/clk-mt8189-topckgen.c         | 1025 ++++++++++++++++++++
 drivers/clk/mediatek/clk-mt8189-ufs.c              |  133 +++
 drivers/clk/mediatek/clk-mt8189-vlpcfg.c           |  116 +++
 drivers/clk/mediatek/clk-mt8189-vlpckgen.c         |  285 ++++++
 drivers/clk/mediatek/clk-mt8196-apmixedsys.c       |    2 +-
 drivers/clk/mediatek/clk-mt8196-vlpckgen.c         |    2 +-
 drivers/clk/mediatek/clk-pll.c                     |  135 ++-
 drivers/clk/mediatek/clk-pll.h                     |   13 +-
 drivers/clk/mediatek/clk-pllfh.c                   |   15 +-
 drivers/clk/mediatek/clk-pllfh.h                   |    3 +
 include/dt-bindings/clock/mediatek,mt8189-clk.h    |  433 +++++++++
 include/dt-bindings/reset/mediatek,mt8189-resets.h |   17 +
 29 files changed, 3135 insertions(+), 766 deletions(-)
---
base-commit: bbda95765d148ddea2f3876bb09aadd741cf3316
change-id: 20260630-mt8189-clocks-system-base-70714e4ff2aa

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


