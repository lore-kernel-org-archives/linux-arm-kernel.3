Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46840CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 03:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RYam0oKHZ1mefmxNauzbtEOzCh2XsHG8uF8K+fxc6yc=; b=MyIRc5TNCJyXzW7h30NSpET8mJ
	2+zVQ/qmTcTX42A8Bq/larUbtDxNbHqGGy9NvHtsddt7oX7NgLP72A62HgpkwqtwC+cVpPSu7aCyR
	p9slJMKH4rCVkOtfRm+FySALzaw10nhQI4mSJOqo76judqw0dQ66lUVPVO1heRNs544nODaKP8d/u
	h3f1yh/s3TRSu7gq6WRGg06BjN/cdEAb+nznPV08do1ebJnLmVqPKpLkbew8aaV8FN3NP067CbcaM
	4s0+Sa3Zsrdime43Zkq2kdVBlV5scHgAtbLMxC9cUqguovMIO4yHZRjdWquxKTaS2QhiYA4roL0kr
	QnlSQijg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Gy-000000012xR-3cg0;
	Wed, 13 May 2026 03:28:36 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Gw-000000012wp-1EQn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 03:28:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmmPmpJVN4Q1p+zljiz55gG/Y+2jiZGPnGcEWyYnP3YNATm9bzOuuI8s5bo/9nd9X1CcORG5qqDrGXliD3vFGDaGXcYqzzZ4fybKBEm4kv7LIHqt5XQ3k5EjN5npvIRaJDMwpysngptpJp/ehN64QN7mwnOivrtO8QPkWSFKapuVOVi0UVgIs3WEWnTaQ1I8qaQ46W+T8nQxhp0XElzTEl0l9wvtyF60su/KhGVuW+JmRXOLVfLZVoK4int0LNr1GCQVrjFfBLomGfcRpQqHDCY4HM+65nRyMqKR5Hd+PIkrzRtnsSIoaA/ZHzxsgChJkCyyhExCFYsMUdTfnknqEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYam0oKHZ1mefmxNauzbtEOzCh2XsHG8uF8K+fxc6yc=;
 b=BtzWUYWhe7oID/W2WeLQYyZZJCen5/9F7Gd/72iN0VQ3CFqz+X9rW7GHC8FFHizEuCabCcUErIrQVPHT5obgsfuLLxGWQrH55oL6qNkhee5RPQUAhxJ/AfkmIrw4Y9USStBRFAdy5urXM2ThhT7bmmL6/fqVmUSn316HsDCA7UAsxXmlSpSNVRzoj6MxNhOxSQGZg7BICcWg3/X0JWNdVgvIZbs2UM/7GWlLf5ZRBz8UMXtXwknWL4eejK32vNPvmU8sLf1vRJdrTfZn0hTlVbvVYFIRKLtCaSKLZg4bl/19D0QH28mnLw3cVskJQcokdkv3U13h5kjgPq8b28gy6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYam0oKHZ1mefmxNauzbtEOzCh2XsHG8uF8K+fxc6yc=;
 b=ipNc54zQuDHEKfGU9zg2Zt9g74U3VLJPAzrVaZIx9EYrvH6pIsNteVZysNCH+haArW/T5AMI79ZTKISis3RSPrDjRh3AL9eBB56eSLtbXr/DUhunlnTUhI/TWidm50VF5oc4kWDPAogc4up/xDVTlFImRVKdN1ODH/Hfk6wOk2AO0ELt/iucovIH1fRAqPvnJ27fquGym5b+79IW0xr88kkTZKGUo6Dxnve9lIXrERkXA8fdA/cyMExSlzBBf9HXVEFYCevRSJl8bXK5ShfqzipsxTDAvgW0cHDbl8pUVGfh3MaZeTFOIMnytjGJ50Q/Ny8SzEc79W1gdJqJjBZiKg==
