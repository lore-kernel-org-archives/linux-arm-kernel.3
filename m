Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D25AFEA83E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/RcfmK23eMrZnuQiyO8pwAcvBrQzk3ZRoKwBv/3RIco=; b=bknOfFV8P8PuakWCC2KWqyOlUz
	odoEFQlNdILwqGMcUh7ErGKLVDBa1n6EcadjZdVF29Xrh7/e2S0PmEPsA4IQuSegmAUnkyaYIXdaZ
	diu5QNDlI7xvUS9mxk3e98z/6xm0xssm88EgYKfasfdAyPeAKAV+CvQx4DMMlj30X4g1BRZGcs+Tb
	UPk5Lw+/daG/MuVb4FGn6Lt1iIlerlG5TclPegqsIBpRmR30qVxbTkiBtpG6vigIhz4fGpq9cL3Xn
	jAGYnVbyZl39t5tqUz9L642s0Q8df2sWoFOxcy2AsaP+kIfHtPUOnBqwKuObf81FgjfKj/w517iI7
	D0GZTvGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MJb-00000003FMt-2q8E;
	Wed, 25 Mar 2026 11:22:23 +0000
Received: from mail-japanwestazon11022120.outbound.protection.outlook.com ([40.107.75.120] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MJP-00000003FH5-0syU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 11:22:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T5EuAb/+EpWzto9PY28s875SlTXRc2rr0CcHBnKUAd8GAS4WjO4qn6oUYs403zbtLZUIuo0cOdoxPF1O/45FuyNPXgurPnd1ZrRkCMHXTZfIrb7pngW0CZF7K4u38sN73XLbuJE7XRHaZS7g2fYjxJGdhcSwZA1AwcYb05sxtLQwSZDGsYrmRkisekKLS2jFxeOIsY4HZ2No03oWNNyms/73OuG/3jFb2rx3FMmUWH5X1Htk//kxLlnqQKdD0V03wA7qgAMMo+N2aZ898fQun/ZCxolvqY1v/aAFCz0xcGGKA/eaPzPNHVrW5yrmKLvs7dwql5DlpaatkJU8RX7uCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RcfmK23eMrZnuQiyO8pwAcvBrQzk3ZRoKwBv/3RIco=;
 b=yu91o7UtRBiLcNVDDjn+HgEiJ4OSESbVf/OlxDT+iVp1LEaNLOpwLxd0PtzQGgfing+Owq36cBYbO0wwZM7+Cmu7TibiQBEoW9PQ13JuIb7Io8Y6GUmpL39G+dKwtY6BV6gPDXkEEzGesjx4vEwBAvazDHTWO2HxQq6grMBipx65TQahDgj+ABWA2SLbEiwcrVkT3rJXkXH1/t+APDJ9goNxNzHQ0HA9P+Au1xWmyODoQWIMkZvmsr+wWgAOErZ3YDwD0TxIokgi8M6BqPzzB932x8A35wIbDAJTjSSsmKGGAfokI2yB01s1STBZ+5vNevAzJKoflyrBPJmjRBi/FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCPR01CA0031.jpnprd01.prod.outlook.com (2603:1096:405:1::19)
 by JH0PR06MB6581.apcprd06.prod.outlook.com (2603:1096:990:33::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 11:22:03 +0000
Received: from TY2PEPF0000AB83.apcprd03.prod.outlook.com
 (2603:1096:405:1:cafe::19) by TYCPR01CA0031.outlook.office365.com
 (2603:1096:405:1::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 11:22:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB83.mail.protection.outlook.com (10.167.253.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 11:22:01 +0000
Received: from guoo-System-Product-Name.. (unknown [172.20.64.188])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 473B64126F9B;
	Wed, 25 Mar 2026 19:22:00 +0800 (CST)
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
Subject: [PATCH v6 1/2] dma: arm-dma350: enable ANYCH interrupt for shared IRQ wiring
Date: Wed, 25 Mar 2026 19:21:58 +0800
Message-Id: <20260325112159.663881-2-jun.guo@cixtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325112159.663881-1-jun.guo@cixtech.com>
References: <20260325112159.663881-1-jun.guo@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB83:EE_|JH0PR06MB6581:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e4343c19-d5fb-4620-f9c2-08de8a60bcb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|7416014|376014|82310400026|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Wph2GkWum0a+qatuj4Q+14An9C0GYd2bANsWI66xI0OXvZX/tKVADknTLhIRUfQrofqr5rL5VbjLjtX6oj8Au/eZ/r99cktloXJjvelIHWbkLvbpVJnV6uQAxaqW2t9seF0Hs9o4e+mc2d/jx86sVsKSvR4hQufVrXWTS86qzHZmk9gsaSKjnUkQVOyC7zBTLxZ0Ytf6IQEBFVDmZN4HNeUi3iYvG4O6txnnTrPwiPGJgOPmvqqieteFOAHPXrnBJulDbzxvNHiN6JavFNrmWob/QWZ7ck7bTrnW7Q9ufzbSKm9pzV8+g8IJ0vHuEhp/4l4fwtv3eRtjd1yn2RGjaGyE2Eo4UEMIzkLh2HbMr9AleX0zWBQSHEFl9SO2gQM+IO/8uvIXmykbgtQrmtXndTNhEyAUEwm3TPnJ0OLPU+NziHRox6WCOsd3VIm06nk35n5bZlYGVKDlqUZkokon324VqQfWARLDvO7Q5rdk+/lN0410DGAY9Ig/lzjgGDlDLX6PS6xG84qCzlQW+73jAiI3TbXDP+0PbWzAjmdlKUfFBrfi986dqawZ9D42uySKhYYTLBemsU3VpaRuPma7hLX/rTbZCQABulwFoIsMIQfZ2/IzhLmf+I8Mivb3n2xXq4VD1l7S5onbu2SjeDFM4N5BoYJ3Mwm24f05mxwgQhWobVbV/lkkD4H9u1js1WeRUD2Z+spTpViLcVAz/dOgUd7b299u3uXaP4ITq9LiNFRoF0woQxAcx4prNlGyYWq8t2aq3WsOmViP0zmiQHLXrPa4uvlgoSdu10KRJzxPXhYUBTyNgxqhBm/VAEeN/pTX
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(7416014)(376014)(82310400026)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rLSgBHwHcuKpu0xowvsPGP0oS8C/yvn4ZgEOWKtGQWcEPjIa16CMDX4WCj/9oNDDKBHJmKNyd/tTITINdxKXG32oJUclcy5C7Ltz/D0LN2h68ZuCsLJVI1nbDqN4/pqd63qUExj77nstNti+G25irS2m8Y1OgvwW7UChveBr/N/g256e/YBwjKe5lmVlb1s0544BBHanE4KIhRLM9RtwWAkasYly0Qa7h9w7aPelcT9SM482hpnNHi730/NacmVwQXx6HZoAvpEu8yeWitfafjT+UBjhwcuw9uC7/nTyk33i+iF97/PwFNUmFinQMSeQQp1/udIMbea4NDISMoHxbMhGxx4BioUHdTU9Cg/eR1ZUL/Uqa+1C9qcagXryklxbOZwhaZS44u8ga7nNcWK3YaJGnv1phBjqAhh42ejoT0Xeaa67lbZ0HiPX/g74+mk/
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 11:22:01.8228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4343c19-d5fb-4620-f9c2-08de8a60bcb4
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB83.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6581
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_042211_247989_B5FA7544 
X-CRM114-Status: GOOD (  11.26  )
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


