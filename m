Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FD2CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 20:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nBuIeX8tQtefHJffIoyh2L3hKZqnKtvvK5N0oXNmfJk=; b=i1JKGF3LccpW2vR9bqVcqky+I6
	dSHG9TcpNlGtm599ewtolv2sTXkVq1pW18ZxRgtlJ4jOsx/MKY6V2NjmZyh8f6+i7TgM0VXSzvrsc
	Xnf+1E+TmOiy1Bhb6NldC0MmL7xOr9ZNCGuyDlkuw+09V+2S9s452ktaeB7vByvPvZF4yOo1sXDxn
	uXWcEYXrg3C41g4QkXsm+OVBpo+BtW7Vh+tJ4PB8isojH3pMXqYq2Z63WEO6glvXlv+6uf4GJSam/
	AD8UnHjq9M4W5MIiVSpO8tXdIvS+afZ/n57xQhWvLIDuHZrrAYkqnr03+dNXvMAn0CnSxC1ATeNzi
	EeRpMfng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP4d4-0000000Gtk5-3izY;
	Mon, 18 May 2026 20:31:58 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP4d3-0000000GtiG-0QC5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 20:31:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UtTflidvMZyoN1Wnxt5Qc7zI2DUrDX9E1Y6BtXAxp6RQWDNaBU6IKSYPswQ94F+NOls1ox/4x31Z+kFRD3oTNMZz6bxMkCl78FmhMOnQo8pa4hADjXd3r6zEDX4k4XFaIb9VXfBbL9bKB9BGUdVW6GlM5FlXXzf+KjSBObpjYocb0cREF9pmj0+RLXWOFqZfyyqybfcsptj6vEaMcLmgIEvG5NwtEboMeG67BJvGPQtRnfwF5gjYJvjJ4GDKzDAWjToNEM7MhYDQnDuUUgDbVD4j7liH5iXQvbWYxYvZWGEJ7zNeSWbsaEXBSxBJICbe2XaJag7SZ5mjxgkDVz7g5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nBuIeX8tQtefHJffIoyh2L3hKZqnKtvvK5N0oXNmfJk=;
 b=bjLopvbSxubiI+shrIUtsqyxeHawXqLe8AzjFpXpvR0/MwxqPutWbp6A74LKX89pbtRB9zYgkEc/+gAMZPGVacuJvMdx2RWpDCNAVLq3x10CdL6rbQjktcC3EE4ZZBe8DmmzGzOQGboDHjB3BKkRotP7MEL09vDl1bOSjP56kk2eW2V/rfXXv+CFSG1Zc+YP1HLizOEygT46/KgN8DBIlFQxToXhxLNUwlo2vzh3CEPodFSwnqbKtHs/EGgPjFdLUfXH5vlxYgYTUHAmo2fspaqtCvyiKHoKnZdAyF1FPf2NKmZTc5k2swbKKVpBHN7eDovLcn0s7dibxf9bEp6+Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nBuIeX8tQtefHJffIoyh2L3hKZqnKtvvK5N0oXNmfJk=;
 b=UHcSvWAGkbhb8Wo7DJEmFIE68POA7KtFXJDQ/V030raC5ddigAxH0lw5Hkrk+V9UyDx3IashXVDZjhcxg1TFl3B4t00Ni7UhXmb1l9x8wIjRiAHG63Vvvzd/KASw/9QPbtrtTxRoEQFFtD08s7clX6n8cTaUqKWMpSutGzcGQfhJM6JYVXSl2tR70gh6vq2NoY4TS0geNpS8iHfmjvCViYPPeXX6ORcVbTWbtv3psJsCR45F1TdEvXHtfe8LbmbuHG0SJ/1ZRF0Oe8AKWbhlN22pV6mdfhJZL7bmI+QqbesgLz6BzAn5/sxM9GWzRu7uQ36ocA07S3NOb06KX80Jig==
