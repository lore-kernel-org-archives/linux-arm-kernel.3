Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E1EEE645B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 16:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=20jzS7aZT8r8hud6Je7w7twKng4p6paLgdoWi+mGDHo=; b=0nGMyYDzuFHLdKej4psjwyvEJt
	yglXyGFDJhu+9heljgzeb7W5BQHYQmSqDeUh0lW9RtbfsiNvY2Y/1auvgdePBCuc4n7WNLPKN66Yt
	xO3ttOK44JcYCU373y1PoN4XlNiRAzul8ETXISacgYtb/0ktqg92dxgV8cPNC6AxxssjYtweD7UOg
	raqBtR//CWypdbDtPeOqjg9qJZDUZm3ZDbxKkY2Jm4+6GywEnQxhHF6iYZHyjG3f46aSycX0WSmo7
	BK/KqHy4WGILq5imoTPtLCZ0PyUZIX2bz4BRVUYpLpTJlvKKEzBoLmDgZv1k1c3I/RhomOV606nJy
	Rd3MMcVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vazPu-000000069wU-04Wx;
	Wed, 31 Dec 2025 16:51:22 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vazPr-000000069w2-28Kh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 16:51:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5z7qx1vQp20E5G6hekJOEz/QIBE1lzOj90eeP7aG1IRuott6agOyvFLlMQ1QZofm3Rw2IyMXhJhbuGQmAfBcU3n4uGcQ/uIhAat81m571X10xBEvX3hJaP8LobJjzyGdF71eSNruVRwHiRFsdZS44nwsMn9NSSpY0ILdnjl1UcwCfRlWmt9jmc7ssabEOcl0EVUSCmlTffUq2h02zJZEUo9MQm2KO06ZSDxx4Itqnq0U3737tA/l9ef50/TINsLe2iWG89OBhHRqq3aXUaO2vBUmoLW36fhs/4/a+civ83BcMQlppZNeFO4n1tqB4P8jg1uM+pMAwBmv/OLTrBYcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20jzS7aZT8r8hud6Je7w7twKng4p6paLgdoWi+mGDHo=;
 b=nFjZ8IHi9tU344+9dV2otMppkZVNYrTtiuYdvtN24lOLkODc4GU1mG0cQ87iUQfrE7SnSJFRtfebkn4lZhICJKy/rKHGRP1qqK2SyIzczRlVXzddf3wQkqTAwnXT83ZI8frpewLs55er4NEbsA20qwivd6y/4uuP+5HSECvHWUUdeAm1NiDBDdx0ES+XwSmuc+xMxiyZDWRm+vab8A9Zbu72SzJ3sp90KNYoDFTRTqJwhpZImwJfFECJoUVdmh+SqrOJTjuicd7J1pOs3c+JcmuoRC6ztgR6Zr0rchdUzu+Lex48dvpNY4ga4pmpUvaTFT31jG1zIVo+ohe4ObnnxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20jzS7aZT8r8hud6Je7w7twKng4p6paLgdoWi+mGDHo=;
 b=XJ9v83ef5SQ1toRCyunc9LWkEwQeUkK+p7d81EYL5aFKHkBfna9ATxG2zBq/X4APOt6cw9RPA1goEkBfcrhq3eO2Ka6VMD+nb6RvxljbeMJ54dXZ0NXjx7brVemjxyX6PdhB6dZItDqZ7Z52E/o8FIG9vDP/fL9BiHLzqHwdDuM=
Received: from BLAPR05CA0041.namprd05.prod.outlook.com (2603:10b6:208:335::24)
 by MW4PR10MB6653.namprd10.prod.outlook.com (2603:10b6:303:22e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 16:51:14 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:335:cafe::6b) by BLAPR05CA0041.outlook.office365.com
 (2603:10b6:208:335::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 16:51:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Wed, 31 Dec 2025 16:51:12 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 31 Dec
 2025 10:51:08 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 31 Dec
 2025 10:51:07 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 31 Dec 2025 10:51:07 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BVGp3Zj2583331;
	Wed, 31 Dec 2025 10:51:04 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
	<kristo@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <b-padhi@ti.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 0/3] Add TI K3 HSM M4F nodes in device-tree
