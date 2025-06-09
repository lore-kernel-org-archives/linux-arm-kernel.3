Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566B5C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 03:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2xFO6SIchqCsiBZdpX9CLplf8tgp4KWzTEWUWlN78n4=; b=XuQvruTpNbVgKAEEqy39wyNpJY
	15kAl6pp3vmFGwYv8c6Qb1rUfNMSYvb4D3RITcJPmBOJJaQAK7iYYGX0NLX44mrURvBtHP7raut0v
	Gnf80GL9F/nVlnk++BQzzKwpR7/mDSl7BDnZyGAsxegon/6iewnZbrrivCG/JH4dgEw1Lc/NWYsnw
	JKDIYYnYdXte1ZnDg4BWHeAPdZSXs0xfjNRXgKEmUOylApjKva6nVj1vxLmltypYPtf/4JLo2lHOA
	2IUue9oEjKDxiFifbZ6Q6dyAuVh9FxaQXWm6dJntf6gdmZjztBo/+Th2y5y69kdiZeP6om/KJEykk
	FY3SrfjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOT8q-00000003LA3-1ASL;
	Mon, 09 Jun 2025 03:25:44 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOT05-00000003KCt-0KxU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 03:16:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iNRmLhJoEl1+vkGBvyCEZ0GJOV79Bl6qDVSs40h1zS0oD1VbaUV7ZCd0hRzWcteosB+KTnJoWi92JGe7bkLXL1tlJLg85D8bJtG/7GKqfRhpYggThZI+U/8FoX4m0YEQsnjd50Z8kbFrbSqpJsena91r94wH+idlepW/VcrNLLhe2EEAS56nGSHUqLa5lTiiVgJXwbTy7mla7ME2DrmY2dZCD/BWhdQZxP0txWBL9UzgQhP7N8hvB4dKLYjyl3RGwp+y5c8xsKI/FWjvgxgH29cd81eDLWZVHGKUdJolh4Muwc3ZvO2v62ecsxy0A/s8GGQSxTiPz/n+J4WeuVY0zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xFO6SIchqCsiBZdpX9CLplf8tgp4KWzTEWUWlN78n4=;
 b=rIka/EFd3cYYK3CxPOA10VUzzX2WSwMOZ14DfVRsOw4kvtaePRjBarxoNHf5o+R/CwX2fnezmIdcZ4UhVd2Tb+0XtO6pKYUJ9ttommYUlxG4kXJbQ/mcGNKGw4ErjF9Ot+HnqX6jtOGG2uR3OoWYaTChH2VSH6Xm3442mLZ39JbHDGZSISgZv4h2S7yp3+GozvBq0ehL/7isygUdKeee57FBZwyQFBUiM4rkWe8sI/XQ6XlSkE4fch+4b5P+Wnp2LQrxakK8Sc//3c0lM7niR5Nrv7l0UnaiSfjAhOPvFy02BZJZ4fdu9w8CGUlJP+hl/sj1Rv9M7o2k0czoFn8bKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY4P301CA0033.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:2be::13)
 by KL1PR06MB6791.apcprd06.prod.outlook.com (2603:1096:820:ff::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Mon, 9 Jun
 2025 03:16:29 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:405:2be:cafe::73) by TY4P301CA0033.outlook.office365.com
 (2603:1096:405:2be::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 03:16:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 03:16:28 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 7BA074160CA1;
	Mon,  9 Jun 2025 11:16:27 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	jassisinghbrar@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	maz@kernel.org,
	sudeep.holla@arm.com,
	kajetan.puchalski@arm.com,
	eballetb@redhat.com,
	Peter Chen <peter.chen@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH v9 1/9] dt-bindings: vendor-prefixes: Add CIX Technology Group Co., Ltd.
