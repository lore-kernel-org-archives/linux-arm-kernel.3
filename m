Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F712C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 04:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aysRR87v6pz9WttepGyeFsACEanROhELe6zx1c7a9+s=; b=cpVUT8+kDoEqGSq5hN5wwTuvWN
	2F0Dt3/+gAP13bnIqYmkKDjQR26mh8dATuuxWn0ElBgYBWUngfwPYzEIbZuxUolpEz6Bipcw+WFjc
	sU7IaY5fbE2avl93Qn2UWotFHCB3jtMOpXJglm/BnYPjFs9Coz9LL1AGjP7sArKKZ4mjE3D+ArlAi
	ClTiOs6WkLvsoVIFJ+I2dlxfam4hfx7NTxc3Zw7teWTH+9xOMWu2ncDVoTy7Iy+dMkvJG+Y/HJ4U/
	ioze6Qxse9TvKdS3YUAAbnncspeJHn2+HaUJVLhCus37ocQjUoQYRfzZExDfWboRBfXXajU/IiTot
	X6izytpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weQY7-0000000Fnxl-0IU7;
	Tue, 30 Jun 2026 04:58:19 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weQY4-0000000Fnvc-0nvO;
	Tue, 30 Jun 2026 04:58:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xKwjE12MqE7Vn82wvJFQzxU2M80Yek9TBhzjP8BwQ7hD2CayX8np18VDbJGqz35DDRgUtgnMLs6dWlQaDvhDhZReFnR2HeQ+v/dblM7MPG7fNJgd5k9A/GBfzSXQZS6H6tNKH1oRNkjjuM7tubOSylDUenLDyHzbTmxqEpxCW0SkyOB0ulg8GikcgHilGr+61dH2J9qtWa+cyu5mga6uNoHYB3Z/XPKJoUNMai2+0PhihcwOYusPHbIaLBj3NLs1ZbplABajEyUkQyeEQKgfioUIrVzdzzye22dmjGf13RoK+VOXhWBWjC/rNppYO+VDmaXV736d9kocaE1RZgrgbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aysRR87v6pz9WttepGyeFsACEanROhELe6zx1c7a9+s=;
 b=wYolzUphsIaL7JGRSNgn3MGjTxilOx1W+ufWnoVZBRJ4dS6hP8sM9gcOvlLunpzeFMB8aAczwtyqzAcHx4JkFmnEEcBnb6Xo0tNyguDBoK0ChXGJSIktwtypKpis64JhrL21G8foeNR6Ar5bFxugzjSQrahekjU3YU5NY1TC7hTFf5sHuLVIwgGhZUaIoIu7OWVRHKTb78/DcuhhXWPIJAfizFx8uWm6MNf2i3hIA5QS6sd0aqubiycEuI3npvMmEKbZIugcMQb7dMdCs0fQqwz5wreojdwijMd9V3zgOrnwb0dDug2RSKGkkeppVz8MWGw2QCkh/N0Q9tkX4FwUrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arndb.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aysRR87v6pz9WttepGyeFsACEanROhELe6zx1c7a9+s=;
 b=FieBjttqkS8s9bVpLpeo7DhUKrjPKcmTS1xwmuoL1fs2BhR3a3qXdlz5wLnZf/PCJmy8PPDUbMNPtOtcXlkNPHDyL7X8yy0EICZC0XWjKxVhPW/7i2LPGtmAGbi43sj2Cvq1lqKyl0Jw1MEHjXswuGqzgFbevp+IAMXeakx4KsU=
