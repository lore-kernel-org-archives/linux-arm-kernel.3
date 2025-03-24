Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DA4C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 06:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9RFRBn2VnpgFWXHuXsbCQsU5gbzEpsmVDcCbQ4hBQ3Q=; b=mbcg+kO02cP1YNd/juVct5JMhL
	oS3PNBcqRTYbZ4L+T7WOG3ON1H4/QKRBYGGooY0pBtL5hte+jmSCRKx8Br3TTih1og5Tz3Ikk2DjJ
	IplLLMhP41ETWURvALdlMxUlt5u3XCcgtT+crMw7PseFYgpvIAjFEnq7Jo6avZI5ks6TqIFmhWRiV
	s0jHBEjKvSv9Pvkj/ejNejRgmRCWnj4LveZE8P+zue5cq37doVPEzZ9CH6Ia8tXTsWtXvGCkNWTpv
	QKmhNcVTlRB/X8LUtcuFHTEKh9ozCzQaUaNueU7oD4fcu2X4m/XVlrDohjYMKQrihKtoNB8kIbxIK
	xGEcckig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twbI7-00000002K1p-1eEF;
	Mon, 24 Mar 2025 06:28:07 +0000
Received: from mail-tyzapc01on2072c.outbound.protection.outlook.com ([2a01:111:f403:2011::72c] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twbEd-00000002JOQ-3OW6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 06:24:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oBgkaHzL4/TzlblDh/O/+Ps7hHyZDI7BwZqCSPvBsrOtoA0r43uGifhupb2D846jYMkKxrE7GtE9F+Lwp4JTevfSghndFqd66SYnUmReyDQrvICOUk9dGq50qtXe9TdVCMT2o6fCLL3CN/8G6cTVJNO1ag2BXwqnJRUIrM+cakgqBTLVgE0RbbsYKDW7h8jddvNlSZWiNUcaS01F49lftZvUOV0B8T73HCyUZBVkMRyNrUBPfNz8uWFhSBZ8Z0+0Kvsp1izto8+5QZ9KP1t5jjXehlO1rt2U+3oGZNVotnJMGOe+RbFhrab7P+klubT9NPpaZiTkvFto/TG5Sy95lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RFRBn2VnpgFWXHuXsbCQsU5gbzEpsmVDcCbQ4hBQ3Q=;
 b=ousC33mGyexid8o2ZOjRxPlolVJmxBXVAWPEw9wWJicXjZBgkRxeVgzvr8z8UUFv2mgFi2uqFUKI2LqaaZvgZYwngnTu59AxTxoJvPjamFu3iNJfyqr5Nep37y6nxjChmHdQSA1bX/JvzHkRTdoKi3W/XmedBM6PNzxExTxmcXJnTukeTe85o6XPqes3+IB0/PjqDrywFDn04RyVQvV/BpzsoXPiK+njX3yxToBuZXk6FgViTYQpQOds5HBaiJ58yipH/Lqp+s4PiZZzERjpJB+GSHSfej/K6gg2tW5Whim4UzjvUH/2ad9CLgPRRfsTE72y59B2Ci7NDW4KxCLbPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0069.apcprd01.prod.exchangelabs.com
 (2603:1096:300:57::33) by SEZPR06MB5666.apcprd06.prod.outlook.com
 (2603:1096:101:a9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 06:24:22 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:300:57:cafe::49) by PS2PR01CA0069.outlook.office365.com
 (2603:1096:300:57::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.40 via Frontend Transport; Mon,
 24 Mar 2025 06:24:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Mon, 24 Mar 2025 06:24:21 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 87FB94160CA0;
	Mon, 24 Mar 2025 14:24:20 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: soc@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	marcin@juszkiewicz.com.pl,
	maz@kernel.org,
	kajetan.puchalski@arm.com,
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH v5 0/6] arm64: Introduce CIX P1 (SKY1) SoC
Date: Mon, 24 Mar 2025 14:24:14 +0800
Message-Id: <20250324062420.360289-1-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|SEZPR06MB5666:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0a31bb33-98e9-4c92-2986-08dd6a9c83fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HgndCy0VHb+4Y+MjC7sjYpcJQuDW0OmyJYu5K4Oqi47Wj6Zo2sBx1Cg0HA/C?=
 =?us-ascii?Q?pZFIzPC+wk/U3FGyzkIAo7k56iB6qoSRJ8wb5pxg0x38WrlJslntP8gGi90A?=
 =?us-ascii?Q?phql4IEYxlk/u0ehldtL0pXutv7swHVwC3KHYa9KlxbGDGVSmP7tCWT/P5fL?=
 =?us-ascii?Q?nZA2CCzCzeTDnMxMgCSk6f9TCLjEoF3712guJ/Xe/BeWMFfZiVFS8DVO8jPh?=
 =?us-ascii?Q?wMM/0QBFc1zjrhdJ62XPgJp9X8CTtEhGA6hqNJn4bLkKniSLlxjCIOLvhTyZ?=
 =?us-ascii?Q?CBIjv/YKGEPEqVw9emxu+v4JeoNwaiK19fCv6v+0YPjrgTYTL2/8kQphKVnH?=
 =?us-ascii?Q?bA8hmdyCiyD+h8Bzquwjyhwq75MchzIClCXtCvF0i9qCLn9Z8rhPQUC6bIOy?=
 =?us-ascii?Q?K1cWi++3BM+6Y0cgkV0PQ/EL1qoXpF5GAAmfZPucrx4Wyhii1+lvRvO1qJkt?=
 =?us-ascii?Q?5jaAHIg4hbUlJUq/NJ4KsGG1jMQsqJ+NW+UC4Wn7SQ1GwHEHCMjyrZJcQMiq?=
 =?us-ascii?Q?Q4FPJ3153lGFJiQNghpZ5rKY6SnK8J7KKUvm9gP7uj6GQ0aLQ4QgMUr0I3UZ?=
 =?us-ascii?Q?xb368rkb7jib5ygjcidqO5icWFtxzmKRrBad+k6F5SBM8hJa80D9aX/I8+dA?=
 =?us-ascii?Q?oX8uoglNeGEP5J98avjCaABrgahQcjT7Xa30LXIkjb91DCnwa/Xnx6MjbGWk?=
 =?us-ascii?Q?nJaemB6cVcn7yo35OaQF3KqfE1myvJnVJ9rVJiNAHY80uE7jUIfA7oSAJ1mA?=
 =?us-ascii?Q?+oYBa4kjFqcd+PXz+jyHTPrep0NLQb7H0+NyRp4USMYehBuIAuxDHb9gmNiA?=
 =?us-ascii?Q?mVp1G6Fn1tLE0eain+Gon1MI/GNenD/x+ta68Aun43DrkH7GZCBAAbF8MU3r?=
 =?us-ascii?Q?DvM+0P81D6Ulh/gCbTho1FvQZWxjaD9w3Eqi5g2UMdN4CLktoF5am6Tj+CjZ?=
 =?us-ascii?Q?EOLGwl4IfjV4mrNy5/c2+qkQycjD70zkbIDeTAo0+afQ3JTkMQ4zUEpx/s2a?=
 =?us-ascii?Q?IfUVD7AzoDd0tJ0JcITYIR+pWTMxJpdDLFdNKFY2SeqogSJ6kx+G1YWKeJdn?=
 =?us-ascii?Q?TCp/0yLs4WiUSOwqNFm4u2VSQ8KliO5VXhCHhfYyHRiNXh85Xgts9r3ofbQG?=
 =?us-ascii?Q?VKciFF6QBCcy+NLPNI5qXLAUckZp9y/As4q9EYdCtTQqF5x4wMGxclOJWsxq?=
 =?us-ascii?Q?IuRwvF7a9l8B9BuhcWDtkk17/gq/iXpt0eTUnY02XcGp0OjfEDEQU/P2Pbeg?=
 =?us-ascii?Q?sRPvBLthJiUa8kyZo19x6HN+4Ob+Tu/Vcx8KXR6sdUQ1rNGO3hvdlX/BtyVd?=
 =?us-ascii?Q?AEU8nXjYfV2KvnkKeODYFlpAheGSVYqbnvbi+W7oTs+OKPOHmxj5NEGft0lO?=
 =?us-ascii?Q?CEgqe0S8MioQ85clGV7B+KWXdSvMS0GcKYIO/KViNmOg5D8zTNUUYJ882auo?=
 =?us-ascii?Q?fFfSpUVhY86q9GbXejIkn2DxB29C+/jO?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 06:24:21.6049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a31bb33-98e9-4c92-2986-08dd6a9c83fe
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5666
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_232431_845846_BB4887CD 
X-CRM114-Status: GOOD (  13.91  )
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
Patch 1-2: add dt-binding doc for CIX and its sky1 SoC
Patch 3-4: add Arm64 build support
Patch 5: add initial dts support for SoC and Orion O6 board
Patch 6: add MAINTAINERS entry

To run upstream kernel at Orion O6 board, you need to use BIOS
released by Radxa:
https://docs.radxa.com/en/orion/o6/bios/install-bios

Changes for v5:
- Patch 5: Delete pmu-spe node which need to refine, and add it in future
- Patch 6: Refine MAINTAINERS for all CIX SoC and adding code tree location

Changes for v4:
- Move add MAINTAINERS entry patch to the last, and add two dts files entry in it. 
- Add three Krzysztof Kozlowski's Reviewed-by Tags
- For sky1.dtsi, makes below changes:
	- Add ppi-partition entry for gic-v3 node, and let pmu-a520 and pmu-a720's interrupt entry
	get its handle
	- Remove gic-v3's #redistributor-regions and redistributor-stride properties
	- Change gic-v3's #interrupt-cells as 4, and change all interrupt specifiers accordingly
	- Remove "arm,no-tick-in-suspend" for timer due to global counter is at always-on power domain
	- Remove timer's clock frequency due to firmware has already set it

Changes for v3:
- Patch 1: Add Krzysztof Kozlowski's Acked-by Tag
- Patch 2: Add Krzysztof Kozlowski's Reviewed-by Tag
- Patch 6: Fix two dts coding sytle issues

Changes for v2:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=vendor-prefixes.yaml
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=arm/cix.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
- Re-order the patch set, and move vendor-perfixes to the 1st patch.
- Patch 4: Ordered Kconfig config entry by alpha-numerically
- Patch 5: Corrects the Ack tag's name
- Patch 6: see below.
1) Corrects the SoF tag's name
2) Fix several coding sytle issues
3) move linux,cma node to dts file
4) delete memory node, memory size is passed by firmware
5) delete uart2 node which will be added in future patches
6) Improve for pmu and cpu node to stands for more specific cpu model
7) Improve the timer node and add hypervisor virtual timer irq

Fugang Duan (1):
  arm64: Kconfig: add ARCH_CIX for cix silicons

Peter Chen (5):
  dt-bindings: vendor-prefixes: Add CIX Technology Group Co., Ltd.
  dt-bindings: arm: add CIX P1 (SKY1) SoC
  arm64: defconfig: Enable CIX SoC
  arm64: dts: cix: add initial CIX P1(SKY1) dts support
  MAINTAINERS: Add CIX SoC maintainer entry

 .../devicetree/bindings/arm/cix.yaml          |  26 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |  11 +
 arch/arm64/Kconfig.platforms                  |   6 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/cix/Makefile              |   2 +
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |  26 +++
 arch/arm64/boot/dts/cix/sky1.dtsi             | 217 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 9 files changed, 292 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cix.yaml
 create mode 100644 arch/arm64/boot/dts/cix/Makefile
 create mode 100644 arch/arm64/boot/dts/cix/sky1-orion-o6.dts
 create mode 100644 arch/arm64/boot/dts/cix/sky1.dtsi

-- 
2.25.1


