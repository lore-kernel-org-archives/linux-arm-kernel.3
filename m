Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9227EEC2AF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 23:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MoRXH468/WuF3AO6/sFX9cSMS9ynH7XWbdu4mLYb9rU=; b=anjadT6iEhqTaM7tICwKHPAxfE
	yFGUvFlBaTeo4d+ZiqY7hIpkznyOsY/ZuSmSgnUFxu6xMUmByZaQNQs3v8t2Kl3q9c5Yv/jCL+2Bs
	SPH/N4wsE5UwRt5r4LIjtftnJfGuHZRHHaexX2mEoLXZT3AgbBfxBmQBt6sDLaskUmO9wJhHj+HbC
	gS5vocECj5gi8TwPjukUODOb683fJK1/PXwXT+iMw+Q/Sz2oiCs0SmLfznPrsN3cSVgqE+uFe0u45
	0Pmn+HXWFOfB8JbE/bCvYDeT9mWIyNjlLKmU/UPWR6eNKz97d/bwoVFC81jsaJOz2GAXtpUj+7RZx
	C6zUduWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vufUn-00000001C53-2mOe;
	Mon, 23 Feb 2026 23:37:45 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vufUe-00000001C2C-3xfy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 23:37:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpWzWOIRvbFNHGz/3w/hbI9gIUBD/CyfL++Q3TBjLqXgTr1j/4VXIgGrxxcV3RSQ4dk/OaKDGk48V4yLeIxI7UwkZr5SLiYuxywTlu1sJhefYsTq6esuJHAYYxv2xjnVnUYFxNpAhcyQYqiTCwR2D32AVQCXbRx+kR/mETDhhVrksPLiAqZsPUGUqWty7GYZm9KgHPdv4goAkjRmFqrVB/0qpUkVtVCGJZ6j1bNu3svPN8kH9tFCksDx8ZMnWkVd2rilTjZzoaU6UFIyUqXSEIMWDr8VXG3zCbNRVHP7zy8DM/+ndZ9oagwakhQg1Z8UObexiN7aD5molcg+y5EuTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MoRXH468/WuF3AO6/sFX9cSMS9ynH7XWbdu4mLYb9rU=;
 b=Al2thq9fSz9zqffAKIv/vv1tGl0YALbMRvn788MpbFsGKS26vZGqrPEL/hhwrPPZnwtELNJAuc4wO6FHIGQE88HoMSwyM+Xf9sYSdVYmKTb2GAr64dN2D7axNZxSv2YT0N0oZtgbg1iuU/nWjslLs94H+MhoND0yVZMxAZW3jpetelGk3sdYEu8wi8WwnX+519Q4bArR+R2OyJ6P0B0DdXvys0WiO++vJaVaXOIWAkDy2MePImZaMGXQq9iLvhFfxTMeGPCMJukB4Q8/XI9UnZD5PYNuwiswUn9UmeDSKWxde9jHC5ejzpnZGwwgp0VBqkkmrVUewKbRyLBWWrrYNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MoRXH468/WuF3AO6/sFX9cSMS9ynH7XWbdu4mLYb9rU=;
 b=nVoR82jAvrQ8yWxQaLxs8z/ztgxfUpokRs+Z00KRmboWZBQ2As3CcdiaKNcvWb695QiuWjIGZgkVsWn3V4TX8u2OcRRXZSuUv6dejZqrIMQWHOCgQeSMNl4Z/g/IFUBnwnFD+Fufr9GMjIo1imizsM6DsFffZCN0yu1QtHd5zrc=
