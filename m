Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C306D47CC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 10:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O49p/xzkD0fMF3HDVkyP2P5zKv6E96IEdKbe2ZVF/qs=; b=kTAVaYNZ1/if+4S6onG8n65hnn
	IzS6sZgbfBQI5a4ebRq+4HIj69okWlWRqgQ4I+ehyZ1HTYBJkmj/FkWmr1yJWpf+fl9lEUB/2RYt0
	9LXAJctfUo4tUr4e+5vXIWqUD/OWL1PVDmF7hU3iRC37Cs50ryihmoNkhm6bs6oq7WkQTqoyM0X8y
	8l7LrxtZ6BySFtPOLqS/jZuR8SFRBRKOqbgR082Ayj8NbRPoKhQqfJqt+tPuWwoK7szEhk83Gz37M
	CpHZFS53nxAyDOH3DtftOdRJQ7LVZPZSA7JxdYj/caEFT9qcQvDiR2M6g1B0WkNxi/+zos3UG7SrQ
	KgH/B3NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggsM-0000000DvJe-38FV;
	Fri, 16 Jan 2026 10:16:18 +0000
Received: from mail-westusazon11012033.outbound.protection.outlook.com ([52.101.43.33] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggsK-0000000DvHb-0Cij
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 10:16:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnT9qoxFNKGfUjpRakrsyrBwzwF+V4xOJlr1r8W+GC0EvEcr9iP0tIiucYEBx/DLyrQtwrA82fLxnzoHjSQ3cOJwtF1rxE3UdpS04H96u5WiYFBbkssqP0NKkyemOi+hJic1VvXxd4YUMGyv53Oh9ZNl9Xfrjvd9MqEHs7pbR6wEvl3xDp9zNpnqZg4T1zvfTL9IFvhM9+zRyWFlBk4HTfJSd7ojwQp63nLDXvn4HBjEWAJ6mKo+1CtmEPtTyFbGtEZ7+8oSjrirA9KIwR8CVlArFxRFNOYPRqTv2HOX5Gu0MZLG2njj6NSBIiBojs64Tz4jTnMErsmwZ4n+Od4CWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O49p/xzkD0fMF3HDVkyP2P5zKv6E96IEdKbe2ZVF/qs=;
 b=QfnroRTzVJnreo2+Od/7AyB+Bf0kfpR/oACd/g3yJ7NeUNaiix4cK8C7+GLAp/KbSXaQPDSgoQtDOsKjdw+jCPrK8bcay04MfoQRmTWgXKH3iA7yza1hEqm606UCy8ChG7HLBf/FXfeSNXrWoh/dtabmlxctSa/JsRBn8sGuAurXOsdP4Pw6ZtFTW7w5JyV6qtNes3lJcECfR85RXyTRXeTFSv+PiD9mphrXLpEBYZ5kbsioV8kthaPVvU+dDMrFbgWwsIhRDqx3AVGPCy7oG8jtSZNMnphaqjEOzQ1/U9mJ6anJr/WXd4ph8hjb6vecY6XyePhOS/02XuhEVBoP/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O49p/xzkD0fMF3HDVkyP2P5zKv6E96IEdKbe2ZVF/qs=;
 b=QKYrCVGQs6PHiX+QMfM8nvxEoBb4d9QV1AQm3T3BTjliTvNQL6AICbcxCsxchl2mX/bIE4xb06ULrOHkUDp2bYSVUgA0s2S84lEcIjFgFNHOoq7BXs2xGOpDdAmPUjCtVhu7A4C5IXhdv0pjBO1U3eNp8vgo7tA4VZpujcbXaA4=
Received: from IA1P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::15)
 by DM4PR10MB6813.namprd10.prod.outlook.com (2603:10b6:8:10b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 10:16:10 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:208:464:cafe::67) by IA1P220CA0015.outlook.office365.com
 (2603:10b6:208:464::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.7 via Frontend Transport; Fri,
 16 Jan 2026 10:16:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 10:16:08 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 04:16:04 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 04:16:04 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 04:16:04 -0600
Received: from localhost (ada0543016.dhcp.ti.com [172.24.233.9])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GAG2o52986323;
	Fri, 16 Jan 2026 04:16:03 -0600
From: Anshul Dalal <anshuld@ti.com>
Date: Fri, 16 Jan 2026 15:45:51 +0530
Subject: [PATCH v9 2/2] arm64: dts: ti: update compatible to ti,am654-sci
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260116-k3_syscon_add_boot_mailboxes-v9-2-6358cd1f2b1f@ti.com>
References: <20260116-k3_syscon_add_boot_mailboxes-v9-0-6358cd1f2b1f@ti.com>
In-Reply-To: <20260116-k3_syscon_add_boot_mailboxes-v9-0-6358cd1f2b1f@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, "Santosh
 Shilimkar" <ssantosh@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Andrew
 Davis" <afd@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
	"Dhruva Gole" <d-gole@ti.com>, Manorit Chawdhry <m-chawdhry@ti.com>, Anshul
 Dalal <anshuld@ti.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768558558; l=8055;
 i=anshuld@ti.com; s=20251022; h=from:subject:message-id;
 bh=lqmSU5czBGKaI7pxrOBpnJSfEPRJ39Q8jyTNPWXp/kY=;
 b=bjianwIodN8JqULCchUkHuRYTPEV8l7SQcN6mkZcew6WcaNw0lIgPrgHRievQ8jFtblTywe85
 53MzC5h1mZUD6bAr+i4MfiTG+VEw32Ot4sa1nQclpKycyBzggg8qRR0
X-Developer-Key: i=anshuld@ti.com; a=ed25519;
 pk=Kv8FlQElcrR6efyEHmjtE83y8e0HKvqPyvVY+PJ4UFw=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|DM4PR10MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b7710d1-d56e-4e62-285f-08de54e84434
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|34020700016|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?czlueWFvRE9zRWdBTm9zMWhpbytHNEVuWlVIS3JQWlV0MzRSS0F1WHBSRUM2?=
 =?utf-8?B?V3Q4Z2ErdUtXVFlrcml1bzYwN05KaDZxSnNLTytiSE1MbzhVT1V2RkhhUDVE?=
 =?utf-8?B?RWI5TjFLUFFaQVZyY291ZnRmeEl0SzRac2s4N0J2SmN3SkpGTjgwbUo4WTZI?=
 =?utf-8?B?blJVV1JjblJGbEQwVElqR0Vuc1liNUlPK0lJV09uem44aWd5Zk5xWFNQYzI3?=
 =?utf-8?B?SlhkQmI2SzhMeFBxcC96cFpFM2VWMlozOWdTSWt2YUY3NUJ3dTJiNFhZS095?=
 =?utf-8?B?VEZydXlVUVhLb1M5NXVCVXk1emZYZk5RSnZWMUsyOVh3R1REWTU3MVpjRHAv?=
 =?utf-8?B?QWRjRHp0NjlXRWo1MGJEclFLL29xN1JyYmtUSUlTN0xKZlZhKzdyZDF5Kyt0?=
 =?utf-8?B?bGlqaXdDcFFNOVpnei9zRVk3enY1VFdPTVdDWDkzTmxXMkhZeDBaQTM4Q3Jp?=
 =?utf-8?B?eHBCVS9oRnduOU10WEIvTUpacEZya2oxbVlpQUxMRE1YbnozK0RJQUxBc2VO?=
 =?utf-8?B?NzdJUElQZWdxeCtEOGd1c2wwcEIwWU95cjBaZjlEL0xUYTdiNUhNRTg4Si9v?=
 =?utf-8?B?SHVaT3VFeEVDMDZvYXhnQm51c0duR2txTTRnNzQ4K0dLRm1nSDRSM3I0K0lC?=
 =?utf-8?B?NFlPejJ0WGZkdG5KMXplWVNOZXlpTjYzTi9tbXhNL0ZuVTR4NmhWNC80QUln?=
 =?utf-8?B?NFdmYWpzRnVrZmFMTGFsN3pTdHdxYytlSE84NzFIWlhPeVU3OURDRnROQVdR?=
 =?utf-8?B?SGM3M2VveFB2YVYwSjhyU0o4NWpWTm1MTi9RekppZ2p3NGdaeThYNTZRbXFz?=
 =?utf-8?B?cWY1QXIxTEU0d0R6OVp0SHNLSm1kVmd5STJ2a1NsZ0hwMVJPZnVMcGVuRUR3?=
 =?utf-8?B?VU91NE1mUlh1aFF2STdKckFOU28yT0Eva2FGblFsaHRNcXUwU2lmdFpWMXZG?=
 =?utf-8?B?MXdSOXhGanVscTdvenhDSHVQcEJvZ29vdDBzVWtoL0hxRUNFYjdpbGlMbEtu?=
 =?utf-8?B?ZjVKdG5sL0ZwNEQ5MDNCenFmSC94MDd6a0NSNkZRTWZtbFlDZS94d2lDTTda?=
 =?utf-8?B?bVZLQUhkdWFrQ09RY0cyd29rSGV6Y0hhMnZzNVRnbFExZjF0N3JBZndJYldN?=
 =?utf-8?B?MjQzZG9xR0s5MzcyNi9kaXBvK2NGU29SUHBqdEF3YVZ2WU5seEUzK2xsdDho?=
 =?utf-8?B?NWVoNDQ5Q3lYbVBUMHE1MFhKQ1JROTRBQk9GM2Jsak5QcVF1Q2FUazNuQ1Vj?=
 =?utf-8?B?OSt2ZC9GN0NnRlJkeXRUUENyNnZ2ZmlYMFFvbUlNVnB2cmZaS1NLYVJhK01t?=
 =?utf-8?B?ZG5lR3dNR2lpVUJRVEVUYXRvOGJNbDN2Zm0rSVhuSDFyVStoVUVDS1doSmI0?=
 =?utf-8?B?Y25HLytla1RYZEZFVGNneVVCOWxhc3E5Y2Y0ZFJyYWhNT1N3Q1ZCNkh3MFkv?=
 =?utf-8?B?cGtsQjk5U3NxYVd2RkY0c2kzRTAxRFIxc1gyR2hnQWFxY3lUTEp5VGtwQkQz?=
 =?utf-8?B?ajlmOTk5ekY3eXFFeTRkdExhWUYxcG1ld2MxbS9kOGRvTXhTd2dqR0p4ZnBM?=
 =?utf-8?B?UThJd3RCUVo4THh2cSt1TnNrQlFHYXdPUEdZbWRYbkpLUnRyb0pvWVZoS0NM?=
 =?utf-8?B?QXUvQmZYMW15L3pkZXdpY0EybFdVR0luUXFhMTNZLy9LdTlsbUxFR29adFgw?=
 =?utf-8?B?eGxXOW9yYVZlTDlzRkpZb2FnZGJMMStHVWFXclpHTmJZTnJaelJPYWRkbkdU?=
 =?utf-8?B?c3RnUG9oK3R1cmdMNVpXejU4U3NldEdJVEpoalo1cksrbHBGUEtoZk9zcVU3?=
 =?utf-8?B?L2VMZmIwTlBKamVPVHJFODhzMndCTHB6TEo0c0RyZnFWbndjK1B5ZXl4bDdq?=
 =?utf-8?B?OWRobzIxVXkzYmRkOE0vVVNmN3ZLTGI2eHBvbWxkQ2xVREZWcVdMS0QzS1Zi?=
 =?utf-8?B?c2lOb0J3bmJDL0wrZGdZTXJweGFTeXdiWVFwRkZ2WlhFaWxZdWdHcXBVMWY4?=
 =?utf-8?B?czhuV3JjeXowdkIwM2piSmJ2RThmV3VuSFZOeGp4YTVVbW9NNXdrbXBUcHE5?=
 =?utf-8?B?M2VZRkNoTXdYRUJxb0xieEdDMnZHd3hNaVRzT1RiUllxLzQ0MHpYWk5pV3l5?=
 =?utf-8?B?MmROQm5KT3JZaFFBKzVRT0VYdkVHR0dmN1VBWlc2NmlsQlI3OFo5bXQ2TmlN?=
 =?utf-8?B?aUhWMmR5UWhRdTNzM0d5UVBrQUhJUnFPNGlVcUdmLzZuWk5UV2h0MHl6b3l1?=
 =?utf-8?B?ZjBYaWJnVUFKK016N3JLR2RIREdBPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(34020700016)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 10:16:08.5343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b7710d1-d56e-4e62-285f-08de54e84434
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6813
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_021616_150543_9643F200 
X-CRM114-Status: GOOD (  10.65  )
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

K3 SoC's use a different architecture to ti,k2g-sci so update the
compatible to reflect the same while also adding the missing boot_*
mailboxes.

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi                       | 9 ++++++---
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi                      | 9 ++++++---
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi         | 8 +++++---
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi                       | 8 +++++---
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi                     | 6 ++++--
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi                | 8 +++++---
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi                | 9 +++++----
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi               | 9 ++++++---
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi | 9 ++++++---
 9 files changed, 48 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index c5ee263d34a6..c790fc643c4b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -181,11 +181,14 @@ main_pktdma: dma-controller@485c0000 {
 
 	dmsc: system-controller@44043000 {
 		bootph-all;
-		compatible = "ti,k2g-sci";
+		compatible = "ti,am654-sci";
 		ti,host-id = <12>;
-		mbox-names = "rx", "tx";
+		mbox-names = "rx", "tx", "boot_rx", "boot_tx", "boot_notify";
 		mboxes = <&secure_proxy_main 12>,
-			 <&secure_proxy_main 13>;
+			 <&secure_proxy_main 13>,
+			 <&secure_proxy_main 0>,
+			 <&secure_proxy_main 1>,
+			 <&secure_proxy_sa3 0>;
 		reg-names = "debug_messages";
 		reg = <0x00 0x44043000 0x00 0xfe0>;
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
index 9e5b75a4e88e..af459ed3d4ff 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
@@ -214,13 +214,16 @@ main_bcdma_csi: dma-controller@4e230000 {
 	};
 
 	dmsc: system-controller@44043000 {
-		compatible = "ti,k2g-sci";
+		compatible = "ti,am654-sci";
 		reg = <0x00 0x44043000 0x00 0xfe0>;
 		reg-names = "debug_messages";
 		ti,host-id = <12>;
-		mbox-names = "rx", "tx";
+		mbox-names = "rx", "tx", "boot_rx", "boot_tx", "boot_notify";
 		mboxes = <&secure_proxy_main 12>,
-			 <&secure_proxy_main 13>;
+			 <&secure_proxy_main 13>,
+			 <&secure_proxy_main 0>,
+			 <&secure_proxy_main 1>,
+			 <&secure_proxy_sa3 0>;
 
 		k3_pds: power-controller {
 			compatible = "ti,sci-pm-domain";
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 3cf7c2b3ce2d..5037efd73d8b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -212,11 +212,13 @@ main_bcdma_csi: dma-controller@4e230000 {
 	};
 
 	dmsc: system-controller@44043000 {
-		compatible = "ti,k2g-sci";
+		compatible = "ti,am654-sci";
 		ti,host-id = <12>;
-		mbox-names = "rx", "tx";
+		mbox-names = "rx", "tx", "boot_rx", "boot_tx";
 		mboxes = <&secure_proxy_main 12>,
-			 <&secure_proxy_main 13>;
+			 <&secure_proxy_main 13>,
+			 <&secure_proxy_main 0>,
+			 <&secure_proxy_main 1>;
 		reg-names = "debug_messages";
 		reg = <0x00 0x44043000 0x00 0xfe0>;
 		bootph-all;
diff --git a/arch/arm64/boot/dts/ti/k3-am64-main.dtsi b/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
index 1b1d3970888b..ab105fc1f718 100644
--- a/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
@@ -209,11 +209,13 @@ main_pktdma: dma-controller@485c0000 {
 
 	dmsc: system-controller@44043000 {
 		bootph-all;
-		compatible = "ti,k2g-sci";
+		compatible = "ti,am654-sci";
 		ti,host-id = <12>;
-		mbox-names = "rx", "tx";
+		mbox-names = "rx", "tx", "boot_rx", "boot_tx";
 		mboxes = <&secure_proxy_main 12>,
-			<&secure_proxy_main 13>;
+			<&secure_proxy_main 13>,
+			<&secure_proxy_main 0>,
+			<&secure_proxy_main 1>;
 		reg-names = "debug_messages";
 		reg = <0x00 0x44043000 0x00 0xfe0>;
 
diff --git a/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
index d62a0be767c8..98608793fa22 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
@@ -10,10 +10,12 @@ dmsc: system-controller@44083000 {
 		compatible = "ti,am654-sci";
 		ti,host-id = <12>;
 
-		mbox-names = "rx", "tx";
+		mbox-names = "rx", "tx", "boot_rx", "boot_tx";
 
 		mboxes = <&secure_proxy_main 11>,
-			 <&secure_proxy_main 13>;
+			 <&secure_proxy_main 13>,
+			 <&secure_proxy_mcu 5>,
+			 <&secure_proxy_mcu 4>;
 
 		reg-names = "debug_messages";
 		reg = <0x44083000 0x1000>;
diff --git a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
index dc5c02a025f8..a185aeb0ae2e 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
@@ -7,13 +7,15 @@
 
 &cbass_mcu_wakeup {
 	dmsc: system-controller@44083000 {
-		compatible = "ti,k2g-sci";
+		compatible = "ti,am654-sci";
 		ti,host-id = <12>;
 
-		mbox-names = "rx", "tx";
+		mbox-names = "rx", "tx", "boot_rx", "boot_tx";
 
 		mboxes = <&secure_proxy_main 11>,
-			 <&secure_proxy_main 13>;
+			 <&secure_proxy_main 13>,
+			 <&secure_proxy_mcu 5>,
+			 <&secure_proxy_mcu 4>;
 
 		reg-names = "debug_messages";
 		reg = <0x00 0x44083000 0x00 0x1000>;
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
index d5e5e89be5e9..21cc01ab9dba 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
@@ -7,14 +7,15 @@
 
 &cbass_mcu_wakeup {
 	dmsc: system-controller@44083000 {
-		compatible = "ti,k2g-sci";
+		compatible = "ti,am654-sci";
 		ti,host-id = <12>;
 
-		mbox-names = "rx", "tx";
+		mbox-names = "rx", "tx", "boot_rx", "boot_tx";
 
 		mboxes = <&secure_proxy_main 11>,
-			 <&secure_proxy_main 13>;
-
+			 <&secure_proxy_main 13>,
+			 <&secure_proxy_mcu 5>,
+			 <&secure_proxy_mcu 4>;
 		reg-names = "debug_messages";
 		reg = <0x00 0x44083000 0x0 0x1000>;
 
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
index fd01437726ab..81d352d7912d 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
@@ -7,13 +7,16 @@
 
 &cbass_mcu_wakeup {
 	sms: system-controller@44083000 {
-		compatible = "ti,k2g-sci";
+		compatible = "ti,am654-sci";
 		ti,host-id = <12>;
 
-		mbox-names = "rx", "tx";
+		mbox-names = "rx", "tx", "boot_rx", "boot_tx", "boot_notify";
 
 		mboxes = <&secure_proxy_main 11>,
-			 <&secure_proxy_main 13>;
+			 <&secure_proxy_main 13>,
+			 <&secure_proxy_mcu 5>,
+			 <&secure_proxy_mcu 4>,
+			 <&secure_proxy_sa3 5>;
 
 		reg-names = "debug_messages";
 		reg = <0x00 0x44083000 0x00 0x1000>;
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
index cc22bfb5f599..3f0cef544ca8 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
@@ -7,13 +7,16 @@
 
 &cbass_mcu_wakeup {
 	sms: system-controller@44083000 {
-		compatible = "ti,k2g-sci";
+		compatible = "ti,am654-sci";
 		ti,host-id = <12>;
 
-		mbox-names = "rx", "tx";
+		mbox-names = "rx", "tx", "boot_rx", "boot_tx", "boot_notify";
 
 		mboxes = <&secure_proxy_main 11>,
-			 <&secure_proxy_main 13>;
+			 <&secure_proxy_main 13>,
+			 <&secure_proxy_mcu 5>,
+			 <&secure_proxy_mcu 4>,
+			 <&secure_proxy_sa3 5>;
 
 		reg-names = "debug_messages";
 		reg = <0x00 0x44083000 0x00 0x1000>;

-- 
2.52.0


