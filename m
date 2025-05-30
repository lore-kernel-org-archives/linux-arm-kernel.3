Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F50C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 16:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=koRnW66k+022ggfFoSoQrqqTLl823zuv/376lcTR9I8=; b=MazrS+Sdjt6pjH2DqduceuFFT5
	Ktjq7g1kGfxc2BSb1txJPsErMPYOeaO6WLAJOmGqDreObyvVoZD9AdTCyOPcKAmfbvdAz+0HdhuIB
	txR4YLjpIlU3bWHudDTaailart1pZN2AsikkUPqpjnqZwaS+COjV4kBSAiy5PAb8wRTucoCB+rnYV
	7DGhEAmaPORQqtnm+gfM3pVZliQ4IDC1aHLGYMVv2swShBksifOjpgHLZd7PmlLQklan0nWBcFZgL
	2EtkxDitR5pfFLN1g7Q+inVpkbgxA5MOPpkaKEZuD1RwpwwvxylJ3SuSoBm3AfsAvPS9BVe34c4Qi
	pyOymAQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2J6-000000017O4-1MJu;
	Fri, 30 May 2025 16:10:08 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2Gx-000000016wn-0RnA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 16:07:56 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a3798794d3so1861499f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 09:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748621273; x=1749226073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=koRnW66k+022ggfFoSoQrqqTLl823zuv/376lcTR9I8=;
        b=aCBGihiA3j0a+Mvr0AuuA2/lQzlbmmyhq+QDzfIyAayGJLtcTX2U9Xk6sufuT6rxQN
         PuKKeBHN+6yJv/v7I/QDiqGoLjHXRBUZnvefKi88+128MMLUgdVh+6zJZJKtEAeczsAv
         jSVrI+XZsgS+okFyIFyHfLWu+bu09NKf7MEEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748621273; x=1749226073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=koRnW66k+022ggfFoSoQrqqTLl823zuv/376lcTR9I8=;
        b=PIqdmSP/KvWMkkv3NLy31JVI6NhEfLVtYIzUpXb9czqfFjFOwy3DpbTP7U8gSqkByD
         Y2QiqVB1zl0j9vyzjShEudAy/KiJkOA/Si8kfI+wFYRx8D0w4a8U6iE8MaC1OzJJap5Q
         TfiV2XsDE9BMV/rD0FYZ4b51rhVIkjMyX5i+DYbKxLs0b03Fp7MU/1U8kx+wlirI2hH/
         JrgFmkK/FCnMZILjJzBPW7vj+vd8Nvf2JSrJ3HucPmx4RekhI4CYrzO3cm1R9S2l3ad/
         7p+NwAuxV+Ya6cAA/sgIgawdOoAcLMr26wkgb6cdnlmg20Hv+ACR2dX/aq7oagWsNORT
         UUcw==
X-Forwarded-Encrypted: i=1; AJvYcCXmvzBAPRr9LS/GxeEBNzVz77/2bVmKeqmqBF/E+UAyUruvIchUHXWiVDu78POI20ggxuKGRy+iSqjWIkD8k7GY@lists.infradead.org
X-Gm-Message-State: AOJu0YzBb39ydzqIwU8muatXbA4h8XICq6OeMCfCKBYjYKJKQnJliviS
	aQye24SqPsTLFovj6B/qkkANrCq3X3yJSgKlS5eJl04Ji7pWlWL8j77vLooRic7AppA=
X-Gm-Gg: ASbGncsVAnbNvLaPMmhWGr2466l+LkI5xp3d00m6B8IqDx4RxZk5r9qjp9JQe/0EuMX
	zqNroEkKmihIxDHk3vtNbRIAww8TK6BdPo/LMFrxfjyeJQTUGCTeiL0kG0iRnsuM1C+38+MUMxN
	gwFo06GKkAXVXQ+VK0eAyDkRzf3x+dk44O7M5LAhalAAfUY5WzO8b28TsijaHgPYOesTh3pc2fg
	ohmF9f0AeJz5Nl9WYrnFcg1n1bPL6a7uviw2hgB5qo18OeT3RPQImMuWS05ZzjL2r8DFJQDsEJy
	Yde2WUsrkQiSfvN0HhKI9ZvqB0XsWDyEsd6fHlPS7/hzBLxDCsVGXZZUEGP/9O72aVIAP+BlVyq
	g1RPQLSzLy080aLHBlErkX3Qv/oFbZwZv/wJkSpVk
