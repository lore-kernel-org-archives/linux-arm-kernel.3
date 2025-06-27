Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF239C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 16:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TiMVd2SjUu/LiFQyiiDpR3nm28z10xcosdE8cb/KZlU=; b=1dJeJ7qV4bM7APa9Siw9vXAgP+
	Zo/NeG6hWalW9uXVXpeKeM1JiRvvEtUzwpEJZsoin1bMCjkrncPRHzmo63Gxq47P0qagw8fap0fZT
	QB1EYrHfoA4PMbqxBi0eUWyeFVxkzGpQOsdNu9YZU5EvxBLlEUnM94GttSyKCd59j3Fg36cj/DRrw
	ZgWCxWqKMGYhjrF5j1Uei6BlqO39JW4o+imgpdcR7qCMucW7amE1p4ndvf3LlBVnZIXBAZuAWqMi/
	5pNZmckBGGz2ZvJFWoXq8PAdCtpBPaCguEiFhJxiJ6TPGAwoLthFJTWfckF4sHSPYZmYbiX0tJnGB
	ibSyV3qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBli-0000000FEQP-3nEn;
	Fri, 27 Jun 2025 16:17:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVB19-0000000F6di-0AoC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:29:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5B133A52FAA;
	Fri, 27 Jun 2025 15:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA54CC4CEF2;
	Fri, 27 Jun 2025 15:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751038169;
	bh=DLL0uv9BKZAXYGcaADgHmi1/DoHhNnMIhXQxNX93FQA=;
	h=From:To:Cc:Subject:Date:From;
	b=Bb027EaMRl72rIynik9ymtl6EoP6L6kbRgcXJT+28jIGaEwIsNgJXJm4DUDAV8p4b
	 tpsORQqbFZo+D0XmZLvvEnCjcHnMaqLTzgVEjRhETSixFoxgTjoxqwIm+2y7Dh0x8M
	 X5KLiwXZ1JDLrZ4+3ZRWmJViy8LLkcgUWyef+em4VHJXDsAxOTFrHqVA3Qz5z/1lAp
	 D8sd0rnlkmPjF7VNOVJAxCWypAnpvv21Va8epte42g5j8YrptOG3lYnTKEQsjNmfkx
	 SLpU52zKPd4iciVvE0+LS8Dq6a3IFvY/LVkW0Vc/ciiIhXsWf5Amf3P4/O94rqtF0x
	 cqe7WJRcLp1MA==
Received: by wens.tw (Postfix, from userid 1000)
	id 172185FD85; Fri, 27 Jun 2025 23:29:27 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 0/4] allwinner: a523: Add power controllers
Date: Fri, 27 Jun 2025 23:29:14 +0800
Message-Id: <20250627152918.2606728-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_082931_144432_587C5D64 
X-CRM114-Status: GOOD (  14.72  )
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

From: Chen-Yu Tsai <wens@csie.org>

Hi folks,

This series adds the power controllers found in the Allwinner A523
family of SoCs. There are two power controllers. One is the same type
as those found in the D1 SoC, just with a different number of valid
power domains. The second is (I assume) a unit based on ARM's PCK-600
power controller. Some of the registers and values match up, but there
are extra registers for delay controls in the PCK-600's reserved
register range.

Patch 1 adds new compatible string entries for both of these
controllers.

Patch 2 adds support for the A523 PPU to the existing D1 PPU driver.

Patch 3 adds a new driver of the PCK-600 unit in the A523 SoC.

Patch 4 adds device nodes for both of these controllers.


Please have a look. The power controllers are critical for enabling more
peripherals, such as display output, camera input, video codecs, the NPU,
and a second DWMAC-compatible ethernet interface.


Thanks
ChenYu


Chen-Yu Tsai (4):
  dt-bindings: power: Add A523 PPU and PCK600 power controllers
  pmdomain: sunxi: sun20i-ppu: add A523 support
  pmdomain: sunxi: add driver for Allwinner A523's PCK-600 power
    controller
  arm64: dts: allwinner: a523: Add power controller device nodes

 .../power/allwinner,sun20i-d1-ppu.yaml        |   2 +
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  18 ++
 drivers/pmdomain/sunxi/Kconfig                |   8 +
 drivers/pmdomain/sunxi/Makefile               |   1 +
 drivers/pmdomain/sunxi/sun20i-ppu.c           |  17 ++
 drivers/pmdomain/sunxi/sun55i-pck600.c        | 225 ++++++++++++++++++
 .../power/allwinner,sun55i-a523-pck600.h      |  15 ++
 .../power/allwinner,sun55i-a523-ppu.h         |  12 +
 8 files changed, 298 insertions(+)
 create mode 100644 drivers/pmdomain/sunxi/sun55i-pck600.c
 create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-pck600.h
 create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-ppu.h

-- 
2.39.5


