Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA382EA4E24
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=28SruTXpG1HDH4JN+NfWxK7Zw9KiCq2Th/TaXI09k5k=; b=LIlR2huvGSyoLnfNqduNV0E7k7
	TQHnd7Xwb7gskkcXw1SpcPgtVbOhGgbYbZA9mt/Own4r6XBFy+qxqRb/sxIbjYINAu/A71JEINmwW
	jOf7hDqfWqSwB5ZzG7CNpO7F0ATKu4YmPt+kN2o7bJhADjVLW7CZOEyYPTZ2Q7s2FUyldCsMRU8cd
	9N+t2CNyeTtEUTTI1TPpywfpRg2G2P17odn+/C8fahJNoZvOB8nPOg0TY0c/eo9JKacaHPjsRyWtm
	1APhkvJUfl/k2HCk/wNvU6lzHBfB72w0Zv+U5QN9KlYfoAa9ofZBG2PPbLXLhPIzoJr8L67fFqXoa
	eiNycA1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5JW-0000000DNK9-3xGI;
	Mon, 02 Mar 2026 15:36:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5JV-0000000DNJM-2KYA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:36:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 80155600AE;
	Mon,  2 Mar 2026 15:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C753C2BC86;
	Mon,  2 Mar 2026 15:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772465764;
	bh=GwfYq0+TY5ANRavFRxvs9n8sWwS/ZEOhNTjVOS3rCpM=;
	h=From:To:Cc:Subject:Date:From;
	b=QO98pFpCvITBwuapY2ZRNtWBp5puOOg3BmSnLz6RcO7v7C/JuQiyKCVZqVE0oTEU5
	 e3nxrAN/Hbc0QzINb7QP6bnCEgBIr87S7Lpkm2Yi/B4uAjyRi22irijTr4wHlL3aL7
	 Mfl9Zk0BdFuYK3yIzvN+0UiOQJBrk1R86JTYO9fYjI3WVJqu7WbSLqX+Dk5hWtAc/h
	 0uQ4Y6NB1ALgwXd9RPXLkp7yHQq672qDjaceY29eRIXm6v7kBQ9qSO83vuNgmZ0qYb
	 3und91Gb+dPaJgpxQYwO1wN6eBnRrQOvVH6cShRvCsLfBMpXUpEggUTq13KNowzw+e
	 S7aw5dXVPIIVQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 117AE5FCAC; Mon, 02 Mar 2026 23:36:02 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: allwinner: sun55i-t527: avaota-a1: Add SPI NAND
Date: Mon,  2 Mar 2026 23:35:55 +0800
Message-ID: <20260302153559.3199783-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
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

Hi,

This is v2 of my Avaota A1 SPI NAND enablement series.

Changes since v1:
- DT bindings (Krzysztof)
  - Moved "allOf:" block after "required:" block
  - Dropped "type:" from child node in conditional block
- Collected tags
- Link to v1:
  https://lore.kernel.org/linux-sunxi/20260227175157.2339758-1-wens@kernel.org/

This series enables the SPI NAND found on the Avaota A1 in Quad SPI
mode. The SPI driver already supports Dual SPI and Quad SPI, but the
bindings need to be updated to allow it.

Patch 1 updates the binding to allow Dual SPI and Quad SPI on the newer
SoCs. It also allows describing no TX or no RX available.

Patch 2 adds another set of pins for spi0 on the A523 SoC family. This
set is used for the SPI NAND on the Avaota A1 board.

Patch 3 enables the SPI NAND found on the board. No partition layout
is provided at the moment.


Please have a look.


Thanks
ChenYu


Chen-Yu Tsai (3):
  spi: dt-bindings: sun6i: Allow Dual SPI and Quad SPI for newer SoCs
  arm64: dts: allwinner: sun55i-a523: Add pinmux for spi0 on PJ pins
  arm64: dts: allwinner: sun55i-t527: avaota-a1: Add SPI NAND

 .../bindings/spi/allwinner,sun6i-a31-spi.yaml | 29 ++++++++++++---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 35 +++++++++++++++++++
 .../dts/allwinner/sun55i-t527-avaota-a1.dts   | 15 ++++++++
 3 files changed, 74 insertions(+), 5 deletions(-)

-- 
2.47.3