Date: Mon,  9 Jun 2025 11:16:19 +0800
Message-Id: <20250609031627.1605851-2-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250609031627.1605851-1-peter.chen@cixtech.com>
References: <20250609031627.1605851-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|KL1PR06MB6791:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 366d968c-ea04-4327-680c-08dda7040674
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rg+EKiHywE4qmBd7N+CfNSAB5zCBubPrgugDA0dyxEWdgku8POKOahHbg+um?=
 =?us-ascii?Q?mIZQxUHEhh6WuDO+HooQJGr/imEAkmj5gauL1KhWN6cyZANeBO/CqlKwjQhB?=
 =?us-ascii?Q?Qbq3izkeUrzkbPOOlXEHChiUryvZ9+jW9dDb///0W1jgQv5RqJUOm6wdKY1A?=
 =?us-ascii?Q?mVE3HeiKJY6uAPaKhdudz9vXY07sOjT4POCMpNhcl0ML1UPMu6Obo6RU3q/D?=
 =?us-ascii?Q?PXeWsUu+/1Zxm7B5ncwLui7RPulh1b+zjviI6d+AvGrDmvSl5gnxwB+eflav?=
 =?us-ascii?Q?kXlfKMMnc4VgXZXLiHpAFRgzDAPuVbtMpxmw1aT42bQsiLU8cmKQ6akUr6S8?=
 =?us-ascii?Q?0rUrAdhqOXwiWa4dLTiZAqDBiG0MuItP2U5J41Gar9Qd78XC0NYGl4bCgKzG?=
 =?us-ascii?Q?zGYh50xsOqMmiQUzQmPa0PawZ67N6GbAa9u64GNAsNPSs6Mk+QTkNafu5HnO?=
 =?us-ascii?Q?9noIEp6zVVNXm047eVVOwZ+wGntiRYRcN7n0wpFcB+KFW/m7HIMkJnHSWbj6?=
 =?us-ascii?Q?ESy3dXDwNGplBkjlyARowFqWvTWNeWuyDKNeofIpoOrMOgu2Ia1xUCQz0Hfu?=
 =?us-ascii?Q?tCg6NNkm6DwbhjL5zoQOFL12IuFEbTNYQ3snJktlqf8d55Dy59jLz8uF7xpd?=
 =?us-ascii?Q?XZ/KfJPC+joKdjSsJFQEVP4gsZKJpxJ9Hs+ap6Nyd+kvL8M1Q5trzeAuLuzd?=
 =?us-ascii?Q?/oXNyyKvk72khkNCAcS3KCOsQz9Jl83+YLpUZgNym1XkWGTHWMpogcR/Evb9?=
 =?us-ascii?Q?rqzwwKEuFNIE6mMf5Z2ngtaQt2qndmFMCVQ4XnM4RfT5j0E0XWCj7eQK54OK?=
 =?us-ascii?Q?z17XsSmVadKRi4XgGqFq6YSBymzbmNwdfsz9JXek/yvDpYZ8lj5VgIk0OlEp?=
 =?us-ascii?Q?sIjqymsbXbqYlSP5WA4jAvYKfE643yL2f7Q9Oc+Lf8axxjm6sJsWfPz5DS3n?=
 =?us-ascii?Q?QiqDktaBLyIQBDREp1AWDnqbXnpnjsveCtRMrgGmu3hknkMOoYRvIw4qlvdI?=
 =?us-ascii?Q?S4JNoNMpnxJbiiuNPLXpLFchfX+Dvhy6vvsSxzdSZ/R3uPqD1veRjk7jAtvg?=
 =?us-ascii?Q?gh83I7dSc3BlKvme3+C8TNwBlZj8idJftyTlvzj3f6pc0Js9R9wj9Ck02+Ju?=
 =?us-ascii?Q?meQwVat2dgAbWMwvy/ttQuHM35KB55QhalQzWlpiBDIuq64tWHLwANA5MD0s?=
 =?us-ascii?Q?uKbNfLek3NtafCXCVYvkrnaCTdq/DfNQLcpkCBBVsFbfmpXl+1wOYDrFtXgY?=
 =?us-ascii?Q?10R8ecLximavE8rbn44KQKCxtgO9u4HYLHIsdLtc75j5220Dxys4ofyEzOIv?=
 =?us-ascii?Q?U36eRleK8aV/uPfuwex3pUUm+BhiZhmYcqhF744oqQOv54xgFXBwmFasoGqA?=
 =?us-ascii?Q?635uT6ZIXMjF7dT0vP/Ixo+SZ3llv0Odgz5g80qpxffAcJut5C0KUIp53TjX?=
 =?us-ascii?Q?lyPlfjJaA4X1Ytdkn02FOIVvVa/gjqqLdcofXN7Ca7t2At7qZU+4QA=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 03:16:28.4007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 366d968c-ea04-4327-680c-08dda7040674
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6791
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_201641_116785_CA122107 
X-CRM114-Status: UNSURE (   7.47  )
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

CIX Technology Group Co., Ltd. is a high performance Arm SoC design
company. Link: https://www.cixtech.com/.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6..f258c1f53b3c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -306,6 +306,8 @@ patternProperties:
     description: Cirrus Logic, Inc.
   "^cisco,.*":
     description: Cisco Systems, Inc.
+  "^cix,.*":
+    description: CIX Technology Group Co., Ltd.
   "^clockwork,.*":
     description: Clockwork Tech LLC
   "^cloos,.*":
-- 
2.25.1


