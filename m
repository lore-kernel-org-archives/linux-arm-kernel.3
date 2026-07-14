Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A92FC4450B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 20:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XmpNk9qGPsz4Qzcw/ZGmi42J4ven8E8cs5INl9cFIKs=; b=G49YNQDqRMpn08RvX2M7pbXPwx
	7EKckBcLUlHsrvG4fPqly2Qhak2izY5zAbhPUBxXI5fchayefgc4gpIG0+GTqPzroSs6FQX39bXxB
	X1vjtLmWXov+gqPEyM2iwBhaXUSaPJASZLgirzVeaQFg7p5oY8tmuuUyUSwjp0IAOtv1sH1MYbVyp
	bvJqpnOyRLIKMdh93nuXRSu7Puw0N3jDlm8vyPJ3yRPJB8JHcd3PsFphF1FSCECi2zUqsZDHeq8Uj
	g6jRf5tG9Tbcwti/ZubE42vNT9GjIVQQiRcDDuaYEYup4XAgjSjYZrykoiDkqWq9mO4sbYKlRvCRm
	IXAr3m8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjkAw-0000000DHU0-3hOH;
	Tue, 14 Jul 2026 20:56:23 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjkAS-0000000DH39-3kNi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 20:55:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIVdruwgK7MjQKfx3BfutRdoZJ0XmGtwfwtRWv5qbhFDQuEcHnunY4tcnb8fegPuuFwkwKpSW662LY1vqhJrPrSxQ6oVm9NzlNht7u/3yhnOnEGC1dlWe1oTUrrXgum+t/LZA/KoqoxFgWJ8te9g+1XvIO3Cs+jYQJyGsZP/sjxrpJVraMBV9DsGllqpgPTDeySuYiBBctwxl8d3MpnsVDJaqTRB3zxl+B51P5jJRBQ9MHLvYYSon5uHi0hrdBHJw9XBDchwU9VWDzggl0ED5A8MCNed0KeftFkAwMd/KIgvzIUlCV5Ilv68zWv92o6RTzPx1i3MDXSZ3XYu9cUAaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmpNk9qGPsz4Qzcw/ZGmi42J4ven8E8cs5INl9cFIKs=;
 b=qj17MmHyLknTBk6kBjOIWlvhCGXtHlp9AbN4a1VIMLXQxYTNQ21gGtlwi6Qw/pqp9mVCt2SfGy7rbnRABrNyKTCD0CLHHozSp+7OS95lV5Hc/ttpSZkz/RCjnPo4MKtenfeIQLlxIUtnrgMBpuJ400HlAJwjLIQp/ovCY99FcAPVirmhox3qHT87HIZYbWKovE3flLZwIDkKNy2a1mu7uNVEXzqZWghheelx9H6XmHPHBJFp25330AR6m/0B1aZH5fzuRKMObPAsn3KL9EnXmtEeAnzPVZPrQAjN/rXexDoP+5W3I/CvBaOGm6HSlwkFTSJJR7fsHJ0pAyjP51nwyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmpNk9qGPsz4Qzcw/ZGmi42J4ven8E8cs5INl9cFIKs=;
 b=Cl9MNCn8fKwff+480sOHLbM/CQbRWUXLcoQ9uciow50narrORw55Zl8QY2n+OC1XCgAO+3mAXt8OSvdXQB0OhnhjnFTQCXiBMH+V0IHbQqGVpw1HGs7T+qq7+oWF9JVqAcdAJdM3l4dgn7vpoWmtBxOZl8SLMZGxAArPflNUzCcG5FMUvmv6qUVYlixttzGhXryj8Ed5MSodAlhemvmbTwZ2z2MhwfUF8j3gaLiFc9qgwRWYqDlKALnOvd4hoa+VNKjCdulJVJ469b4s1aGc1lvsN/F6TgFVaq/M2nzgVIU+qk3yAFPdUoGmsO0RTfnMg+Jx2c3qE52uTltrE9ywog==
Received: from PH7PR17CA0036.namprd17.prod.outlook.com (2603:10b6:510:323::20)
 by PH8PR12MB7447.namprd12.prod.outlook.com (2603:10b6:510:215::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.23; Tue, 14 Jul
 2026 20:55:43 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:510:323:cafe::8e) by PH7PR17CA0036.outlook.office365.com
 (2603:10b6:510:323::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Tue,
 14 Jul 2026 20:55:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 20:55:40 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 14 Jul
 2026 13:55:19 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 14 Jul 2026 13:55:19 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Jul 2026 13:55:18 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)"
	<joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 11/11] iommu/tegra241-cmdqv: Rate-limit the error ISR's log message
