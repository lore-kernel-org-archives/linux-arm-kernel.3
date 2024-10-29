Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1726D3A697
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 20:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fmaJ2cGgy9S2swZZo1UerLLaJvJoBIutdhI6IzAFbxA=; b=SLHadsn1kWPT/qWtXRLgUGoohq
	nZGoJPLu4NTxwAmvfxH+2ocbADsfQoKMvMJpbn3+NX3rzcnwTy/PAhkuZtn6UIjcbxWucsLg2P4nQ
	5bz755cpHyCxg1fxWZO6WYVAZ+LBfHpqDP5wl7iGDXWhg3BLQ7xooH3xO2GYhRRFmBS14H0jIH5Ws
	n1MKwK7QiQkV4RCO2/oc/PZeIQ/vK333rPRxaEPYkF1zB3u/jr1lvhmZmNBUtuXCzLNUFwB/MJpC3
	2TBuY5ttRLnonzYk3cY4YxCSRFlHu+kbZWfDJQhj1++riyjBZjCT8ENlO05II2yXvPQHcwohl5d/q
	Dfy7eIYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5sme-0000000Flgd-3eqG;
	Tue, 29 Oct 2024 20:25:44 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5sks-0000000Fl3S-1gTB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:23:55 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-37d43a34a0cso655473f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 13:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730233432; x=1730838232; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fmaJ2cGgy9S2swZZo1UerLLaJvJoBIutdhI6IzAFbxA=;
        b=MX4d3HF4Os5pAbxjHL+hWaP/t8Vf31lxotBCnVBxSmfpxo5E/XE8t79q74Vn1QVyAU
         SS2gnOFXMEyxOz3e0XILHpLeqIBQTeaxwkD6AWUCZNwJk4zZljGdAY2+c/DDE5l5TJsI
         H5aoN0cqT6P3EVkiD6eqhKdFyDFZdJaltXvjEzjH/LwlkEx7Lyu9KlL+q1Cj9MW8AAvH
         gV5EPY1L2DlapZFo3cBhzpimaq59EMOy89TAEanW9mpgi0hEfg3v24KC+N9f5aYPojVF
         Sj0Rvm19hCI8HL9+eDo9+J6EXGf4JPXWPJblnvfu+6LnbXP9eSlCWdrF0YUngNnI7rbA
         eGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233432; x=1730838232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fmaJ2cGgy9S2swZZo1UerLLaJvJoBIutdhI6IzAFbxA=;
        b=j9kozaXhUFnlEbTml2DaUkUcpeBtuwJsrljGZi6fI0rPhC51Z7ZjKBYxDtW1qvFiqP
         CH77yjmxXqzoG0BvPBp7mRhNyL6itvvRDvFcdAFy/uev9QwYzpvZ1CPZFl140rOok4ua
         rufH/vjDbM2to9ypEczpvsj6GUTBGGOtRzjIqnxA/DmD0lwpN1rJndnMdOtm+/GrAoFZ
         qzO6Q+durWn7ZdvjmS9uZlU66aauYlIW5Y5USGl2JMYgLbdmaZJWL/A+F2pIMVgYUld/
         vmSyfHvf6BmioQ0Vy7WqanN9Sc+12P34T0j6Lsq8SRwAFe0ACloifvhSq47omD8Gr6P6
         acFA==
X-Forwarded-Encrypted: i=1; AJvYcCUZDqzFiVswWFGwyptlhYnqDETWXeIwK8LulxXx+FrmRR4R9InfammqjsgzXrwv95ZnEFA841AjRbyS/R6GtX/v@lists.infradead.org
X-Gm-Message-State: AOJu0YyrnMm1sU4w/Ttm/mG6NrKFCY7NMXegkWFhEyGYXzRSs22UH8VF
	L8eaCR6al2D6jmP8HQI8BMXBLPXovb7C7tndrXO2ZixOjdl8Kb53
