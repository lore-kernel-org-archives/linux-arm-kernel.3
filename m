Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE09CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 15:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HwsXeuk5ZPmwcXhUrAo4N9y4SP0BCzwGWBgEY9snyJo=; b=YOuzJb1wKcwYev5pSa/2pF9MM7
	XdKO9Ln6j4RUFP9vvieoyaRJstyc4mLB0b3lkVCn/DpZ+bdd+C2u46mrNTxa+Zp/f9jJIl8/LsWB8
	M6nvaFksuGC/OqqLTUBOh26yjhjNnRHTCXHOkQM+Bo8l95fPQTBq2eliDF8kGsyLqMnkhLovmi+TV
	IC1FYMTKWqbuafwULPhFL+iIkwMyuJpDFA66g79W8229L/3GPMXxQaNUwhzdDIBIwwq+4CD2lAe0F
	/Zi8FBKgASh66CpzAJsfKqohcrXQ+l7gVAKd8vXpajr2cuXgckFWTFtERf50mnqpE9r7E7tJOBSqB
	lMo2Q9RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuZx-00000008lIv-0jRb;
	Fri, 15 May 2026 15:35:57 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuZt-00000008lHq-0yr6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 15:35:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRDRbRmtXYu8Jl6n7G7mUy0V5Xh1dVC0r2s2tfOKgV19a5GK8OOreWxxpFDM6QsI4ayjm09ex27edfYwgDi58R7XO981C5YYmFXPOVTBqydds8/ZFs7iTlRIjeaQYee7FiTAk9QmZuAi91G22kq1sGfuBG3irdqRv8ZvM+LvyhWhwFCZ+mpD+KyOvwobp6dazy3m7xkpYqP6yw9Sw9/DDnw7z3UYACl3CmYsTjrKyrsIanNwqcomozAm7lbd1Qdhspri7tuqQWs4txm+ZEPkaAt1l6Rq0y4p8FkbP5NDmfXjWqmcIqkczaJPKILSZozvz8Cl+BTN4g05LTC14LWPJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HwsXeuk5ZPmwcXhUrAo4N9y4SP0BCzwGWBgEY9snyJo=;
 b=G14wcm+y75cpbv6qrCePxaVXVvP3n8N4hDUna2hfvxtRHu33165KuC11FKFXGqPhZ0Oo1B7PkX0DLsg4LUuYoOKDfyo7DiL4UZSvCXfa9NXT/RH/P2Vm7B3R06aR579c4YS9qJ3KycrCkzstzGYulNsaN5xzSa6QHqVoZ1tN7HQbC8QFm5gcGmYTwWbuDMOLzK/TdPOC0pREWoyiqbwIfNJK8pvUCGNGzXBv6p2csXm5QgAXQSadctVfpGsPZ7Uc+IKVN5jh8oFnpP2pKRpFaFhuf/9tMZmnzUDpfrU8bEKRK3gV19BF8ynzIkLiok8fl8xOmAPd3hbVzkPmZ2UYBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwsXeuk5ZPmwcXhUrAo4N9y4SP0BCzwGWBgEY9snyJo=;
 b=PgKWQqlkuFWN1WZO3XlnY1rN6X6GlK7/CUnkJgGx9krUi5VTno3xMGstOyK4VQoSZf+o2a5dMGoSYydLVETXUKpU0bqhkTyyF0s6CIO+hQA4lp5gc4Bu5KiEhotpkaD5TpBr7GXJZpIsn3IGm6A9TAt5J33zkGNk2YgvMlmsfF4=
