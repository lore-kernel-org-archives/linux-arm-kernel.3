Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C7BCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 09:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lF3GowPO+XMJ0UCjcpVn1Fz65F1tQJWibav3wFxTdVs=; b=otXAMsfwSCFtYe
	bByeP4WaFiZT9q6zEG6d5KzlP3zats3Q6q9Z9YCiOBf3olByTHTbjsFMrTcM6HAXPst+wp8bhKbVN
	gx4dbJ5mXD5EU0iOdOjTiTMuxVxNyWdGxu6hL7fi4vR/OW/Sx8e0HZo0Gi/kt/a9UJLxvHwAtOj4D
	M3Q14SkyPHGdz0OZKz51nCyBQIriXeJFbLE69HPjgWeu43po7GHlBvWgGjvgJvtUju8D+fwpM3Nt8
	rDb6EPO2qxACNB4BSLGJeeUnmL4B47Exg58yRuBopTh8p0UM1fPYA7aEMxSXfDDRCt4rf6N3SK0CE
	sHdUgv+MWo61VF8yrwEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRo3z-00000001V9m-3adv;
	Tue, 26 May 2026 09:27:03 +0000
Received: from mail-westeuropeazon11011009.outbound.protection.outlook.com ([52.101.70.9] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRo3p-00000001V3r-21hT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 09:26:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f44vEUKPzsRc6sPZRoxJ1ulMTx9ALI/i9OworrdM5Uw14ln4kL/+3EdE9WfZzNJ5DtjB69URdKnhmUdnNFAdEO/EPJXs9ZF8hhuhAjkPZ4rlJKkZmBZ4QVL6fMCp2075j7wqgFrx2w17bJ6Y1xG91jVmSMyPjZOhVUUoq24NjgT3JsqjOGJB25S22Vv8H9H4WKZXvylU0nj31eYOqTfBdoQt/pS+8MwHx38qk7xuIvb3e6Sw7PnNpuE9SczDT8F1bABiLc1Gm/gEfOBQ13Z93A2VmAd03E+jwJyhB6tRSYrbpO6T8Ihjfea9qgqqUJA+bcWGg2apxJATy0v9esujkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lF3GowPO+XMJ0UCjcpVn1Fz65F1tQJWibav3wFxTdVs=;
 b=FbsFabxnV9787SLXylOBAPfcnG3UTTh7C6ErTPwzolW7GmSVvQW44z2aun3+o1C+G6xXNTq92/jW2LrELYiGG2hLheYdAdqcoVW7L8+L4WDT1OIT4qZ2lz6dJNkjAfjaRDTxxxlqVam4EGwac0W0Rdne/DdO3HeY0JIqEBEyn+c+favMqdo/duDF4CyUw2y581gnmhnXsNBwjEkio1QSBPP5AVk3kXfr3akgPWxDt/V4AqbBBBXmMk9i143c+TOFxs9f4nRVy9zgNf4OM4qnFnXfxu/ex4BtzKIY1RnoxEIFEtg0Lb81gDzVwqN/2nH4LM6Hm8SxtuQ3thInF+5hyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lF3GowPO+XMJ0UCjcpVn1Fz65F1tQJWibav3wFxTdVs=;
 b=Hv5fxuybyCxDQyupC8jfsHM3ee+XjPxcwgSOVsDolXlAz9SwafzUel4Lzos7UdYvtDaoJHVEJ5m7MaegZKa4ppQHzn+I5YW5OYUGKq2DNtpF704bBa6beHlfL6TaVW4pDgmPrVGfTsVSJpVyuiVzZleiXQlTBdjBK0qa/xP4Pvrjt9GdhKe71mh9lMvpeCi1yI6rmJCL1wgI9H+1dYJQrKaBmGyPHUy8E0XiO5tErBCjej+JkNCVw+P2nmmcUmjFc88lNJWYdtejmP001BKV0BW9yQxPARZ3xs82k4d6MwHWZ+4Ty4R3j0BD7UwvkqbpU+/3BnnYvsJ6JMoh7yakpw==
Received: from CWLP123CA0061.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:59::25)
 by GV2PR10MB6092.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:7e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 09:26:44 +0000
Received: from AMS1EPF00000091.eurprd05.prod.outlook.com
 (2603:10a6:401:59:cafe::9c) by CWLP123CA0061.outlook.office365.com
 (2603:10a6:401:59::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.11 via Frontend Transport; Tue, 26
 May 2026 09:26:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000091.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 09:26:43 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 26 May
 2026 11:30:24 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 26 May
 2026 11:26:42 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH v7 0/7] Add boot phase tags for STMicroelectronics boards
