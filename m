Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108FBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 16:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vi9X5QHxom/shb1Xeo0pVk+vxYBtRUDCCAdoquHX1MU=; b=w73/OrgfO3bmIF8xRTTe5M3O2b
	qgKFCm2eLFq7LD6Lj9pVjcz0BDz6Ljy/NiQh4+wscv9SOGiiauHJSmEmzDwvTZ52IRJXm4oa2IdTd
	VQlOwlyWSdH8pjkIBdtzC52G1UTsEeoKpQ/9Nbj+aMDEPilBtG+JvZ4L9KGHreHvvpmwXTgSLplop
	YU3zRNwUIG0f3/8qQNjhhQ93Ho3lQf0+MqaBpefb4SyHy9bZ5yO/qHVmCALPSBjzhQ/c9KhVPtPuT
	LXxv/9LlSMEGz9KhZY4akPAfwzu7knXMjvmEAxqka5fpaWMDzP2r/xmbHDjqXMZIVD6QdZigL1Gy4
	lWtorV9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdVo6-0000000CdAt-1OTS;
	Sat, 27 Jun 2026 16:23:02 +0000
Received: from mail-eastusazon11011055.outbound.protection.outlook.com ([52.101.52.55] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdVo2-0000000CdAP-3PmM;
	Sat, 27 Jun 2026 16:23:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JeCCxGKCOVPa0jVsf9xBvKiercr04xQv0iAdX26UlLctfavvi8K7nR9SUJPUKXdZ375WTdzA0O18HHhgaj2JnPAs/nMRRdrmz/Zb0YV8erQDAbeSllTj9X1t/PHohmQRhkW7fiRyriU6VBVHqSmH5IHyKUwSe15RAthUjrx9hfqcwBdr8HxgBM79h4fbhesJfnM8uT3PwOl5+Pk4ul9KU0KNeTHndrlTFl88ldu0sFSzjBGOeV+uHuQfSTa8aGIdcUl9vi3qkGKPVXLXGAgI6HxXZOAHOzFmwjmUjHxyHqAAfsEEKTn8MBDH1rNOkIS5fyDwBqX8SahTYIIlbp5WkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vi9X5QHxom/shb1Xeo0pVk+vxYBtRUDCCAdoquHX1MU=;
 b=Jqqp7QpvKpVxiq25M4nZOvy2UpEcXQHKzpNhlyH6jiGcTVCob3Y5aMm8WqKfQ6uRZ9UkGJMvON4by2j5egDJc8S8JdQfXfPyp5SIFGGieO+pzHQAw7O6kl81mpmH55+GBWkOsg4ZsUEZbGAb19UWGaBNSrkbA74m1kO+kD7qwqpLWj5nw9luH8tHz+NnaVbDsQLI7jeIMHo6Mu90U+vnZ1eHmeiF5p6o3Uqq8Ztiz1bRrYrsUWXB6wleATdN3YF7ZX7mqV9Wfx93vGUz4gJky6O1sq0rSjmhWR5Ah7HtolZRtdMbN+QFoTtA0KTlisLSOJ4bW1PdKuI/g5CySRgpqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vi9X5QHxom/shb1Xeo0pVk+vxYBtRUDCCAdoquHX1MU=;
 b=qIpvNb/1lN9P3nyI9YRUS7c3VzeQIQ7xwY+RAJv8b9BpVCUoPbGiudyhAnrcDn4QYHZqQH6vDIf8TS2Pnkx2ikDUIbmyxY4ZzqaA1JeG9N3DcCnQuCGoA2YbHn+FXVd1w9DwIeZqRs1uv7w0x7wcS4P4dQ6Gwb30JlZ2qwqUeiQ=
Received: from PH7PR17CA0040.namprd17.prod.outlook.com (2603:10b6:510:323::26)
 by CY5PR12MB6276.namprd12.prod.outlook.com (2603:10b6:930:f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Sat, 27 Jun
 2026 16:22:52 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:510:323:cafe::af) by PH7PR17CA0040.outlook.office365.com
 (2603:10b6:510:323::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.18 via Frontend Transport; Sat,
 27 Jun 2026 16:22:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Sat, 27 Jun 2026 16:22:52 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sat, 27 Jun
 2026 11:22:51 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Sat, 27 Jun 2026 11:22:49 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <laurent.pinchart@ideasonboard.com>, <tomi.valkeinen@ideasonboard.com>,
	<vkoul@kernel.org>, <michal.simek@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH] MAINTAINERS: Add Radhey Shyam Pandey as ZynqMP PHY maintainer
Date: Sat, 27 Jun 2026 21:52:33 +0530
Message-ID: <20260627162233.2803425-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|CY5PR12MB6276:EE_
X-MS-Office365-Filtering-Correlation-Id: e48f908c-f525-4dd2-6bb9-08ded4685632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|13003099007|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 9rAh1fte2JTgN6FsH9nWfdVeCiHOs+UI+/lcIHORRaRamKj1o156hWj3CT1J/kUMd3jI4TkpOaGBmgaBjdUNth8yWn8o0mlO4sKBmz03s0ZEBtxVkJVDguz1KexrgmlT4UQ+EN6hPtEOfnEdHfgF77DO2BTZSw5yctVZKXY605D71r77crn7mAXpW9urh1CCfWRfZPwF/6HzMmBZ2LUThyD7GEu8OTyCexzKncaTuA8oP3Y8/mj5Ewpqyg9Q7tIxG985q20CLmbUavYtBn2lTkmCaghsnHvGTEiBi86VLUz8tSRlH6B9MH8dvi94fWs63tF/5QBWfxeOSXscQ8mHQs0WRhV0vEzWJycaYnotv3SErMfcpdLSn2X9OdrSltq81cPMkvI2K4sxc0Ho7VUZqPzybv/G/LaG7kDwBQkYVBcbxS3mTBaVOmii0R+eVZ3QLeXgdtRh3+hPbSt6F/2L/0FAmjjhljJnsGE7WioHVI61EAy34Dl53BUdAJI9bwE2i4cc/SjREJzOZjjDK6hzGoP1bp+syxF4RLDUmiRip4E4SRGXQQ7ZYYtUmbV7TXyoLSgvZN1s55OnWNFvDaDJxSQMbbP4bmtcYgjO32XOI0sbSVw/XuQ/m+XmGqnVeBP9iG7EDWKyTcPHyj1yd2cIdO65fotmxQvSGSJxCzh+Tr1r62u9fu+7WIKhjWX1ieM6LU6nisemvF/xAksLKfIQjA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(13003099007)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Mvt5GIIDl1mYGr92v5W9jwtHephdMGNNyaVWlAnrkwhNLDstZ+o0Yn9yWQ1vK6h8QWhiFZxNuTxe1bk8dingudzXpkLJ0sb2AwEIdNX5r6ZyU0hkERpg0hln1tHioG8TRyMqFZ52gmQxs4dq4Mk0mUo6ajjV2fRPn3rA0lu0GEAh2G/zJnlU9ogf02Baw3pC2v2xI1MvxSIm6zCNWlmd3Ew3VyC01TmUXoYohEurBjaJyg8FItcYYSQhlwDV3VMatvSuOgBlF86hyYZnEoNg2QK8KZ6lWAlOaB0rfT5vYRFzLyTQR3rND6OmzTZb71Wr9KzceDq/O9t6W1cDGXB1VBt35I7VzksXt7kTRw7Gmj7oQcvsjrP3BjaU3R3hScNY9gAvnRu9UGrdXwUUdxOhKuUHsjV/N83d1kziMOZ2wmLe423MXN48ed5KCisJgIpD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2026 16:22:52.0367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e48f908c-f525-4dd2-6bb9-08ded4685632
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6276
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_092258_852939_A00EE1C7 
X-CRM114-Status: UNSURE (   9.04  )
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

I am maintaining phy-zynqmp driver in xilinx tree and would like to
maintain it in the mainline kernel as well. Hence adding myself as a
maintainer.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1705eb823dd0..90dd86437c5c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29645,6 +29645,7 @@ F:	drivers/edac/zynqmp_edac.c
 
 XILINX ZYNQMP PSGTR PHY DRIVER
 M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+M:	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
 T:	git https://github.com/Xilinx/linux-xlnx.git

base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
-- 
2.43.0


