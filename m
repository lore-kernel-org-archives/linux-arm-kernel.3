Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1644CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 06:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQSkpjdKkEIscqlTn4p8/o/wKrnWvAdJvvEcYxwAnH0=; b=A6x6diz3qAzf9nLg6tNfi3bDDA
	a+dzSOFcYjqLiemqrg2VOAuIdO3s3RaWe2dKuEHNyNZ2gKgEUFtK0EbcscDZKZKRSc0kY+NWncWUq
	EJyFS/UfeXfELwT5NOvDC4dVYMHtTIrD7tsSAgIsyxXVZl0vSaJyXMt3+80nNp+jrRPkTlCpOeuTY
	WL41bEEvGayiI0qKaaFHaJSXcyFxYDteg29TiFfrTnF0Y/QhtZqO2d1iIAf/iivWSDMuB2OtDm2jF
	bFORXkOR6mDGAEJ0GVI5xqJT/xF2HWGXyCEp9IcAI70ScWebgcY7GKeEfiJMn30ceOo+IJMAg3l0B
	5L7UQZdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Z8l-0000000BjGt-2eRU;
	Fri, 03 Oct 2025 06:19:39 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Z8i-0000000BjEy-2s68
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 06:19:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnaHI5imiN8/SDs4AoVB1yLwtMmvoRAMSQsJMy0oMOFqWuLrQpt7R60+aVMmEm9gGk28OHW8y8unsEnxpwkGr9qHZJ/bpZMbJcHCiuCKrELEEapJOSS00lIL+PVuteRhycASuYkl0jCoC8M/5Xn6qwnObYETIvZo9M88wSahgs/w92rWK7DJfj7aLIsmCLRZ9sMlyJ8ptr55Rn8isYKdYQcX/agFQdzO0L6DTgLAuubTWr01rm48qKBLte3GzMYdc3YIMuEgO51v+fGRuCBgZqENlPc4btmzoOAAJeBlErWOpeWHE/aMabgTg6wkM4JdfuCOUxPKkuDWBsMwOe/smQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQSkpjdKkEIscqlTn4p8/o/wKrnWvAdJvvEcYxwAnH0=;
 b=Npdl73KoBAQB03lZHJoK8opxFaVsnHyI6i87h8Wg9ipMkaJ1oExuWpgQTfiMOSh+vH3xbcslUXeSEdP9EQfLsFj8JRq1SIfedtkKfGyjX+F+31cU+KD1cM+kxpnKyFLG18k4q6M1ycS1hT+Ojvse5kjDx6RyyNhZeKMkz7xeYaOnxHzm9XPDonmofozvxrijwwif9Wp2ZtQl4Elo/jPPtbfr58SYXcn+iHSvVVMj32jACDkcyXcZmeyntr5a+W0MbSULUZ4ix4+ICljzLnO6rwfaIR78mVvFjICvN5L52PdH1bYMS9bXBdQZHj/91qYLgsZpkEiimnRjR+Itz0IJww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQSkpjdKkEIscqlTn4p8/o/wKrnWvAdJvvEcYxwAnH0=;
 b=YVhfd29TBEGIP6Xgv3nB8DtDIiFUdH6u+XCjUc381/pMogXFIgSPqQARu/EUkMYLkJI1r2E7kI7t9fsNOZOhRu9v1rxz0LNQJ0O4MWl1M8maMpGFKIejqLaUJemP0dPkPdvHZyH3s9Xysd1UMd6c4j+vMZ+VwVXBOkMHA3FhCaA=
