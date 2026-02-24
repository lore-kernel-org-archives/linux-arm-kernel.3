Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBC4EC113C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 09:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WT8P3ny39fA1mTbGCtyivM6TbtWeEVNN+OuWkYClklM=; b=gSUhe8nxEos+fjBxTOAFAO4yW3
	FVauI1oce2q8kHayUDnbgszuWbhGjh8rP8gP28MplBRQjxmdNT0UlKZqu/x6vk4aoM9ow5YrUFb3D
	rimA4/+v0futlBGYjcSnn3ECDMLWHAbNgF8WPaEl6lQRiwNCfq1b/X80uKP5Rvzm3+BR4MaRj18hU
	ZfNwlTVbIdxH+57bfpIleVzAAwOd5hfOMdzoCg+JSxVNGAtas50fsFmezifGMdWUSpeIvehbCd71X
	YOKkgkOUnoU4Z7/ABjVPKduJY1ItZ65fXiQq4B3ENhctjCDK/Ks3C3U3fLxa6+o59I4sze+4eBh1e
	RH5x6ohg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuobj-00000001jIz-2W4V;
	Tue, 24 Feb 2026 09:21:31 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuobc-00000001jF6-2a5b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 09:21:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lm251bcw6a7Z27j8IpZnqJOBQzKGSz+mjbEBhZi1cBHg5qqfDVZpHY8eYEksu3yCmLgRttfZBjhqmOLDOVpUqXCQo+iYmwXGgewO/3iKeJFa+Lzjoj2AOyQGlTyb+z5MwRv9+v+0oUKhFlGSYaTVbaK5cWSALBO+judl4wFPXR3tXAth8eK107eWobND2mdZ5Y7Gc3rQCnax4o3EcqfTOxHITq1i52eoo9VHl0FWUZgkvMol6Tl1/Fc2P+3GPKsKefTuOACf05YY8vCxqA1RQNM1RwB/rwuhjM0o+nfwGKXNWbuCRLF9CccpwCiDxhaQJAA6vKwK+Wvusd6ZRrnuaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WT8P3ny39fA1mTbGCtyivM6TbtWeEVNN+OuWkYClklM=;
 b=Q2zRGJYCTrYiE0DWeOB/gbFBt4kilR1hlOqKyiEk/8jImwGSZqorleVptWejUX2TMaZCqvywDtdc4GPs54Q7fZqDPGhcDLisMf4vVO2tm/JN5x5oTUq1ts7P2joQPGYgo3d7lh78fN+PGk+Bh5GEP4KrcHG9ZmaJybSF1gRyzFy87PMCYPMXr7B5wXRtZesc3NtGbE/yj8lssw7Z+UBrHX1ZdW0iPUcKy8EflxzMVSWxCF6UNffpbWCe52Ji/EheLZpCjd591C7H6k+mr5ewtKEEbJ49QiKJdclT0OHTs/D2NVIZtbbuvpsr3G8b4HstDuHeEHe73aLqbwR9Au+ABg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OSTPR01CA0014.jpnprd01.prod.outlook.com (2603:1096:604:220::6)
 by KL1PR06MB6425.apcprd06.prod.outlook.com (2603:1096:820:f7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 09:21:13 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096:604:220:cafe::e6) by OSTPR01CA0014.outlook.office365.com
 (2603:1096:604:220::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 09:21:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 09:21:12 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C077940A5BD7;
	Tue, 24 Feb 2026 17:21:11 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	peter.chen@cixtech.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v9 0/3] Add support for Cix Sky1 resets
