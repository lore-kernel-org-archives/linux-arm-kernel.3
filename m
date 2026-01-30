Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA142D49C9B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 11:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBy2TztH/iP/E9UNtKD6+c/Slsjc4HvrVT7j6Eq+mx8=; b=RPtCAfEKLLFDZTexShB3AyJl/J
	wYW+ShAjl+2Sw8UyhVay600zKBonNg42seneQ08+BvrcigzKuCmZfMGWstWWXOEmSvHLUvmKLbE/R
	x5WF1LQNDknIvFSM3VT3p+Xb1Nye/3/1P2C1MBsWj44gJEA0dHyAFkwEt8q0cRwzusa/z2G2WT8ZA
	wXQwWKEIeaIr6pekU/neK+xIfQdRKVicK64vuRILDR6rrl28E8W59/V/Mcy8zOdPJRawjCPICJf6f
	DzjMttzyMpZ2ojfJ3BGSQRsrFS4aTHLW1GcYYhMwJItrtLRkoyxY9FLFCumqwtZvV7mCzS8g/ylVE
	uGRoar4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlmHX-00000001NOm-1bCK;
	Fri, 30 Jan 2026 11:03:19 +0000
Received: from mail-eastusazon11012057.outbound.protection.outlook.com ([52.101.53.57] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlmHM-00000001NE4-3XrT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 11:03:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dj/Pek2CpdVSjbg7HQTQvqp81cqiYEdK+2ea5vgq8uKXLlV0YwpUAC6CgL7h+ACA3wErJ4z0Ct+j/SGfWP5wy8lLbBO67HoY0G40ycwJxcLHBVIpu3PxftWd1NgyeSuKWeU/a6Y+kxdBe4NPUnRprQ21vGYDTM589/dzLQljzIfmVkSq9kfXF1RZf5FW3MHaQhsX+IYz4WQApq7gWh/T6NACuE0SZ4vg04ysJtprqZe+VGYngaeQi1wqcE/jLXewa5Tcfn99DuXdE199vRXEdWOd1xL4xsSdeHy3cdWCj5dc6wQzmSuU4alkY3P2/j2NeyRvEm3aWYCXdZtdEiN8TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBy2TztH/iP/E9UNtKD6+c/Slsjc4HvrVT7j6Eq+mx8=;
 b=eQUJ9awJfB6PC9uaQKpjsOPPJgd/58iLHhSQaYetcIWt1doY0W5X/J04q7fF+iEaNrtzuLOAXD1ocLUaZRu43aDa30g+D9ZyO7kzwGny/pKrtm5vS9XYqWZpWd3I4fwbnvzvaRe9sANnQchTMVSh2Vj2hX+rMawYP/qrHT6h9MSCoUu8zvyrWRYS55FMHnaU50pl1A0AC/Y0qedDAE8XSVj23vGb7hbz7cBewZ51CWIpeV6LBYETu9XbEkDsIdnXOR4kShyTBg9qYgYZOOOp/KTKNP6Ed1RERWYo1I+yLPvzA2KEi+vcdOLM6A6rywaeV/W6uszFKj6FCz0lkRo93g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBy2TztH/iP/E9UNtKD6+c/Slsjc4HvrVT7j6Eq+mx8=;
 b=uo3hUKTLgM0dHdOMCZWLEoP09xUY0WNUX0R1/KfqmouAyfVS1vPwhDdhAmW5PwVMBIp/hLfK7PRD4y8DjjqrqUBt4WZLd8rVdkpPV2WX/YRG1bOKxHFqE1nlFhhZ3oerqXuPwQIMH/IZ4KIa5omzwKgeMF/m6hyerm4icg7pOEI=
Received: from BYAPR08CA0026.namprd08.prod.outlook.com (2603:10b6:a03:100::39)
 by IA3PR10MB8758.namprd10.prod.outlook.com (2603:10b6:208:579::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 11:02:51 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:a03:100:cafe::fd) by BYAPR08CA0026.outlook.office365.com
 (2603:10b6:a03:100::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Fri,
 30 Jan 2026 11:02:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 11:02:48 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 05:02:44 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 05:02:44 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 30 Jan 2026 05:02:44 -0600
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [172.24.233.239])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60UB2HBi1204392;
	Fri, 30 Jan 2026 05:02:40 -0600
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
	<ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v4 05/19] dmaengine: ti: k3-udma: move ring management functions to k3-udma-common.c
