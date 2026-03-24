Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA93F54ABA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 14:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qp4F62IaPMuMShl/wj6oYqmOH3ELwW6K5k/+65E+pMM=; b=A1wTgGo1C+XJUxG8Opi91LGEos
	kbVjW6vtwXhtZp4Of2MujDcWHRlxVVj9JoDGv7/ticzzxzLAssr1gdLiwZVGDqV8uQ7ByWxQtA0QJ
	3K+cwvUURjBGYYsW47wiZ5M8J3heE8lUI0SXl9ZPY8tN4nFcOlPupPIn/xr7RWPwPZv0IuxBkexav
	eaw/CwqAJp2RzoJDMhLu875NvZNhKUgkv4Urce4jF4jV6zNNw4RUae66LotRjPUQZwt8/gHKbXXAb
	WmHMe7SDPtAl+AV+4/q6isq71xW94GGxUDdkqIzjhNHy8BBVoMap4f8VZ4AvZ5CYA9/jsDu2k3L7z
	TQVwvmWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52Lo-00000001bYZ-0iat;
	Tue, 24 Mar 2026 14:03:20 +0000
Received: from mail-westus3azon11010038.outbound.protection.outlook.com ([52.101.201.38] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52Lk-00000001bYG-40wl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 14:03:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQ/o3pCvoUxh6eCHAXBYeA5DFsBPNw9Vzr11nP5CWoZDBCIgXviaX5+IkUalrpih+Du89wmyrFpZmYioFhiJocrPn/zbzld7JzueC1vZYlM//gS4fjIRQa1i96/FRWYNdbC7uW/yLyZNhDDVW5sc7v+Ud7yazU59fA9YoyjoRYaGNjYRuB/Aq7yRSkPyMNR+0CEcHN8MiVQ9Ak+RNJ4G2mVEZsyp96epyTWNMx8/mqnN3XE4jmFleWmembVz8xNOsqTdKf0ZG/+Frn30T0BP1I6mOcvlI6gF7m7Hv/Dzim5NDBh6/pUYmw7TY/KWMV7QXSLPLBoVHbllF2L1M24itQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qp4F62IaPMuMShl/wj6oYqmOH3ELwW6K5k/+65E+pMM=;
 b=IjMPyvrRIh0HhyABHcsF6f8O/4iIu58diEHXQdOvvDcqJEXELZYePsdueD+thqoZnm2WhZzKTlbkLOoDxTlJYdtDtqmfZokn0LroaOWw7F/Bgw8rt81XODa9dsRSfgBpbZ9KLJyxzezDdb+3VdlY89b9FHSRIW05PKxzv/2D9INUsvaTc1DFV0W1Yrkt9Kx+Lkc3s39naky48IgTpYA8mIUepuz7b/7Q5jdmlTutcrLTuAwBIvqgvbWAWcj531TPKCy2lZ1yZWbLhOfk5nF6YhE/2ejWQFffMh54tNdwPvY2Wg2J6Aml3WkBL5Pek2JMYXPfAQ17gl9vsC71GZg0kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qp4F62IaPMuMShl/wj6oYqmOH3ELwW6K5k/+65E+pMM=;
 b=EE9Oj5cz87f2hNr4GEn8WKJAy5yKXbAuEbOAAWg3BHkvT6U0vXSomEWEeEAu/utCSuEyxAlUFC9mlWD3QXPCEZbeUvuij/vFgT6syDnrRDJ9h4PsA0jtnOzFXsFJfjY7+hiUaz9MEEuCJHHAlykoHZgLxM0PPq5aw6qRkKqwGzE=
Received: from PH3PEPF000040A6.namprd05.prod.outlook.com (2603:10b6:518:1::55)
 by BY5PR10MB4242.namprd10.prod.outlook.com (2603:10b6:a03:20d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 14:03:12 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2a01:111:f403:f90f::2) by PH3PEPF000040A6.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.25 via Frontend Transport; Tue,
 24 Mar 2026 14:03:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 14:03:10 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 09:02:47 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 09:02:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Mar 2026 09:02:47 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62OE2l2G2269372;
	Tue, 24 Mar 2026 09:02:47 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: ti: k3-am62a7-sk: Add bootph-all tag to vqmmc
Date: Tue, 24 Mar 2026 09:02:47 -0500
Message-ID: <20260324140247.1200631-1-jm@ti.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|BY5PR10MB4242:EE_
X-MS-Office365-Filtering-Correlation-Id: 55ddc0cc-0234-4fb2-892a-08de89ae1551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: r3+gAO5tN4uB9EeLF79teWWLv2nUlhQdnjFNOE5YCB05gTbfzCygUkW9/4YwXRl0SNee+NbT0jnVFF5cfeseKn+LUQ0F42UPmMKIPOn9y/SJ+CnnHqYZBl79xkP0b28XgA5x1+qLVf/AMcv5+x9jo44FauuLAj5YFtOrPEj2OFShQdwTmX3j3PSFeJG9iU2eDyE24w8ooNjhIzTglQZVO0voMYhhg4h2b/S8XCmSjUImbliop/U6q1CBWN4YATOMb0wPgYaCPdZtyjMPX3ANZq4Shrpxp0sRjtihOuy+UPRjCloXDgBC0l8UpOwU5hx+8wUdDQic1VQyIIabxQ0M8zPI1+J92z0FMv2uev/ZwILF+DOsVSwJ6m1pKnuvArV+Ai1b/nbUNyPP3+vZxOfT81hdjds21yM25eya7qR1Na3nyGHgKQXsVd63wW/wFCTwIa3O7+3F9sC49hnNX7GJPDw1KJQ1C9aH7YrkQAyUUnn0uNsr02zgpfTI2W3otJInPNTwtSd0DvC+CRBa4Uf5DEga3VVUtBedzMZ+JNNUwZCkXsHwgDlyXAN1aq5LBGTQ2/POcAyilizaex0BPtpE2WcS0PcGWwAylr1bVtHhV0MXqbS4DxXxJmo6ULAuSA6wYcP/By6bz5fx4B0/TGw4PaIrNOBaQMkpnIUr9un4sKm8ca3bZRy6AKlIEvJLfS38Pc1aiKFKv6gBOX+9wa2wN5TIlH7YDFMwStYkYYa0L3Z5AOKjDNinsI0MOnE8Q8hGaoBUxmqrrXwUT2CII3bDpg==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rYzz2xtrHraUZWRf8kizwRDwvapbL1Exo+PtlkKgzr7z5WzHsko/suSTRHmVD+QfoEsxrsrcUzbVWR1C/WscjmJLSL8HwTabB4ztGOkzlwIXTL987HSqgXBbeOnk01xp7slqikvsaf360WKu13OxWbmWeRg7BrsK7+HK7IPOnihHDIgpL676CygDMdk/D+Tyjd9qmHVx9+6m5DX61iUgZEbDjoDBtMI06qDfKqK/F4xi4oYZ/0Nv3jiqAIT9zbzFEPaPlWbQ62MNuGF0LMFEInlMrZXuHA3ZPnHVw96kEVfS14Q0a0xS5dnAVhLTN6kGGJTW8JY/M4zfeqa9+8O1e0F0n5UKjkti+YasJ0tv8Pk5RKxcRN9bFxO9MxsW+P2nOAuW76T6HEvGkePrNbIacp6pFS9sxuILHMgdhI2dIP1BfgIrcteCFHLhrpF9F7iI
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 14:03:10.7497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ddc0cc-0234-4fb2-892a-08de89ae1551
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4242
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_070317_119525_38282891 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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

Add bootph-all property to vqmmc voltage regulator node and its
corresponding pinmux node to make it available during all boot
phases. This allows to run tuning early in SPL stages of boot.

Fixes: 8f023012eb4a ("arm64: dts: ti: k3-am62a: Enable UHS mode support for SD cards")
Cc: stable@vger.kernel.org
Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index b1a6f10adf26..a085613cf123 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -154,6 +154,7 @@ vddshv_sdio: regulator-5 {
 		gpios = <&main_gpio0 31 GPIO_ACTIVE_HIGH>;
 		states = <1800000 0x0>,
 			 <3300000 0x1>;
+		bootph-all;
 	};
 
 	leds {
@@ -400,6 +401,7 @@ vddshv_sdio_pins_default: vddshv-sdio-default-pins {
 		pinctrl-single,pins = <
 			AM62AX_IOPAD(0x07c, PIN_OUTPUT, 7) /* (N22) GPMC0_CLK.GPIO0_31 */
 		>;
+		bootph-all;
 	};
 
 	main_ecap0_pins_default: main-ecap0-default-pins {
-- 
2.53.0


