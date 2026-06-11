Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E37CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 08:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0iXBU0tq5n7Wf1S8DlEgR/arND7B06CIKi9jbz26ckI=; b=wRTbg7Hp3a+G73a68H7J8/bw/6
	UCO82Jn88XJeXnEQKBCBLV7xv2NI/1cNyCiTYuu/nfySn3Tr6PX5ZBoBSjqKM2aXbTHRBVrDGahVM
	E0X9SzR5d71DQ5Ji8Ng8hg6hGELozhs6fsP5HiRMsc36kXFbmt0fMTx72f5vP5trXWRPrsDmSAHTm
	WLuPNgzF3OONARODad7jQLx4vQ0wbRM4O5hqdPLvgVGOUyIHfvpsoRJVlo6d1Ri8YjTqyoAzPuqAJ
	UZhGgemhhbJd5dFJOwgja+VuUu3eyzqif2S1r9CALYJ3WKZyl9CML5Pw7CZIl0OYVcpZQb01Vzd5m
	VZiV2/qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXb0A-000000092Bi-06H6;
	Thu, 11 Jun 2026 08:43:02 +0000
Received: from mail-westcentralusazon11010004.outbound.protection.outlook.com ([40.93.198.4] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXb07-000000092BF-2Pqo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 08:43:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcya1M+1mkLdCVTT6rDieosKJNvZ5tg3h7p4TQvic4gne6pcEAbYYqpMbeeR+LXy65x1j/IBe3dap5+oC/bQyeHF3TkjNGPS3x85Y+xt9p1F5+OgZYFeMFX8E14Dmgz4W5QsJs3Fr0hj9P0I+CTiw3nkPfSxzQ4HHFKWNIxDdCRCc2G+X90fqgbG+DmNFMxXGDn94piJOp1By0te/tiWkoYxcykwL9lw7tAoqlqI2++rmxJh98So6f+1bMkx32Uk966xSl6Y7KkIXMK7CM5ftQ0eW61Ox/EBcFc+fGurrnk8omlu3UbdmKykVZkKqzaId08uxX91ivnaHfXYt0sRmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0iXBU0tq5n7Wf1S8DlEgR/arND7B06CIKi9jbz26ckI=;
 b=te7cW4jka5gi184ChKtquUhfGDKijV6UHpH/au6Wm1XXPX4jGLcYLJT5pqZRxtbhQkG/Ex82X3pAsMUwIGvM+rlfzMHLd6SMhk2oPQLV4ZMJNWtS687Livkf7odX9u0Y7RXt9cxx/V8x0KuZglp/7xNIsVQGs5DBuWEIhpCddzzoN3SKoqUEcO0IOhhaXybFfOcTFEVblW3AXrgzpTkjW/1sDsPXqSdkJYvz6Jc1yt8n+amB9Mk29DF1u6+EKQjq5FO7EBh1S8vqcSXBHt/K2biUy4reoxEz1KJPYiXmi1mZI9w9D31ZeJ0+tA4UzdH74XqxtCjCm5HDEyQ2GxFYAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iXBU0tq5n7Wf1S8DlEgR/arND7B06CIKi9jbz26ckI=;
 b=XWZdq8WdlJAfsns0Obdo9yUTgD8ICNokKeX/NlDfABeOKhmibA+mCGkYWZ0OJIEO60ZWScESEogF5HKTe785nnTXuxl6Nh5kvTwe6u20ql8xmDRrcoXfx40xDQNvLarqIIn6zh34MhbEDFyY7aEo7GYEowR+yOTVL9ixYsyaePkipdmy62Nyv1Exey/dfpXXe1y/MvIk3tkbsKvS3ZeZTmtJddE1vXlC0icQA+55n9hfS6oB1VN/tfvEWk3Ir5oiQMUBzLtN3o6KV/mAH3G4lUffMQFo7H5rVCL2qOCTpQ4Na3Jq5h77j0ZiaqjSgn8f/Eu2i+YT/p3RPl3PE0OqsA==
Received: from BN0PR08CA0009.namprd08.prod.outlook.com (2603:10b6:408:142::13)
 by IA0PR12MB8227.namprd12.prod.outlook.com (2603:10b6:208:406::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Thu, 11 Jun
 2026 08:42:50 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:142:cafe::29) by BN0PR08CA0009.outlook.office365.com
 (2603:10b6:408:142::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.12 via Frontend Transport; Thu,
 11 Jun 2026 08:42:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 08:42:50 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Jun
 2026 01:42:30 -0700
Received: from NV-2Y5XW94.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Jun
 2026 01:42:27 -0700
From: Shameer Kolothum <skolothumtho@nvidia.com>
To: <iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <nicolinc@nvidia.com>, <jgg@ziepe.ca>, <joro@8bytes.org>,
	<will@kernel.org>, <robin.murphy@arm.com>, <nathanc@nvidia.com>,
	<mochs@nvidia.com>, <skolothumtho@nvidia.com>
Subject: [PATCH v2 0/2] iommu/arm-smmu-v3: Fix Tegra241 CMDQV CMD_SYNC use-after-free 
Date: Thu, 11 Jun 2026 09:42:03 +0100
Message-ID: <20260611084205.686559-1-skolothumtho@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|IA0PR12MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: 08506f93-a149-41bd-4961-08dec7956bd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|56012099006|11063799006|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info: rCgdsMz/KJo0tAlmwVMXdSrDDzLLZ2zR/k5YDAPlbKMvP5VnMCsFuQRFFlDbToDFjMkmvzQ1h6QRxAmCn6jUesFuhj6IOElGLC766yJ5eRzdYuQH8QkgO072I/vVOV8UW8JocUue7kc2FlopqdfYrU+Hnf44cdixkE9WIJW7XTzRW7NiSSvpDShbmCIgVFdjIVozsViKFzXLL6VllWvs5qWLn8QGHf5saW0uq+pMAZymET+h2XjxD/FcSE0QneFqu2NwJy0ZiT7xaTWqgeFfaZrj/3vXNYz0XpsgH8VLhywGiSAtTb/9raEelzmujGhE6EBlqUNOKdTZhnkVX2M5VH8sX2b/2YKesHksSb9F6pfFQGrCFNPXiLqXg4bU+pYHVcZ9OmkbPeK6ARr/PQUjHGzpTnuShfb8hwDa9oXomW048KOqL9pGv8FVhqPE4P8KltNrIjTWn63fcVURalP3m5UtANfgsK7LtBACZUp/PW2FtfjqTjJmWghE0ANRFSkpHDH79PVhZx/xevSUD/C43zZU1LXye0hNCPChIxWva95DVgvbi+zYC/AQH8t2bwudggY+TtkQ5nLo9qheKg6zzwMVaYNNRiPFGO+HmL8Dq0UfjdZIoLmvkvJyLLt4JlGtPlVWWOJzK5HgAgzF2TlJ85OMJNRYeZOwltMZ6CI30JK03tUaQ4bMLtvqxFfrFEY3U7iXmtRsO1daIoMmHqVWY3UGS1fOUib+1ujlSShugRA=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(56012099006)(11063799006)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aOZMz5RO+NrvriWXXU/HkQK2LtDZsgrmyYJ443S3a/+3XmKTfIgBEds4imRzTjDM2BAH3jON23lindkH7tgfh0uLP+4AfAFT5ExsLJ+STtQ74SPMChG3c2z0yEn/1X2iuKRje81Fn4L8/dts8Xp55W/GmnHUfjlSixbNwwOuUubQVkivPba84e5pjKWix1J7Bv5UKftvUFavSY7KTGXwovUEaIIgXYn4YlPth96ELhztBjuWbe5AZeb3Kuu+ac2YpwoLprPqsz2K1gAR8EZoLYHzNpS6BDA4DpbwwxWXnnlqrUVKBLDlgNFko1YpyHdY0C0kf4LP3GOkRQFiOz3nJ9lJnwioRAZuOtSv/+wF1Lh5kYZF5bR8mbg9t6vWzP2Fe+4pUdPKT34+PKSbJ+R0hAObUiXmA56Qrf6rTqjOsUUTeBqc9TDHqngkN7HK0YWc
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 08:42:50.4278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08506f93-a149-41bd-4961-08dec7956bd1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8227
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_014259_624531_8A4CD975 
X-CRM114-Status: UNSURE (   8.44  )
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

The arm-smmu-v3 probe teardown mixes devm and manual cleanup, so resources
unwind in the wrong order. The IOPF queue is freed before the event-queue
IRQ whose handler uses it. On Tegra241 this is worse: devres frees
smmu->cmdq.q.base before arm_smmu_impl_remove() runs, and the CMDQV
teardown then issues a CMD_SYNC on the freed queue, a use-after-free.

Patch 1 moves the remaining manual teardown (IOPF queue, vmid_map, device
disable) onto devm so the unwind order is correct. Patch 2 adds a
device_disable() impl op and uses it to quiesce the Tegra241 VINTFs
while the CMDQ is still up, fixing the UAF.

v1 is here:
 https://lore.kernel.org/linux-iommu/20260529091052.317102-1-skolothumtho@nvidia.com/

Please take a look and let me know.

Thanks,
Shameer

Shameer Kolothum (2):
  iommu/arm-smmu-v3: Manage teardown with devm
  iommu/tegra241-cmdqv: Fix CMD_SYNC use-after-free on teardown

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  1 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 54 +++++++++++++------
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 15 +++++-
 3 files changed, 52 insertions(+), 18 deletions(-)

-- 
2.43.0