Date: Tue, 14 Jul 2026 13:55:08 -0700
Message-ID: <2e9d088c059037d5fc23532820444720b870d2c7.1784059577.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784059577.git.nicolinc@nvidia.com>
References: <cover.1784059577.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|PH8PR12MB7447:EE_
X-MS-Office365-Filtering-Correlation-Id: b79a75eb-52fb-494c-33da-08dee1ea43ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|23010399003|1800799024|82310400026|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: l/YjfowV4yTR96luHjRLF+63+OSZr8Jb2k9HgBLY43gMa/zhSD5Mb1lFa2w7eIr9FHlD4bjLikakhR/k7ZgbUlTFcBAJGAXcI+mCuIGhEgsyOwCvZnFjWgayagKnrkiQb+UfsPlzufHC1Jg0gBOmDdzGUAdVjUzVlMaT9EH1CYmv5moAl0NvQLBpcDYAeVSYC9ketoKZc2TCRlnz7w6u4Tq5xy3PCtpYp3pxNvB7SA9Jt38zAzzgu8L8bxXbG7PrXt+l5AJWMm/Ey2HKcLf1I5xWhKnjW8I/Ep86uIzLOm8K5kiFk/O1aWTDY6pBrmiWkvKG3a+tLbTbI1NnBVL/plwh7Z+Yke36bJwfr1hktXKZUo6P8Iq6tG9xjVoo6Eu3ljaqZd0+OcamSx+ZxswJM+ktqRTI1nMAi07NVde3XLvWCeS+QNI2NjXvIkdUmOF3KBcMM2jpcWJFwaCcL5XiqfFhCFoh7Po+0S/VQnoY0EArv5ws65ZQPYdcRJemeAmt09YLCcpfc/bCAXC0AcVRqCQUsUb+86YzXQK++T3nB9gbvYmG8dxYsBD47BFs4HNddgJR1ul3zFO73RfIbt0BS7E5At6ZFuMOI1bq+Pwcx2dlSHhUOihSDBwiBHBnJrUfRse4oH6QSMeb7yXuKNct5tBYMCFkxc8ipafsNBdZZXatjxo9xN/UHo2FMpfi02pj8CCLgh9wbzRLihDsaOsiGg==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZgxprbMR3v7QDSCXf/fb4u0+URPvhKBdxcYo4gcxka3dQ3sS6djjTeIQPawQEEJryblTwYEgkX1sz8ZDzDzZOIrve9Clkup+ry5p0FBpIHhzyYM04q++L8MPrxQWZDsGYPVrdEEMd4oGrji0d8gPablbgqZroeMyHQlRLya8h10HEVLk5bvvKhDbyvmbCYo+DtSAopEfzjQwAqydB2ePoEuCFLZixu0nFcttMCxzjYhzTg3T0bFcZ63VeWF4IWdixszsvkt7FHx39u2MkmAvh7nmDf2+KogZQdcqSmmkFaA56XvVBR5Tyrmz6DiSqhHs/qUynL7fkA8XtG9MheoF0/bkQBArP3fv5LYnahRY9uQUQwOOq6MiDEW2e8owo5vg9NizQ53udF73/+SnP7UjyJ/hsPUrDc22quYylDGSOymBswsGm8hp/47hcqIaiXgY
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 20:55:40.6296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b79a75eb-52fb-494c-33da-08dee1ea43ad
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7447
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_135553_312025_3D46805F 
X-CRM114-Status: GOOD (  11.75  )
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

tegra241_cmdqv_isr() logs the error-map registers on every error interrupt.
A malfunctioning device, or a guest deliberately faulting its own VCMDQs,
can raise these interrupts rapidly, and the unconditional dev_warn() then
floods the kernel log.

Rate-limit the message with dev_warn_ratelimited(), and pass the error-map
registers straight to it so their four MMIO reads run only when the limiter
prints, instead of building the string on every interrupt.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index d27ee215032f7..6fa981574db9f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -353,21 +353,19 @@ static irqreturn_t tegra241_cmdqv_isr(int irq, void *devid)
 {
 	struct tegra241_cmdqv *cmdqv = (struct tegra241_cmdqv *)devid;
 	void __iomem *reg_vintf_map = REG_CMDQV(cmdqv, VINTF_ERR_MAP);
-	char err_str[256];
 	u64 vintf_map;
 
 	/* Use readl_relaxed() as register addresses are not 64-bit aligned */
 	vintf_map = (u64)readl_relaxed(reg_vintf_map + 0x4) << 32 |
 		    (u64)readl_relaxed(reg_vintf_map);
 
-	snprintf(err_str, sizeof(err_str),
-		 "vintf_map: %016llx, vcmdq_map %08x:%08x:%08x:%08x", vintf_map,
-		 readl_relaxed(REG_CMDQV(cmdqv, CMDQ_ERR_MAP(3))),
-		 readl_relaxed(REG_CMDQV(cmdqv, CMDQ_ERR_MAP(2))),
-		 readl_relaxed(REG_CMDQV(cmdqv, CMDQ_ERR_MAP(1))),
-		 readl_relaxed(REG_CMDQV(cmdqv, CMDQ_ERR_MAP(0))));
-
-	dev_warn(cmdqv->dev, "unexpected error reported. %s\n", err_str);
+	dev_warn_ratelimited(
+		cmdqv->dev,
+		"unexpected error reported. vintf_map: %016llx, vcmdq_map %08x:%08x:%08x:%08x\n",
+		vintf_map, readl_relaxed(REG_CMDQV(cmdqv, CMDQ_ERR_MAP(3))),
+		readl_relaxed(REG_CMDQV(cmdqv, CMDQ_ERR_MAP(2))),
+		readl_relaxed(REG_CMDQV(cmdqv, CMDQ_ERR_MAP(1))),
+		readl_relaxed(REG_CMDQV(cmdqv, CMDQ_ERR_MAP(0))));
 
 	/* Handle VINTF0 and its LVCMDQs */
 	if (vintf_map & BIT_ULL(0)) {
-- 
2.43.0


