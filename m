Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550ABC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 14:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1fDFIpBF/8CgzX8vaDBMUmhFzM5jK4Mt4RtibyILt9o=; b=D9jK7bRdARJrEz6mLa+xDPX7sX
	JMHuMvVugtB9ErQ/sB9je869t+xeGdfX96doef7D4GyEZusiLAcPUJhliE6/JdyJEpXlOoZIAHUG/
	M4d73LnOEJ33lqlR/mZGnSL9m9qGzpzVQc2zNptfzHH9G7uK1iSNgaqVJBAOSf9Xx4G0e5N9JiMpD
	ypCWshmNd38rF5UtbKlZFjynOGTQWe3CLNdsYlOGIV8WH4hQZBXADFSiibGbsPN7TdM5CPEaJw7PF
	exCDkTaysOpeGWdkbfVxxXc8x/8QH3ZoCTZFugO8MHDOpodlebGPr7ivh4AXgFsnobaKsfTSybCkB
	zB8fPs6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tabWt-0000000AOvY-3pP3;
	Wed, 22 Jan 2025 14:16:27 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tabTl-0000000AOBA-4Bay
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 14:13:16 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50MDhAn9016844;
	Wed, 22 Jan 2025 15:12:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=1fDFIpBF/8CgzX8vaDBMUm
	hFzM5jK4Mt4RtibyILt9o=; b=w8sjwGJdkz0t9yIV2EVIuBqYH/l6IhQT4VD1sq
	BtW0njOtzSPgblfkW6IA+RifuGZp0nTppzvGklxFRBphggMeZpnHmyMJpc5B/mdb
	Xls5fBKWO3VorPYF4ZgvnAAjA4VLoH0dma0b1m5q1eVE7TZ5ik5EAPx/JPakVg8V
	Uz9Cy56cTEKKiBSJ3RoZhJTYdFPGLRrJS+li5/VpyvGmtFXWoQgvL6a/O39Q7bBr
	iDsWIv1rmrYzUPSgODf5Mj92yGd0k2Z+XkwiesS/m9HRGX6P8Z87OrbwJipMsga8
	dRuFsSu6poOkeR1dBV3eVJy8wpaMxGj8EMpX4ZbJX2HQBi+A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44aw9x17t7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 15:12:56 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 80C844002D;
	Wed, 22 Jan 2025 15:11:39 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6A1FB2943AB;
	Wed, 22 Jan 2025 15:10:39 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 22 Jan
 2025 15:10:39 +0100
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <christophe.kerello@foss.st.com>, <patrice.chotard@foss.st.com>
Subject: [PATCH 0/9] Add STM32MP25 SPI NOR support
Date: Wed, 22 Jan 2025 15:10:28 +0100
Message-ID: <20250122141037.953934-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_06,2025-01-22_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_061314_331039_84E8C504 
X-CRM114-Status: GOOD (  13.07  )
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

This series adds SPI NOR support for STM32MP25 SoCs from STMicroelectronics,
for that it adds support for:
  - Octo Memory Manager driver.
  - Octo SPI driver.
  - yaml schema for Octo Memory Manager and Octo SPI drivers.

The device tree files adds Octo Memory Manager and associated Octo SPI instances
in stm32mp251.dtsi and adds SPI NOR support in stm32mp257f-ev1 board.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Patrice Chotard (9):
  dt-bindings: spi: Add STM32 OSPI controller
  spi: stm32: Add OSPI driver
  dt-bindings: misc: Add STM32 Octo Memory Manager controller
  misc: Add STM32 Octo Memory Manager driver
  arm64: dts: st: Add OMM node on stm32mp251
  arm64: dts: st: Add ospi port1 pinctrl entries in
    stm32mp25-pinctrl.dtsi
  arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board
  arm64: defconfig: Enable STM32 Octo Memory Manager driver
  arm64: defconfig: Enable STM32 OctoSPI driver

 .../bindings/misc/st,stm32-omm.yaml           |  194 +++
 .../bindings/spi/st,stm32-ospi.yaml           |  109 ++
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi |   51 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |   48 +
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    |   33 +
 arch/arm64/configs/defconfig                  |    2 +
 drivers/misc/Kconfig                          |   17 +
 drivers/misc/Makefile                         |    1 +
 drivers/misc/stm32_omm.c                      |  510 ++++++++
 drivers/spi/Kconfig                           |   10 +
 drivers/spi/Makefile                          |    1 +
 drivers/spi/spi-stm32-ospi.c                  | 1064 +++++++++++++++++
 12 files changed, 2040 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/st,stm32-omm.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/st,stm32-ospi.yaml
 create mode 100644 drivers/misc/stm32_omm.c
 create mode 100644 drivers/spi/spi-stm32-ospi.c

-- 
2.25.1


