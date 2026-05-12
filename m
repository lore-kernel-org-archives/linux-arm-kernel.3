Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194B4CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 17:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRF6UMbD7gHAfz+mfsh04yBmU5UhdpxMGElasyMA54g=; b=ETo9RtF6t6YWRXgqvYohucIh5R
	baQcK73xDNmL5AiZEKZAMkNyuQYPw7YJq3SUGNCErA48J0BPcqy7k2ghLjsqB5tQJZrF9YL67Xi1N
	1x3XCaqgA7U5YJQ6VIIoK5RMvRpQwiiY0acusWfEyMaKg8tyQ/fWo/8kS5R6wZ5grOyZA9sXrOfWx
	/rIES/jTpPe5LqcxlJqYKnVnirTonqXK+hSaRCrM8scOE9KBeNkAKdlLvPPZq0wSo72HHxBlp0ZHH
	VPLYdFasHZKlZgEFNUG2JTyHsez19XMo2hDMBDuWCKvKn2mTHcI2+R8HzDN992V+Dv1rxSkUED+/k
	+X2uIiLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqZT-0000000HULd-1l9q;
	Tue, 12 May 2026 17:07:03 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqZQ-0000000HUHL-0v5C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 17:07:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvYVFLuWBt5wS3x3ez7Z239DFfjzfiA+yOSbJqwFShQwUZ4kmHmkk0mtyLG8tH8RMTgi/gOrJpfeZi2LGp/xxq/mmHwm8f1/bgCDgYvA7ZzT8s5DDZsSVMqkA1R6ojka3X/h09V3Sz3DmDREpwpoLJrGjGZ88TmYcwa8G55ETPx9j/Add8n/VS6t78amHS1JvyeaiG47+iBW3XdSofsEm3+C2vObnLQqCAC3NowZ/Dkj5KB0d/49QoapeXJbrEE1BQ2LfQnTw+xc7/yoaFXyqpe/IBdNzhfuj5nuljesmvkoLALq2NcFYYSWgfCvw0BLXFEKOyQ36tXCyhGjwd637A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRF6UMbD7gHAfz+mfsh04yBmU5UhdpxMGElasyMA54g=;
 b=jtEUwlj0RjMKkVrr1QVxxwKdcSvNN4GeA5+miBlM0y4DoJlM1kCx3NzjSE0CZKXYuwqN1yaVW85gh+vmRnHJ+960WkhdtHmRxbXueGf0arCYw4Qn07wXVoog5b+HUaet6kl6NUDwUAy/2J4jQyn/WvH8vCSemTa+0Lp8WJf8ccrA9e06fhzBokctU7tRo7oYgSvZZydKMf2YwaCsBBWYP3fIJAqkhv4sIn9VWJ0HBGL/LuLC+4r1gb+Iwqds8Jkpbn/SQ2uNPILtXh072YEYevmLRSHQ7PKiaODmUkMZsr0dn448jvjxpCotq6neA3XbT6pRqTxlij2+tjMM4MxNnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRF6UMbD7gHAfz+mfsh04yBmU5UhdpxMGElasyMA54g=;
 b=Kihdy9Pj/TdVJtis0X1c8cP6C+8UQf9107ctjHLDAjDZwzguGF+iM18IK9pCYuXlHTZFRwNQE+eI3J7ciVQnCHqjzAw/nTIoBDncVsshxIWAzorHDkP0tIhzZgVC37Fe5Ovfv8KxyogtOGSiiwqlPLUFBFr+B2phBXVg9s6fkVE=
