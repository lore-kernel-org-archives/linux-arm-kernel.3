Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFE1CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 23:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mtKu8PPPtIbPCrTp4diFj+qAEhlP5xCb1XcDpZtBYdE=; b=Dqw5mQZBpZljDG2C1a5vr6fuUG
	GG22MC8P2AxWxrEDrzWEMWYAbVhKKX3iXe/mvU4PZNbvN4xBrNP3OSVPi1eXWHHXW89Tcjxi94l9P
	ZsvzKGkXwiZlhvZHSr7xWGz/MU2bkFy2jFnrEzsMFYSrqG0jJ8rXhvdnSizSLB3bj4y9PpRU8/x11
	SeXv+kX2i5rWQvIhbqyQcWjLalUKQVkYUIyt7aNGwSMde4n/voK6UwOcRaFP9iyT7/g8h6YufXgVO
	Aq9q2d65vrw3efiFVofoE7/WTmhPNeXVw3/f4KwvoHbLW4ikpcQzNDqvsCzLsVC3tlc1nlkzCV1Ti
	m/mu7O3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLUEa-00000007hDN-01Er;
	Fri, 08 May 2026 23:03:52 +0000
Received: from mail-westusazon11012063.outbound.protection.outlook.com ([52.101.43.63] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLUEX-00000007hCD-0WLN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 23:03:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0x8dRrBL43nPrp9dKggkvla/bz7QivdQWG98joVSjFnVGKCGctK8elXxrX/ND6DGHUCf+4R3AVeACOkLLjVe7bKQrUMlH4BRvoR99i7ieNHkyN0O53+d/t893SwSJg0HICYy5MuYZFzsHdM6BEl3jRX8+WZygpcXM7VMw0CUp7i1LFHuVwIXst+IwpyrGUpYP6RjZFHJlt8iaCPaHTwQFc6PsphRawY6XP5J7W0cQfxugC4Q3j1SZtLsvaDkx2pj2MK/WkrTioD9Mk9pBC/NjNKjt9VKco2xKVxMhBLU8vrKBZ5nbMFZm32zS3VZIWHfRWFVIxamhMvjRlu53uTKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtKu8PPPtIbPCrTp4diFj+qAEhlP5xCb1XcDpZtBYdE=;
 b=X+2YOZqW+K0EcJyNmFErXM2xXs0V/olpMX4/kyxuXAeAQX27u+O9eFq4c7MbRejnFsj0P3VoLaaQhM+BKfO6qATR+Z0d5837Ph7j9oU2Wh4wtWtkl6suzVmAIUTDZYvd4qIxDGIS4R66qJ8SskrcAAtX+n9EnWKMhav2SnRrkkHk037u9g0JSDPFCRuh4hNNl1HPENJc8IG2iFSgiuPQPNybHN8YVgeTO13ePd1uRdYGEkOg3D0gQ/O/REy2//FHykY108/mLip57CzNh7LqvxZud0LFt4x7s8dtJClosvIx9PmE+ckOOqDgfYB/CAK6/AQSeLrDwJ7k49/pNiqGsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtKu8PPPtIbPCrTp4diFj+qAEhlP5xCb1XcDpZtBYdE=;
 b=ZgR37GjvUSMXhir4yPGyAhLgYQUIPfMlowoAUWn97CM3lO4jzoOz6HQDgdU1yU5KMQM05QSuJ0hhMt6YH5esjqHO4/KHqW8+hjjUcSetDMRzwHqjHae7iNuHtbrb1DgOfLw5+T9px8muMI2WFyqtfRS+idL7gyxXh044xbKjDCY=
Received: from SJ0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:a03:33a::19)
 by PH7PR10MB6651.namprd10.prod.outlook.com (2603:10b6:510:20a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Fri, 8 May
 2026 23:03:43 +0000
Received: from SJ1PEPF000026C3.namprd04.prod.outlook.com
 (2603:10b6:a03:33a:cafe::69) by SJ0PR03CA0014.outlook.office365.com
 (2603:10b6:a03:33a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.17 via Frontend Transport; Fri,
 8 May 2026 23:03:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000026C3.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.8 via Frontend Transport; Fri, 8 May 2026 23:03:42 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 18:03:42 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 18:03:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 18:03:41 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648N3fnm2869024;
	Fri, 8 May 2026 18:03:41 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>
Subject: [PATCH v2 0/3] arm64: dts/bindings: Add support for BeagleBadge
Date: Fri, 8 May 2026 18:03:38 -0500
Message-ID: <20260508230341.1891450-1-jm@ti.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C3:EE_|PH7PR10MB6651:EE_
X-MS-Office365-Filtering-Correlation-Id: 054c74b7-14fd-410b-4fbe-08dead560cf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info: OoVLKxus42uUMXD1LnJsUq660bppoTw+FscJ6L/ztuJDksP2F7oDtc3v77cpQt/hd74zA1OJ1a42018v7zCIyuRm1aNmMgVQRX0NVXlBXtwj64YdWEhas4qU+J/6+zeZdllUrrSQ6gbkkq3AU0qJVnxFZJIe2H4fCVYdFQw7O1akrGnKXl7UfgB7cWygw0Qod9KRl4DdnOodnbcrvmGGUR8uDH3yIJFwx719AuWGHMu6KJ0nwWhHJqTr1+lQIOtZv46qFZ+ICF1o6CrAXskcyTJeGkas+Z+8woahEK1Dsv+4V0EPFlM2gLPmsMVrKgWwXDknPNANW98yFLwuBFu6+hMAaEU0ynFLMbpY8bwzxBgiypMrJdPFcEXJ2v96vVTAlepjyC40hdKpkN9l6uk7vjNzkQxRn4Pb8squEvSfZ2sUnsJb8CPlBJa9lIIkVLnHC+mxLUD+Xx9GaoguZtJSfbQ69L4GX4Tek0bGBzAFPUC8Do6NTwiYh51jMn0MmO72Dxyg10/IdFo3usjgf3Vrn2L7C1y/0o04z8o81NWrN+mn7lAjFBN4vCBTOwd390evyZEVTVpD6ifYuWm3RavEKjSQ0ZqR0glasgjz/boxDTPoRLrtT5tcT4A0RBy5PVwkNEsBrWrFB68t5FY2rk0u3Rz18+DBPl7hlY1NfoNaco3+BTI0/emZCEq5MowhrBRY
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(18002099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Xgy/AD2Fj5tXKWUrHGM/OLsa/LXT8+QYjPwYHPVZjVAVU+UEuCDnGOIbaqHD85Dkcj9pZP5vGpyijy46Lh/swYkkYgQHdhCgB6EHFuDMBNuwPoizm6R5zMF+CEuL76yP1MGX9wWUajKbLMFh1e/vuRJzio/PHsSOuw866fI4AAHRORnh7qFt9/3jdrKHFuTTLgBwEVkVAOYMgVedkF6tfqVOgT3CeFjvrdIP5qiaXIWRZ3OFEqvkTTO0Sf5aGjFmwil7XCJNabmtsFiEF4167l1axFvQxAFeF7/QM7lZde4djSkyWp2TMY+BUzS3mL3I4BmYJqLGI7MNL6diPPVsM2K5bB3UcYnbetzrszd4ilsXlEPWHvE+ak89oEabYBFbG2owfYOjwrZiCM6TdfjtYB1WW4eBCf4EcR3kryZiR1eK0RnKm2bG3U9597owZ4HX
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 23:03:42.7637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 054c74b7-14fd-410b-4fbe-08dead560cf5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6651
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_160349_254066_CFBA1124 
X-CRM114-Status: GOOD (  10.82  )
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
Link: https://gist.github.com/jmenti/d37fdb1f8113dc4d3d21479a61542106

This patch series adds:
- Device tree bindings update for am62l3-badge
- Device tree source for BeagleBadge board
- Defconfig: drivers for BeagleBadge

Changelog:
Binding:
- Update compatible to: beagle,am62l3-beaglebadge
DTS:
- Add thermal zones
- Move pinmux definitions from consumer nodes to  base controller nodes
- Define GPIOs for each of use: BOOST_5V_ENA, USB_HUB_RST, MIKROBUS_RST
- Add Andrew's sign-off tag
Defconfig:
- Add defconfig patch which enables drivers as modules for beaglebadge

Patch series depends on:
- "pinctrl: mcp23s08: Initialize mcp->dev and mcp->addr before regmap init"
- Link: https://lore.kernel.org/all/20260508214324.1040460-1-jm@ti.com

[0] https://beagleboard.org/
[1] https://www.beagleboard.org/boards/beaglebadge
[2] https://github.com/beagleboard/BeagleBadge/blob/main/design/BeagleBadge_RevA_V0.7_SCH_251107.pdf

Judith Mendez (3):
  dt-bindings: arm: ti: Add am62l3-beaglebadge
  arm64: dts: ti: Add k3-am62l3-beaglebadge
  arm64: defconfig: Enable drivers for BeagleBadge

 .../devicetree/bindings/arm/ti/k3.yaml        |   1 +
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am62l3-beaglebadge.dts     | 702 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   5 +
 4 files changed, 709 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts

-- 
2.54.0