Received: from BL1PR13CA0127.namprd13.prod.outlook.com (2603:10b6:208:2bb::12)
 by MW5PR12MB5682.namprd12.prod.outlook.com (2603:10b6:303:19f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 06:19:20 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:208:2bb:cafe::c2) by BL1PR13CA0127.outlook.office365.com
 (2603:10b6:208:2bb::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.5 via Frontend Transport; Fri, 3
 Oct 2025 06:19:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Fri, 3 Oct 2025 06:19:20 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 2 Oct
 2025 23:19:17 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 3 Oct
 2025 01:19:17 -0500
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 2 Oct 2025 23:19:15 -0700
From: Suraj Gupta <suraj.gupta2@amd.com>
To: <vkoul@kernel.org>, <radhey.shyam.pandey@amd.com>, <michal.simek@amd.com>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH V2 2/3] dmaengine: xilinx_dma: Enable transfer chaining for AXIDMA and MCDMA by removing idle restriction
Date: Fri, 3 Oct 2025 11:49:09 +0530
Message-ID: <20251003061910.471575-3-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251003061910.471575-1-suraj.gupta2@amd.com>
References: <20251003061910.471575-1-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: suraj.gupta2@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|MW5PR12MB5682:EE_
X-MS-Office365-Filtering-Correlation-Id: 81568ea5-4b90-491c-37c1-08de0244ca24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pn5ebV7LNizyOSw6om0qnBOdC5n0KpTJmWiVAm9H/JSG+9JThnmiQJ/QEgfN?=
 =?us-ascii?Q?BBUgWJvUHirDwc1t3ZfGPI8EMX778ZoYiX6n8DGJdP7qKuKBvAE7UOm/yaSs?=
 =?us-ascii?Q?X0Wx/qd7MODvy14upZZQTPukSoQZ0zSAQOc96uQb1VxFujECUz3SV5qEClAn?=
 =?us-ascii?Q?iYMkJvIdYh94PudrEiUfZfsy24HguRHE4mJY3yWWuCc8bgXarVUAEZUUR5pS?=
 =?us-ascii?Q?MSnKFVmhx5UwbK3jBQ1bRzCCLSkxetCC6599U9usLUaYg+CZwlf2hKPZAV53?=
 =?us-ascii?Q?yR724By44+7P142amlDKKUknFF+V0Ek7H0LP/x5T0cxt3mrtOY3CNBkCpgPF?=
 =?us-ascii?Q?bDT2J755/pBfLaw2uNl7EQGwoJrtJUIEpN3w3g8FqKP/7Oc3NVY2X1dHph5r?=
 =?us-ascii?Q?C+JDDy303Yy49x5yH3lPmi2MHPIa7AXf9G5ztAgpps6a5XHWo18kN+wmPOyq?=
 =?us-ascii?Q?p8x0JranMP4ecCIoMyNHqZdCNeUK6ACU7hkg5FPA/oWpvJb7a6rpptxWByIT?=
 =?us-ascii?Q?aH+RyRuS01kKsQqp2/DXZ3wx4IG1aiZVFOUPPiGUvsM4vzY6Tsdc88jl+u/s?=
 =?us-ascii?Q?H7DUhtrhYV5GQWVVyBlsfJtV1ETqwkEfH+8eZU5Z37FjtN6niDjRZGhCY7uZ?=
 =?us-ascii?Q?UDoVDAOOOQkQZ+qkCJRZBkNrDyvfdWRzQtDpseonNyjmZqDjpALgseMFLf5Y?=
 =?us-ascii?Q?gKQVxXirhd1Z5av2PMeAs0+ZCQ2TKB6HP9eR5ZcGKAOaSCzKvlgv0ThGUHBG?=
 =?us-ascii?Q?8eMqluZtQTJFfCejOM5bFgBRf+DgPurqUgl+ZCI3W8fnmQoeLCniyiEmRZCV?=
 =?us-ascii?Q?vEVvULqAdBQOd5uafGGTudtb9wAqvgq/txptOnXbmFKMbzMwHZ4/aTvKeU89?=
 =?us-ascii?Q?+ivRdxixvdcdN3x13cWuiwj7O6xY62Sq71ieUbfVdBL9UZOVbJiMj6CCNPFc?=
 =?us-ascii?Q?LsAIdAAPRmEyAAPHg8ly41C4Nd7rjSFe+vWcnDSwV3CPbwNTRJTZ4FQ+Gwr2?=
 =?us-ascii?Q?KFz6fZTpUCrcOLHLFpCN+xsI0riNhAXhh+Iqb81sFf+MlXl8i2kttQRpy6WK?=
 =?us-ascii?Q?VB22/3dWKaEOSg22gfkN5EFQ/SwpbuLvlR44FBUC/ydFHG/YBG8POwg8SaCe?=
 =?us-ascii?Q?FLSq77ic8I3xEnE+x6hRQJvpPCFZDVSSu3zcfMZVG8RzT/eeSoJj4nuOpBeT?=
 =?us-ascii?Q?QsTWm0UWq9MVP9kYSX+R1Eh5/BooRgFk6wYAf03d5y7M2oR454JoG997+svA?=
 =?us-ascii?Q?3LmMEEPDx4t1MBy7QRLPyCAXYIDNkr2cDkKeB+FCsQfnjUOcvUchNxOTDTFb?=
 =?us-ascii?Q?SYQXl6U4a3FrWPv21QakXjNoazPf1hNC/8oROL0Z/1Z/Kf0cIHkkRwbfTdvY?=
 =?us-ascii?Q?s7hylnX51IhdNamRv1pImn+t92IpXQRBn3g/ZOuu+Y3lREIi+bxsBwT8vv4q?=
 =?us-ascii?Q?KRS2ZTDw0bP0IHxf0ogr7y+c6pMVWZMWUuC88q3DEaGjkmia893Q/5t7OTKx?=
 =?us-ascii?Q?lLGKCOlWjTA6vdNNWIgNa+QhthbcUIOYH3i00x+JPhSCkVy/hT6eVSMAjkM7?=
 =?us-ascii?Q?f4qhwE0gP1R4G/xGN9M=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 06:19:20.5160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81568ea5-4b90-491c-37c1-08de0244ca24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5682
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_231936_728179_F2D62001 
X-CRM114-Status: GOOD (  13.51  )
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

