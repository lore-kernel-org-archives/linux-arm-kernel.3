Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93F6CFD31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 06:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PtQyyEbuf0vJo6jaxoEqf6/81n6XVJlPwcU/YjlYUL0=; b=uBR+wXeNsoGqsq0MvVgDpwotlG
	hcDQwy5qadDFuBfH2OOCAkCJZzjYopC6p5XS5RAhWGbQksKKfaiDBbw/UsR0E6VwYXrtYrfVtaCAI
	qNVAZf6t3FPokEPzl7z84rqW29HA91tRV6DLEfcEd9ngcRX3xbZSe0/mfjTBY/zJjxLNsiyRaQDuJ
	gMp1EF+/ZkYus68Ogq/0juZrmINWMBYZqsQ1W2/6Lezb8w5Hv/2GD2oLDVfWFSMEiZFhjvJXiWV8i
	DTzudk3i3o/dc0M771ornEwPlNGqg7oel01PPjH+SWCNlqmjIg+8vP2tVo4kGxjzm0wQSDTq+hj+4
	tZFIwFrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNQ84-0000000BAU6-0wmN;
	Mon, 24 Nov 2025 06:32:52 +0000
Received: from mail-japaneastazon11022106.outbound.protection.outlook.com ([52.101.126.106] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNQ81-0000000BASc-2qwe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 06:32:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bOkOvAQn9fQBggK72cX06JkDYxiQCfcGRGeQufpaPxUzGHdAgziLBvZGhkQh3HQ3A++RgMh+gLmRQ1oncGUBDjfZwd1JysPmOvmHZ/5LTMU0blSmyFNs8BKIYkA6OhoGcwh4opMTb18nuUnZqdK7sCH4xZru6XjDFppdcCncANXnbfkbuxv0/RsMmot/1O662xNLSkO4VL5Qrq6km1h9QwmYGKjMcmh0h4kP50hz+wj4YKYEruJ6lvBymH9bUbMGz+XB8gYOTtyo6PbXjiLhsYWma3YrejSy6x5F2WgDYjV8noXz1rlhQZ+kmMkd0yO1nlOx44CRQFciSq9p+HM3Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtQyyEbuf0vJo6jaxoEqf6/81n6XVJlPwcU/YjlYUL0=;
 b=pS2Or/ZjTAHJyEhtRcf76bh8NpZBs+vqkbEwEipKFSEWk/v9Ojl9nc0PwJgAqtJW3MLI3NwvXK1wOla+rPFZ6XjTrHMnEdEu2YzVNJsZNtK1BcvHsp6iHOCvBcvy7QmusqTmtuhLovGdjR+izRN++Iwfm3+w3j2paqXhOzBs6KHJj9mMlYrpJj9VP05m6V2oLau2z4yYzaQwfVLNM7zE4W0Edcz8ByEjXa81ADB7l33V6NJQGVHA3P+Nqr0eWezaoUwOKdx6P/+4IJ0mPoPaUD2kWQph1n+6QNPSjgVHt4nndR0k7/V/mwB1sDGzGP3NjE5q+moA5irheVBoV8gbXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SE2P216CA0028.KORP216.PROD.OUTLOOK.COM (2603:1096:101:114::16)
 by SI2PR06MB5172.apcprd06.prod.outlook.com (2603:1096:4:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Mon, 24 Nov
 2025 06:32:38 +0000
Received: from TY2PEPF0000AB86.apcprd03.prod.outlook.com
 (2603:1096:101:114:cafe::21) by SE2P216CA0028.outlook.office365.com
 (2603:1096:101:114::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Mon,
 24 Nov 2025 06:32:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB86.mail.protection.outlook.com (10.167.253.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 06:32:36 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 896AD41C014B;
	Mon, 24 Nov 2025 14:32:35 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v3 0/3] Add support for Cix Sky1 resets
Date: Mon, 24 Nov 2025 14:32:32 +0800
Message-ID: <20251124063235.952136-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB86:EE_|SI2PR06MB5172:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: edc30697-96f8-4e3a-b008-08de2b234245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9NbTyIYnf7GWZuliZD9q9d4GgGzQvwpJEgUYRfpEmH6IED3Z659Yrn7NvPOE?=
 =?us-ascii?Q?TzGKs9HZVXq8F6nrv7vxfiQv2jo71hN+EglvAbU3aVEG32vE9wR0QDa/39RF?=
 =?us-ascii?Q?49w4I3QUkL0HR291uMCbOrd7EW/74UmuYq4IASGe0Hx2uCwuoY8UpFfZUguY?=
 =?us-ascii?Q?y1ywfX34RfwRoqs+fu3c1nDfVYbU/I/yHTLXgzeu6h0HZ3R+iExMgxxgGAU4?=
 =?us-ascii?Q?xvpteS/97QsV9qfn3j7LvO6NgWF15P0r87X2mY53/PlPEtyiGjhLKlP6MYBa?=
 =?us-ascii?Q?/jsBTOn7nluCtRDsBZRrW7OWweujpR33/mlNLavAVXuq8HRSrfIrWgEJhpOv?=
 =?us-ascii?Q?wWrfcEtr/4VGki/yRkQ1TjIM+pVNQIzev2n/fPpDKdRG+U4g4gz6JeY57oIK?=
 =?us-ascii?Q?rbWAH/+OW1p10kT6bxZ93K4pY1vV07LuSaA+4SmNrFMzOj8FFjdiKKFaXqms?=
 =?us-ascii?Q?p9HczwZuI5+gKhzFvj6t+4fz55HtRV2IumO9QUp3wrwfGtFF7FrVlWiYBkrf?=
 =?us-ascii?Q?BdRG6uvQRs0FerQAJafbaU4Ii5h7EH4zRZVEPzCCeuNBWNoPr0LDbQNJKAea?=
 =?us-ascii?Q?P2bioHi39erqjiVICLcXYMQC/2i5BKcKCY4fbI/F5thqFBz9O5Vc5oer9BvO?=
 =?us-ascii?Q?OEfLT6l00d0EIxnNS13jW19UECPYUtmsGbeonG8e9jEeA8Eh2bu014+GOW2c?=
 =?us-ascii?Q?7tkHjMYA2dyFEzyzXtVgKEhN6xCOUxZsDN++cHNE7lc8igI4DxMeDbzOhEHA?=
 =?us-ascii?Q?7e25WYSnoJCJzT6/A1/iqA3x68ZQ03GcxhGQGhAtCacFDQOInAb/8um8BAHO?=
 =?us-ascii?Q?TiZ2HanD8719yiEUHmcnb4vWyffNJ+UMeylOA37OQcEC1SSd/vss5EUvD+xY?=
 =?us-ascii?Q?GgjlT5iKv3q3bjaHicUQXwAdZkcQaOTqjdCSYOQ4wlrsGa7i1oAhB+6fOVrN?=
 =?us-ascii?Q?xmiLMZF/IODv0oVbG/vKjIfj/aDMFkBgIgVyuvv9rOAhbCAp/C3WKrMXO3+v?=
 =?us-ascii?Q?C/6mGznFq0pXKlV3YSXHS3oh2lV6XRszFrOhRCzpz4PsUpxmB23JP1MK8xpN?=
 =?us-ascii?Q?H6WX7lJbTt9ixwHj+gn6ABeLIONz9WlRdyWaMlF4f8lWi0iGTR8gU8ik+0go?=
 =?us-ascii?Q?aV53IeO1nU++VbhfhKaHzTrGF8Wxan7uEeGkHw/GvM5P/xr0AGQaFtBsadxq?=
 =?us-ascii?Q?tp+Zq709ecPa/ux/Lic33hlHy3TxrmfLqPePxXl3SHhxTmLJ+geYOvgPHIIE?=
 =?us-ascii?Q?0ZRe3TnIr3ma9GamdxinBeqVKDK/ZObqYx9+D+1G+7/nXGNyBp5/aUI656NE?=
 =?us-ascii?Q?vSjWbXPyd9dHM4+SwmjwJqPz2reM7M3kDqC6uzOZ8fPbtKY2ikEctgJxnmzt?=
 =?us-ascii?Q?VpLZ/b2F6MaI6pJYUDtK9DVFUy7I7oGHaLPqUNDgidoQOZ0vNnH+JVbWSEZ2?=
 =?us-ascii?Q?z5fOZXtLua5RdoSJ+5VS13fvEgBdpvmMZjn9pmejye6ybTTzoTzDPC3nIvI/?=
 =?us-ascii?Q?GJSAhZeePAuLmDnY9y06ACJPFpepjCQhYEVP9q/beJpu1A2u0hlJNNLg6hPu?=
 =?us-ascii?Q?BHEEhYcYYocCJ9manRk=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 06:32:36.6322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edc30697-96f8-4e3a-b008-08de2b234245
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB86.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_223249_716797_0D880777 
X-CRM114-Status: UNSURE (   9.58  )
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

Patch 1: Add yaml file for Cix Sky1 resets
Patch 2: Add driver codes for Cix Sky1 resets
Patch 3: Add dts nodes for Cix Sky1 resets

v3 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-rst.yaml
scripts/checkpatch.pl 000*.patch
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
- remove syscon

v2 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-rst.yaml
scripts/checkpatch.pl 000*.patch
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
- fix dt-bindings style
- refine reset driver

Gary Yang (3):
  dt-bindings: reset: add sky1 reset controller
  reset: cix: add support for cix sky1 resets
  arm64: dts: cix: add support for cix sky1 resets

 .../bindings/reset/cix,sky1-rst.yaml          |  50 ++
 arch/arm64/boot/dts/cix/sky1.dtsi             |  14 +
 drivers/reset/Kconfig                         |   7 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-sky1.c                    | 426 ++++++++++++++++++
 include/dt-bindings/reset/cix,sky1-rst-fch.h  |  42 ++
 include/dt-bindings/reset/cix,sky1-rst.h      | 164 +++++++
 7 files changed, 704 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml
 create mode 100644 drivers/reset/reset-sky1.c
 create mode 100644 include/dt-bindings/reset/cix,sky1-rst-fch.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-rst.h

-- 
2.49.0


