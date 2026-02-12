Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCB7EEA845
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 18:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nga5N8hRFxN/Wxrncvx57EzRe2bf9luhOmlOAwmbSNw=; b=uq5YjFc/+kUUJisPR1WxHqnKj9
	cPNDwoCZlVbtQNpW6noza1RCJ+UeVtH0LkjzdCddvZqiftuIwd9k+thiSUisEwwr0CtCqKa5L2wzX
	XaUh5HXUBz1GZS0gDUoF4RkgD2xC4axFlLGWXX2o/8Wstw+PmsE5TWgrN7h4J+8f6hpI8zV4NzW3/
	dHPwJbS/GQJP0qRHB27d0WeGh0jpgdZSj3zOyiedJWjC04Kltbckc0/UIqapixlibKytqdi8Qr1LR
	1oFjD+1bhpaa6gqTRFAbOY45fDNaqxSe73qfIC222Hs2pR23ei5ST/MUj1efWKuXUfTXf8NXWnBGX
	tONZERsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqbeX-00000002XFf-1Wm4;
	Thu, 12 Feb 2026 18:43:01 +0000
Received: from mail-southcentralusazon11012053.outbound.protection.outlook.com ([40.93.195.53] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqbeT-00000002XDl-3U7d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 18:42:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytIqCHqH9nMrquatNs0ZWdh8k1y8R/Uy4sl9IKiztfYK/V7TB+1McTa8qJyqcCUFoRou0cfBVPol2kD8OeudJ++lmUG2LxTnmguidOJMH4J4Frp4w9ooz7lY9aY1BCMR4Xcoy/kXPQk1Fa4nYvOOsloY2dcZF6CzKVf5bEZihp90aWt8SFyhNTFVIuqM32+Js7xt3rHeq1rYsT/zmTepeLuxY4rONRTxrxLCjpAo+0NkZcLVftmqGLmVvt+GpTbJamrM65meOEfwIoVNcesCBqdapuvlJwWCNwp2QN5y2kbVd6sOV33Vv3wJdY3LTbrOdLuICENoC1KD1DFq1IZ9eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nga5N8hRFxN/Wxrncvx57EzRe2bf9luhOmlOAwmbSNw=;
 b=q/6MOpw+xZZPaDqxWERxrw0N5i+VZCWMoB0z7n6wighZ0uRLptlw9NFHf4VE+DdesFHIWHs++2tdcobLkjyxkL0uSD/dTWhM8Tfd3XnrSmiwI6D1sjeyCsLXqSlRyu9fl1VqGUu55Ly6ZVYIp+L48bf5aF9HZch+p12TeonO1hK6l6IVu7mO/Jvdu/3s0jniDUx74hNxJtUBXDwmUi0pv6ADbbwg2OJ6hC2HcKb2QMUNONFkORyUzK/BoWdwCVOP8rnBGwP5jO+zC27cO6qeNCP5f7dT13ga5wXZhNl4F0I1XXXkRaHMpF6pb3Sw2b9hRE9vqV2GkYUOr+8lTUqjPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nga5N8hRFxN/Wxrncvx57EzRe2bf9luhOmlOAwmbSNw=;
 b=uebaeREF9HF4zna0P20RLjT+puq1B1nqrj5EI1hLJximGjgYV8AwZhZEJxLnGBlVAZGA0K1fUV/QpbGaWwIDGSQrYhKLMgLsBE1WuarEqsWpWaIfudByA1OyA9yPWOQu+IjYnR8y3U17RqtCMNLv2sXYaHW6QZvv+sY8H5Pw4kw=
Received: from BL1PR13CA0424.namprd13.prod.outlook.com (2603:10b6:208:2c3::9)
 by CO1PR10MB4579.namprd10.prod.outlook.com (2603:10b6:303:96::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Thu, 12 Feb
 2026 18:42:51 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:2c3:cafe::e5) by BL1PR13CA0424.outlook.office365.com
 (2603:10b6:208:2c3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.12 via Frontend Transport; Thu,
 12 Feb 2026 18:42:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 18:42:50 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 12:42:46 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 12:42:46 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 12:42:46 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61CIgku54002204;
	Thu, 12 Feb 2026 12:42:46 -0600
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>, Andrew Davis
	<afd@ti.com>
Subject: [PATCH 3/4] arm64: dts: ti: k3-am62l-evm: Disable MMC1 internal pulls on data pins
Date: Thu, 12 Feb 2026 12:42:45 -0600
Message-ID: <20260212184246.2316659-4-jm@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212184246.2316659-1-jm@ti.com>
References: <20260212184246.2316659-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|CO1PR10MB4579:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ffbd400-0f16-4673-f13b-08de6a668650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?A6mPalBjyS67NZppn5cOgyZXcFfgN/CYQ9pNBiVPVObCVjbCZeAJa7SST4uZ?=
 =?us-ascii?Q?R7ow+gpH3hocWiZQJ9sKP849jrolm4ELDjxVjp9OearI3hiU62IPomQNJKjl?=
 =?us-ascii?Q?kNS9XStGf1UsPTrm3EdxPyiUn5SenMFdB2tc19nNmqJQSmnOye3zbGQcjfh6?=
 =?us-ascii?Q?cbxDipJiwPFQiXI0HlZyxSMbwOHeXRjMN0R+fBJmQ1jISGSw//0DPNHDAODL?=
 =?us-ascii?Q?7MyrfspX8yHrq/fnBe/o+FeoFLATL2wAfFzYFtuhMoba0Ic33P59E9w12s6e?=
 =?us-ascii?Q?4c8UvaVu7duKFPezKXAlw31PwmCaUCETsD5Rb/ndTdhXPSsTNV7sn5hSXbUX?=
 =?us-ascii?Q?KQHC1Ef6RX7TQDOUqZw8QUP0s74g+mSRVbdhDjVoCM2t5Bu+Y++sxxgTY7V1?=
 =?us-ascii?Q?/1sxu6Qt5WPMcSiyCarSCs7t+WNGBUl8TbOytjnCt8pqgVvPkAHR+WPuxhTA?=
 =?us-ascii?Q?hbPZGnMWg/y9f1he7+or8sTgErQilG4O5Bnu62xiXHRh021RvbaMqtPnnEUo?=
 =?us-ascii?Q?5qfQhUPs8nMB9Zel5AfEeCw9c2g3Xy6blJ0CHxvbivZTIJYJV6V0f2BM3XSd?=
 =?us-ascii?Q?92EbZzOHW4IlLiECySWORs6gN3H7eveg95dNRGVo1fJH1cf7kyZy8S3fov+N?=
 =?us-ascii?Q?LkCyMyBa0JwDTCIaEOsia+dideBUfo5ZnTc24P/f57Rrt6vN9qjwYlW4/fzW?=
 =?us-ascii?Q?QJ17U2/5O0Bcp6DzM6OAwu4r0qHbVm79Zvgs3cj16M4qx5X38LF6unLGQnXj?=
 =?us-ascii?Q?ILDm9OYD9tNcg1EhrcxQUJQ1ivw9xN3Fuj6iWeIFmPBKNJiczqT7KZ8VnYSI?=
 =?us-ascii?Q?iDGxwiMSp98Mme6Agf415PmAZPAu5IrctTG1ZUVyDhfWkoBhUVctHvy76mYJ?=
 =?us-ascii?Q?TrOFICsly5nQS6RG2T+guj+sgFeO7CEVaNGH+BfQEKkwKgoxbAa4f4M6zflM?=
 =?us-ascii?Q?f9YXSJsBDBPOSkNsNglA2PJ6KL2/W6VHb1cDZB0UpyNUsQ/qSI6H4L8uI3+Q?=
 =?us-ascii?Q?7gkw92oDOSQAVmEfVDgH9sw9ESQzsNuBbCn8IdsoeGuaOvyG+l32DS6avULH?=
 =?us-ascii?Q?6ww/B7J07NErNNS2f4LqwYVMud3CBfemCrC3EgFylkNQBIQnsYu53YH2BAwk?=
 =?us-ascii?Q?PhCqWhiN+Lw3DAqKgGGov8Tou/TE16VMaLZ8BpFXez/YrrCB6IFCdlPrR5xQ?=
 =?us-ascii?Q?TH6KMkkcqgiuZo4ondwPt9KbEudI6vIq4xLKrirxuv+jzdzYuULszGVarf2c?=
 =?us-ascii?Q?jBipAxTZ0garHOAjjhfvreXTjRdlKOJyTbqK/CxyVDYuDAXtzfRmvou36vfB?=
 =?us-ascii?Q?7CYnkiOIBG4IiHuaNh+XEq8DcBYaMQgHdwGIkvOfRFv6xyoj71OrqxdeTVcf?=
 =?us-ascii?Q?7xLJ/9E9uthiQ+Lc1ZjhR6X70BwcGgIIM2zxnbTRytEWNrHyaOtCU1omQNH2?=
 =?us-ascii?Q?QL4NeQmseBKCvoAzoJEL0Y54IjyBRepmDv/X9rQbnudBf3hHogSQ4vZ7q1FG?=
 =?us-ascii?Q?CRRWENNwJRVq8S6XsOEo+8pOUIAD50iud2EJ6ieOcjiu7DTIvj/tiKatRtca?=
 =?us-ascii?Q?fnGRZJcyTammEi9Tb6K8N0kv72gKcWOTVVdx/tSTHOgNEep6ZQnMufdDWgOv?=
 =?us-ascii?Q?i/Wuuv9oUyn/hsbvk4GM9aJ6rgfn/QtsNoBL3ZjRAaN4CsAlWCADSbWmXQBd?=
 =?us-ascii?Q?cfsI7w=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: i4X622jEU7IE9LaClUJl5m8FXQ/zlJUYgKiaawDTu1GmwR62lH6QNYnUlb8B1e27+1aFgHpJiQZUCvT6Jc2kyMT2+iD82wdUYL33hloegoJ1RuSmR2sa1glvSg8Egd4OPjpRMOtY6jJ7cnVDAM6HlPeOIA/F7ytM+bOjN8MJ0LjQrdICHMJyWwOnPamHASszaaxxtGhF6sDSPEXPaDcBthfMIn98H1qyeBvFqg3BzJBtwFWfSCjqPZvHm/n8dOFhYxoG+OVkh2Wf4KQXpY4phLLKcNgCyG6xxVKg+yFu07J+1WrKSQ70FovgPKPvMyr91DgWGb3xrVd/O7cU6pZIz/yeZzV+PYbXYdrCnvyCI6ekoj3xshw2TiGLFQHziGffG3cfn1KHf6uJeqMgKwSIKzGg0nlN6CkMW5Q7JvZPVgQTREdol5u9dg3sA9dWE1Xj
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:42:50.4723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ffbd400-0f16-4673-f13b-08de6a668650
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4579
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_104257_867176_9A343311 
X-CRM114-Status: UNSURE (   9.63  )
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

AM62L EVM has external pullups on MMC1 D1-D3 pins [0]. Remove internal
pullups considering:
- having both internal and external pullups reduces the total pull-up
  resistance < 47K resulting in unnecessary power consumption
- mismatched pullup resistace between D0 and D1-D3 may cause potential
  issues for modes with tighter timing requirements. The different pull-up
  values cause different rise/fall times on each data line.

Fixes: 00fb4c73b67d ("arm64: dts: ti: k3-am62l: add initial reference board file")
[0] https://www.ti.com/lit/zip/SPRCAL6
Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
index 5085cd255fcd5..98e58d3e7d752 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -272,9 +272,9 @@ mmc1_pins_default: mmc1-default-pins {
 			AM62LX_IOPAD(0x0230, PIN_INPUT, 0) /* (Y3) MMC1_CMD */
 			AM62LX_IOPAD(0x0228, PIN_OUTPUT, 0) /* (Y2) MMC1_CLK */
 			AM62LX_IOPAD(0x0224, PIN_INPUT, 0) /* (AA1) MMC1_DAT0 */
-			AM62LX_IOPAD(0x0220, PIN_INPUT_PULLUP, 0) /* (Y4) MMC1_DAT1 */
-			AM62LX_IOPAD(0x021c, PIN_INPUT_PULLUP, 0) /* (AA2) MMC1_DAT2 */
-			AM62LX_IOPAD(0x0218, PIN_INPUT_PULLUP, 0) /* (AB2) MMC1_DAT3 */
+			AM62LX_IOPAD(0x0220, PIN_INPUT, 0) /* (Y4) MMC1_DAT1 */
+			AM62LX_IOPAD(0x021c, PIN_INPUT, 0) /* (AA2) MMC1_DAT2 */
+			AM62LX_IOPAD(0x0218, PIN_INPUT, 0) /* (AB2) MMC1_DAT3 */
 			AM62LX_IOPAD(0x0234, PIN_INPUT, 0) /* (B6) MMC1_SDCD */
 		>;
 		bootph-all;
-- 
2.52.0


