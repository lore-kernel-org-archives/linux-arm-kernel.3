Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F06C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 16:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h6lG/AjsJH9S6BFCzOBiq+0c8U6DQuyEYF2+hQ6MY5k=; b=NCjQsRKbhdmhuPGb8l81YFS112
	O2FgPuyqzdg1moyeUzCZYwmP1wlQo/KtsN+vdFh84XRsTXSGWi8nmjvPTAXOFLbNc/sxHjCZuukth
	dqzHiiafUuYYLTCoD4D+aTk60xBGXEfpiv62N1e8Lr9Ckysuydo2y3m2oe5X2uHS6/GEaptqPJnwy
	uCjwut9tWFiZboYV8QrEK1a7D1PlT48KIJT5S7G2KRxmopg+DHKEngKDZVyt5ipa49Cl9gURFLPFs
	BYpMhl2lH/jnS036bCkChd3Lo3lOGfe5mQ+e5+dpoEUiVDUx2eRoQiBMrzqk1po0RseHo57VYz3E0
	WSc6GHWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXjHh-0000000Exkl-0pe8;
	Fri, 04 Jul 2025 16:29:09 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXj3d-0000000EvCS-0sc0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 16:14:38 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so186488766b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 09:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751645675; x=1752250475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h6lG/AjsJH9S6BFCzOBiq+0c8U6DQuyEYF2+hQ6MY5k=;
        b=JMyywiE4GZu9aDjXrfLrpFSoD12k+BHRHmQ0Wo/kPca8i2E9Kx5Ik9F15EBRu1fFLm
         Z6to1w8R32xYWWcE2Xfz13SpYQeZd2S4taH3z/2KIMPlxlivPZtsfDtn9cP5UUjEg5nK
         Xun/1rkOdLpBuSXOJsK3/LVXAhIA5gP0INmInDJhuyght2cyF7wVydOldbdkrInE6cp6
         dnJiLSTJZsUBcp6gZdtXOve7+1O5scy6W7uwE0gWRwad9d2xeBWAeIahYfVWPIZG4XIb
         6xVwYEz2tqn2I53uzFIAWnZ+rRdOmPa3MwidPbWUPEuhg+IUKYAj6lYJHw43rVWBoc9u
         omxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751645675; x=1752250475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h6lG/AjsJH9S6BFCzOBiq+0c8U6DQuyEYF2+hQ6MY5k=;
        b=rvnXUfmAo3m4vq1pv8bmEEJ3rqd3NfbN1j2idr9uwAsaeoA4q8mLTIUKHK5o54fSHw
         qOpOvhbXyhwAtfVDI4LZTWVradwCMcoZuSIQ12zGyjoVU6trmkY/JnmgFRMVkoj/wX8P
         5qa4pFfZdDkJRCKBSMy24UVbOaaXygED6ZrsZGr2fWMWPUgM0+a6SWP/wKnAsJmV6CMz
         eJVIB7W2ZKBwnPC8LEf+DCJH2ZABelGV1zYN5NHycqCr0YuGFOLAWTDGwKhsLcanM4LM
         gt2Knr4oxgfrZqKCqMlbD9/jXpiG1Ex55m5VXfMKj4il++pjks+heOXmC4UCsqxR0gWf
         ZoeQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4/GnvvnBIezm1tGwMbAjIx0XAodu9T72FGGSWAE+kQZFpYTQ/3sAP9ZswaAM/yReJ2Z6g8Jut0hX78BAzn4u6@lists.infradead.org
X-Gm-Message-State: AOJu0YzEBOpGkIlYoaWhmIXn/tHT/a/rYrGUxWLrPHv1BhHIY3sqhA5M
	ZYpi3w6lpL00907e15Hi+svqIaiJLvLxVCsPtB72bgdavY+PQaX3uIivmti9A0my6/M=
X-Gm-Gg: ASbGncs3gloSwNHzyLUlpaLI/Mb7avgAi3453V8qRMOS84gQUv45nQ+gNchqVcSellb
	dGPz8GskyGamDfN2gYawuD7VG/zybhPMk4Ivq6Zmz3dp11miUJROatl1nLkp3RMfbZdQZomjzbN
	qTDo9wTLpjtfz+zD5wAzgQy8yBYeF7s/8boxMSUu3RQhBmW5p384ZI5cuFt8y/QYRB7zh610S9+
	zBed9Xp3soSSi1EgwZL6IvtUEISfkJVryF5KVU7YsJCqVRLh5/Dxu6BY9LYUsrbr7StAUO4sZMX
	8czWZa/5tiQTQoWoUtrYSaeC2dQBWL5DvUgsAWDZeaR09ekKJOlaVXT64q3acgk6B7UkmJ7zWVY
	R/lak5Q2V3khj95U=
