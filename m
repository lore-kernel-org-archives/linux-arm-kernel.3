Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1D9C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 04:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKEQlEwZMjKmYBgoCBXyrvg9G6ParjLNFQ61kbn3HyI=; b=FmdEZrqxgFYk2DTDrhPEzlG4YW
	wQ73s6ldFwrRJdPEH+jT3YVt3X8quBmfM+k5pPRlyswvW6MsuDJ7I183uWW9xddVt4ocRWqZljcaA
	8prtLuhb9MkbxYJwzg+xuXlxkFFu27GpFuj4OF+KPLtgAnKSc7+bB+2u/ecoi5W22KDTXbVTmIBMx
	BwFzsp46pgjW9zAJKSSc9VnsNvGp6AWWQSW8H1s6rvIhq+L5g0o2upb5S7Avv8nu0JtoyLch/y8e5
	stQiyHfRN4gzUfREPH3talHaKjMm7LZtyx/QAuKZQ/CL0aZazgqMiLPw+0CA4qnB7kCmziJPcTYGA
	dUzBAXbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wujyZ-00000001x4W-03SR;
	Fri, 14 Aug 2026 04:57:03 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wujyM-00000001wwb-13qr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 04:56:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edAokBGtySjYmALgeGbzpL/I3euI+PAeJbCTdX4sLqgdqdbFzK4EDOUxPaxnEMhK7B6N5hGBwF8RFJJnVIpAQj3XBAIUrrYqQ9+GM9Vh5P1FNs0vs1J2vCYWV7U5aInuUbLDhj03vNSFGNylvKICmhwcIfgwt7XoDbg2t88xV7JWL2oJG+1STQ8Krxl72d6DGQ1z4H89Vmn3NOMKPCfE7ke0ereraf589j8eJ+8KJWUru/vcownlrkA1M4Yexk05XKdgKwI/mTs2sm6UxqSzX6IT/YI6U3MKqPcsUjQ3u5F8aewLfCfSZosIeS0lnrnvtzaCRNMmXPvMzNJy5zwUrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKEQlEwZMjKmYBgoCBXyrvg9G6ParjLNFQ61kbn3HyI=;
 b=DTLDrpYbXCgn1TV4DAlty0VHe64Czk51rQAstQNqTVNPI/Pn/0CNfynAV5ql8iTdfPkr9s9oTuAEvOVwLHs663ovXmd4FpUQNf7jn61ZABcwz/Ip+BxMVHARzUiiYaBoFwsRfFHQ10Oo9cYIWiVKiiXJ+sAivqsBc41gxe8conFBh6H8iXIFqe/rAce/O+e0c0F5nj9ZBwSeZR26r3qXAnHwgD1KDC5vSNwywc633RDLFw724+BJQUdpnz0rFLXX56zyLKF5kJ2cJjsqYKfq0OiLM0VrEzmxX0Q/ic0ccnhfvqfDJie+WetAttdNjALk+CKAR7CgqIbT51M1PysgZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKEQlEwZMjKmYBgoCBXyrvg9G6ParjLNFQ61kbn3HyI=;
 b=AMFTL2aB5f6332v/psJKTYxTPiRhCg5tyB3QiPikSci+vV15uL9TOcbvTpFvkhbsC6YvHrFKCGQe3ITuGmqjejyy0etY7j5lYWELKYi7GcMJcky+yK2aFv3TaMBuMYwhVRtQK6B/su7mnqGyMBGrhUKbyKJFFkeCRS912xI7WbQ=
