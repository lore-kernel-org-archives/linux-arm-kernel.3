Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4BEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CNQ/9AgUT6+O9qwrOtmNdytg/njKn724Fy3dCvXkRqI=; b=XVZjnFmVfcL/J/8bmeCLf7/qhq
	lT54C4RWe6QTH5BVD8bOre6QMpsgsJzC/YkUceGr/CcfAgw79BJ8fKVpZ24FX2aFs8ncgSNxKjRpA
	sdR9PfYzMD1ejnPX+0ds+WmxOvrZ4XG52JagpuEaZwPLrrEjj2vwAmsy+qUl2tD1xp0UR7rQkBKy/
	3wFvNUaIKEbFUxZyao2BhRnXwOzGhfU3znRsxiHOqcVHPb7DiJsAP3rcDeORNRjFGD7aCRuY5iN6y
	tbUSiF6U6IXw4LWdXT5LjO9xHzViqHRNzTce042Klmi0OZUaKr1p/ERZdVoF6/SK18dyfNdjeGwmJ
	1GK/l1Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS0q-0000000FwbY-2mvb;
	Tue, 30 Jun 2026 06:32:04 +0000
Received: from azure-sdnproxy.icoremail.net ([13.75.44.102])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS0l-0000000FwZt-3kfU;
	Tue, 30 Jun 2026 06:32:02 +0000
Received: from E0004057DT.eswin.cn (unknown [10.11.96.26])
	by app2 (Coremail) with SMTP id TQJkCgDn+57AYkNqSBwwAA--.59400S2;
	Tue, 30 Jun 2026 14:31:29 +0800 (CST)
From: lizhi2@eswincomputing.com
To: devicetree@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	maxime.chevallier@bootlin.com
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	pritesh.patel@einfochips.com,
	weishangjuan@eswincomputing.com,
	horms@kernel.org,
	lee@kernel.org,
	wens@kernel.org,
	Zhi Li <lizhi2@eswincomputing.com>
Subject: [PATCH net-next v9 0/6] net: stmmac: eic7700: add eth1 variant support and update delay bindings
Date: Tue, 30 Jun 2026 14:31:22 +0800
Message-ID: <20260630063123.1118-1-lizhi2@eswincomputing.com>
X-Mailer: git-send-email 2.52.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: TQJkCgDn+57AYkNqSBwwAA--.59400S2
X-Coremail-Antispam: 1UD129KBjvJXoW3KF4rCry5Jr4kAr4fWFyfJFb_yoWktr18pF
	Z8Wrn8GFsxJFyxAan7JF109a4Fqan3GFyj9r1rJrnrXws09FyqqrWS9F45ZFyDurZ7uryY
	vF45tF4vka4j9FJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBv14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRBOJnUUUUU=
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_233200_234395_72CAAF26 
X-CRM114-Status: GOOD (  22.66  )
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

From: Zhi Li <lizhi2@eswincomputing.com>

v8 -> v9:
  - patch1:
      - Add Reviewed-by: Rob Herring <robh@kernel.org>
  - patch2:
      - Update DT binding schema for tx-internal-delay-ps:
        - Replace the previous oneOf schema with a base range plus
          allOf/if-then conditional constraints.
        - Define a common range of 0-4540 ps and apply compatible-specific
          constraints using conditional schema rules:
            - eswin,eic7700-qos-eth:
              maximum 2540 ps
            - eswin,eic7700-qos-eth-clk-inversion:
              minimum 2000 ps
  - patch6:
      - Refine DTS implementation to address Sashiko review comments:
        - Address DTC and dtbs_check warnings.
        - Improve node naming and HSP bus organization.
  - patch5 and patch6:
      - Update commit messages for the DTS patches:
        - Clarify that the DTS patches are included only to provide an
          overview of the complete Ethernet integration for review.
        - The upstream DTS enablement will be submitted as a separate series
          after the DT bindings and driver changes have been applied.

  - Link to v8:
    https://lore.kernel.org/lkml/20260610012727.848-1-lizhi2@eswincomputing.com/