Date: Wed, 31 Dec 2025 22:20:59 +0530
Message-ID: <20251231165102.950644-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|MW4PR10MB6653:EE_
X-MS-Office365-Filtering-Correlation-Id: b9d0d0ba-bf4d-47b8-1576-08de488ccdf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lNog/m/6kAuYbMlSHuWj/bMVB8qv3Lz3100t+U+9zLgTF03S1G+oL1yb2oaj?=
 =?us-ascii?Q?UeZKt1ScQJjEIVbJIbzMZWYxffJjNJ4iyIVDg7Ka0updA4wvf9OnCIaKDJmv?=
 =?us-ascii?Q?kdpTocLNteBkpJ+zXLlGnx34uz5Y27UiLQYmTbmkTSTatygykhGMZYFn9gkG?=
 =?us-ascii?Q?wq0nWemivd7hezDPnkuHJCBkwByLKZVVg/NeuNia5Afkureu0fWYqRL6tlmc?=
 =?us-ascii?Q?D6FLf99arfbmJyMdL2AS6sFrRea7PnIFKHxUa4q41DaxgBoo+Ud//n2/bieF?=
 =?us-ascii?Q?vhhZQNdHEg13xl69o/srboz7gqfQe9JEyL7UNcno18Hpb0s2cD4waDHeR0FR?=
 =?us-ascii?Q?owXWNVGb0ayu/CihDalXcVtbU4MJUxfmIHYt8SvhJ5fckg/wxByrlME02LTv?=
 =?us-ascii?Q?5G2ceokt4M0yVkpr0IkBP21FIf9JQheZ7angrolhZ3BbqfClpuEfJoUfBPEq?=
 =?us-ascii?Q?gB5D6gGTOZW2v2op+XMI99Fsj9X2iW5+Md/DQT+9lHQv2qCZNt5xYga2/7wL?=
 =?us-ascii?Q?YsltDG5SWxhMFG3QnGq73HTNaPu1UFWZNRhJlAGcD2OMSiX8gPD/B3xXeA+w?=
 =?us-ascii?Q?bjCBvBVpM5ZqZoH+ZmfQwICXJkGgsFxli/epizBFLVMjzA4CV/IZ4zH2t96A?=
 =?us-ascii?Q?PMdPpmMf/1drpIDv/PzMQAlB0VAwtxeIG1l7Oc7tzuN2kDsmCE0ixZO3avZH?=
 =?us-ascii?Q?JjK4b1IzFU8l9BPqyKpPa691M3+54q+BdpxjwcA20PSDP5T8hWHnuVLsKTTg?=
 =?us-ascii?Q?vGhw0mKGd1xwj9C3BhQnNnJz7dk/9H/R5x6COkM3NEV/1TeH0eL7QLYBJDW4?=
 =?us-ascii?Q?YWH9WB3P4mvJTtzGjzXmHEpbuUfk1iZbwtQGu/35stftSVsKW6n3Busl6kzF?=
 =?us-ascii?Q?1IwKyctZoO6m3slfJjl5QX3AE40KP0cJbPcce05sjiNUrn9frngDRjzWVEwh?=
 =?us-ascii?Q?0f6uOzmL8LY5Wl/HnZcqBloM6i0h2Ysub4h6loeYjt1Xn8w5RoDtRoDrY5QV?=
 =?us-ascii?Q?0AUgf33OHzes/GGvNHQ0Aq49IOBNHisAqoPHwqWpzQrCZ/4pcFsGjGPYEn5c?=
 =?us-ascii?Q?pmMPEoTfcFKLtXDbFjT+Ehqa+u/YvoUuzQ6p96F0lYVoIXBNYs6f2TBBm/dH?=
 =?us-ascii?Q?L7M7RLwrDYy9gtt4CkfqdvPsfi4IQXWnHR9j94JbEH3ZC9JPmNU/syrJreWK?=
 =?us-ascii?Q?2+PVkUKZDm92AeXNltyZ7s0k7xl+6xnzqcp/lb+NUifhVOYguZTMB3Vi6212?=
 =?us-ascii?Q?H3TafErnnb5nx4m/xo6JaKQ0YuR9vSUWq9hqoLkcAs0ZxQ4bv5KBnYOWYKvK?=
 =?us-ascii?Q?O3ky34xCewHaxLHG2IwdifmY6o9AFh5/+0ZqLfBkNLgwtJlV16SuR2tb7fEI?=
 =?us-ascii?Q?rg1+fRopCD7G7hzmma0Xr/ebFrwMsLTzpwKPjRipJ5x669U327YRI76Crxm8?=
 =?us-ascii?Q?bqj56/mK0skH6RVO0Df6zZIxYvYA+aOT4yMFnABwnWb6T7EbFwVQOX7XQGXf?=
 =?us-ascii?Q?NBu0KKLv+IUOG61QdmfsMe6uqvp4jHsd3CJ0tnKAKpCXiCthHEZ87ct+YTJ8?=
 =?us-ascii?Q?+9J/cpoy1dYQyWPTMX4=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 16:51:12.0159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d0d0ba-bf4d-47b8-1576-08de488ccdf8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6653
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_085119_629719_F00E50E8 
X-CRM114-Status: UNSURE (   8.97  )
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

Some of the TI K3 family of SoCs (like J721S2, J784S4, J722S) have a
HSM (High Security Module) M4F core in the Wakeup Voltage Domain which
could be used to run secure services like Authentication. Add the device
tree bindings and device-tree node definitions for this HSM M4F core.

The HSM M4 core is typically booted early from the bootloader and the
driver for the same will be posted shortly.

Beleswar Padhi (3):
  dt-bindings: remoteproc: Add bindings for HSM core on TI K3 SoCs
  arm64: dts: ti: k3-{j784s4-j742s2/j721s2}-mcu-wakeup: Add HSM M4F node
  arm64: dts: ti: k3-am62p-j722s-common-main: Add HSM M4F node

 .../bindings/remoteproc/ti,k3-hsm-rproc.yaml  | 79 +++++++++++++++++++
 .../dts/ti/k3-am62p-j722s-common-main.dtsi    | 15 ++++
 arch/arm64/boot/dts/ti/k3-am62p.dtsi          |  1 +
 .../boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi     | 15 ++++
 arch/arm64/boot/dts/ti/k3-j722s.dtsi          |  1 +
 .../k3-j784s4-j742s2-mcu-wakeup-common.dtsi   | 15 ++++
 6 files changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-hsm-rproc.yaml

-- 
2.34.1


