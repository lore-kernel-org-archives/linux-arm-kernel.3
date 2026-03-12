Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13B4FED2F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 09:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XjdH+oxcKZ7uD5+IfaMe6vghxLubFU+aHN7w3fOfXL4=; b=r60EEe0ZBvw+tGyQmIaugypXUc
	pWefecjAWKTGHLXMk6ORo8Cs2T9oLZ8SX+bOXh2If65xCLCSqjrOQ8d1B9c/mZJtnH1yEL+rJeoNo
	3kcEjJGtQs61mi9qdJhy71HuMdiG1adIjz8eIQrvknsXIp0siAX5PAtF4B9cnAyR7/6FsvyXB6LW3
	afmPPM9A9dyQYlpOWb0NKULQNmXN0Y+XRBSxRm2NrtcE1SnuDRrN2g17fWbdbqTYuht8hd8u8wUwR
	ZXqwL9z/t5ng/GGXLknKIIVmhggkegB2BNrK1Sc0uKLM+S9PuCfD0X5KpC6V+SG1GxKj1hiOFQBsG
	DENTSBkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cff-0000000Dnuk-0rYx;
	Thu, 12 Mar 2026 09:49:35 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cfd-0000000Dnu4-0Zpv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 09:49:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODzNC5oUny3oWMwPsbvD9fRy/oywTC07XslD0Yw3jSrPLdBlM2gpPi5DBRguPS1Aqnk0ajaHOYhO48S3GXmvMytEA7rdbyILMvcyPy7Hiv2hWXkK1Tz3Z8X2WDI1u4YBPB2hE2Cy9s61F/ENjCr/4phyuiN5ARyhwbOsMP2ckA08Jle2TuJEZn5pUQOoFxAKRyR5m2D0xQu+tp7lMlnb+IaLs+8HPby5X394a79GBdfnNtsekcBjM6R8jlHMlzEaqaG7m/6wW4h/j2uuBaIIEcJlnlmsLtsQ2PPnqCaX/KdhlTv6om6T8BPVT8uQo+IhyjvCV8xaYEvyg4EwQhvNrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjdH+oxcKZ7uD5+IfaMe6vghxLubFU+aHN7w3fOfXL4=;
 b=pZAFUogEte0XGRLbeMFLUrhQ7WXamGae6y0WMpk7gZ0jgPOFlhEDzUU2BGHwWelT5h3CakYcKg7jt0dEISXha5su1GljzX7vvF0gH8dr5izEMsDVYu5yDdTdJ5ZkYzj9+2qHjmFwjzuBqgdp3XedNDTu18Gh6ltHkYnI2mzAY101uRYJQLlxGjsuhkz43iT7Ue56aBvHJg0BK90G2OkPSyL8VbvexyQTx8r6ux+vdg6qVii5j9BtwHu+7XqC02WZG6+vyEAG+ux+lfnX0y0LSUi7VdHI2bEa6ih9HUTzGLvVR37mF2zOIgpKwsx8b77GI8sd8P5Hx6eOM4XlpRdjDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SGBP274CA0013.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::25) by
 TYZPR06MB6238.apcprd06.prod.outlook.com (2603:1096:400:33f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.15; Thu, 12 Mar 2026 09:49:25 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:b0:cafe::84) by SGBP274CA0013.outlook.office365.com
 (2603:1096:4:b0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Thu,
 12 Mar 2026 09:49:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 09:49:24 +0000
Received: from ZicharPC.. (unknown [172.16.64.205])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AE2E541604E0;
	Thu, 12 Mar 2026 17:49:23 +0800 (CST)
From: Zichar Zhang <zichar.zhang@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.chen@cixtech.com,
	fugang.duan@cixtech.com
Cc: linusw@kernel.org,
	cix-kernel-upstream@cixtech.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Zichar Zhang <zichar.zhang@cixtech.com>
Subject: [PATCH v2 0/1] arm64: dts: cix: add FCH(S0)/S5 GPIO controllers for sky1
Date: Thu, 12 Mar 2026 17:49:22 +0800
Message-Id: <20260312094923.3473444-1-zichar.zhang@cixtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|TYZPR06MB6238:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b12acf85-e22f-448f-5d13-08de801ca4b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: mHmh3ySyDP64aYDJ8B2990JruFyrpCzHvzXCQwf3TvzQpyWyis5Rcn1DOmCElxFD/5Z0hEuKeUO5gBM1Z0573Tr8kENmKfYstVO9TlUy/PCU+l+9SKgRfn+B77oZZJo+Z4/t1lPN1wOBe2nOnLssCK56h3ktvgr1PDKgO1demKvmfdFTJ8RjoyyL4aF8jn+OPpmrI+ZDSAzNO5RFnhIIgR19UtKrt7/yH56DE2ja/D7qsNxzKVyVP8zLOKJFqIMw/lR3ixBbS++loS0cb8oVz60AYeGQlwl5ACDHcMTw8OFXJyDPZ09WNSBAJS0Wf5bY1dAafAhqbHX1NhoxvPKLqCZPR4jIX0W5r0LYmyoBpji/+7C2W5I3O9IVnpNckCwo9xwwz06OIAbRM0QQOUZOHj/54oCozNqHZd6E2uymIUheOjTNrNZ7lgi/gynniTswj5g1PZsFbtT2K/5aa3FipclRSBX2ZSX1Lca27JD0u0V2O9K2L8uE6NlcaTi+H00pV4/lozJVRFcAHFdHlhxxbgIIHYiAHpes6nmMjROlWn+ZQTB783IkQxTnCCncyrWSKeosg7n+J1C2ULvoAdHxJPdJCNq09xp8x3qww/mX/uDR/8Flg9ipiDO8TJ9YItGnEe5uJaU64FiB7XYK6Wki0tCF4WTGuBi6xwHm9v1nuMDKAgUEmGypyi9aQSDGcNwwzd2dPth8lQSwkr5w9K1yMISHG5xWIwEPFSTYZo1WS6U=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CnOyScdW/gmLmoi3MM+Leao0op8a03La9c8snHV0wjwH7qUKGa1yxqAxufzv5EYNjrIHSWzkdM+xo3QDICIhdDb4BVc5u8+rVGYRr0f6npAmJCrAYsdO/mk/M/icnEEIqDMLyVwwwhw2lksCLj1L0sOFkFNeN+GiX/Qv63THNcE0JkAzYIjviKayiV4yLiLiOl3MYBsM1gv33jzl0RQNIkjTI1Edhv9N0TKZr4ZmmJIMGEzvz8pOonM0b6GfxNcVgv2wVej1rnc1Pt5t+2N9IpmEtRAjZQl9akvfou/LWBEpXLD8jKQ+d5rVXk7oF0xJRJRrTt3bR8jHF+nXsuhBaKOhWVTbn+SgbIRmqDLap7BAT1owKv+nX6erKHgNHxdJgsr91Joe3cFXi7mgisrkFvzoP4LQcw5qmTmFvmsTGdGtknA3VMWxADoUu1EnA14L
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 09:49:24.2565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b12acf85-e22f-448f-5d13-08de801ca4b9
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6238
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_024933_176749_4C5A2299 
X-CRM114-Status: UNSURE (   7.08  )
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

This series adds Cadence GPIO controller nodes for the Sky1 FCH(S0) and
S5 domains in sky1.dtsi, and enables the corresponding controllers on
sky1-orion-o6.dts.

Changes in v2:
- reorder fch_gpioX and s5_gpioX nodes alphabetically
- rename fixed-clock node to clock-100000000
- remove unnecessary clock-names property from GPIO controllers
- drop unnecessary YAML binding changes

Link: https://lore.kernel.org/linux-arm-kernel/20260306093238.2715269-1-zichar.zhang@cixtech.com/

Zichar Zhang (1):
  arm64: dts: cix: add FCH(S0)/S5 GPIO controllers for sky1

 arch/arm64/boot/dts/cix/sky1-orion-o6.dts |  28 +++++
 arch/arm64/boot/dts/cix/sky1.dtsi         | 119 ++++++++++++++++++++++
 2 files changed, 147 insertions(+)

-- 
2.34.1