Date: Fri, 30 Jan 2026 16:31:45 +0530
Message-ID: <20260130110159.359501-6-s-adivi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130110159.359501-1-s-adivi@ti.com>
References: <20260130110159.359501-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|IA3PR10MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: 12a58ff7-5d7e-490c-a4cf-08de5fef1b24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?scezTEHZLqyIz6hTNlLOiC21KxTlZpMd4jwe+I2/mKKiocBO7AZUaWgK2itQ?=
 =?us-ascii?Q?F62zLiyWMxNL05TzZEiBIMp9qjjhPlNTEIKZamaP+HpSich216gecLg9LEX7?=
 =?us-ascii?Q?CW3lpMqdnueWYI5TRUvt76ZoOVjrCoKQEYwt9c3Dfh2lqScNrYy1G2KqonJa?=
 =?us-ascii?Q?18Xp2XxAN1UdbJXUtXbaSf75UUnY9xYViFOZaOMoMPSwnpHf8UCsX0p7nBI1?=
 =?us-ascii?Q?al6FkeXRATHRmKxAX77rdi5xKQ3Im4yF2rWz22NxinwOx5rAdLl63H82yp+n?=
 =?us-ascii?Q?1YRhoFVcBLTGuo7e1q1Rf2/LNsRYcR11musM5P1ipkjFAXS/7V676Nipu4/X?=
 =?us-ascii?Q?o/gQKQh0TDAd+G6QFo3lw3SrIocPqooNPTLmeYPFCLYUUy13jLWHCr96CqlM?=
 =?us-ascii?Q?S+am/9DiJtFNl0v1+LODMMPV3HLUQRjh9H6H11WeS0TldkbPNWABwT2AlIpZ?=
 =?us-ascii?Q?J69lT4v5FmUM5Pe3uqhbtC9WC/0Cy74XR8BL6zCu4CYERhTSLp58yUssRJNU?=
 =?us-ascii?Q?FSqzgUfWQ6/v15NARJk2Fo+Vmpu0zTi3+re+pB5Je4sR58LCRKabomPtS6bO?=
 =?us-ascii?Q?qm5F547IZcmRDo7A+Du0y3UJ0kkm1Mw7ZX6xcUPVap0IAM2pUAJtT7SqRdRV?=
 =?us-ascii?Q?2Z/Czl41VJiCE0q/VygUJKuqBF8UuTg1eE9y2+QnKP1KCop/M0SdAsIt53bz?=
 =?us-ascii?Q?4/Dw+EWGElshQJ9XxJlvMhegomPEIpNQTIO6VJ1x4BXe9SuBIzPM6UkaJIiE?=
 =?us-ascii?Q?1Pt6RXRDlNdo9IQapNuHRevFgCaq2czN/Ta0INbQQFsmJ6e/w/S/4EV/sqku?=
 =?us-ascii?Q?aFML1xTWL3/LsRcetvrJGewe5NwAQr07HakSpAKfBvRcrLIZ5qjqFX21UYNT?=
 =?us-ascii?Q?UpSoe6kjmEBF76kiWnkOQX9MLa4qewojP8bD9IjskIQVagEyQOO0ffIZFfiC?=
 =?us-ascii?Q?ruAaqj5uc1x401e2ukO0cciBdelRu3trnSkF17gIoje6ifupis8Le7eTBucA?=
 =?us-ascii?Q?Mequix0k6TWkCF9PjCyPsVruQaagw8HYBcWaiW1BcdzcTU+pCWdc5to8mgOg?=
 =?us-ascii?Q?AmAtplh7r8J0DrQWWP7+AQ0214b/Vf0sSfgdtSkT58iZeuOQHpM1S2nAcdGN?=
 =?us-ascii?Q?Ts3wpe8MCg8Jq5L1YlrEwlWkP1iiud8IPFRvE1L3LkYdyOuwXDrsC/EtM9DL?=
 =?us-ascii?Q?VQ59RzE1DGAQ7vcAvkqNkB+AoutevEubMo0tYdDWCiupi0qGfR5C7PRJW5Xa?=
 =?us-ascii?Q?bGVNG0cVPi7HiLjrAMl4X6yILrYG2eEO6IHHxQQxta7kjuFg+3HuKAG8pvDS?=
 =?us-ascii?Q?bPS54UkbadsERKAdrhuwxqZ3nsbeH1bgyj//vm678X/1npOQT0dplUsnCVK2?=
 =?us-ascii?Q?L1pf3d809EZbfHKbJAqvF5J8e/jbrccO2vSqALHZHFGvvu9pv6QnLb8fkZPJ?=
 =?us-ascii?Q?7SWq0nfpjn0PticzcIhbzeLAU6OE6dFvbU2izLwnrSlEIPqCzs2o4X2zkDUC?=
 =?us-ascii?Q?f/ovQcAR2BwFA9kS50JRPL9eQISvdqN1XMt0tvwXQTsG6A1AsWejTb8nuVbF?=
 =?us-ascii?Q?o03XDeeCxc+vRXgH3wy+Nhfy7ZRIua1mgpLD3w3yF8+3MyJvAnTrkS+EQ2l7?=
 =?us-ascii?Q?+yN6eSVREqFo82rrdTlC4OMeUdCDEi1mTXIrLkcyQttSbw3ylaVLoYS8yhom?=
 =?us-ascii?Q?XR+k4KC0Hs/41BWtxVz0juGYMgQ=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cyh5tK6Sz178/PyoH2kUeunjDrSyVF/5oGGL9EDTVd7JcuC/GmEV/s8QMvSHl4AsSF5Pl0Bvpw+59kpVb6tAXNNELy44vh9DRjkM/XFoW5p2WNb4ynii57RN9gMbWRyPM5kAJbJU/n+FYKJIqdwp1lOToVmzho1sR4OWacB7KDcRfUchq/NHHIk6BTFpRih+sMrCRNW8OpfPh0ELzStOP+s6i8aJmBpaf0a5Dov4JJ+oI0bDpUYwC4MmOHf/dTc/yX5Gr3+aLEgphkdufJZN15U4c3S47Sp/Pfym1n1VcgNxTVWygj882Hdj1SlpmfriLyB9t8xQ1cVIkVsPsaQxa/QYykK/rXjBeo35H8vE352Ks0BlO9nnDovT8WGYRsCm01myfFA6MpFOfIs1EHfiiSTJunryHrmQxCLHSUvQImu9Mp2KnOeUFDhMBXya2azI
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 11:02:48.9101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a58ff7-5d7e-490c-a4cf-08de5fef1b24
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8758
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_030309_013536_2838342C 
X-CRM114-Status: GOOD (  16.64  )
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

