Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9746C5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 10:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bsJGs+Vv4xv0NTkahCsnPcqGEu26zOB4LbZtmuHMPn0=; b=cJ4DWGNjacU8HcGUxnL2RSZxkw
	+HxtrYrTLgfXLrA0m6usLx9MJEMfhcsABETlv/IR4MFHknD43H8thvJTpxF2/HEvaf5Pwow/S7F4t
	Y/hzJx4uFovifQrVhZ8Qk3s+HtSMz3L83URlG0+fqzZyA2EFdP9apELU/otkLYRKxQdpGIssoM8Ts
	9fzOP+e6r1qpHn7lfbxRKsPHfBcjSt+qhqB+uuNF6MskhNgdmD0KVketIE+iD+I8Jm+Imyxm6aMdS
	PW0cPDNhmjeMJVrYaf+NUUX3VjncgGXfwVP/DIrLXWcdIIdWUNyjvxzteoTbroDVjovv9RuApR1Rj
	HAXOiJeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyRt5-0000000GOZC-0ZdL;
	Mon, 24 Aug 2026 10:26:43 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyRt2-0000000GOYH-17Vw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 10:26:41 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6983d3dae7aso6967024a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 03:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787567198; x=1788171998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bsJGs+Vv4xv0NTkahCsnPcqGEu26zOB4LbZtmuHMPn0=;
        b=I5MjerAlhj0eyKcvTZ4xQAfTV1aRWB6tiDgLn/Z+ctvGc9JJ1FRyUBp2e4hX2X46DJ
         QLQknyCUrdS/VYG0NzT7no0XvlFjRdJ9FyKD5Z6CheTLJphMnu7yStfh8eGXRGSmBElR
         pujFmWLiCGWLEPlvTv1ckJrVe1FhhdVGdtHdtZwIeXmsHoKltxEJK9UjtUQjSr5hsVSf
         CGVknR9pD/0iM5yShkxlehCfw/y95GEm1Tt7iwTdvSYHcBw3GzVgzkqJUir9KUQ0BjzO
         eW7bF/LBDH631X2iER1FEnLHKyECidIeZ4VPvH90N1Glq4Ea6eNhoPYGRLWrS4qHj/lN
         YYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787567198; x=1788171998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsJGs+Vv4xv0NTkahCsnPcqGEu26zOB4LbZtmuHMPn0=;
        b=neb9LDf9JlYC3HXm7n/l1Y1T+XaBpozzMDacZ5YIjZIcEC/VTEdPgYz11kVTk4jc5Y
         lOeZ/I5v9dC2TdSny9sPplrVqjRMkM7/0bLC2axsD6OVKScVRVH/pEl2uD+gkLaGAI0u
         MfyJzLkuTHQU5fI8nHU7sllZIpwaUdN/btPcV/7hyE2O2tImeIMD5G1MOYnLxCcRnI8s
         6QGepCBowaPpoinX0QBl9xLC/RNaUXw27xtVHmOXBLKZSO28VpoKvEa6utrY7yNkNP/O
         fhZqRpq8K1fryNWJm9ytLhzmtHB4BBmXZEOuEpd1eOz+QxD1gy0bPTMPRATByhcM+oKU
         vFZA==
X-Forwarded-Encrypted: i=1; AHgh+RqQigR4I0/FbBe9qid9ICn5/VKhiCO/sQel6fdoSPGxxY1RF3HnlMkpr4UnyRkP011wUrN28aFaWkvlruv7pa1/@lists.infradead.org
X-Gm-Message-State: AFuF++kiaXDDaXvZcxjascDvMCeW+Y2ETPzQ14WO8GJD/C9lNevOvbcH
	XWQ/LN1sfjVRCijtU6MhDNyAAikGN9uricz/U2ZM5o2j4f0sbEpa8Xif
X-Gm-Gg: AR+sD1078zJNemMmeL95d9H7auLxbfANXIuL4LoipYK+NIdsHSB6aLwYk+LNpKMCo5U
	dr+KZ++5YSBxL1JOBLTibboRpnG6mJ/RY2UHdqJOjdvlGIoBkgvy2xkHJaw7bN1766t47wrkJBM
	A5DlIoMLib5fHjKShnJaTrbjODC3LhVNPuIGBCjHgvinJzSqQ/cCYqLZNl4RlwP3EehSYkIExQ2
	8Fg8bHqd40o3xVqQ7m3NMZFXr+dSJsQF6wCQ6nD/ormwaP3BmHuLHTxJCLPZ8nHJ/nGhVCD+rqp
	M05cfYRaJNK68c4N6bCcFp6scMsFdCIChSdXapIbG2LEt2PiirfMsrq8IbmUpcOGDORV2oVRfSJ
	460VnjbigTU2jw8iZ0aDaEzBf3iWq5Pfab2Oge9o7CHTYjOugIhhedPvGZu3tK8VHJ3snpDcM5t
	uqOZf6VVQcvrQtqCK8cK9JrQCC0orlGtjktf7qZuaGAiyviRAmmtXeZYkCDUt4bVKjn+C0T0TyL
	7GGK8K01iu0IvwZ4oU2lb0zfO4ERnQ=
X-Received: by 2002:a17:907:9610:b0:c12:3cbf:9f6d with SMTP id a640c23a62f3a-c246d582330mr2376009666b.1.1787567197725;
        Mon, 24 Aug 2026 03:26:37 -0700 (PDT)
Received: from GLaDOS.station ([109.55.72.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685c573sm1489234166b.51.2026.08.24.03.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 03:26:37 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	alexander.h@variscite.com,
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
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: [PATCH v2 0/3] Add support for Variscite VAR-SOM-MX7 and MX7CustomBoard
Date: Mon, 24 Aug 2026 12:26:27 +0200
Message-ID: <cover.1787566980.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_032640_326309_C0FA7DA0 
X-CRM114-Status: GOOD (  13.40  )
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

v1->v2:
 - Fixed commit messages and spacing
 - Moved ethphy1 reset pin mux
 - Fixed irq types
 - Removed duplicate assigned-clock-rates property
 - fixed wifi child node name
 - Added color property in gpio led definition
 - Updated deprecated reset-gpio propery
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
 .../boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi  |  99 +++
 .../nxp/imx/imx7d-var-som-mx7customboard.dtsi | 382 +++++++++++
 .../imx/imx7d-var-som-nand-mx7customboard.dts |  22 +
 ...x7d-var-som-nand-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-nand.dtsi  |  73 ++
 .../imx7d-var-som-v2-emmc-mx7customboard.dts  |  23 +
 .../imx7d-var-som-v2-nand-mx7customboard.dts  |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-v2.dtsi    |  66 ++
 .../dts/nxp/imx/imx7d-var-som-wm8731.dtsi     |  64 ++
 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi  | 637 ++++++++++++++++++
 14 files changed, 1480 insertions(+)
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