Received: from SJ0PR05CA0151.namprd05.prod.outlook.com (2603:10b6:a03:339::6)
 by SA1PR10MB7813.namprd10.prod.outlook.com (2603:10b6:806:3a9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 17:06:47 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:339:cafe::2b) by SJ0PR05CA0151.outlook.office365.com
 (2603:10b6:a03:339::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.16 via Frontend Transport; Tue, 12
 May 2026 17:06:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 17:06:44 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:06:26 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:06:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 12 May 2026 12:06:25 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64CH6P092235147;
	Tue, 12 May 2026 12:06:25 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
CC: <afd@ti.com>, Nishanth Menon <nm@ti.com>, <llvm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 09/11] soc: ti: knav_dma: Remove dead check on unsigned args.args[0]
Date: Tue, 12 May 2026 12:06:21 -0500
Message-ID: <20260512170623.3174416-10-nm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260512170623.3174416-1-nm@ti.com>
References: <20260512170623.3174416-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|SA1PR10MB7813:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df8f611-87bd-4e89-6b7d-08deb048d89d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: vXS5t0wgYLxIdd3oK2ucTmZ4QqBKhywAmXs5JXpCppGnZBlOP+EU2gUVwSNm05zXcvnoUmYlSi9L7urO9mUKEusJPLZy8YPqnyw5L1HjRNM+RLGbJE7ZQgat/Z6xF+aL/7Lzvlga9H0VF/ewpzKTYwHU/x24O14ylfWIcCvCEvUYeUkORcXqs7kYi0a6fw7Tm/9TR72nI4UVT+1tl2QZTTo4jRCHgOjEqaEryJqrdGBNbUiME/MWD8eKra6aaNKGG6Z81AAp8RIIZkzxuVifGtz9hnm5G4v17fbgDcn+cQJNU4OtgweKfPjTsZlXGRQxnaDbKPUotgVHZDYmjOkTxu0mpany4LZQtT4vgYKOJBh26ZlQ3TxPd9UvG9s6+CGstzIw31clXvDH5NG5mAcyTPzRGO7ldQT0aLkgozYcEx7vvZZWgGDFP6XfV7jbm2yeMhagNn/jQlQ30KazsTfTwh1O14r/7XhlNNTIxLJeqLKP4MaYVU8fttvcpz5vHO21asasVN1345SQ7w7vU4UGFysuQ5hqtlhB9CWWGyHYN+zoB5/Bh+kkGzDkiTf1pdF+8nzm5JFF2YoAE3SMWKCUdIP+j69deSUjKNoZdQ/lmo3BHoIMltXbT7zNtY9NaBZC0NvEHuXaSrT7hE6msw8AHjnaWynGfuqhr73zA4/GlcQI2Xbtog+HBJbqbU3KBXGr8UDRH0ChjOJfpIF6skG5KQuTpcp6R9TD1GUS62wUH0Q=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wNekB6HiRjdpeZ3g+3Lb97EuCOEKziC06MZttCLQ5SpMgayWl5wSikv7WwUP2vJkxWFAEJRsdM8oY7eI9ZkUoYyM/f6IpQHfUOyvWcDJpi6BunpVClybvHDd23TXdaPUYfThNsbud+BKQerAjaF9BDfRktPojJRXvaqEBiaLSvbkBAZ/WYOFeWImnRfD96RKiB+O1AVS9jkoGrc52l5MOfRfanuzXOi1owcdbL0JzLBZN38GDNI5LKNJXYVkDvE+eqkiar26yLmbtvTbYar1JkcAxUdqGoQ3eGkaedTYbU+Hb2uvFCZumLYBM1HISPRsEyT3/aQCX1Ya1K1DYb3WJFf27Ldd1x98ODccs8H70fAGZTUrBclh1OkwaOWuoaANIXZv9GkowjwheKLHbWwY6TE4cvj2nOsHcWFxXGU+0QkTWObXwlqVHSO59fnJ6Dt5
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 17:06:44.9977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df8f611-87bd-4e89-6b7d-08deb048d89d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7813
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_100700_320453_15060928 
X-CRM114-Status: UNSURE (   9.44  )
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

smatch warns:

  knav_dma.c:390 of_channel_match_helper() warn: unsigned
  'args.args[0]' is never less than zero.

of_phandle_args.args[] is uint32_t, so the 'args.args[0] < 0' check
is always false. of_parse_phandle_with_fixed_args() already handles
errors by returning a non-zero code, which is checked immediately
above. Remove the dead check.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V1:
- None.

V1: https://lore.kernel.org/all/20260508153211.3688277-10-nm@ti.com/

 drivers/soc/ti/knav_dma.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/soc/ti/knav_dma.c b/drivers/soc/ti/knav_dma.c
index 462d181ca564..7ba6fd58e9ce 100644
--- a/drivers/soc/ti/knav_dma.c
+++ b/drivers/soc/ti/knav_dma.c
@@ -387,11 +387,6 @@ static int of_channel_match_helper(struct device_node *np, const char *name,
 		return -ENODEV;
 	}
 
-	if (args.args[0] < 0) {
-		dev_err(kdev->dev, "Missing args for %s\n", name);
-		return -ENODEV;
-	}
-
 	return args.args[0];
 }
 
-- 
2.47.0


