Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B68C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 21:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mr2KWq+iCr6y86liqdQxNmWDl8WLsgTlIunbgj12/Cc=; b=SjAN2Es0UVxP/3W+ZlCdQLTXeb
	xz1UvEZ9Y+1megXBfOzWfiIYolIzA6Jd/kwbcvjgFku2zY+pIqYfeRjQNCxNtsn875eXSBAVtdF82
	hm81B4JDf7bIr84XAd2FhdPrbFTvRdmSxDFpiPyGdZ68L86iWh9MkldLkqkUhd+5QFXaXk+GH+jrP
	2Xxtm95QFn+Un7vc+1slyLOTf24uQevrc74qctlTzQAnFzk5LbszxiEXXXJV4v+VqBb3rgVsUZNPP
	wPUBSNgvbVFedlnMKbX8LcSLG4WK4ZeeF2EYJE5jcfvELnGwqCCw6ACUYZxa8KElTPlEz5NrgIrCu
	saQ3E45g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUBJp-00000006tFI-0ow5;
	Tue, 24 Jun 2025 21:36:41 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9Eo-00000006avE-1eCj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 19:23:24 +0000
X-CSE-ConnectionGUID: HNxtWYZFS3mEGe6CVO+Xvw==
X-CSE-MsgGUID: lEOIOdy8QFOaRWKO2t9hxw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Jun 2025 04:23:16 +0900
Received: from mulinux.example.org (unknown [10.26.240.23])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5DCF3400F738;
	Wed, 25 Jun 2025 04:23:08 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: SPL2 Bot <spl2-bot-eu@lm.renesas.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Nishanth Menon <nm@ti.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Eric Biggers <ebiggers@google.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 0/6] Add RSPI support for RZ/V2H
Date: Tue, 24 Jun 2025 20:22:58 +0100
Message-Id: <20250624192304.338979-1-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_122322_540926_8A31FC0F 
X-CRM114-Status: GOOD (  10.84  )
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

From: SPL2 Bot <spl2-bot-eu@lm.renesas.com>

Dear All,

This series adds support for the Renesas RZ/V2H RSPI IP.

Cheers,
Fab

Fabrizio Castro (6):
  clk: renesas: r9a09g057: Add entries for the RSPIs
  spi: dt-bindings: Document the RZ/V2H(P) RSPI
  spi: Add driver for the RZ/V2H(P) RSPI IP
  MAINTAINERS: Add entries for the RZ/V2H(P) RSPI
  arm64: defconfig: Enable the RZ/V2H(P) RSPI driver
  arm64: dts: renesas: r9a09g057: Add RSPI nodes

 .../bindings/spi/renesas,rzv2h-rspi.yaml      |  96 ++++
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |  63 +++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/clk/renesas/r9a09g057-cpg.c           |  24 +
 drivers/spi/Kconfig                           |   8 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-rzv2h-rspi.c                  | 469 ++++++++++++++++++
 8 files changed, 670 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
 create mode 100644 drivers/spi/spi-rzv2h-rspi.c

-- 
2.34.1