Relocate the ring management functions such as push, pop, and reset
from k3-udma.c to k3-udma-common.c file. These operations are
common across multiple K3 UDMA variants and will be reused by
future implementations like K3 UDMA v2.

No functional changes intended.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 103 ++++++++++++++++++++++++++++++++
 drivers/dma/ti/k3-udma.c        | 100 -------------------------------
 drivers/dma/ti/k3-udma.h        |   4 ++
 3 files changed, 107 insertions(+), 100 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 9cb35759c70bb..4dcf986f84d87 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -1239,5 +1239,108 @@ void udma_desc_pre_callback(struct virt_dma_chan *vc,
 }
 EXPORT_SYMBOL_GPL(udma_desc_pre_callback);
 
+int udma_push_to_ring(struct udma_chan *uc, int idx)
+{
+	struct udma_desc *d = uc->desc;
+	struct k3_ring *ring = NULL;
+	dma_addr_t paddr;
+
+	switch (uc->config.dir) {
+	case DMA_DEV_TO_MEM:
+		ring = uc->rflow->fd_ring;
+		break;
+	case DMA_MEM_TO_DEV:
+	case DMA_MEM_TO_MEM:
+		ring = uc->tchan->t_ring;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* RX flush packet: idx == -1 is only passed in case of DEV_TO_MEM */
+	if (idx == -1) {
+		paddr = udma_get_rx_flush_hwdesc_paddr(uc);
+	} else {
+		paddr = udma_curr_cppi5_desc_paddr(d, idx);
+
+		wmb(); /* Ensure that writes are not moved over this point */
+	}
+
+	return k3_ringacc_ring_push(ring, &paddr);
+}
+EXPORT_SYMBOL_GPL(udma_push_to_ring);
+
+int udma_pop_from_ring(struct udma_chan *uc, dma_addr_t *addr)
+{
+	struct k3_ring *ring = NULL;
+	int ret;
+
+	switch (uc->config.dir) {
+	case DMA_DEV_TO_MEM:
+		ring = uc->rflow->r_ring;
+		break;
+	case DMA_MEM_TO_DEV:
+	case DMA_MEM_TO_MEM:
+		ring = uc->tchan->tc_ring;
+		break;
+	default:
+		return -ENOENT;
+	}
+
+	ret = k3_ringacc_ring_pop(ring, addr);
+	if (ret)
+		return ret;
+
+	rmb(); /* Ensure that reads are not moved before this point */
+
+	/* Teardown completion */
+	if (cppi5_desc_is_tdcm(*addr))
+		return 0;
+
+	/* Check for flush descriptor */
+	if (udma_desc_is_rx_flush(uc, *addr))
+		return -ENOENT;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(udma_pop_from_ring);
+
+void udma_reset_rings(struct udma_chan *uc)
+{
+	struct k3_ring *ring1 = NULL;
+	struct k3_ring *ring2 = NULL;
+
+	switch (uc->config.dir) {
+	case DMA_DEV_TO_MEM:
+		if (uc->rchan) {
+			ring1 = uc->rflow->fd_ring;
+			ring2 = uc->rflow->r_ring;
+		}
+		break;
+	case DMA_MEM_TO_DEV:
+	case DMA_MEM_TO_MEM:
+		if (uc->tchan) {
+			ring1 = uc->tchan->t_ring;
+			ring2 = uc->tchan->tc_ring;
+		}
+		break;
+	default:
+		break;
+	}
+
+	if (ring1)
+		k3_ringacc_ring_reset_dma(ring1,
+					  k3_ringacc_ring_get_occ(ring1));
+	if (ring2)
+		k3_ringacc_ring_reset(ring2);
+
+	/* make sure we are not leaking memory by stalled descriptor */
+	if (uc->terminated_desc) {
+		udma_desc_free(&uc->terminated_desc->vd);
+		uc->terminated_desc = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(udma_reset_rings);
+
 MODULE_DESCRIPTION("Texas Instruments K3 UDMA Common Library");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 0a1291829611f..214a1ca1e1776 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -174,106 +174,6 @@ static bool udma_is_chan_paused(struct udma_chan *uc)
 	return false;
 }
 
-static int udma_push_to_ring(struct udma_chan *uc, int idx)
-{
-	struct udma_desc *d = uc->desc;
-	struct k3_ring *ring = NULL;
-	dma_addr_t paddr;
-
-	switch (uc->config.dir) {
-	case DMA_DEV_TO_MEM:
-		ring = uc->rflow->fd_ring;
-		break;
-	case DMA_MEM_TO_DEV:
-	case DMA_MEM_TO_MEM:
-		ring = uc->tchan->t_ring;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	/* RX flush packet: idx == -1 is only passed in case of DEV_TO_MEM */
-	if (idx == -1) {
-		paddr = udma_get_rx_flush_hwdesc_paddr(uc);
-	} else {
-		paddr = udma_curr_cppi5_desc_paddr(d, idx);
-
-		wmb(); /* Ensure that writes are not moved over this point */
-	}
-
-	return k3_ringacc_ring_push(ring, &paddr);
-}
-
-static int udma_pop_from_ring(struct udma_chan *uc, dma_addr_t *addr)
-{
-	struct k3_ring *ring = NULL;
-	int ret;
-
-	switch (uc->config.dir) {
-	case DMA_DEV_TO_MEM:
-		ring = uc->rflow->r_ring;
-		break;
-	case DMA_MEM_TO_DEV:
-	case DMA_MEM_TO_MEM:
-		ring = uc->tchan->tc_ring;
-		break;
-	default:
-		return -ENOENT;
-	}
-
-	ret = k3_ringacc_ring_pop(ring, addr);
-	if (ret)
-		return ret;
-
-	rmb(); /* Ensure that reads are not moved before this point */
-
-	/* Teardown completion */
-	if (cppi5_desc_is_tdcm(*addr))
-		return 0;
-
-	/* Check for flush descriptor */
-	if (udma_desc_is_rx_flush(uc, *addr))
-		return -ENOENT;
-
-	return 0;
-}
-
-static void udma_reset_rings(struct udma_chan *uc)
-{
-	struct k3_ring *ring1 = NULL;
-	struct k3_ring *ring2 = NULL;
-
-	switch (uc->config.dir) {
-	case DMA_DEV_TO_MEM:
-		if (uc->rchan) {
-			ring1 = uc->rflow->fd_ring;
-			ring2 = uc->rflow->r_ring;
-		}
-		break;
-	case DMA_MEM_TO_DEV:
-	case DMA_MEM_TO_MEM:
-		if (uc->tchan) {
-			ring1 = uc->tchan->t_ring;
-			ring2 = uc->tchan->tc_ring;
-		}
-		break;
-	default:
-		break;
-	}
-
-	if (ring1)
-		k3_ringacc_ring_reset_dma(ring1,
-					  k3_ringacc_ring_get_occ(ring1));
-	if (ring2)
-		k3_ringacc_ring_reset(ring2);
-
-	/* make sure we are not leaking memory by stalled descriptor */
-	if (uc->terminated_desc) {
-		udma_desc_free(&uc->terminated_desc->vd);
-		uc->terminated_desc = NULL;
-	}
-}
-
 static void udma_decrement_byte_counters(struct udma_chan *uc, u32 val)
 {
 	if (uc->desc->dir == DMA_DEV_TO_MEM) {
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 7c807bd9e178b..4c6e5b946d5cf 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -610,6 +610,10 @@ void udma_desc_pre_callback(struct virt_dma_chan *vc,
 			    struct virt_dma_desc *vd,
 			    struct dmaengine_result *result);
 
+int udma_push_to_ring(struct udma_chan *uc, int idx);
+int udma_pop_from_ring(struct udma_chan *uc, dma_addr_t *addr);
+void udma_reset_rings(struct udma_chan *uc);
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.34.1