Date: Tue, 24 Feb 2026 17:21:08 +0800
Message-ID: <20260224092111.2198005-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|KL1PR06MB6425:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e9fbeb2c-5c37-4e6e-361d-08de73860de8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zzk+eb/dIaQqDKLqu8gXKg7k7Xk6kgDMFt3KsJhkb5rYb653NHjMcIDysF7w?=
 =?us-ascii?Q?RH72sPYUiomfgUFolr5o8hWGBfBEgX0GuWs9yOcnH5xINgH/TfqtpbNTes+s?=
 =?us-ascii?Q?t8fBNw3IxZ9zyUMZnFchPTSABwk49g9nMfLY/+ZvQ5RcmCZAoapxfnIGRw6v?=
 =?us-ascii?Q?Auw8X+Ejr5gQNf888c0fRlB/QZCRRbh8pquq9XALoZ4xii2gy43kA3ukj/88?=
 =?us-ascii?Q?9kJjLGegiy350AjsTydo3PUv7FjMOGpk2bn6fTsn629OiAWn4B2g0yFtye1V?=
 =?us-ascii?Q?D95qR6grWpqy6o0n5V+TWyeIvA7rg09KEQvcHlGGYTixkR9uN7AuCXz4/Iy/?=
 =?us-ascii?Q?C59XTAaUk7bbfQGBrr8ssnyb59nFa+aFEZx8ROFUW7l5AvSdpd4mZvC2ZoTm?=
 =?us-ascii?Q?DUCW8KKvjowuy4fn4NKHeqHuKkKE/yQ8KL9tedole0cIqG+aXy8VAoeQvz/l?=
 =?us-ascii?Q?1H4yGoWT6UgwBi5J0ThaZkcxe6wAA2+AMBi5u7C4Qmdb+wox2hErlORsLp9I?=
 =?us-ascii?Q?GxOY7BMQj2Uux8Xn9Hk9tQR0vjOB9Z0WOh3KsXaTapcUWNKt0/F14kxz2leN?=
 =?us-ascii?Q?wd23O/j6lZ3uHfX3FSkRvAvoQDUlRY3TAyK8AqlobgugBzyJdOx9br141JaF?=
 =?us-ascii?Q?v3EEilUKiWp8BwcphpqX+jbnEmICip/XuZwjPownvm49EYXk4lCBWFg6rz1V?=
 =?us-ascii?Q?Um9GiK0bQOrLms0o7jaQhbqxcSKl8bgxGNNylQLO1Vf1tnuDXK6nt/k6xztU?=
 =?us-ascii?Q?HVS2g8BHWLVEAj3jdKETsYeM7roh8uDAC+6pBV0IMCEg0OlDiW1vjx5U1FQn?=
 =?us-ascii?Q?GVz+eForHukMs+dN5qE+ojhS+7Xb2UvqlABG4BhXiSOxJi3Wt5VHcIg8Zu91?=
 =?us-ascii?Q?yI50+S7XAmMkAfOi5FDv0zukEi0Cz57R1+0ZrJ0lax8yqMRhhqYKzuxFf1Hk?=
 =?us-ascii?Q?g4FaPgxUvQleQ+qYCO5O+9KgWMnQ5x1QovjZsjHLnv4bBlZrbam4n1JQbDYa?=
 =?us-ascii?Q?Kl/pnVF2d/qz1qd6xSv1wiYlnk/g3iT71SWWkPaDGATO/DJfJZ7EhIWSO/S0?=
 =?us-ascii?Q?wDScMNPiR4lXZdDmDr8BSe3RbT62ZNHTWuXpKZiqrkDfp9jYau33mN8Ic7Zj?=
 =?us-ascii?Q?kSPaGv52K4Lb4X3K3yX1juZ8QFvOhY1ujCMCKPIno5n9VIh6hi5XJkBB+Mkc?=
 =?us-ascii?Q?FaNDsovwBAUpCes7+QacC5Rc8qKdUavFrTI8YkZvKa4gxFo9YOoKLprZClcz?=
 =?us-ascii?Q?81VQlY7rETEMik7rgDL+7Hx/jdMsHE3Qdb0dh4wwg0jhZ0a7wtPo8x+inzgz?=
 =?us-ascii?Q?xuDf1hpwzhA2m2PM0n9j3ukCkfFufSE3/j5elhO3cVNZ5VIMgCFDfA5DnRJg?=
 =?us-ascii?Q?ud9QYpca4fr+1lIawRnimuJqHN21OVOffSA0GBAVDlEn6T0t1a6h2nO2huVf?=
 =?us-ascii?Q?H8RqUnkYrye9SZAs6vmuKdTjGnsGltkkwRmyR4rIfHjtvay2GmhuWD7Cj7KB?=
 =?us-ascii?Q?OJl9Ylv2thrwry6mfhWJe33J61/nuYzRpk8geqsC59oTWzhKxZTA8fMjX8zV?=
 =?us-ascii?Q?VqrV36paFo3G4fqRGgbDbmGV2vzXmdJ1NvZxWmFvwKJCA/kmvvipMoi3TQuB?=
 =?us-ascii?Q?2byNbnXDZ2rhr/WYDiFxG/nKO1Ml3G3TZVw045J10Lljw61Rz8YlAsxet+Vr?=
 =?us-ascii?Q?54RXKw=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OqZsPugt3KxtUtNaT4/cXaUHLYbINxrHtgIAH7GsklvMw8GhwseasRUwuTwoigC5I3+IgrQOqcoxulIt/fvdbxxvFliuVDDb2DSIlwyYUtO/zJO71FKpMl+c3nWyF8asY8s3LRSjKXps8t39f37gkGpl030Gl2usTAcT24GTDdter6qgWzfHyWAfxILdOBi8bjGeWG52e53tKs/9HWvMSLNXSvHnoYhkrxtwaitJMeqawlaWKJgFgQFe1dCB91rLknW0jZP0VyWUhozavPO54SKLZB7dPQVkhXHitNeyNXQhsYl5Rs3gcduXVG3u6YXtAx2ZVhp3rbKd3dJ7qSQTnNpEbe0UAuX8C3XY+93fJPV7Su6y6X0lEx7ETKd6DTU02WJ2wsOKc5ozmDlHG1VX23bzENTo29k425PWy7GzbZY8StJoFoQ1YasgfUphXRGC
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 09:21:12.7177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9fbeb2c-5c37-4e6e-361d-08de73860de8
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6425
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_012124_653413_9495AE26 
X-CRM114-Status: UNSURE (   9.90  )
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

v9 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-system-control.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
scripts/checkpatch.pl 000*.patch
- refine reset driver

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
  dt-bindings: soc: cix: document the syscon on Sky1 SoC
  reset: add Sky1 soc reset support
  arm64: dts: cix: add support for cix sky1 resets

 .../soc/cix/cix,sky1-system-control.yaml      |  42 ++
 arch/arm64/boot/dts/cix/sky1.dtsi             |  12 +
 drivers/reset/Kconfig                         |   7 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-sky1.c                    | 367 ++++++++++++++++++
 include/dt-bindings/reset/cix,sky1-rst-fch.h  |  42 ++
 include/dt-bindings/reset/cix,sky1-rst.h      | 164 ++++++++
 7 files changed, 635 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
 create mode 100644 drivers/reset/reset-sky1.c
 create mode 100644 include/dt-bindings/reset/cix,sky1-rst-fch.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-rst.h

-- 
2.49.0


