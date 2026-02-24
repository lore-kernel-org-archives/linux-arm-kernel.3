Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A97F3C9A3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 15:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFRXWPXybCftTNuuC4GD5pIHS1pniTKLzhwNs/CyTzo=; b=gUbXYJAZh1sXCfF867emt+BK85
	SodXQK/lPLa9D3IJTR20+pOmFi5c6uHAu966H9UwoHAUnUzsNAoEN9TRS0FWQe5IpnTLnTXreM94f
	QYg+QpP+i3PmcVvAC7m5fMwbpqD3nfeLfhOuvNeifcAyNUMinH4BJ4Fzcy5KfICtAvdIngA+PXY5j
	4GnNZzM1T7GMNBC60XPwvkPe/fD9+ZcRXRRZh3OKjYfAri8xJ54ZeNxc9sJY0PLQyZSACOhzge/oT
	4z5Mgn4fTKiZbF1K0O9PWcS2+IwVUZ69j8TAzM9A7DdoN6cpIKd9ypzvyaUQDUxBIabAN53l0SmP4
	Fq5PvQkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuufV-00000002LDy-0Uc9;
	Tue, 24 Feb 2026 15:49:49 +0000
Received: from mail-swedencentralazon11013045.outbound.protection.outlook.com ([52.101.83.45] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuufM-00000002L7q-2lSX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 15:49:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f5w7rq1EGIEtxWOli81B0D/ei2hFGGvEOXyArS0XtDgeNTTpGVfdREZ6Vhz3jJLPANLJLKmclKcS2absR7FSH1ax6pid6GjcrCpdQsY/ih97muxAmi/70YbQZ+5fAb2KNuEyZzQKX5qbBTWV8CWlVF8Q1Zy6fMh3N+v++EFf1XbEQYqUWDw1w0BnF6iJkG6TP6eyhJYRzn/g/bNoxVxNQCYb1E2+0Ol43bVR5zopHNAb1GLMinZl9uH3NDnhGvBcdjZhBJioaQWHcImVBfm++edAT7Ry6pZJEqHg+7nzVb71NTt82yjv2e5dYxVwfT3bOs9CKNgEJ24ZBB5VgF7j6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFRXWPXybCftTNuuC4GD5pIHS1pniTKLzhwNs/CyTzo=;
 b=Yqhz172QgfR2fsG2yr81DTXxMFySHn/3OYalf9FCdstj8sMxmjATK+jh1zrgkhybX13YfC41zofCEmhFwWKb7Z+gDwcgBdaSPBD5Dg2huk+7LumYBpe1FBL9x+mp/eS2uWfF19vFOTKWCi9iKUo/+Z6eOjxkheBe/+/A3t6rAzxq4ACL+rjHkeiYHWduPdMstgQ9iQZ+LVJtqkcvvaXFiukOjODMdq5ZBMeh8IX6XNdaSNFazdFKtL47axg5M/PGJZCijEBzEZAlr+Eyb2gDNT6UwBsBs54d1Fvl4eloohkfXbR9QZULl1GT4qkSn7gvvC3pcqqgLIe776vwYgTgbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFRXWPXybCftTNuuC4GD5pIHS1pniTKLzhwNs/CyTzo=;
 b=emyBgqq1TIxWXlm6dy8vmrYxDyT8GrbFfZ35rIBMMA/zt7tScYk8XdL9lfli/csMd/71KneYq+aVkfxkc82QauqbMa7MUpui8tZP4dmsZFcw4feg3G9sZuiwtYLyuCxzPM/z63LCBxs2JpH1LKWKsNhgxeYYwqueP1e5Gom4NSWsW0lw7R5mta1bvG7hExTOiNNooG9JuIqOE9Fzah6MZY4rRI8IohJ3aGck1qwUsFOr6Bx0dRkKHbxAzMtw3CsNi1UEcNz7SfxuouCZKU1DpMaoniW3cdU4OHSDdJNxNXQZdUrMZzri4Hkno2vPFJEI56NMccy0bWpM1dfrJn9WeQ==
Received: from AM0PR02CA0143.eurprd02.prod.outlook.com (2603:10a6:20b:28d::10)
 by PA2PR10MB9146.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:426::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 15:49:33 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:20b:28d:cafe::7f) by AM0PR02CA0143.outlook.office365.com
 (2603:10a6:20b:28d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 15:49:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 15:49:33 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 16:51:49 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 16:49:32 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 24 Feb 2026 16:48:07 +0100
Subject: [PATCH 4/9] arm64: dts: st: update i2c nodes
 interrupt/wakeup-source in stm32mp251
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260224-stm32-i2c-dt-updates-v1-4-347cf6fca7d1@foss.st.com>
References: <20260224-stm32-i2c-dt-updates-v1-0-347cf6fca7d1@foss.st.com>
In-Reply-To: <20260224-stm32-i2c-dt-updates-v1-0-347cf6fca7d1@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.130.74.193]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B2:EE_|PA2PR10MB9146:EE_
X-MS-Office365-Filtering-Correlation-Id: 594be595-8d4f-4e82-7585-08de73bc4e37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnpkSC9TVzNLaysySE1MdEM3YlFIOVhRNXA4RWJVVUtZdUhOd1JJMkNmaGxY?=
 =?utf-8?B?WkN2ajg1cU5PRlZ5NlJOakU4N3ZaYlRvR0RQOFJTWXhaSEVOaUxLdVhmVUsr?=
 =?utf-8?B?d21KVlZRdDhaR251Q3ZkMEdFbk1SV3c2UTFoSEdNWktLdG9NVVFwNW10eTMy?=
 =?utf-8?B?ejNXWFJNVHplV0F0RU5TTHAzR1VNOGdkbkJMaTQ0SVhBNTQ0MVIxVTdmR2VX?=
 =?utf-8?B?Um05Q3ArUmRUVStkRy84YUNyc0YyQVNJQjNZSmlmTnU3cHAvQmJtK1pKNlh4?=
 =?utf-8?B?TVNJVEVReXhxYVlKRVMwTGZKVHJjU1gzOGxFWnQ4OHdnbHd2Z3FoTHRFN0gz?=
 =?utf-8?B?UGpWZUlabUZyWkxQRE1BeEk1SENFYTFlbm5xMkFicExnN0pPcEl5TDFEZEF2?=
 =?utf-8?B?SHZvMCt4VDhuQjJJTERmdS9Wb3dqTVU5MzU4bVBLdERWTVc3OHRIL1lQK0FC?=
 =?utf-8?B?U21ZcEM4bU5lanEvSTdkU29yankvUzVPQzliZHViS1pKeE9YOVNDbkhIbzYv?=
 =?utf-8?B?YmQ2Rlp0elJQUVJYVS9UZkcvMlZ0cWpET294eWFZbWRrdEoxblV0cUhZWXQ1?=
 =?utf-8?B?eXFoZjVNRFlSbHk5MmFhVyt6WTJrUitFWVVFbWYyQ3NUNGdzT0gzV3pxdGlT?=
 =?utf-8?B?OXRZNkhpcW5Ra0kyQ2hwSWpFRE9ab2pMWHRBMkVpaXZkelNJdDR2ZXErM1Mx?=
 =?utf-8?B?ZEVpZ0plVjFhL2tTUzJhVmdLR1lUNjVOSFZIYXAxVGJJNy9HQldnTzhWaE9w?=
 =?utf-8?B?Ri9GVkk3TEJ1RU5tZ3dRMGNuZk92VERZNUN4ZUcwZWEvVFNyMnlBOFRJanB2?=
 =?utf-8?B?ZEVON09Nc3c5ZWNRdWlVT0d5NmwyS3dyczZvRGNuVW1kY2cxVkJmd0x0djhu?=
 =?utf-8?B?U1B1NEJiKzVlekJFUFdHbzc3aVgvaEdOSWgvalAwdnR5NWxJWU5NeXYzL0Zn?=
 =?utf-8?B?QXAyN1cwbFYvdnJJWVZ2SVNDWVZhUTVZM2U5MWVVLzY1UEc5cVlqVi9WaWJL?=
 =?utf-8?B?cEVOUEtHMEtQMWttNjZIaXRHNlEzdHBQYTVQQ3gyeFZhSHk4OWNmRTdQdS9R?=
 =?utf-8?B?N2xuN0VIWTVEZzVqQ2tuRnVnWlVlRFNiVDczaFpGSUhFd0xsYXVFaERwNEJG?=
 =?utf-8?B?RGp3d1R4VG11VjROZm5Fb2owb05IV1d5a2k2S1hHMktYYlpqaEdKWXE5QUlK?=
 =?utf-8?B?K0owSE80WXhYNG1EZ0JiSCswZC9vY1ZxL2ZoMDZ2dzNqZlhNWjJGWUhsbkdC?=
 =?utf-8?B?S0t1dGlyNVdGUHFVRUJHVWg2NkVteTd6WDRSS0xrYTFCTngrTGNZbkxpTXVN?=
 =?utf-8?B?dW83enAvUDJXTFU3Q3FTUU5NYTVyNUVRRUlyNXBveElWbEtMQVpzU3F5SlMr?=
 =?utf-8?B?VEZJMUM1blZ1YjhSRGN2dDl6RExnT0hrM2tHbFpTbDhPbmUzOXo2Z1J5MkpI?=
 =?utf-8?B?cTBqYm5VMldIMVplNGwrN0d4UE5Yb3h5SkpBRDVEcExvYUl0MnlNU2JCeGpD?=
 =?utf-8?B?NW9ESjEwc1R4ZFVoekR5N2JXa2VhM1dtN1phdlRYMVZWMHQvd2lrVXhlWVdn?=
 =?utf-8?B?V1ZEdjJCZG5iYUk4Y3l4K2J2OFJZTXF3Y2dBS0JPckhPcHBMQ05CU0ptRWU3?=
 =?utf-8?B?NnhQZDFmS1pGcUI1SnRTczhKQnlKY3FIOFRiWDUzbFhtcWpWVHRORTNDbkl0?=
 =?utf-8?B?dGUwcTBHNGZXYmQrTjdSSjlBR3VuS2xJbE9GQmNXSUU0N2hPRUlMQmlNeWNK?=
 =?utf-8?B?V1VjczZDT2JpSS9JOXlLbTB5SHVwSnBORTc0c2UxOWVwazFHcmtQY3ZMWmRN?=
 =?utf-8?B?MnFtclk2a0ZhY0o1cXZpZlBxVzlqUFhZRUxZM1ByU2J2QTA2QUJPUzNGVlo1?=
 =?utf-8?B?a1BsdW1XbS9objRnZU5jUjlONkpjZ2pqVUs1OTRlZ3FwY0g1UXBBdjFZTElr?=
 =?utf-8?B?T045SnpQR2puckJNS1FjOXpZQ09oRFhrNjNJaGMyaFJHMWhXNmpBdHlEcXl2?=
 =?utf-8?B?VE1OM2VRNlIxZ0g0bVdMSXl0WnZ6SDhmckpSNXhraWdUMHdZSS9wTEI0NnRl?=
 =?utf-8?B?QkFidzY3Z0greVdiWVRNVEtsTzRRcklUdUdyNC9JdU41ZjZGZUhZZ0EvNHov?=
 =?utf-8?B?eUxDY09Ycm96R20vbVNmN0thaGdLK1NmOG1Mazl0SWtNMTFOWVlCOFAvNkpa?=
 =?utf-8?B?ZEpQTXhqTGpBZ3FuNGZ4QkxXR3RaYTdWcUtndWNuUm9oZTJoUmVvZUdKMFda?=
 =?utf-8?B?cUxCZXVIREdCWHpKcEx3QnZ0Y0pBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: I09MVO0eT+HD7Y83bOgd632zi08mOAcC3UFqI/TkQkjbq4K9yGSUpviqctBuifwFAWGeh5rKL76VwX3WuLHMDE1fa3qw/eAOretm6tMqUsmDl+DBR3mRUojeqZ5GoGmhDA6Sd8khmcBVIQMsn8g+3lMcsv6ND0VyPhdMxvaq/fDmeFpJs9RV3qOuHykYG1u/K8oYOFrG1pfBGh7+AG5v6I/6YbXJ5aqpzpQN9OCrQKgRlpPwZBF6C2lCkjFx3t/tfOLss/4mTvOq0O/u8Qd7PNVSWTAuJ4wGxy2YKvF7mvQS0Gjbe8iwed65LvbbV3NBKWyUaMkJcqGZcoEufyD+ivtvoa+J4zFDLd4z0VypcQ06zWbnfi/9pRHzpW3d+oxCDHzjz8ltZDJFSloX8mecdx1o/PfsZU5/OjlZGwWeXCKSNXxjhp0WVV9yO2b3j1d7
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 15:49:33.5608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 594be595-8d4f-4e82-7585-08de73bc4e37
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB9146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_074940_706761_67B947B8 
X-CRM114-Status: UNSURE (   8.47  )
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