v7 -> v8:
  - eth0-related fixes were moved into separate series [1], [2]:
    - All eth0-related fixes have been removed from this series to avoid mixing
      MAC variants and RX timing logic in a single review context.
    - Reference:
      [1]https://lore.kernel.org/lkml/20260602014528.2076-1-lizhi2@eswincomputing.com/
      [2]https://lore.kernel.org/lkml/20260518021919.404-1-lizhi2@eswincomputing.com/

  - Update cover letter and overall series scope description:
    - Replace previous wording "EIC7700 eth1 RX sampling timing fix"
      with a more accurate description:
        - Add eth1 MAC variant support.
        - Update RGMII delay binding model.
    - This reflects the structural nature of the series rather than a pure
      bug fix.

  -  Split DT bindings changes into two patches:
    - patch1:
        - Relax RGMII internal delay constraints.
        - Change rx/tx internal delay from enum-based model to range-based
          model.
        - Mark delay properties as optional.
    - patch2:
        - Introduce EIC7700 eth1 MAC variant compatible string
          "eswin,eic7700-qos-eth-clk-inversion".
        - Model silicon-specific RX clock inversion requirement via SoC
          variant instead of board-level properties.

    - Due to this restructuring:
        - Patch structure and commit messages have changed significantly
          compared to v7.
        - The previously received Acked-by from Conor Dooley is not
          carried forward because the binding patches were substantially
          reworked and split.

  - Split driver changes into two patches. No functional changes to eth1
    compared to v7:
    - patch 3:
        - Make rx-internal-delay-ps and tx-internal-delay-ps optional.
        - Remove mandatory DT property requirement in probe path.
        - Allow zero-delay default when properties are absent.
    - patch 4:
        - Add support for eth1 MAC variant using compatible-specific
          match data.
        - Introduce RX clock inversion handling for eth1 at runtime.
        - Apply speed-dependent configuration via fix_mac_speed()
          callback.

  - Note:
    - These patches (5/6 and 6/6) are included only to facilitate review
      of the overall Ethernet integration across bindings, driver, and
      device tree.
      A cleaned-up, upstream-ready DTS series will be submitted separately
      once all dependencies and final hardware integration are completed.

  - Link to v7:
    https://lore.kernel.org/lkml/20260427072353.1114-1-lizhi2@eswincomputing.com/

v6 -> v7:
  - Address checkpatch.pl --strict warnings for DTS changes:
    - Split DT binding documentation and DTS board description into separate patches
    - Fix DTS style issues reported by checkpatch:
      - Reduce line length where applicable
      - Add required description for rgmii-rxid

  - DTS changes in this series are split into:
    - Patch 3/4: syscon binding update (documentation / reference only)
    - Patch 4/4: board DTS changes (architecture overview only)

    These patches (3/4 and 4/4) are provided to facilitate review of the overall
    Ethernet integration across binding, driver, and device tree, and are not
    intended as final upstream submission in their current form.

    A cleaned-up, upstream-ready DTS series will be submitted separately once
    all dependencies and final hardware integration are completed.

  - Note:
    - Clock-related bindings referenced in earlier revisions are now already merged
      into net-next, so dtbs_check warnings related to clock are no longer present
      and are not relevant to this revision.

  - No functional changes in the stmmac driver or binding semantics in this revision.

  - Link to v6:
    https://lore.kernel.org/lkml/20260423085501.760-1-lizhi2@eswincomputing.com/

v5 -> v6:
  - Update DTS/DTSI descriptions to fix invalid phandle references reported by DTC:
    - Add missing GMAC provider nodes required for proper hardware description:
      - HSP power domain: GMAC nodes moved under this domain to reflect
        hardware power hierarchy.
      - Clock nodes: added to provide clk phandles referenced by GMAC.
      - Reset nodes: added to provide reset phandles referenced by GMAC.
      - Pinctrl nodes: defines pinctrl settings for GMAC signals
        (pinctrl_gpio106, pinctrl_gpio111).
    - Move GMAC nodes under the correct HSP power domain.
    - Ensure DTS builds without dtc errors and all phandle references
      (clk/reset/pinctrl/power-domain) are valid.
    - This update does not change runtime behavior; it only improves DTS
      consistency and resolves issues reported by dtc.

  - Note:
    - The patch 3/3 for DTS changes in this series provide an overview of the GMAC
      integration and its dependencies, as discussed previously:
      https://lore.kernel.org/lkml/64bf6b40-b947-4ffa-8d48-4d6341931327@lunn.ch/

    - It is **not intended for upstream inclusion** in its current form,
      and is provided solely for architecture overview and integration
      context.

    - A fully cleaned and upstream-ready DTS series will be submitted
      separately once all related components (pinctrl, clock, power-domain,
      etc.) are finalized.

  - dtbs_check has been run on top of net-next for reference purposes.
    Remaining warnings are expected due to missing EIC7700 clock bindings[1]
    in net-next and do not reflect issues in the DTS design itself.

  - One remaining warning:
    - eswin,eic7700-clock

  - The clock binding has already been applied to upstream and is present
    in mainline, but not yet available in net-next.

  - The syscon binding is extended in this series to include the
    eswin,eic7700-syscfg compatible.

  - Any further refinement of the syscfg binding will be handled in
    separate patches if needed.

  - Dependencies:
    - [1]EIC7700 clock binding:
      https://lore.kernel.org/lkml/20260303080637.2100-1-dongxuyang@eswincomputing.com/
      (already applied to upstream)

  - Link to v5:
    https://lore.kernel.org/lkml/20260324073017.376-1-lizhi2@eswincomputing.com/

v4 -> v5:
  - eswin,eic7700-eth.yaml:
    - Add Acked-by from Conor Dooley
    - No functional changes

  - Update dwmac-eic7700.c:
    - Disable clocks on the error path to fix a clock leak in
      eic7700_dwmac_init() when regmap_set_bits() fails
      (reported by Simon Horman <horms@kernel.org>)

  - Link to v4:
    https://lore.kernel.org/lkml/20260313075234.1567-1-lizhi2@eswincomputing.com/

