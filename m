Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD72EC9EC6C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 10:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tu5sxxyowtNL3/mhbMSRdJ5Z3bjQfebpk3ZnVZ+JE2Q=; b=MWBnPMVuuGuheH+gueQxn5vH3q
	pcgnGt8sydMpN9W3BAYJ/DF7IyATsT3XvTJr08BfIdWhIsTmbxY/16A1D+OrJCzXNYfpCLGswfGgt
	//Fla1CGW1N1hsNNzhFDQgzFYHla0Z4I6XKcTSqJqYv7Bg++DXz1l9uP7GTNjbQ8FBJtEg/dmr2c2
	kCqYEsx7++eLgiE+fZcn7sb/X8mlUuwNNpmYJPfQX8y0ref3xB65WDszcYpEE6KOSFtFGasRICFpY
	8RTpx3tzIl0PZwLwALEC4BRA8pLKCzXhQD0aStHU5xJPfsSaLth6G6de4vBqBKiwLadWjttpK5VDU
	4NENQp7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFQq-00000005Bwz-3uWF;
	Mon, 12 Jan 2026 10:45:56 +0000
Received: from mail-southcentralusazon11011034.outbound.protection.outlook.com ([40.93.194.34] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFQo-00000005BwP-23z6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 10:45:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2IvaIPUYh0FCDcQGk0rE2QMxrmY/8T1DdIZEAK+UJLG4jWcuLMPRWs5ZCDOI4vqS+xStH8PoYiBPy0bG4lG/YJubyOL1qmyrNbuUocatD0Z9pY1acJ2zlOPwh+xGWTj0n3h1TfmLk31tI6fvZDRPLVj5uKvzwJzZ9mmdLuF626Ji/NDYksXllZmZWAOvlMmh7Hpm44tJcmwEvBDJbW8Zi1sPcdEXINDPD/jl7ycffzF0OBEDufKugvbgyKoi56V4Uls7+G4dGP7RiWBqp5uFToVyX3rsCw5tBHknXjIde9jC6BAuzQSLeJ0hkUPKWPTbIZlhmVZcYVvsCGLorloBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tu5sxxyowtNL3/mhbMSRdJ5Z3bjQfebpk3ZnVZ+JE2Q=;
 b=C8pRwvu2mh8O+LX3rlimccQPg7Q3nTiefubP7xIo/hKEBhnjzNumP0YIrTdwz7yNVrFjoHj/TChyRofdxrtThp9eplSzL4NUJQGSKoxwskvJFMAC/6zqXKkM450uq+E7hQwSPqBgCw2kjeyu6M3GjbbLmZrTMVdeQLCy/qLGmqCqt1vDOlAE8Q75U81GHK8sHi0R4KoknU+rywml/EMZwTVUOeZUGIgRi5z4igXefbzBtEvD8um82JcW5ru5LcYfaudwNGvSJtccs/fPCY/nwu073PqVybQz1nr8XXPZj41BbiYYP5JYQF7fIkbGQnvGKJ/ylK0M2qnhdo7CAXXTww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tu5sxxyowtNL3/mhbMSRdJ5Z3bjQfebpk3ZnVZ+JE2Q=;
 b=ditiNwJPoEVZoxay0wN73Im63IFJz0shJZ4DfECATwR10GVPgEXBHGp8gtrHsKN5w/LnLugyWj3QylR8lp0mZJbTEBwFmPLZ+fA0fijdJVE/M0rqeLizsG8z4c2cSm8kce8npsL3oY/rGTaaO3fwaT2g3Z2Zoewzt22hxaBRG9s=
Received: from CH2PR07CA0027.namprd07.prod.outlook.com (2603:10b6:610:20::40)
 by DS7PR10MB5903.namprd10.prod.outlook.com (2603:10b6:8:85::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Mon, 12 Jan 2026 10:45:47 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:20:cafe::7) by CH2PR07CA0027.outlook.office365.com
 (2603:10b6:610:20::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 10:45:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 10:45:47 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 04:45:46 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 04:45:46 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 12 Jan 2026 04:45:46 -0600
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [172.24.235.46])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60CAjbfE242687;
	Mon, 12 Jan 2026 04:45:42 -0600
From: Moteen Shah <m-shah@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <gehariprasath@ti.com>,
	<y-abhilashchandra@ti.com>, <m-shah@ti.com>
Subject: [PATCH 1/3] ti,j721e-system-controller.yaml: Allow audio-refclk as clock-controller child
Date: Mon, 12 Jan 2026 16:15:34 +0530
Message-ID: <20260112104536.83309-2-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112104536.83309-1-m-shah@ti.com>
References: <20260112104536.83309-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|DS7PR10MB5903:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c1da615-9b86-4762-154c-08de51c7beba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|34020700016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5/1FoUPiVZMT0JLWGkNHMYucdHDqBoGsnn6dJ2GY7fDwCFhGA2n/RMqPo5mU?=
 =?us-ascii?Q?QNtHWNyhj1sY2xd7AVlcJg/qa2Bg/3VjVmFqjJuqbm6uY8SV7y+Auqc0terS?=
 =?us-ascii?Q?JIBvPUVP9rFd2OGBJw/TCg9OLhUFP1jGceH2p4xF5PhNLWneF+GpjG630nNb?=
 =?us-ascii?Q?pymCR8emhpVRyLLBI5Y7+iAsxQdBjQUgaIcL/aVdJ6OGeuaB/j1Qy+jzQRxH?=
 =?us-ascii?Q?QaX/3LUKGkiIjmHshzAB+jKDwamQUqAp1QBssHhdpCVjuk6mknEtm+ifnyYx?=
 =?us-ascii?Q?o/jJvgW7CqOQpzLS1PBHPI9T0WBWF8E1PjkGh4CT7ge6JBd0TmA3fqTMHNxw?=
 =?us-ascii?Q?6vd5yew9v7LEAK/V4CfFAenUhEqxnkivvXN55/0cMoC7BXEIUpvDh0cgon82?=
 =?us-ascii?Q?l5cd+43cHQc7L1gtsFIEy2Pth8SnTP91PRJAOtmJkH2lDkeU20O8a70OnytQ?=
 =?us-ascii?Q?9QvtvDpge7odorvjVDHgm8ajInzHgAPg4GVP1q3/bd13FA/Fgb/a9EvRuzi+?=
 =?us-ascii?Q?++AXpgJi/oiuSSx72ilxhvyh3HuIe9GubTAwjVGalDBt19ouxg8HTNyHgBIU?=
 =?us-ascii?Q?zmD8CwUIPzUha6MTq7ogsNMCfXw4G8/xRr6dyQwMOZxWzjilL/oG+O1CiseL?=
 =?us-ascii?Q?RysgrjJSOeNVKgf5p3IRVdY9mLLjioKhbem24FTw2tZPvtgV3xRgG93AlpUA?=
 =?us-ascii?Q?eU2ajcnPX5L8CbZekPfq5rcR5VsMgXiIET5rDeiCiJTfgJ+T887B8vx+h5eC?=
 =?us-ascii?Q?nB6L5U2D3wIC3oKie3STLoDLUrNHLHC7Xn04vlbbPhlhfKqqSU2DZ6mc/cUT?=
 =?us-ascii?Q?d6YHvj3HZcwepmHrC97OUCcl6rCdtcflsZPZcypJOS9BxrMDXTlfkxLliPyh?=
 =?us-ascii?Q?jnuPoz3+YHzMQ8FmY7YTpcAoSzYGjtifCKzP6OO3EnOKVi+3zt/pudia8alh?=
 =?us-ascii?Q?TpeJK3zgnt54hSZTK95FD5gRwG7y6oeSEwECzcYbSG31VCp7DRIDSp+G8cwG?=
 =?us-ascii?Q?PRcq4jeKHxPr4RCSNDGHcrgAfLksbWWPTK+Los/fSj6HNvgDGH1IU0w/XYXB?=
 =?us-ascii?Q?YxwYAtVeJTlBoG2QO/Z6uuOtKc70mwoTJSZYK0TVCi+MmJLGYdkd0+JE1FpD?=
 =?us-ascii?Q?2djt3XD0cpx8/4Qn7PvL3h2KaFKIbhkQHDvjYrYotSfieTTIof5z88sFdfXt?=
 =?us-ascii?Q?OtmIWYyfn6ilS9Vo+QnglQpF0XsntKZMDBUMYVL6vsUx9mFV9oJvie4GUTIW?=
 =?us-ascii?Q?9VjMM4KPLTz331HhMLt7jq8taei8yQGUeK84YjbVlY0mLVhfcuDI4EpfZZsG?=
 =?us-ascii?Q?oOp7rgZ8xc2k9RN+cNeoL12HLQtYA345BiZWFh3JB2B3EsKrbUYJXoSLek7P?=
 =?us-ascii?Q?xqpJ63f9PK/TSRsDXSTvPmRcwIJ0ZluxZ0Q1JoNZ3FJauhDDtykJB8JMkPxb?=
 =?us-ascii?Q?g8HwMcdcRAgygkWIll+ohTNP2fclGzy7o5l5Zrfwuj6nYhZ9V/mnhqUXsnuy?=
 =?us-ascii?Q?7b8uswrdygzSbuhmwuJsox8U3cJpWY+ZLo2bRMfWXJu/NwTU6BfvFP4bpfJY?=
 =?us-ascii?Q?Gtbv9dqI4lalpIe9DiU=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(34020700016)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 10:45:47.2495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c1da615-9b86-4762-154c-08de51c7beba
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5903
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_024554_534106_3FA378AD 
X-CRM114-Status: UNSURE (   9.47  )
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

The ti,j721e-system-controller binding currently only allows
clock-controller@ child nodes to reference the ti,am654-ehrpwm-tbclk
schema. However, the system controller on J721S2 also contains audio
reference clock controllers (ti,am62-audio-refclk) that use the same
clock-controller@XXXX naming pattern.

Hence, extend the clock-controller pattern to accept either ehrpwm-tbclk
or audio-refclk schemas using a oneOf constraint.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 .../bindings/soc/ti/ti,j721e-system-controller.yaml         | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
index f3bd0be3b279..d5d84a8f1257 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
@@ -53,9 +53,11 @@ patternProperties:
 
   "^clock-controller@[0-9a-f]+$":
     type: object
-    $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
+    oneOf:
+      - $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
+      - $ref: /schemas/clock/ti,am62-audio-refclk.yaml#
     description:
-      Clock provider for TI EHRPWM nodes.
+      Clock provider for TI EHRPWM or Audio Reference Clock nodes.
 
   "phy@[0-9a-f]+$":
     type: object
-- 
2.34.1