X-Google-Smtp-Source: AGHT+IEb528uiNOCOvEavhvPClvCp90Qlmh60cyGaa2Bd5e1NI48LJ+veXRwIR+jYzpAkq2kId7/kw==
X-Received: by 2002:a17:907:9308:b0:ae3:b371:e7d3 with SMTP id a640c23a62f3a-ae3fe69333emr265030866b.22.1751645675327;
        Fri, 04 Jul 2025 09:14:35 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d9215sm194703766b.2.2025.07.04.09.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:14:34 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	lizhi.hou@amd.com
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 0/9] PCI: rzg3s-host: Add PCIe driver for Renesas RZ/G3S SoC
Date: Fri,  4 Jul 2025 19:14:00 +0300
Message-ID: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_091437_251497_B9B08D45 
X-CRM114-Status: GOOD (  17.43  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds a PCIe driver for the Renesas RZ/G3S SoC.
It is split as follows:
- patch 1/9:		updates the max register offset for RZ/G3S SYSC;
			this is necessary as the PCIe need to setup the
			SYSC for proper functioning
- patch 2/9:		adds clocks and resets support for the PCIe IP
- patch 3/9:		fix the legacy interrupt request failure
- patches 4-5/9:	add PCIe support for the RZ/G3S SoC
- patches 6-9/9:	add device tree support and defconfig flag

Please provide your feedback.

Merge strategy, if any:
- patches 1-2,6-9/9 can go through the Renesas tree
- patches 3-5/9 can go through the PCI tree

Thank you,
Claudiu Beznea

Changes in v3:
- added patch "PCI: of_property: Restore the arguments of the next level parent"
  to fix the legacy interrupt request
- addressed review comments
- per-patch changes are described in each individual patch

Changes in v2:
- dropped "of/irq: Export of_irq_count()" as it is not needed anymore
  in this version
- added "arm64: dts: renesas: rzg3s-smarc-som: Update dma-ranges for PCIe"
  to reflect the board specific memory constraints
- addressed review comments
- updated patch "soc: renesas: rz-sysc: Add syscon/regmap support"
- per-patch changes are described in each individual patch


Claudiu Beznea (8):
  clk: renesas: r9a08g045: Add clocks and resets support for PCIe
  PCI: of_property: Restore the arguments of the next level parent
  dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add documentation for the
    PCIe IP on Renesas RZ/G3S
  PCI: rzg3s-host: Add Initial PCIe Host Driver for Renesas RZ/G3S SoC
  arm64: dts: renesas: r9a08g045s33: Add PCIe node
  arm64: dts: renesas: rzg3s-smarc-som: Update dma-ranges for PCIe
  arm64: dts: renesas: rzg3s-smarc: Enable PCIe
  arm64: defconfig: Enable PCIe for the Renesas RZ/G3S SoC

John Madieu (1):
  soc: renesas: rz-sysc: Add syscon/regmap support

 .../pci/renesas,r9a08g045s33-pcie.yaml        |  202 ++
 MAINTAINERS                                   |    8 +
 arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi |   60 +
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |    5 +
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  |   11 +
 arch/arm64/configs/defconfig                  |    1 +
 drivers/clk/renesas/r9a08g045-cpg.c           |   19 +
 drivers/pci/controller/Kconfig                |    7 +
 drivers/pci/controller/Makefile               |    1 +
 drivers/pci/controller/pcie-rzg3s-host.c      | 1715 +++++++++++++++++
 drivers/pci/of_property.c                     |    8 +
 drivers/soc/renesas/Kconfig                   |    1 +
 drivers/soc/renesas/r9a08g045-sysc.c          |   10 +
 drivers/soc/renesas/r9a09g047-sys.c           |   10 +
 drivers/soc/renesas/r9a09g057-sys.c           |   10 +
 drivers/soc/renesas/rz-sysc.c                 |   17 +-
 drivers/soc/renesas/rz-sysc.h                 |    3 +
 17 files changed, 2087 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
 create mode 100644 drivers/pci/controller/pcie-rzg3s-host.c

-- 
2.43.0


