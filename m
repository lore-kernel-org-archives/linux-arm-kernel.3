Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D225DC61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 08:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k388DoNqDIgdld01dlsQvG3KwwDwUBDweu9hbM94/GM=; b=vXgahPGevJ98vsb2KIYyutLS9Z
	mL1SRT+FZNNi82Ej0NP5uXVuN/QN8SOZYyoM3EOqDxku1Y96OrSW8dv3e2ocYBFqs3XQuySWX9x6/
	eBRvNQk8W+KDcd5XNicNzxae8dJCyOTuAM4XSMAVZYkKOefVt7ltsu4Pqie2RdqqYbADRGHB4VIaE
	PmeuvGSr1V9O8bY5+dGPJjVyNiCCnpNXpPAaK9GkpCaJw5udDDLRUZS6k26LcCOrMx1+Br3bBW5qj
	QSX6PWYlGcq1MITI8ZZNRow43mYglnwdssglIsWavWAVMeIuW9Zf83YmbMznVgOdjUbMb5482szWV
	PsmbkP3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8nZ-000000024KQ-0aFL;
	Wed, 26 Aug 2026 08:15:53 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8nW-000000024JJ-0egP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 08:15:51 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso1131307a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 01:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787732148; x=1788336948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k388DoNqDIgdld01dlsQvG3KwwDwUBDweu9hbM94/GM=;
        b=gIqzf/KTtgTsmCTNIcvI0yppo0GCWl2aWtwGFCivWt4RfCNjh5lxr2wKfiyI48XqF+
         r1Z4QPr4Xe7aVSjGus+xXqskyU4DMuXO2cFSxLuXIX6w4z+XoiNP0KuTwC+2osuNbVxk
         +Y1MqRD08dp6unvhcnd0gvTdbBFEQkfun4VBJer39imdnXgWBGn9J0cxdnvKNfLt2N0h
         EBgtRpGUChukJybTRfldYHCL4E8sKASd+cZaTwoD8yRrBRRhOtk6qIEwW7Xuw4flsqyL
         KGEpqZarO3pL4ArgBwzTSt26Z44UDFqwUl3jln6vdLBLmfvAwzQ6+AsTmnCx1iofjONN
         OzuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787732148; x=1788336948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k388DoNqDIgdld01dlsQvG3KwwDwUBDweu9hbM94/GM=;
        b=q6K4in/uUe6jJtKtUjskOZhFgwOM/SiC/HzBYMqtq+rjYpLPVnKElPGMMZ3yJHGH7S
         AVJfVtwea+krHL27OS3ldAK3jxymum1ijTnttEabORcgaAeBKYuc7de4rTbMU5Zqi1o1
         Rh4ENzAwUpsuF5gC9D4vG5YBSIdN0NvyynwfPNszdwy0QfNvuHhzXQ5CZ6qQT37wit7f
         ZmreaiN6IfYuecJqUIS5eqEPnisWr1AfgJliYUTc0NPV5Hw5FwE1gIlofdaVNZ7cz5+V
         HH1kxnqM9dhEs7uPOVwm3OE3LvdrNnRrZLkW15iNjAru4eHRzxw8QapDqd0V3I0L86Yj
         PzsA==
X-Forwarded-Encrypted: i=1; AHgh+RpBTtVHZGWH9tbo6khQJFUsQIEzGO53HPhQ5jMI+l4AF/8hbzU1AgHicILKe5rBGK6ZtRMjwTwYN5Zk6gV6i2MC@lists.infradead.org
X-Gm-Message-State: AFuF++liyhrtWngzlPZPvyNFOstUaHz+o2vbeZFl8juDwAOlTWek5ieY
	OYRWZpLrtFPNIAm1uUZcP9G+buJp2sa4P4lGsEtZcc3D57d9Hbectm4tsSCKrTmT
