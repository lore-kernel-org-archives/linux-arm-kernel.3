Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9392FCCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 03:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qu6VmrqWmosA9zugNYnFMbUbxzHsij8zlrPGdc6XS94=; b=IJQdeAYeDffGyOn17bxRy0ikwe
	WMtLvUJ8Fj/4sXBfsKq5Rjo2uPslfavpYXAIkuTAu0jZOUjHgnriCkkFZbbOhMB0gjI+4krNK8eGe
	CuhLZCwPjYQCeNdJqss/jXNhF27EgMYPErUUPHfpiMYrZbXc9aeaWyLZ/dGbD0EXKMhdoPDVOy4pf
	N+QVmt4OKsgMEzrNYaSq9ZvDGr0JgHLXGJuTFU4bIukh/FnTTYgY5UMhmX4BflMKrc2qjECcwucmm
	DFpHSkopPadj7W78oM/89LcZTAGVSdeArLYj6rsk9ygnoyk9wmFKRRj1WnPt8lf+g+qthcwdGMceN
	LNfU+mew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDwlW-0000000H20T-0muU;
	Wed, 29 Oct 2025 03:22:26 +0000
Received: from mail-westcentralusazon11013068.outbound.protection.outlook.com ([40.93.201.68] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDwlS-0000000H204-3ll2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 03:22:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EoPVgJO66sPmEfImFEq5TAzFBdOuvqfBTXtJPtq8blV69/NG3rjWkpG9PL7hz2RHnrMbeZ/dXpwY7S74O683GNffBmIxkd5YD4g2yRtLQTIyrUZFZopgxiM9/6vLu87TUzyj48kiMfFglMzGbPCUyFx4yKcnJThbLWfB9N4OfJDVaWaAw3pm4Gu7X6sWw87UOwgbTlb1k0Pw/S8QYvI6eViStVEOfCVuuPu6txiZSqbtB6VTBILtxmrKXMAptLlrh6Gp3f3aaXVV82/CeLBzv8Ymcu1marKTPoDxzKpq7zA8u0QV4kY0BeY6YkVsTHJRo/U8D2xFXfCtt8apVWPAwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qu6VmrqWmosA9zugNYnFMbUbxzHsij8zlrPGdc6XS94=;
 b=L+RujOPJP+7S6zURinqsMMaE+SxteKvOpbyEG70V8rCjAwfKZpLCkBVIbqF7/VACxb59qE1FeNSYGHte+Z9uPkh3p4n27n2fKkE/3j32pZPC46eYrLaYJ8uNKpFumABKYTuZoP82fKpsYgY9pnkBSMwqf/FXHl+ShO8NlVHKim7y59qalLq/D0OCTyS5fRF0SM3Fi7Y6Ko/MIN0UgcK8p9NFlCe1eBnhLFC7q87CX9PMOK+3RtcVtpATX/qbeIFHtwpagnQom19sQxtW3Rehsjv78ee0G56guGMHrQrXv6S1sWWbm69jQgdP5922Pp11fFzq/E0h/uFUyapZAmSE1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qu6VmrqWmosA9zugNYnFMbUbxzHsij8zlrPGdc6XS94=;
 b=GmwvlsWqO5rbxZwgE7E2X/QwzYP4NrD+Z5rRbtmC2VQ8U75+8VTZq7DmVxjtPbElcQbtBtcYaPHmtkLqCvrBcKOKC+C8+2He2mt2wyiE4jbu0spiSS8lYGZWt4hXKs9AOTeI0FXM6ODR+ZcdQN45E8gvs4k3ZbOYMnL2vUMSxzM=
Received: from BY5PR17CA0011.namprd17.prod.outlook.com (2603:10b6:a03:1b8::24)
 by MW6PR10MB7688.namprd10.prod.outlook.com (2603:10b6:303:246::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 03:22:18 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::90) by BY5PR17CA0011.outlook.office365.com
 (2603:10b6:a03:1b8::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Wed,
 29 Oct 2025 03:22:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 03:22:16 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 22:22:05 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 22:22:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Oct 2025 22:22:04 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59T3M3ev3352138;
	Tue, 28 Oct 2025 22:22:04 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>, <s-k6@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-am62d2-evm: Remove unused ospi0 chip select pins
Date: Wed, 29 Oct 2025 08:51:44 +0530
Message-ID: <20251029032144.502603-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|MW6PR10MB7688:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ce35674-7ca8-40f1-73ac-08de169a5cc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oxZt184DPxYzh3vqJj+yPG3wosCEvXKb8m90fB3rkfBGu0dUnWY9e+m14BKd?=
 =?us-ascii?Q?x8vTH7RslxmhHpJ07iX1LQdnf9m1oSqm7tjpawySfBkuphebF+wgN871vw4O?=
 =?us-ascii?Q?hJ3MU6ZAcGmkaMuffqvdJgzrVhuYIxP6+7hU+GKpTgxJUAADi1nZoDm/AFpA?=
 =?us-ascii?Q?aaYoIA7SI2mgopL3cDBiq02BktB286P4m3oxarQtUGFNvfO+20cm3fwplaCD?=
 =?us-ascii?Q?SCmX11kMORsTl712IBt7MTradIzUs8UB1KD6X6h8jkENrY9WUZLGi4U6LBhu?=
 =?us-ascii?Q?FhQKZcp+aMFO0sE/l4E1Yj5FvURkaeMvEMy9yRcHYbxJ0QCrPuNZqTIbua2x?=
 =?us-ascii?Q?KHT2Z2bmchhiKXaYi/U+yhccDfked2BEipvjQMY2QWROskKGywbypNajIZk2?=
 =?us-ascii?Q?LXCRjqYGJQFIgYfoFib+1uS8mJSY3r1tqo92YuuTsVN7pNsFb+t8hPDw9Y0T?=
 =?us-ascii?Q?c+YUQTqfvF/xBKGlX26A/yQx8P7UobMFRPVC65Yzw7lpZsYtbSm9+h+2CAit?=
 =?us-ascii?Q?md1LdtmMe9XYZTIKD+OX1wlzVDso2qcbel8FI6sWHXpcl6Xm3Ke9pZMKnv95?=
 =?us-ascii?Q?oCWv+Lwq+4Gz1/b1JBNNChs6w580KuYAkhh87cFWMbbGWH92NvTn1S8zDKv7?=
 =?us-ascii?Q?tOjOhn0bjdsQUEv0DeUvwk/wvdxcnL/XzAFgzUdRdhLAoq4/GeMo5d4CPeEw?=
 =?us-ascii?Q?6OwGE9qQ4NrOE1ZbgVPDpxnQHQ6IXYLj7Wyn0gDEpWcqUMTX/LOiLUoxtNUC?=
 =?us-ascii?Q?cxTUqiHaNj9z731bBJD2Q55zyv0c6iPHJK4ObUv7ipADUPLeWS89byKdAJU0?=
 =?us-ascii?Q?4PwvfGOchuBWQATvwFacKDRjuzf66xP3dQ8uFkLyx7K9xElIGzwsH/Czw82W?=
 =?us-ascii?Q?5FwgZ5PZ8ag+/KhAGWfNJRIVftDDgeEJSUZHPoJ5yXcL4DR9PTOTA24ZTPUn?=
 =?us-ascii?Q?NbbJYvTqx2KW3mrtGBm74ntaeuWSvKfMrxX+qxfbwi3dIb6kj3qw+NjEZgd3?=
 =?us-ascii?Q?UVaxJ3zgo/4ek4rP7gZJjGkmFuqSSblRVMVD8N5iynvXCJ78+PPW89fJZzyC?=
 =?us-ascii?Q?iJ+9bKzrWC8b8Ku2fVXj16/FuTJRTUo7lnSCl9z9FDPtMezYKC7N2d6pMV1V?=
 =?us-ascii?Q?ucF8aXicvQQ1yC25laqTVPrjce5ykxN/CzfE6MPRBWukipt9Qnr3uGMQ7W8R?=
 =?us-ascii?Q?6nfv1wTHvtg2ca3E64oQOyHJ9QsKWoWbnMWrpUpRRWdCSJ64s90sx5w7NWZP?=
 =?us-ascii?Q?qmKh1krOU9cQA0braYf4eRewtngN9USQqkwQeihf65IxQCCxXleSz225++pN?=
 =?us-ascii?Q?tjA7hhXtvuaojlETisxj1wo6/omgIQCOa3MfE6z6xSiG3wpPymXFJZLvIpC+?=
 =?us-ascii?Q?gUqBCEOq40g5KAqA0yrEwtETcHOGxBubKasGwTJugq4Gl92ufjhly1wQPVQC?=
 =?us-ascii?Q?i4cwWJAFJQmilnEDkgyGxbpkhDQbdNn/6mcZfbr1q26wvu/1B71m79W3Yetu?=
 =?us-ascii?Q?iavHg+i5cHavtwE=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 03:22:16.8980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce35674-7ca8-40f1-73ac-08de169a5cc0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7688
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_202223_052983_E4CFB042 
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

Since only a single flash device is connected to ospi0 retain only the
OSPI0_CSn0 pin configuration and remove the unused CSn1-CSn3 pins from
the default pinctrl. This simplifies the ospi0 pin configuration without
affecting functionality.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
Boot logs
https://gist.github.com/paresh-bhagat12/ac3b7e8a39f6f35004d9c51c6384f0c4

Datasheet - https://www.ti.com/lit/ug/sprujd4/sprujd4.pdf
Schematics - https://www.ti.com/lit/zip/sprcal5

 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index 83af889e790a..bb5af52ae8b7 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -355,9 +355,6 @@ ospi0_pins_default: ospi0-default-pins {
 		pinctrl-single,pins = <
 			AM62DX_IOPAD(0x0000, PIN_OUTPUT, 0) /* (L22) OSPI0_CLK */
 			AM62DX_IOPAD(0x002c, PIN_OUTPUT, 0) /* (H21) OSPI0_CSn0 */
-			AM62DX_IOPAD(0x0030, PIN_OUTPUT, 0) /* (G19) OSPI0_CSn1 */
-			AM62DX_IOPAD(0x0034, PIN_OUTPUT, 0) /* (K20) OSPI0_CSn2 */
-			AM62DX_IOPAD(0x0038, PIN_OUTPUT, 0) /* (G20) OSPI0_CSn3 */
 			AM62DX_IOPAD(0x000c, PIN_INPUT, 0) /* (J21) OSPI0_D0 */
 			AM62DX_IOPAD(0x0010, PIN_INPUT, 0) /* (J18) OSPI0_D1 */
 			AM62DX_IOPAD(0x0014, PIN_INPUT, 0) /* (J19) OSPI0_D2 */
-- 
2.34.1