v3 -> v4:
  - Update eswin,eic7700-eth.yaml:
    - Improve commit message in dt-bindings patch to clarify the
      hardware difference of the eth1 MAC and why a new compatible
      string is required.
    - Move the newly added eswin,hsp-sp-csr item to the end of the list
      to avoid inserting entries in the middle of the binding schema.
    - Simplify the compatible schema by replacing the previous oneOf
      construct with an enum.

  - Update dwmac-eic7700.c:
    - Fix build issues.
    - Adjust code to match the updated binding definition.

  - Update DTS/DTSI descriptions:
    - Move SoC-level descriptions to the .dtsi file.
    - Keep board-specific configuration in the .dts file.

  - Link to v3:
    https://lore.kernel.org/lkml/20260303061525.846-1-lizhi2@eswincomputing.com/

v2 -> v3:
  - Update eswin,eic7700-eth.yaml:
    - Extend rx-internal-delay-ps and tx-internal-delay-ps range
      from 0-2400 to 0-2540 to match the full 7-bit hardware delay
      field (127 * 20 ps).
    - Add "multipleOf: 20" constraint to reflect the 20 ps hardware
      step size.
    - Make rx-internal-delay-ps and tx-internal-delay-ps optional.
      A well-designed board should not require internal delay tuning.
    - Remove rx-internal-delay-ps and tx-internal-delay-ps from the
      example to avoid encouraging blind copy into board DTs.

  - Update dwmac-eic7700.c:
    - Treat rx-internal-delay-ps and tx-internal-delay-ps as optional
      DT properties.
    - Apply delay configuration only when properties are present.
    - Keep TX/RX delay registers cleared by default to ensure a
      deterministic state when no delay is specified.

  - Describe Ethernet configuration for the HiFive Premier P550 board:
    - Add GMAC controller nodes for the HiFive Premier P550 board
      to describe the on-board Ethernet configuration.

      The Ethernet controller depends on clock, reset, pinctrl
      and HSP subsystem providers which are currently under
      upstream review. These dependent nodes will be submitted
      separately once the corresponding drivers are merged.

      Due to these missing dependencies, dt-binding-check may
      report warnings or failures for this series.

  - No functional changes to RX clock inversion logic.

  - Link to v2:
    https://lore.kernel.org/lkml/20260209094628.886-1-lizhi2@eswincomputing.com/

  - This series is based on the EIC7700 clock support series:
    https://lore.kernel.org/all/20260210095008.726-1-dongxuyang@eswincomputing.com/
    The clock series is currently under review.

v1 -> v2:
  - Update eswin,eic7700-eth.yaml:
    - Drop the vendor-specific properties eswin,rx-clk-invert and
      eswin,tx-clk-invert.
    - Introduce a distinct compatible string
      "eswin,eic7700-qos-eth-clk-inversion" to describe MAC instances that
      require internal RGMII clock inversion.
      This models the SoC-specific hardware difference directly via the
      compatible string and avoids per-board configuration properties.
    - Change rx-internal-delay-ps and tx-internal-delay-ps from enum to
      minimum/maximum to reflect the actual delay range (0-2400 ps)
    - Add reference to High-Speed Subsystem documentation in eswin,hsp-sp-csr
      description. The HSP CSR block is described in Chapter 10
      ("High-Speed Interface") of the EIC7700X SoC Technical Reference Manual,
      Part 4 (EIC7700X_SoC_Technical_Reference_Manual_Part4.pdf):
      https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual/releases

  - Update dwmac-eic7700.c:
    - Remove handling of eswin,rx-clk-invert and eswin,tx-clk-invert
      properties.
    - Select RX clock inversion based on the new
      "eswin,eic7700-qos-eth-clk-inversion" compatible string, using
      match data to apply the required configuration for affected MAC
      instances (eth1).

  - Link to v1:
    https://lore.kernel.org/lkml/20260109080601.1262-1-lizhi2@eswincomputing.com/

Zhi Li (6):
  dt-bindings: ethernet: eswin: relax internal delay model to
    range-based constraints
  dt-bindings: ethernet: eswin: add EIC7700 eth1 RX clock inversion
    variant
  net: stmmac: eic7700: make RGMII delay properties optional
  net: stmmac: eic7700: add support for eth1 clock inversion variant
  dt-bindings: mfd: syscon: add ESWIN EIC7700 compatible
  riscv: dts: eswin: eic7700-hifive-premier-p550: enable Ethernet
    controller

 .../devicetree/bindings/mfd/syscon.yaml       |   2 +
 .../bindings/net/eswin,eic7700-eth.yaml       |  74 +++++-
 .../dts/eswin/eic7700-hifive-premier-p550.dts | 240 ++++++++++++++++++
 arch/riscv/boot/dts/eswin/eic7700.dtsi        | 105 ++++++++
 .../ethernet/stmicro/stmmac/dwmac-eic7700.c   | 117 ++++++++-
 5 files changed, 511 insertions(+), 27 deletions(-)

-- 
2.25.1


