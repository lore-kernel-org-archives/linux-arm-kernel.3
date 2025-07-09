Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA38C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 19:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hONZ9IRzTB/PeOi1N20ynxJSL6Wcb92fl3YE+zVsRv4=; b=VHErm+EuulX/w6lyEgWXsty5pd
	i4lnx8tZeJs0i2quuh7ZB/S8+LzudqjRBCkTt5+9Nac2oU+sTs59K387OagNJSg3vXMXbS2YvqhEB
	PeRIJGsSTfmfbRuKlZ2Q3jVel6wspmPQU+zJOE+b4jVjzCL8enXyI4TJL2L14ihIDM4Iic+uN5Gyi
	TbmJtfsjG3pofTTGxTCqxThKJnjk2cVOxKZPflS5YnotDHhpUQpMSwMTs+NlT71TBc8Io9a3kTnlS
	vRpWd3Qb09WeaoFgr//Y+Mr2bWSkSa1cetZfcesaZyHMEL0FBdifQS3i0W9bM5IQTHZlSRFq1LEJ8
	NiG/rFSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZaFP-00000009ffr-35vW;
	Wed, 09 Jul 2025 19:14:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZX7D-00000009Di4-3KcZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 15:53:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 059F9A54831;
	Wed,  9 Jul 2025 15:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D22C4CEF6;
	Wed,  9 Jul 2025 15:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752076426;
	bh=RY67xBd5sUO3XFR2TQQgs/qjtaenGN5JeNcwWjGIERE=;
	h=From:To:Cc:Subject:Date:From;
	b=qV/UEic+NBgClUfBz1cfNkW0Vs8dXgLz1LNkXdAdMku5pyLmZGxLWDxrPuEWj9qQ5
	 G3wFAJZLcmoc6Uwi56kl1ecu/isZ4chLIGt97wnlb48XO2LYiQgAKafL41DgahbqlK
	 vJbXyfnbcEjQFOLnSsPLactoi2xC1dtwd5rytZwZdCXrsbr2xknxOb/AwBRMtyi/wu
	 5+/5DEdZg+rJQSehvL60c5UArOmtji26e0pGmSydFST+Bpbpc81AiyQfqkWSBNUT4a
	 XdCpZiZ9ZAzK6taLlnMriEeH1wbbFiZ/srkU0mUv2pd7zyrQ3gVcaRXf032XINajL/
	 KIKebC9QeAjMQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 2F5C85FCB4; Wed,  9 Jul 2025 23:53:44 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 0/4] allwinner: a523: Add power controllers
Date: Wed,  9 Jul 2025 23:53:39 +0800
Message-Id: <20250709155343.3765227-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_085347_912968_AC2BDB45 
X-CRM114-Status: GOOD (  15.99  )
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

This is v2 of my A523 power controllers series.

Changes since v1:
- Re-order compatible string entries
- Fix name of header file to match compatible string
- Link to v1:
  https://lore.kernel.org/all/20250627152918.2606728-1-wens@kernel.org/

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

 .../power/allwinner,sun20i-d1-ppu.yaml        |   4 +-
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  18 ++
 drivers/pmdomain/sunxi/Kconfig                |   8 +
 drivers/pmdomain/sunxi/Makefile               |   1 +
 drivers/pmdomain/sunxi/sun20i-ppu.c           |  17 ++
 drivers/pmdomain/sunxi/sun55i-pck600.c        | 225 ++++++++++++++++++
 .../power/allwinner,sun55i-a523-pck-600.h     |  15 ++
 .../power/allwinner,sun55i-a523-ppu.h         |  12 +
 8 files changed, 299 insertions(+), 1 deletion(-)
 create mode 100644 drivers/pmdomain/sunxi/sun55i-pck600.c
 create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-pck-600.h
 create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-ppu.h

-- 
2.39.5