X-Google-Smtp-Source: AGHT+IE4eVnaZPidUHeSY1WAuGOgaGW6tLvUl8un5Y9u46tplJhMw2SpOUD20rey7JdzrkLSVHdpYg==
X-Received: by 2002:a05:6000:156a:b0:37d:5313:ee45 with SMTP id ffacd0b85a97d-3806100755dmr4716128f8f.0.1730233431682;
        Tue, 29 Oct 2024 13:23:51 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:23:51 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Cc: conor+dt@kernel.org,
	dinguyen@kernel.org,
	marex@denx.de,
	s.trumtrar@pengutronix.de,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	l.rubusch@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 00/23] Add Enclustra Arria10 and Cyclone5 SoMs
Date: Tue, 29 Oct 2024 20:23:26 +0000
Message-Id: <20241029202349.69442-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_132354_478527_62F37E91 
X-CRM114-Status: GOOD (  19.03  )
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

Add device-tree support for the following SoMs:

- Mercury SA1 (cyclone5)
- Mercury+ SA2 (cyclone5)
- Mercury+ AA1 (arria10)

Further add device-tree support for the corresponding carrier boards:

- Mercury+ PE1
- Mercury+ PE3
- Mercury+ ST1

Finally, provide generic support for combinations of the above with
one of the boot-modes
- SD
- eMMC
- QSPI

Almost all of the above can be freely combined. Combinations are
covered by the provided .dts files. This makes an already existing
.dts file obsolete. Further minor fixes of the dtbs_checks are
added separtely.

The current approach shall be partly useful also for corresponding
bootloader integration using dts/upstream. That's also one of the
reasons for the .dtsi split.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
v3 -> v4:
- add separate patch to match "snps,dwmac" compatible in corresponding
  driver, required by binding check
- replace non-standard node names in .dtsi files by node names recommended
  by the device tree standard v0.4

v2 -> v3:
- dropped the patch to add the socfpga clock bindings:
  Documentation/devicetree/bindings/clock/altr,socfpga-a10.yaml
  reason: refactoring the "altr,socfpga-" TXT files to .yaml files is a
  different story involving several other files, thus can be part of a
  future patch series, not related to the current upstreaming the
  Enclustra DTS support, so dropped
- adjust comments on boot mode selection
- adjust titles to several bindings patches

v1 -> v2:
- split bindings and DT adjustments/additions
- add several fixes to the socfpga.dtsi and socfpga_arria10.dtsi where
  bindings did not match
- extend existing bindings by properties and nods from arria10 setup
- implement the clock binding altr,socfpga-a10.yaml based on existing
  text file, rudimentary datasheet study and requirements of the
  particular DT setup
