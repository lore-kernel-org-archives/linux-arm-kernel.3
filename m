Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8595DE8B38B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 02:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XFJKVy2TCzXFy2XNp9cXoakmX6dK6vQJN/xheg6IUyM=; b=equ4Em3Yt87+vZvUY3JSWerr/a
	xADNrHE0DccNSzKyNjtRXg0VBHOWcT5ci6ChL8Pi7lID8F1fzhSOSkmgep7d+gxHjKFk/WS4UHQJD
	1ENoUI/Pysiq4iIelSyLOBBBuiemtEYL7rf0AKlpBbtXbwXKrPj1ZmxoZB9C8O62sBlyugaGF7v4Y
	HevjftJyL+ux5XYwdAuk45THRqxmt79ljO3b9XsiuenB2jLW5NNzvNf3Y5B6zaJabLXGCmk/lJAUx
	0wghV/qd/kb99pf3Qnzj59uAaukI/LfMqdHIoE+kly+8Iwbe3mACc7UHwJEVorDfWCXGd5KNTmt4S
	jTMY99rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSIG-00000007kDS-3861;
	Wed, 04 Feb 2026 02:07:00 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSID-00000007kAi-03hR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 02:06:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLjTuKjak8Kk7GbqUw9UnbVEq6peuNZb/N6kZf4WVQX40YmmspVtiZMXPjbCM+22NzEI92g57iwuPXh7V9gQjKUQ/Rb9fv5k9WwNwId2bfXRFWBzozWjPvfhH5DxoZoEUxqAKUr7r92jqIRWe3XERn+i1BD5dZwxl+k0CEzU1cjqdtkA24cee4eZ0iNcbZtYJjZHmDSgoOXKrBFOAVU7ODiCsXYuC635PGJDcvDlIvrCO2QwcL0YrKMh8FXvdFw/uJFp3GIERliOgQX6uvvaj45YnOVLgz7YJF36/KsbUSLcGTAUmcdooJbuSF9Kwa1G9CDZzmF+qbJhxDbVCKD4YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFJKVy2TCzXFy2XNp9cXoakmX6dK6vQJN/xheg6IUyM=;
 b=ITdjqEWQrqze8Co1tueB2frVqyGWH74ni2Df/Nt2rOoX0ixQfr1o4vCZsXQyW2uUQ/JsBy0jeuNYlQQck5RqfrRYu9vKfyvfy8TgFOOYhSFyhGcYQ2lMGARbL9uhCPtKNJ9lwo1vSQSP7Nqgh+dz9vR9G3DZQgzrVFFym+M/L5nRwt1fctIQg4Rvmsmlo+p7LmdPHEC1RY/XH1ycNGYcGOj9ZPjpQb4trysymjeVS8ejtWjfwIj8iYyPcYzhhKSzchL7mza0brkJW5WImjxmnE12th+uSArT8b/+xakeJDPafbXJo9YeM14hvKMqJQppns8HYCdP/L6VHOLulQ/LxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SL2P216CA0099.KORP216.PROD.OUTLOOK.COM (2603:1096:101:3::14) by
 KL1PR06MB7320.apcprd06.prod.outlook.com (2603:1096:820:140::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 02:06:46 +0000
Received: from TY2PEPF0000AB84.apcprd03.prod.outlook.com
 (2603:1096:101:3:cafe::d) by SL2P216CA0099.outlook.office365.com
 (2603:1096:101:3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Wed,
 4 Feb 2026 02:06:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB84.mail.protection.outlook.com (10.167.253.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 02:06:45 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 378B941604E2;
	Wed,  4 Feb 2026 10:06:44 +0800 (CST)
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
Subject: [PATCH v7 0/3] Add support for Cix Sky1 resets
Date: Wed,  4 Feb 2026 10:06:41 +0800
Message-ID: <20260204020644.155094-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB84:EE_|KL1PR06MB7320:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 068731f3-311b-47c2-7db6-08de63920c59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|32650700017|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r5MrA2tHsqBhkZyPUTWVG1HyzqkRE4eSWCrxy2qfc9mD9C1BmDT2OQIZpbb5?=
 =?us-ascii?Q?+it5gzsTvK1nBY9KXDAQbr8x8Y7A6ODdyaS3iR4dx0Ivuq4sKE3TFsVr69gm?=
 =?us-ascii?Q?3gTnIgi8/JBLIhHz5Uw1mxchs6FrgqxLg7tW2G1E+rVhbXkCQ5l2hQb9sXE1?=
 =?us-ascii?Q?BdfhF9Fu0lEfsxQoarS1sKTMAaFL+RxifT12rxkFZ25jiCck6vZrz7m5XR9M?=
 =?us-ascii?Q?IQc+ievYGSnrKRGZuTSfK/NwISgOL9b8plnde56C97c7xyKcHsMZRNIhjPkj?=
 =?us-ascii?Q?jx8mYFUc/d9w7IAkE9iRxOvhQzf+7QKVd6DKj6vrpJz13wRHXnz+xhwSU/yW?=
 =?us-ascii?Q?4qz+LE6EmsZUdFqmMk34DxT0tsNCsQIL+Q9HjyQH7Oep0A8tbJHr1SCZvKeh?=
 =?us-ascii?Q?T/ePvvcIS4dcOvFi1zwhYGXQ2+HAO1AH/MTsDjYxmYsGcfksCsq8pXEDOgpx?=
 =?us-ascii?Q?7rLmegkpIQ1AKI8EaKreR+gviWz2o5ulVKBY6E3r4EzQMltAHMZZAQ3Nczbj?=
 =?us-ascii?Q?TZGWgde2J24SV6fYvDxXo6lLCY+CceyADyVPvC6PffNcGvkIDibFAUZ3VNBj?=
 =?us-ascii?Q?OjMrA7pRPJyewReAHffOocJmAYBe2FeLg5YpvEzvRSHAhRwAwFckwAxg5dvn?=
 =?us-ascii?Q?xS5GLtGGdzy0Nh2cJPQfdTJWdeqSVlGlvPYlD1Xy5cvSLmUEnyU4WqvSX0Jb?=
 =?us-ascii?Q?qs2nlFHnzuOAiD6bsVJsOPMuh1477dQAlfhS4CEh5ILDEennuW1GOOHYfCgB?=
 =?us-ascii?Q?frpakjj4vgDGNCZaqJVAGEKufULIqSK24neUUTspPYJ5ck/FaJctlaXr9IOl?=
 =?us-ascii?Q?ZlBaLoYvx3243PTQ3YruPITP2AqZds1rC3PERhXD2sQDQCpW0ZNPTIHO+75a?=
 =?us-ascii?Q?fBZLrwq3yVwwqEpYwOXqK5g/l5cXUX7pv0LF5aIjLGLnHwJFRIMqGZAyTpLb?=
 =?us-ascii?Q?wBPqiFlKyCx93tScWfC5ddgW6NrIb0Izi8HbUf9nxhnjFfWIwrWbP2tl/w7K?=
 =?us-ascii?Q?0kKlgSgWlCJH1EdnFD+H389bOFtOzXyA7Dbz+94387Xp1iIErSzwY0u+rkMq?=
 =?us-ascii?Q?StxjDMk43Ljr581d4xKpp8VxixTZPnwReNRJD5OBxueYXVs3Hh8vUQq5w6Mf?=
 =?us-ascii?Q?Ge0gLSmbuMeeAjR3gcvUgQ5IvII1vfH2SQ7iCIiqbZnuu6kVUHdLCNdMrnMc?=
 =?us-ascii?Q?52wwhnm5sHs58LDTeut+Ne9dJEur6heTlec2mkdS9RWHUG23uQey8+U04ydR?=
 =?us-ascii?Q?9ZUHl3Ge+WzJGi/bS/8xh8Vw2B+Z0P84VuBi1fBiJLtTYyDPPBKfCPv72qBQ?=
 =?us-ascii?Q?3JiPedwBxp/+6R9PpEUat/qFrHKnTZK9Be8N5y7aUl3yVqatckh9MdRidkhH?=
 =?us-ascii?Q?BbAxdXeM3NNSt6DgyOVs1NNKjxaQUmc4S8/NEQvw+aaPl3u1wb/nPyxeK/3B?=
 =?us-ascii?Q?ywEOUh1neWeuo+MtEafuswjE7IR8gKjezDjnLygE+KNBJ5CX1R8Vg8D/esmH?=
 =?us-ascii?Q?Iw/Nqjta/A3xrR5M5xsGfhUG+EwH2cPCx90MUZomx884I7PWfQj/ZDeH5uvQ?=
 =?us-ascii?Q?/fQFlE4BGGMmMNJAJNpPzc7PqLlFnkinbHiMaI+cqM9rG8nbPuHGBA2UZOb7?=
 =?us-ascii?Q?WdwyW5b0OR8bJYSZ9h1s1VH53beYJXH3IASasfmEXJBKylgBpv2k+4sg6byw?=
 =?us-ascii?Q?0ffC4A=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(32650700017)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ecab7lNTspz4pceWDsBzvbJSYHRvei7bF/0q0hohdOv+sgit7bVo9/WzA4DjbswoFMnkI71iZEnbk0S7oENas6o11doFskiysI6Ho01UNr3kDwdbi28DA8JeiUAPzkJP//gRiDeGaBlkB7nAdF2cSnn+NZ6eFf7x14A+PiVCxeRt/vL4VTB7JwSawPurDuGf/V3glw2jq0st9pQked5HyKrb/1M7HiIWzsD2sdYt2jEpx5QIRucVVjk9dnVou+xiHGHJzXb6rrbRJOUQNxs2ISkgqylWn/vviwHUNNOoV7RNw7VkHIpJfmfaiSvI07n2C7A5zFi780ZKA/fW8/PTXllbCj4zGbClwzjtf1ze3RXWjIFDtLwhvpEfj8jyY9cC48i9NY8kSRqxhJNmMvcUok1p0CjXlO/cEcPPHG3umAv+MGUOl0q36Oe0nHsksizv
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 02:06:45.4355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 068731f3-311b-47c2-7db6-08de63920c59
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB84.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB7320
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_180657_051988_FD4538FD 
X-CRM114-Status: UNSURE (   9.78  )
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

 .../soc/cix/cix,sky1-system-control.yaml      |  49 +++++
 arch/arm64/boot/dts/cix/sky1.dtsi             |  14 ++
 drivers/reset/Kconfig                         |   7 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-sky1-base.c               | 117 ++++++++++
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
 15 files changed, 755 insertions(+)
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


