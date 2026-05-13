Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F23CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 23:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xs27BI2E0WDGFV9qen9baKiSJRiYqCmVH45VA5V+4dM=; b=3AUPxkD/3l+eJkvpdbBivIFLbi
	6dvSVkwMfAOlp2g9ji15TiQpv+v/9NjeGnfGOM7uZNFZ/ExQe7acyxUDw/7EU92Yj4Ut4E2jzP0s2
	idCNkbvEVV4869CnLB5qAQgTjQzGmHL89eR3G9J3ilL7dKDFDEQr05hY7+czu9UCyVb2WGm6VmuCh
	ZV8BUzhdynUzdt6wRMqxQKq8biUaRBIjiPLoSiuWfyqrbjUR085P0t9a7K5wI8pTYbgL796lOGfp4
	oQpXZYrkq4gvhyFWdWvT08DxuGMvrPkwU1IR3Bvx27RpqcnWuPxqTqIl6dqMGQSLQ1T3UmyzQO0T3
	9zAru6eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJ6T-000000043vD-2Fr4;
	Wed, 13 May 2026 23:35:01 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJ6Q-000000043u1-0g4K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 23:34:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u4PYoS6ddJuZ5/gWcI5HOwS9juyJ1lTWt9ZLzFD+HHcBzurjhWcH7wjCVUUsX2iPIOspKvoX8gMPf789HoxBxd9oQhomVy7pf/1p+CwOSsr4UTSRBUXnfg8zpIHIPWFmDsYEzOItgWBAjDCJXyHiyga/gOC2Zp+ErvQP4IrxAK55oD0kBcT2udjg/a5djjUCmmoUi2S5jgaM6SHxidKTAhpXSLMuSp8vBHGZJlhnF5AehA79ePtQ1klbQo8vpua54Ht1fBd3ofiX/Fe65kUy1ZDYXXkjv9JbsfSj/Eq6SoemcK9CwRe80JjDL+AJwprlHadB0OxoENm1fA+CPUpBoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xs27BI2E0WDGFV9qen9baKiSJRiYqCmVH45VA5V+4dM=;
 b=ODLaVMb0sVd+2UvxXKZRkrk/htjiORLeOws/VynAazaT2yxkM4e23xUKi0aNUIXfdC1XY6IQye5KH2ne4/+VFMNn7fuy0yZYyAtUR/BUbrOuvjhXSn/rDzbD8IZDQ6OhHcmGy6ICibiKYmXbjGLFxieYKJAEhHxTs/AmoQguYqIdOrUtdcXmq1bWWerMB5odd14OXvT6VYgZnOEQqJTS4s+d5oTlD+svIPZDypoWlbbiA722KArhh2n6iLEaJ3TwsDorPTboh2o86VmKjz6NQSOOfS/LLQYJegSI0qFZp3XuecZvTG+PxEmoiMaU8Qlpwgn7LYabc0dFq52lVvennQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xs27BI2E0WDGFV9qen9baKiSJRiYqCmVH45VA5V+4dM=;
 b=m/M+bYsBFrrR3USZYjn0Qq6TV3MnLjXOkVodrRvd6hHaRvlBFdqTiVrPFeUPrjQKUIHYxx7hAk7E72A9ACiQsUmGRO2nnsClKL5hpnaMzxsLRgAihnaier/SoiZGZpzvuMiH/5/ESMZbpqpvvr2L7QFjVyKF+395Z1psX+FA1m0=
