Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F855CD3430
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 14:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cYYAh5UCl+y7lrHPwfOHemfwVIweJ/p4wEN7zniKp1Q=; b=0kDo37IYoFvDSIhPqIuRd6iUM+
	0B4l5zi3JTXI3lsLtTvHCHFqhHosMf+86JncHIj3xMxiKwQQXArAMre9AsDXs3KHg4Z7Bfy1rq14B
	O+w9P6UgLltRvBRYLLlfxJQV93qdxF4OR+HhJd39n4/qXyt7pnnoLILbfgdRPi3ppFoM3G5mifEbh
	GY4r7/F/De5SWqN8myR463Qqs25VWnezyb3rzFhXmhCFFMAzn6x4MY04408776nzuQxTuL1bNM7cI
	59WGhiW2d3DCxRiuXhLRY3pm71Oi/z99a1R5C/1aKbDIichfdNoGzxa1/86657ZfjzhTeRz1pCGq0
	hvG/4RWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuYW-0000000DV3Y-08Su;
	Mon, 04 May 2026 14:45:56 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuYT-0000000DV2z-0nRg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 14:45:54 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g8Pb246f5z9scQ;
	Mon,  4 May 2026 16:45:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777905950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cYYAh5UCl+y7lrHPwfOHemfwVIweJ/p4wEN7zniKp1Q=;
	b=gZydUKKJeQfGWT6E9CrCKkxUPNhZ5FqAUCliv4alubwDoRcsAVANUD87jniG8URKQNfYdu
	NMfl1RujBt4iC5z3UHztTSczr18I8iTyYWDeczHJxPkeCuQfnZKMmN24V0W2RTsMRfu7or
	9JI2PlJCfsXs56AgO/mJYfQ2w/m13cVOqR0CCGJT40ckiwocIfPrQ4405dTFTM7oGDI4z3
	LKzw+njp/qJv81sDJu3qhT5D3FmXAeZP2rhM8yBZ4ieZQVywgXJmOdZlWqieiPCiGmxJjN
	ECx+QcdoPcLGFglOmzN6p4PmjvlZKV+D2eDRBMW0pFyqVXXjLQBepySDE/jaJA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=izKQTwOs;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777905948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cYYAh5UCl+y7lrHPwfOHemfwVIweJ/p4wEN7zniKp1Q=;
	b=izKQTwOsbrpz2J9+xHigUa6Prty6ca8Ao+2CBJi7050qGZTsCvZLza/h5mtv4BuiZUGS2z
	tMpNQe/QY7AUnEl0PbOGI2mRIYLxTsWwoUuvW6Zrty1nl+l9n++k7jD2w+icD4VVM3U77H
	3s8j8c7d3mbP62IusEYcDYk/xUx8fRztYLFngfs0rUrbcLwvaUGDqNYvaXl95KaKbOSIuc
	/Z7bAIzY0tEyBpQn+8t40Q9w1TeWIVnvIfPC0/pvNvNkwQ6nyMVDuRWHjGAYrhSn4sSYIR
	OnLbHDFFx31wQzzRI6HicuKOFpyRbCkjsdraTJEHZSVCZGQkGv+h4E4T5aqmng==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/7] arm64: dts: renesas: r8a779md: Add support for R-Car M3Le R8A779MD SoC and Geist board
Date: Mon,  4 May 2026 16:43:22 +0200
Message-ID: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: kpbj889koap7puwmoxoz8u9st4n53md5
X-MBO-RS-ID: ab31f21b33fd55f0820
X-Rspamd-Queue-Id: 4g8Pb246f5z9scQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_074553_391935_8072D552 
X-CRM114-Status: GOOD (  10.51  )
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

The DU part is currently removed until it can be tested.
VIN is also untested due to no remote hardware access.

Marek Vasut (5):
  dt-bindings: mmc: renesas,sdhi: Document R-Car M3Le support
  mmc: renesas_sdhi: add R-Car M3Le compatibility string
  dt-bindings: clock: cs2000-cp: document CS2500
  dt-bindings: soc: renesas: Document Renesas R-Car R8A779MD Geist
  soc: renesas: Identify Renesas R-Car R8A779MD M3Le SoC

Nguyen Tran (2):
  arm64: dts: renesas: r8a779md: Add Renesas R-Car R8A779MD M3Le DTs
  arm64: dts: renesas: r8a779md: Add support for R-Car M3Le R8A779MD
    Geist

 .../bindings/clock/cirrus,cs2000-cp.yaml      |  11 +-
 .../devicetree/bindings/mmc/renesas,sdhi.yaml |   1 +
 .../bindings/soc/renesas/renesas.yaml         |   6 +
 arch/arm64/boot/dts/renesas/Makefile          |   1 +
 .../arm64/boot/dts/renesas/r8a779md-geist.dts | 732 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779md.dtsi     |  59 ++
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |   1 +
 drivers/soc/renesas/renesas-soc.c             |   1 +
 8 files changed, 809 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779md-geist.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779md.dtsi

---
Cc: Brian Masney <bmasney@redhat.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org

-- 
2.53.0


