Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C62CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 08:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/wD7fGhEMx9rE6vx8duYf0Azu16jSKcs/hZKzss28s=; b=hxVXY7DpZ3tLjDrKAgIutC9hNg
	VPb3bKseCLpphAuwl9GyWWJDQqyLR7mt219lx0MFhI39xYIXaSVyVUB8RLoL7izp9oYD7Q9FttwZz
	zC5gNCeuM3AfcGk5Hxf2rYcXBKDvifc92/Vo3QImHWnuSb2Qh7Lo+SubYMn0cKs6mmxffKhCMUogS
	6mp6F6XB5tyBddBZjuiEFEnX4Etx2lKGeSw9yrMQ/X+dRb2Qc7aqoPbd3f8m2P4lQHU2T5ILc0x4q
	xue6oONKcyQ9DgC4AbdsU6W/LSF1zjQniHv8yZqPethLAHmNa8QEXYdwAqiavaP/j1607nssX71Xr
	f2OXopOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBbu-00000009xqh-1WDe;
	Mon, 12 Oct 2026 08:42:18 +0000
Received: from mail-koreacentralazon11023113.outbound.protection.outlook.com ([40.107.44.113] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBbn-00000009xmQ-0RSq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 08:42:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6E1ubXgtwYQ52wi5kTU4l//Tp//3HtKrJvRCUvKNW8pukGBTzY2We6D7mkXtsUVK0xQm7t7o8AE3sPvlgn7847CIq228Jbqj8lDsSqZ6Ixdu2UBJ5grzyvuhGloQ69drP0gtLyR5fORDzNLCGnFEBt6QymddJ1Mv2wGNIuWaDi09aAf74gGw08cv3b9xWBl4WViAPj8nCBUKsvmcci0SiswzUsr6kDy8jLIYSDS1Dk8Ck50jlwk41Md5guXannmMOgvPjqNc7+HnqxQYkSS+wOdH+nsoKqs6Zi5joaBeZnzCNjkSez+VUlJM0hXsVAoQx37xK0vM/8vrNcbJHjmoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/wD7fGhEMx9rE6vx8duYf0Azu16jSKcs/hZKzss28s=;
 b=EU6I9LeaW1TcbLbWi685Q0IyIYwAzt6huJvW+NpzgN8uM+Tt4I15R5VD4OPDCGro8CoeRopNKoMvaYLdiIERYDOlUyR+ydlOtu2lsz1y3nVBDMjuDqZqBxT/0b47kJLUxUk6OiyxFBEYTxEit4PlhWFzHa/yTJcWVGsYq6yz88jQshs8PlKIlkDyRjBvPozWcxgz8IqSrs53HfE2k/CPO6MB0+BbsJqU8O9PxFWGqAna63fD+hdy3I6vqcFCCuu4IH2K0rMdZYkE1HP3Kfy1bYDL7LNBMWsZcFrgBjw0Lm1Fwp6ziPfIBrjz9KUw7QaFZnGIWDlo8aU7Mo+C0O2mCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0053.apcprd02.prod.outlook.com (2603:1096:4:1f5::8) by
 TYZPR06MB8299.apcprd06.prod.outlook.com (2603:1096:405:39c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Mon, 12 Oct
 2026 08:41:59 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:1f5:cafe::28) by SI1PR02CA0053.outlook.office365.com
 (2603:1096:4:1f5::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 08:41:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 08:41:57 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D3FF340920E2;
	Mon, 12 Oct 2026 16:41:56 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com
Subject: [PATCH v3 1/6] dmaengine: arm-dma350: Fix source trigger bit
Date: Mon, 12 Oct 2026 16:41:50 +0800
Message-ID: <20261012084155.2547480-2-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012084155.2547480-1-Jelly.Jia@cixtech.com>
References: <20261012084155.2547480-1-Jelly.Jia@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|TYZPR06MB8299:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7af9ce6c-9204-4177-fced-08df283cad48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|7416014|1800799024|6133799003|10067099003|18002099003|22082099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: Hnt9nKhKFo6893GfthR+WyKVVH8e+6qx9o1+8PIxjKQI67nudXZgExJ4pO8Yg5WkbJtSzAoOMRNLqz57uPs6cY4IumIIYiVRCL/uXkRw7/Q+dCzwgN1aR7yQyE4lmVzO+4izVrZcbVjA36OV3OF19MyfypnUvHGCyCB+j4YaTWYvrgGmGqFmB6INd7nzws9fwzmPEmlnKR2fN5YReqi3M6KdPvyRL+HjbKb2fYFtgVxhXmgxnho8yKjAn/IaPmn+d4NZVFFA0SmoxMIh+FUveSHi8CNCqCaFJqHwHpwIB94Qgat/DPGhiWpsPnaoOCOP7S8R2DderAIoozbts6rgT2IToBb8tHrGRieU4HbqdfzvxVlm9IqlEYSmJAQ/PA5OIZo8/soBmySNESXIbth+N+98dU4zpcCqSD0qQ2WM6aQtpvISQJf30zvfWrifqL2SSYar8ZsqMAgQj1cUGBlvWEkPLUn+EKu2T0rXbduYUm39s+jq726RuqlnaZTtPzs/ltWCBSCUxv3YzrYGiZTq1pODu/Kqst4hxYvi1z55ibzDSUWBPZ8dcZaU2QEmQQGG4LkFtkHLS2zl7+nbpurvvRMM1x6gAOHSWYL4y6n9N4rjI7BsAHY35OXWmbnGqsTkvcO5UR57dDiDr2trNoRAM/3EXpLjhxfM9wBY1FLsbARfAxY1hkqjzBR+eC3f+Bf4DrVoljkp4joPWZ607B6cmA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(7416014)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9VAkwss8jbQ7Zj35/aRGmCRdrMRagF0hU3qSiV3jgSeqR/hGuhJC4m5ELwkwVMBrjmHbC5PWkPG3GT5mJFVCjv7UdZEdlptmlgzbGtl7wWNYEtwuwMkmILzoVE4LncvxQeuNca04feX3HxK++Z/P4c84rUqhuOKbuHI3TqjStW8aM0mgOvHvhTlRxol5ZBBv+t8Z07Dp7NwBkM/fj1bTBbR5wgzVhSuhOTiZNrrlaY4DqXSkj4MtkcNJLDvrdpQHaffBu8kiZIE8fLE38ox1dHFMsMMLuZfYLiO8iotXRbe+xz0QG+OZobZCoYatlUmfLSwM0OyNTTSkaxadU9ZoFG7wI70s4MgRThk7bHffquuzkveOC0TSL+qnz4zLvhHQc4XwER4UNfXDSguNIIjtboLORDiOIb1VWn0YS2WtKnoUIyztNGBXrkhzRczroXi+
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 08:41:57.6587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af9ce6c-9204-4177-fced-08df283cad48
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB8299
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_014211_143296_5EBFBFC2 
X-CRM114-Status: GOOD (  10.17  )
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

CH_CTRL_USESRCTRIGIN is the source trigger enable bit in CH_CTRL and
must use bit 25, not bit 26 which is the destination trigger enable bit
(CH_CTRL_USEDESTRIGIN).

The constant has no users yet, but enabling the source trigger input
would silently enable the destination trigger input instead, breaking
any transfer that waits for a peripheral request. Fix it before the
first user arrives.

Fixes: 5d099706449d ("dmaengine: Add Arm DMA-350 driver")
Assisted-by: LLM checkpatch sparse dt_binding_check dtbs_check
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/dma/arm-dma350.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 09403aca8bb0..4e17130de6c8 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -63,7 +63,7 @@
 
 #define CH_CTRL			0x0c
 #define CH_CTRL_USEDESTRIGIN	BIT(26)
-#define CH_CTRL_USESRCTRIGIN	BIT(26)
+#define CH_CTRL_USESRCTRIGIN	BIT(25)
 #define CH_CTRL_DONETYPE	GENMASK(23, 21)
 #define CH_CTRL_REGRELOADTYPE	GENMASK(20, 18)
 #define CH_CTRL_XTYPE		GENMASK(11, 9)
-- 
2.54.0