Date: Tue, 26 May 2026 11:26:40 +0200
Message-ID: <20260526-upstream_uboot_properties-v7-0-e17cd424d5db@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFBnFWoC/43QTWrDMBAF4KsEreswM/p1V71HKcGSpUaLREZyT
 Evw3SsHSl1cTJdvYL43zJ0Vn6Mv7PlwZ9lPscR0rUE/HZg7d9d338S+ZkZAEhGpuQ1lzL67nG4
 2pfE05DT4PFaiIRIGLFhh0bG6P2Qf4sfDfn2r+RzLmPLno2rCZfofdcIGGrDYIucawfOXkEo5l
 vHo0oUt7kRrS+xZVC2ujQhBKdN52Fr821KAYPYsXi2Htu1FIOdNv7XE2mr3LFEtLT0oJbVT8Md
 dcmUR37NktSQq3VLbyy7IraV+LIJdSy2/74gMeCN6jr+teZ6/AHZsYdNAAgAA
X-Change-ID: 20251112-upstream_uboot_properties-22480b0b4b1c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>, Christoph Niedermaier
	<cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@dh-electronics.com>, Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000091:EE_|GV2PR10MB6092:EE_
X-MS-Office365-Filtering-Correlation-Id: c7f8f24d-95d4-4e3b-4f82-08debb08e68e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700016|11063799006|3023799007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: hMd5tJUBxwZSedEvFkRVZdYa499ADXCVI7YPQvak3YZ4EFJuoB3+rx6Gnq+3SojOfJvyMm6LfLUYZAQjJU0Ij35x/3hf+KccjtaZQVulQfhWeTLeU6BZJQbzURvg6D+rlTZyPxfmBNw9SIhB+0BKtLQLfeEi4oOxM1Jmy3TNwWMh3wxBPIEA6CSjgrhHtf5vTZ/ZKeZGYRCs8w4U73l9zs+HZq4Mow3HwkIxOqfkbPsLF0iYwiXBDrNqLVO4QMH1sJR+XMz4b3v9ypK7mRVlFYkIKbSrDXB/AHQ1i3Y18Tch+Y5icqMxzQtO2ymK4D58EhICWXGwrRLdjk0ZKCSxk0nPdw8Jbzk6pojIq576hOC5q4y3yhuebcW4TjU80NoFcB4ERsvuMLuAB+mVk7Mjuy73OQi8/lQsnzdNCF9ylAVim5FdtKzy10pHIWeISi+0h8+5LpiDBKI5tr0v5E0CjqWAQA0octaJw3UVlD9aGBU9NOFUOJbj+Vup1wOp1x93O3LulUXwnf27XXBP1msqdpjebDqEW1dtusGlCrZiAdHeETIcDIo06QJP0v0J4vDKPPRCRom6b8VES+W3XIJLTJolpcV6cSwPVPccoCghUIB2A4N1QHQfa2aW5wM/zuBPKquXJRg9Ig9vMi2XwDuBeZdKrGrOu8v2MeyNPcRdjAmYOirJYMvpGiws/kv6EiIaXGC2g2JwTl5z/rnbRDyYQP1tBFMbZ8MJLVjlJ07J1j9DkSXOTRO1M3C1RtznVHtX
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700016)(11063799006)(3023799007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: URprcZgx2kwFe4eBBc7+8STxzs/zy5M2FH0Y3144yPgVAw1dIOleEPF/mw//Y0ADfghYjpKfgmVL2KWywu3S0ZbFWDqzt7+dYq82RVyaXVpgPu29z3UGk2hfhrVO36XusghyfPEuw247e8pfU3hZtws36kwG686Rs0/RHgJrs/SH/53RIHELExUMMEzYUPiunYLeUYNwNy0TE7JiefvImcAcj3a9zf14DCWbe90S893TaJ4rBikunWgRUzC3zi2bgZSqHNxPw192GivuxMe78x8V7SQhHR+a9wDFNLSkWdm9ozBERTSrAUP0xcbdbPGCbImHGzDg9DSsRWmoAGsTG5bxH/oyEcRFSh08SXHbsxuZ1G72Aat/q2nH/Bq3AGvbhXH6C6M0e3KPcGnQD96mGqvD2DhH1C28UT0QgesL0wAUrDqrJofJ7A2ZPlT5IukA
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 09:26:43.4529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f8f24d-95d4-4e3b-4f82-08debb08e68e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000091.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_022653_530656_9B6E5CE5 
X-CRM114-Status: GOOD (  13.27  )
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

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.
    
To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Changes in v7:
- Rebase on top of stm32-next.
_ Fix sdmmc2_b4_pins_a's node in stm32mp15xx-dhcom-som.dtsi.
- Link to v6: https://lore.kernel.org/r/20260203-upstream_uboot_properties-v6-0-0a2280e84d31@foss.st.com

Changes in v6:
- Add bootph-all property in syscfg node of stm32mp215f-dk.dtsi.
- Split patch 4 in 2 parts, first part for reordering nodes, second part
  for adding bootph-all property.
- Rebase on top of stm32-dt-for-v6.20-1.
- Link to v5: https://lore.kernel.org/r/20260123-upstream_uboot_properties-v5-0-5167929d5af5@foss.st.com

Changes in v5:
- Initial implementation allows to factorize and add bootph-* properties in a limited number of DT files.
  After internal discussion with Alexandre, choice has been done to add bootph-* properties only
  in board DT files instead of SoCs/pinctrl/boards DT files.This impacts a greater number of DT boards files.
- Link to v4: https://lore.kernel.org/r/20260109-upstream_uboot_properties-v4-0-75e06657c600@foss.st.com

Changes in v4:
- Remove useless nodes in stm32mp15-scmi.dtsi
- Link to v3: https://lore.kernel.org/r/20260108-upstream_uboot_properties-v3-0-c1b9d4f2ce8d@foss.st.com

Changes in v3:
- Remove duplicate bootph-all property in ltdc node
- Link to v2: https://lore.kernel.org/r/20251114-upstream_uboot_properties-v2-0-3784ff668ae0@foss.st.com

Changes in v2:
- Fix 'pinmux' is a required property for arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb
- Add bootph-all property for lvds and ltdc nodes for stm32mp2

---
Patrice Chotard (7):
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics f4 boards
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics f7 boards
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics h7 boards
      ARM: dts: stm32: Sort uart nodes by alphabetical order in stm32mp13xx-dhcor-som.dtsi
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics mp13 boards
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics mp15 boards
      arm64: dts: st: Add boot phase tags for STMicroelectronics mp2 boards

 arch/arm/boot/dts/st/stm32429i-eval.dts            |  80 ++++++++++
 arch/arm/boot/dts/st/stm32746g-eval.dts            |  10 ++
 arch/arm/boot/dts/st/stm32f429-disco.dts           |  80 ++++++++++
 arch/arm/boot/dts/st/stm32f469-disco.dts           |  72 +++++++++
 arch/arm/boot/dts/st/stm32f746-disco.dts           |  75 +++++++++
 arch/arm/boot/dts/st/stm32f746.dtsi                |   2 +-
 arch/arm/boot/dts/st/stm32f769-disco.dts           |  76 ++++++++-
 arch/arm/boot/dts/st/stm32h743i-disco.dts          |  69 ++++++++
 arch/arm/boot/dts/st/stm32h743i-eval.dts           |  69 ++++++++
 arch/arm/boot/dts/st/stm32h747i-disco.dts          |  69 ++++++++
 arch/arm/boot/dts/st/stm32h750i-art-pi.dts         |  69 ++++++++
 arch/arm/boot/dts/st/stm32mp131.dtsi               |   4 +-
 arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts   |  21 +++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts            | 101 ++++++++++++
 arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi    | 145 ++++++++++++++---
 arch/arm/boot/dts/st/stm32mp151.dtsi               |   2 +-
 arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts      |  19 +++
 .../st/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts |   1 +
 .../dts/st/stm32mp157a-icore-stm32mp1-ctouch2.dts  |  25 +++
 .../dts/st/stm32mp157a-icore-stm32mp1-edimm2.2.dts |  26 +++
 .../boot/dts/st/stm32mp157a-icore-stm32mp1.dtsi    | 100 ++++++++++++
 ...m32mp157a-microgea-stm32mp1-microdev2.0-of7.dts |  27 ++++
 .../stm32mp157a-microgea-stm32mp1-microdev2.0.dts  |  27 ++++
 .../boot/dts/st/stm32mp157a-microgea-stm32mp1.dtsi |  97 ++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts      |   5 +
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts           |   1 +
 arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts      |  19 +++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts           | 151 ++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts      |   5 +
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts           |  38 +++++
 arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts       |   1 +
 arch/arm/boot/dts/st/stm32mp157c-odyssey-som.dtsi  | 119 ++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-odyssey.dts       |  21 +++
 arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts  |   1 +
 arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi     |   5 +
 arch/arm/boot/dts/st/stm32mp157f-dk2.dts           |   1 +
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi   |   2 +-
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi    | 175 +++++++++++++++++++++
 .../boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi   |  55 +++++++
 .../boot/dts/st/stm32mp15xx-dhcor-drc-compact.dtsi |  50 ++++++
 arch/arm/boot/dts/st/stm32mp15xx-dhcor-som.dtsi    | 157 ++++++++++++++++++
 .../boot/dts/st/stm32mp15xx-dhcor-testbench.dtsi   |  50 ++++++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi          | 122 ++++++++++++++
 arch/arm64/boot/dts/st/stm32mp211.dtsi             |   4 +-
 arch/arm64/boot/dts/st/stm32mp215f-dk.dts          |  29 ++++
 arch/arm64/boot/dts/st/stm32mp231.dtsi             |   4 +-
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts          |  95 +++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |   4 +-
 arch/arm64/boot/dts/st/stm32mp255.dtsi             |   2 +-
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts          | 103 ++++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         | 105 +++++++++++++
 51 files changed, 2552 insertions(+), 38 deletions(-)
---
base-commit: a0d6c2a06fffff47bcca4d5bfdab4cc428a315fc
change-id: 20251112-upstream_uboot_properties-22480b0b4b1c

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>


