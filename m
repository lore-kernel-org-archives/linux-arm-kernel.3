Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC2B9EA7197
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 19:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cp83c5BG9ViMtdfEgKoWZ8ShkaQqJKSJjfZOv6vUN3o=; b=OVjY0cdyJ6WMQDFtncFYJJR/uK
	NvggbamKyIDBhqpfK6u36eXzr3p/a4Yrrwlhgo3EELn3PmXbXCiVuTlJcrrRvOSSqu46oHv3zF5Dj
	CF6/zi/uwyJLE3D27F09D+H2TbckbQBRIeIg5AbpFXyUoXIG2fkC/E2rrBgaVytwXSssNkoFBTkDV
	PggWnI2aWy35CTldIzCirZshapXQQqfVh3wot9k8+2AwyysleOmEEBgfs66Y4y0VaL09NXIXN6xpM
	+qcyuBN97inOXAv3Eud7Mpox8UH0L/07JXUFRIxtoGApMTxjZ9KIa496sPtF4ofFBEXhfpvguEthM
	f4+bJvuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEXxi-000000062FD-3zpZ;
	Sun, 19 Apr 2026 19:37:46 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEXxf-000000062ER-3aeE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 19:37:45 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fzJmf1flBz9tsS;
	Sun, 19 Apr 2026 21:37:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776627458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Cp83c5BG9ViMtdfEgKoWZ8ShkaQqJKSJjfZOv6vUN3o=;
	b=v8VjAsMTkpzoEgpLAGLJka0n0hkuT+J4/aAih96YxvIhze7hRaT2bRHPGOrCKGXH7XfmHK
	3iNy+AY7iSdHHwSv/0DSjS2ZG9/5mNnkp9xlZyQlCl5bE1rHFXOi2xka+PdRQwBCrv/wrr
	aWzf3NXQrGFjMG4dbkcSRimV0KbPs/ekYqIP2PrdYEbMQ3NNCINQGHkJw3LxWdE135LMJe
	e4teUBvCZ9HkSTpvC+svz/3Kx565KNSOOX1hDc0A5Rw0qWp0SEfGhPFnMBPdZUuYQog0hy
	kPYWjQliwlWsZKjiNfys7duvYSsilQnOJ7Y7DbtPIIGs0i3mk84lE9SH4nIhTQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776627456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Cp83c5BG9ViMtdfEgKoWZ8ShkaQqJKSJjfZOv6vUN3o=;
	b=w7GRN8/2Wm3MAQ88k5My5vMrNKZQ2uwHq5wr52dUbj5Ozpm+IaYuqnG3BgrunF2eTfLPaQ
	y1wpGgo/Q7PQ0fqdgnw1LeWJuGySITl89u2NiCqS4eI9QjKarroA/3q8J1/TogsFRruFrE
	UDP3Yh0dqvWEjEZOYs0k9WILOpGpe9honc/LcCQ6Pt/MrnJlsvRG8pbYTanW1+CpzDk5pV
	IzgyvhVR/SQbCrgRe8QOIdL1iuSPynAJ56XvJQBOoilnmxzslzfRgGqXANeOV8OatvVqrf
	0HI4uCCHOkRsPsqhEFv13XXNBN3vcEC2xl1Qs2Jq71rIGDcR20T2jx0llnuSzQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/7] arm64: dts: renesas: r8a779md: Add support for R-Car M3Le R8A779MD SoC and Geist board
Date: Sun, 19 Apr 2026 21:35:31 +0200
Message-ID: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 5b7ad3aa5645162c028
X-MBO-RS-META: s1wnqocyhj9w55px7iozj8ixtw9k5sg4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_123744_106254_05AAD936 
X-CRM114-Status: GOOD (  12.39  )
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

Add support for the Renesas R-Car M3Le (R8A779MD) SoC, a register-compatible
variant of the R8A77965 (M3-N) with reduced set of peripherals. Add support
for the Geist board based on the Renesas R-Car R8A779MD (M3Le).

The DU part does probe, and to the best of my knowledge, should correctly
describe the hardware, but is otherwise untested due to no remote display
access. Note that the DU uses ports 0 and 2, which is unusual.

VIN is also untested due to no remote hardware access.

Marek Vasut (5):
  dt-bindings: display: renesas,du: Document Renesas R-Car R8A779MD M3Le
  drm/rcar-du: Add support for Renesas R-Car R8A779MD M3Le
  dt-bindings: clock: cs2000-cp: document CS2500
  dt-bindings: soc: renesas: Document Renesas R-Car R8A779MD Geist
  soc: renesas: Identify Renesas R-Car R8A779MD M3Le SoC

Nguyen Tran (2):
  arm64: dts: renesas: r8a779md: Add Renesas R-Car R8A779MD M3Le DTs
  arm64: dts: renesas: r8a779md: Add support for R-Car M3Le R8A779MD
    Geist

 .../bindings/clock/cirrus,cs2000-cp.yaml      |  10 +-
 .../bindings/display/renesas,du.yaml          |  70 ++
 .../bindings/soc/renesas/renesas.yaml         |   6 +
 arch/arm64/boot/dts/renesas/Makefile          |   3 +
 .../dts/renesas/geist-panel-aa104xd12.dtso    |  17 +
 .../arm64/boot/dts/renesas/r8a779md-geist.dts | 832 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779md.dtsi     |  48 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c |  25 +
 drivers/soc/renesas/renesas-soc.c             |   1 +
 9 files changed, 1009 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/geist-panel-aa104xd12.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779md-geist.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779md.dtsi

---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org

-- 
2.53.0