Received: from SJ0PR03CA0065.namprd03.prod.outlook.com (2603:10b6:a03:331::10)
 by SN7PR12MB7912.namprd12.prod.outlook.com (2603:10b6:806:341::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 03:28:25 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::8a) by SJ0PR03CA0065.outlook.office365.com
 (2603:10b6:a03:331::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Wed,
 13 May 2026 03:28:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 03:28:24 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 12 May
 2026 20:28:10 -0700
Received: from localhost.localdomain (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 12 May
 2026 20:28:09 -0700
From: Jamie Nguyen <jamien@nvidia.com>
To: <sudeep.holla@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jamien@nvidia.com>
Subject: [PATCH] firmware: arm_ffa: honor descriptor size in PARTITION_INFO_GET_REGS
Date: Tue, 12 May 2026 20:28:00 -0700
Message-ID: <20260513032800.68807-1-jamien@nvidia.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|SN7PR12MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: fcc90193-4079-46e4-80a6-08deb09fb104
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: gxNc5SKGCaNnNnmkrtL2WhjvSXbrOfGRuB9kqA4Olb4llKZI9mrp/RCptjO1h6qA2RdomcL+oDW3c34BOPHeSK+d+9RFbJ6Pe/A3FNbWRhTaFPT6QPQnOMDxHGOQ1qL6NLF/Q0C9omte5aiKdf5IQfUvABjK/D7ldogRrwFlo63O7OTokymHHUxksE8mnWq+KbeWo880XkDuCi/U78fzFyLSjx8P4eHmc6ZSNVelYiHmupX1g1xR800GCRcdtAnrqMLwdZhAGBIQWLTzwuCQWqQXliXon3j3/mOg4o/eWicgL063bGiubk7lzK9utjU//R/cf8rpRfdRblrBafTed7fgQAHIYMQvb3d8XzyS369UvFyoN5GRqtN1OnyJOnAfos2eeYE12rGzwNBx6QfX+Njl5x+6s06uUgE3tmDOjPZd+mJ0eMbDYRS5QmXbUW91p9ynwbs9agA47a/zn5ocBkmYMCFC82LxXWI2mdHgChcqnNCTUB8FqXvnBViM70mPcw7famK1kT0+/p2SRns8yza9agFT9jLhn1ijua1NYqTQUtE7ofQeDN8e25lrax7X7YfAzcxjXc0WKf0iRKiAqKw4JrDQwJfVryqh8+F0uBTXqc2rp6eQbn1CKRcJ9dTIH06GmrqZO8YX/SKmjZZFFEO+vq3W/z0fxtt6gUV8VEMJzKdrHv4Oyy3CREEF0aSE9cTpjmB+Zu7qwKzJ+Imp7jFmgz7LSCjeoiKDBhBy3Jw=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UvMxju9++HYaoYnLHGGTWSCKv4OMwcsA+7E5v+rJWQMgjxPU2GX5jo+jV3FUS+LeGDWfFMZlI3GQdfe8t6SYvOx1yF35bL576LDG/TodwKztuAosvNluj65E5pG5DZU6u2KRHMZi5Q3WxKZ03q7o+2jglfFDbzVBK7q19YtfC17rrEMhiHQI9y2uFs11/DiaUTwZXJSWxA50ih9iUVlvLMkVNv55LICLLn3MxWEUlH2Jq/CWbYj4rlzS49kO+Z+fmh1252nP45B9IghNAm7Kjh/W52Xl5/GaLXHoFdzzPefRmxON1mk4SwyZYi1pQ3o5H097pUvOz8lEbv0vr8zR68GHV8JJrzJSCzqu1XFcoasBnvtkYNuHRxIDeuXkmrEH3rdqNBdKFDHNSgBIbyYjNlQE77/PHo5NPsYEs2dJFyhR2jH4VdB389eGmTLqhBSn
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 03:28:24.7925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc90193-4079-46e4-80a6-08deb09fb104
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7912
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_202834_346789_D1BB5504 
X-CRM114-Status: GOOD (  16.25  )
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

Use buf_sz for the stride, and bail out with -EPROTO if the SPMC
reports something we can't safely walk.

Fixes: 7bc0f589c81d ("firmware: arm_ffa: Fix big-endian support in __ffa_partition_info_regs_get()")
Signed-off-by: Jamie Nguyen <jamien@nvidia.com>
---
 drivers/firmware/arm_ffa/driver.c | 35 ++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index c72ee4756585..b712e8a03dab 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -321,6 +321,22 @@ __ffa_partition_info_get(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 #define PART_INFO_ID(x)		((u16)(FIELD_GET(PART_INFO_ID_MASK, (x))))
 #define PART_INFO_EXEC_CXT(x)	((u16)(FIELD_GET(PART_INFO_EXEC_CXT_MASK, (x))))
 #define PART_INFO_PROPERTIES(x)	((u32)(FIELD_GET(PART_INFO_PROPS_MASK, (x))))
+
+/*
+ * FF-A v1.2 section 13.9 Table 13.40: registers x3..x17 carry the partition
+ * descriptors, i.e. 15 u64 of payload per FFA_PARTITION_INFO_GET_REGS call.
+ */
+#define FFA_PART_INFO_REGS_PAYLOAD_U64	15
+
+/*
+ * FF-A v1.1 partition information descriptor (FF-A v1.2 section 6.2.1
+ * Table 6.1): id (2) + exec_ctxt (2) + properties (4) + UUID (16) = 24
+ * bytes. This is the minimum size the SPMC must report; the kernel reads
+ * exactly these fields and ignores any trailing ones per the forward-
+ * compatibility rules in FF-A v1.2 section 18.5.
+ */
+#define FFA_PART_INFO_DESC_V1_1_SZ	24
+
 static int
 __ffa_partition_info_get_regs(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 			      struct ffa_partition_info *buffer, int num_parts)
@@ -353,8 +369,21 @@ __ffa_partition_info_get_regs(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 		cur_idx = CURRENT_INDEX(partition_info.a2);
 		tag = UUID_INFO_TAG(partition_info.a2);
 		buf_sz = PARTITION_INFO_SZ(partition_info.a2);
-		if (buf_sz > sizeof(*buffer))
-			buf_sz = sizeof(*buffer);
+
+		/*
+		 * Per FF-A v1.2 section 18.5 the SPMC reports its per-
+		 * descriptor size and consumers must stride by that size,
+		 * consuming only the fields they understand and ignoring any
+		 * trailing ones. Reject sizes that cannot hold the v1.1 fields
+		 * read below, are not u64-aligned, or would overrun the
+		 * x3..x17 window.
+		 */
+		if (buf_sz < FFA_PART_INFO_DESC_V1_1_SZ ||
+		    buf_sz % sizeof(u64))
+			return -EPROTO;
+		if ((cur_idx - start_idx + 1) * buf_sz >
+		    FFA_PART_INFO_REGS_PAYLOAD_U64 * sizeof(u64))
+			return -EPROTO;
 
 		regs = (void *)&partition_info.a3;
 		for (idx = 0; idx < cur_idx - start_idx + 1; idx++, buf++) {
@@ -373,7 +402,7 @@ __ffa_partition_info_get_regs(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 			buf->exec_ctxt = PART_INFO_EXEC_CXT(val);
 			buf->properties = PART_INFO_PROPERTIES(val);
 			uuid_copy(&buf->uuid, &uuid_regs.uuid);
-			regs += 3;
+			regs += buf_sz / sizeof(u64);
 		}
 		prev_idx = cur_idx;
 

base-commit: 38edeaf4dcf3d8381ba801e494ba03179c145c70
-- 
2.34.1


