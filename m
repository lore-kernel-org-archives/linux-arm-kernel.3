Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E637E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RhtmpZ+ZLYSsrqpu6pU/Lyj2nnsgcpK7OCWx/PXTdug=; b=swQRoyCrDQmOjVq4yLbpPGSWXZ
	cSSNo8/gx6Gd1sfV2CSJVt5veh89oza9f6Ebl8CvmShjXoRIOUqsbuxfoFsYzWMm5Xgjmfrtt5Prp
	CDowTZLJ27wFZfsNBaOnowmMf+KqTuKdaLURd+6ZgnZaoiWNXOPx24W0Qk+RPzocmuw+KLLL5AVf0
	z4h8hy+w18E+6Tj1H6fZR/J+Jw3IYBiisZ8Gps5Vk3rmkp25qikDF0YIjZKnr5F/bFMr4NQlpJalX
	M5XQZUNA63V3CZpwim2ld4ZKEx1OrxvEbxxvwL9LslHLHTvccwfdAnKg107Lqzb/wt8xzpDycddL7
	oOLB5/kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPPr-00000008Y3s-0JGW;
	Sun, 22 Dec 2024 17:06:55 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPOe-00000008XnZ-1OSQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:05:41 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aae81f4fdc4so326103966b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887138; x=1735491938; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RhtmpZ+ZLYSsrqpu6pU/Lyj2nnsgcpK7OCWx/PXTdug=;
        b=qzdy1RGW0aI5SPjQF8BLWMxC7e9BdoOXtFt9P/QxcgQGa0X4tDIdYkYWKnXJhOU1Hu
         3TQaksqkUZTRv6hDgOlrT+qGVQ4SiGrY9WZLuHw9QHnvktepuPz6Nx92Qf5iBlt/084l
         O60PXUwTzP8ll70mx3ZBtTJuwg5aRYb2CXbAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887138; x=1735491938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RhtmpZ+ZLYSsrqpu6pU/Lyj2nnsgcpK7OCWx/PXTdug=;
        b=T4QDcfYr5B07SMa9GPZnpZ4FpBG71HrCnOeMuvmE1S20JY+60jb6j46rWFMRDRm6NK
         aQTtgf5sz3Sh96eLubID0L7ASjkIo9AEZUERYZrphjONJrptHRmQ2j9prLBGDCjdApAr
         5Oip9BpgJTZjsOm+h/9ulOwh9mVt8PaYLQ4aDNd4VLM1kAHo7N9u/0r3BO+QRO7aGZPj
         7Yr6ENzPWJooiW6UkXi072W7u4Cnlxcx7JCfCdqInxjRi2MmdwXw+gvGc7gXVeM0lVAS
         t3ary7Xtp+7dH9tK1eTdZgCEOJuIp4m74XEzzLimWXzbmJ5wRiEfF7b7ZgziUwhAcIkY
         ZYSw==
X-Forwarded-Encrypted: i=1; AJvYcCUOrz6UVSnA5OgK3yEaSZ1hJXAn0wb9YMlDfl2CV43IPuB8c7eoBKFS3bEEbxbSv25O+B287nKmwgB6wsUS1m1b@lists.infradead.org
X-Gm-Message-State: AOJu0YyYN7yrU+Q9G2QPEmT1Oa5asrdzgad9PPIYdhoIaMIrr0E6fVZq
	q026WmYYMCoMEXi5aNSBP1MpNDWnof0VMLaDzxHbTs38ux4grWkmYYnm2dZJ8Ro=
X-Gm-Gg: ASbGnctmchkaHX37+9xXgj1ROPX0aKL1j1x++2FZjr2NeeRluHPz737lFYIF94cFHSC
	Ji2Mwsk2VTGtDR1XUaQkVpVTPuJ5cbD0N86/ZtsHCtg5meQZwr8KJA5qPKfLhU5X3GMBMGPKduD
	euToMZkz3tXgdqIKKM1O4UyRwnp8BUjDEK7Ds0MiLHKAbdJNzl7Bk6oRVUClhav6d7nzUtr+PNj
	9GfMTaCvijZVfKoJFNP41KmA25pYh11Symvy2LE70FLgYw6mPG81xhgy4zsYeqqU2/U3M09gXn2
	oTbITwiHHtfGXXl0/DKnoZeRcPLa27wca9ddVwpcnOQ/xw==
X-Google-Smtp-Source: AGHT+IHvooGlO7jo5Rwpwn79hajX/ICZcskpjcUPejd9ekku1o6JfbpIJup3jevoKr3K6wJwFlFcgg==
X-Received: by 2002:a17:907:1819:b0:aae:8308:532c with SMTP id a640c23a62f3a-aae830854dcmr621726066b.59.1734887137954;
        Sun, 22 Dec 2024 09:05:37 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:05:37 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v6 00/18] Support spread spectrum clocking for i.MX8N PLLs
