Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92917CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YUTVL7AE4qSr+7IvirfAuhJ5RUJHi9s/1HzjJV5+qIQ=; b=zHmEompIe20yo1O9AakQIpojPH
	aIwvIEX1pdlZnGyObJdgfwpMTdNEeIckvD1sTv9H6u3dwE4MujqjjSzFBSOLc4USMQhL4u9pCdb7w
	FadGRqMIhQ7Sxh6Xo9oIZ8mkV+lL51eZGUzgs1Clhj6upgdGNCeBMgpYerrAoFUqKoz0niC0/hvhy
	3Yd50lyf0+n3JoaQ7Up8yo5aCJ53xnCiFsapSbpWijdaybnuB3XePegeUiTN07MgSmf4ahMwUL22N
	8R6x1CTlDqI3Gfb8NPo8cRvpuuMpsAu0y1TgMYya116BZzJJ7NZdg+01xmHI8581R8X0a/PD6GJMw
	ause/L/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxx9-00000007V6H-17Lk;
	Fri, 29 May 2026 14:12:47 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxx6-00000007V5G-2RAE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:12:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZ62i86T/MJdWnA5Z6e0sH74PiL1gMtN4NjCgsVXV3OZuXy8HzViwQNk7tK4wyMUOwkcmdCcPaRBdMYMk24tPcdHf8aI1Z0OV2TBjjOeotkcSVuc6VfHN5gzk5gBgrV8RM5PR4qnSp8mJ8Qqa0/8IqmitgByQL9J0UONmvvp+UWSwk9pjysd1iwbxL48r7Qjr2Qe0xivbMDZ/m/+oV3P2BG1CAC2KIGnZ1e4ZPg8Yg27l1XKzhewrWadWcoAUNcCaxgd0cEeuYO26aO8IyHAL1UOmV9hQ8z0PT35u52PNYVn1Naoa5dli3KZvuG0N9Yp7/QN4khGuBxsZr/MfbLjUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUTVL7AE4qSr+7IvirfAuhJ5RUJHi9s/1HzjJV5+qIQ=;
 b=oiYmKpIHCg/v4Hi5gLaR7bln8/Kg4vfBpmkc0mf+OZXxpDnnUyiklfjJtgyqFQ2LdNeriVbYDvc8WFATMt6CBgfIxyHVTVaR33rnXdeJJ40SUC9UNi+9QURvBtA0fvwU1h+qarOXmgBQrQWnBcfORYTDncjkGbX4JO8JzJ+swPQmAjCmfkJmRsCBTA1zN2yZxIoJZwKsJ5QsHXRcuKez44g/g3TVjnBO4F54FTxjf80bKkuC0wIHc3XRl2fbi7E3Owq39Je/gdZ/tmHZyUYQ7S8aJ+xJJwh9Iij1JfDuDKTtXfsF+0VMma9TLPjEY7sqlcVyfiPh9Kloc3temrn6aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUTVL7AE4qSr+7IvirfAuhJ5RUJHi9s/1HzjJV5+qIQ=;
 b=maUcLK0X/naKDzgmMqaVNH/aaAbY+dO844HQGXahZesDf2ae7D+57TXFywmK9jVI0twb/IGuRBlDkUqonEVKW/Yec8jncmhcDigFqnBC4YxMP0O0Bq0Yg302IoaLMfbzoc5qXvElFORvNIhf4K5jDvhI31c/oQOX0HCrOIAy//w=
