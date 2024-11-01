Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C08EE6B27B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 13:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WAABPIVurKV8VPJvRoXxkRaLdwKMufBIcvU1Z0Kx/pY=; b=S8h/mcI+HcgBXcUdUgs1MnJI5S
	qckkS1d2OaIQTjKIqihrfgAlq2hmGrwjVLQWqMgbdXg66ZEixm8FVdk+EwrtZRJtz0KzQgZmYZ3L/
	o0FytWNXAgV/+/25YOUCRS8nLmjmVU/rvI/rqC2NhcxO00J18hodOL/S1YS7Qi2LKLmUPEqX5RgLO
	OMVNPTcB59I/5Q3Xya3tVj3fRteT8rfwPQsPoGlcfJn4Au+ZHLRyldkybDi+mHrnzMRruT38b5nGo
	pP9qlDxPGLaTGZYXCCcVSg9j5qjR+Uu+r7jDZq6MKvZOhcdQfrFUnEQGSzj53nm3/2/AEAzMoGrDG
	Uyh9NdZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rZM-000000079pP-0P2p;
	Fri, 01 Nov 2024 13:20:04 +0000
Received: from mail-dbaeur03on20701.outbound.protection.outlook.com ([2a01:111:f403:260d::701] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rUG-000000078UQ-0XRf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 13:14:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rC8j6N5bHyL7ZkVYtMCUfnDUpUwGrxO2hazFGQxnQGvjiWLpPV1z1ZWighG3LRNd2asnuKR9eBUrrXxzlO7y1ERI4P2FeFmGRHYiyb0YA1x1UhlNgaEr2w/kcWRGqaBrgkYIC/Bu9+dqhl7kVUScWwnO9YUTX3GyyjqQ5jJG4J5bRZJdUyDMl5u3J0GUuq5jEQsGdkIOkVgGzcLsJi0C8V3Dh+prEOJM+HLiKmHVracg9zyMpDYN6YEpixxsY0RxzxTRPpmnH/HEt+mIFuUDtApSgQ1BAjKcHxwQ2KlHWsa6rIaZLoZGJjetmfPkQyXk2BTx3bzA/WmkSoJYCmkJdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAABPIVurKV8VPJvRoXxkRaLdwKMufBIcvU1Z0Kx/pY=;
 b=ZAYSu+wjNLkN2OONkprSknOVcr1qVLbxlqkdLGkLDf4TWTuk0vfP5Su5hnvcBW9dSsSuCEH3/8KBNDULooMH44Wd4Td+kofEJVdyEvRA+a2RMc0is3U3EFkVo0EA4bSCz2XTr/i9gfp4quBrBLfiKY7vbdfaJEOZseR9XJNfUDcO9jkc+gytMTk2S3UJSBEbKwcEXrJY0NFpXt5rNi1UZmTmQuPuRDbeUtIws0qBm80R3EZq5xLGGERiu+GZklNjd/HPo5Kc2QHO/ZvGFbW+vTp5wqDmf9gDnc4HxoXLuUlmDvfqKl0SZVVIeWSfHHjcp4bGjY6vXjVsy98nvscGpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=none
 action=none header.from=phytec.de; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAABPIVurKV8VPJvRoXxkRaLdwKMufBIcvU1Z0Kx/pY=;
 b=YJz688dEbfMcPtklBNfxs3BTyzq+K4/bI1NgZulnrDKvLzvit4QcBE8ttO7tlR35+GcIHqig5jPOFI/D+dd7VQoFsDHZ/2UcRbEqlN8cZ0LK3rCjpBiL4rwrNNFK21eQ25usT8yevrlNBtir78lGAKEkGoxSjHdAmDPoFf0+vAc=
Received: from DUZP191CA0014.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::18)
 by PAXP195MB1279.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:1ad::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Fri, 1 Nov
 2024 13:14:40 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::9f) by DUZP191CA0014.outlook.office365.com
 (2603:10a6:10:4f9::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.24 via Frontend
 Transport; Fri, 1 Nov 2024 13:14:40 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Fri, 1 Nov 2024 13:14:38 +0000
Received: from Berlix.phytec.de (172.25.0.12) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 1 Nov 2024
 14:14:38 +0100
Received: from augenblix2.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 1 Nov 2024
 14:14:38 +0100
From: Wadim Egorov <w.egorov@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <upstream@lists.phytec.de>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/4] arm64: dts: ti: k3-am62x-phyboard-lyra: Set RGB input to 16-bit for HDMI bridge
Date: Fri, 1 Nov 2024 14:14:24 +0100
Message-ID: <20241101131427.3815341-1-w.egorov@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Berlix.phytec.de
 (172.25.0.12)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0C:EE_|PAXP195MB1279:EE_
