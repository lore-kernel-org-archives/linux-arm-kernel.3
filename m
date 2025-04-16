Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F010C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 22:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9JXFnXE0c8/0RK29X+C1ywRXFNCelbfb8m2mUSfjQ7M=; b=ZsMou/7usTQmIaPYKl5GVCQSDA
	RMgX9iUjbgAJDnUFH1oPwzzNMeFiVOXsHke5x34q6kr4+g8nMc5E5O2hYdM/kliJANz0Li2OFWWta
	kPPl5BhOou0JYT8NanMqmgzjKk3cluwnD3iEcSMGR1GFmWr4OQCZT3006D9PjhzN6CkWE2KD0n+U8
	HFSKgfBLoaYa9OUhNQBjd8f1lQ0Tj5vHoXhykzegrYi+vjAYrtEf0a4WsBKOoL/Y6vIMlnmKVapBM
	EWpCPDURr1RCQkPJ7Feo/ibtk9+9esokUkS945GsWkdZam2Agd7Ouxq4YhDgWibgiUWjAtmzLJFVT
	pIJKziDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5BbS-0000000B5Pc-0uYR;
	Wed, 16 Apr 2025 22:51:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5BZY-0000000B59V-10g5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 22:49:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4FCA1515;
	Wed, 16 Apr 2025 15:49:32 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53A7F3F66E;
	Wed, 16 Apr 2025 15:49:33 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 0/4] arm64: sunxi: h616: Enable Mali GPU
Date: Wed, 16 Apr 2025 23:48:35 +0100
Message-ID: <20250416224839.9840-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_154936_363590_98C6E52D 
X-CRM114-Status: GOOD (  21.31  )
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

version 2 is addressing the comments I got from the reviewers (many
thanks for that!). The list of power domains is now separated from the
per-SoC data, to avoid going over the list twice. Also the error path
takes care of removing already registered genpd objects.
Based on v6.15-rc1, changelog below.

==========================
The Allwinner H616/H618/H313/H700 SoCs contain a Mali G32 MP2 GPU. This
IP is from the Bifrost family and is already supported by the panfrost
driver, so enabling support for 3D graphics on this SoC is rather
straight-forward.
However Allwinner added some bits in the PRCM block, that control the
power domain for the GPU - on top of its power *supply*.

This series enables the Mali GPU on those SoCs, by first introducing a
power domain driver for that SoC (patch 1/4: DT binding, patch 2/4:
the actual driver). For the Mali GPU to work we literally need to flip a
single bit (the BSP does this in the bootloader), and this full featured
power domain driver is admittedly a bit over the top for that purpose.
However it seems to be the right thing to do architecturally, and while
at it I added the other power domains (for analogue, PLLs, and the
management core), even though we won't use them in Linux and they would
be always on.

The rest of the patches enable the Mali GPU on the DT side: patch 3/4 adds
the purely SoC specific DT nodes, for both the power domain and the Mali
GPU. The final patch 4/4 then enables the GPU on all existing H616-family
boards.

For this to reliably work, the Panfrost driver needs a tweak to fix the
order of clock and reset bring-up and tear-down[1], but this is
technically independent from this series.

Cheers,
Andre

[1] https://lore.kernel.org/linux-sunxi/20250403055210.54486-1-simons.philippe@gmail.com/

Changelog v1 .. v2:
- rebase on v6.15-rc1
- drop already applied Allwinner Mali DT binding patch
- add review tags
- move list of power domains into separate structs, use ARRAY_SIZE()
- remove already registered genpds in error path
- print correct power domain name in error path

Andre Przywara (4):
  dt-bindings: power: Add Allwinner H6/H616 PRCM PPU
  pmdomain: sunxi: add H6 PRCM PPU driver
  arm64: dts: allwinner: h616: Add Mali GPU node
  arm64: dts: allwinner: h616: enable Mali GPU for all boards

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
 .../sun50i-h700-anbernic-rg35xx-2024.dts      |   5 +
 drivers/pmdomain/sunxi/Kconfig                |  10 +
 drivers/pmdomain/sunxi/Makefile               |   1 +
 drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c   | 208 ++++++++++++++++++
 15 files changed, 329 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/allwinner,sun50i-h6-prcm-ppu.yaml
 create mode 100644 drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c

-- 
2.46.3