Update all i2c nodes with the following properties:
  - replace interrupts with interrupts-extended and rely on exti
  - add the wakeup-source property

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 8b925ed0d881..673fbc5632e6 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -773,7 +773,7 @@ i2c1: i2c@40120000 {
 				compatible = "st,stm32mp25-i2c";
 				reg = <0x40120000 0x400>;
 				interrupt-names = "event";
-				interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&exti1 21 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_I2C1>;
 				resets = <&rcc I2C1_R>;
 				#address-cells = <1>;
@@ -784,6 +784,7 @@ i2c1: i2c@40120000 {
 				access-controllers = <&rifsc 41>;
 				power-domains = <&CLUSTER_PD>;
 				i2c-analog-filter;
+				wakeup-source;
 				status = "disabled";
 			};
 
@@ -791,7 +792,7 @@ i2c2: i2c@40130000 {
 				compatible = "st,stm32mp25-i2c";
 				reg = <0x40130000 0x400>;
 				interrupt-names = "event";
-				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&exti1 22 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_I2C2>;
 				resets = <&rcc I2C2_R>;
 				#address-cells = <1>;
@@ -802,6 +803,7 @@ i2c2: i2c@40130000 {
 				access-controllers = <&rifsc 42>;
 				power-domains = <&CLUSTER_PD>;
 				i2c-analog-filter;
+				wakeup-source;
 				status = "disabled";
 			};
 
@@ -809,7 +811,7 @@ i2c3: i2c@40140000 {
 				compatible = "st,stm32mp25-i2c";
 				reg = <0x40140000 0x400>;
 				interrupt-names = "event";
-				interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&exti1 23 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_I2C3>;
 				resets = <&rcc I2C3_R>;
 				#address-cells = <1>;
@@ -820,6 +822,7 @@ i2c3: i2c@40140000 {
 				access-controllers = <&rifsc 43>;
 				power-domains = <&CLUSTER_PD>;
 				i2c-analog-filter;
+				wakeup-source;
 				status = "disabled";
 			};
 
@@ -827,7 +830,7 @@ i2c4: i2c@40150000 {
 				compatible = "st,stm32mp25-i2c";
 				reg = <0x40150000 0x400>;
 				interrupt-names = "event";
-				interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&exti1 24 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_I2C4>;
 				resets = <&rcc I2C4_R>;
 				#address-cells = <1>;
@@ -838,6 +841,7 @@ i2c4: i2c@40150000 {
 				access-controllers = <&rifsc 44>;
 				power-domains = <&CLUSTER_PD>;
 				i2c-analog-filter;
+				wakeup-source;
 				status = "disabled";
 			};
 
@@ -845,7 +849,7 @@ i2c5: i2c@40160000 {
 				compatible = "st,stm32mp25-i2c";
 				reg = <0x40160000 0x400>;
 				interrupt-names = "event";
-				interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&exti1 25 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_I2C5>;
 				resets = <&rcc I2C5_R>;
 				#address-cells = <1>;
@@ -856,6 +860,7 @@ i2c5: i2c@40160000 {
 				access-controllers = <&rifsc 45>;
 				power-domains = <&CLUSTER_PD>;
 				i2c-analog-filter;
+				wakeup-source;
 				status = "disabled";
 			};
 
@@ -863,7 +868,7 @@ i2c6: i2c@40170000 {
 				compatible = "st,stm32mp25-i2c";
 				reg = <0x40170000 0x400>;
 				interrupt-names = "event";
-				interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&exti1 49 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_I2C6>;
 				resets = <&rcc I2C6_R>;
 				#address-cells = <1>;
@@ -874,6 +879,7 @@ i2c6: i2c@40170000 {
 				access-controllers = <&rifsc 46>;
 				power-domains = <&CLUSTER_PD>;
 				i2c-analog-filter;
+				wakeup-source;
 				status = "disabled";
 			};
 
@@ -881,7 +887,7 @@ i2c7: i2c@40180000 {
 				compatible = "st,stm32mp25-i2c";
 				reg = <0x40180000 0x400>;
 				interrupt-names = "event";
-				interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&exti1 50 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_I2C7>;
 				resets = <&rcc I2C7_R>;
 				#address-cells = <1>;
@@ -892,6 +898,7 @@ i2c7: i2c@40180000 {
 				access-controllers = <&rifsc 47>;
 				power-domains = <&CLUSTER_PD>;
 				i2c-analog-filter;
+				wakeup-source;
 				status = "disabled";
 			};
 
@@ -1473,7 +1480,7 @@ i2c8: i2c@46040000 {
 				compatible = "st,stm32mp25-i2c";
 				reg = <0x46040000 0x400>;
 				interrupt-names = "event";
-				interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&exti2 25 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_I2C8>;
 				resets = <&rcc I2C8_R>;
 				#address-cells = <1>;
@@ -1484,6 +1491,7 @@ i2c8: i2c@46040000 {
 				access-controllers = <&rifsc 48>;
 				power-domains = <&CLUSTER_PD>;
 				i2c-analog-filter;
+				wakeup-source;
 				status = "disabled";
 			};
 

-- 
2.34.1


