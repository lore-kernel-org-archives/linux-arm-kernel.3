Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B467CEBF93
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 02:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9T51rEHmzcw3Q0pJsCZPD77uKfAnIP9wY7pUYjE5znY=; b=hP3HQFfKgMeAZSNSGGf/YpT6mO
	jJk8p19FQBtpesNqmy3Ymht/zJyxKQkFbh4jQ/4wToxHhFinCe/8e8a6yWTHkWa5Bty3BHySoxAc/
	VfNlsCaD4q8bUcJ3mmTmeE7ZfXaTyBgfLS/EZwzAw3OLwk2rEaxbJerEXQH3qXJno4FcWxEmrjnq7
	KSLdjHevdRZBvlTYJ3l1WfUFm/dkzdkPMl9+qdFiqQe1l1OIPRVZZX/n/tYr8sswP+bYWwCJFRuEp
	ZBUl8swkSWAFmoP+3sK0aphKy8zN0gHwt+2vjWfmmz6YSPl5fOBLNRUEPjiLxaNi5xSoNWzSTfW0E
	IRPy5EiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKoXE-0000000FHVI-0lZU;
	Mon, 17 Nov 2025 02:00:04 +0000
Received: from mail-japaneastazon11022114.outbound.protection.outlook.com ([52.101.126.114] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKoX6-0000000FHSQ-42F4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 01:59:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzSdD9EOXIKdk1xTKKE82Afq4rpCKRmyiKr4IwNodpte55tVMaOfZAObGitqPJnCy/l6i0XWVfCPcSGbcIox4AmeXHRJdFG45vGRuPMSr100fW95q4QH+IyoYhmHY+sM84UuZ0bI1SvLB41UTFDJVs2aYgjoVXh74rkfUtFP4DrRb+j4VY8+zVjF4rR8HKZGarfo4OFtFHdLbtNwxC+cy7LSav/Qb5lZMbjS0vhhPapIsxrPGMuoablTME4qDIosnEC+9GRyjp+GC3qORwEghhJy2G/GI3RBPxmVZYbTlSDLSA+OyG4Qq1HhcotrqZj4TH51BUHpUa+qjvpwiaQyYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9T51rEHmzcw3Q0pJsCZPD77uKfAnIP9wY7pUYjE5znY=;
 b=uyWI7SmJT8QsdOINKuM+Ha9Gaqs7d/98gGjJs+fSsaE1ooBlWKRM607nyqcaHQM0v4k3AAzU2ziL/EO2iuFrv1S2qq90buvWKyPdQVAUx92RVfCu/x/VkOAw1+zAWz4L739RSROiiA0kP22LpDX7swruB4WPfnYlJtvAoAnD8RJlxAToCKy1D3aCqo5cnQOgtAWUiIeItWrgfmd8Ys2Hy11UfsHZOAnJalmjoCHdxOfTHwi4niyBaKM49OoXSfG3dyr28awUqqlJTtdm3lm7xb9kwbUx3g+r5MGE4BI62UImh0132qn3gaDFd7hb1hM6kicKefeLhSDMRT/QftoDfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR01CA0172.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::28) by PUZPR06MB5851.apcprd06.prod.outlook.com
 (2603:1096:301:f9::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 01:59:47 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:28:cafe::3f) by SG2PR01CA0172.outlook.office365.com
 (2603:1096:4:28::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.21 via Frontend Transport; Mon,
 17 Nov 2025 02:00:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 01:59:46 +0000
Received: from guoo-System-Product-Name.. (unknown [172.20.64.188])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 54FCF40A5A2B;
	Mon, 17 Nov 2025 09:59:45 +0800 (CST)
From: Jun Guo <jun.guo@cixtech.com>
To: peter.chen@cixtech.com,
	fugang.duan@cixtech.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	robin.murphy@arm.com
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	Jun Guo <jun.guo@cixtech.com>
Subject: [PATCH 3/3] arm64: dts: cix: add DT nodes for DMA
Date: Mon, 17 Nov 2025 09:59:43 +0800
Message-Id: <20251117015943.2858-4-jun.guo@cixtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251117015943.2858-1-jun.guo@cixtech.com>
References: <20251117015943.2858-1-jun.guo@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|PUZPR06MB5851:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6505f19f-65e1-4fb3-704b-08de257cfbf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PE+4X9jvHfRUrXWj3ozGU/v7GNu3s6hQDeNCnaCveCOmxrwSS+NSVBMzdbd9?=
 =?us-ascii?Q?uGf0+MV/0uNQ/w/oQULWtu7EypQcZUZ6T4jOD4VNqyvMwDAGvYmqEtfgQQkN?=
 =?us-ascii?Q?QhvG9wrBX2gyuXcH1S8yyN4xHWMSkO5wb8Fuql9pPq35A7LJn5bJAMvL7440?=
 =?us-ascii?Q?kD6U2QnlrBEvVHq/9z7xUydvLD2CPN2HguwwRp9sOQePQFH3G3MWpmVuwbrT?=
 =?us-ascii?Q?+Pr7wKyUdB/bVk+EIHG5dFM53zEZiSYieldNOq8/fu8J6EjtCmGpVrqbQ39c?=
 =?us-ascii?Q?UKeuISjvMHh6OdV6411wGRbUeSop8xk0EWAPZf0NotiwXIxYHfJ8NsSoeriL?=
 =?us-ascii?Q?rwG87Pux2FtXBupc7rYPlO0GoB28n7TJ4AHAFCtVhSCm61Icz1UWbUJH4UuT?=
 =?us-ascii?Q?WD6rEfh40h2KTGw78RKDkCfdELIQT9Rzrsr+l+p29Z1SNiKUiGwJO5T7vGyc?=
 =?us-ascii?Q?/WrHhEDCiuadZpxuYGyPpHH3UmWMG+6OLfVQsa5835OiEl3bGnNRZWp2gtv8?=
 =?us-ascii?Q?OCDFWNnd510pnkMwH3OPptKYch1uw7erI3/G5JzLXLixEkKAvvNnRVQY3j2m?=
 =?us-ascii?Q?ORLIisMPhOt9P8ZJNsJRHuZgD2Tkw0DC/KoL6rrsonn8FUhVUtl7jmtaBqKK?=
 =?us-ascii?Q?x2aA+NcszuG1viv0DdLTYItU4jtGbQKobg8KE7YmLmL+46kDw/XCoI89cJNR?=
 =?us-ascii?Q?dDPnctVmAU4weYc9W/+gYMdambsJ4eZccKaoYBykTLK7fW67AQNkiNxijYSX?=
 =?us-ascii?Q?3Y7eWvZpc/gE2gFxnSI4MFFFJq6cPguWccStiIOiUPQ6QpfIAtdjO64ogGdv?=
 =?us-ascii?Q?HUTYj+peBxycWhlYO2oEjWbpFUgVYTvKvO1NkdCmPraZDK4uZItyyNnGyJGi?=
 =?us-ascii?Q?+6wY2V4cYiN2koov0HAtq9YKRyPFQGgzwRK7gXCYj8wlzkM8Gn0pEQ+jWnn1?=
 =?us-ascii?Q?AyFWz5d/8Kv45cZTK3pmQe4GZdTlXPMJL5Rzgvg/M7NQpmWH1jw4WChB8YwE?=
 =?us-ascii?Q?hGqInlEVVYbL9teOWBGyhi6CPhalKGcm7ruAGsbF0Py8dnFHA+Z+15E1oSE2?=
 =?us-ascii?Q?Og93BjMz1ZX/Yl37cM/ECX2sAR1oqfUdDVQQNHCBSIn+MVJHz6wHfZGVElQk?=
 =?us-ascii?Q?rhg1tN4tCGWKQR8wkzyuWhBzF+/xDRjsy/9cWdWm63C3E9Q+ZZrxo4FfH/ht?=
 =?us-ascii?Q?ScYTsgXKwnW6hfYDjFTHFLkgWfq8j2u/ewUBI96+ipBgJAjgJRkggX5M7RPf?=
 =?us-ascii?Q?ggW+8bXxSL/at7tENnZRFTfRNbnucaoj9UYP4RJos5NZV0nOfY7BEDie/54l?=
 =?us-ascii?Q?Qx4/+Fungd0YLSrcfUstpz5oc6bMa2rSlaBbTcZ7K4nueCVY8rmHMoqhFfaL?=
 =?us-ascii?Q?ck0gQxqHF3CXxHJlB+u/5Q2ZjoS9Wd+AqXR8Sf9o1ppaPBoXLF+JS/qEzA/8?=
 =?us-ascii?Q?ZeSl2Abz2BJFFCqswqSGhDfYInXERU7EdMZQYFC9sL2LDgT4DIUTGGTmoJHm?=
 =?us-ascii?Q?j41skx1cq3xo4/ANUrlOYPdGaQjHyXJPyNctITvLsgGdbdR14g3C9R37aHNu?=
 =?us-ascii?Q?7sH45E7BRxRjBVbuTWU=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 01:59:46.4495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6505f19f-65e1-4fb3-704b-08de257cfbf0
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5851
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_175957_105401_6C16A208 
X-CRM114-Status: UNSURE (   8.46  )
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

- Add the device tree node for the dma controller of the CIX SKY1 SoC.

Signed-off-by: Jun Guo <jun.guo@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 189b9a3be55c..8bd7136e822d 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -353,6 +353,13 @@ iomuxc: pinctrl@4170000 {
 			reg = <0x0 0x04170000 0x0 0x1000>;
 		};
 
+		fch_dmac: dma-controller@4190000 {
+			compatible = "cix,sky1-dma-350", "arm,dma-350";
+			reg = <0x0 0x4190000 0x0 0x10000>;
+			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
+			#dma-cells = <1>;
+		};
+
 		mbox_ap2se: mailbox@5060000 {
 			compatible = "cix,sky1-mbox";
 			reg = <0x0 0x05060000 0x0 0x10000>;
-- 
2.34.1


