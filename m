Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4481BC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 12:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kIm5zjYKMN6OFYzQuz3a5OKGZSsL3cGIU0/LJYInxwI=; b=3qwpgGTelFGMI/VMZJ0ehzFYZ6
	EEpKtoKcXwZW8GMG7hZ9KN3SO7EIFk0NCCtYHkyX7SJgVlkiFmJ6MgisdRezpHiUSGMkH6QNZCICs
	ZoSnbXZNZ2xIUuH/F6NFxmFyrSB/82vWRuTUEpBmnRcr4e8U4SzuK0pIF1G7qzvhhApIrWXrLhAgz
	Nwr/5+SuELbBjldXDRZljSBoiaC4DbXn9y1SyLym6i0nJJpKXktEKX5w5FBwFTFryGtsZPrRaHhbu
	ji4EBkB4V1C8XJ1ShBUyGj22ppgC/E5+y/A5I9ouBAFdE99QeHJUtHa8kaeejtK45sSxDDkZM5lZs
	vbLMFH9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKFgs-0000000D4oe-1mY4;
	Wed, 28 May 2025 12:15:26 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKFei-0000000D4Sj-0rNb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 12:13:13 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ad69e4f2100so662319066b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 05:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748434391; x=1749039191; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kIm5zjYKMN6OFYzQuz3a5OKGZSsL3cGIU0/LJYInxwI=;
        b=duvt6sI48jxtVvshS8H5EORYG/sMLCeBwhUcmuQv9ufaCk/iBv7daciIMtSCu+TIl2
         gxIpNZ1nUkwMpaH3S4/OtX+09JM3myOKiWv49XNDr2OtRxt860XnjSZzCSWDGG543WDF
         xy2oafBDyWQHrvV+cwSmmTlM4aC+wwyQsMeSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748434391; x=1749039191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIm5zjYKMN6OFYzQuz3a5OKGZSsL3cGIU0/LJYInxwI=;
        b=tjC9W26jNeDCJv0V77v0vTiEbuacbzeN249dHlFZPPOO4NaE3NEdmFJnal9MPsy0ZA
         NmciqGoxZBxVBvYRl+dRslo069XRi8WiRMBbbkinWV7vDl+gW0jBqST8DhvKsi+QJ8C4
         JTlW2zzelDFEJJU8TXHhTfXdyMIv3nM/nJYjjyz9yav/d7SmcHpjuYiLFaYcM4TIndaC
         dm928af+TzmvR7vXmUeJroRUujCg0KIlMm99tzR7xMFVSg6CquPmgWg8oSz/Dx0I2A8+
         VNF/kXhiJpypNvwJnf59RtvEwbTFVkuXIAWdCspAu6dLWc1wgEOgzYK+NU4zHCd5Fhtb
         2k+w==
X-Forwarded-Encrypted: i=1; AJvYcCWuR+xnmLosHb1p29P/mCDzUvqQNcR2vM2naLPNilwYCkoVZxQdgsDM4ptUt/hlMuu0hisXfKZiJM6+b6DpB+Db@lists.infradead.org
X-Gm-Message-State: AOJu0YxDz0P2HunS/aC31tCgxnffVH/b4I6T/K/eOOCYOPSx8auZDtD1
	PO4+8ckmybMesmu0SS427nWE0X9lIpTPn3bWEEj8yNVjfEf/DfyImNJ3xnsgo9UHx0I=
X-Gm-Gg: ASbGncvP2elUROIVkzr0DD8JYVZ+jbk3Okp4PHTkjNB8WrJ2VBFBiSgaIgqKnAhi1i1
	g+l+HhoU+vkYNNbT8otWmFVfUM6BrjqIzmZYPyX0op31XV7AAdDDosojOBlzoCRZWnRx0jl5xYV
	oadbJN9Gh57Z45nC7h9inQAmIzCkRbsVECkLxE6ODechE9vFj4VNvwPzVTXfieoheZhOZy1ryR8
	zqH4ysfs9DL51zqRhMmk17SOgrYebnm2i6QnNrT8w3DblH+8TU5r8wBTRX4sWywzx9IATBQvUu4
	eOgs7Y+3S5iQWUXmUjtGTthKxh3LBQILPqgxRkv0xYp3BHeSiLL6iKaRxdwm80fby7Ipxrwo2Ip
	u1tT94AYHVbmN
X-Google-Smtp-Source: AGHT+IETyf2GSBL4as/yohckfyx/K6gSToAZaD2CCVz7+dNiszWCRp1kQVLr9GgDovIvyA8Dl2hlzQ==
X-Received: by 2002:a17:907:608b:b0:ad8:91e4:a91c with SMTP id a640c23a62f3a-ad891e4ab51mr577513966b.29.1748434390436;
        Wed, 28 May 2025 05:13:10 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:5631:61bf:398a:c492])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a1b5b8afsm98523266b.170.2025.05.28.05.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:13:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Heiko Schocher <hs@denx.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] Support i.MX28 Amarula rmm board
Date: Wed, 28 May 2025 14:11:37 +0200
Message-ID: <20250528121306.1464830-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_051312_248283_49D8F2C8 
X-CRM114-Status: GOOD (  12.04  )
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

Dario Binacchi (4):
  dt-bindings: mfd: convert mxs-lradc bindings to json-schema
  ARM: dts: imx28: add pwm7 muxing options
  dt-bindings: arm: fsl: add i.MX28 Amarula rmm board
  ARM: dts: mxs: support i.MX28 Amarula rmm board

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 .../devicetree/bindings/mfd/mxs-lradc.txt     |  45 ---
 .../devicetree/bindings/mfd/mxs-lradc.yaml    | 106 ++++++
 arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
 .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 303 ++++++++++++++++++
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi          |  10 +
 6 files changed, 421 insertions(+), 45 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts

-- 
2.43.0

base-commit: 33f410b0eaf4ebc3272720b4a68943a73a59cb05
branch: imx28-amarula-rmm

