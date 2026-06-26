Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486E0CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 09:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qok4EtcDiokDt7vS9kapu/YhCtuezGoLX4IHSn95mU=; b=n2DMrj2xMobvGJ+taI8kYOSTVp
	99hGSjvwvwGo88OnFuG67m+KJxFq7bj3rZZUr7uuhhsCtSY3Uy+KTaCdV06FEakW/Mi7VPgFnn3r8
	d6a5qYgIGCwTB3c/cBbBlIeLSu6FmruruLX3DtommIEp7npPqj/dTWtTybak/B84oNKBCLtqcD4sg
	2WIKef5FbZFAAlMaxL1LKmWMLXon3JQy2/bFbHh4iBB+jRF2GCRlQU9ZRbmn1Ou+pNp+VsdWzTH3k
	9AysuShD/j6VTUwWpMuX0sn23knLLFwaNO5jIwxvslrTFmk39PBpDuem2A/UUe4qnfuU03eitOhGO
	FVppZKXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2qA-0000000Aymf-31Ty;
	Fri, 26 Jun 2026 09:27:14 +0000
Received: from mail-eastusazon11011038.outbound.protection.outlook.com ([52.101.52.38] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2q6-0000000AykB-3Esv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 09:27:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWqLJUDXRP7rCN5MHX3waXioJsLVpihWZXvfeHKNLlDO1clMjDXmgc1YY4fOrmWdktDF/sEyOn6824Wmc+fKYAHiDO563G7oVfcK/sLsfKImRDgl5++FLEERq8DCKhPimCLsM9nOBTxSJ97H7fQen4JWtYcuDfTYdNzO8m0qrCM5sEjPh+bZEWDUJvYlSGtmtw9uBdrN17Uzh+ucmxaYmJf8OzOwbROfAzlFm8RKSKUdAfmFpY+94unOnVf4BysmbK86svLMn8Jv3VPzX5H0aBOFFCIDbBFVoATcMT3A+KF5ryN5FpL+RsBu65tBzTFRE0dVD2yTnBdt5QfndnbJKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qok4EtcDiokDt7vS9kapu/YhCtuezGoLX4IHSn95mU=;
 b=Nm0ite/lkLuY1QYoGrIs0UQk6Jg1Ci4UNV//sUWXOovo29+V+dy6K+GHbO6Oqhlqeynj8VyJPnTdfxaRhp80x2COhQBn/2aTBbKYz5dnR5i3dwsgBaXDk80gaJoGJ8fwh3+0pjdlHDzLo1HBUyjj1Zz5T4tH+wfvzTLnvehY9JQ4USVS+HpkNiUOIeAz9Zc7Yy9Fw3Q9snkglapA4ZLzP0RDqCpeq5jBDz/VL//wmWCrsVACEYZWylStLpBh8nDdqVODTwmsIkCtTf37mh2TGcefbArlFvbgvGts7LOCgQBZ7QoNJa/dfJI75PrtC924qP/CwmadK12H6aFWRcE0sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qok4EtcDiokDt7vS9kapu/YhCtuezGoLX4IHSn95mU=;
 b=CwTEotqs7Sl57md6IXKOaWN4RSbElqW3c/CLZLowOnMbN+jqxLafx+DDIxgSTVmJ/TYHAPk0enYbaSj1QSXILru7SqQJQx7L6aoJBFgMDbJ5VMEU2vUKHjp+kghzO/Hi+oPRZ1R63WDDU3hLGGDZnMamudqu0agBVFdG+SYWeWE=
Received: from CY5PR15CA0081.namprd15.prod.outlook.com (2603:10b6:930:18::23)
 by MW4PR12MB6731.namprd12.prod.outlook.com (2603:10b6:303:1eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 09:27:04 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:930:18:cafe::84) by CY5PR15CA0081.outlook.office365.com
 (2603:10b6:930:18::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Fri,
 26 Jun 2026 09:27:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 26 Jun 2026 09:27:04 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 26 Jun
 2026 04:27:03 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 26 Jun
 2026 02:27:03 -0700
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 26 Jun 2026 04:27:01 -0500
From: Suraj Gupta <suraj.gupta2@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
	<dev@folker-schwesinger.de>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/3] dmaengine: xilinx_dma: Enable transfer chaining for AXIDMA and MCDMA by removing idle restriction
Date: Fri, 26 Jun 2026 14:56:55 +0530
Message-ID: <20260626092656.1563871-3-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260626092656.1563871-1-suraj.gupta2@amd.com>
References: <20260626092656.1563871-1-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|MW4PR12MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: d9592edb-ae7c-4684-34ac-08ded36515d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: aEVmHLWcroTItzTAUvUEwAEpOZ+eHBsp3Hl5diUpDRj6pijtp7J/rsGCVdPa8Hqc7DXlYghas6UFsqhHrKOWh2ESPWR3n1Xo2E9Jx8l9z/KTnuWopYFr36ZvzTYPc+CujBKjFLRd8qHDrt0nSFoEpzgyMMlgj+UpBIp8+aaMr8NjXvYOj4uUOH2OlD1+ZHAidhvnpi5C2K51zeEqH/uQU2XdxM1zYrH0uKT6Dty7CWJ0OG6ayJ+twO4SL3bTSegE2i1/Y+vwuGCeZ8TKB2DWiHz9BnnyzNw7RLxVufqW6sljChKht4EiozkuB0JKTtJvax6DcOK0TbMLE7KKR+NpErXLAjraoY+UF0EmDIQZBnLEfBLNzRJtwRPQ3bASBqXmPi4T+AUwaVlrc20kHNeMiwAKoLf5gHwJu9RcaujQnhX/F6ruSgyK8WRv5TDkeTY9GU1PqOVVeYkG8XF4iaAG+Nd0CfIpodSp0byPFXBa8CFh1Qt1u3/PRZO6WoOZyiPoxOqJm7R7DFbmxb/6h7qXsQ/CD4GwP3TXZDYXvdHwqwfMi3puMvSSnNGof2G3xD/7T0dJjrp4b9qntU68Xj1x63MPbQE9I7GkeM7vO2HkqiTH+iQ3T5a44gRHfFFmvMPSKsSV2+n9YhJC/cQD9K4P3wZrib3DBDge0ZJTWFCcVc4dSI9jH+KeQdL4S0AIseQ+UFOrnMIoK7VGr0RYvw2mIw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EFLTaDbWyARCibMH+YknT8G2tiFkIPKkuVSENNVCmUwZ+YlghVMa6Eg9kq2o2eU8+S/k/DTqzcDsiJ1vrZuraRqmQxRmR/ykHcIQ7wRKTYTh/IxAlrUtGdmOPGLkV+xvwGf5b5rlago4DYnzm99RGZM5BunSPiIdW2omVztQi35D5AJE2lGu/8txWygoa84hQwIS5PWCTGkVG+KO0x8gkrsYkL9xaxQ4obPmCpeUqvhBiMjlxG+KZECPYz5GeI2Z7TxjdH+GvUFCzwva7yEnjkCOvqo7bSGYExBrdNiyQmd2PqvXj88Dm0YvJlrsy/2/eVeQph13SlwqxEQHT5BWvXZQlfaUacphPnRMzcE5foZz8pW4kJoDPFaD4ZZjbqf/Wp8cGaCawTA5SY5FNE2nvzPOSY2VBhqbpZwgGy6CAWPZf1NVc3M2oZfmFqxXByAh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 09:27:04.3899
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9592edb-ae7c-4684-34ac-08ded36515d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6731
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_022710_814042_6CBA661B 
X-CRM114-Status: GOOD (  14.58  )
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

Relax the idle check in xilinx_dma_start_transfer() and
xilinx_mcdma_start_transfer() that prevented new transfers from being
queued when the channel was busy, so scatter-gather transfers can be
chained onto an in-flight transfer.

In scatter-gather mode, only update the CURDESC register when the active
list is empty to avoid interfering with transfers already in progress.
When the active list contains transfers, the hardware tail pointer
extension mechanism handles chaining automatically via the descriptor
next pointer chain, which is set up at channel allocation and preserved
across descriptor recycling.

Direct (non-SG) mode has no descriptor queue: writing the BTT register
launches a transfer immediately, so a new transfer must not be programmed
while one is in flight. Keep those transfers serialized by retaining the
idle check on the non-SG path. MCDMA always operates in scatter-gather
mode, so it is unaffected.

Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
Co-developed-by: Srinivas Neeli <srinivas.neeli@amd.com>
Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index ca396b709742..6e7b183cb499 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -1580,7 +1580,14 @@ static void xilinx_dma_start_transfer(struct xilinx_dma_chan *chan)
 		return;
 	}
 
