Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2C0606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 14:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bjpcx89/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=mbfVeWlSKjBTPDf3UW/JdVQOQzcMJMzpFsXl+aLUPY4=; b=bjpcx89/W9GGwSfEbf9Hbruemg
	y7DwAuYZUYhbnj432veFctrTfBXbnrRorLhekYgodi49utgt6gQYpBrec7mFfxXao1OCvYAW8U2DI
	7EkkKpulKq+AR2fI5WcVpLxKrEBtw4jy3aBclySzPJl4gnRT+2EJOssPSv8+lbnWDmPr5XZ8WG/NM
	HjPUGXTLTjcEUKEe9VsS4Pe5uirh6tKm1J8OC7SotNlzj9/rWWs6INgSX+561WrsC2PMrBm0rq/cP
	cjezjmePrH3Jz5FYXzUoDYBuxWMAIIkgI6FDW7D2goVKFCanZnUYcKRgHtaFURV7d/MkyRreNvmbO
	tCUnSmyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLM6r-00000002i8q-2AO9;
	Mon, 26 Oct 2026 14:55:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLM6q-00000002i8Z-03FL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 14:55:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 647C643821;
	Mon, 26 Oct 2026 14:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE16E1F01825;
	Mon, 26 Oct 2026 14:55:31 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 00/11] arm64: renesas: r8a78000: Add PWM support
Date: Mon, 26 Oct 2026 15:55:16 +0100
Message-ID: <cover.1793026273.git.geert+renesas@glider.be>
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
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

	Hi all,

This patch series enables PWM support for the Renesas R-Car X5H SoC, as
found on the Renesas Ironhide development board.  On this board, clocks,
power-domains, and resets must be accessed only through SCMI firmware.

Just like its GPIO counterpart[1], this series is a bit special, in that
several patches are not meant to be applied upstream yet:
  1. The first patch, targeting the PWM tree, documents support for the
     16-Bit Timer Pulse Unit (TPU) on R-Car X5H; no driver changes are
     needed,
  2. Patches 2-6, targeting the PWM tree too, document and add support
     for the PWM instances on R-Car X5H, after a few customary
     refactorings,
  3. Patch 7, targeting a shared DT bindings branch, adds PWM clock
     definitions,
  4. Patch 8, targeting renesas-devel, adds the various PWM device nodes
     to the R-Car X5H .dtsi file,
  5. The remaining patches are marked DNI, and depend on code or DTS
     that is not yet upstream.  More detail can be found in the
     individual patches.

PWM instances 0 to 5 and TPU channels 0 and 1 have been tested on
Ironhide using a set of blinkenlights and a logic analyzer.

Thanks for your comments!

[1] "[PATCH 0/7] arm64: renesas: r8a78000: Enable GPIO support"
    https://lore.kernel.org/cover.1792776697.git.geert+renesas@glider.be

Geert Uytterhoeven (10):
  dt-bindings: pwm: renesas,pwm-rcar: Add support for R-Car X5H
  pwm: rcar: Use FIELD_PREP() for PWMCR_CC0 access
  pwm: rcar: Add helper variable dev to rcar_pwm_probe()
  pwm: rcar: Parametrize cycle counter field size
  pwm: rcar: Add support for R-Car Gen5
  dt-bindings: clock: renesas,r8a78000-cpg: Add PWM clocks
  arm64: dts: renesas: r8a78000: Add PWM nodes
  [DNI] clk: renesas: r8a78000: Add PWM clocks
  [DNI] pmdomain: renesas: r8a78000: Add PWM support
  [DNI] arm64: dts: renesas: ironhide: Enable PWM

Khanh Le (1):
  dt-bindings: pwm: renesas,tpu-pwm: Add support for R-Car X5H

 .../bindings/pwm/renesas,pwm-rcar.yaml        |  61 +++++----
 .../bindings/pwm/renesas,tpu-pwm.yaml         |   1 +
 .../boot/dts/renesas/r8a78000-ironhide.dts    |  84 ++++++++++++
 arch/arm64/boot/dts/renesas/r8a78000.dtsi     | 121 ++++++++++++++++++
 drivers/clk/renesas/r8a78000-cpg.c            |   6 +
 drivers/pmdomain/renesas/r8a78000-mdlc.c      |   2 +
 drivers/pwm/pwm-rcar.c                        |  92 ++++++++-----
 .../dt-bindings/clock/renesas,r8a78000-cpg.h  |   3 +
 8 files changed, 312 insertions(+), 58 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

