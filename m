Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064A5D5E146
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 12:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pLQBktSvQK935hhPJheUfFamoUO73ROv2d9bPTBWN5U=; b=of7dABqqFUhBtW4Pczc+/RNo4a
	65+iXg3QAud2H7cYrbJ8WihnL6iMR2L9N+0JESGhzpdQ7MIR32rnnmkbzZXLRCpuscL/sMFRtfkBX
	W2ahARxSXWZj+LXYmNVVn2UCO68Yuuj3XfKrwhmqhK4jYs5eI5DD69G2NrAGNdiP7opTTab2eeLtC
	pA/JRWRcwk0P3OP68eLJuIm59HlDen/95nRfab9F8ZhnlL+ROV53HVwnxtHxbYB8TxchozOwk/ppv
	ZV5D+5Tp809xzOcC6mrVlrxZSttaskG6wq9lwow1KAxqEKnuIwArQjHt+CclmW63UHYYbCjB5xaw9
	2uQspaUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVUCW-00000005BPK-2iT0;
	Tue, 16 Dec 2025 12:30:48 +0000
Received: from mail-japaneastazon11023082.outbound.protection.outlook.com ([52.101.127.82] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVUCM-00000005BMy-06EU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 12:30:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yfBtdzkWojmttns+KOLAFrmhmzAu6CBQRSflIHw9Ko5U4+nrOhIPHjwOdhuBCJT99y9iDjDnwj8rHOU+l2M6yFuOYgOFB3ppku7Q5GcQdgo9/0xkEtJ/NHvmSPApujaesnVsMvkclQ3wF6XgoFA7guUL2Vsd/thWN6XTYjZkU0c7VUaAGw0+7wSN87j3LXX3ZkH4bdaWsXEUzN827VZcOHa3iMnXgmk5rw6M2fHQPaTH/QIo2OeHT6Q1pX1zDwDA5NF0bCRF8mYTDyB5M8lgtVFcof6zC6tZKIusMx492i5yoNIDi+suhiGt4iEh/QnWMnR3dstgVz3EJhSgiuKGxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLQBktSvQK935hhPJheUfFamoUO73ROv2d9bPTBWN5U=;
 b=gIeybLWkSCpQV1ZKLER8Vd5huFz9zjsWOxx6T9tqwuMhB0ppzaRo2vE1IwNyBWEF5Yl7nmZ3hY3UO202U1JuQpZq26p5HDa3orM6OYKk1kY/H1SG9SVfMMycCK1YFo0NWvANtjXpOwyfZuAjKu5ny7tgrqQL+uMGUtm2Paw4i4DOYPoM0kMibv3QMHWPHp9xY8kj6NisjdhWiTkiKZ4XpmmDxK6/A+pAJlzZsJV0Lxmdu6NAjUcy8DQo66nuF11ZyxwASb3y10MS+dy482WZqgw5euTRSKJPHrEAUa6y88798IlJ5/brsRBHV7Un1sxG+rXNcFapMvsbF6WNiCNVrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0029.apcprd02.prod.outlook.com (2603:1096:3:18::17) by
 KL1PR06MB7330.apcprd06.prod.outlook.com (2603:1096:820:146::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.13; Tue, 16 Dec 2025 12:30:29 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:3:18:cafe::a6) by SG2PR02CA0029.outlook.office365.com
 (2603:1096:3:18::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Tue,
 16 Dec 2025 12:30:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 12:30:29 +0000
Received: from guoo-System-Product-Name.. (unknown [172.20.64.188])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 27A734143A8E;
	Tue, 16 Dec 2025 20:30:28 +0800 (CST)
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
	jelly.jia@cixtech.com,
	Jun Guo <jun.guo@cixtech.com>
Subject: [PATCH v2 3/3] arm64: dts: cix: add DT nodes for DMA
Date: Tue, 16 Dec 2025 20:30:26 +0800
Message-Id: <20251216123026.3519923-4-jun.guo@cixtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216123026.3519923-1-jun.guo@cixtech.com>
References: <20251216123026.3519923-1-jun.guo@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|KL1PR06MB7330:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cfc148fd-2f84-4bbb-b353-08de3c9ee60c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fqdZi7/Az2fywWINyCOTXvyKLDu5Xp8gXz3Y3Mts6RhIfjbMhdtpF62+8QgX?=
 =?us-ascii?Q?E5b71syNh+vM56supG1qSb4LN2HbmlBzJph3UXxh5zAlCJrDRcrCsufVZEnp?=
 =?us-ascii?Q?TMc6BmLljf/GqQ/YsXLSW0bCPHbrhDPJk3ZVHeIm+1tuk2asBzGWLOFc49GR?=
 =?us-ascii?Q?IdRAG+cfKrVyh0S9KYwSWBZn+Of22318CBxy7IrfIPpIZ99pPD0aY5WKZvn9?=
 =?us-ascii?Q?GBtuumZClUioqfDUjU6gpFWWPaFhKgrsazN2bGPT6m26QLByXVHqLrzBjZ+4?=
 =?us-ascii?Q?YpDujZj/Msmiut3DdxTk/M+Rv73AfbAClt+E+fEUx8NdMhq5+sVqi7EHey8A?=
 =?us-ascii?Q?ixvCNVen39Sy6ed1F2oDqUvM9LN+Opppk2wSQpjA6mIdjJKY/K2Tgk+m97nK?=
 =?us-ascii?Q?3Ddf5iJD0IzARkZtZNbUwhO9MdZ+mc3C5tOgQj+h2f4nZiNwxH5YRIfZ3pyt?=
 =?us-ascii?Q?b+thvM1Lm8RtyJ7P9oCe7qpzpnrUaomdLpnDRxId+v/lINgaPaJl57qC2N4R?=
 =?us-ascii?Q?BEZznA58n3rkHSUWl0dW+YZACx9yWKcFX8kUwIihLzKWXxym1f3fqCtOKQdm?=
 =?us-ascii?Q?JBhhFcgwQEZ4iZE1FQVddD2fbqbl2+xdxiK7ZyXtZp+vxT7w68OtZQAdcoyQ?=
 =?us-ascii?Q?jzSAYbejRnOVmCgzzwO18WbtqmmhamVLx5WEvExhdp5sSgSegXvzXbw7bSJq?=
 =?us-ascii?Q?mMBuIYWq5QW7SKjnkCYmkJCtYjFKuJ5l/sCE4D0SMkmmATdGuVq0u6jyRbRI?=
 =?us-ascii?Q?ZSg7v5I2PfZXfbubVpgdVyW89+3enbLcx08AzUaU/dPGbJ7CMYWr0c3W93jG?=
 =?us-ascii?Q?Q9MSecy7gSCTMTJAE3LO+UUFFWQ79dKwcp4ng2DVjLTxbSyn9Rxuwm8BNWat?=
 =?us-ascii?Q?Lxb2L1S4k6ws7Vnd19LVmR6Qi1DdqtIzooy126ZBi4vE6Vxk3TWD3XzXwOq+?=
 =?us-ascii?Q?l6dRTOX3orU5h9cW9UUsNqz6YZWuk9N07cQ2Tv4DcrlPBbXDX6qwUP90fSso?=
 =?us-ascii?Q?Nlr4BUPTFipLy74a7Zk48tXOmNung0fy2fyhZSguYmtu57P8U8q5G7OdIFin?=
 =?us-ascii?Q?JtTNMIJ9B+I2Br4oe0l70wlXuExRINKEXc5W/917wHo/jAYw7Un19MZrmP8S?=
 =?us-ascii?Q?MXjcDhKnDdNbmFcL2AL68p2UJHHTbQUlXhTGuQ+qWfWKMRJPCP9vc2CAYUPf?=
 =?us-ascii?Q?H4XR0MpJMQ7yHRv1MdVEWR8iDJeZVl8tlbU8T1JgG3LBEZ+te2EU17nacFAl?=
 =?us-ascii?Q?k2pz7VMlWZWAB673uq+iJfh6dgdz1KbkAur51npAsQ73u3vGPMjs+UEqIwu1?=
 =?us-ascii?Q?Zv6IwlCkzzujvGPwhxRSaApb9NxyLTbjVIKzeq0wA1qOzToyI+iuLQdQYdyZ?=
 =?us-ascii?Q?vxJpHmvICgNlNPPDaBHlEbmmdlrCrudxV/no0k/kkdZas2SmyKLP7XI97Erm?=
 =?us-ascii?Q?MI2LFzAhfii11NT/qlAHXEo7NWIZliasX89hqev2VkMDw588nYShBAnRzL4U?=
 =?us-ascii?Q?UgGNLPeq6Lp3BWe1oGFgtvjmtchQx7G3FWdZ0gKnadrBw8qZ21Oz1YCuvcOZ?=
 =?us-ascii?Q?sU1zTQlgMVw/eOIAU7s=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 12:30:29.1384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc148fd-2f84-4bbb-b353-08de3c9ee60c
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB7330
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_043038_090060_BEA68E6D 
X-CRM114-Status: UNSURE (   8.03  )
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

Add the device tree node for the dma controller of the CIX SKY1 SoC.

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


