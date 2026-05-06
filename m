Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAA5CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQXQY0Y9qflbIkJepHUf9YeXaRH3eIzGC+WS57V3IIE=; b=OZCFbnU7X7X5EeMK5hRgum47/o
	FV0dcGicHbuW+Sv7SpAh3D2YNWrqp+QYDVPs1aHJFljUdjb659ijbm0m3doUuqRuVwwoPbCuGmPcc
	2Vf2Y8nsEQrhFsDuImNqwGHB5P/BaegNWzfAUaI35qRfHn5khIFeFOXA+6h0P9EDE4/t2ZhjhsAzO
	uJGzCivqJz4+R5k1M5WiMbIxhN53zDNYVMoMkipMzUPJGlieA7e5ddrHUMof3cq8UO7QtJoqVavYQ
	JUfRivP3A7EEuDtKc5NsbNpRafJuUtDSBdmgzH6oe0xjTH+MNX8bjdEq71szhTx8pbigXQHlEGDRZ
	RKtG83pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcvd-000000010XW-48FB;
	Wed, 06 May 2026 14:08:45 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcvd-000000010WH-0ouU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:08:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLOIue+PagrBFKgt4NavwB9kQdovQJ98WucztHdQaq7TJrTxfGbTRQ1lN4ePwUXVHj3GAGSnJha99QOqbuzVb6r7wK+WF5g2WIOLn7PtX+s/eP4zQv0kLVM6yQ/n5DParF2mCrqS9RCnCfh2pA15JidKETmkj8MpyCfDzsHxaLTrHLFviklk9mMK9HpoZul43Z5KktbL3G6CjV609lhVfDrwNipun94TCNmvjycJJpKgO/qUjR7eucibtsUELY7Yv5wdFvfuxwe73SXAjB028rv69Y539wy6yPP9i1G+WxVVerd08Ee+O6xRycGd3Oe3ivZ7IiLT/IUIqZSm/kU5rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQXQY0Y9qflbIkJepHUf9YeXaRH3eIzGC+WS57V3IIE=;
 b=H1G2QHOBECbo/XtYncZOycurm8RrJnf/FH+KCI5rK9wT0d1X8y03w11SjJrTXG4R77QYtK53eG+Z7M+xUufeEpiXiyHKLAVIMYrkzToACSIMcFP7P4KpMuk+cs3SRqr4zmf0/1/SOJZCi05PPKUERaIagZ9kJESQlY4nvk6u9QyGjG1AyR2eac/aB4/9WgpYCSvsdsZHez5fsDrsShPfuG8zHCyMb9K0omD/hEuCXG2UgoyD9vNmJ6d82RZRq4SGPhnYwUdWHS1tfbXKVhwCIhZyQtj2yStbgor/rQ82Tek0AAINle1dUBlV0MVtC4JgT9VNKfJ2hqylBtcmgme50Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQXQY0Y9qflbIkJepHUf9YeXaRH3eIzGC+WS57V3IIE=;
 b=MTHf/+EUfOyAiDUSi+pOLrcHUExDJIzjO91Dxt1DcnW6+W2xOj0DlKXbLlhI05FfsLFeF2ube5YTK3Hh5LvzfZNYIkYE/sc9ZUhManxXIEue6dBtbI4Gsq8uBApX84sqEju4xqyfDl5+evCWDP39vEnfAQzaf9eRs/0neAqY13s=
