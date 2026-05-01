Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881D0CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 23:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aCLqdNIR2MQf+R76fpx+mK++eMcrpirTDum8bpyNsvg=; b=nqdr3ZEOQwEvvfEvNe/sb8mGGz
	A0t6vzb1RT4Ih1xH92zM9Xa6rPyrCYtfpEP3oAVDl3cIm+LRbJg6bcFj3ehwPonVYWjFGLM5hntwi
	X7vXIDMPloWA0QBA8R9fyT+IUpAIh7cjP5bMLFKhvjBdudWsZuBLlu2b5hM8TkM0wT/GNgT9rnWGL
	ugnCVVF6Tf48HbBDpX0IdhospXO8gktO5JqE6i8L/b4FRInUAxxwRmA2LQFSTzQsg+PenwmH1DSsE
	p3gcO8z5w/MTBkuz6dMEtOCwpYerLX/9NCB7IBiwhfxxnUR13C0RkcFtc246sC0/S/u//HqiivkJ2
	FCudtErw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIxKy-00000007pAR-2684;
	Fri, 01 May 2026 23:32:00 +0000
Received: from mail-eastusazon11011066.outbound.protection.outlook.com ([52.101.52.66] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIxKw-00000007p9G-07nd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 23:31:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/FmyBnioi/67FcWH1m8Aqwz0IChBTAHhv6hvD1Tb3nQI3K/w+LsGHWpVvD+Cp/ISZgHE0ZmcL80IhkCtPD5GDNpOb1t84vQNIEZYF3P0LwDnWZ25dkrZKruDQVa9XNm+Pb4sSGQsxNBHMjSwZxPn3abjgyD3rEUK0nqXiKkRt0EYzxS4IyZyDzOe6IjJHpD+0tZGl7mfu0zMIxvOBpwZe+yb8roYpdkULeutb7TkKzADshz1Rd+G7HG40xxeCzeBicLOkR4E3U/sFjYwW9jqeioHl7Z+jLFQBTmVILVtqcM4YC7nw0u8WFMFOHoipRilNFpQYOCk8vWvpS7wD34dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCLqdNIR2MQf+R76fpx+mK++eMcrpirTDum8bpyNsvg=;
 b=nvGlMh9PbZhBLsa48l5QTqqj6YJwYjM9GjMIX+tSO82XMXyfDOAIY1zqSFOz5LQiEfaqXOk7HIgFzxLZkS4oyGvjXKUwFDuyJMQv3aoHbVlidzKov0DNIuGeG6Qg9EluG6w4A42UdqFGkojNWMBiis30FzwuLrdRYkuLnOvDu0Gq0BtJ8myVhYzZPXkkVDiR0fgaF2lcqo5buR7Fhfk4M62482OCL6991h23r61DWaJj1fbR2hhRqxIMEkyQr6OiL4W8+V6RjlCZBk5GE9NzBa0QVUe69xGsiJwjeIkH6aUhWCOCe923gv2wjlf6DehlGNdcueuJdzhGK4aE2Az7/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCLqdNIR2MQf+R76fpx+mK++eMcrpirTDum8bpyNsvg=;
 b=Blygc0+ZcO+o/BkpYpJoGS2xAKDS2Vx4onfdrl/QZlsX0mgkOQSjQhNPFgHLY1FwyOUg7Txgfg3q4lCJ5HBvZkdwB3fQyO4ADWArzHkba1aegS8l0uCJkZzNceyo1bk5cJNU/NVG/bbkG6HbthOSlpOuZMqtlouKFzBunji0lr8=
Received: from CH2PR17CA0013.namprd17.prod.outlook.com (2603:10b6:610:53::23)
 by PH7PR10MB6380.namprd10.prod.outlook.com (2603:10b6:510:1aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Fri, 1 May
 2026 23:31:51 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:53:cafe::4) by CH2PR17CA0013.outlook.office365.com
 (2603:10b6:610:53::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.21 via Frontend Transport; Fri,
 1 May 2026 23:31:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 1 May 2026 23:31:49 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 1 May
 2026 18:31:49 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 1 May
 2026 18:31:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 1 May 2026 18:31:48 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 641NVmOL4174732;
	Fri, 1 May 2026 18:31:48 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>
Subject: [PATCH 0/2] arm64: dts/bindings: Add support for BeagleBadge
Date: Fri, 1 May 2026 18:31:46 -0500
Message-ID: <20260501233148.4180391-1-jm@ti.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|PH7PR10MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: cae6e7d2-6ad9-415f-8deb-08dea7d9d1ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: FbeHjUCPLNjBPTeWqvTZVu6XGyHXzmItnF6cURBI8DyXGMd/HU0kM8b1sN0maj3pUy7K4TusipHVNkttEKSCuJL4fM3mTR7hDDu0RIg4BZ1cZ2Fls6aHInY7GuzI0Dx1dDD9PIZg18tdHGQ6b/S3WOLgnWAJyE5QaTvNbShRY4Adz6UgTB+exdJwOmUethC0EilWJrnHdfgFBajmEz0oB/SR+/MSe5dy6ViCwncuM+RwI/7EaT6FXrGBlHU7jVZxkXipHCIgb7XkEx9tb5nOaCas673E2u2pqG0d4mqonPeB+UKUkcL2xkDvHMLLcyEvWfd9INypyeIz1v/MPHzR8YOpMJDq1SJt5AER43qq7Ak1eKjw4Kz9T5e0tXZsgEMqmR2htxxAW76kzFFDkyHEamK2kaMtPjnmdoyq7Zu8advfAAkiXiIFsYnV1CjTaQjCoCG1j5ZFRvw52rgkxMiKIiGoG6iNQD1/lRM2AsP7mjKAVGGHCDiYTGPTD49iqIWtMJiqp7TCkl4wvVz0qAkS9TUWErEOM2VjzaW0u4Ah3sdpZv9c4GpQKsj77jPDc5Zxeq2n6oriy7rQNkAqI5r/Hr3ocjUPELNUGzkb0lPTU6DxOddUZtgfVZUyaKOQe9DbZZiKl83jfXwMCLCLYRXH9mhdn104I0NEc8wK6bye1Kd1b+RhsSacMp7ydEKdQ0y7
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uDs2uiJX+ZOSbkvnXX3uKHpVD4f+Jc5QqWxF6Nyup5+oH+1KMR4aNQ4++RR0LP5Z9r/kysgSzNU4aQem+gQcE4p08Njn5enyvE0hS3j1yfnYnguKcaE20pCdF2dlQo5kR7GSFvKAQEWTSikd8WM/SlibaBRnVPoFdcOVOCkgJ7e8n6ikjKXzAbwTcLKoAIPaf6q6Zj/8tpC3KChkoCl2BbDSxa2FxnlSk8clCgWLjnW4a9wT/C3MUVWL1vEWcgTWo7nzerzA/zXwszHe+C0smSxkfPS2Ak0ectZs86+fEsAJC9LNnfUuM3qwDlinvMMJoyox3wYkFWZ834y2jKJoTblLtqEOsZ9nror4eQsiIisVOgrDhJOupUioD+ih5xntK21JcddeF3uFABR1Owi3b9aeHtDmhYRM3gVZsAr2OhLUJnBoajkyNeg/gniXH6kT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 23:31:49.9593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cae6e7d2-6ad9-415f-8deb-08dea7d9d1ac
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6380
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_163158_076852_3ABCD222 
X-CRM114-Status: UNSURE (   9.17  )
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

Hi,

BeagleBoard.org BeagleBadge[1] is a compact, affordable open source
hardware [2] single board computer based on the Texas Instruments AM62L3
SoC designed for IoT and embedded applications. Add base support for
the same.

Bootlog: https://gist.github.com/jmenti/d85f17bf5264f1364866df91e60231eb

This patch series adds:
  - Device tree bindings update for am62l3-badge
  - Device tree source for BeagleBadge board

[0] https://beagleboard.org/
[1] https://www.beagleboard.org/boards/beaglebadge
[2] https://github.com/beagleboard/BeagleBadge/blob/main/design/BeagleBadge_RevA_V0.7_SCH_251107.pdf

Judith Mendez (2):
  dt-bindings: arm: ti: Add am62l3-badge
  arm64: dts: ti: Add k3-am62l3-beaglebadge

 .../devicetree/bindings/arm/ti/k3.yaml        |   1 +
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 arch/arm64/boot/dts/ti/k3-am62l3-badge.dts    | 655 ++++++++++++++++++
 3 files changed, 657 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62l3-badge.dts

-- 
2.53.0


