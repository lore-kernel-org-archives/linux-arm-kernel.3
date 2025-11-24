Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C62ACFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 06:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3VQ5M4Kmtc+TWGoRAwzWfTGma9Dl77J/P9PvcN8pii0=; b=utynIjBWGZjsyhU03C9l5WNsGU
	5hCHjSWqfxPIeH0zy+qINhJDvrCInEF55WrXLId35x++1l21ffeW/27nbPXbgounF+SO1fjMZJ6G0
	C/pC+iCYuBYGsEW1yWUlKJ2YT/1dhWVPVcAJ/2h0PQEPwWnFQ1r/t6/ZtYsS7t++58bvj94zjw7mr
	uSxK1hXyNGRPyvbGUq1TNKfsJE3UISwpqaYMFAkCtri9DD6wIEu80wvI3mnL1SQ390hzRxx4jnFhI
	xvPQdR/wjINxi3Q+yN43vcgeS+W5wP0wOiHMz/zyaHCftJxQYqKUhLMn0mStdNDmDoN7oZjtsxUSO
	lj/cCtgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNQ84-0000000BAUM-2AOt;
	Mon, 24 Nov 2025 06:32:52 +0000
Received: from mail-japaneastazon11023104.outbound.protection.outlook.com ([52.101.127.104] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNQ81-0000000BASb-1mYI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 06:32:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D02gPUFqWa9lIlAfR12CdsUvE0W/2RzB0PiY1YkqRQiYON3YKPbcBbz3cdJx8CVvTpRZJNsUzHOlBKwpnPEF+sR/D2TObS7o4Xg9FbwMA124tIydxS/dZiajU9/S85RexkoPxb9l5qxxT/VIjPLI4X+BH/SisfYvStudtxjZMbgnApoioAkJ0zb1ArsVlPcdaLwOVYRB5jMhpe90CmJ5I0c+ZzLGhsJBqHu5yh8AetPJiyfBQuVgN6CRljuuyZWkxabPojACcDHH6bJnxkNWVULQJ4ivlAjJjsEKuFwLvN6tPBnMPiWwGnwI1jQ20lEEmQcGVSa0COOh6MeuOz4ZTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3VQ5M4Kmtc+TWGoRAwzWfTGma9Dl77J/P9PvcN8pii0=;
 b=wk4FbJEbl1XZVUyiVnnkp4lhXksXstAT0GYILEt7p37tH0QrOyqrZSjXpe8fJsCZNVeOB7lwOKKQm78MomHYNAazDH9VyPklnd5iF3XH/+V8rRCFQA2DZvm+8hxGOcxjiYUNnBG9wfyf5ZMPct0YR2e/JWnrHa+HgFKSPgIqtPAi7Mvvl25vNFV7/HfN7D9sAQyP/twdfNrh13zuEQanStDK8A78bWGMFLNT3S5tvY6rn6IkQnWAMu9NifSwUXyrApg5j59oyzZVuXjIuNQXpoAqnn1IbkSX7vBbBy6sZM0JvC/H7yjaggleO8aE+msVB8VPMtRc0QT34n/ZHt/JGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUZP153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096:301:c2::14)
 by SE1PPF4D95A16FB.apcprd06.prod.outlook.com (2603:1096:108:1::414) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Mon, 24 Nov
 2025 06:32:37 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:301:c2:cafe::97) by PUZP153CA0018.outlook.office365.com
 (2603:1096:301:c2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.3 via Frontend Transport; Mon,
 24 Nov 2025 06:32:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 06:32:36 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B8BFE40A5BD8;
	Mon, 24 Nov 2025 14:32:35 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v3 3/3] arm64: dts: cix: add support for cix sky1 resets