Received: from BN0PR02CA0037.namprd02.prod.outlook.com (2603:10b6:408:e5::12)
 by DM4PR10MB7390.namprd10.prod.outlook.com (2603:10b6:8:10e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 15:35:45 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:408:e5:cafe::4c) by BN0PR02CA0037.outlook.office365.com
 (2603:10b6:408:e5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.20 via Frontend Transport; Fri, 15
 May 2026 15:35:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Fri, 15 May 2026 15:35:42 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 10:35:41 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 10:35:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 15 May 2026 10:35:41 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64FFZfom4155355;
	Fri, 15 May 2026 10:35:41 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>, Jason Kridner <jkridner@gmail.com>, Robert Nelson
	<robertcnelson@gmail.com>
Subject: [PATCH v4 0/3] arm64: dts/bindings: Add support for BeagleBadge
Date: Fri, 15 May 2026 10:35:38 -0500
Message-ID: <20260515153541.294698-1-jm@ti.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|DM4PR10MB7390:EE_
X-MS-Office365-Filtering-Correlation-Id: 57971ac4-0282-410c-961a-08deb297a020
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: WnRBBVq1kmJX4JhzHlmWj80otT99kC579hGm70HNO/wNF0vs0pxdLVAVIhspIv4pxd30TSODIkR/CDt5XpX6g4RMnkyC2YQjz1E0Ob8nT1pfRQQwCC80m9hpVFzKRphFjh4bkitb7+Tb7KAykt5v9zNH/lRWNtMV8ytSHAieDFEIh+lWo7Uy6znFBYCrfZkpuQJUgEat8pH5sif+rN7STnJHd84x9qfVLL3CW3Uwdi59Rp8kAV8qwRiPq4hsFZ4B9mYwKaAxlgdFAFIeSnR6bOB/uv+1Z8g9EHDLe93V2CNZJISFi3vVSI8rbHZG30xukJHG2vLWt6UO8GmWyM4+udkFYN24D3+/RvebhQlI8tnJY/fanE3pvkuk8mjrSVsr76JEl1fPW5+4fc/mvf856KIy4iL7y65Zy2BE5LaaGQz/9REErkf+CPvhTUqfxkV9r2/HZDIRt0Iqx7GiR1wZQs5fe8kTSx1VPUmbPBx56eacxDd/812ZB4nORvFUOFyDNu+bEM36aMo4XA0QCWxXFNMbJNFaGwFkePUXYmwQkcKkGs7gTM0s7L9F5tp6+YdArg1aRvUlDfre5gniATmJP20dGddih5lzQFVqGmvfEc4JkpKs0mWslU8soUY/WvsIspExlxtEWB9KFyDVkn93TN3fnc9zamyb6mTFnZ5zjETx1iEB8LhYx+rTWtePPrRg
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TM9Tm4PZyRLzI6Q47VLzySOr5Itqa6qutMWv7u25WtXRqUTCJhyr67mYNg3A6Mj4RIdbWPONGZPKR0mRMbq1hOMS8GutFOFUxdbtCspH+Jj51qN7xxzfkknB1wkhIIgM0fNAoCpEFAIa5ZZPn1HVEyFrsjLiQ0+EH2kj13MTgqyUyueNpLD5GbKStBOaOkTO7wBzVx27OPjHFvEyjo5f80ktkkSUWHttHY/VlDYKDVfkGhy69XhbQou39skUhoJdbTCdNF0gfPew1nj0151J8om8x2pViX2wYxEp+47263IOT19tGRp4/UoU9bcOyYGsr7O+3KIxXJkn+aLlf/XlVgf4eiLwQOh2j/72JqUJLA+Fa+5s7ydDW5VAP03c8J0neEvraMJo3JgtlvcOGw4VCznAgQZ8lYnn+MgOu8G5511ApvLvvrfEqQZQbSXjReKl
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 15:35:42.8281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57971ac4-0282-410c-961a-08deb297a020
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7390
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_083553_478077_3D0B1363 
X-CRM114-Status: GOOD (  10.40  )
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

Hi,

BeagleBoard.org BeagleBadge[1] is a compact, affordable open source
hardware [2] single board computer based on the Texas Instruments AM62L3
SoC designed for IoT and embedded applications. Add base support for
the same.

SD boot:
Link: https://gist.github.com/jmenti/8818fa277597de927dd2b42ab1d2552f

This patch series adds:
- Device tree bindings update for am62l3-badge
- Device tree source for BeagleBadge board
- Defconfig: drivers for BeagleBadge

Changelog since v3:
- Fix newline in commit messages
- Drop vendor URLs
DTS:
- Add bootph flags in wakup i2c & PMIC nodes for completeness
- Drop unneeded header files

v3
Link: https://lore.kernel.org/all/20260513233447.2713737-1-jm@ti.com/
V2
Link: https://lore.kernel.org/all/20260508230341.1891450-1-jm@ti.com/
V1
Link: https://lore.kernel.org/all/20260501233148.4180391-1-jm@ti.com/

Patch series depends on:
Link: https://lore.kernel.org/all/20260513231154.2703292-1-jm@ti.com/

[1] https://www.beagleboard.org/boards/beaglebadge
[2] https://github.com/beagleboard/BeagleBadge/blob/main/design/BeagleBadge_RevA_V0.7_SCH_251107.pdf

Judith Mendez (3):
  dt-bindings: arm: ti: Add am62l3-beaglebadge
  arm64: dts: ti: Add k3-am62l3-beaglebadge
  arm64: defconfig: Enable drivers for BeagleBadge

 .../devicetree/bindings/arm/ti/k3.yaml        |   1 +
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am62l3-beaglebadge.dts     | 700 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   5 +
 4 files changed, 707 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts

-- 
2.54.0


