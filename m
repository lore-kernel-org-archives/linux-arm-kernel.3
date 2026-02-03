Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB07E7C71D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 02:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SlbK7wXSKwHdqZj8ToMf3yT888t8R1Z5oZrQfwB1MJg=; b=KGQxKA/RKRtjAcvFpxKWmxUpQD
	eZrdFjUX8fKx0jDytUJgVNfpAvCYoEzLbeX98WK9e2HRldPFy8bDKZ8eJ3PoNNXgGa9mRcao/Nh4l
	iOsQaUFiLme9+taiLDmkNUgdhWgMzuUUrEmX1j5eRr++aRVuIv+eg3HBLC7IgQWFwZwby6xTOnDfr
	sPK4aJCw7yqyLnmk6Q5kJBT63YdNnE2NZ2+icQfia2HKwdn6X/0JG1OK8rALEdNp+jy+t9Vbwf9Du
	V7PoB37kLVaYoVsSuNwFLkaLN02TCS96yNob1nE+6E8/DvdQGvFdsgzsFMTHKadvd1UGK1uzjGtDY
	ifobsGmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn5sn-00000005tsj-1ne7;
	Tue, 03 Feb 2026 02:11:13 +0000
Received: from mail-koreacentralazon11023118.outbound.protection.outlook.com ([40.107.44.118] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn5sl-00000005tqt-2YnQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 02:11:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFMF+CLa6peG2KCcJroFa1IqGY4ZVUVgmxIo51q1t3Anpx7d+/sLfqkQouwqMNd7YPUtVLxR1p5wjw6T4AqhffNWUrXtqwzoDcMFlGNILGw3EHj+J0Bvxd3UW3nk6h+tus5X9jUnnx3ZCKVl0IcMZZR3mpeDCIVPRIr09FVFaT5FUZBoh/nqX/01vzvISQVslIbWkAHKNViWj1TYD493Y80EJuzCaovt4ptWrtiaA7SLEuQF43zj4L0j9u7kp1UUbuj5dTTF4IhiayjjKkEujebxy5OBf8D69nu2LKwdquPCBsC0ya/dkdr+PN4/4rr9h0GViVjIcHI9rid54fAIJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlbK7wXSKwHdqZj8ToMf3yT888t8R1Z5oZrQfwB1MJg=;
 b=KZ3I0huuySws729IsrSfOlsu0Hw6BWK47Wa89Bcm9b2yT7BHWk8tJSaj99p85+73AZNBqXVz/6LF4P4js3ZI8G+JRgTlm+mbheDJM4auNJILTeUYjr8C8qat20Yc/hce5N/YKlZ2cSMFSgv0MoBP+LVEKj9wsPSlqKzL+QO5HCf+r94j1StBU8b9woWhVXDkFw3mvp17CGa0nL6rrXpWJp8ywX3Ff7M+Kzcy6fN573X1OBUKkmUrR9T7ww+KQbp3Nxb/JhK7+uMqIwHxZKghB2FyD1saVIfjC/eS5v0hdBtwo1WWqOjGLZk3SVetWmRoq+bBbAVjoOKPH0yVsea/UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0047.apcprd01.prod.exchangelabs.com
 (2603:1096:300:58::35) by SG2PR06MB5381.apcprd06.prod.outlook.com
 (2603:1096:4:1d0::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 02:10:56 +0000
Received: from TY2PEPF0000AB89.apcprd03.prod.outlook.com
 (2603:1096:300:58:cafe::a5) by PS2PR01CA0047.outlook.office365.com
 (2603:1096:300:58::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 02:10:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB89.mail.protection.outlook.com (10.167.253.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 02:10:55 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C79BE4350704;
	Tue,  3 Feb 2026 10:10:53 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	peter.chen@cixtech.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v6 0/3] Add support for Cix Sky1 resets
Date: Tue,  3 Feb 2026 10:10:50 +0800
Message-ID: <20260203021053.4073258-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB89:EE_|SG2PR06MB5381:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8a82c842-b041-4b43-07d8-08de62c976b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fYlmjLbyzsI9UGLpVPCCjKLWfnaZcf65k9p+stDyZk6aq1Wsk/sipBa/V51Y?=
 =?us-ascii?Q?wMFFGrSjIx1JOJyf2zH5RKxLuCxDV/ee6JQujXkB1ftjLNv9a4bPv9jBomh8?=
 =?us-ascii?Q?nyy6+0qhz10TttKEsjOwvgFAmMiAxCgcjJH6HgiWXJrWh4vlV65PRo6trTX9?=
 =?us-ascii?Q?lmE3JNMK4b06ELBZkctctQ4ZXNh2y6aabMJK22YBET08rF5X68UwWF8cFzrg?=
 =?us-ascii?Q?avhWAv+nkHl7ZRC/DDYfvK4+e+Mw+DLD+3/Jf5TJ1XEjmqt12vIlUWfdGG0F?=
 =?us-ascii?Q?XGz+GZI4Fe9BhOUHMop/eTGvHmS0uaWuZLDpOltVcF5XwR5qaO6715SNxnQ+?=
 =?us-ascii?Q?Xn9gNdYR/T/JtOt7j03gCOUdCSYveeTaWAyQFJ3yzRRp71LZYSJhAx+ltBcU?=
 =?us-ascii?Q?VtNtpLfano+08pCU5MuJX8R0WCMhcnwz7rMN0MhciRnlPqjQzl327kuwMf9h?=
 =?us-ascii?Q?TzxwQpBgUdO31RZbiVzgv7kaaNRwo3EOFmopRtCUXj7T8Za2Gu/o53+U51vM?=
 =?us-ascii?Q?qWzWWEyRumk3lwTOYaBLJr29RjgekYiMhK9Nv4bBgO7xwtkuKb39FifvK6yR?=
 =?us-ascii?Q?ScCdCgU+azg3K6Ra0QcnOgHmLJEg5oabVd6rAysbcXQMlZeMCy/l8j3Z8sV/?=
 =?us-ascii?Q?TIfpep19xRqcHe7Dt1hi8NMfwfCuYb8MyZkD2q4OLGnZTfe/yhnkqdt4r1u3?=
 =?us-ascii?Q?ThxEgY7ofL45t4alI1pu78j6umH7aNYU2f42omnPTKRLghXFXE6+AEefFXXK?=
 =?us-ascii?Q?UfkTj/5GbO4BeK+Dz6f30OfhapVmfrxVISoiILtkkgN0ixiGqMEnGiRzbem1?=
 =?us-ascii?Q?MAJbYrC4rtOtEpmfi6v1FiY7PGqmhSa6b4iDUmBVGyksXb3yT/x5x4Dz9AYz?=
 =?us-ascii?Q?zqyNY61mdunP4PRNoBCPeqDBd4HDLUMXPeL3RrJOP0g8e/qvorcg9TEbOoqN?=
 =?us-ascii?Q?HyFXgTfW5jEj7BHs+htodFDXVF1l3zKMdxqKfKNiNFASVVceBwd6+G3/9o8n?=
 =?us-ascii?Q?HEAogPIE3UnoMOGwvbxTQwCKVkOPu2FligJ6y0/6QI1bbr1h0Ilx/Ap0xFpD?=
 =?us-ascii?Q?yxzCsExKT98FFdOkoAESQ/+UIMQ87YQjF9QHsiNLRijnkph10mI0++2F65Qb?=
 =?us-ascii?Q?ypzGMtAtNFj5Q2luKP1Pvc3x+jJQXSRJxaw6bw3LShc681iqFkWGzhdGrdmd?=
 =?us-ascii?Q?icqSAiVf8K7+FQ3ggcVYjSSkpChfT76vTrp+WthsqeC1MMdNLN8kNwqBxtvh?=
 =?us-ascii?Q?GO+n2rh8NjZm5AbdZAal+9FauYBJP1TVcdQU1k7Dmag8fwgjfXtdNZo4+BMu?=
 =?us-ascii?Q?SpPWzKbT144sQD4f5HlUYB+OWoVRmlkW1OeBVj8bIRoGv5LPEEhOkDyol6Zt?=
 =?us-ascii?Q?B2c35uayhyb5+vE9L/qrInuGOUu19Ge9IC4kdCzEVmboRbbKHholiZs+1UlD?=
 =?us-ascii?Q?WQ4CYfx/2IE1fRT7yG408RkCvI9i6SQGNsQjK2CIdrtZk59OgaQYRo6KADUB?=
 =?us-ascii?Q?5ay8vpUVT02LLlapl0O9x+b5uMKDyJ7qKVqsWiI44ZiILAXjY+UM16cuVRmB?=
 =?us-ascii?Q?bp1KE1HwSQQzTEBXuhtGVXHg1cx0w64GmeyDwW5Es+TlWCUOoUuRi6M+Lwu9?=
 =?us-ascii?Q?JqyWb0RBLEP7M2nBvY0tDmzKQHRXZgSuTEe4y2G6EBt9jHXFPh3Hfqwv5Z+7?=
 =?us-ascii?Q?9AS2+Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AGKShJs4TZU3uqguJoNdEwQ780YJiLWIRXjXulEunJAqW4QspHFcFIy19/3ma8CMIw2SLDBg5LdUJrCXVHX8IxbIQY5zBnVfiU0sAZlbiz2mou/SNaqRn7VLu3TbobDgWGPjZhJTjtz4IF+wX537AIWLL9rNPWAz/nmGcptAA7BQEsN7kaNKItdUgSZT+iMlbsM0/uxLmjP7Cje71xtpOC6ZN9JOqyRqVjFrmMwkBG/DGY+g/B1O2v73xxtQxqW3X/zdoTssy2Gc4+ZtXrstHQzSA7DwI4NOO2d3suXP78M/VqWs/XqG/R9dRBMAt2wO07LBm4+7hehJaE7C9pq9EUBogWym/r7jj9z2HEUxn/Q/IvV5Gd2F7FbsAXCwDEWauq+2zsqVdEh7LyDle7Hr5twgA1Pn6Bgn1akMmhHigHtrbme7oZrGCGUDoXhGE/d3
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 02:10:55.0125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a82c842-b041-4b43-07d8-08de62c976b3
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB89.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5381
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_181111_653687_DC04B83E 
X-CRM114-Status: UNSURE (   9.20  )
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

v6 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-system-control.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
scripts/checkpatch.pl 000*.patch
- refine reset driver
- fix dt-bindings style

v5 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-rst.yaml
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-system-controller.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
scripts/checkpatch.pl 000*.patch
- refine reset driver
- fix dt-bindings style

v4 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-rst.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
scripts/checkpatch.pl 000*.patch
- add syscon
- refine reset driver
- fix dt-bindings style

v3 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-rst.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
scripts/checkpatch.pl 000*.patch
- remove syscon

v2 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-rst.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
scripts/checkpatch.pl 000*.patch
- fix dt-bindings style
- refine reset driver

Gary Yang (3):
  dt-bindings: soc: cix: document the simple-mfd syscon on Sky1 SoC
  reset: add Sky1 soc reset support
  arm64: dts: cix: add support for cix sky1 resets

 .../soc/cix/cix,sky1-system-control.yaml      |  49 +++++
 arch/arm64/boot/dts/cix/sky1.dtsi             |  14 ++
 drivers/reset/Kconfig                         |   7 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-sky1-base.c               | 125 +++++++++++
 drivers/reset/reset-sky1-fch.c                |  78 +++++++
 drivers/reset/reset-sky1.c                    | 204 ++++++++++++++++++
 drivers/soc/Kconfig                           |   1 +
 drivers/soc/Makefile                          |   1 +
 drivers/soc/cix/Kconfig                       |  11 +
 drivers/soc/cix/Makefile                      |   1 +
 drivers/soc/cix/sky1-system-control.c         |  47 ++++
 include/dt-bindings/reset/cix,sky1-rst-fch.h  |  42 ++++
 include/dt-bindings/reset/cix,sky1-rst.h      | 164 ++++++++++++++
 include/linux/reset/sky1.h                    |  18 ++
 15 files changed, 763 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
 create mode 100644 drivers/reset/reset-sky1-base.c
 create mode 100644 drivers/reset/reset-sky1-fch.c
 create mode 100644 drivers/reset/reset-sky1.c
 create mode 100644 drivers/soc/cix/Kconfig
 create mode 100644 drivers/soc/cix/Makefile
 create mode 100644 drivers/soc/cix/sky1-system-control.c
 create mode 100644 include/dt-bindings/reset/cix,sky1-rst-fch.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-rst.h
 create mode 100644 include/linux/reset/sky1.h

-- 
2.49.0


