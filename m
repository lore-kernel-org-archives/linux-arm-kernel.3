Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6A6CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 07:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/RcfmK23eMrZnuQiyO8pwAcvBrQzk3ZRoKwBv/3RIco=; b=Zt8TwEFGiDmzumgsuqEtdHSC2D
	8Z8OysoW66HiawSEH/cmE5k0CXylCk9g2tDpSftK9cE37I9XbunBjzaUiSr2480Uz17zJ7gCiMndH
	ze0xGR5cReqmgfML/Jmaf+C+nlPbggWSPr/1tWnq1VreVZMZZ5RU/4TRT7SRivclemZM+XBra+od2
	xWmMhB87mi4qpETcHsIqiASmPhOSQCUcwBsfLAW+WAQw2iyhRKNPK9NB5GdwJgRY8KQT6MfOf8xUo
	yJOETirgQysqZMz8EEwLLyiBgGbhObwt6uAj+s+oe9xLldvUspPF6xtTmNkcyvQbKVwMWsKQ4v9wF
	Zmp79JNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxql-00000006xTp-2rgC;
	Thu, 21 May 2026 07:29:47 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxqh-00000006xSf-3TH7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 07:29:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1LN0yBazgW0blb1rHhc+hKO/o4KJhs1bSkGLr3RZUBDpMZF4OTkdT7g3Kpr7NL4d2Fb3yMUuoxvyPwpr2fWMrxGtqprGph1gZ+0O1GOH5nVB40Cl1iBVCdQuGTPBG57oNpM6L5XhJfq2n7Z2jXrbW6Ng61ncHQYXXeoTczALvKXU3U3EykA8zWilRRc7m9NJS3uvtnHy2TyJRyKHIMvq71aeb07Um7SKPdtPPPrcEvPXdOBKNpuhJQ9NejQcyPLaGVuHYlq4MyJ6u/TYvSSPjdAHfR4iJ6phmSbKEwzdzvcSC5OpfttdLiOkUbMiCXDKnBIUNGhvm5jUEzADRFpPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RcfmK23eMrZnuQiyO8pwAcvBrQzk3ZRoKwBv/3RIco=;
 b=nXQSvXNHtA3bTy5A0WA2bUe5KjA5CPupTuSzU4XNTblDy5vNsEa+2LaiFVxFy7FKgJZdtRedGqmPe9PN/DUabAr9D/a6/f6K/5vdNbrxCVCgM1LxY7QYR1rSxLEWDgFBCJpT0mGM3jgIvUOxSCcvhs1w82rTGCDZJyZEjnpd4kiwaEdE0xEN5dmCI/thkxvX8D6MzOxQBod22Nc8C1iWtUZh6C6iOFztUFa4VJlvKpsAb1aNKnQ2PRrc2zCrvNVuONMpw8mP01TlHAalqCUocvxCIinRjFBSFALuLVfpVUepWqOngJumZl5wiuJEsMkz+MGIN0CqfsbarmL0LxPKpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR01CA0154.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::34) by JH0PR06MB7210.apcprd06.prod.outlook.com
 (2603:1096:990:8d::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 07:29:29 +0000
Received: from OSA0EPF000000CA.apcprd02.prod.outlook.com
 (2603:1096:4:8f:cafe::ac) by SG2PR01CA0154.outlook.office365.com
 (2603:1096:4:8f::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Thu, 21
 May 2026 07:29:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CA.mail.protection.outlook.com (10.167.240.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Thu, 21 May 2026 07:29:28 +0000
Received: from guoo-System-Product-Name.. (unknown [172.20.64.188])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 86FB441609D1;
	Thu, 21 May 2026 15:29:26 +0800 (CST)
From: Jun Guo <jun.guo@cixtech.com>
To: peter.chen@cixtech.com,
	fugang.duan@cixtech.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	robin.murphy@arm.com,
	Frank.Li@kernel.org
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	Jun Guo <jun.guo@cixtech.com>
Subject: [PATCH v7 1/2] dmaengine: arm-dma350: enable ANYCH interrupt for shared IRQ wiring
Date: Thu, 21 May 2026 15:29:23 +0800
Message-Id: <20260521072924.3000282-2-jun.guo@cixtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260521072924.3000282-1-jun.guo@cixtech.com>
References: <20260521072924.3000282-1-jun.guo@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CA:EE_|JH0PR06MB7210:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 69bd018c-f766-415b-beaa-08deb70ab15a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: xYNIPzNzE9RUD/dG4XBw6hsqSZBuUuGXeXgP0KoB5pDoTLpkJWNl6g+6jp1WdKAfKM254ZYNAILkOl2tdzUQjvOBUn8upR6bQR/2ViB0jrYv7MkVD/C2uuf7881iRP4OgKPlEbUI5ufAT8T9kBQwNqoJRWfXitHbSZ8Nup3RA9jTMrbLwHJ+F0zAcM6hYFEugvNdNzD6u0rzMot4WHvhN3fMz6NzZsfFFb+Unx7Cgal1HGtAIF4I5XeqJJpq6dO3jTypPxGQirRPPFnbxeIVbJchx9WxmbmO7rWQtPKlXYS3If9BwNfwHjrZN1ExI9HVAJCGzV9HpTeSSnqnOiQJxAuyGdbI7/jW/QXbPvudfDjur9Kfu+mC8AlWZfS7thVeLWv1Y5/j8fYNUuZ/mn5djDEFEET6Iwc//pLaBMFfXwgxPWb1RTdZm4qgws7JYvsz3Claf5PXPwca7/H59PSi5XW5Am+E/HMDFdj39RaYTteJ/8QdmeZ0PjF5n3rh1Jkj7oHMu1EWfswwqbg9h6b/Ea63PZXLdztroLu2dz4y1FEq8w9icnsTiDuGcCO/VLCtWVv/iwl39oOkKwh5Of7km6WB8nDvl+nfVsYPbut0dvbxHPiCO7rFLVzOqBuMmy9igVlNS4ZS6c4TDsNct3CiKd2EShQr/KY2dWkEJZdsOQQvJYYZ5fR23M9ThKxka/aF6Fgm6Txo6ds26uOlbJWUSQZm3sl8EZdwEj/uwpjtTej1zmwzNA2Buv0moPrKXqdPBT+hziYh9c6eJ5NAcCqdgw==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7UMuOIDWE+t80N65kWd9RJrP6rQKkO5lT6sDtdQ4/1FRDxpM6oCzI+EoyHPDE7LQwJ3rxGmd0iB5upumrYtqM/nVCphvr7WVU7ntN95k6O/HrWUJtz6KAR8LaRP+Ahk3nev36dYj4EJls+QY7Ce8tVM02s1mdqlXBKtq6NWCDvpXCjCPwpnZtxZ+XO71YLeUoS+xm2e16JHIN0CtT+mUTHDKZclV2QDkm4t+on7K7x+8Ljn6RMjaS9Df+H3nxS/EqsRUIqnfHCH2jb91Wgo6svJbD/WZcZbap/nQdbfzYfSuAO9kfVKitCm49cPAK4MepK2/SSiGhIVGvTksCcFSOfigHjz47/q2bvrQ1VW1r+P13Gj12ChUJOQBme5MvE7ouf6AppPG4CwwstmnL6bQffgHlJnFjs6+36SwueDczy58vZzVvsFfdRkcdNEg9N2T
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 07:29:28.3849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69bd018c-f766-415b-beaa-08deb70ab15a
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CA.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7210
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_002943_868145_BE2034CF 
X-CRM114-Status: GOOD (  11.19  )
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

Enable DMANSECCTRL.INTREN_ANYCHINTR during probe so channel
interrupts are propagated when integrators wire DMA-350 channels
onto a shared IRQ line.

Signed-off-by: Jun Guo <jun.guo@cixtech.com>
---
 drivers/dma/arm-dma350.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 84220fa83029..09403aca8bb0 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -13,6 +13,11 @@
 #include "dmaengine.h"
 #include "virt-dma.h"
 
+#define DMANSECCTRL		0x200
+
+#define NSEC_CTRL		0x0c
+#define INTREN_ANYCHINTR_EN	BIT(0)
+
 #define DMAINFO			0x0f00
 
 #define DMA_BUILDCFG0		0xb0
@@ -582,6 +587,10 @@ static int d350_probe(struct platform_device *pdev)
 	dmac->dma.device_issue_pending = d350_issue_pending;
 	INIT_LIST_HEAD(&dmac->dma.channels);
 
+	reg = readl_relaxed(base + DMANSECCTRL + NSEC_CTRL);
+	writel_relaxed(reg | INTREN_ANYCHINTR_EN,
+		       base + DMANSECCTRL + NSEC_CTRL);
+
 	/* Would be nice to have per-channel caps for this... */
 	memset = true;
 	for (int i = 0; i < nchan; i++) {
-- 
2.34.1


