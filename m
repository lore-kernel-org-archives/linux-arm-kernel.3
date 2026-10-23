Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48100606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 17:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JyeXK/Qi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FOFI7yP3FEG3uscSb6Zxru+rlWqxhK9+E0KjenFAYd8=; b=JyeXK/QiUreXXZxxjJD7gxKbpi
	dAxJz1knxCm3ecbVsBbTC+4xsOlQFogfa6JvWDa4EXaSsae3pzsTUZOX2vnHYhwuM+ih9KUELH1Kv
	HzvWBsKnOQJ1oxseetAmEo2ANFEk6NzFoeYVQB5v1XvtNgbp+Mdot9Gh+GnYlnk3kxbNDFZ5M5ABU
	t8Eog454Ku3J2E1eiNGwfqAvNlJdUWI8zpHGqhhPyzktKoSfFIj18PabhC+IjNFNM2VlX294I6QJq
	nDSuvfGyEJG9BXKvLjB/AbhiYMVOLsnbBZ1vV11hhbPwyzIQu/3/Q12AdWo2b+Hx+/0vYS5GhEXJm
	Mwh6gzFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKJQk-0000000GkiM-3Ahq;
	Fri, 23 Oct 2026 17:51:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKJQi-0000000Gkgw-37rg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 17:51:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B9F2E60142;
	Fri, 23 Oct 2026 17:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7EB1F01825;
	Fri, 23 Oct 2026 17:51:09 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/7] arm64: renesas: r8a78000: Enable GPIO support
Date: Fri, 23 Oct 2026 19:50:38 +0200
Message-ID: <cover.1792776697.git.geert+renesas@glider.be>
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

This patch series enables GPIO support for the Renesas R-Car X5H SoC, as
found on the Renesas Ironhide development board.  On this board, clocks,
power-domains, and resets must be accessed only through SCMI firmware.

The series is a bit special, in that most patches are not meant to be
applied upstream yet:
  1. The first patch, targeting the GPIO tree, restores the abily to use
     the R-Car GPIO driver on a system that does not have pin control
     support yet (pin control is not yet supported by SCMI on Ironhide),
  2. The second patch, targeting a shared DT bindings branch, adds GPIO
     clock definitions,
  3. The third patch, targeting renesas-devel, adds GPIO device nodes to
     the R-Car X5H .dtsi file,
  4. The remaining patches are marked RFC or DNI; the latter depend on
     code or DTS that is not yet upstream.  More detail can be found in
     the individual patches.

This has been tested on Ironhide using GP05_15..GP05_20 (exposed on the
PWM connector), with and without SCMI.

Thanks for your comments!

Geert Uytterhoeven (6):
  gpio: rcar: Convert to gpiochip_generic_{request,free}()
  dt-bindings: clock: renesas,r8a78000-cpg: Add GPIO clocks
  [DNI] clk: renesas: r8a78000: Add GPIO clocks
  [RFC] pmdomain: renesas: r8a78000: Add default GPIO support
  [DNI] pmdomain: renesas: r8a78000: Add SCMI GPIO support
  [DNI] arm64: dts: renesas: r8a78000: Add gpio-ranges

Marek Vasut (1):
  arm64: dts: renesas: r8a78000: Add GPIO controller nodes

 arch/arm64/boot/dts/renesas/r8a78000.dtsi     | 166 ++++++++++++++++++
 drivers/clk/renesas/r8a78000-cpg.c            |  12 ++
 drivers/gpio/gpio-rcar.c                      |   5 +-
 drivers/pmdomain/renesas/r8a78000-mdlc.c      |  50 ++++++
 .../dt-bindings/clock/renesas,r8a78000-cpg.h  |  16 ++
 5 files changed, 246 insertions(+), 3 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