X-MS-Office365-Filtering-Correlation-Id: a1416d16-9f05-4717-cbd9-08dcfa7723d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rulu/SicGP03eivboa26h6IoVLwnGK8D/qAGb1mkyOL8AzR0M75ybwRJc5nP?=
 =?us-ascii?Q?gM8AUYHoFGgTtn47wxvWRR+EjlczTFDMywgBQe1VYuPk4OI+Qahi1MvnpjnH?=
 =?us-ascii?Q?M4BsLnr7qFXp8F99B67QXsIdKKbm/y+NiR1eDHK50C5/YwymSoxKDUiI7Iw4?=
 =?us-ascii?Q?TFDgLl6YVfQLjxf1ycDSjLSFGzyT3yX98pfTmZ3A/6Jz707X3TgEtVYophOZ?=
 =?us-ascii?Q?RDikfxGTH+areWrlZBDf7Z3mHYPRbkdK9BTl0Ne2K98ovvzbWlUArqY2pu0K?=
 =?us-ascii?Q?UZOPGIisuNO/T5N1/bndtABVFzzajJT/MDCMDoYyvfd/K24SPxsJpCGC8e9M?=
 =?us-ascii?Q?nqYfCBd/ArjdhEeGGonfVJ3UQZpSCoo/pjG3QeDJqYj1YxSniYIpwVXh6oG9?=
 =?us-ascii?Q?BPycLWLIKVm7dQs3XhQ3CdL1C0cj/KSZjs/EC2XpR+5xoEhw5F5ocrDgvKsc?=
 =?us-ascii?Q?siB9Mp9Y9NXXEUpYfMNfABotRDmcaaXx6nNSUIQCokJ8xeYaG8zS+eMDcDqg?=
 =?us-ascii?Q?v0n0FRsVLWgPNnSofBYfGrHXEFTLHuBzKUQ57r1Gi3NFV54XHndelzqSMaE1?=
 =?us-ascii?Q?CeunK4rkHrmXj8AYiaVqVdr3oJv3y7S1PhGkJenq9ShRiU2rzgB4owuSsxS6?=
 =?us-ascii?Q?qI2+xgJXc+3o1bhId+aa9HhkcpGoPXnwnKlOCoZsWis+DSjrjCiaHt2coU8j?=
 =?us-ascii?Q?AJjN+xQTmXKPQRDSFRq82axrtY9/Pq/sSziJktefPq4FRxTGnyDqi0pPDiQ5?=
 =?us-ascii?Q?GkDS3Ra8s2KnyLJ2kBQSjf1x78BY2MQ3komeSYojITJYxDp5yKrO99ZqI7DI?=
 =?us-ascii?Q?p5fHUs360Os4LOINB8voRPRP3OngyIBrU5kqGg68NGJFkxNE3ytAajjLXD62?=
 =?us-ascii?Q?g/foBz6/oLDwL3rBj/tZMfeTPiPfVdVn50E1HuOAfkIWCIu2kYdyefG7lUmQ?=
 =?us-ascii?Q?tuZoUfxD4IxKQzd13VwdyY2+EFWnARKGR3+L7hcL10SlseOyXxUlqUDo1e0O?=
 =?us-ascii?Q?rDvSgU9WQ8ue0RNwc3GYh39GKitD3lZiPg7akAzjLQMBQ/7gY2vYpxtnT6VC?=
 =?us-ascii?Q?dnQbzZ6HnoKCPXn3Z/ru7WAXYyzsTZvVah82wyNvTGZln8yZgnRy/dbf/tQ8?=
 =?us-ascii?Q?kQ5y0AGjVURGg6OuUvRlgfsVvPlls9biS8lEHYKcblF4DffDqIfq5kOHAp8T?=
 =?us-ascii?Q?Jac8MLKStGpSA4U2DeKR/K1Twp3R3UPXoPhwNNjNlaK3RMFMDJGtPLIr8Usp?=
 =?us-ascii?Q?EHzr8dvL3zhNR9Vge1Uho1dCILIck4FdFCmcezUJ873AZ+JGknwnsyba+JaJ?=
 =?us-ascii?Q?vGlFTwEKH2u2pKd8hgVekKWb+VLWXq2peJvpZ6yxMbf2pczUArryvX5x0l1l?=
 =?us-ascii?Q?qPEVtMqP0fpdjm8My8vxXlUQvDcPfjgeUV1TScKSNWef935iZw=3D=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 13:14:38.7925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1416d16-9f05-4717-cbd9-08dcfa7723d0
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP195MB1279
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_061448_190523_BEEA00EE 
X-CRM114-Status: UNSURE (   8.23  )
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

The phyBOARD-Lyra connects only 16 pins to the SII902x HDMI bridge's RGB
input. The default 24-bit setting causes incorrect color output. Update
to 16-bit to match the hardware configuration.

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi
index e4633af87eb9..52cd25999511 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi
@@ -376,6 +376,7 @@ port@0 {
 
 				sii9022_in: endpoint {
 					remote-endpoint = <&dpi1_out>;
+					bus-width = <16>;
 				};
 			};
 
-- 
2.34.1


