Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9CDC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 08:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vcl4Hb/xIPNiuLLKRpFX2zPcBOkD3NhqYwakqkM36EY=; b=DhxuwmlW5kgRcgmBZcCfmHOoDj
	K6vbrbhYKNSrLED650Mjdh9ppUju8TxaH0NKCYds6f0um5JR5Cl4W4uvgfS7DvwSVGVXr4QTFOmLs
	KCsbQjGl6SGjKa/VASylLCQNFGyog9NGBW8JPlZSvOr9hKqekbeO9dGrEoJ2qBGzr6YAIOH9LquDi
	7tVYqp5fbU2Az4X9mPYb+p6RQWnGFi39nyncAOOaOD5iJxsQeOAy7x0GTb3gBvPaB6RfBVzWgnYvf
	CMiuL+khgCBj+1Z22ZverlSp4W4MafvSRQDijk97QYcDh06iBNOp3KDQh8i6732kLHQ3kTMtWtBso
	ml7kXGgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2E5-0000000HRoL-0qhF;
	Thu, 20 Feb 2025 08:48:09 +0000
Received: from mail-tyzapc01on20709.outbound.protection.outlook.com ([2a01:111:f403:2011::709] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl26r-0000000HPbx-0sZk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 08:40:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOaU7Y4KwZyiaB+OmznHvxFcyD1K8MlvOIN7hV12PbAutcKblJ6R0kLHfC0CK0me9PLXlrqAaX0KK4MyaCRSe1UkEzzCABSJRj7ata5LkXyrElptXTsdHCVtcnTQFv8vbhRFF2Lx3EA0UvxHxPzDM8GzswqALw1G1mdioK+9S3oUrd1PhSGUnGeEL6SkA/0WPD30GkPxIkrbs6OMUNrXGsEKOH3EMxG/2FzSvQxe6kypKJCAWV0T/FcqPLw1lnjBUURb++EsWpqvyBqFArcWSkce1gHcbpKUhzXKpS+9QJ29nsl05qCxF5YvJJvtXmiqsfAFHKoopanCCNE55DbCyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vcl4Hb/xIPNiuLLKRpFX2zPcBOkD3NhqYwakqkM36EY=;
 b=vmnXLeWgOn0ObdxLD98R7UdR3DbyfAaqzyPu8TUkuZowWEOcLsnzdK/dRgdV7XRYtdsQquGJH3Nrrxay4Cccj4PDXq2FKKHTuYKHD2qiBhNLK030vG+OqMmAY9XXLexC7GrZhW+YsOI94aGgPTdPKECi3HJWB0Ho9WF5rzfF1Xim2pcc/YojdstZBrVcuDH9NZ7T+unDAAQgreK7H0aeHLBIfauGyw/6rJ1viIyTgp8b/y5m5YxZsoiP+D782TExubutdOit7g2aj7qwEji9U3RMaltrtcaPJj3rNP6+maMfzc6AZbbzdZqMZDKy8u3oXmE365lz+sJkM9hevb6YKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cixtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vcl4Hb/xIPNiuLLKRpFX2zPcBOkD3NhqYwakqkM36EY=;
 b=c3Y0YDllJyAiR0fW6m7LhragUqcXE7qHQ9pmaHptuM6hagwPozf2+wegGqYBhWFLTXMewPzISLP4ymQDhl3GDKS/ikI9NfXB6Kt36aKhzrrN8Ke2Sa7+266Wd/cbw/dfTvYZ9U/83RYhNg/cwb4nOiMKBHBiYEFWWfC72vnyHvDmA4ENx0UuvQe9YsohhnVhylsgu7zhUNscg/f5PhXQBDh2/1287Hh+r3Samt0iFvLY4ZaQRoxyFw9ImqXI+0H4h5Nj/Ls0F+FdJERLDUKSxrOVDzcUlhzEFrYhWeN4LxVJqNbzLEiZDmpejXDYQRYtXQ267WhA4SWPSN/A2YQidg==
Received: from SI2PR02CA0040.apcprd02.prod.outlook.com (2603:1096:4:196::6) by
 TYUPR06MB6026.apcprd06.prod.outlook.com (2603:1096:400:350::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.8; Thu, 20 Feb
 2025 08:40:22 +0000
Received: from SG1PEPF000082E1.apcprd02.prod.outlook.com
 (2603:1096:4:196:cafe::f8) by SI2PR02CA0040.outlook.office365.com
 (2603:1096:4:196::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.15 via Frontend Transport; Thu,
 20 Feb 2025 08:40:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E1.mail.protection.outlook.com (10.167.240.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.11 via Frontend Transport; Thu, 20 Feb 2025 08:40:21 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 63F3D41C0A01;
	Thu, 20 Feb 2025 16:40:20 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH 0/6] arm64: Introduce CIX P1 (SKY1) SoC
Date: Thu, 20 Feb 2025 16:40:14 +0800
Message-Id: <20250220084020.628704-1-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E1:EE_|TYUPR06MB6026:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3b53ebc6-9df5-460d-4cf1-08dd518a3630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bMQlp8h/OiWAxID30lkpx9KQtAzSc6pyanrsBJjmAAqyVBi2HEyp1QHZi6H/?=
 =?us-ascii?Q?qPe+cP51xnbpC3cHHEQ+Bu+ONU+RnDgqrA5s+RUOhcyiKKMtIXBPzbpnOwU3?=
 =?us-ascii?Q?IXx/LiR8sbMXIzCxGPSITrtJ8glJW0M7HsRiNKwNahmLMyLNk53KwvJQFky0?=
 =?us-ascii?Q?YbnzdhQP+/bXyH4bieerS6+5+xmAhJqbWvzmkF0tMphSDeBaaJN973ZhQB/P?=
 =?us-ascii?Q?7wAnNdCkIKt5j9j28Egqhbuwcn58Q3XpowokXdLKZ0jBHUyccOwbgZgBjPO0?=
 =?us-ascii?Q?O35rcp5cRDinqI82mM/Pov7SRNDnVUmBfm9zkRrbtILirNx2iJSvTdv2UaFD?=
 =?us-ascii?Q?IDWU34RB/Ptjp0TRgfav3r9LIKDEizS5u6hIRaNp7NYiePNbQUTMKElPEB+p?=
 =?us-ascii?Q?j8zPMIEVS0Fw5pPeV5uQgKob51wbVI1j5Cj/SEwuTbOrm80pxxlrbDxCpsPs?=
 =?us-ascii?Q?b3MdXfD1ma8TZBxkCOJ8c0AY+Qh30D+PUm8G2ml0oAO7sSL8b32PYTCnJad8?=
 =?us-ascii?Q?GP0AfTjtGYsq5f6TFkEmkQ0i5n1r6jEYjckcEaHJkluozHMb/1/RCxvnkFER?=
 =?us-ascii?Q?JdDkOU7go/3OfG4RoS0vqlFA3Z+kASIi8NtCRCnZC3d3dRsxplF6J3h4LKnW?=
 =?us-ascii?Q?jW5/hx3TXtYlkdGnuLT2XfGJeRO0Rv4ZjBDhWu/Pd1JLOxBsEmdeGSWzXwTB?=
 =?us-ascii?Q?2a+x6M5x9e9X6XGBZzHCu+1ldofujzLG2SartyaHdxnZ9CqQzKSsszAaYwOV?=
 =?us-ascii?Q?53zdLKeLcNugc97L7oMmm3I2eP3mfIMCv+ADX35FMMmMqj9mLAUMM+bjW+Dd?=
 =?us-ascii?Q?hNg9njzKJvY8IWbMIEsKtDFkYLUCFfxDRs+PDcwgMtQkDNpfCnMBYAzxzeUI?=
 =?us-ascii?Q?x0ufs/Lyq+sBL900VoK6bMeFZHcv9LU/hIYHWJE1+g4p4jpJNy0aYpSnVgVM?=
 =?us-ascii?Q?OawWTsu+uQi4+S+LlKW4NhB9lUYdj2J2RclR0+YD0nACCbegD1wS7y8fYVsd?=
 =?us-ascii?Q?9mcYHRiAqRIQnDxBX28fJlCtUkEQfxaSeS3wtxTVl2YzOFxc+yORdKqh3DKi?=
 =?us-ascii?Q?WTljFjFBYcQDUbC6shXZAO89SYa5nZXy2ZKHDJihxQ0JU8VCtV6cIgwQkQNJ?=
 =?us-ascii?Q?/j/Guq8jReMP7MtdLB4Bx3krLqGoaOFk7TzshW+2rpA2YHuKw6ulPAauKLDE?=
 =?us-ascii?Q?22jqyuSj6EWs/LerAPY/LG7Wu2mU/kYzqGyK3YoeUVGIXCYpvv3FZfVojoyV?=
 =?us-ascii?Q?TYBrEziX2m3kvPncFgK4bKfFoenuttAk8ILvnUDqzcTdoFx/9BUWR6VLb4Ng?=
 =?us-ascii?Q?oxWNlH4KDYopEu0/vpj5xjbzWFNNSCew+Jp1oFPmu6KJgmkI1wKSMWS1EKVI?=
 =?us-ascii?Q?K5mNUgzFEQ5iP3cOAHhJFhfn/xvovskF1qL1yAogAirNkYffjDvHfy/PKk0+?=
 =?us-ascii?Q?MoPzgvKOhq4=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 08:40:21.1231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b53ebc6-9df5-460d-4cf1-08dd518a3630
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_004041_250329_898B6276 
X-CRM114-Status: UNSURE (   9.41  )
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

Cixtech P1 (internal name sky1) is high performance generic Armv9 SoC.
Orion O6 is the world's first open source Arm V9 Motherboard built by
Radxa. You could find brief introduction for SoC and related boards at:
https://radxa.com/products/orion/o6#overview

In this series, we add initial SoC and board support for Kernel building.
Patch 1-2: Add dt-binding doc for CIX and its sky1 SoC
Patch 3: add related maintainter entry
Patch 4-5: add Arm64 build support
Patch 6: add initial dts support for SoC and Orion O6 board

To run upstream kernel at Orion O6 board, you need to use BIOS
released by Radxa:
https://docs.radxa.com/en/orion/o6/bios/install-bios

Fugang Duan (1):
  arm64: Kconfig: add ARCH_CIX for cix silicons

Peter Chen (5):
  dt-bindings: arm: add CIX P1 (SKY1) SoC
  dt-bindings: vendor-prefixes: Add CIX Technology Group Co., Ltd.
  MAINTAINERS: Add CIX SoC maintainer entry
  arm64: defconfig: Enable CIX SoC
  arm64: dts: cix: add initial CIX P1(SKY1) dts support

 .../devicetree/bindings/arm/cix.yaml          |  26 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   8 +
 arch/arm64/Kconfig.platforms                  |   6 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/cix/Makefile              |   2 +
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |  21 ++
 arch/arm64/boot/dts/cix/sky1.dtsi             | 264 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 9 files changed, 331 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cix.yaml
 create mode 100644 arch/arm64/boot/dts/cix/Makefile
 create mode 100644 arch/arm64/boot/dts/cix/sky1-orion-o6.dts
 create mode 100644 arch/arm64/boot/dts/cix/sky1.dtsi

-- 
2.25.1


