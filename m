Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C642010BA430
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 07:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+xhSVILm6T/zSffCtH3N4fCnj9bYLNROyPODphCz3ZQ=; b=s07qwlkpB0WUySbogBRTFiM3R1
	jIa/n8pdtIVGkWpeuvuQVCjfabg2CDvUKxLtVO4irshoWgC87ZVYhXN3ErraOBCkoJ1qyAupN/lvB
	vg8QBlYjuvsystJT3oP14ALg3V1avDBmSFEoPOByRC/Q0//Qs+lvqStnjvbUaqVvT7Xuoj6sjn+L7
	N5fG9UJnpqROjm3yHwAPPMoYYCQwMCSiRVOXtuciNnGt6ekmLH+gVlpKX7WeUW/q//3+3cPxILu3p
	wvybEoGEO3zYEBdkHYx+Wr7ocBpccrr3ALwem8p0rzmVI3RhPYQQorh1+kbCp5yxnTwmskqjPCi9O
	Y4IMIXIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w61gm-00000006tXn-3oqN;
	Fri, 27 Mar 2026 07:33:04 +0000
Received: from mail-southcentralusazon11013004.outbound.protection.outlook.com ([40.93.196.4] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w61gh-00000006tVO-1irV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 07:33:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPI4prSzGhw8z4wUmYVC2bwNTtrJPOxBRq8hI77vQ8scFfjUkLI01zCPn7tzg5Oflh7vW76iHUn8oY60O2EDbcZf0/qsz8SGZKq0qsBVJ1nrpmtLbzaKsx0Fo8JRuFqqdWnA5CgmM7qPCBjF04asgmxBX/2SEKKufRHQP0i2j1ZbztlTgQNJtFhKt22atH9X2uAEG32xxMND4P/yQsAZ4pkFHv/qm7+RcorTWAmgC0Bt6D9T6mYw+VTrH0ijUs/MY7C7+hb7Dy7kgzhEnhzym50/OmTuPFUfQGlVgwKJAp9pFKLN+YmWS8EKIuYb+E6KOFb7BGz1h8ItseSP9hOltw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xhSVILm6T/zSffCtH3N4fCnj9bYLNROyPODphCz3ZQ=;
 b=UzCnPxMU/F/ZK2pOvjOXLX2cE2Xokd3ItK6d0e/aQnxkc+2qe4lq/N5lhJRZqlELbbUKHMYaZBY0Jzg2RlREgE2QF90pBqV3sjaN6Fa/l0THe2e9kdd4K0+bp6sKpIe+PYKqHXyVM4xl9YUxC1joAdV9P2yLiolVxjbR+qEinoA+eUNhc47QylDQJWuRORm5ODSqHzm79PYGLStxTbPPgbWoCw01JHZWFZu7TCw3vrvse/6MswsiDPr7e2KRJ8zPnAa2Fg0osKgUHFJ3Gn4K2yS1SEGsVG9gCFwCDSJtY0WqbQzrdr9Lz9v/05J/cFqm+ZFcvzk6c+linhdbh7BFPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xhSVILm6T/zSffCtH3N4fCnj9bYLNROyPODphCz3ZQ=;
 b=lItGnB3QVp50sq7I/eYjMD1ci4UP4TNfIGXTI4Sgrm25DM4POTVgBgPxJWn8C5qjMyY/UL0zEIXVFq2unWr6PECW47yjuY1cS4W2KLOwO4WUNQTKrHFirnQPsPoWhhWlIT7yO9QybJyon/zHvc1O9Ji3Ga97OsHjyTBeszvIock=
Received: from SA1PR02CA0015.namprd02.prod.outlook.com (2603:10b6:806:2cf::19)
 by DM4PR12MB7696.namprd12.prod.outlook.com (2603:10b6:8:100::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Fri, 27 Mar
 2026 07:32:52 +0000
Received: from SA2PEPF00003F67.namprd04.prod.outlook.com
 (2603:10b6:806:2cf:cafe::29) by SA1PR02CA0015.outlook.office365.com
 (2603:10b6:806:2cf::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.23 via Frontend Transport; Fri,
 27 Mar 2026 07:32:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F67.mail.protection.outlook.com (10.167.248.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 07:32:52 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 27 Mar
 2026 02:32:51 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Mar
 2026 02:32:51 -0500
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 27 Mar 2026 02:32:48 -0500
From: Suraj Gupta <suraj.gupta2@amd.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>
CC: Michal Simek <michal.simek@amd.com>, Sean Anderson
	<sean.anderson@linux.dev>, Daniel Borkmann <daniel@iogearbox.net>, "Ariane
 Keller" <ariane.keller@tik.ee.ethz.ch>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH net V2 1/2] net: xilinx: axienet: Correct BD length masks to match AXIDMA IP spec
Date: Fri, 27 Mar 2026 13:02:37 +0530
Message-ID: <20260327073238.134948-2-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20260327073238.134948-1-suraj.gupta2@amd.com>
References: <20260327073238.134948-1-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: suraj.gupta2@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F67:EE_|DM4PR12MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: 05b377bf-1fd0-4a4e-e8e5-08de8bd30e0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: ju541Tqzw+ZavXaPUEp9YsBMpQt2EFglsJZz1V4LcQywL0vKVaFyEL2RQCsjTkT6OnfylQm1Qz3nm8hfm1RHGMBARdo1YqkjadvNIoH0FFA2DX3lHXTgczuEDrYPhufcKUINfzVvAo0JKXrTpe7b/GcL/xdOkFkb/iSJ3WgIIWlA8H1UjPDGdVRfM4U53Thq7SUrcvJ+zdb+8saZhimgxivbDTSOBcQWq67ulDcR5Pmd580hKLZa6OzBwlbkzjbLKWAyzNbZ9Yt2TZl7i5RVIPmjTbumKotFtnrVfCaOttsM3UhYBidHr4cxC2SMpqfL6iDivWv51xFwbXuNXrSyWnYh5ekXkntSd9JPbH7v1PEmt9vihUM0AuLnvZCd1DRd1YkPr/SK4J+EG12ZRRw/YARvQjcs1YVkYmc2dUt8beSbZKPVsiwI6UOX19aUeqpbANxLLYOGlB2E09GG6Ml7QjbxgSo84OtLd/3sKD7Gum5bbIXZ3Ztt2qascZgaOoxlL1U+3BwtZalsAypGvFeZ97ITEoR7/kt3ozJWs/pbSklilhxVRtMNP4goelL5zAo7Ga8OmZaHZL7Ex5fL4XCoTh+BDUwGfSKFN9Y0TcJpyk62QginRWR8C3qgm6h/y/vDs+F9au/u+mQpwmMlvoAR4D7HQPnfdEgadKR6kJQnLlJPPilOppK8hUG5Rel2SzQMGNPGUwL1ipsR99DKLPNUJYF8tnAvPkmjyt21+0MpuFuDrVr9yRMxIrPp12jvE36VCRhx/qMVhDmeCnKk+PW2zQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yo5w/8UGI5N9JL3kNtFyxCDjL9CkFGBeFQSHGAFV5B57iheKWmO+ZZl7G0AtFObmpw7eOHSx4fn7Efb4n0skPoeVee5gbk29cXW08j1898h72xT5Lh/L8LdpfD8lkKR8ikmUFFmjIppEmNAKt1vesDeUzVDy5Xu7HADVxEm3PuZP+o4coV5VgVwxwDx4zrm0Ayfr1Z2DRX0JaCjN7brswEXOU0STIVdQPmX9p6qRbDAIK4Sunq60iVYSx4RhI+EMAqqap5otJyJGhBReCOPW/BpiXXMFquyl3FUBEF8EKorVKzskxk4cdnpZx9GLWbl6gZKYWLUB2fg6/jwIFEwwysLq6JdwIG964K9LDdbLN1gzbe54Yn7qZuM1bvtUb0VgxwqgpOeP8CSBX7RfDi7kaNgjuiiDjRfdLirHrUBCfGAVJ84bXUjyhNyufLVvXcRP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 07:32:52.2789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b377bf-1fd0-4a4e-e8e5-08de8bd30e0e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F67.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7696
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_003259_469848_07DD9776 
X-CRM114-Status: GOOD (  12.97  )
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

The XAXIDMA_BD_CTRL_LENGTH_MASK and XAXIDMA_BD_STS_ACTUAL_LEN_MASK
macros were defined as 0x007FFFFF (23 bits), but the AXI DMA IP
product guide (PG021) specifies the buffer length field as bits 25:0
(26 bits). Update both masks to match the IP documentation.

In practice this had no functional impact, since Ethernet frames are
far smaller than 2^23 bytes and the extra bits were always zero, but
the masks should still reflect the hardware specification.

Fixes: 8a3b7a252dca ("drivers/net/ethernet/xilinx: added Xilinx AXI Ethernet driver")
Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/ethernet/xilinx/xilinx_axienet.h
index 5ff742103beb..fcd3aaef27fc 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
@@ -105,7 +105,7 @@
 #define XAXIDMA_BD_HAS_DRE_MASK		0xF00 /* Whether has DRE mask */
 #define XAXIDMA_BD_WORDLEN_MASK		0xFF /* Whether has DRE mask */
 
-#define XAXIDMA_BD_CTRL_LENGTH_MASK	0x007FFFFF /* Requested len */
+#define XAXIDMA_BD_CTRL_LENGTH_MASK	GENMASK(25, 0) /* Requested len */
 #define XAXIDMA_BD_CTRL_TXSOF_MASK	0x08000000 /* First tx packet */
 #define XAXIDMA_BD_CTRL_TXEOF_MASK	0x04000000 /* Last tx packet */
 #define XAXIDMA_BD_CTRL_ALL_MASK	0x0C000000 /* All control bits */
@@ -130,7 +130,7 @@
 #define XAXIDMA_BD_CTRL_TXEOF_MASK	0x04000000 /* Last tx packet */
 #define XAXIDMA_BD_CTRL_ALL_MASK	0x0C000000 /* All control bits */
 
-#define XAXIDMA_BD_STS_ACTUAL_LEN_MASK	0x007FFFFF /* Actual len */
+#define XAXIDMA_BD_STS_ACTUAL_LEN_MASK	GENMASK(25, 0) /* Actual len */
 #define XAXIDMA_BD_STS_COMPLETE_MASK	0x80000000 /* Completed */
 #define XAXIDMA_BD_STS_DEC_ERR_MASK	0x40000000 /* Decode error */
 #define XAXIDMA_BD_STS_SLV_ERR_MASK	0x20000000 /* Slave error */
-- 
2.49.1


