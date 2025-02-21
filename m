Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544F7C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 01:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cIFs/7Q2Cb5aUjsM78JTQuixdznn0CfLnIGhrFZ/4J8=; b=Nc2TVkpfNgS4jnAsztHuh4xeWt
	HtPI0cjoWEvqrs2x+Pn3awy5AIfd1pkpslriO+Z9hnm3Paav2+oLy2/0u/8EgyrgM11JZvhbOOAOB
	GUNE1GuwoKbyZIJwVSxTBrQ90oMeSJnRVTEc7c34rfxbPDMPqFfpZLCn33YpbCTpIqswS5QfTciv6
	2OiTrxowoQcNDpbEPo9PAHxUOJtusdL4cn5nwGszgoFqpwc/Sp0SYuzH2WCwpFRk37sZUQRzXpxkW
	KmnDvvw4SOcUtA7kXhyMHWoalZZP+piYsARvsL2R/xIoiOQ4t83t8CMUpr+ToRbAob2fDzNMDrEn2
	YQ9Xfb+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlHQM-00000003bJf-0zUh;
	Fri, 21 Feb 2025 01:01:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlHOp-00000003avP-1a4F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 01:00:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 788BE1BA8;
	Thu, 20 Feb 2025 17:00:31 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15BA43F59E;
	Thu, 20 Feb 2025 17:00:10 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: [PATCH 0/5] arm64: sunxi: h616: Enable Mali GPU
Date: Fri, 21 Feb 2025 00:57:57 +0000
Message-ID: <20250221005802.11001-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_170015_501077_77A61F17 
X-CRM114-Status: GOOD (  22.39  )
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

The Allwinner H616/H618/H313/H700 SoCs contain a Mali G32 MP2 GPU. This
IP is from the Bifrost family and is already supported by the panfrost
driver, so enabling support for 3D graphics on this SoC is rather
straight-forward.
However Allwinner added some bits in the PRCM block, that control the
power domain for the GPU - on top of its power *supply*.

This series enables the Mali GPU on those SoCs, by first introducing a
power domain driver for that SoC (patch 1/5: DT binding, patch 2/5:
the actual driver). For the Mali GPU to work we literally need to flip a
single bit (the BSP does this in the bootloader), and this full featured
power domain driver is admittedly a bit over the top for that purpose.
However it seems to be the right thing to do architecturally, and while
at it I added the other power domains (for analogue, PLLs, and the
management core), even though we won't use them in Linux and they would
be always on. I have a simpler version of the driver which just covers
this single bit controlling the GPU, please let me know if you prefer
that.
Please also note that this supersedes an RFC patch I sent a year ago,
which included this power domain in the R-CCU driver:
https://lore.kernel.org/linux-sunxi/20240225160616.15001-1-andre.przywara@arm.com/T/#u

The rest of the patches enable the Mali GPU on the DT side: patch 3/5
adds the compatible string to the Mali DT binding, while patch 4/5 adds
the purely SoC specific DT nodes, for both the power domain and the Mali
GPU. The final patch 5/5 then enables the GPU on all existing H616-family
boards.

There seems to be an existing problem with powering up the GPU, after it
has been turned off by the kernel. Chances are this is a problem with the
proper power-up (or power-down) sequence, where clock gates, reset lines
and the power domain must be asserted in a specific order.
A workaround used so far downstream is to keep the power domain enabled,
by ignoring the power-off request. Observing any assumed "proper" sequence
is a bit more tricky, since there is no Allwinner specific glue driver
or anything, so things would need be changed in the generic panfrost
code, where they have the potential of breaking other Mali users.
I would be interested in hearing opinions about this.

Cheers,
Andre

Andre Przywara (5):
  dt-bindings: power: Add Allwinner H6/H616 PRCM PPU
  pmdomain: sunxi: add H6 PRCM PPU driver
  dt-bindings: gpu: mali-bifrost: Add Allwinner H616 compatible
  arm64: dts: allwinner: h616: Add Mali GPU node
  arm64: dts: allwinner: h616: enable Mali GPU for all boards

 .../bindings/gpu/arm,mali-bifrost.yaml        |   1 +
 .../power/allwinner,sun50i-h6-prcm-ppu.yaml   |  42 ++++
 .../dts/allwinner/sun50i-h313-tanix-tx1.dts   |   5 +
 .../sun50i-h616-bigtreetech-cb1.dtsi          |   5 +
 .../allwinner/sun50i-h616-orangepi-zero.dtsi  |   4 +
 .../allwinner/sun50i-h616-orangepi-zero2.dts  |   4 +
 .../dts/allwinner/sun50i-h616-x96-mate.dts    |   5 +
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  21 ++
 .../sun50i-h618-longan-module-3h.dtsi         |   5 +
 .../allwinner/sun50i-h618-orangepi-zero2w.dts |   5 +
 .../allwinner/sun50i-h618-orangepi-zero3.dts  |   4 +
 .../sun50i-h618-transpeed-8k618-t.dts         |   5 +
 .../sun50i-h618-yuzukihd-chameleon.dts        |   5 +
 .../sun50i-h700-anbernic-rg35xx-2024.dts      |   5 +
 drivers/pmdomain/sunxi/Kconfig                |  10 +
 drivers/pmdomain/sunxi/Makefile               |   1 +
 drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c   | 191 ++++++++++++++++++
 17 files changed, 318 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/allwinner,sun50i-h6-prcm-ppu.yaml
 create mode 100644 drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c

-- 
2.46.3


