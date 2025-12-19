Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509B1D74975
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 09:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XEQR79OAwvFfUOePSO8oy7r28vkjGbvJ/ons0ia5KWw=; b=qVyR+BfsOouSmyX4wf674r4Yw7
	egxQhwpdDE5inQj/RyXqU0OQfcFB3dysvCAg+n4xwKYrHBAqqFJV8jBUZ8B/cRpgD8jMVDXqp7rHH
	HDG6wcCtCvAuSAGghYIY1Ld0I1yFXj+S3dEvCidMS8N9PIsIgADznOq4dCpCcmVcttGlKigS9Hb4V
	qWJEnAaYVRI3FK3QHQvRCsRaZx5siB44vECcuUqxghkjXYKZR+6qO2uC0aavmaokw4eJ2D9Gm9Tqo
	ljcaY6DvG2H2eCmVCM7fI4gCBFZwMqaI0o5hknN2kfOqjlCbg4fgU07Yr0EMJMFlfBPx5hXdga8VP
	hwYrJO/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXBt-00000009zG3-0mH9;
	Fri, 19 Dec 2025 09:54:30 +0000
Received: from mail-japanwestazon11022090.outbound.protection.outlook.com ([40.107.75.90] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXBp-00000009zDu-3Y4Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 09:54:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdEgajpOaqYI/1Xv7Pu1dfOCMsqER4EriNmvnxZGy0WPxYz2iEnbJcATVCJ5sLpZgl4pv7HQr5IcXC8w02lrArdscqGIghzUUMSght3IiPrVckh4ZJqb1dbWwxTo4bxZ6hFlcJClldywJDSXfUlx3pcEw8g33wtrDDZoNJJKnEiP2/NrXoxExbtFTjbYQslAOtlpWmJJmLo3HzMSiuMlC/sZFRPrQ3u94EwyvqSvHciOlAqHZeAKeJevP0BjeHu3Ie74fd8fbJv1R9858h3qjWWrxpSfI2bv46B5dBc/BW6L8xqTItfvE++5zB8vhSGfPBE8uLNYTSy3jfLKmFmnCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEQR79OAwvFfUOePSO8oy7r28vkjGbvJ/ons0ia5KWw=;
 b=PnF5+H2k/cRzhxNXx9O6iQ4Sm/S6bCv3WgsnYO5xRJisTSoGfFHpwUQeL3BaNTq/7OMOVx7mvXXzQbolhu6cIu9lSS+dtOQ2uTGQk+fwwelIYcf4BkeK5YFhs923xBpBSVFnkevODSxGn8ZM2a6TmDz3gTxeWrAYidPnS3LrtPBmiR2Fx0g19f6caSOjHPbfyIvauZFmFFBkX1XgYpZCUosc0ngTevUDke3PDK+XNMG+pigJFJIU5zeZfSCK+oPZoOUL20r14ifm7CacCztMROYX0UZ5xu6u093vFCqbJHUhApccrqZMw/lZJ9Kw1d+x0YpIvHvt0NV4rt8Otpwsrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR03CA0011.apcprd03.prod.outlook.com (2603:1096:300:5b::23)
 by TY2PPFDFFF87E9A.apcprd06.prod.outlook.com (2603:1096:408::7af) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Fri, 19 Dec
 2025 09:54:12 +0000
Received: from OSA0EPF000000C9.apcprd02.prod.outlook.com
 (2603:1096:300:5b:cafe::5c) by PS2PR03CA0011.outlook.office365.com
 (2603:1096:300:5b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.6 via Frontend Transport; Fri,
 19 Dec 2025 09:54:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C9.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 09:54:10 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AA3D841C0A00;
	Fri, 19 Dec 2025 17:54:09 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: peter.chen@cixtech.com,
	fugang.duan@cixtech.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v1 0/2] Add OrangePi 6 Plus board
Date: Fri, 19 Dec 2025 17:54:07 +0800
Message-ID: <20251219095409.1395587-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C9:EE_|TY2PPFDFFF87E9A:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0475e3df-3f71-4297-a832-08de3ee48f50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IWubSTXGdNFGYlueLll6Lr3XqbdpC9nQMABx6ALs/+gt7Nw3b20BWyi6jlY/?=
 =?us-ascii?Q?pGnwfKtc9rB0KCEJys6GtkoBobSwSXvYAs88lGbHgXgIvbjUMkSN3+diggyZ?=
 =?us-ascii?Q?9yPLTZhEcnl8txv8zZjJZ9/3nFmxpnZw6TEb5k6uID/4MjCN2Ti7vFgJhOju?=
 =?us-ascii?Q?gptE3wPNEEmgBSppOiJO+VUM/sqzx7Nc6XIqnWaxhG852t2uZlBIoU1OOKMH?=
 =?us-ascii?Q?AmXMFJ5a1VXsUMT3SLQAf5YrAKMfggETj20VDu989M4UOP6hPfqN0YPRaVfb?=
 =?us-ascii?Q?nrOrcP0BwOyO/15GlnJRVyYLmihmT2Z3WTZqyCW65Li+zgIcQlUU4oEROtMH?=
 =?us-ascii?Q?l1vJm1p76HQ9Bb8KrMQP6fH1fOaFud69kqFQqYkWv2AFKRYz7lHQTxtdrZ1N?=
 =?us-ascii?Q?OG9w8cScC5ug5Z8aN6+vqOhemjUb21vY1QQQo1wh5s+nKD12l98ToBYvuacf?=
 =?us-ascii?Q?05In9StTTB9/OezXKqnvu6mDC6m6GJRI0wUpgA+xjEsl0cEJk+9+NggbGE5b?=
 =?us-ascii?Q?XeMzETVl24139Eil931dlA+upQUFS4xpcgl+kxu9HHQZP4G+T5HtIZePTpnU?=
 =?us-ascii?Q?OCgaTes575Qhl5QJZAxv2j36XaUT6fV85KwDexaHq9xA89Lq5xC9ZQ14UXLs?=
 =?us-ascii?Q?iST29eRanMpK4KiwI8+hwhWEqU6IaX0icG/RayN+bR4FZW3Bvzc54Ekk8Au8?=
 =?us-ascii?Q?Ox/vJj9wtxAkqtlslOjTGpHyD3oeTZmKIHjwx2Gh/TfwxqpQW3bSrI+ljiAg?=
 =?us-ascii?Q?XXjMlH/WTzmXYU/Rr0Xln35feQm9z3adMyH2/dAl5H6gEOx6wnRediai1mou?=
 =?us-ascii?Q?uPUOUuehQn36W8HNQ1Jgzhrxi6zuVY5Vv4mzDnBgJH1pm1t/g6sFEY3pPS1a?=
 =?us-ascii?Q?IknB/QkwdlD11B23ojLyIxXygeXJ9R3e2uqHevIg14ujGxRAgjO5HHNRzB4X?=
 =?us-ascii?Q?bfksQKT7SGb7j87IPgE070Mh/ttmnpF6RLku67xdrqZvKvDyvnHG/75Z/WR/?=
 =?us-ascii?Q?GPhnd5RlhxxDJEJ6IRhH8+vmbMoQ8R+xQYXq33cLK4EtHC4iQj9gIGbErXY9?=
 =?us-ascii?Q?029v6VDX/ulH9wCs6UTP03WSytk/FfuBq1K7PgzNDCiZedfyeXE6BuEgiI74?=
 =?us-ascii?Q?O0JNeVraOvexhrEtD91mq9RjqtkCkLZPDpxo7DefRx8ecSFNqns2zc6fQCPo?=
 =?us-ascii?Q?RyTWmBREH7r0uWb40rUF5O5XRD2iYIcf6zi6Y0zNiC/rE+WPMbs54RFrsFFs?=
 =?us-ascii?Q?WP/qeUC+iSbm9Z3WEwm8Ob1tTAYfeulSfpZZy90rsCva4C5bStPr5wd+u1is?=
 =?us-ascii?Q?GQ3QNlgXXfSu0y034rOfjZYjeKh8FDxe8cU+5v2Xhmau+fUbctdG1LKqDkVi?=
 =?us-ascii?Q?aRrOEtVX2jw8b5VY2AvfUp0dksMOzLuzniYiTmJXHpaypU9vc0g4jCqGORlH?=
 =?us-ascii?Q?Wljjwg+Fm9F3eKlQ4KibSn3aPaZ9wbB0BUUtznY0VjP/IlxF0GQmU36wufbP?=
 =?us-ascii?Q?AM53UzL2rJojWN0j+5meQDfYnQVsLXJ/GhXhwCx5GkyDrJyNbLc4now9q6Ue?=
 =?us-ascii?Q?YHC3h7GkDCM0/pqpdIM=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 09:54:10.8827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0475e3df-3f71-4297-a832-08de3ee48f50
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C9.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPFDFFF87E9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_015425_900315_560084EB 
X-CRM114-Status: UNSURE (   8.30  )
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

Patch 1: add compatible strings for OrangePi 6 Plus board
Patch 2: add dts file for OrangePi 6 Plus board

OrangePi 6 Plus board is powered by Cix Sky1. You could find brief
introduction for SoC and related boards at:
http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-6-Plus.html

Currently, to run upstream kernel at OrangePi 6 Plus board, you need to
use BIOS released by OrangePi, and add "clk_ignore_unused=1" at bootargs.
http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/service-and-support/Orange-Pi-6-Plus.html

Gary Yang (2):
  dt-bindings: arm: cix: add OrangePi 6 Plus board
  arm64: dts: cix: Add OrangePi 6 Plus board support

 .../devicetree/bindings/arm/cix.yaml          |  5 ++
 arch/arm64/boot/dts/cix/Makefile              |  1 +
 arch/arm64/boot/dts/cix/sky1-xcp.dts          | 83 +++++++++++++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 arch/arm64/boot/dts/cix/sky1-xcp.dts

-- 
2.49.0