Received: from BN9PR03CA0311.namprd03.prod.outlook.com (2603:10b6:408:112::16)
 by CY5PR10MB6117.namprd10.prod.outlook.com (2603:10b6:930:37::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 14:08:40 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:408:112:cafe::27) by BN9PR03CA0311.outlook.office365.com
 (2603:10b6:408:112::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 14:08:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 14:08:39 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 09:08:39 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 09:08:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 6 May 2026 09:08:38 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 646E8IWn1221395;
	Wed, 6 May 2026 09:08:32 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <josua@solid-run.com>,
	<w.egorov@phytec.de>, <matthias.schiffer@ew.tq-group.com>,
	<d.haller@phytec.de>, <francesco.dolcini@toradex.com>,
	<joao.goncalves@toradex.com>, <emanuele.ghidoli@toradex.com>,
	<ernest.vanhoecke@toradex.com>, <rogerq@kernel.org>, <eballetb@redhat.com>,
	<robertcnelson@gmail.com>, <afd@ti.com>, <u-kumar1@ti.com>
CC: <stable@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<luis.parga@ti.com>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v2 02/13] arm64: dts: ti: k3-am642-phyboard-electra-rdk: fix USB clocking for compliance
Date: Wed, 6 May 2026 19:39:34 +0530
Message-ID: <20260506141040.1368918-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260506141040.1368918-1-s-vadapalli@ti.com>
References: <20260506141040.1368918-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|CY5PR10MB6117:EE_
X-MS-Office365-Filtering-Correlation-Id: 54670be7-24a7-4260-d7cd-08deab78f928
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|82310400026|376014|36860700016|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: UQYm95/GtmKzyYCFjB3myXdXbVzEA3zFykU7h+bL1H8wKc9OEccSf3LH8cv4/A7TcnJd/QT7cfOWy2CiAdOn3jnXGKwijMbPYbUqnnFeqc855eZv+oRkrVO3xS5mq73Vx6tRjBMC2f8+1tUzoDSmrcdlYcUtV6UXRZLw2lObgdcH/7nUKCl6tmhZdlv5SP7krfiCV5ENOHRrHHI9nPnseD5WKi8OKBDQdzr4KBosi2jf3Rhm5BD4g5rIXwdXJ8OxAH4CeKdF0mR1YAHTnTIwTWSULpl9XZbUZQQaML5brDW7hmeh/dlTNN84GMoew6VvCpJgnhE4VTtXRlFjY5PjdSnG34jfBxnPyD8b85QAXvnTkefm0q4eVjlBLSe7owBkispc8HvNwwzs8LEO5oXTTf15ezfdT8Tv2Ol7yxkI/D49X3LecI1Hvv8YGV7Lhk8v4PplxxxgUlSpeyxgsRTxu3ZmdgFF7zrnJwkB1r1tiz7KTbyTN9bFiZ8BJibtfeQsEgdzP5J+AZX7rCg/BNNKF4y2ymH6uA8KihDQcLVvhww2neu7+Wv1cak6P6Wn/WRC8TdlUS6UDohdgwTqV6l2Jq+qDWNzuB2URfWEDNFBqJSCEGy61FJB8VI2AZcewkS7p75/MUVlCbcKLE4VCHRndtO6C4lwjhqM+uPMhDfflx5rvUt7lzXcA6e8Zssbz1Yo3VrRxE0R1lJwsv8ZMVVgDPykyM886+RB3GZxp+jw4kYCtFMoHBDj8ZGSCEacK11TTzE5Qy/QOk2gsg/etx1b8MsFAk1R65tNQ/rfekWPuYI=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(82310400026)(376014)(36860700016)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YnnrIjwg/Y4SqtlaRFhtCHK2OSSNMxLNek/202BrASHrep+LRdlL9iRKRjdbXp7TUmYkBq9N+dkbLY8alumZgFgOciDkxES5axUIoH10x+uPxqI1UJ62b+OHM9oLRXUggqprS1q7T7816/wi+79VFqLqhzqrYb47v9BjRwIH4a8DeGTEMcWSAbz4mxEt4Z9mMEEVsfjg5/Qd5pVnZ76O+y41IrYgZ5cpLgMVT/b/VW+xoP0Ur3cpO4/SLavajHCNNNC/vGJtIzPZtABhBkswC5OXtOuZ/atHowJO0LythwqYSzZRRla71LmhMCJFBeDtp0CBbEW3kPFWr8SqAcjscbixp8V+2KIb0GGf02lCBDW7uUMTsuir3TV5/e/BKo5BMb4DmaxkDyDPygyi6nfcV4dJrUn3IOngnFAYz+A3J2jOL6+oexdcbAhv8s79e6dY
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 14:08:39.6625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54670be7-24a7-4260-d7cd-08deab78f928
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_070845_237153_7875DAD2 
X-CRM114-Status: GOOD (  10.45  )
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

According to section "6.5.3 Normative Spread Spectrum Clocking (SSC)" of
the USB 3.2 Specification, SSC should be enabled by default. This protects
against EMI violations. Hence, enable internal SSC for USB SuperSpeed.

Fixes: c48ac0efe6d7 ("arm64: dts: ti: Add support for phyBOARD-Electra-AM642")
Cc: <stable@vger.kernel.org>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v1:
https://lore.kernel.org/r/20260505110631.1144200-3-s-vadapalli@ti.com/
No changes since v1.

 arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
index 793538f94942..a85d7d08bd1b 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
@@ -439,12 +439,21 @@ &sdhci1 {
 	status = "okay";
 };
 
+&serdes_wiz0 {
+	ti,core-clk-sel = <1>;  /* Select internal reference clock */
+	ti,ssc-enable; /* Enable SSC */
+	ti,ssc-type = <1>; /* 1 for Downspread */
+	ti,ssc-frequency-hz = <33000>; /* 33 KHz */
+	ti,ssc-depth-per-mil = <5>; /* 0.5% depth */
+};
+
 &serdes0 {
 	serdes0_pcie_usb_link: phy@0 {
 		reg = <0>;
 		cdns,num-lanes = <1>;
 		#phy-cells = <0>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
+		cdns,ssc-mode = <2>; /* 2 for internal SSC */
 		resets = <&serdes_wiz0 1>;
 	};
 };
-- 
2.51.1


