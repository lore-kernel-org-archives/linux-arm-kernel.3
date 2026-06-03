Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC822CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 19:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mA0RhPBApekQeKhZDmYSmI2y5UuqHThAUm2Ab/gek40=; b=AMEAnbFH0M1Fy3EoJ63YJHfeVo
	rJAq3ms+eioOkBnipNNRv+96yIu3oPMGJ7iArUZ67AS8Q/epcnV78aMqK1Q6a/dRjFDFnFM6gKux+
	1Fmtsc0CEOLRPW8MZQUI7u2y7NNwTzFkz2NEU6y8DhuZAFm60LId7W9zNCtXfdn0TukfZGDYM9Gw1
	kol29aZ7FWSPFEzNhdDYTlEBYk5UbyVAlH7CRa4kloWqCXpU1+ZL2Dn9duflyX9eJASW856ZjAcaS
	Tmldw0hr+z7sZnypji0rkmqZ5eoMpy2HAQBfuh2tkS9wt/Z6tVXjmFiWnKp+0o8BlV9lkVjJ1x+Hw
	1Y/0H0Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUrBp-0000000FkTZ-2cpl;
	Wed, 03 Jun 2026 19:23:45 +0000
Received: from mail-southcentralusazon11012006.outbound.protection.outlook.com ([40.93.195.6] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUrBn-0000000FkRo-0djz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 19:23:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9Z9Xk0PSBrkcy0ho/QL+ZKxpQa3jmyoyi+8csGcM9ONfeX5eiKr/hW2HdzUSrAmESSnXFwnk8A+/rVzv6PRqe7AF31VPBL1WmzSQa/8RyUb+sj5AXghtp+Szf95RNSIYEU6H39LpR0uUTw85wrlkqguD4zrrT2NBj4sBe/iATD2vcQ3BWmY+cIbb7Aj0X+6OQpZ7wd5SEgI4RbChzFMWuzHD1xdIJb2CdYA4olOhLg7J/QrsAhg6RaHYfsvN3EsP4I68xultA5VZ+qYBmpKDTc++k9zQ4hsxrFW6uJmt3XXmjzmUAahqYTRaQIqEgWNWPzpwTMZ3UL3+fQUIgYpaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mA0RhPBApekQeKhZDmYSmI2y5UuqHThAUm2Ab/gek40=;
 b=Xk6cFvUoUDgFe30jIR9AuElRK7ptgFvhQ07rM1ogb4UbtChMW2U0ZJTptSig+F55QejoMce3wJUHW9OKUDcLF0agBc4bftHhEdpq9mbjGbGw6oJINGjGys3Fbh8V5CrtrBJuFMgdqYOC8Rmxu8wjiWKOtGcPeEVHjWuDv38lUEijm2lO52rQ6DC5udXicskQ1sLPmAzxomdSyM0SV5Xh3PMxiZ205WwuKvCLsFZFq6C0/2HgA1Dw9wouz3ycUhUXRSgiLJyQUnq5XLy+49T7L9zatQ3SL3YbNcqNW7qjjR8IlteYx7dgdvUc6BPQ8IEdhh3XFEMxcgHuPauL/cPobA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=microchip.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mA0RhPBApekQeKhZDmYSmI2y5UuqHThAUm2Ab/gek40=;
 b=pKjW4uVrActS4251v8bMYov7CyyHNkyazLGchPwiTRK9UO/REhEMDj2OdmuqikWj0KYcETG558ogS4ApCXYVeuwI9ctWcJAHMpHEJEtrTBEsGNHgH8eiLcFW+K1sjiXkoIerINIUa4IvP5M3nSvLIZcbG99djSyYx+b46yNtqJ8=
Received: from MW4PR03CA0266.namprd03.prod.outlook.com (2603:10b6:303:b4::31)
 by CY8PR10MB6562.namprd10.prod.outlook.com (2603:10b6:930:5a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 19:23:38 +0000
Received: from MWH0EPF000C6187.namprd02.prod.outlook.com
 (2603:10b6:303:b4:cafe::a4) by MW4PR03CA0266.outlook.office365.com
 (2603:10b6:303:b4::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 19:23:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000C6187.mail.protection.outlook.com (10.167.249.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 19:23:34 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 14:23:05 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 14:23:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 14:23:05 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 653JN5Mp2372249;
	Wed, 3 Jun 2026 14:23:05 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>, Jason Kridner <jkridner@gmail.com>, Robert Nelson
	<robertcnelson@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 0/3] arm64: dts/bindings: Add support for BeagleBadge
Date: Wed, 3 Jun 2026 14:23:02 -0500
Message-ID: <20260603192305.1347908-1-jm@ti.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6187:EE_|CY8PR10MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: 354ca2df-aaf4-4670-17fa-08dec1a59b20
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|7416014|3023799007|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: jaV6BkWpdQ8KDNfCfZ5lYAgV0rpSRNwscHnBV96LQwOwfCC5fWmFu64+UMjZac4cfoOtIoFmfceGppGxW5w6iLacHI3EF9AyPXB0WYXiwhs0wgfevXBZO3XzPu1eMB4ECb10lpSY9nIhweauLpGBQpUKQIaE0wfoBY4tbJ1BHDkdu4zuxBJds/hK2j/VRZcg0bMikm6JHModYX6VbeXFPgRfCtgCPjEFJBtV7qOf1sA1x+6b/PhLzXxQUUTc5Jh/9ncGdj5S9dT0eJv8qAaa58LMG9JzJcIPhtpMhhg1CwT6W/5w1PIwd9GG20pIPxZ6Q5p72R5UxflNOo6Nu1IWleOuPK7A5hD4pvC4l84XAbnyUFPf2KioImDb2uDPAUMqNmGdYdwe6gJvTDYJwljBOati7wTNyex3P/OVJ15t38prPTQ9PFuIfrZEXHll2lAlWKxM33RCjf46iR7nqFJwi008shVOH6F7+JQJOYcSJ/7/QFT4o5ydH2FQN9OwnHqcha2+cLZRYZTlmDBcoWeRvbV060pptlP5Ru0OhCg9/YMQF3ZZF4euXIGgjt82ld0hPLUh8fqp5zZNDeK3SSAtWX7mdNqNXqr0XCN3Zk3Wu9PPwe4BoLMkkjjRk0MKCGge+rQRTSZ0CESLqJT7I7IHmbNT0pwHXtT5wjvS3rN/uywgh3r3qnf19NhJ5zAOj/FT
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(7416014)(3023799007)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bJiJensHrOYmRdQoq+zO+MaLlatRb+DKsUtHS29yzpyprRySvqlvoOWbaSmGIaos4f1om9k4kTWdH4XcHPDZOPqLaeTcHe8czn8d8IMpz6RMW7fP3IgvYnbEcg8F69DdLYmB9tdH6IpzQew+fa5uoADsyIQgqHVUqf+ucV32AXARDBHEINwAut0JzvhlQ/hA8e2ZLjWTrjTQkdnoGFGHRI4j4O9U78aqj9Zte1LxhvWODouankRnC79UzN0XViA+gwlrb9Lu/RNMdDFbWPJwzbmZZNghzIvIe2xFQrJTUPgs10gCjSREY31cdfbkQ+L8jLi65ELyVB0x1VGhKaNDy74URLkRT85vecO9WHsEz6ipHzCIxEtv5zD7RKlkmw26lEFj9INSE+ryuSI4BKFMavN6B1RvivkIv0coVMNi8SJzkkeKsGk4jjLJMgh74UR1
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:23:34.8258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 354ca2df-aaf4-4670-17fa-08dec1a59b20
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6187.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6562
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_122343_199996_ACD5FA6D 
X-CRM114-Status: GOOD (  10.04  )
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
Link: https://gist.github.com/jmenti/e9e95848336fda0e4b5acb37f2fe64a0

This patch series adds:
- Device tree bindings update for am62l3-badge
- Device tree source for BeagleBadge board
- Defconfig: drivers for BeagleBadge

Changelog since v5:
DTS
- Fixed aliases/chosen nodes
- Sort Makefile items alphabetically
- Use dual license: GPL-2.0-only or MIT

v5
Link: https://lore.kernel.org/all/20260526235417.1326187-1-jm@ti.com/
v4
Link: https://lore.kernel.org/all/20260515153541.294698-1-jm@ti.com/
v3
Link: https://lore.kernel.org/all/20260513233447.2713737-1-jm@ti.com/
V2
Link: https://lore.kernel.org/all/20260508230341.1891450-1-jm@ti.com/
V1
Link: https://lore.kernel.org/all/20260501233148.4180391-1-jm@ti.com/

Patch series depends on:
Link: https://lore.kernel.org/all/20260513231154.2703292-1-jm@ti.com/

[1] https://www.beagleboard.org/boards/beaglebadge
[2] https://github.com/beagleboard/BeagleBadge/blob/main/design/BeagleBadge_RevA_V0.7_SCH_251107.pdf

Judith Mendez (3):
  dt-bindings: arm: ti: Add am62l3-beaglebadge
  arm64: dts: ti: Add k3-am62l3-beaglebadge
  arm64: defconfig: Enable drivers for BeagleBadge

 .../devicetree/bindings/arm/ti/k3.yaml        |   1 +
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am62l3-beaglebadge.dts     | 657 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   5 +
 4 files changed, 664 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts

-- 
2.54.0


