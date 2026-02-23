Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF6DE63C8B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/Z6EtIQgGduFrnsZd2N+txdqB0KU0kavY6DqTS9h8A=; b=T9FseGmV5y0BtHkYAG6X4n2Hsx
	PO9zQ62F7OfXSgZL8xNZiI0xOGf6QOpn6iwLX+RzsKrwBbX3+NUX4mxpp/FESXNa2R+mZDuadX6tF
	oECSc1cKgjMOhmIHqZF42DZQ6EJuhTmXIBD/ryukcpPfxF50hyGYkZPGDQsXsZdHweBDQ6XQBmew+
	NGZG5hq9y0Va0X6hK4mxrM34A6XPKFC7GguWB/26B7J3CmtxWd5T0cQYQOEw+08LCCUUX9QbBUwbY
	g7AcLzp+UPBZZmxTuMWWAAyGVN23mW516GxaqlYQBU3FED2ZW4IBuQvKBi+OlCEufZfDFARXljWq3
	N8O1BnDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTZR-000000005z0-4Bm9;
	Mon, 23 Feb 2026 10:53:46 +0000
Received: from mail-westus3azon11012043.outbound.protection.outlook.com ([40.107.209.43] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTZO-000000005x7-2mWu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 10:53:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdavnv8CIbYeIl5SGAYy/Pafn0AOgASkYU2tAJFHSBR+YCqeZaCM++Qp60X4YuUMH/kL8xbHn78yvnnKhgMpikNd3taaUfSO9OkrFEF5oseVrjl20gLOW4DLJ1ojx02KAZvX13tWiTipuJtDSsxdPSfksG1Yf5INEJ72cPdpsVDd8qtyPpaBzojwNxqkJPYMHZ9jSJ47Sh80QayKlw4rqR6pbpS2vrhpKpTL8dkVJLFv9kXo6V0ifK6A/nLeQY01jictKeIkNHLFXO705EjLMMPrKvAElfeFhvC5w3S/P8umQUMZTrtaRAy4itzVhgRiIZr8ZZhJdKY76MN8Q3igLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/Z6EtIQgGduFrnsZd2N+txdqB0KU0kavY6DqTS9h8A=;
 b=ZJUgervyvXCc9X8o3jAc8oA3uoWcR3DgdZ2ONUKHu4/zNkyrZhI6ym7BSvGcVHdmTuqTbcedGh6cCwLcb2SY2zyN89F+TCRSwFo4/CF4wfixNmVxEstvgZFYDnElxXmYPonWqjkWI984bZKsiaEzTmy2x7Kn2YC9vhfUjwiWsYXiVM6q81/1uLEoF7kf9E8ZCtX9U7B5iv/yL/mGP3saK63tucQg5hSYIDJRBfYJf9t8P2o6T82wxN2BEicmVH4x/cNWHXIGLN7oCSz9Rv8ss0pALLrnc8gA5ukY5nuWP7VRFMC0TD84o0XkCjGsqd5PLO6k/U4Dt9I9uqcLcKDOxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/Z6EtIQgGduFrnsZd2N+txdqB0KU0kavY6DqTS9h8A=;
 b=SZwIqDe/vNZxHxOYiaOtcka0uZAjBDZNSUjL+/YbkTMphyDYIXY+FcLjPZNBCKmYXr2ng0OGc2jbDfvEwj8om/sWpsKuYz2Q78Tr2R9QwlTTuv3tpipkXDMlkMGf2nsTcvTYm+veNEj8uNJ0ZrBxeCyb0RHLuM2gIbV+UZX9dTs=
Received: from BY5PR04CA0030.namprd04.prod.outlook.com (2603:10b6:a03:1d0::40)
 by BL3PR10MB6116.namprd10.prod.outlook.com (2603:10b6:208:3bb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 10:53:39 +0000
Received: from CO1PEPF00012E61.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::ee) by BY5PR04CA0030.outlook.office365.com
 (2603:10b6:a03:1d0::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 10:53:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF00012E61.mail.protection.outlook.com (10.167.249.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 10:53:36 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 04:53:36 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 04:53:35 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 04:53:35 -0600
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NArIFH179443;
	Mon, 23 Feb 2026 04:53:32 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH 4/4] arm64: dts: ti: k3-j721e-common-proc-board: add ti,min-output-impedance
Date: Mon, 23 Feb 2026 16:24:15 +0530
Message-ID: <20260223105448.1110428-5-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260223105448.1110428-1-s-vadapalli@ti.com>
References: <20260223105448.1110428-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E61:EE_|BL3PR10MB6116:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c98247c-1c59-4f3e-e251-08de72c9cc09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4LRvIOs4RBxswyAnm7ELb4ugZYkIuRNXLhdxRVly77iDmUtF3wn/uYfOuKsz?=
 =?us-ascii?Q?WuRV22bb6GxGEzxoVXEU1WNskJRUAtJzTdpDnkfU5GfhKI+qAKRaN5mIefln?=
 =?us-ascii?Q?mwex3TThaqpBqO6iIGKU443dGQHQE9/aoMypzsgyaVh4jbeedVgukx1v/sBA?=
 =?us-ascii?Q?HuAS6yXve8JSiJmGErGpepcSAMpqWKEOcSkwKj5PnSlPAOWGUR9Ooc+7R7OR?=
 =?us-ascii?Q?oxoSxL7DIvoeMxhsL8oEU/2psE6Mwpijbz3mqebSkvoHzBazuR0jqnoH9FGE?=
 =?us-ascii?Q?l8qn5toPWrsUTWhCoVkNeCwQHCHPTyEIlP9Mwe/ZgzWLJNFRG9coPl5rrUyt?=
 =?us-ascii?Q?XR3ftUXFed55p/OxjUImJwN/uyC1tMO1Il9BP+aUBydkG4rL0FFdgGIL8HJ3?=
 =?us-ascii?Q?8EFsGcji/p5oM0/O1aCh0DKsr4sLFOx1ZEfXnWNAYe/P/bWjpVl44FyYV2AG?=
 =?us-ascii?Q?5CCsl4U28/ul3Lz5UsHacNXTwL2e3V5JeAqtQxSAwmTS3mvcwHX5Z8kszK7D?=
 =?us-ascii?Q?yWg+9cvKXwsHp2lfUP9v64wW0DXWnxdV2KspSRPbN1IxzmI725pXX4ZgFInd?=
 =?us-ascii?Q?cDQhacna8fR03RU4wSwOOLH32TyE0f68rgQM6CIy6X3jX7yrL70ebMA5Djvv?=
 =?us-ascii?Q?9Y4UOu7H/UcKnqYmaCwgaF4VTSRSd8ghJzUTNjEF0VfXlu/z8YK9yHvIccsI?=
 =?us-ascii?Q?QDITynl+g3f5Pr+Un8ZI6Bp4bpIq33EYYwzpJidZKCnzx36ElRzFEo0MHOov?=
 =?us-ascii?Q?LXnXhz/r2eomwuUTKXUPIqyfaLbCLvWej1pfEfoQ+5md6o+pnyeyGVU40Gfy?=
 =?us-ascii?Q?0R1HdPW824KfWfUuZGs+UFnHJIqiydilgaeEuvgojqHBu/04T0pzf59tj/3i?=
 =?us-ascii?Q?/cbQyCSsf4R02Wpirk+3/4A1v9zRUP1274vlC33Gy16oe/cICcb+M2Ccg7AA?=
 =?us-ascii?Q?MZcomuVYWt1QaWMaB5N9TkHUdpd+XFBLhOQg1IttY1elYNUsFUMZAruEkui6?=
 =?us-ascii?Q?zZ4iONN9se9cbjU1+u/0sBtTVg3jCx29iAV8LLhfqUGMlRlTQhV6xrjX2I/W?=
 =?us-ascii?Q?2BmWRatOcD2lSPJyXR3XAao0Yy+HJ3+nSKE2k4uTCiy/uTcp0NM8dy/vOpS2?=
 =?us-ascii?Q?4hjUgMcNka6JkPj+uhsEy6rknJjGq5w3m9EHrJus6Bw2IC0Aujrwk1VfPvZH?=
 =?us-ascii?Q?lhFIEHtcmLCDzo3/89zhE3m4Zr3/5nkl2MSS1cWizE+YrugO0t7YHcVwPWvt?=
 =?us-ascii?Q?sgHJU2islNBkVRHVttBZvNecruvUA2N66/PIpd+6b4aFW+IHi6wpRhbTjDSU?=
 =?us-ascii?Q?PSKZ8dGup5qI4GME1RcBlARFXCSfj0nTXEVV2jLjAC5TPFgxE/kERzeCbTKC?=
 =?us-ascii?Q?PXAM/Py2bRFiLJ/Pc08YByZ5QpGSLxYPu1y5durVpigAONiUFs6ruEka/l5n?=
 =?us-ascii?Q?m75DJt9bOe/QLlsrufEwBBiNMfRczPaHlxuqnKQU0zg/ivpAZmOaqN/OBYP4?=
 =?us-ascii?Q?HMb9xn4BMJs5bFWImisxvDimSP6EAn1CHLYkztvEWdCU+EB7Eqf+QCDuiQTc?=
 =?us-ascii?Q?gSNylDTxQAcMfmGgZoyYnawIPeiJ2trSXeGzewh81QWLFfJvVtr4K0LIsMIu?=
 =?us-ascii?Q?/e5q/PkW6x9K2+fxWkjFozde4Og5K49wz7Rsv+433xfLXOwnFtemqR83pIW8?=
 =?us-ascii?Q?5y4hVA=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: c7Sa7hN/5AwpAH4GtyoyP8UbzRGLM2M/AbbnQhw5M1T/VoBXGG2IPfBOjDoLMAPfzSxtJoAThNQZG/SS1kPQydgrXgMnxbIQMWyURj6bud1mY47UMHMS3Tl5Ls4pkBygZtn/LijkcwDVx7jB6DAIKEqortlfN2XWl9nzaDIaPkYlPY2pIeF+kauxO9m7WHbAjsTzHYxTXEp2CRROzjrSqhAZHASTk6mEtStlfZJv2wTgGJZOHQu///8gKICQf6S4RqU9l0i4B67BFkJ9O/8MDkLT0ub2vkot94ZLnBNg74yce3CtnCYCFfnqkmeG415tC2tH+2WQGT2J9pnMlBnDHjanKEkS7r0Q7SuOHtNje1VaFuxhbTG4m1DSaSHYc+rMMOPnV5yaR20wu/LbLDT1b7XC5XNE8fR5vQmKqK3JL2UxFnA6J0Im/Fl6aCH8E8LZ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 10:53:36.9114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c98247c-1c59-4f3e-e251-08de72c9cc09
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E61.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_025342_709121_418F8C5F 
X-CRM114-Status: UNSURE (   8.88  )
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

The default impedance for the MAC I/O lines from the DP83867 Ethernet PHY
is 50 Ohm. Based on the board PCB traces, this impedance is relatively
higher than expected, resulting in CRC errors for packets being transmitted
and received. Hence, add the "ti,min-output-impedance" device-tree property
to set the impedance to its lowest possible value of 35 Ohm as described in
the DP83867 Datasheet [0].

[0]: https://www.ti.com/lit/ds/symlink/dp83867e.pdf

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
index 47702fb279a4..53e7fbcef52b 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
@@ -777,6 +777,7 @@ phy0: ethernet-phy@0 {
 		reg = <0>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+		ti,min-output-impedance;
 	};
 };
 
-- 
2.51.1