Remove the restrictive idle check in xilinx_dma_start_transfer() and
xilinx_mcdma_start_transfer() that prevented new transfers from being
queued when the channel was busy.
Additionally, only update the CURDESC register when the channel is
running in scatter-gather mode and active list is empty to avoid
interfering with transfers already in progress. When the active list
contains transfers, the hardware tail pointer extension mechanism
handles chaining automatically.

Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
Co-developed-by: Srinivas Neeli <srinivas.neeli@amd.com>
Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 53b82ddad007..aa6589e88c5c 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -1548,9 +1548,6 @@ static void xilinx_dma_start_transfer(struct xilinx_dma_chan *chan)
 	if (list_empty(&chan->pending_list))
 		return;
 
-	if (!chan->idle)
-		return;
-
 	head_desc = list_first_entry(&chan->pending_list,
 				     struct xilinx_dma_tx_descriptor, node);
 	tail_desc = list_last_entry(&chan->pending_list,
@@ -1567,7 +1564,7 @@ static void xilinx_dma_start_transfer(struct xilinx_dma_chan *chan)
 		dma_ctrl_write(chan, XILINX_DMA_REG_DMACR, reg);
 	}
 
-	if (chan->has_sg)
+	if (chan->has_sg && list_empty(&chan->active_list))
 		xilinx_write(chan, XILINX_DMA_REG_CURDESC,
 			     head_desc->async_tx.phys);
 	reg  &= ~XILINX_DMA_CR_DELAY_MAX;
@@ -1627,9 +1624,6 @@ static void xilinx_mcdma_start_transfer(struct xilinx_dma_chan *chan)
 	if (chan->err)
 		return;
 
-	if (!chan->idle)
-		return;
-
 	if (list_empty(&chan->pending_list))
 		return;
 
@@ -1652,8 +1646,9 @@ static void xilinx_mcdma_start_transfer(struct xilinx_dma_chan *chan)
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


