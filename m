Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D51EEA84C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 18:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aoZmJ5nF8dydIC3eGAOhwdwJ6PHx87l4tOluCyScNXg=; b=MrTZLfT2VKZs4yOYvAh5ZAS/bx
	DfaWqG/YL24YSO4uRAqcNWMzupCewfYiGWiV5e3Gho4+RHWu2MldJVvruUXpvQjaJ+qlV1lRwyq/s
	sxAnyzg8qkhvG4ClAz/uZQ+Oya9PYGAddIIbAQ+uPUCywMwQo5wGHAo0X7IWqINVD+KLXHMBkKhpS
	hRf2tXvWFjYCgxlSZhLwxx5W1KFHRCEAUd60w0FGgkRQvjemPLfZMdaGkntCNFyj5XLohmcyJj5ha
	GLmD4hWqLwg+NZIircoib/XBEFVlGxRpTi+lI7mQ2dVzbLVEDC/Xq+DBjfKn5bDjqfO6wxka39y91
	vL9YTsVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqbeX-00000002XFM-0HTj;
	Thu, 12 Feb 2026 18:43:01 +0000
Received: from mail-westus3azon11011064.outbound.protection.outlook.com ([40.107.208.64] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqbeS-00000002XDH-1ZSj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 18:42:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRsKjPNwOEvFEFqHmZrwYQWGafKgCmsAj2eGKKuqkKJhWUCp/cD2/XFuA5iWbmRWmSxL19H8vNF4M72yTuD6M1TtRDVUov8JzupvQhwqfi6FYoAjZQQPkRQfUmmqHqvg5n39KnmAfZAiFDvlJF+blH8/Ecd38xMoAKOSPONcG0+j/vM+GXr5/iEtXJ5xLkdHF2WstZyNk69REkAne6UQ+106oPhFiu/BKAR+moEpOSXUcoAIJF37Zk79MyURa7w2P6wlgp0pSfinD05yMVXac+pTRWgfYCo2RRpXZ7NMui77n17P/SeeqHq8qakgkKU+tO9y0iLqiVx1You02+TphQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoZmJ5nF8dydIC3eGAOhwdwJ6PHx87l4tOluCyScNXg=;
 b=WsntJeYJnu7I5PlVwJQAMv53t6pLPToMb0tRkBHGQr4WCz2ruewhlrkd5tagDziadtZ0IjL5vZ3w5veVQXqRoQWQXgph1VXH2ea6gEMNQpy6r5kNwDif9UOO29Vz5zek/0RYiaq2beeQOJ5gSN6OOrTcyvG15SwpWKniw7D5t/zZHtnVrqXJ9TBAyW25LtwIy5UNyioo+Wxq6e3QOFk5bEhrklcRRtnZ75ufMtOWnn1xeoXnwLfx/bHj+cQyF4MA8uwanelEelSjAeiYbUKl7lQYLKE+rUm6DNwtu0trZT0BRD8TY/KmjPxZWkJf3/MAoEWhqEpki7/EdcSszuLAdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoZmJ5nF8dydIC3eGAOhwdwJ6PHx87l4tOluCyScNXg=;
 b=nX4Or/jODiqsWbtroseTk+0dRswIFdkwHX+/ETbjE2smB7PCIg/iuHV6cqGR55Rm+j/ZECtmShQKxc0aR5ZtiMADtDBFZQjIi+vim0GH0FyfMYJwNpP9TEmrpb/tn6U8dZA+EXJRs3F+AQXWb0DvK1yW5Cua9f/yZSnpCvZqN/0=
Received: from BL1PR13CA0430.namprd13.prod.outlook.com (2603:10b6:208:2c3::15)
 by BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Thu, 12 Feb
 2026 18:42:51 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:2c3:cafe::a2) by BL1PR13CA0430.outlook.office365.com
 (2603:10b6:208:2c3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Thu,
 12 Feb 2026 18:42:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 18:42:51 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 12:42:46 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 12:42:46 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 12:42:46 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61CIgku34002204;
	Thu, 12 Feb 2026 12:42:46 -0600
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>, Andrew Davis
	<afd@ti.com>
Subject: [PATCH 1/4] arm64: dts: ti: k3-am62p5-sk: Disable MMC1 internal pulls on data lines
Date: Thu, 12 Feb 2026 12:42:43 -0600
Message-ID: <20260212184246.2316659-2-jm@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212184246.2316659-1-jm@ti.com>
References: <20260212184246.2316659-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|BL4PR10MB8229:EE_
X-MS-Office365-Filtering-Correlation-Id: cd2983f6-0842-4885-36bc-08de6a668706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1PgKGzbbonT2YmZHe5+VzZf+HRZluJxoZoLj6kIQjLaa22nxi/GgRbU+mmQm?=
 =?us-ascii?Q?OJvlO3kWcGI6bI7m8kB4DJVE9e9QUQFt51dvoVsAYDeldcxcs6k/tJqdAKEU?=
 =?us-ascii?Q?YhFlU8IwWzoFW/BX9N2WbwRov4iPB33v8SZErXHfFsWDtYqm1MxCRH+L5MwD?=
 =?us-ascii?Q?JpsOr6QFBavUEyi6o7n3LPUp9HMCVAf4GPKBr5LOlZAdnpZ4Dapub/0tMbjd?=
 =?us-ascii?Q?ZFbOqnV9JLhkOeH3vNrm5gqFOqL/j2X8VCl/5K8EKTz0M6p4nfjwtFpKJ3BE?=
 =?us-ascii?Q?cXtFcijdGm7CCjnCpreV9ORRIgxvyKC4zHFqHsUWF4db9Im8oZo6HQYbv3ZM?=
 =?us-ascii?Q?OBVLcFT/9yPHphJBMHzfyhWKGqk+ccgoYgqmw8axWqyRycsYpfXTCHgbdYWs?=
 =?us-ascii?Q?NQnTfBlUdLAsKxlhO8QXTknS97E+/tSR/UyJnracVsrX1MGqksApoxzMSAb8?=
 =?us-ascii?Q?eJtCImZVyrHKIjeTV3Jhkjd6Swr9m3rQvfJr6P/9VqZZmS0imXU5EJb2vUkl?=
 =?us-ascii?Q?nN1kySS7kHEkE6jLARopdKgjR3vb2su8M/R4zcaKnKkXo6QW03mFYmcIXm45?=
 =?us-ascii?Q?8nN1HHBtEwYuFZ085En/mJ4fzVQFXTxKVRMavrwuDenqcyvL4geCCc+wAVWe?=
 =?us-ascii?Q?APN8gULftHni0ThKtyfZqG8k+xDUDrEwo6+2JkR0j5ABpbvn0WXiychzOAj4?=
 =?us-ascii?Q?/HiqVLsj+CdKF1my0bwmmONhTZy3OcephjswfYzL+cnqeKgSPeIyqs7wXQuq?=
 =?us-ascii?Q?I132hVz/qO+8LYLyQ0f6ZvMJjy12W2zWMJYjb+GoIPhD/aelRk9etIakLiyp?=
 =?us-ascii?Q?hEsNVKM0s9RvPPubNBH7yZVy32CxO5Ij24/LsuBUJI85Jq00rBjFznn7GGPq?=
 =?us-ascii?Q?56ZEtCteR06YVZsbrp9VgPHHi9pf1aCtaxn3Cj54UuKeTbhjXPVhImn4iGfI?=
 =?us-ascii?Q?en6X4aM+qak/jyKaySiG2R/HLUqncracKuLcNcgqIZzNo9t9i3P8fIxSQ9p6?=
 =?us-ascii?Q?R8S77qObHRIJ4xtEIFxidfTx9ASRJ5P64r2D81ElGQssaTnyh4agc9YZMvRl?=
 =?us-ascii?Q?aR8b5KV+6Hffpoyek5+EyFdZF+9Ot+L/QrD2i63ZRCN8vZEsdLKI34ORFoRs?=
 =?us-ascii?Q?TC3i4hlG7Tfespjq7G55iIkCds3h8GWEo+6Ncm5OlnZWIHfBKCZB4+PnNmPk?=
 =?us-ascii?Q?zkFUnoHnAAQGT4mlVYpGxlYjE3m+Yi9RrcaTGB/28ampsAkaRVBMd8O4jDnD?=
 =?us-ascii?Q?i1gnHnWd4tj99YdmNdDcYoja28mXpPP9alWHJlmWCc5eQDZiQ9MWrjriULs7?=
 =?us-ascii?Q?+F0syBhnzxi8FJSNR1NuHCB2RXhKob7sCWD3Y7scK9GmtFlXFEcTR7ssdkLu?=
 =?us-ascii?Q?twQmdKoi5ZUZNTJcbtB5qOXiXXFq8tU5EDzPmFEd9XrR+vvgA5t3ZEiZ8+rm?=
 =?us-ascii?Q?bWr5YyVPfgfB5pPwuvo03JQk12melZMnhosW3PEJavyCRQ6GyMm0Ec6tqFiP?=
 =?us-ascii?Q?CKDslJVE/zVn3cCZp42PfJSz4gDSy0a3dEwSf60i83vIig636uKnfnWWEML7?=
 =?us-ascii?Q?uwdb/bRylhStUQIFfHW8fvUJ86onl9rgQA+Wyas/yJ5kpe4XxQZf/18zCSvz?=
 =?us-ascii?Q?BDzfyMU20LSRjrg5KXY0pmWld04OYbF4CFPFyxPT0zKUvrm886IEUw1ZorWJ?=
 =?us-ascii?Q?SY9rbw=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tELOsz5Y+muAmwCyjzv2V0AknFYtCKqny2xCoRyum6kFnsbYrwk2wdNBYZBkZgJOu00ye+9nV8aCjBPRRze0+MjXEFBmLuqzbNpusERBNBOaDE/ClLXrR11zXa7RVxTFr/zxkTWWgTvwgQpVFP0IS/u4Van6K/IhYoTCwVQS++bgOGqG2QKsvI/1VVmEdrpulVfh+8QLlq77e3Ry4u6smAlXa6cc6ZzfIPBQ2c/xeXvZp+HrKED2qZ2RH5MZRSpNTdtLHLeK5++TodIH+3u4Dn4FaUDPW8PGdIUQ3aOeQqao3XfJn+jJvz8eXivf4UbEt/RpsZQJQOyL2F7Q0XfBrosMM8AZmkeU0Qb+kNh7KOOgnxtYr/lqcZa1Ibx/LCMYCwQoSQVDelglO2JVr7kLnwqVN4NKcRLuGgY6IiByYcNPpq2iI/2vuNMrdcCjYYce
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:42:51.6537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2983f6-0842-4885-36bc-08de6a668706
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR10MB8229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_104256_673061_DC2E2E57 
X-CRM114-Status: UNSURE (   9.64  )
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

AM62p SK has external pullups on DATA 1-3 pins [0]. Remove internal
pullups considering:
- having both internal and external pullups reduces the total pull-up
  resistance < 10K resulting in unnecessary power consumption
- mismatched pullup resistace between D0 and D1-D3 may cause potential
  issues for modes with tighter timing requirements. The different pull-up
  values cause different rise/fall times on each data line.

Fixes: c00504ea42c0 ("arm64: dts: ti: k3-am62p5-sk: Updates for SK EVM")
[0] https://www.ti.com/lit/zip/SPRR487
Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index 4f7f6f95b02ef..35baa777b9121 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -271,9 +271,9 @@ main_mmc1_pins_default: main-mmc1-default-pins {
 			AM62PX_IOPAD(0x023c, PIN_INPUT, 0) /* (H20) MMC1_CMD */
 			AM62PX_IOPAD(0x0234, PIN_OUTPUT, 0) /* (J24) MMC1_CLK */
 			AM62PX_IOPAD(0x0230, PIN_INPUT, 0) /* (H21) MMC1_DAT0 */
-			AM62PX_IOPAD(0x022c, PIN_INPUT_PULLUP, 0) /* (H23) MMC1_DAT1 */
-			AM62PX_IOPAD(0x0228, PIN_INPUT_PULLUP, 0) /* (H22) MMC1_DAT2 */
-			AM62PX_IOPAD(0x0224, PIN_INPUT_PULLUP, 0) /* (H25) MMC1_DAT3 */
+			AM62PX_IOPAD(0x022c, PIN_INPUT, 0) /* (H23) MMC1_DAT1 */
+			AM62PX_IOPAD(0x0228, PIN_INPUT, 0) /* (H22) MMC1_DAT2 */
+			AM62PX_IOPAD(0x0224, PIN_INPUT, 0) /* (H25) MMC1_DAT3 */
 			AM62PX_IOPAD(0x0240, PIN_INPUT, 0) /* (D23) MMC1_SDCD */
 		>;
 		bootph-all;
-- 
2.52.0