Received: from DS1P223CA0008.NAMP223.PROD.OUTLOOK.COM (2603:10b6:8:453::18) by
 SA1PR12MB999229.namprd12.prod.outlook.com (2603:10b6:806:4db::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 04:58:10 +0000
Received: from DM2PEPF00003FC7.namprd04.prod.outlook.com
 (2603:10b6:8:453:cafe::48) by DS1P223CA0008.outlook.office365.com
 (2603:10b6:8:453::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 04:58:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM2PEPF00003FC7.mail.protection.outlook.com (10.167.23.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 04:58:10 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 23:58:04 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>
CC: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Samuel Holland
	<samuel.holland@sifive.com>, Charlie Jenkins <thecharlesjenkins@gmail.com>,
	"K Prateek Nayak" <kprateek.nayak@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>
Subject: [PATCH v5 7/8] asm-generic/runtime-const: Add dummy runtime_const_mask_32()
Date: Tue, 30 Jun 2026 04:55:30 +0000
Message-ID: <20260630045531.3939-8-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630045531.3939-1-kprateek.nayak@amd.com>
References: <20260630045531.3939-1-kprateek.nayak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC7:EE_|SA1PR12MB999229:EE_
X-MS-Office365-Filtering-Correlation-Id: a77fbc63-5dc8-4a1c-2c27-08ded6642eb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|23010399003|18002099003|11063799006|22082099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: GZO6cuigAWGBzrIeyYRxVjNDjjlvnREIAJe0TSfd/+u2/cs+IRXwNaFkH0yPO+8AHF16R4dg75HPn4MKhK54IrYfXmQkd3WxNwwF5dzoJCYoRFIsJ23GZmBaKz9YdbNaiz9W/Rkmukky6OgGOvCibRi5sDHBkB2ABiGkr1ezJGz8McGGNTJrzB9hu2B8asTHj4N9ioXKIbpPlQnNM2nF+6wdxgj6Ziv0X8hWIYihZKep9TGI2bBSKqXUddpL/A82L8/WF2a9hDiK28Io+q8QPG2pD7houBrEftpEZatnVj/rSXIft0WauzwRRb6HCvzQbtGVe0L6kXxKvG1xUD79qIBlWu5+J9Rkk1bkjM0cKUkl6Y5WjlJJuzKEjJyPPGrXpT+VpSkWqS58C5LZUbzSbuADwGc5NvP9oxuPHUgegCTCL1oKTcvXNaKZZGWhherSoie7WID8OA41ScEcSfErxJIe3NoqXawZT39i27+/4BcK6W6/R3ljxX6zEv2fm7IZBbIVp3rOA3R8IcSQGjZYhevnh3+vrbbcNPFnMYVpEFh5xZ6GQ+n2C2KF+mzlTOIPC0iQGhAA1XB1+Vb5B70+YJa2KG/Qym8ajyG39hmrbzPZgrNibE4wVYYPI26oZmeU/WvCATcmluNuuo8k5yIMMRutyBWhgWxn6DTX4n+uAW8=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(23010399003)(18002099003)(11063799006)(22082099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OET/SnLVwS7AlRCBnlmlf3Xn3godwsf7oORVjA+IVVW469VhjTYzqyqdDSJ9nOFWqmsPffMjbJKDF8PhFsf6hgbSQhHw+gjZpAHOUn/xmpq3glY2AQv2qCNR8dEAdTufMkiEDAiDYGq65VfOiHI6X6t92wJb63I3Gy+OOUfX+VQ9T6mfE+VGhZjZoMEPpRB1Brc083cg/BLB4OpYkgiLAp4Gjmxl9zH6MSOm8b6ks5srS4tYs37vsGggg5pqMPO65bY9NFSFqLzk5dLglio/R5N++XwtGP019mZ9Yw47wJlOXBgmMbl1bgeOwS8+y0hsJ7sVeSK92Ia1TcYDO4TYPlt+nDeayBRTBi6P09GoHDnUUsOz2hewFQm+Znrdd0LfMM2rGMVdUO1WFNok/cXIFlp+6y15mW7hSvFFCa8Op3pFE7X9MTNe4oAjCcIeP/7v
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 04:58:10.1577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a77fbc63-5dc8-4a1c-2c27-08ded6642eb8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM2PEPF00003FC7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_215816_234766_39689F38 
X-CRM114-Status: UNSURE (   9.73  )
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

From: Peter Zijlstra <peterz@infradead.org>

Add a dummy runtime_const_mask_32() for all the architectures that do
not support runtime-const.

Link: https://patch.msgid.link/20260227161841.GH606826@noisy.programming.kicks-ass.net
Not-yet-signed-off-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
changelog v4..v5:

o No changes.
---
 include/asm-generic/runtime-const.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/asm-generic/runtime-const.h b/include/asm-generic/runtime-const.h
index 6704994595145..03e6e3e02401e 100644
--- a/include/asm-generic/runtime-const.h
+++ b/include/asm-generic/runtime-const.h
@@ -10,6 +10,7 @@
  */
 #define runtime_const_ptr(sym) (sym)
 #define runtime_const_shift_right_32(val, sym) ((u32)(val)>>(sym))
+#define runtime_const_mask_32(val, sym) ((u32)(val)&(sym))
 #define runtime_const_init(type,sym) do { } while (0)
 
 #endif
-- 
2.34.1