Received: from CH0PR03CA0092.namprd03.prod.outlook.com (2603:10b6:610:cd::7)
 by SN7PR10MB7032.namprd10.prod.outlook.com (2603:10b6:806:345::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 23:34:50 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::fe) by CH0PR03CA0092.outlook.office365.com
 (2603:10b6:610:cd::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Wed,
 13 May 2026 23:34:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 23:34:48 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 18:34:47 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 18:34:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 13 May 2026 18:34:47 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64DNYlSO499089;
	Wed, 13 May 2026 18:34:47 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>
Subject: [PATCH v3 0/3] arm64: dts/bindings: Add support for BeagleBadge
Date: Wed, 13 May 2026 18:34:44 -0500
Message-ID: <20260513233447.2713737-1-jm@ti.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|SN7PR10MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: d3a1bf70-328c-463d-ed28-08deb14838f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: NzAI7dwuCO80CwsFWRfuPMk3TEVuEjt9SxThwsHZiovave1xdkBfb23yTL5SE9mmV1Enx+aVAj7K4+1IJ3ogLaw+BccbGhpBCVFjjxOgH8uCdmEADqvyyvvBBWHzgdDj1+tjkihPRMsWMgcU3nfLWJ1IP2Yh++QMIK0Yddf5oGGzMwiFFFWjIyXjcvSX78VecclUVTKSWoAR117Nseeflqqu333nDjC4SsLxH1wcYsJ22zKC9SidWEtwAGAiI1P9a/f6qGT3ZCW1u6WtUyU36RDuyn673bg+bMoiImrX0sqVqsAZocuklnBIVybpizMZ6+YfRR6pkQmFWG0VRUso0kw1biUEO/G0FDrnMSo+UO2h7HLCG3WmTYiYmvWObs1XlmojlJNqE5O67dFUFx+02twUGdAHGX/1VKL9Up5sxrV/GiE/9aMxavOG8I8lOYiE/fF7obQ6FCxzRASUotlW3E/6cOsIEJMkMe2WLQQ8oSK9yDDPct4BkT9f0E55+p3LYeFCXgA/oycxU2zCQagABrNUZIlCDBLyH/dcvtwIyFQdfrzTO5LkKOxsnDoxEj2dE+rV5S9gRqWMRJUXb/R1t9P3JlVLSD4hWNSSeSrD46W6eCb/i1W9uztOdDPtwyHL7YtvtM40Xu53oZ+6HIDQSkCzKDClO1IzqADws6YM2rluKeTf/Un+VKSrkQ9MAvyE
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: u4jstgbx29Nc4TGXIysZToNiLOfELDoLrfRvliYSKuZO0rEylJanp7iWlkn3S7/MlEfck3mw6vVRUXCxei1K4oPWkNjr8u/EYZTRyzl0w/9SiVzVWh/hhHSyluJWObXdKQc1TqjFm0zlMdtxBg+xh4zys/xfbMtLNolcB1mBx3Th27TnqD7sp0N2W8iOaC4fnmCzCHXHTHLdLaSscz276ucCA9sa2DjzP2LJsJfq550c9EUqSlO5fZeQsRuRGkeIVDwYNa/VRpMq530pqCjPH7XFZ3kaMBva+7N7STKqSxcpWrIGAoX5Kx63X3PDuCRqKJK/ca/zUMgrrIXAceISVOlxzQewh/DzjnOrdvsore1bB97XiAVeevNg6lMiG474S37/Mg0XdX/PLD8k5DL6yW0aTJgXFkqiXgPMQG1xS8iEgINCCQcxB9pBY/sK/Unu
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 23:34:48.3590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a1bf70-328c-463d-ed28-08deb14838f5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_163458_202710_90D3906A 
X-CRM114-Status: GOOD (  10.11  )
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

Hi,

BeagleBoard.org BeagleBadge[1] is a compact, affordable open source
hardware [2] single board computer based on the Texas Instruments AM62L3
SoC designed for IoT and embedded applications. Add base support for
the same.

SD boot:
Link: https://gist.github.com/jmenti/8818fa277597de927dd2b42ab1d2552f

This patch series adds:
- Device tree bindings update for am62l3-badge
- Device tree source for BeagleBadge board
- Defconfig: drivers for BeagleBadge

Changelog since v2:
DTS:
- PWM period: 255ns -> 10000000ns
- vdd_3v3 vin-supply: vsys_out -> vcc_3v3_main
- MCP23S18 reset muxmode: 4 -> 7
- Typo: FUEL_GUAGE_BATLOW -> FUEL_GAUGE_BATLOW
- sdhci2: Remove  #address-cells & #size-cells
Defconfig:
- Move config options as per make savedefconfig

V2
Link: https://lore.kernel.org/all/20260508230341.1891450-1-jm@ti.com/
V1
Link: https://lore.kernel.org/all/20260501233148.4180391-1-jm@ti.com/

Patch series depends on:
Link: https://lore.kernel.org/all/20260513231154.2703292-1-jm@ti.com/

[0] https://beagleboard.org/
[1] https://www.beagleboard.org/boards/beaglebadge
[2] https://github.com/beagleboard/BeagleBadge/blob/main/design/BeagleBadge_RevA_V0.7_SCH_251107.pdf

Judith Mendez (3):
  dt-bindings: arm: ti: Add am62l3-beaglebadge
  arm64: dts: ti: Add k3-am62l3-beaglebadge
  arm64: defconfig: Enable drivers for BeagleBadge

 .../devicetree/bindings/arm/ti/k3.yaml        |   1 +
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am62l3-beaglebadge.dts     | 700 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   5 +
 4 files changed, 707 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts

-- 
2.54.0