X-Gm-Gg: AR+sD13vNV5r7snaE/qj8XMUbWxNTAiJjxWURhsHV/9duuDW3bxl0kBkqE4FTIdKpIi
	E8L1VKtQ3tMuJRXJ2k+oWSvz0KWReh7b1F56YaKKGsElUqOYews+Z+qhCVEuUdl4QITzdFGYrjx
	0UG9aPtTozpxAIgS5CcqS3Dyxv6HH7RqszVRBGAISIyb5E9g4VHxeG4rB9bTzJgx1v6P+zltOzj
	TJKaeCws2cd2e4aL0a01EpkzHNZe19UW23+sNPC9qXwRx7rzhQW1YGbwUCHMVWGUmmBhJSzkKvK
	0+CJCG+R2AaTabNojkF7Ug63AkSA1fcJF2zyluDFkIRZgKar4QuCbtjesh1/NkQ+rNDL/BnpIT3
	XJP1jEFEgzGjDsXjGmJg484RvB4YijB7twbkweUTLMDE9lLsYXp/8yBGxijCSy2L+zy+Uwfn45k
	2PVgoZFxzxewRVhOpdx+l4MUiDa1l5TcpgzhCxFVZaapCnuIVslde4SbeCGa6OrFrrbKVSn+Y7S
	9cXe77e6FzjikUivQD5mcU=
X-Received: by 2002:a17:907:1b23:b0:c16:4df6:176b with SMTP id a640c23a62f3a-c250c6751bamr485985966b.20.1787732147406;
        Wed, 26 Aug 2026 01:15:47 -0700 (PDT)
Received: from GLaDOS.station ([91.80.77.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ab65sm360997566b.37.2026.08.26.01.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:15:46 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: [PATCH v5 0/3] Add support for Variscite VAR-SOM-MX7 and MX7CustomBoard
Date: Wed, 26 Aug 2026 10:15:34 +0200
Message-ID: <cover.1787674237.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_011550_224957_09FE98D6 
X-CRM114-Status: GOOD (  13.37  )
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

This patch series adds support for the Variscite VAR-SOM-MX7 system on
module and the MX7CustomBoard carrier board.

The series includes:

- DT bindings for the supported VAR-SOM-MX7 board configurations
- VAR-SOM-MX7 device tree support, including V1 and V2 hardware revisions
- MX7CustomBoard carrier board support
- eMMC and NAND storage variants
- optional WM8731 audio codec support

The implementation follows the standard SOM + carrier board pattern,
where the common SOM dtsi contains the on-module peripherals and
hardware revision differences, while the MX7CustomBoard dtsi contains
the carrier-specific interfaces.

The final board device trees combine the supported VAR-SOM-MX7
configurations with the MX7CustomBoard carrier board.

v4->v5:
 - Removed wrong gpio-hog

v3->v4:
 - Fixed non-generic names and wrong separators
 - Fixed ads7846_ts pendown gpio

v2->v3:
 - Removed wrong header in dtsi
 - Fixed pinctrl name
 - Fixed sai clocks

v1->v2:
 - Fixed commit messages and spacing
 - Moved ethphy1 reset pin mux
 - Fixed irq types
 - Removed duplicate assigned-clock-rates property
 - fixed wifi child node name
 - Added color property in gpio led definition
 - Updated deprecated reset-gpio property
 - Added disable-over-current property in usb nodes
 - Fixed model names

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
  ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
  ARM: dts: imx7d: add Variscite MX7CustomBoard support

 .../devicetree/bindings/arm/fsl.yaml          |  17 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   6 +
 .../imx/imx7d-var-som-emmc-mx7customboard.dts |  22 +
 ...x7d-var-som-emmc-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi  |  90 +++
 .../nxp/imx/imx7d-var-som-mx7customboard.dtsi | 382 +++++++++++
 .../imx/imx7d-var-som-nand-mx7customboard.dts |  22 +
 ...x7d-var-som-nand-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-nand.dtsi  |  73 ++
 .../imx7d-var-som-v2-emmc-mx7customboard.dts  |  23 +
 .../imx7d-var-som-v2-nand-mx7customboard.dts  |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-v2.dtsi    |  66 ++
 .../dts/nxp/imx/imx7d-var-som-wm8731.dtsi     |  65 ++
 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi  | 635 ++++++++++++++++++
 14 files changed, 1470 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi


base-commit: 9400c5b6aa357be2379c98ae86a207bc21dc7a48
-- 
2.47.3


