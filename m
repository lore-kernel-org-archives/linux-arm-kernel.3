Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9B9E7E0B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 09:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yuP4FFAcWSmwxVAI5XTLwQ1yoGc6U2KN8yNk+i62Ey0=; b=Hcok85fszHycKSEYBd/w70RxN9
	DYvwJ08n5eaX+9sBXXrBuV0yTJt9CHePrYCz0RFVBMNJ2HcSayef3zQU4yy8wrMwZH+SEYChRu8jX
	O1GAe2UnbawUFrfFHAKXizMaXe4ku4tsYTzdlCSLetEJfX0PmZNdKkvq8xYwLL2mvpgK7xIYK1XFl
	kXx9Tedqf8Pmk9S2/9XvIqka/fEAxDbYeoOneK3YdPdQyecNRGhB+/mUNO5/jV+llXepmBqQggNe1
	OaLiEsNUg3S1xToXEg7/fhUpVA8d2RTZCJ25iP8ls6m2CeFT8hHQACL2lqJpCZyjeFhD2a8UfDfqh
	LsLN1ccQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNeW-0000000F8uW-2hLh;
	Mon, 09 Feb 2026 09:33:56 +0000
Received: from mail-japaneastazon11023119.outbound.protection.outlook.com ([52.101.127.119] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNeS-0000000F8sJ-15LR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 09:33:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1UmHWoPLmkIObthZmBiyVwkKx2JNXLiHS7A9BXdsB5S9AHCR9l9IChmh43ij9mN/Z8q1XO3zOmaS7DiBKKPgxc5T8dqioL4iACddVvJNhUsO5fAX4mru/L+482uvdPDWUXEucJsoFWsMRgQhkmqyzfq+ZOEIoiNsclQfoWedQos0yVdRSJdo0Q6HaajuNF2bbiUgOC0PZdQ/tC4Mjg4YYkaaPh8X2CsqrFz511+7mT7Vx8hrOfP4/AlNAXnDZurWW2pM8IBew64WQ/7OeenGe2HhLIhVDNxYgzWA5Kz2ElBwbHFYYwALyXrFk8J3lCq4MqoVu6by+qXyMmHu7BUwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuP4FFAcWSmwxVAI5XTLwQ1yoGc6U2KN8yNk+i62Ey0=;
 b=y12XfYxWwPvDKjTslgAqaSfB5v8iYjtLiDBqTxfdpeJs6gPNwCrtXHkHCCFGj92kVDp7ZXSGOs4c1Bt9Pf4janov0zrKGQKI2dKGM65gtwESDC8m5k6rORea0PiO+MMOXQPW7sNGx0Uq3wPuXVE+nJD4CPTC4cZ2xv/FwicB9gU+R0l2EoRUBRGTzaEkt6lZIcCKjA5e7jlnEZBVdygsuIVRAz33s0CvLLIXKhkL4yTBEqf/MNwgskDle9MuUs+i/6iX/l30wyq5YOQiAP1qw8gHu9un8QQGdzrQuLwn+Sk+O+h+YgVyjmrYiF4YaEKVXvquwLNmSRZ0jlMAw6Cc3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SE2P216CA0014.KORP216.PROD.OUTLOOK.COM (2603:1096:101:117::11)
 by TYPPR06MB8328.apcprd06.prod.outlook.com (2603:1096:405:396::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 09:33:46 +0000
Received: from OSA0EPF000000C6.apcprd02.prod.outlook.com
 (2603:1096:101:117:cafe::9c) by SE2P216CA0014.outlook.office365.com
 (2603:1096:101:117::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Mon,
 9 Feb 2026 09:33:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C6.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 09:33:45 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8F82740A5BD7;
	Mon,  9 Feb 2026 17:33:44 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	peter.chen@cixtech.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	alchark@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v8 0/3] Add support for Cix Sky1 resets
Date: Mon,  9 Feb 2026 17:33:41 +0800
Message-ID: <20260209093344.2013693-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C6:EE_|TYPPR06MB8328:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dec37069-2c5a-41e2-41b3-08de67be5254
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|32650700017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uxbxEJRapnkHa4j9oVa2R2p4PCP8hGkUIQGqDfSo3C3JKUBu+GIf4Xx2DA9x?=
 =?us-ascii?Q?Ttt0CUGc82Qbw0v2p50/bwaZ9BfXfuzT0i3xzxAWD8gSKH9mWrvzYEcIjkdH?=
 =?us-ascii?Q?bGFtGe0AmDRUrGOWWkBr/VRlsDgBF3OWavzCMbTAgi7wDOKFJ5BpkCrzy/dj?=
 =?us-ascii?Q?kX6gNZn02lewuJh8yTOmYwrc02ztAQaDEntHKUzag6aDFs6KkagBcm91Wg+J?=
 =?us-ascii?Q?nec6lOsTZRni8G42EdvCbeu9KKamzARWpMghU5maAHSqUEMjZfrvBWebqSwK?=
 =?us-ascii?Q?XA20wQZDEoztQ3Crsa8ge5CjC5eXapkN13s8pUok0nrf7NgXeK8ahDroSvHO?=
 =?us-ascii?Q?k05cpZugQ8dj4ZolRE2enxTANoWGB0wUn0h2i14BxeTgoe8OFefl2ek1io8r?=
 =?us-ascii?Q?ZT+9Z/ig/z5ZhtNbZ4O1sOE1dnIR7XGqxeI7fDhESKA5HUEXplrHn+ArSqOo?=
 =?us-ascii?Q?q5iRbKBCNWpm1uCEa+1S5/EeCAwdX0k/Qu9IRUKzs0A8Oqcjgszg2/8EBHdH?=
 =?us-ascii?Q?cYFrBlhbiPCfX1iV8OGQi56kR5sKs2Zrg827Bv5JktIJbiv0cSDxd3S6ZUbC?=
 =?us-ascii?Q?xQEiajGLudmo8rilBYXF31KJdVmqRuIrtVz/tqWqy+fppHhEXeeHMyiBFIgh?=
 =?us-ascii?Q?EmkP8YpXtimdJ/OZNP1T4Zc0JqYIovMN04qqEPoifO9yQ9wetYEV8CMAIKXJ?=
 =?us-ascii?Q?wujPK03MMtpMRUdgWZxg4azbRMzuESlH1pcJCiX0+2nDkrHwA5cPrmGVU1Uc?=
 =?us-ascii?Q?GRPUAd5VB6MAV+24jLhZxx5nd2/435biQKuTzrpOubrcP+yfse7yUCGFInMa?=
 =?us-ascii?Q?WAOQ8reft4LqX6wGbfXIhy5ddGm7o8diQ62tQbdfjNUlcYxpdQwwoAetNChN?=
 =?us-ascii?Q?7odWoKIeu259p73CLMaKSXrOmW2ihIJTktgnfU/642+7NMygo0NxY0VwpRNb?=
 =?us-ascii?Q?d3iobOiqvQtnXexV4WFCJLO6mqdpis76x5AAD8cbkJKF2FB4We3Yu5DjHjUu?=
 =?us-ascii?Q?9M9Nvs0HgGU849sAbDpWa5K9Qx+VNTiOan58Z0BZ1JQHHANPB4qgg1liziui?=
 =?us-ascii?Q?Y86cKWn6d4uxGAfySeh497J9WiFXgCqdVFz51+N8ptSnpJcbiRG1RCcwWC8u?=
 =?us-ascii?Q?IwVZoKbiwmv8JikXLFHUamFhdleKKYSrP/Z7mh9uWHL6cIL4x3vV2CHj0x7M?=
 =?us-ascii?Q?sK9DynG95oXkzDuY9GvhuVQIolby7TelIiOf1CajfzOVdL+oaQwnmnfPLq7j?=
 =?us-ascii?Q?/yhN0VgCavvgpO56DGMip2e2pRRvHnq+F5x3aJsGJFy57rDu0kpGbIJ5eCpu?=
 =?us-ascii?Q?kPgMM2qBVL6TyZ037OcZqyFisblxSFIWtOJrGL/HRgw3/+WhKf7WQzsJ6wzb?=
 =?us-ascii?Q?m13whE7wKDmn6fXKDhU5viDgTUBMiGOhKvy/hc0dVf6aVGkJS0hBi8nRvauu?=
 =?us-ascii?Q?/mWV+WwyQ3dEoYM8/biSj/aGVpHI234mLON4H8X5z4Rs6gibytz71AHVSzTo?=
 =?us-ascii?Q?ZOUmM3pP5mkSJi5z5UE+ebsnG7XTE+zkG1oRMvgXHNzIUzQ2tfHR1zDp17/s?=
 =?us-ascii?Q?1jGY3302j83OLxzU4hOvF4AA2NdgtD46ps0JEg254i9uAusmcbLqTR4BLjBD?=
 =?us-ascii?Q?DQuin7QnDyqHXfevKfBBIJeyiZqkdpyzsXJ5WJfUQfFS+2YZqB+rSVZXzrYO?=
 =?us-ascii?Q?Yigq4Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(32650700017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mSVbFmfjVY6f0KN07fcA/YC+uXHJvc2mldbcDjPbH/obqxaJBFOUqyWuj7kbp55Muw1D2GljcjNzNzhTOQiqpMND8a2BAFPcFwisirHeX3F7Cr1suO14OoMlE+u/kInEjmn4kYA6ERhbmNlDB/6+QO3AySaPfe/xlGcaiJurEuQvcQUDx7zrAoCFb1TMIaDnN/kYRRk0WF2Bac3pnJmU/VfZLMyFDFQfYRUDEmIv88ZodYnqoWZ7F03qjNDWESNeJqk0Npim+p2BrGk6et/Z0DHmN6EQPmKKCniBrZepaFJzAnWWK11fQb7leePB1wF1stWlW/IER35ZhVhp6yefW/0MIzUViHGvi+Z2V9MqokbmjFc3yY6QZ5IJjEsG6oHkCcA1j1prGpmBJcTZUtCRZAu3hI5RCXhTJYwv+zfL5YHtvefe8u1bgFrSWvc+2nxK
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 09:33:45.3819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dec37069-2c5a-41e2-41b3-08de67be5254
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR06MB8328
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_013352_317390_954ECB17 
X-CRM114-Status: UNSURE (   9.86  )
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

v8 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-system-control.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
scripts/checkpatch.pl 000*.patch
- refine reset driver
- remove "simple-mfd" strings

v7 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-system-control.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
scripts/checkpatch.pl 000*.patch
- fix build warning

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

 .../soc/cix/cix,sky1-system-control.yaml      |  42 ++
 arch/arm64/boot/dts/cix/sky1.dtsi             |  12 +
 drivers/reset/Kconfig                         |   7 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-sky1.c                    | 374 ++++++++++++++++++
 drivers/soc/Kconfig                           |   1 +
 drivers/soc/Makefile                          |   1 +
 drivers/soc/cix/Kconfig                       |  11 +
 drivers/soc/cix/Makefile                      |   1 +
 drivers/soc/cix/sky1-system-control.c         |  47 +++
 include/dt-bindings/reset/cix,sky1-rst-fch.h  |  42 ++
 include/dt-bindings/reset/cix,sky1-rst.h      | 164 ++++++++
 12 files changed, 703 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
 create mode 100644 drivers/reset/reset-sky1.c
 create mode 100644 drivers/soc/cix/Kconfig
 create mode 100644 drivers/soc/cix/Makefile
 create mode 100644 drivers/soc/cix/sky1-system-control.c
 create mode 100644 include/dt-bindings/reset/cix,sky1-rst-fch.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-rst.h

-- 
2.49.0


