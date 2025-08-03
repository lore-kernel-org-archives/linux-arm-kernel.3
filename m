Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E569C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 10:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NV7+xIO18a9mpzCCbiQiR3u2YyXIZWJy7PXkPvbwt/g=; b=x/DSjyaArtcwLE8umtIwr/EHk0
	T1vXuC+XozLQUmD0n0AcUsY8J6rmvKSPdM4A1xyemj/Ro+E+q08Hy8xyrkcQ4eX4WBCy9uiSYNwPg
	LD+3cBAvCrehmbMQ10D7dSF6akYllpHhL3SHwHjC96wg1qrhB7YGCuKnigxy7se6+t+LeKiA1bone
	VtbZKuDxPjTKaw2/ULSb5D0AfiF75oQeNtk+l0uVBBZGGEHn8WfsZr44qwHIyEth2vxr4hdemxnQz
	yWwApqf9E+VZKSy7jD+Z4H39argGQLBY+vMtJLEw8SJicOfJMhacagGgwo8uZ4eoJ2b+xUJTftaHE
	fWXYR5Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiVxb-00000008bCs-1SLK;
	Sun, 03 Aug 2025 10:28:59 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174] helo=mx0b-0016f401.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiVv0-00000008b2Q-3WXT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 10:26:20 +0000
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5739pRHn014688;
	Sun, 3 Aug 2025 03:25:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=N
	V7+xIO18a9mpzCCbiQiR3u2YyXIZWJy7PXkPvbwt/g=; b=bLMCQc+4Ql605/vw5
	JAvQTXGo8T1O4Y+SfgghxRUQXu4a8NBVppEa/0yb2fFFXsiOqdkApYfJVqp+tHAG
	x8OYVsx/hOtC8JIYcxvYBqnLmfkiNsCrAjXuZ6UEoiay4frE05lckelnvoPkpx/k
	gRCN/MCwBorZV4YvzC17RbtGoWRDTxX2duzoM6SouTCBfBH3qlYNE+QQRc68DqBi
	R90XMyblIwqP0/W89IxXi2GTHpMqQeYtwA1TdkPLUfOOTI11yOWqLQYv+yBb6ufN
	8lcL4psFGKcFUEj8aMg+OmEhuyGdXrfDn5EjH+VHYZNjUWqnbQX4UFO2uZL6I8q2
	J3dwA==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 489g1qhhtj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 03:25:56 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 3 Aug 2025 03:25:57 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Sun, 3 Aug 2025 03:25:57 -0700
Received: from c1illp-saixps-016.eng.marvell.com (c1illp-saixps-016.eng.marvell.com [10.205.40.247])
	by maili.marvell.com (Postfix) with ESMTP id ED5863F70A5;
	Sun,  3 Aug 2025 03:25:52 -0700 (PDT)
From: <enachman@marvell.com>
To: <andrew@lunn.ch>, <gregory.clement@bootlin.com>,
        <sebastian.hesselbarth@gmail.com>, <tglx@linutronix.de>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <enachman@marvell.com>
Subject: [PATCH v2 1/1] irqchip/mvebu-gicp: clear pending irqs on init
Date: Sun, 3 Aug 2025 13:25:48 +0300
Message-ID: <20250803102548.669682-2-enachman@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250803102548.669682-1-enachman@marvell.com>
References: <20250803102548.669682-1-enachman@marvell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAzMDA3MSBTYWx0ZWRfXzbftkW9BeKvO aHo7Uyq3G1tcNQ2x7+S4Zc+ZYSbPk5Vda2QgwM4nIaVuZPU3aceTPHSufO3ccH7XgP2CDn0DJ88 dobDQSYg5jNMGoVvobVK/7k0FTyJl4tkYsY0ivMcHXfCKkDLNMzqoiPRSrW+FmLhUdm9jPjOQDy
 BdIZjhm2hBBAfMvtgNvGyWtZ2iLM2kyaMuJ6B3IjKntVfTxxrQHFmF/6yyqkaKofATl01Xcd4JM dXiHfPHflDeUyI0HtJKImIde4Dhh1zIaIiWXTtMR9zuS9k+ZEOE+OEan4wJSEDuIWoUrO+tgJ6u d0Si4Qx3Any8vYXAXNs00xoezDcRVWdvwXcqfBWZxve7EbmJZBRxJ1Xp1rVeAnkM9v5Yx+/c54d
 pkMzXJdfmi1hZDMSrQKmMTdYtwdIxd+M6FWvt7OHviwIbDkmE1UnTwyJGb229dFdkCnooP1v
X-Authority-Analysis: v=2.4 cv=PYD/hjhd c=1 sm=1 tr=0 ts=688f3934 cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=2OwXVqhp2XgA:10 a=M5GUcnROAAAA:8 a=2JhQ9zA4wheWbDJ3V88A:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: I7M_gXO2ez6mLly5jGVvd1cvMhjTEhX1
X-Proofpoint-ORIG-GUID: I7M_gXO2ez6mLly5jGVvd1cvMhjTEhX1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_03,2025-08-01_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_032618_885344_857FC52C 
X-CRM114-Status: GOOD (  14.62  )
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

From: Elad Nachman <enachman@marvell.com>

When a kexec'ed kernel boots up, there might be stale unhandled interrupts
pending in the interrupt controller. These are delivered as spurious
interrupts once the boot CPU enables interrupts.
Clear all pending interrupts when the driver is initialized to prevent
these spurious interrupts from locking the CPU in an endless loop.

Signed-off-by: Elad Nachman <enachman@marvell.com>
---
 drivers/irqchip/irq-mvebu-gicp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/irqchip/irq-mvebu-gicp.c b/drivers/irqchip/irq-mvebu-gicp.c
index d3232d6d8dce..4b2cad09bc71 100644
--- a/drivers/irqchip/irq-mvebu-gicp.c
+++ b/drivers/irqchip/irq-mvebu-gicp.c
@@ -178,6 +178,7 @@ static int mvebu_gicp_probe(struct platform_device *pdev)
 	};
 	struct mvebu_gicp *gicp;
 	int ret, i;
+	void __iomem *base;
 
 	gicp = devm_kzalloc(&pdev->dev, sizeof(*gicp), GFP_KERNEL);
 	if (!gicp)
@@ -236,6 +237,15 @@ static int mvebu_gicp_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	base = ioremap(gicp->res->start, gicp->res->end - gicp->res->start);
+	if (IS_ERR(base)) {
+		dev_err(&pdev->dev, "ioremap() failed. Unable to clear pending interrupts.\n");
+	} else {
+		for (i = 0; i < 64; i++)
+			writel(i, base + GICP_CLRSPI_NSR_OFFSET);
+		iounmap(base);
+	}
+
 	return msi_create_parent_irq_domain(&info, &gicp_msi_parent_ops) ? 0 : -ENOMEM;
 }
 
-- 
2.25.1


