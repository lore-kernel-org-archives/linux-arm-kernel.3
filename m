Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927F2CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 12:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mmZyGYBqeYFlZREWNFu8pM6/N1F9lt2tAAAu66yBT9o=; b=mAYwzCBMkUspH5ytEBywnCoGG6
	vKEoGytPx0Qg1tcnqgwlspJ8lIy3GQbLnv0hMXOAJwmLFElbCqsB11+5fH+ZIzwGt/Brxpkte3hh4
	YWbLl9uXBJR7SKoZemeZpd31s5SHGknbNzIYW+nhjdY4OYkTHjGgNNMaXbEhBpSPStQG11hnvpgu1
	8a4MNZEYW4SzWp1JVpSXRt040tzFQ1o1WRh3+qKRzDsQ2OyLGl+H+/vlfouKxkexhvv9sqX6xK5sP
	58790CU3qXwC684l2zsW58jW58kEaf4FWE3zo8JFp4TU6aK4f/gyRq7rxuWAl3cNDw+NTLp8FC9vY
	3A/3MHHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMmf-0000000Dx3c-46oU;
	Mon, 27 Oct 2025 12:57:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMmZ-0000000Dwz5-3yre
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 12:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=mmZyGYBqeYFlZREWNFu8pM6/N1F9lt2tAAAu66yBT9o=; b=mLRUs7HF8qxV0lJ3Jd+h7AOzqS
	zuTZxV8bOHPFsDHuqKlddFTipPpnxA32WoxxbLh0rvlyxjAwbqKD0KUXbDxshiTiIO2qUiOie/jU1
	LuWb6ZPSAqU9bNgBHaHCSuts/OEVUekinewy4ChEAk7a0ovh4eNhvPOhbf/sSIP8kfOdxnLV92SfV
	+SPVB26s0N/KyDiYpQg++erNVOzxhUkAsrpFO+lluShlTcWxBS7q5LAUKBxKZjLBpq55AfiE/Pqws
	zPKNoEOn/ZQLNmUMRVgTK/Ezjp5eZVijEWhju7AIAC7mK3wKSqwpnTfPklby3kPWb4yxDe0yHTPuQ
	PwZWO98g==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLul-0000000270P-14Xm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:01:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C3FF42B80;
	Mon, 27 Oct 2025 12:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2E6C4CEF1;
	Mon, 27 Oct 2025 12:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761569819;
	bh=jc28/M+RNzFr0Zbyp//cvE+46yBuDnf2OXIpuegk+vs=;
	h=From:To:Cc:Subject:Date:From;
	b=ZT4zYMCsCgCJWd9fI+KJCO2uu0gxjzCv+pZgMdoPtPMf5cR3GCV8+zN2STgSIPD3z
	 A5mucLn4z4Qd74SiZ1MydHMX+QXknZBCSkcoV+DLAjYSL1AYA+4G50ugM2sz00CjAw
	 v1M6ffWPotRBMZH9+NiNubGym6fPdUXEoNDkoCE+C+ytJT9ljyf6wRNMiZE+J8oT6+
	 sYuRxYI+9E4E8CPwxVtkCrIMH8fhG+XzIOcYeTDc17jwzLrTgU5ScbmXt1ck/psm+b
	 wjVEPu0IKGcIU+4FXxE1UJowNlO5sY+6a8bbEQJazcQNEPa6Yq/Gvl4RSvOCwBwsc3
	 Mz6eC0pGT5Byg==
Received: by wens.tw (Postfix, from userid 1000)
	id 6215D5FE2C; Mon, 27 Oct 2025 20:56:57 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/10] allwinner: a523: Enable I2S and SPDIF TX
Date: Mon, 27 Oct 2025 20:56:41 +0800
Message-ID: <20251027125655.793277-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_120131_625061_B66B9CE4 
X-CRM114-Status: GOOD (  15.90  )
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

Hi folks,

This is v2 of my Allwinner A523 family I2S and SPDIF enablement series.

Changes since v1:
- Collected tags
- Dropped clk patches that were merged
- Added patch for SPDIF pinmux settings that was missing in v1
- Dropped bogus change to DAI name in SPDIF driver
- Dropped clk rate message in SPDIF driver
- Switched my email to kernel.org one

This series enables the SPDIF and I2S hardware found on the Allwinner
A523/A527/T527 family SoCs. These SoCs have one SPDIF interface and
four I2S interfaces. All of them are capable of both playback and
capture, however the SPDIF driver only supports playback.

The series is organized by subsystem, so each maintainer can find the
patches they need to take.

Patch 1 adds SoC/hardware specific compatibles for the two DMA
controllers in the A523 SoC.

Patch 2 adds an SoC specific compatible for the I2S interface
controllers in the A523 SoC.

Patch 3 adds an SoC specific compatible for the SPDIF interface
controller in the A523 SoC.

Patch 4 adds driver support for the SPDIF interface.

Patch 5 adds devices nodes for the DMA controllers.

Patch 6 adds a devices node for the SPDIF interface controller.

Patch 7 adds device nodes for the I2S interface controllers.

Patch 8 adds one set of pinmux settings for I2S2.

Patch 9 adds pinmux settings for SPDIF.

Patch 10 is what I used to test the changes, and serves as an example
for how to use these new interfaces.


Patch 1 can go through the dmaengine tree, or I can take it through the
sunxi tree.

Patches 2 through 4 should go through the ASoC tree.

The rest, except the example, will go through the sunxi tree.


Please take a look.


Thanks
ChenYu


Chen-Yu Tsai (10):
  dt-bindings: dma: allwinner,sun50i-a64-dma: Add compatibles for A523
  ASoC: dt-bindings: allwinner,sun4i-a10-i2s: Add compatible for A523
  ASoC: dt-bindings: allwinner,sun4i-a10-spdif: Add compatible for A523
  ASoC: sun4i-spdif: Support SPDIF output on A523 family
  arm64: dts: allwinner: a523: Add DMA controller device nodes
  arm64: dts: allwinner: a523: Add device node for SPDIF block
  arm64: dts: allwinner: a523: Add device nodes for I2S controllers
  arm64: dts: allwinner: a523: Add I2S2 pins on PI pin group
  arm64: dts: allwinner: a523: Add SPDIF TX pin on PB and PI pins
  [EXAMPLE] arm64: dts: allwinner: a527-cubie-a5e: Enable I2S and SPDIF
    output

 .../dma/allwinner,sun50i-a64-dma.yaml         |   5 +-
 .../sound/allwinner,sun4i-a10-i2s.yaml        |   4 +-
 .../sound/allwinner,sun4i-a10-spdif.yaml      |  44 +++++-
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 149 ++++++++++++++++++
 .../dts/allwinner/sun55i-a527-cubie-a5e.dts   |  52 ++++++
 sound/soc/sunxi/sun4i-spdif.c                 |  26 ++-
 6 files changed, 270 insertions(+), 10 deletions(-)

-- 
2.47.3


