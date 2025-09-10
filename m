Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605B3CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 04:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iv3t8qmzbDydYifsD/57ErrI25TQdHA3hw8wwHIlhmw=; b=oR1Ezj30WLidqUU1a+f+hBwuy+
	bO1EKX4RVG8uu1sN9EDzpQMNDW3PkHUO1W1h9m4PtJMBqft1ojm8fIMPVdwPaDzXgux2pjzMAVnZa
	IO738xRdQz4d2nLrrtDAoPc5PDuhCGRJIZrEEiVoXbCfM7VfULM2nsb01iC9nQPOWR3LiJ08822cq
	gjaB+r8ygmXW8jWOXGhsGjMtRVxuMR061aJAF4Tvm5wUzyhkBHU/sl4OdFs59nbMBg5PXQtltX3Vn
	iAgPQ/pPqDKSIMZmQuprpRK/iwhkv7a/QIObuXVgjddtIUQT//Kn5+pP9UREx65C5+JIh3RvlMMAc
	80/xZGNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwC6G-0000000Bsgf-3vnx;
	Wed, 10 Sep 2025 04:06:28 +0000
Received: from mail-co1nam11on2060a.outbound.protection.outlook.com ([2a01:111:f403:2416::60a] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwC6D-0000000Bsf3-1aEE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 04:06:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHn7SCY0gONDdqxETp6t9Bf74LHc3Jbjtz2kdFZQu9PHzRA9YsVNT+Cn+5I75Yg2v4+sHbI53aeN9E7UVb+6nNwjIhFrxJefoFJQqDG1EQSAFEnTw0M24MopfUbLOwkq811QTtr0E650P4u3CuNb92VsKWXiprBN3FZ8urWjwdqWhD4VEXIqzSQkDWc+qvMm8BRM5tc5AOzYv/GC78gAMgzEDpbdz41Vt/+2G3Bhdg4mui6CjXxTNmEYufed4noe6f10UgaALklp+5bGKI+TP+ecxjv8W7adXlWI/YKsFiYgtflyPNZX2S47T0vL0yA8BexVC8e3sY2GsZ3R9gwxfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iv3t8qmzbDydYifsD/57ErrI25TQdHA3hw8wwHIlhmw=;
 b=aLfJXhV2Wp51hMCJL8YlVNgD4nJ0f261f/b3Iim17eBUbgihIvBuu2Dm7jHjsuVCdnzyVsswhpc6RvLb3J7DyhgFbGCf/lWSQ1wMqHh1XANB3nQwxSK8RK+KwxvrokVffVezHrmgm8n9R2PYOVo23jmFYZ4U553mIn+a7EfftCqOpfpWEJo9M8UMrBltdPiAk/GUdsXNIMKcBEeNUGTDjZEKdZzhycJvfD4ihJDTNSW3Cab8OCOxsJew2K0ZPKN78SChBOTowVwOo7GCDSMwayJL9CwSJ/hJxKRqEAJa8cD9iszD5tk/ARetnDgfm53AqGjZr4GMLFGNjMo6YC5cpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iv3t8qmzbDydYifsD/57ErrI25TQdHA3hw8wwHIlhmw=;
 b=KKNp0tI5D8IyVFHiHbnWByMXJ5hgchRDodMR1lOuLAnQTlRBBun/n0jHBhHBMZFD6YEGuIZLKZUAdcjKi7lCpvHFXRQAQSpIttVMJ+QgP1eExXvJFoIBt1+8Ls+8oUcRyZdSfT08Osq9F22buyEEcKIjZIHlxH5BScMGH8r3V9X6UzmhkwnGOEOhuMjGWry2HRSs9E8CuX9WPXyQzH2bJYlyU7c04mqdw+H4P0pxGU//UXLZS8NJ8vXgPWDgm6PWNY5LF64hVWfT929MGi389nREaqQCoEqJ+RPNMWYSXCGpBNEezskLkmc/4YJJkjhSJ7Q0Tk/mR/f+GIQCDXZmfg==
Received: from BL1PR13CA0150.namprd13.prod.outlook.com (2603:10b6:208:2bb::35)
 by SJ2PR12MB8011.namprd12.prod.outlook.com (2603:10b6:a03:4c8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 04:06:15 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:208:2bb:cafe::58) by BL1PR13CA0150.outlook.office365.com
 (2603:10b6:208:2bb::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.14 via Frontend Transport; Wed,
 10 Sep 2025 04:05:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 04:06:15 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 9 Sep
 2025 21:06:04 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 9 Sep 2025 21:06:03 -0700
Received: from dondevbox.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 9 Sep 2025 21:06:03 -0700
From: Donald Shannon <donalds@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<donalds@nvidia.com>
CC: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <etanous@nvidia.com>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: aspeed: Add NVIDIA VR144NVL board
Date: Tue, 9 Sep 2025 21:06:00 -0700
Message-ID: <20250910040601.240162-2-donalds@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910040601.240162-1-donalds@nvidia.com>
References: <20250910040601.240162-1-donalds@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|SJ2PR12MB8011:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e005572-d512-4569-7874-08ddf01f6307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|82310400026|376014|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?psrLj6TftxBhYidr5IX3NsNEQ9vr0R1a3ifQUU4pvAMVUVrT3Hgbs6wdXfzQ?=
 =?us-ascii?Q?7imw7lcNdOocHfA2uW9jERrqjzoEMjvhmTVPFSWrb4sdPqcrHUTYiN2ub9rw?=
 =?us-ascii?Q?O+P/InBtAfRolnrD1tp9+3Fle30Im5bmGNVqbfYgIqHJwrE0FGfsqqoNDz9U?=
 =?us-ascii?Q?tHvp+sZ+bkM/ENNiUkOaqacNTduSfsdYYohmA2eWIjgM3urz2P6cJPNbK45n?=
 =?us-ascii?Q?sEdimDvYyUpVQ1fT2EyFFfclNKXm/+xQBe9PXvnjj7jSEzbtn8lDP8gz4nGX?=
 =?us-ascii?Q?xggQjF4UJeyPau9VBcygyVd16eSsvJ29nRWQhITBvokCYmFuXwWrr3gExaa4?=
 =?us-ascii?Q?ODRNJ1WrdU6hEFDgXbETw6EcHFBA5ZyHK9fb8Psob5SvC/rSaU/cXcB3surQ?=
 =?us-ascii?Q?s+QJo1B7F08ziYkIp+uxuNaTYq1qaZ9QCGcl2m18Wr52lFURF8zmclHAtMz4?=
 =?us-ascii?Q?fmCCIraOTsTdy3eMRIUqg2pCzQLkSyQ6VMFHmCkI7PS+2om16FTRhFOwMufW?=
 =?us-ascii?Q?5wrdWCWj4E/x1G+STMoXHyUkQPPgSEZRzkpb9z0fexBZhz01BsyNmrb5+s7c?=
 =?us-ascii?Q?KmwsYAt8oPG7V4huoQqI6fBZlCzMIvOno/cEXU49P/2dVq4wVcrwUqtLzEmn?=
 =?us-ascii?Q?heRbeASiwgDvaKrXGD2bz0S/uqM4HA5B3eUfOu55suGWXQORHxZTvcOxb0sZ?=
 =?us-ascii?Q?QmBQFH/7zIH1Voxx7HAc/0JcP/e0Fwq/v0tuswAexeMATKvpCyBpRX4svR12?=
 =?us-ascii?Q?gH0Zwrq10SREl/JtcnDZdxhcy2XeVx62pD8kRbzi4bQo/m+R3pqSepqphE5+?=
 =?us-ascii?Q?7huExIQIjYotnXR8jhng/6Lu5jP/MsHU8NHbS1g4QDuTVZWY2AC73Wbq9cWt?=
 =?us-ascii?Q?ofcqghWCa2VYrj0NoW3SdJFWaJwWm6pcqr8vhMfa6McPL88b2HwlOZa2eW53?=
 =?us-ascii?Q?QEIJ/kFHGZE0s196rXgwxI4BhIZOaRuIs1LslxllwG6EmXNLTXBvtyzysxTg?=
 =?us-ascii?Q?FdfBZ/RqHhbaHqfQbWAcuiAD72dL0qsnedh2dSo9Gmvd8/Am3yWBuy58+sYH?=
 =?us-ascii?Q?6uTTwSbcFB8rxWLq5MPNrtGXBN/0xuvAnyl0r8PZoWQO5ZMUAGuxrL3tB5jr?=
 =?us-ascii?Q?QOYFSTv9MPz1v52BD4ozCRwZqUOx4L+L5O3kk+gZzaJHoYuUYyXeEAAI+YzE?=
 =?us-ascii?Q?H9kmNJnuCn+UCEz8RckFjET5g8MJPyAwM77P0nr5E5b7W3WJXrkFgD/T17wq?=
 =?us-ascii?Q?/VKxTKqTe0k7pF2HdNFz1ezxKEubnyK8okE9JrL4p2KA6PMgr00LEX8wAwvJ?=
 =?us-ascii?Q?Wq8X2CJsSGusLlCeekP2CVdDszCqCu9ahBUgKMTODTEP01/pbcE2nhHQT+aa?=
 =?us-ascii?Q?tXimhPC3e8EhYeHDLA0G0VVb1cFkGINyuR6iYEJtf90shUmM++1fKijJQnoP?=
 =?us-ascii?Q?IqYfugwxFpMTsi+FpxjYo/mJC2FogpiZgGDHtPzjAUC25q+fnwoVA4jDPUoj?=
 =?us-ascii?Q?71Z8xzq1mSpSRqX1tMdvmWxBvyPB5hpEq8/p?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 04:06:15.0850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e005572-d512-4569-7874-08ddf01f6307
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_210625_415641_15FBCF49 
X-CRM114-Status: UNSURE (   7.67  )
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

This is an Aspeed AST2600 based BMC board for the NVIDIA VR144NVL
platform.

Reference to Ast2600 SOC [1].
Reference to DC-SCM Spec [2].

Link: https://www.aspeedtech.com/server_ast2600/ [1]
Link: https://www.opencompute.org/w/index.php?title=Server/MHS/DC-SCM-Specs-and-Designs [2]

Signed-off-by: Donald Shannon <donalds@nvidia.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes v1 -> v2:
  - Received Acked-by from Conor Dooley
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index b3c9d3310d57..11e17e9ef15f 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -103,6 +103,7 @@ properties:
               - inventec,transformer-bmc
               - jabil,rbp-bmc
               - nvidia,gb200nvl-bmc
+              - nvidia,vr144nvl-bmc
               - qcom,dc-scm-v1-bmc
               - quanta,s6q-bmc
               - ufispace,ncplite-bmc
-- 
2.43.0