Received: from DS7PR05CA0052.namprd05.prod.outlook.com (2603:10b6:8:2f::30) by
 SA1PR12MB9548.namprd12.prod.outlook.com (2603:10b6:806:458::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Mon, 18 May
 2026 20:31:49 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:8:2f:cafe::a0) by DS7PR05CA0052.outlook.office365.com
 (2603:10b6:8:2f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Mon, 18
 May 2026 20:31:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 20:31:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 18 May
 2026 13:31:27 -0700
Received: from localhost.localdomain (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 18 May
 2026 13:31:26 -0700
From: Jamie Nguyen <jamien@nvidia.com>
To: <sudeep.holla@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jamien@nvidia.com>
Subject: [PATCH v3] firmware: arm_ffa: honor descriptor size in PARTITION_INFO_GET_REGS
Date: Mon, 18 May 2026 13:31:16 -0700
Message-ID: <20260518203116.42624-1-jamien@nvidia.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20260517-cunning-pony-of-happiness-cab79d@sudeepholla>
References: <20260517-cunning-pony-of-happiness-cab79d@sudeepholla>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|SA1PR12MB9548:EE_
X-MS-Office365-Filtering-Correlation-Id: c9336118-94bf-4e31-7bcf-08deb51c7bb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|18002099003|22082099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info: b5IayLioxYfhqXS4dcFM9PI6NHphFtSYOY9cQoPfa3wunRk927kBIFZWmSOIwySjwqP4oyE96fvoLd+j5ZjcOxvenBVZakPlDRsibcbgdFDA+NLtAovPqMyjzV+kL7sYxseG7T4BZvOkodSx/Gho0EYWp1jT3kXVWoN9MJzb3o4Pm0cgwn/fYI6jWYfiQdsh0KZl2otuUWAvexYaZTOla5SwG7mLnsIvvCWd8iyrlynKgKwmhzxhluOJpJq5dkGtLxUQZBvetgUm4zXx+P9ZRtlmfzKo792ZlxajnDY+bfup/O0Kgv6KXvBq3bV74LApAxil8lkfGxDlAZa6+PzQK4bCBXS8OgFe7bK+GqgFvEc4aEY5d/ZJ9OUDGQ8pBTNyoOSbo/mjb5fah4mVpyMFV1C/6D/X7OHKGPR90qe6STeiE0CBOJmPr3ozo0XtC3sGw0Jhyh6ci9YssUOm6EBdSSZGCIz+s9SOvXWRKoGGJf6zLI8EZ5lmfKVUiHTX2DF177kIwUQ+IHncVXox+bZiOoCkQw0NpLX2WJ+baDji17pU0K9ygWoryurmyVyJQuizYfXxhTXeU9TkLnjueD5Is91Jj+ov3UoenHivVx3QVWNr+HswN+GUNvtCehJIq3a77hFPptIEF0mLocJ/Ph/Q5QdBi/KHgAU6rK1Ls3NFNmsOZ1NZLMJ6e+igAqBZKQjL5jh4m/JMgr0naJbEaUbjmwH1IIjzUuq2Up9n79qZG6k=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(22082099003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KhLhmh0x4EWNki/aXV4jS1CXGD9U6hz4HeZCJsAu1lbBHiTscqmueT1XwOnn65ozZ3FVdzAWO/q4N6c/5TBof+KivwleroylFv53Vld87b1wwL2SRUrmupiL0n10CY/99CMJKHp8fF9J9EQ3EXuXkiPaKFmJhX3BdFcA46loCKN0+RSpFi04aZ5IeBiL/2Q9lkoxtAToqWBSEW9wkdeWXvV5/nRiWZ/q46f9Yq4zuI1QFRkBtrB19GLHt9qLmc4Gz56o7JWUhQRFoOCArnUqhZqIuEHU3x6piZxNP/uCgdifxfUScWUrAdPj1UkFE7JbaBuRD7XlHSw3A61UgXD9FOSkKDpWd8aGqIljBo67y1CBMc4/mh3IsE1jLkQIdjWxUawux7eHmhGufRWipSc45xQvCwsN4/alLicvqYtPCQr1JKJVwn36SDAyhpih8nRR
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 20:31:47.0819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9336118-94bf-4e31-7bcf-08deb51c7bb3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9548
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_133157_149507_8D94AA69 
X-CRM114-Status: GOOD (  17.13  )
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

__ffa_partition_info_get_regs() walks the response with a hardcoded
24-byte stride (regs += 3) even though the SPMC tells us the actual
per-descriptor size via PARTITION_INFO_SZ in x2[63:48]. The size is
read into buf_sz and then thrown away.

That works while every SPMC returns the FF-A v1.1 layout, but it falls
apart against a v1.3 SPMC returning the 48-byte descriptor. The loop
strides over half a descriptor at a time and ends up parsing every
other entry from a slice of two adjacent ones.

The FF-A spec (v1.2, section 18.5) says that the producer should
report the descriptor size, and the consumer is supposed to stride by
that size and ignore any trailing fields it doesn't understand. The
non-REGS path (__ffa_partition_info_get) does this already, and the
REGS path should match.

Use buf_sz for the stride, and bail out with -EINVAL if the SPMC
reports something we can't safely walk.

Fixes: ba85c644ac8d ("firmware: arm_ffa: Add support for FFA_PARTITION_INFO_GET_REGS")
Suggested-by: Sudeep Holla <sudeep.holla@kernel.org>
Signed-off-by: Jamie Nguyen <jamien@nvidia.com>
---
Changes in v3:
- Per Sudeep's review: drop the explanatory comment and split the buf_sz
  validation into three named checks (u64 alignment, minimum size for the
  v1.1 layout we parse, fit in the x3..x17 window for nr_desc).
- Replace FFA_PART_INFO_GET_REGS_REGS_PER_DESC with
  FFA_PART_INFO_GET_REGS_MIN_REGS_PER_DESC and replace
  FFA_PART_INFO_GET_REGS_MAX_DESC with FFA_PART_INFO_GET_REGS_NUM_REGS,
  computing max_desc per call from the SPMC-reported descriptor size.
- Drop the now-redundant `if (buf_sz > sizeof(*buffer))` clamp.

Changes in v2:
- Rebase onto linux-next; reuse the
  FFA_PART_INFO_GET_REGS_{REGS_PER_DESC,MAX_DESC} macros it added instead of
  introducing new ones.
- Return -EINVAL instead of -EPROTO to match surrounding checks.
- Update Fixes: tag to the commit that introduced the hardcoded stride.
---
 drivers/firmware/arm_ffa/driver.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index b9f17fda7243..cab32cfdac42 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -324,11 +324,9 @@ __ffa_partition_info_get(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 #define PART_INFO_EXEC_CXT_MASK	GENMASK(31, 16)
 #define PART_INFO_PROPS_MASK	GENMASK(63, 32)
 #define FFA_PART_INFO_GET_REGS_FIRST_REG	3
-#define FFA_PART_INFO_GET_REGS_REGS_PER_DESC	3
-#define FFA_PART_INFO_GET_REGS_MAX_DESC \
-	(((sizeof(ffa_value_t) / sizeof_field(ffa_value_t, a0)) - \
-	  FFA_PART_INFO_GET_REGS_FIRST_REG) / \
-	 FFA_PART_INFO_GET_REGS_REGS_PER_DESC)
+#define FFA_PART_INFO_GET_REGS_MIN_REGS_PER_DESC	3
+#define FFA_PART_INFO_GET_REGS_NUM_REGS \
+	(sizeof(ffa_value_t) / sizeof_field(ffa_value_t, a0))
 #define PART_INFO_ID(x)		((u16)(FIELD_GET(PART_INFO_ID_MASK, (x))))
 #define PART_INFO_EXEC_CXT(x)	((u16)(FIELD_GET(PART_INFO_EXEC_CXT_MASK, (x))))
 #define PART_INFO_PROPERTIES(x)	((u32)(FIELD_GET(PART_INFO_PROPS_MASK, (x))))
@@ -342,7 +340,7 @@ __ffa_partition_info_get_regs(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 
 	do {
 		__le64 *regs;
-		int idx, nr_desc, buf_idx;
+		int idx, nr_desc, buf_idx, regs_per_desc, max_desc;
 
 		invoke_ffa_fn((ffa_value_t){
 			      .a0 = FFA_PARTITION_INFO_GET_REGS,
@@ -365,8 +363,18 @@ __ffa_partition_info_get_regs(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 		if (cur_idx < start_idx || cur_idx >= count)
 			return -EINVAL;
 
+		buf_sz = PARTITION_INFO_SZ(partition_info.a2);
+		if (buf_sz % sizeof(*regs))
+			return -EINVAL;
+
+		regs_per_desc = buf_sz / sizeof(*regs);
+		if (regs_per_desc < FFA_PART_INFO_GET_REGS_MIN_REGS_PER_DESC)
+			return -EINVAL;
+
 		nr_desc = cur_idx - start_idx + 1;
-		if (nr_desc > FFA_PART_INFO_GET_REGS_MAX_DESC)
+		max_desc = (FFA_PART_INFO_GET_REGS_NUM_REGS -
+			    FFA_PART_INFO_GET_REGS_FIRST_REG) / regs_per_desc;
+		if (nr_desc > max_desc)
 			return -EINVAL;
 
 		buf_idx = buf - buffer;
@@ -374,9 +382,6 @@ __ffa_partition_info_get_regs(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 			return -EINVAL;
 
 		tag = UUID_INFO_TAG(partition_info.a2);
-		buf_sz = PARTITION_INFO_SZ(partition_info.a2);
-		if (buf_sz > sizeof(*buffer))
-			buf_sz = sizeof(*buffer);
 
 		regs = (void *)&partition_info.a3;
 		for (idx = 0; idx < nr_desc; idx++, buf++) {
@@ -395,7 +400,7 @@ __ffa_partition_info_get_regs(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 			buf->exec_ctxt = PART_INFO_EXEC_CXT(val);
 			buf->properties = PART_INFO_PROPERTIES(val);
 			uuid_copy(&buf->uuid, &uuid_regs.uuid);
-			regs += 3;
+			regs += regs_per_desc;
 		}
 		start_idx = cur_idx + 1;
 

base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
-- 
2.34.1


