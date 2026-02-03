Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAE7E83041
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 02:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FD7wA375MM/rZFmPVWGXM25NBnh0YgUcuiZ9KCpuHDs=; b=I/JubPSymN8PapCaK8ycnh6kI4
	3LyoRtfmnMYeU4dOrfHR2v1xpm4fUimAIjbwzU9IYpeRIh7kQV+TFYWnlrYAoOCel3snIvY6w/HCC
	wihEcGleg+CyotiCVzWoSBO2epYwoPcJK11UzlbtdgNenKpcV7c0TRDJ4c35aYgnw2A1xA/NBHwxF
	kq4oZ3PHouxs6ZWMxyILxtH4uld9Hqp7u1QqR+pINkpIXkjoNWfM5+avDcrKFbUrNwARjzq1xJ1wN
	XM0LzvuTGQO/iLli72uNdlqyuYDIs2Z2ivWRgVhk5bx0IKbhC6BYAURudf2wZSA5XGIgu1Aebzb37
	RAABQcOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn621-00000005udn-1JLL;
	Tue, 03 Feb 2026 02:20:45 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn61y-00000005ucE-2ia3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 02:20:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g2NO2GErzoCOsvUaxhgyH0UpzQkavjoYUXgXSNuLyYMJnHZDvtBe02Ef6iV/SBR3cqK9UY+yDsgNnIWVCdUnqhCTw+4Ee1YA2oa/xiQAoA9QyeTpsov2x1YCkpLYHIoAVuNnOnYt7qkcuUeJ6yXSmR1I6ZyWzUkwxU9nrsQOtjRisGBmk3xTZ/YjSoIO1xGDnmyoXUSHFel8QdUdhCnWU/drEe4fqzMf5A5VcVmbgcJhpljMLDxmyuPNEE53sYftldUJaaoZv5uJeavqVpkhwYCexlYo8l85HGcL+LAnrvcWgBXv9xaZmfY2UPk5QWpUYfgr4S6oshD2ndKvlorEJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FD7wA375MM/rZFmPVWGXM25NBnh0YgUcuiZ9KCpuHDs=;
 b=dvGIOIr6tyCtkE8/asW/9S/XBX9NOrhdeFSd+huCDqF6yO+tjxvlk0jfz4SPQstdmulXJDWd4/n566E9Dkznm0MdzEqN7ScXhf4TnRIbLpDEnYvkZ/mU9xgkHI8xa20u9QRuQhUMVRW2R/y9MHeeTSA5nmPRwgk78DWgjVnsBUqVTf4XyGcelrym0iBC78qkNlHXNDccCaIPdFXwhQ8O3qLY4U8v0HW/IGGXccK/VlV7O4mgpIheW7QdUTsVOaoAtDTTwRjv+/KvqW8ZCKEEiHhPgY5yd0zMzWnk4FBKaiSirUFHXF81fQcwvTSgXIibpJjODS+E2BTIwjKja77Mgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6) by
 KL1PR06MB6624.apcprd06.prod.outlook.com (2603:1096:820:ef::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Tue, 3 Feb 2026 02:20:32 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:4:140:cafe::b8) by SI2P153CA0014.outlook.office365.com
 (2603:1096:4:140::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 02:20:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 02:20:32 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 894454350704;
	Tue,  3 Feb 2026 10:20:31 +0800 (CST)
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
Date: Tue,  3 Feb 2026 10:20:28 +0800
Message-ID: <20260203022031.4075627-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|KL1PR06MB6624:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: feb498ec-ab02-427d-e662-08de62cacec7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1wQKlidr3bV0pF8FTWv29OqgT2u6M+qJjtDlbkzdHJ9vrgZn+iUmzZYLTqTD?=
 =?us-ascii?Q?bev1jqCYmX6sHwCC9bHYK8ZK0aaBBIayN1wjOQ9akZIGnmDjLAGZpAv91zqv?=
 =?us-ascii?Q?AlBfnklciJgbH71XyV2+wjYlmgTBjy2arn4gSrN74ZRqIG0JWqpHzzG71zsG?=
 =?us-ascii?Q?fF55Bwy9I+0FLQOfN4IjnhsGmAg8xUsV55ZtKU+tqpWuM1L1xfhiZ0Ha+HLa?=
 =?us-ascii?Q?0xo2yXwnJaBo0uNckYbKR28UxOm0FeC0NH9h4c8eBIwFkB4gvJYCrqjgtgIZ?=
 =?us-ascii?Q?VddC4WV88xLbX8/CUFrtKkjBDfDZ5+oGRu9uaUefyQ3aGS9aUq2m5AcujP/G?=
 =?us-ascii?Q?UMk8sO9LLRQnHGA+SnCRgqfuhfyET8iXeQTMN9irIVKauIXisOKnkL2nvdXm?=
 =?us-ascii?Q?l0hCTwctTGkhm4FVbp5gU/EfYQW24X6QGn4H0UIloLQfwGObSk2VHLxsCKCa?=
 =?us-ascii?Q?Gl3n4vMJaxy+HnoQqeyIVuJBDiqaqrSqZC72GHfHL+RcO+vYcrNYAvIA9aOU?=
 =?us-ascii?Q?nt0Q2B7z6k6RxUalA9kQdlfy7KXcGLyJGDIzipEk9c7bM1jI7C5jpoKmDkDx?=
 =?us-ascii?Q?Nw+rK8jCkCWlcoySbvjnN3MnJXYMvmTf/WIcLLz1VX5dxbFFJCzd4P4Ar12i?=
 =?us-ascii?Q?znqhCrm0AZhlix9HZZQPrQxY16l19Ph+6Z7e90OmldZhnGKjfdM+PhGCIeg+?=
 =?us-ascii?Q?zFXwNnN/1DzjZJFeshIKu+lRx7LR0kqcJ7CXyVXk9iKs9LMHCfJLgLBL9QIg?=
 =?us-ascii?Q?8ePYitdMavDRnrofCdAthySnIxFSz6nzk7Lidw6uqtH9yCz1yb84rkOHKaO8?=
 =?us-ascii?Q?VI8KIbKYhRRaxCh2+PU3v5qjmQxDTmzBZ5B1W8YKANgdRXN1qtkR4rKZGuFz?=
 =?us-ascii?Q?Dexw+cMu7SObzqnoBd0LguegBcXMHXW2M2BNrg0zgEZZVz/15YByPGCYSzn8?=
 =?us-ascii?Q?oQgpE/wxt6433syLkSRyqrOe+t+wOQcT15G5WIXqfjJ5KcKsvsojgNMaDFYT?=
 =?us-ascii?Q?xsVgBWwsMO0Ck5LKDpJh7WCqnOlPXzQTseJqFujLm2AVwjR8hx6ejc42AYWs?=
 =?us-ascii?Q?LNuKgl52Qd0yqV8qBC4wyqqAVXwcFAouhJtst9PuVe52G7SOPRmuFvc7QALY?=
 =?us-ascii?Q?pQUM4sxF4kFB+U0azS7iz0RaV1LjcG4k+8sCnqnHOz8QHBdz40lFQ0LvZGRa?=
 =?us-ascii?Q?qZSu2ySK2YPb1swnyoQUGPIFhVUVN+gIQkzxKSUrORm+AezNWjDDyC4bE7qn?=
 =?us-ascii?Q?Y/iTH+Eryz41/C5EN/zGFT2nikQBduXdz+rFyb5mbmI59gq5efbWomIxmbEl?=
 =?us-ascii?Q?r8XYyHEIH8BRS384yGeyPrqQzVBNDAlTttrhFr2YdojELoa6vsRU1m0mG2wQ?=
 =?us-ascii?Q?LCEde52t+0gos39aajuJBN6q1vNiuWRhIIPZcfBC1H9pqiWKZJtkBL4DSipP?=
 =?us-ascii?Q?EW0uShVSmVUB2zVMreROy6xuRiqELraDYYkDKZiSplvbvrVQeBgxVxt8ABIu?=
 =?us-ascii?Q?P7pJ86+h0qy8qtnu4Nmo9v3iNK+sYsZvikk7H4kn0ot8dbejwG29pJFCn7Cl?=
 =?us-ascii?Q?txL+Dg3RAtbePly5ptVkm7G938tdfKtpIz9AHWyAdTXVPH9FkR2gYh4PIf5Y?=
 =?us-ascii?Q?fTcucGcw5txyfrkO4acjMrmGw5lsZllMt6MPmWM5+JoT/tpZ465Sy8xQwOa+?=
 =?us-ascii?Q?72Yjmw=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /rqhZhv0PWZc7l3cXMoqHG1IvipY/roM0ZpKP1JKqfRhJR2pHmSK5tth/KR8wKpdPxfCF8LkN2MlNx1JCrsDc6tDbV+qTYonXVuqQR0hCL/330wruV0VKAkTSfpyQgedmkebg8PR3UQLmGRV6eiiWBadB8SUOHPVHqFNV5+NwshEOEQUxSb27W7uvefp1p3wPMvOUlhuIszhMaqjdagEjnTlqHbAzyclL9dh+ptNARhmxw09QaxQkZC1SRypJ2v+HVb1QSAHuIzvN3a2+Iqvhz1CiRjL7UFP1l/0mcP/vf1wIBxroB+KWMcaTGDTM5OCXwePAu2Q/40bc7bPjElsHZ7QF15vl0dcrVs4J0154eTOkuGkXLwiORfvM7h+IBeJnEQSxF8HArovz7kJZvkVbA0Hcjvh3oglcBGUsuQ+43YRo3ok4wZg2lmVcLC0JkZd
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 02:20:32.3560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: feb498ec-ab02-427d-e662-08de62cacec7
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_182042_707732_3352EBB0 
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
 drivers/reset/reset-sky1-base.c               | 126 +++++++++++
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
 15 files changed, 764 insertions(+)
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