Date: Sun, 22 Dec 2024 18:04:15 +0100
Message-ID: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_090540_461286_2649D0C8 
X-CRM114-Status: GOOD (  17.11  )
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

The series adds support for spread spectrum clocking for i.MX8MN
PLLs (audio, video and DRAM). It has been tested for the video PLL on
a board using i.MX8MN.

The patches added in version 4, such as the dt-bindings and the driver
for anatop, were inspired by the extensive email exchange from version 3:
https://lore.kernel.org/imx/20241106090549.3684963-1-dario.binacchi@amarulasolutions.com/

The series added spectrum spread support for the imx8mn platform only,
but in case it was merged, confirming that the directives and suggestions
made by the maintainers were correctly understood and implemented, I will
extend this support to the imx8mm and imx8mp platforms as well.

Changes in v6:
- Merge patches:
  10/20 dt-bindings: clock: imx8mm: add binding definitions for anatop
  11/20 dt-bindings: clock: imx8mn: add binding definitions for anatop
  12/20 dt-bindings: clock: imx8mp: add binding definitions for anatop
  to
  05/20 dt-bindings: clock: imx8m-anatop: define clocks/clock-names
  now renamed
  05/18 dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
- Split the patch
  15/20 dt-bindings-clock-imx8m-clock-support-spread-spectru.patch
  into
  12/18 dt-bindings: clock: imx8m-clock: add PLLs
  16/18 dt-bindings: clock: imx8m-clock: support spread spectrum clocking

Changes in v5:
- Fix compilation errors.
- Separate driver code from dt-bindings

Changes in v4:
- Add dt-bindings for anatop
- Add anatop driver
- Drop fsl,ssc-clocks from spread spectrum dt-bindings

Changes in v3:
- Patches 1/8 has been added in version 3. The dt-bindings have
  been moved from fsl,imx8m-anatop.yaml to imx8m-clock.yaml. The
  anatop device (fsl,imx8m-anatop.yaml) is indeed more or less a
  syscon, so it represents a memory area accessible by ccm
  (imx8m-clock.yaml) to setup the PLLs.
- Patches {3,5}/8 have been added in version 3.
- Patches {4,6,8}/8 use ccm device node instead of the anatop one.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

Dario Binacchi (18):
  dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
  clk: imx8mm: rename video_pll1 to video_pll
  dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
  clk: imx8mp: rename video_pll1 to video_pll
  dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
  arm64: dts: imx8mm: add anatop clocks
  arm64: dts: imx8mn: add anatop clocks
  arm64: dts: imx8mp: add anatop clocks
  arm64: dts: imx8mq: add anatop clocks
  clk: imx: add hw API imx8m_anatop_get_clk_hw
  clk: imx: add support for i.MX8MN anatop clock driver
  dt-bindings: clock: imx8m-clock: add PLLs
  arm64: dts: imx8mm: add PLLs to clock controller module (ccm)
  arm64: dts: imx8mn: add PLLs to clock controller module (ccm)
  arm64: dts: imx8mp: add PLLs to clock controller module (ccm)
  dt-bindings: clock: imx8m-clock: support spread spectrum clocking
  clk: imx: pll14xx: support spread spectrum clock generation
  clk: imx8mn: support spread spectrum clock generation

 .../bindings/clock/fsl,imx8m-anatop.yaml      |  53 +++-
 .../bindings/clock/imx8m-clock.yaml           |  65 +++-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi     |  11 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi     |  11 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  11 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |   2 +
 drivers/clk/imx/Makefile                      |   2 +-
 drivers/clk/imx/clk-imx8mm.c                  | 102 +++----
 drivers/clk/imx/clk-imx8mn-anatop.c           | 283 ++++++++++++++++++
 drivers/clk/imx/clk-imx8mn.c                  | 188 ++++++------
 drivers/clk/imx/clk-imx8mp.c                  | 118 ++++----
 drivers/clk/imx/clk-pll14xx.c                 | 134 +++++++++
 drivers/clk/imx/clk.c                         |  28 ++
 drivers/clk/imx/clk.h                         |  23 ++
 include/dt-bindings/clock/imx8mm-clock.h      |  76 ++++-
 include/dt-bindings/clock/imx8mn-clock.h      |  64 ++++
 include/dt-bindings/clock/imx8mp-clock.h      |  80 ++++-
 17 files changed, 1017 insertions(+), 234 deletions(-)
 create mode 100644 drivers/clk/imx/clk-imx8mn-anatop.c

-- 
2.43.0


