Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E10C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 11:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=USDzPWtwfClWp+wqP7p23s9TnEvWK9VkLl4tGpc0TUk=; b=z4L8zCpORoVNBYCMroQiSgzjOp
	nrtFloUGA18NTFqxt2lP36hraa+KpovJuM+tCXEes10dWFOPw+AEJoaffQ8A5Tkzv24o1DkQ+rAje
	GIcr6qToZzy7JVeFEqQMpDO7MPxg8Oina9f5s+J2kR7IxVg5MaVwNzz1EFPIbysg6ei1SNadNxfZa
	thhdzLLeYxVyaEJE6IR5A5qQnrmJ8roXWTcjlPPo29p83HYUURju5p5ckpAX2Fl1jSkIPTuSaXtAF
	8lHbvW+TA7Ooh2kdRhrU8b9a2HMAxJLxHqyjchRpSbahya5srnr3faLtnIDOh1DL4eatmyHUwes+g
	S5BzGLRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKxoF-00000000PfB-0mhj;
	Fri, 30 May 2025 11:21:59 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKxm6-00000000P8D-015a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 11:19:47 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-450cfb6a794so10536515e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 04:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748603984; x=1749208784; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=USDzPWtwfClWp+wqP7p23s9TnEvWK9VkLl4tGpc0TUk=;
        b=g6+lvhFRki1NANrPjon1pFnonONXqA3aiMQTpFWx2jftvIgGhOar78eAZ5zrosUokN
         V2qtp/i3xzaEWRc9qlBucZ3CexBU2o53nZkQeF6aakB1r1T9ObfmwflI3HZy/GoZrwZD
         Ls4/H6V906NQaIHBxUMCxhnE9CLp/xl0COkG48azYn6FYgN4/TdCpnqkZkbPIzVZmyEE
         2ySeDn3oNLbSIWtD5z5XVsQMdUlxUYmYz5SFiWqyrDMdn59yhGPkvubcSMsyl33ahw50
         8ZAJ5f16p/YubcjLb2RNlw0lT8pMQRq+PrtkQzlmoIpHuYGziGsftK7zg4xwC7Uo/KtN
         IhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748603984; x=1749208784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=USDzPWtwfClWp+wqP7p23s9TnEvWK9VkLl4tGpc0TUk=;
        b=hYI/ozac9R3AvcVuwMPQ4pcm9wgpr3mWIJg9K+RvzC3WMhzoCQeOzyxQscxDOuaPcc
         SIknPUWdUpHaztbxlG7vi1ji619J7HHyOdb2f1tfSyS4Sv7geLuweFSXFkZMuGOJZ512
         4Sd0R8L9yUCUVWCqyr8t+u/Jik4cqZt1fqxSeQ+ZvlPjvtkdy2TWQ+NR8YO4Ostn89Sn
         AwHaocoAO7rx2FoYEFcI4SZGzxVTcHn4bo/MlNJlB2t5zkL12oQ7m/hXAmNH/VwRpAmY
         Kyk61kspkhlLywbfBrkUGmIv68Xc5oXCaTqKiuH1HAwHbM6N6vU+HOpSg3g4ARO06grV
         GFnw==
X-Forwarded-Encrypted: i=1; AJvYcCV95i+gdoRRebhNCRI5c2Ey5BP1oUnEfLP9njMMIDKU8xmWVQMkbOl/adBgNGKAk42Kgp4bo9n/HYr6J4TZ40CT@lists.infradead.org
X-Gm-Message-State: AOJu0YwRrrtgcrmbbrErIYtVFT25OD3wCM/Om6wWWEE/FMrSft93PpVJ
	tq9zDvfNwKalu9ZRw7lXJ/RI3pvHT+iCkRfBAigG2WNDZGmC7oFpDTI23CJQQV/2C+8=
X-Gm-Gg: ASbGncsS0LUA2KtJMd2sJmp6ejzQbbc1JruTBLPZLWozeindXCzMWSk8MmssfJIPHph
	pbvYGqvLibiXY1UzZbzkePOXrEyc5syKXtQc1j0OM40woCiRz3rMu+UxHClX6sp7V+rF/QuJ//j
	3y9il8Tt5Xg5zkiB2tYy2n/Snjei2QjcQJsg7LZoDp3OO6oDMAINoVE0ssnhQgmaS5z9+n7RAJd
	d3UK+JX91aqiNgux4x5n5/4osVqAJGNJYL5Bz4tIz8zEScJMzdYDmKRWm1iiz20Sw0pQEzYZF5F
	cuWP+l3VIvZU3IF6/3jnB1QCQQdQCG5wbszzcZVnFmM7//rO2irSHlg17j7grCFN3fqorlP4tDT
	VhX4Cyw==
X-Google-Smtp-Source: AGHT+IEbp0QcHOdy/Wep78m1G3gFrb9KOos/vWXOjVVBlX3y+lsRN5K2Os1MzG3FOYd4Bwb4BIL7Jw==
X-Received: by 2002:a05:600c:1c96:b0:450:d386:1afb with SMTP id 5b1f17b1804b1-450d64d63d1mr31026995e9.9.1748603983832;
        Fri, 30 May 2025 04:19:43 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dc818f27sm3986435e9.18.2025.05.30.04.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:19:42 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 0/8] PCI: rzg3s-host: Add PCIe driver for Renesas RZ/G3S SoC
Date: Fri, 30 May 2025 14:19:09 +0300
Message-ID: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_041946_202970_EFF7975F 
X-CRM114-Status: GOOD (  16.55  )
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
- patch 1/8:		updates the max register offset for RZ/G3S SYSC;
			this is necessary as the PCIe need to setup the
			SYSC for proper functioning
- patch 2/8:		adds clock, reset and power domain support for
			the PCIe IP
- patches 3-4/8:	add PCIe support for the RZ/G3S SoC
- patches 5-8/8:	add device tree support and defconfig flag

Please provide your feedback.

Merge strategy, if any:
- patches 1-2,5-8/8 can go through the Renesas tree
- patches 3-4/8 can go through the PCI tree

Thank you,
Claudiu Beznea

Changes in v2:
- dropped "of/irq: Export of_irq_count()" as it is not needed anymore
  in this version
- added "arm64: dts: renesas: rzg3s-smarc-som: Update dma-ranges for PCIe"
  to reflect the board specific memory constraints
- addressed review comments
- updated patch "soc: renesas: rz-sysc: Add syscon/regmap support"
- per-patch changes are described in each individual patch

Claudiu Beznea (7):
  clk: renesas: r9a08g045: Add clocks, resets and power domain support
    for the PCIe
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
 drivers/pci/controller/pcie-rzg3s-host.c      | 1686 +++++++++++++++++
 drivers/soc/renesas/Kconfig                   |    1 +
 drivers/soc/renesas/r9a08g045-sysc.c          |   10 +
 drivers/soc/renesas/r9a09g047-sys.c           |   10 +
 drivers/soc/renesas/r9a09g057-sys.c           |   10 +
 drivers/soc/renesas/rz-sysc.c                 |   17 +-
 drivers/soc/renesas/rz-sysc.h                 |    3 +
 16 files changed, 2050 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
 create mode 100644 drivers/pci/controller/pcie-rzg3s-host.c

-- 
2.43.0


