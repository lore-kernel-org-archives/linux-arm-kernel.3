Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5DEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PH16pWpUZMDD4RyA5EY4sXBD3DmaPuKLBhk57XXzEps=; b=SuIgpSvSG5oRvueNAmWXVSIpbr
	8rI2LnbPBp/6GCnW9K6o47DXkS86Q09w1aFmTv5oQbYj77ZF6xxSOmNO2bnIauzylUK6tETiKRdWs
	5Evn+hTf4d+Od8UkYODe1ScwW7fl9YE1fE+v1gdavvyEUSvBEJL0fvvCn7cwZznoeLsniReP9Nk70
	Kgg9A2jd8foMEiAhPxLvK7mTSNlebX9jC/keUGHkpm6yyRNFaJH7+gcJxN3cs16Vv+WFsgxXCQUgq
	YqxPRGjNaRNdQH1eE4f/TJK8u22afUNBR0Sy8vOwJEEvONY/ZWptx40CnV9BIN46QgZtaWl5S33ne
	DLqsEVXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPJL-0000000Gpl3-16qk;
	Wed, 08 Jul 2026 10:15:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPJJ-0000000Gpkm-0qxJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 10:15:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9046B60008;
	Wed,  8 Jul 2026 10:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D89631F000E9;
	Wed,  8 Jul 2026 10:15:16 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/6] R-Car X5H CPG/MDLC support
Date: Wed,  8 Jul 2026 12:15:05 +0200
Message-ID: <cover.1783505142.git.geert+renesas@glider.be>
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

This patch series adds minimal support for the Renesas R-Car X5H Clock
Pulse Generator (CPG) and Module Controller (MDLC), to aim for replacing
the dummy clocks in r8a78000.dtsi with proper hardware description.
These two components are closely related, in the sense that they are
both supposed to be accessed through the ARM System Control and
Management Interface (SCMI) on the Ironhide development board.

This series consists of three parts:
  1. Patches 1-2 add DT bindings and DT binding definitions,
  2. Patches 3-4 add minimal CPG and MDLC drivers,
  3. Patches 5-6 update the DTS.

Some of these patches have been sent before as part of "[PATCH/RFC
00/14] R-Car X5H Ironhide SCMI CPG/MDLC remapping"[1], hence the v2.
However, this series does not use or rely on SCMI in any way.

Major changes compared to v1[1] (more detail in the individual patches):
  - Add default support not using SCMI,
  - Drop everything related to SCMI.

SCMI remapping support will be added in a subsequent series[2].
Full hardware support without using SCMI could be added, too, if anyone
would care about that use case.

For testing, I have pushed this series plus additional work to[3].

Thanks for your comments!

[1] "[PATCH/RFC 00/14] R-Car X5H Ironhide SCMI CPG/MDLC remapping"
    https://lore.kernel.org/cover.1776793163.git.geert+renesas@glider.be
[2] "[PATCH v2 00/10] R-Car X5H Ironhide CPG/MDLC SCMI remapping support"
    https://lore.kernel.org/cover.1783505329.git.geert+renesas@glider.be
[3] topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v2 branch of
    https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git

Geert Uytterhoeven (6):
  dt-bindings: clock: Document Renesas R-Car X5H Clock Pulse Generator
  dt-bindings: power: Document Renesas R-Car X5H Module Controller
  clk: renesas: Add R-Car X5H CPG driver
  pmdomain: renesas: Add R-Car X5H MDLC driver
  arm64: dts: renesas: r8a78000: Add CPG node
  arm64: dts: renesas: r8a78000: Add MDLC nodes

 .../bindings/clock/renesas,r8a78000-cpg.yaml  |  55 +++
 .../bindings/power/renesas,r8a78000-mdlc.yaml |  61 ++++
 arch/arm64/boot/dts/renesas/r8a78000.dtsi     | 300 ++++++++++++++--
 drivers/clk/renesas/Kconfig                   |   4 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r8a78000-cpg.c            | 216 ++++++++++++
 drivers/pmdomain/renesas/Kconfig              |   4 +
 drivers/pmdomain/renesas/Makefile             |   1 +
 drivers/pmdomain/renesas/r8a78000-mdlc.c      | 329 ++++++++++++++++++
 drivers/soc/renesas/Kconfig                   |   1 +
 .../dt-bindings/clock/renesas,r8a78000-cpg.h  |  14 +
 .../dt-bindings/power/renesas,r8a78000-mdlc.h |  15 +
 12 files changed, 976 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
 create mode 100644 Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml
 create mode 100644 drivers/clk/renesas/r8a78000-cpg.c
 create mode 100644 drivers/pmdomain/renesas/r8a78000-mdlc.c
 create mode 100644 include/dt-bindings/clock/renesas,r8a78000-cpg.h
 create mode 100644 include/dt-bindings/power/renesas,r8a78000-mdlc.h

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