Received: from SA0PR11CA0177.namprd11.prod.outlook.com (2603:10b6:806:1bb::32)
 by DSVPR10MB997798.namprd10.prod.outlook.com (2603:10b6:8:38a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 23:37:33 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:806:1bb:cafe::15) by SA0PR11CA0177.outlook.office365.com
 (2603:10b6:806:1bb::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 23:37:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 23:37:33 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 17:37:31 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 17:37:31 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 17:37:31 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NNbVXu1677488;
	Mon, 23 Feb 2026 17:37:31 -0600
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>, Andrew Davis
	<afd@ti.com>
Subject: [PATCH v2 3/3] arm64: dts: ti: k3-am62-lp-sk: Enable internal pulls for MMC0 data pins
Date: Mon, 23 Feb 2026 17:37:31 -0600
Message-ID: <20260223233731.2690472-4-jm@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260223233731.2690472-1-jm@ti.com>
References: <20260223233731.2690472-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F43:EE_|DSVPR10MB997798:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bfde66a-25ad-4fb9-9e7d-08de733484b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1KuNs1ObKyBnXvfj4+00+KtQKlvNw02KdF9gBNfW+w70y8ECembYcMtASDJV?=
 =?us-ascii?Q?GDULGtuqFcnr5fbGT/YAS6k9oZjA0yMIP0XymJs6zx05+CFvpTBTV5ri0NWU?=
 =?us-ascii?Q?yekARXucnzh2nKfe2DPec2qXmY8fJzVGOQj3FfUSuy6X3Ud6owyLILqo8eks?=
 =?us-ascii?Q?pXhmydqcBDqNNaansZF9cUSY1eL/sGUD1/24u7CbYO3bQnNENxJUT5ZeKxqT?=
 =?us-ascii?Q?IhQpmfqwMamrM+E0JJUqolvKIe6b90iDM448E8HkNrjUYdb+ENi/8CeBSvM7?=
 =?us-ascii?Q?cLs7YkAlDfhPmfGfA+ttWkwjBvrOOgku0hbNhdTqRnZo7bB4Tez6eqXSlNCK?=
 =?us-ascii?Q?gRE/x5uJayFkbXLIT+3IMorj7I+A4G8u+WGscJtigXouOAuaDEbxUVPxmfwD?=
 =?us-ascii?Q?uxgQZJmvhJbIm6QiMtQMjxN3uFtnQ9OCxfqX4phKXsFhVksROqkrV0SID5dG?=
 =?us-ascii?Q?uneRUrXBO/5ucxeZYJHBn1eCCqJareYfaPAN2gZccHZ1HM9Ufbj1nRrJENCG?=
 =?us-ascii?Q?d8s9WmFu6AIbC/zY8m5lM5S8KlHv+aHpe7u1WofCLX6X1HWt14+2nZGg8SKg?=
 =?us-ascii?Q?/oBLZ4ABW3yHvgTnVMzmgkK+yZFk14yp4Z6xKeZyjXLKYX9GESPZvwK33Kol?=
 =?us-ascii?Q?0mPZjZd+QwIUDktwIL2tAy7BIhLzrMSqcTbYVDKAA/Z3HxIHQa58X9kG2WdX?=
 =?us-ascii?Q?Ea7YNNRBFysITO8ut8pozLof+SEmsxoEmkgUPHWENeBGW0ACDeHM4ewctGK0?=
 =?us-ascii?Q?LEXcd4zxMlFBG43VkLfVSJDUjWWgP+Je+Lb6IXQPdfq5dlwJVwcFZGxU0+Mu?=
 =?us-ascii?Q?Ahw31O+ZuEVHZr7/h0EI08G268CqNXvaWQQ7UQqGdunm+THAW+pZ0yb2I+a4?=
 =?us-ascii?Q?l/vmwzv8nTxyODrVXMJhrBBSsQcqk+vOG+TNFQT0UH9wLQxFS57QIuP8BXlQ?=
 =?us-ascii?Q?OFWPifVpaFh4cVu0xHwzCsW9vAWfwyjaZ7YWBgHA6f72XTaXrhxS5mTAfIal?=
 =?us-ascii?Q?84dTM5ofZDvZiahTb2sGU621VPoMabf0C8nGJ/8BU8rk9yNcnqPAFr2CfXwM?=
 =?us-ascii?Q?8n3kKWilL/if1VNzUoKbpVvRGt0kwZZI8VhiaTMWHG2rmI63rCcEd9Ab9orG?=
 =?us-ascii?Q?hh3F7V3YMSHoecRdSiFFhSonNuP5OeW87IvwubZBKRNYTYxmpV+zUa8Cx/j/?=
 =?us-ascii?Q?Ya8OI0kw1BLt2gn8leZ3DbRTIosIgDUSERoandJv4Me4M546n08ywDZIXp18?=
 =?us-ascii?Q?+uGuimrSxoswPmh4+KcAWcK0u7htOf7KcAnYgztgZmadcPN9fddE3bcmKhAK?=
 =?us-ascii?Q?IPaHWtWwyBpSV8hhlmNN8gwB3GkONSfJm5ib/LCfvbJmO/1fwX8lHjyfZzvT?=
 =?us-ascii?Q?GK9Rmq4VDXCM56yo5wbgTak681BdvIfzLcsVsP3ulbXHZoW6gj/udPlwdUWs?=
 =?us-ascii?Q?bmzIwD6NqVeziCpXD2HQS5X2AmaRe+JHmuNmFUWxfM3QMEKinn/1pVpId2lV?=
 =?us-ascii?Q?nmkKFCI/31GVJPKZOqk3Gf18LkqxnjeAOJfaBRx3j8XNzqRBbG8A1YswQWsm?=
 =?us-ascii?Q?Uax1S6i7KgLiXAwNTiIHmV9dNwZ2+hgL1ECEhQqPw1BESrexL28RkHt5LFN0?=
 =?us-ascii?Q?L9Q3nZdHC6pTRfHRyoF83tiuR7Sx/Wi3G3Kjo8K6F0f2/1w3qu/oLCeugi4R?=
 =?us-ascii?Q?/YLT0Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7f8pSS/2yeJZ0VCfxeA39qc8wu42se39gnWr+dMGvJzxQSSZBlwVy6dj/lTe8wqVfHnws3EFYdrJcrdydT9yN15HQH9EIayh0l2Xaarl2MgzylZkWfRFFjznFJ11PDpoCNQ1ppGbncmcTo+Nxh//uhFeXL0Ihl1sTDTiqW245uhNAszwFf1gjN4lFDinYQaDn4pwtk2CeUXmx/7QbHkRnRRJL4ivodmA0h4xedP4cpUauC6ZuhawOU9OjRdlzIjG0DRagrzBr9I7RgFkM5JV2MPHy0LuNWiE5cj4qdehRwFU5nWA/wpxS7jzVX7H3FkbmQw44jL5UfjZwRV40PocSu1/XF/shRciqzKaClqio/gs7JjUZXyYQRzOUXFCsG5Ak9zcilLv57yBU7P9Y7Dk7zUndnVTA2eoZSP6iWjQUPTBzZ0Ey14S3Yo6zqMELlPf
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 23:37:33.4075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bfde66a-25ad-4fb9-9e7d-08de733484b0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR10MB997798
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_153736_981203_F7359746 
X-CRM114-Status: UNSURE (   7.92  )
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

AM62 LP SK board does not have external pullups on MMC0 DAT1-DAT7
pins [0]. Enable internal pullups on DAT1-DAT7 considering:
- without a host-side pullup, these lines rely solely on the eMMC
  device's internal pullup (R_int, 10-150K per JEDEC), which may
  exceed the recommended 50K max for 1.8V VCCQ
- JEDEC JESD84-B51 Table 200 requires host-side pullups (R_DAT,
  10K-100K) on all data lines to prevent bus floating

Fixes: a0b8da04153e ("arm64: dts: ti: k3-am62*: Move eMMC pinmux to top level board file")
[0] https://www.ti.com/lit/zip/SPRR471
Signed-off-by: Judith Mendez <jm@ti.com>
Reviewed-by: Moteen Shah <m-shah@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
index 3e2d8f6695351..8a556fbbe08b7 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
@@ -88,13 +88,13 @@ main_mmc0_pins_default: main-mmc0-default-pins {
 			AM62X_IOPAD(0x220, PIN_INPUT, 0) /* (V3) MMC0_CMD */
 			AM62X_IOPAD(0x218, PIN_INPUT, 0) /* (Y1) MMC0_CLK */
 			AM62X_IOPAD(0x214, PIN_INPUT, 0) /* (V2) MMC0_DAT0 */
-			AM62X_IOPAD(0x210, PIN_INPUT, 0) /* (V1) MMC0_DAT1 */
-			AM62X_IOPAD(0x20c, PIN_INPUT, 0) /* (W2) MMC0_DAT2 */
-			AM62X_IOPAD(0x208, PIN_INPUT, 0) /* (W1) MMC0_DAT3 */
-			AM62X_IOPAD(0x204, PIN_INPUT, 0) /* (Y2) MMC0_DAT4 */
-			AM62X_IOPAD(0x200, PIN_INPUT, 0) /* (W3) MMC0_DAT5 */
-			AM62X_IOPAD(0x1fc, PIN_INPUT, 0) /* (W4) MMC0_DAT6 */
-			AM62X_IOPAD(0x1f8, PIN_INPUT, 0) /* (V4) MMC0_DAT7 */
+			AM62X_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (V1) MMC0_DAT1 */
+			AM62X_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (W2) MMC0_DAT2 */
+			AM62X_IOPAD(0x208, PIN_INPUT_PULLUP, 0) /* (W1) MMC0_DAT3 */
+			AM62X_IOPAD(0x204, PIN_INPUT_PULLUP, 0) /* (Y2) MMC0_DAT4 */
+			AM62X_IOPAD(0x200, PIN_INPUT_PULLUP, 0) /* (W3) MMC0_DAT5 */
+			AM62X_IOPAD(0x1fc, PIN_INPUT_PULLUP, 0) /* (W4) MMC0_DAT6 */
+			AM62X_IOPAD(0x1f8, PIN_INPUT_PULLUP, 0) /* (V4) MMC0_DAT7 */
 		>;
 	};
 
-- 
2.52.0


