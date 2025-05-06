Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644B2C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 17:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LzLJf5N2ogXoVu6YsLM/OVEhB7GuWwIt/oZeCYKTFyQ=; b=AVcJT7n24j2ExPl8Z8LT049ulx
	oFCwq83LRT7fY/wTu4iStVZR20HqRL8zHN7GBDWVhqLhL2Xr3Qsv81FS17zBQjA30UukXZY5GMubJ
	aBWJEWYEuc/EgNxcn6DYa7xquMkpOzUMEKpT83voH/20UshNNNGNSv3F79+ClLtORGky/49UAFrIL
	yNxgsK518voUC4a0PeVYdjRTl+eag28yoPKW81ie/AgZBOYgWNV5dwlhuy6sOEBAXNmiVMuNLeBRf
	Ky3H5/L0heRT8abctT+Ch/vJmwb9GBhi2xP1xBcB0s6sk4QM59Y9DVoG7npPDIkEP+GdmNNBxVkbw
	o+ibYZIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCMGx-0000000CsFr-3lL5;
	Tue, 06 May 2025 17:40:03 +0000
Received: from mail-vi1eur05on20728.outbound.protection.outlook.com ([2a01:111:f403:2613::728] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCITQ-0000000C9SW-2Ajr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 13:36:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NAFATWRcqiFAdwZ5hUN2OPv51QvA0k8FZc7KyNHnu5vh84Ews5udsK28IBML0EGLxzN4hns6aWGotj3uuFVRzzvDpl+WbnuRIvUcV9BrLV66LHfAus/EWfFJpLJqPKxzWGQ7uhYQ+GcOZoCOur97yJ6ZaVVtDUER7DFfEvXBIAULiGDaMl681VXrRc/5NSMpHL0VcCMvEwsqVOC58+bco9S2j3ZMrhjkLHvpJmWUpCrwoZmLSxT0nJe5QQAirY5kICqZw78fyA1NcoGEq5yZm2kKQcZijXxWU7fe/vs9cAdy7bP4aLTnHoXh1L96bXAtgRKl0tz5KMN5m5UeZMN0kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzLJf5N2ogXoVu6YsLM/OVEhB7GuWwIt/oZeCYKTFyQ=;
 b=wp/pCu3BbnONVs37ZKaUl50phegkwvq10pxg4qzMJ9d4FM4BMxx/5RReBohZ45BcVYwX4NP900aO5QJIay5Z3lbkvpdoUo0h8q0eYgKs6V5GeWXq58AdnNR5NfGDjFLUuobqp78KmkgPLBq6RdPo9Lh9vERYi+SVCNtF1XLlDy8oXRLyhgixYRSfRATIDbTV3JWFew66FVAYEYSHxnuY3hZskPubgA1di+AxtCPUNXGKPJwO5Y3Mresq9qQyQC51BLreQOgg1vHvJKUICoyTgh9APhJTQt9HzY+0p9CxpkZKPH39oQgUuKXcuGPTTt2FFTibmmlBwpQaFLg93R0YTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzLJf5N2ogXoVu6YsLM/OVEhB7GuWwIt/oZeCYKTFyQ=;
 b=dxhsoMc5fHX5jOK7K2ESLMq9GdnUlFrySSaj4idHHCbZUs2bar/nKBR4vqsX3VomKAJn8iDxN3js0NVSyh8lQ+MF3QC3T0QJR7IaONzi9DOCWqqWq/zt2NaX66ZN2W5DIslljZ1PECY8D46l6Q0vbOexPBnB7IarXWPbwg0STPq9Zlj+8L3AySLvZcB5C96jrFCm3vOxtQ6lIEgFI8rYNjsdQdlGp/G6lM8/FZaJn3ATm1R3xOTAMU3dGRUSisB0LCNDGufTcanpbCrq+XEYkPGZqGbcmlItSARx9Z56ljpGDKy18/r57BEITjuiCuszkfTLAU3lBImTKt7vUou9pw==
Received: from AM0PR10CA0036.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::16)
 by AS8P195MB1269.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:3ce::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 6 May
 2025 13:36:36 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:150:cafe::85) by AM0PR10CA0036.outlook.office365.com
 (2603:10a6:20b:150::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Tue,
 6 May 2025 13:36:36 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 13:36:36 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 6 May
 2025 15:36:34 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 6 May
 2025 15:36:32 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, <w.egorov@phytec.de>, Daniel Schultz
	<d.schultz@phytec.de>
Subject: [PATCH v2 4/4] arm64: dts: ti: k3-am62a-phycore-som: Reserve main_timer2 for C7x DSP
Date: Tue, 6 May 2025 06:36:04 -0700
Message-ID: <20250506133604.294920-5-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506133604.294920-1-d.schultz@phytec.de>
References: <20250506133604.294920-1-d.schultz@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.17]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000040:EE_|AS8P195MB1269:EE_
X-MS-Office365-Filtering-Correlation-Id: c21dd712-4605-4cec-f81b-08dd8ca305d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xA+Ky/dXoxr1I6RRpS7Kk5kjIqsCRZCzfHUwzIKXswLyouo6xy6NdIcibXfP?=
 =?us-ascii?Q?sYPVPHz1pCA5NZpXX0EwLNQ7bxDaB2MuzJ6Hf8sknfaEgNmkrFp8zTWOelA6?=
 =?us-ascii?Q?WgYqqbWHREcbxjdYFPLK8dxJs4i5CSc/XZ13xPrtM+cutu/lkB4oIMMNiho4?=
 =?us-ascii?Q?7GSwv/V5Oke/nQAHbxu++C064OPoy/6mp38JDD6ixkyJnR5kxKI5FbctMS6M?=
 =?us-ascii?Q?E7ECAMbZodHpT9DF78Odo4JDtUVjhHGqCebjirNtbex8ZmBKY1GmOD7ELiv8?=
 =?us-ascii?Q?Z/mIkNu4vkc9t4S3pP5tlXmc/iVatvKIU8P/1R1z8ioUvmPJyV+GtusHEQSp?=
 =?us-ascii?Q?muPb52EzQqHXe1sQilcxG0QwkNMobh1IJz88A63FKFf1aegHNHyd9sGxDQv2?=
 =?us-ascii?Q?BVsxQzuCNhel0G9mxacNsauFVmEGIbN6sPKqL0/fHhe1Ez6a71cw29VmOpwC?=
 =?us-ascii?Q?kdJzf3M6MYzUYUoJ0ZCIXS0kpQ0fQv/X8TcFtitn1IDWbSuo1Vbb8xOh/uIJ?=
 =?us-ascii?Q?z4wgvgJtGEFhwebNsUTnjEwuZbHUQGIMrXieC4FATOLJVCTSqIRbKvnRIF74?=
 =?us-ascii?Q?0lyiNsjW2ioyvYegB26mtZzkbrkdy4YEnYIIAUsUGIB5H7HwF7ifUQcdkwO2?=
 =?us-ascii?Q?bJTiaDMB03lT/yov9/iAjFY+Lf20sAMvZR8Toh//awCXbj3xOs3eiNd+UecK?=
 =?us-ascii?Q?/LzBTLyyWEw6ZOfv7oQRnDvujtn/IcYSKwYKNo+eDCEtC5HpzGHljUF3TRYQ?=
 =?us-ascii?Q?53fz+l3Ij9Qtt1c0Onr80ZxACu2kE/SgUe1Inmz+FFGbm5hsI0xvKeHqH0Kd?=
 =?us-ascii?Q?cy7nYQvRXbX1k2vtLPBB0ySwcNITTXc3wOyzyrskJYMsbeVGhi/USi8KGh8u?=
 =?us-ascii?Q?nZZDiQOODLJEfcmdaJDJaGF62NI0BbBTqiLtXrhGUMBfLYTVH8/kk9rRUYuw?=
 =?us-ascii?Q?8LmAKPuqQ2ZeCcuUJhTG4Fc97oIAbFAFNcbhH8NwJRZDeSfiD6pqZOPQQflQ?=
 =?us-ascii?Q?t4UIQ1pEH8KtUAHq2CyeAVhgwbSjR2MYR6JFpldhG2ZgX4R/Wgnq5zbkXp8D?=
 =?us-ascii?Q?8DoZrcDCT9Pk1Czq/9twUq/Tsle8zAR0N08TVJmLBe3H0e3AY67RcgiXXQ59?=
 =?us-ascii?Q?zlXJ3EuKac0hpgBW/kRIpcRXmYImxzqQCGASPZpWDthnzAT9jmY5TGrhax9E?=
 =?us-ascii?Q?+0ehdSng2+Yt8rUKu5vGqxGIQ2yYWynUwzmhiYGPKZOx+PTUDhAaZIktYs3P?=
 =?us-ascii?Q?Y2bgweXYxqCaA4S9wGjtjP/Q6yER5GIUeteG8L7w0Jo2dqZyu9DksJn5NcDl?=
 =?us-ascii?Q?C594gxhKWexzmmgijFPhPHfR/PYjeETdsbn3D1KbJ2pILgSCaO9AIY2Njx9k?=
 =?us-ascii?Q?V9+5e61eo1Nwb1uRVq5V1nA3RNuRWWf5+2AoiVMrX6dWGb5OfRZF/QWJwh0g?=
 =?us-ascii?Q?VXBV1wI8Ivsn574aSuuPDyuEfbFiRQ6KDSFZETA1tXNyKAMGeBjr1iP0y58g?=
 =?us-ascii?Q?jBzn3aAn9SyhEuv71e/lUXz1gkmi2b5IdbKe?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 13:36:36.1753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c21dd712-4605-4cec-f81b-08dd8ca305d9
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB1269
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_063640_553353_E8D3C13C 
X-CRM114-Status: UNSURE (   8.50  )
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

C7x DSP uses main_timer2, so mark it as reserved in linux DT.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index 7fa0060af4e8..14f7840ccf2f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -384,6 +384,11 @@ &main_rti4 {
 	status = "reserved";
 };
 
+/* main_timer2 is used by C7x DSP */
+&main_timer2 {
+	status = "reserved";
+};
+
 &mcu_r5fss0 {
 	status = "okay";
 };
-- 
2.25.1