Received: from SJ0PR13CA0030.namprd13.prod.outlook.com (2603:10b6:a03:2c0::35)
 by SJ0PR12MB5675.namprd12.prod.outlook.com (2603:10b6:a03:42d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 14:12:34 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::5a) by SJ0PR13CA0030.outlook.office365.com
 (2603:10b6:a03:2c0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via Frontend Transport; Fri, 29
 May 2026 14:12:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 14:12:34 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 29 May
 2026 09:12:29 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 29 May
 2026 09:12:28 -0500
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Fri, 29 May 2026 09:12:27 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Rob
 Herring" <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/ZYNQ ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>, "open list:COMMON CLK FRAMEWORK"
	<linux-clk@vger.kernel.org>
Subject: [PATCH v2 0/3] clock: versal-clk: Fix Versal NET clock binding and switch to CCF
Date: Fri, 29 May 2026 16:12:06 +0200
Message-ID: <cover.1780063921.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2580; i=michal.simek@amd.com; h=from:subject:message-id; bh=OMhPUSE6Fq5eG5fh9qZ1Lx1rxipiHUC9CbwJ2wETyPc=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWRJzjuybPUlsY9WjQa3y786XKnQv7Tw2Jrd24Iedl7Y0 PWntP5/TEcpC4MYB4OsmCLLdCYdhzXfri0VWx6ZDzOHlQlkCAMXpwBM5EMWwz/VfaLzZDLjPkae tHrDdD7R9G3lBOl/erIrNt7py2Plvv+NkeGKgf6WidK2WjfrdgQHTN9cui5MUkvrzqoki7wlgvv kHbgB
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|SJ0PR12MB5675:EE_
X-MS-Office365-Filtering-Correlation-Id: eda3bf81-575f-49c0-9c08-08debd8c5497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|36860700016|82310400026|18002099003|3023799007|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: mQQ+n8ajXG9YVc2UGRKDo1hrQLLHo0OJRI23Fjk4ocG20ty0xgiG/ApJyJlH8IT1KzK6Z0vjoe22ygrtqH0ZcjR+G9WsVKOKJDEe10eTPHlLPhUK72LOQLHNpHCvxzn8HyXVxPL4sHnIwBVKDLjsSaQqy2IOBQlC0xvP8Ep8Q/W5KN4Y1ey+Mh+YOHInWrxPiDB68RaVYEfkkQjN2fOWmWMJdgxwjVgQApzQCoDSSN68WXcCeqEvRJyX9Xz1PfxDUcvCnbWtoerb6RjGvfCqJO6PdazWtxtmJXGRCuRRkPWwZwSvwr57N9yTG03FUD1g8YtEfHv2urnv6aq8HnwKqRdaWka4MgU4oA9r768ZV3lB70vYOxPTzMPxTPiDHYEzUUeCCYArvSUdyKsSGH8ZLi3rlDzwB6pu6BtNPdQeBMelE2Zin0YHtCK24OOTPIEkZG+R8ytVS94lDxTiPdh6WAucOxaOQ6QO1UPJS5Xi1kOcIVtWBvfOvPNLBvDb1CcaTTHDJttx4SouTfH23Yt0tc+gG0m/q52J0RUelXAqOSci2SO2eB1sWgNrKLWGI4kxwJDPu3EaBfrT1qSTv4DA3TzaGE2mK+d1BNZNsg/rZIlDhWXCHznc+zoIwsKkGgRUey8NT/JHPHUqxXfhxVgamDKRCtVvG9UnPRMLxrh8fssP+dxizHnkU/X2svhY8R2o4uRUA7RIdnqOrlY1jdZjqCBmX3xLpFGcSVrWANMzzW8=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(82310400026)(18002099003)(3023799007)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EJnQL8mc5RIZUGABZXEWfATsl/aasaLx4vo43cnSputI3DUg61zGYq46lnuf6E6r+4V1NIz5Piy6S8UO/lV24by/zpWKG8e5GV8xG7jniP5MSvPZC+kXfVeFEfyokn2QMR3dpfPAkJSwHMmDa8yRQWlaGzAYX23CWSoowjaOHCtMy9Dsxy4za1SiMUq1wh3jM6cInuMQoh30OgoNX5HUZeXkMjOuexJL+E2aYUUXw1HMi6NQX0buNjkkm8oCRSefUYJJsDUUyqDY2usM1YvJIUKGxDeJayfVUCkofBSqcsmQb1RAJ9TxnjEzRaMXWOE7Ee1nrQMYrEq0lEwmOcJ7GqOVsfemY3xIdsjMG2pzj2fvWU+kTpyNt++gKgKrgLnhL2afw4AkMqVFKfTofanVhUIfXA0mI0qGuGzK37f99pAofjW70Kp9z/pEBjJTVEI2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 14:12:34.4258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eda3bf81-575f-49c0-9c08-08debd8c5497
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5675
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_071244_620153_D4863D42 
X-CRM114-Status: GOOD (  13.31  )
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

This series fixes the Versal NET clock controller DT binding validation
and switches the platform to use the firmware-based CCF clock interface.

Patch 1 extracts zynqmp to own DT binding file.

Patch 2 restructures the if/then conditions in the versal-clk binding
schema so that xlnx,versal-net-clk is matched first before falling back
to xlnx,versal-clk. This fixes false "too long" validation errors caused
by both conditions matching simultaneously when the fallback compatible
is present. A dedicated example for the Versal NET 3-clock configuration
is added and all examples are split into separate blocks for independent
validation.

Patch 3 switches Versal NET from static fixed-clock definitions to the
firmware-based clock interface, enabling proper clock management
through platform firmware. DT macro headers for clocks, power domains
and resets are added.

Thanks,
Michal

Changes in v2:
- New patch in series
- Split zynqmp-clk from versal-clk
- Update logic without ZynqMP part in this file and have if/else only
  around min/maxItems
- use clock-<HZ> node name for fixed clocks
- Reuse existing versal-net-clk.dtsi file

Michal Simek (3):
  dt-bindings: clock: Move xlnx,zynqmp-clk to its own schema
  dt-bindings: clock: versal-clk: Fix Versal NET clock validation
  arm64: zynqmp: Switch Versal NET to firmware clock interface

 .../bindings/clock/xlnx,versal-clk.yaml       |  87 +----
 .../bindings/clock/xlnx,zynqmp-clk.yaml       |  68 ++++
 .../arm64/boot/dts/xilinx/versal-net-clk.dtsi | 345 +++++++++++++-----
 arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h  | 123 +++++++
 .../boot/dts/xilinx/xlnx-versal-net-clk.h     |  78 ++++
 .../boot/dts/xilinx/xlnx-versal-net-power.h   |  38 ++
 .../boot/dts/xilinx/xlnx-versal-net-resets.h  |  53 +++
 .../arm64/boot/dts/xilinx/xlnx-versal-power.h |  54 +++
 .../boot/dts/xilinx/xlnx-versal-resets.h      | 105 ++++++
 9 files changed, 783 insertions(+), 168 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-clk.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-power.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-resets.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-power.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h

-- 
2.43.0

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
branch: xnext/versal-net

