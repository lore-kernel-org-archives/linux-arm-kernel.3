Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78E8F54ADB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L2/pfv4KF5fcsz9XEb+CDC5IPVxCSc+DYZFK9IAQgQs=; b=EAuTicsZwpf+51/oMBjLfq6UcX
	4bY3sTwxGWS77LWhS8ndrqIhZaEyTiZXYMTF0M7oVmYN2h81122aQ4psH47ODPZSvn9awSZApx3P2
	yKK7OaYYVqnZUso9mw1SWXBn2f47nyAuEy+H9VOFck1vwmNgysl80Bxc8P7hZAUCg43YpnBUCyxQA
	e0r3t6zHwMPgzEDdNS+/br+jZNRGTvbFTw9tLvtn/7Q+YEwnJS/ijvZ/MwvyutBnh4ewJQm/l7zW4
	/IixQGb720qXo5uyasr2Dpmo2NzIVtLriMo/f/rsjWX4LYuWy/B6sPxUZNhNfJmgsWl2X59YtjVxj
	lFvb/cbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54ra-00000001uVZ-3JRR;
	Tue, 24 Mar 2026 16:44:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54rL-00000001uMj-2SfJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 16:44:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 109AC43DBB;
	Tue, 24 Mar 2026 16:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A73C2BC9E;
	Tue, 24 Mar 2026 16:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774370642;
	bh=I7i185xsG5HSY32fnLRfMXM0qgCfYCSPudPDeTb/fKA=;
	h=From:To:Cc:Subject:Date:From;
	b=dYta2nfmcNfL9xIoExJWOoUJuhCVz0l/xL1Wo/WM7Bh8ZCUs3f0srhFnQu13ruA5B
	 vopDRh/9tPHNbZ4DlF6tjRo+t1hH2ADyI2AxzB1AabAFTrmFRmvHllppvHlvG929wK
	 /2OZKFPDaM30R8FFw7LbZVydU4yXiutytlg8k4yJVTcjx3217KWA9wYbshsYjXFVAM
	 lKMxL0Lmn3KcM3uMZIGcS0fLH+tL4NSY3pJhlj0Nkkq1ORXpvY1hrX8t45xdub5Th+
	 eM2yta2pDJzmNSZVpv39/19DcSqaZbiShxzVbb7OzFNpUMqyrMcT7njPc03GpwQ8yj
	 Loi9CUaCJr5fg==
Received: by wens.tw (Postfix, from userid 1000)
	id 98AAA5FDD9; Wed, 25 Mar 2026 00:44:00 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] soc: sunxi: sram: Add H616 SRAM support
Date: Wed, 25 Mar 2026 00:43:48 +0800
Message-ID: <20260324164357.1607247-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_094403_674605_415E8F7D 
X-CRM114-Status: GOOD (  17.35  )
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

The Allwinner H616 has two switchable peripheral SRAM regions:

- The VE SRAM is a 2 MB dedicated SRAM for the Video Engine. CPU access
  to this region is enabled by default. CPU access can be disabled,
  after which reads will show the same stale value for all addresses,
  while writes are ignored.

  The mux value for this region is different from previous generations.

- The SRAM C region is an alias of the first 128 KB of VE SRAM, plus 64
  KB of DE SRAM. The latter is otherwise unaccessible from the CPU. When
  CPU access is disabled, the whole region reads as zero, while writes
  are ignored.

  The mux value for this region is the same as on the A64 and H6.

The driver needs to allow both the Video Engine and Display Engine to
claim the SRAM C region at the same time.

At the same time, since the Video Engine needs to claim both SRAM
regions, the Allwinner SRAM consumer interface needs to support claiming
multiple regions for one consumer.


Patch 1 adds a compatible for the new H616 VE SRAM to the common SRAM
binding.

Patch 2 adds a compatible for the new H616 VE SRAM to the Allwinner SRAM
binding.

Patch 3 is a minor cleanup that const-ifies the SRAM related hardware
description data in the driver.

Patch 4 implements support for multiple hardware block drivers to claim
the same SRAM region.

Patch 5 implements support for one consumer to claim multiple SRAM
regions.

Patch 6 adds support for the H616 VE SRAM region to the SRAM driver.

Patch 7 adds the SRAM regions to the H616 dtsi file. This was picked
from Jernej's tree and split into one patch for SRAM and one patch for
the video engine.


I think all the changes can go through the sunxi tree, unless the device
tree maintainers want to take the first patch separately?

The new users of this, support for the H616 video engine, will be sent
separately.


Thanks
ChenYu


Chen-Yu Tsai (6):
  dt-bindings: sram: Document Allwinner H616 VE SRAM
  dt-bindings: sram: sunxi-sram: Add H616 SRAM regions
  soc: sunxi: sram: Const-ify sunxi_sram_func data and references
  soc: sunxi: sram: Allow SRAM to be claimed multiple times
  soc: sunxi: sram: Support claiming multiple regions per device
  soc: sunxi: sram: Add H616 SRAM regions

Jernej Skrabec (1):
  arm64: dts: allwinner: sun50i-h616: Add SRAM nodes

 .../allwinner,sun4i-a10-system-control.yaml   |   5 +-
 .../devicetree/bindings/sram/sram.yaml        |   1 +
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  28 ++-
 drivers/soc/sunxi/sunxi_sram.c                | 196 +++++++++++-------
 4 files changed, 151 insertions(+), 79 deletions(-)

-- 
2.47.3


