Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E3F606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z388LJsn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=XYm4E7ddPJtHvscJKwAMq1HRd8n6x2iQLhZvXJsJXDo=; b=Z388LJsn37fT8RtP2ckOL9+j1E
	kbQuFvVnW3X+xWxCRX4mn4t1A8YlG4P0++ZSBb/6caaJdS8NnaHS0gCJFxgvwyKEOrnCgPgGoGYhi
	gql7ntJybEHr34lF3BYfXrWS3N96fg8Is3QnPc7dXAR1SoQcxHhLiy9F4JzB5xWu/g0FPV69aVLuw
	XJsbv7ew+aOTiodj/hljMUwNCsdpveqkdbywVaZE8XcxWzAjREThGjTt6oz7Nic3w1b+ywlonUQ51
	k2/EWKHF2zpP4AZDychxBLYr5N1ddX3GKQHtfKxkuf12oA1MpTPHjapHPdG306/2KCcdQsqIGF+YF
	LE9a2bXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPud-00000009IA1-1cOc;
	Thu, 29 Oct 2026 13:11:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPub-00000009I99-3bL5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:11:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1AD39600DA;
	Thu, 29 Oct 2026 13:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297021F01825;
	Thu, 29 Oct 2026 13:11:16 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Biju Das <biju.das.au@gmail.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/9] arm64: renesas: r8a78000: Add PWM support
Date: Thu, 29 Oct 2026 14:11:01 +0100
Message-ID: <cover.1793278754.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

	Hi all,

This patch series adds CAN-FD support for the Renesas R-Car X5H SoC, as
found on the Renesas Ironhide development board.  On this board, clocks,
power-domains, and resets must be accessed only through SCMI firmware.

Just like its GPIO[1] and PWM[2] counterparts, this series is a bit
special, in that several patches are not meant to be applied upstream
yet:
  1. The first RFC patch documents support for CAN-FD on R-Car X5H,
  2. Patches 2-4, targeting the can tree, add driver support for CAN-FD
     on R-Car X5H,
  3. Patch 5, targeting a shared DT bindings branch, adds a CAN-FD clock
     definition,
  4. RFC patch 6 adds CAN-FD device nodes to the R-Car X5H .dtsi file,
  5. The remaining patches are marked DNI, and depend on code or DTS
     that is not yet upstream.  More detail can be found in the
     individual patches.

CAN-FD channels 1 to 6 and 12 to 15 have been tested on Ironhide using
canfdtest and an oscilloscope.

Thanks for your comments!

[1] "[PATCH 0/7] arm64: renesas: r8a78000: Enable GPIO support"
    https://lore.kernel.org/cover.1792776697.git.geert+renesas@glider.be
[2] "[PATCH 00/11] arm64: renesas: r8a78000: Add PWM support"
    https://lore.kernel.org/cover.1793026273.git.geert+renesas@glider.be

Geert Uytterhoeven (9):
  [RFC] dt-bindings: can: renesas,rcar-canfd: Document R-Car X5H support
  can: rcar_canfd: Add Runtime PM support
  can: rcar_canfd: Make clkp local
  can: rcar_canfd: Add support for R-Car Gen5
  dt-bindings: clock: renesas,r8a78000-cpg: Add CAN-FD clock
  [RFC] arm64: dts: renesas: r8a78000: Add CAN-FD nodes
  [DNI] clk: renesas: r8a78000: Add CAN-FD clocks
  [DNI] pmdomain: renesas: r8a78000: Add CAN-FD support
  [DNI] arm64: dts: renesas: ironhide: Enable CAN-FD

 .../bindings/net/can/renesas,rcar-canfd.yaml  |  84 +++++++
 .../boot/dts/renesas/r8a78000-ironhide.dts    | 117 ++++++++-
 arch/arm64/boot/dts/renesas/r8a78000.dtsi     | 235 ++++++++++++++++++
 drivers/clk/renesas/r8a78000-cpg.c            |   5 +
 drivers/net/can/rcar/rcar_canfd.c             |  43 +++-
 drivers/pmdomain/renesas/r8a78000-mdlc.c      |   2 +
 .../dt-bindings/clock/renesas,r8a78000-cpg.h  |   1 +
 7 files changed, 476 insertions(+), 11 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

