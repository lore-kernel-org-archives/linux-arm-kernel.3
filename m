Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D206CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 13:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u+G5dr5KtjVQPOb85h0yN2SfEZosAnc+z/ySEEhSeiA=; b=CoIidGHNRGG3o9Atj4OoW6qsp7
	frJs8wk1VNp83VHAFqiHW3D9vFI1XCRWsRLs2G/Yguk0diNMsCrhUMpJozuJ9Lw4rz4qLRO1Ld9iY
	KD3rf85AnElFPvv1CBQV3o2OYoYOVt19+5uuIu6ZqXjrybuDGCHcrFGuB7VbiG8SkvLhFqO41zOG9
	/5IYIXG7D3k4U7Fbf+x9hGYlscWP4YhlpOmCnvX48/h5YXO1Q2VE5N7OqodN4BFwVFWfBzpwxkSnq
	393RlnSJfstSki2BuhfR9QYJrzCCFxvtmQHA8fbnb9J3hVE8N3yWZF7GMMNJfUpFBdmQQPAovhGxL
	FdThNGqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf3D-00000009St7-0Wmw;
	Thu, 11 Jun 2026 13:02:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf3C-00000009SsA-0t9e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 13:02:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 478CE6001A;
	Thu, 11 Jun 2026 13:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77ED81F00893;
	Thu, 11 Jun 2026 13:02:21 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 0/9] R-Car X5H Ironhide pure SCMI proof-of-concept
Date: Thu, 11 Jun 2026 15:02:04 +0200
Message-ID: <cover.1781171705.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

	Hi all,

As promised[1], I tried handling all issues with current R-Car X5H
Ironhide SCP FW SDK v4.28, v4.31, and v4.32 as SCMI quirks.  This helped
identifying missing features in the SCMI drivers and/or protocol:
  - The SCMI PM domain driver does not support always-on domains.
    This limits the ability of the Linux Power Management core to
    optimize its decisions by taking into account which PM domains
    cannot be disabled,
  - The SCMI protocol does not support clock domains.
  - Power management of on-SoC modules is typically handled through two
    methods: module power control and module clock gating.  The former
    can be exposed as an SCMI power domain, the latter as an SCMI clock.
    Currently, the SCMI clock protocol does not support advertizing
    whether a clock is intended for power-management of a hardware
    module, so such clocks can not be managed automatically through
    Runtime PM.  To solve this in general, the SCMI CLOCK_ATTRIBUTES
    could be extended with a new flag in the returned attributes (which
    is not done by this series).

Series overvies:
  - Patch 1 is a preparatory refactoring,
  - Patches 2-3 add support for always-on power areas,
  - Patches 4-7 add support for clock domains,
  - Patch 8 adds an SCMI quirk to advertize power-management clocks on
    R-Car X5H,
  - Patch 9 switches the (still minimal) Ironhide DTS to SCMI (this
    needs manual configuration for the actual SCP firmware version, as
    the SCMI domain IDs differ).
Note that other SCMI quirks than patch 8 are not included in this
series[2], as IMHO the original issues must be fixed in the SCP firmware
instead.

While the result works, and we might get stable SCMI domain IDs
(eventually), I still prefer the approach taking by the CPG/MDLC
remapping driver series[3], as:
  - It describes in DT the actual hardware (which is needed for U-Boot
    IPL),
  - It does not depend on SCMI domain IDs defined by firmware that is
    still under active development,
  - It lets us keep the DTB stable, while SCMI domain IDs may change,
    depending on system partitioning (i.e. software policy),
  - It allows us to support (in the Renesas LTS tree, not upstream)
    firmware versions that already exist, but need quirks for proper
    operation.

Thanks for your comments!

[1] "Re: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()"
    https://lore.kernel.org/CAMuHMdWJvMH+a1RqozbaCxxH_8M569JcruTFa8PW+87FysnjHw@mail.gmail.com

[2] List of SCMI quirks which are not included in this series, but are
    needed to boot on R-Car X5H Ironhide:

	firmware: arm_scmi: quirk: Handle critical clocks on R-Car X5H
	firmware: arm_scmi: quirk: Handle bad power domains on R-Car X5H
	firmware: arm_scmi: quirk: Handle bad clocks on R-Car X5H
	firmware: arm_scmi: quirk: Handle wrong clock rates on R-Car X5H
	firmware: arm_scmi: Add support for retrieving rates from another clock
	firmware: arm_scmi: quirk: Handle zero clock rates on R-Car X5H
	firmware: arm_scmi: quirk: Add always-on power domains on R-Car X5H
	firmware: arm_scmi: quirk: Handle broken HSCIF0 reset on R-Car X5H

    With diffstat:

	 drivers/firmware/arm_scmi/clock.c  | 2555 +++++++++++++++++++++++++++-
	 drivers/firmware/arm_scmi/power.c  |   83 +
	 drivers/firmware/arm_scmi/quirks.c |   12 +
	 drivers/firmware/arm_scmi/quirks.h |    4 +
	 drivers/firmware/arm_scmi/reset.c  |    9 +
	 5 files changed, 2655 insertions(+), 8 deletions(-)

[3] "[PATCH/RFC 00/14] R-Car X5H Ironhide SCMI CPG/MDLC remapping"
    https://lore.kernel.org/cover.1776793163.git.geert+renesas@glider.be

Geert Uytterhoeven (9):
  firmware: arm_scmi: Replace scmi_power_proto_ops.name_get() by
    .info_get()
  firmware: arm_scmi: Advertize always-on power domains
  pmdomain: arm: scmi: Add always-on support
  firmware: arm_scmi: Add a flag for power-management clocks
  clk: scmi: Add scmi_clk_is_pm_clk()
  dt-bindings: firmware: arm,scmi: Document arm,clock-domain
  pmdomain: arm: scmi: Add clock domain support
  firmware: arm_scmi: quirk: Handle power management clocks on R-Car X5H
  arm64: dts: renesas: ironhide: Switch to pure SCMI

 .../bindings/firmware/arm,scmi.yaml           |  7 ++
 .../boot/dts/renesas/r8a78000-ironhide.dts    | 44 +++++++++
 drivers/clk/clk-scmi.c                        |  9 ++
 drivers/firmware/arm_scmi/clock.c             | 15 +++
 drivers/firmware/arm_scmi/power.c             | 21 +++--
 drivers/pmdomain/arm/Kconfig                  |  1 +
 drivers/pmdomain/arm/scmi_pm_domain.c         | 93 ++++++++++++++++++-
 include/linux/clk/scmi.h                      | 17 ++++
 include/linux/scmi_protocol.h                 | 12 ++-
 9 files changed, 204 insertions(+), 15 deletions(-)
 create mode 100644 include/linux/clk/scmi.h

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