---
Lothar Rubusch (23):
  ARM: dts: socfpga: fix typo
  ARM: dts: socfpga: align bus name with bindings
  ARM: dts: socfpga: align dma name with binding
  ARM: dts: socfpga: align fpga-region name
  ARM: dts: socfpga: add label to clock manager
  ARM: dts: socfpga: add missing cells properties
  ARM: dts: socfpga: fix missing ranges
  ARM: dts: socfpga: add clock-frequency property
  ARM: dts: socfpga: add ranges property to sram
  ARM: dts: socfpga: remove arria10 reset-names
  net: stmmac: add support for dwmac 3.72a
  dt-bindings: net: snps,dwmac: add support for Arria10
  ARM: dts: socfpga: add Enclustra boot-mode dtsi
  ARM: dts: socfpga: add Enclustra base-board dtsi
  ARM: dts: socfpga: add Enclustra Mercury SA1
  dt-bindings: altera: add Enclustra Mercury SA1
  ARM: dts: socfpga: add Enclustra Mercury+ SA2
  dt-bindings: altera: add binding for Mercury+ SA2
  ARM: dts: socfpga: add Mercury AA1 combinations
  dt-bindings: altera: add Mercury AA1 combinations
  ARM: dts: socfpga: removal of generic PE1 dts
  dt-bindings: altera: removal of generic PE1 dts
  ARM: dts: socfpga: add Enclustra SoM dts files

 .../devicetree/bindings/arm/altera.yaml       |  24 ++-
 .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
 arch/arm/boot/dts/intel/socfpga/Makefile      |  25 ++-
 arch/arm/boot/dts/intel/socfpga/socfpga.dtsi  |   6 +-
 .../dts/intel/socfpga/socfpga_arria10.dtsi    |  26 ++--
 .../socfpga/socfpga_arria10_mercury_aa1.dtsi  | 141 ++++++++++++++---
 .../socfpga_arria10_mercury_aa1_pe1_emmc.dts  |  16 ++
 .../socfpga_arria10_mercury_aa1_pe1_qspi.dts  |  16 ++
 .../socfpga_arria10_mercury_aa1_pe1_sdmmc.dts |  16 ++
 .../socfpga_arria10_mercury_aa1_pe3_emmc.dts  |  16 ++
 .../socfpga_arria10_mercury_aa1_pe3_qspi.dts  |  16 ++
 .../socfpga_arria10_mercury_aa1_pe3_sdmmc.dts |  16 ++
 .../socfpga_arria10_mercury_aa1_st1_emmc.dts  |  16 ++
 .../socfpga_arria10_mercury_aa1_st1_qspi.dts  |  16 ++
 .../socfpga_arria10_mercury_aa1_st1_sdmmc.dts |  16 ++
 .../socfpga/socfpga_arria10_mercury_pe1.dts   |  55 -------
 .../socfpga/socfpga_cyclone5_mercury_sa1.dtsi | 143 +++++++++++++++++
 .../socfpga_cyclone5_mercury_sa1_pe1_emmc.dts |  16 ++
 .../socfpga_cyclone5_mercury_sa1_pe1_qspi.dts |  16 ++
 ...socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dts |  16 ++
 .../socfpga_cyclone5_mercury_sa1_pe3_emmc.dts |  16 ++
 .../socfpga_cyclone5_mercury_sa1_pe3_qspi.dts |  16 ++
 ...socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dts |  16 ++
 .../socfpga_cyclone5_mercury_sa1_st1_emmc.dts |  16 ++
 .../socfpga_cyclone5_mercury_sa1_st1_qspi.dts |  16 ++
 ...socfpga_cyclone5_mercury_sa1_st1_sdmmc.dts |  16 ++
 .../socfpga/socfpga_cyclone5_mercury_sa2.dtsi | 146 ++++++++++++++++++
 .../socfpga_cyclone5_mercury_sa2_pe1_qspi.dts |  16 ++
 ...socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dts |  16 ++
 .../socfpga_cyclone5_mercury_sa2_pe3_qspi.dts |  16 ++
 ...socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dts |  16 ++
 .../socfpga_cyclone5_mercury_sa2_st1_qspi.dts |  16 ++
 ...socfpga_cyclone5_mercury_sa2_st1_sdmmc.dts |  16 ++
 ...cfpga_enclustra_mercury_bootmode_emmc.dtsi |  12 ++
 ...cfpga_enclustra_mercury_bootmode_qspi.dtsi |   8 +
 ...fpga_enclustra_mercury_bootmode_sdmmc.dtsi |   8 +
 .../socfpga_enclustra_mercury_pe1.dtsi        |  33 ++++
 .../socfpga_enclustra_mercury_pe3.dtsi        |  55 +++++++
 .../socfpga_enclustra_mercury_st1.dtsi        |  15 ++
 .../ethernet/stmicro/stmmac/dwmac-generic.c   |   1 +
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 41 files changed, 992 insertions(+), 93 deletions(-)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dts
 delete mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_bootmode_emmc.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_bootmode_qspi.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_bootmode_sdmmc.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_pe1.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_pe3.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_st1.dtsi

-- 
2.25.1