Received: from DS1P222CA0004.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:454::6) by
 CH2PR12MB4118.namprd12.prod.outlook.com (2603:10b6:610:a4::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.15; Fri, 14 Aug 2026 04:56:42 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:8:454:cafe::83) by DS1P222CA0004.outlook.office365.com
 (2603:10b6:8:454::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Fri,
 14 Aug 2026 04:56:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.0 via Frontend Transport; Fri, 14 Aug 2026 04:56:42 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:56:40 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 23:56:38 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <nagendra.golla@amd.com>
Subject: [PATCH V2 6/8] dmaengine: zynqmp_dma: Use of_dma_is_coherent for dma-coherent
Date: Fri, 14 Aug 2026 10:26:14 +0530
Message-ID: <20260814045616.1661199-7-nagendra.golla@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260814045616.1661199-1-nagendra.golla@amd.com>
References: <20260814045616.1661199-1-nagendra.golla@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|CH2PR12MB4118:EE_
X-MS-Office365-Filtering-Correlation-Id: cc12e42b-2160-44b8-0b0b-08def9c06efb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|23010399003|1800799024|82310400026|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: pkT6inmWZy2cvHeAileYEubkGLoCXM99lYtOwB5ak+CXMFWjuTUihYvS+Wn5z2LOBkoo0IWUqAQwMmMAWc6Au5Pv0MSL2pbUvMi+4l/hljGkK7Nj6pE/Lru+yd0KZkxtc8ECClfKcPoJ9sUdCbOAWarxe7o06T6Haoqh3IV/3L7RTE3K2yaUuc3KbdblXaEVRUpLaDf2P8B+To6eMZlNJWGFwEpU25JVNjUSP5Mu6tSDRWKS15a+S9vuw7F0CHu4p/48BYvS/HqK/Vo+ykIcLcZBeJ5r90KbY04ckrrHEyxGr/QHCDTwbJK+URuvyVeN/6AxJ+jgs9yUNx7U7RyA02W/f9GrWEknbJUxaWACH+MKTSdhx1MWH4fTHNUAsVOJ1IY0i6jojaqfWvyW9lTdEsl71q4xXZ+iWn19IOmKdqRrSZe0uhnJOqJasJOwXW0kGltKPNVBNlROJ2jJil9YR6/5issBnl7t6UcaDyGpapmwp01U/Vpp22UEm/nzZeatk0K7bQp33QnNgtJi8ivdU1dQ4j0tpAsmSpS8Io3bEwdK1UsA2osFcO8J3KIuJphl+dXfgtoGT/4E7NwUS5eOqENiQfQnoPzzjX4S+Pxpri6KaoGLhf1N4/63kfDfX54LOuCsE6T3VJLt8Wm1MIAg+NEtc3crJKedQwz1iz/2l1uvwMtrEnkpvgU85OYBdAs73edsELPdJnQvvrlOlt1wSg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mBJqZF7hi5cL9jRAua7SA64d6poKpcwuo48hPbLLcQRZjwtnx3cfiqyIABWQY1O8j0y5GEBMiGqLTcaNPB9Ym2wKQtPI3n4TuiX4aVxyQ403IXivAs2eAJ/9AqpDZjtfWAPyytiIKBXBjkZVORuxc/6kxDpr5GddwNd2kuvQyAyw+usS+Q5eKcdGmLw0eI0rus7gmXgX4XGj7Q2oojSeZVYscJVRZhrhBw6CKJTwtoPUCaJSKg7gi5Pgp7J/wVikz4PPPcMSj5SzXibZXJ3c6sQClzDbYthp1W6dR4x2Jf2bHhQH0TLPg7UgGHw0IpWhVy5GHFTXVUT3OPqqzw6gTpmVblBK8R/+Kiz8jnmslCrv4kLXBrQrdzo/Ejq+HahvaZpYyJb++x7YnNEbnQm/QpU8bDJ/SqTDhhP7FQMJnDWFMH9JnuY01vw9pAYc2nrQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 04:56:42.3621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc12e42b-2160-44b8-0b0b-08def9c06efb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_215650_301316_8A73F752 
X-CRM114-Status: GOOD (  11.70  )
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

Use of_dma_is_coherent() instead of parsing the common dma-coherent
device-tree property directly.

Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
changes in v2:
- Added as a dedicated patch based on review feedback to use of_dma_is_coherent() 
  for the common dma-coherent property
---
 drivers/dma/xilinx/zynqmp_dma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index 5e81e0d950e8..194abfd6cb25 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_dma.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -947,7 +948,7 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
 	if (match_data)
 		chan->irq_offset = match_data->offset;
 
-	chan->is_dmacoherent =  of_property_read_bool(node, "dma-coherent");
+	chan->is_dmacoherent = of_dma_is_coherent(node);
 	zdev->chan = chan;
 	tasklet_setup(&chan->tasklet, zynqmp_dma_do_tasklet);
 	spin_lock_init(&chan->lock);
-- 
2.44.4