-	if (!chan->idle)
+	/*
+	 * Direct (non-SG) mode has no descriptor queue: writing the BTT
+	 * register launches a transfer immediately, so a new transfer must
+	 * not be programmed while one is in flight. Keep such transfers
+	 * serialized. SG mode supports chaining onto a running transfer via
+	 * tail-pointer extension, so it is allowed to proceed when busy.
+	 */
+	if (!chan->has_sg && !chan->idle)
 		return;
 
 	head_desc = list_first_entry(&chan->pending_list,
@@ -1599,7 +1606,7 @@ static void xilinx_dma_start_transfer(struct xilinx_dma_chan *chan)
 		dma_ctrl_write(chan, XILINX_DMA_REG_DMACR, reg);
 	}
 
-	if (chan->has_sg)
+	if (chan->has_sg && list_empty(&chan->active_list))
 		xilinx_write(chan, XILINX_DMA_REG_CURDESC,
 			     head_desc->async_tx.phys);
 	reg  &= ~XILINX_DMA_CR_DELAY_MAX;
@@ -1660,9 +1667,6 @@ static void xilinx_mcdma_start_transfer(struct xilinx_dma_chan *chan)
 	if (chan->err)
 		return;
 
-	if (!chan->idle)
-		return;
-
 	if (list_empty(&chan->pending_list))
 		return;
 
@@ -1685,8 +1689,9 @@ static void xilinx_mcdma_start_transfer(struct xilinx_dma_chan *chan)
 	dma_ctrl_write(chan, XILINX_MCDMA_CHAN_CR_OFFSET(chan->tdest), reg);
 
 	/* Program current descriptor */
-	xilinx_write(chan, XILINX_MCDMA_CHAN_CDESC_OFFSET(chan->tdest),
-		     head_desc->async_tx.phys);
+	if (chan->has_sg && list_empty(&chan->active_list))
+		xilinx_write(chan, XILINX_MCDMA_CHAN_CDESC_OFFSET(chan->tdest),
+			     head_desc->async_tx.phys);
 
 	/* Program channel enable register */
 	reg = dma_ctrl_read(chan, XILINX_MCDMA_CHEN_OFFSET);
-- 
2.25.1