X-Google-Smtp-Source: AGHT+IEgCfDLZvTgBMKT8zzGqvGoHF8+fTV9cPyrjWspDgJx5+AgYctVuJO1cy1dC+MaM92LcBU+ZQ==
X-Received: by 2002:a05:6000:25c2:b0:3a4:f038:af87 with SMTP id ffacd0b85a97d-3a4f7a9d575mr3347648f8f.47.1748621272729;
        Fri, 30 May 2025 09:07:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dcc18a80sm9716365e9.38.2025.05.30.09.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:07:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Heiko Schocher <hs@denx.de>,
	=?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Marek Vasut <marex@denx.de>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/6] Support i.MX28 Amarula rmm board
Date: Fri, 30 May 2025 18:07:31 +0200
Message-ID: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_090755_160638_43F890E9 
X-CRM114-Status: GOOD (  14.12  )
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

The series adds support for i.MX28 Amarula rmm board.

The board includes the following resources:
 - 256 Mbytes NAND Flash
 - 128 Mbytes DRAM DDR2
 - CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC

Changes in v5:
- In mxs-lradc.txt:
  - Fix deacription formating
- In imx28-amarula-rmm.dts:
  - Drop #address-cells from gpmi node

Changes in v4:
- In mxs-lradc.txt:
  - Fix typo Low-Resoulution -> Low-Resolution'
  - Wrap lines at 80 char.
  - Drop '|' from the description
  - Describe what each interrupt is for.
  - Move touchscreen-wires constraint for imx28 to the top level
- In imx28-amarula-rmm.dts:
  - Drop label property (deprecated) under the leds sub-nodes.
  - Add microSD comment above the ssp0 node.
- Add patch 5/6 "ARM: mxs_defconfig: Cleanup mxs_defconfig"
- Add patch 6/6 "ARM: mxs_defconfig: select new drivers used by
  imx28-amarula-rmm"

Changes in v3:
- In imx28-amarula-rmm.dts:
  - Drop xceiver-supply property from can0 node.
  - Rearrange the order of specific nodes and properties
    alphabetically.

Changes in v2:
- In imx28-amarula-rmm.dts:
  - Replace '-' with '@' for the pinctrl sub-nodes.
  - Replace edt,edt-ft5x06 with edt,edt-ft5306.
  - Drop LCD reset hog pin.
  - Add correct #address-cells and #size-cells to gpmi node.
  - Replace edt-ft5x06@38 with touchscreen@38.
- Drop from commit messages all references to LCD display.
- Add patch [1/4] "dt-bindings: mfd: convert mxs-lradc bindings to
  json-schema".

Dario Binacchi (6):
  dt-bindings: mfd: convert mxs-lradc bindings to json-schema
  ARM: dts: imx28: add pwm7 muxing options
  dt-bindings: arm: fsl: add i.MX28 Amarula rmm board
  ARM: dts: mxs: support i.MX28 Amarula rmm board
  ARM: mxs_defconfig: Cleanup mxs_defconfig
  ARM: mxs_defconfig: select new drivers used by imx28-amarula-rmm

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 .../devicetree/bindings/mfd/mxs-lradc.txt     |  45 ---
 .../devicetree/bindings/mfd/mxs-lradc.yaml    | 134 ++++++++
 arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
 .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 300 ++++++++++++++++++
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi          |  10 +
 arch/arm/configs/mxs_defconfig                |  14 +-
 7 files changed, 449 insertions(+), 56 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts

-- 
2.43.0

base-commit: 6100186e509525510e2b38d790338fae3fa463f3
branch: imx28-amarula-rmm