Date: Mon, 24 Nov 2025 14:32:35 +0800
Message-ID: <20251124063235.952136-4-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251124063235.952136-1-gary.yang@cixtech.com>
References: <20251124063235.952136-1-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|SE1PPF4D95A16FB:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3e3cbfa1-013e-4a6f-5f7d-08de2b234233
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?meB1lpPy5pUFUr9bfV58kp98cRNdmUeF5gRgDR4sGh22x+BEmllpAyw42Pyx?=
 =?us-ascii?Q?TKn+827g1mJGNc4VTspadnPznyNShXn7V1sp357Exj3/x9CkyktwnAkUFXNm?=
 =?us-ascii?Q?tHehlspBGvN2GCLYujFXGUZQTv9ffbhQ4YsMwPlnvqXicGg0g+KvuusfWHL2?=
 =?us-ascii?Q?pYCUovOL1Fh3Ft3TNaE/I0TfXFcHWipipKRkPhA+Nwf7x4SCKYPE6gYVGp7x?=
 =?us-ascii?Q?LYxJCeISoNSRpS3lbNPTq5xItQhYCl7XnjkzyOQzXPUuIZYgUCWe5K6Q7ly6?=
 =?us-ascii?Q?xKj5VgniR7U+NHi+1HMoiZSyBwGedf8AhzRsSS+6uiVuadiFsGUJ/Av3AWtq?=
 =?us-ascii?Q?8qLxr+2OTIHPMAys8QsTKkoBqZStVCIP9EVasXzaZVPjG5oV2/EegkiNYVB3?=
 =?us-ascii?Q?gXmz7P2SycWn5MD+thlRZJTKmknw4KgAT70rSRDyzn20hFXqVyPH/iSZPNcv?=
 =?us-ascii?Q?YlTYX3mTiIVimVltPmtpYmGYz499UEyqCctO25GhvNDRwuG6wz1K7mcadpdX?=
 =?us-ascii?Q?QNqsb7NMPie2CWZRBHkNGJso7QbFNe02BmX5PEfFmvbcE9bx33kNJMNr6TAp?=
 =?us-ascii?Q?2ULnO2W+y+9jW/f0g2CPbR9F90vIdrfkpHh9CZKgeq4U8wjt56W9ndgz9FHP?=
 =?us-ascii?Q?K/24BogAyGGpJam16F5gntxiRFXy8xFhaOv6O1weWgZ6qYoJaRNa8YMY5Toy?=
 =?us-ascii?Q?qR3ypLoWwUSgstf/C8PZrdpGOiDWY43s5lYd2T14+mSq9uU5nzpc4Y4DPpi9?=
 =?us-ascii?Q?6l4pDOlzvkvIfIN6AOYCr4hQxxl8SSFtrYBal8rRvyN6K+n3WPrziCzPo12U?=
 =?us-ascii?Q?h779LhjVy62BjFdFVD+BiaPDq6BfwQjPqkp/njAnYK+xdvbG8ospS6h5INEa?=
 =?us-ascii?Q?moNbwhIcRfUXSjaYgoQ75F7qGsyT7SlgTynod4rc5n7AR3hWU9ldNGnPy4Sq?=
 =?us-ascii?Q?C2D3ipxIsz+umBjIYSxZSJFXxywZiXaCYjaM843qgB7BHs9aEjaKaPMw+92Z?=
 =?us-ascii?Q?e22mSzawWaPqG7IolBLFuQm7ggo2Fbk79wbw3WKLDH8SZ+GTszr7NhhlP6ip?=
 =?us-ascii?Q?sp+R3oUOvQS+9ihxl1YQyXhWxyo6Y0mzS66saU4Vm3OnvHRenFl/ymkoZ1Ag?=
 =?us-ascii?Q?Ex02PTJnRajvDAQ1MKuWNp9KEnrpRA9HExHlRlAUUqoo0xdbMs8QaG3LtAJE?=
 =?us-ascii?Q?p6rg9rBahzR2qm5vGUQJNmbiUDj6QErou8WzWyamUcZzeyabavk1RRX/e3Dc?=
 =?us-ascii?Q?HDdT4vSnbFEMSqaXCBL0P2XPuM26yzWV0ZO9dFj+CVLTkY/+AKe0trkzkgNm?=
 =?us-ascii?Q?ATy5ZGCivvG80wl6f5Jt9F1np9rxz7o62Y1fDCiMGys/Fy6uy9yBdVYUk46v?=
 =?us-ascii?Q?ERkeDEhVfCREkCvcu0CKv0sajMnafLIMEXfN/SlENx6LP/VDEyvz04xhi5u+?=
 =?us-ascii?Q?DekBM/oAFdOzvTIJB9tO0N5eT6Iw9Fb6qnAYUkNA0KYbkumbdGuKMWmj8yKv?=
 =?us-ascii?Q?zCMtHKueH7nAhOaE+JoJ4lzWdsGkXPDEuK6O4bQfNAJVcgqDZKxeWv7bShAh?=
 =?us-ascii?Q?/2o86xSFV8uftuFvFCU=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 06:32:36.5626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e3cbfa1-013e-4a6f-5f7d-08de2b234233
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPF4D95A16FB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_223249_462736_C886F528 
X-CRM114-Status: UNSURE (   9.39  )
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

There are two reset conctrollers on Cix Sky1 Soc.
One is located in S0 domain, and the other is located
in S5 domain.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index d21387224e79..72ebffe05ef7 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -348,6 +348,12 @@ i3c1: i3c@4100000 {
 			status = "disabled";
 		};
 
+		src_fch: reset-controller@4160008 {
+			compatible = "cix,sky1-rst-fch";
+			reg = <0x0 0x04160008 0x0 0xc>;
+			#reset-cells = <1>;
+		};
+
 		iomuxc: pinctrl@4170000 {
 			compatible = "cix,sky1-iomuxc";
 			reg = <0x0 0x04170000 0x0 0x1000>;
@@ -568,6 +574,14 @@ ppi_partition1: interrupt-partition-1 {
 			};
 		};
 
+		src: reset-controller@16000304 {
+			compatible = "cix,sky1-rst";
+			reg = <0x0 0x16000304 0x0 0xc>,
+			      <0x0 0x16000400 0x0 0x10>,
+			      <0x0 0x16000800 0x0 0x8>;
+			#reset-cells = <1>;
+		};
+
 		iomuxc_s5: pinctrl@16007000 {
 			compatible = "cix,sky1-iomuxc-s5";
 			reg = <0x0 0x16007000 0x0 0x1000>;
-- 
2.49.0


