Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F605CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 06:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iRfXu2QO7xv7UAVXNzAFO1Bv8Lgcl05baFC6HoYHlEU=; b=QzbsiYSZcJQJzyxBC3/km4qHkY
	BuQSuAcDbdbtKZkk5Vxd4wiG2s6HIrNITqhXsdbt6oNGz/wBdjucMre/NiNO9aP8YNTWnG3vlvDLs
	fG/bZqV1zbb6thKhQp1BCIag34KPA6mP17pygYFgcoc1snknTs20/SWvpMrFou+4sXIfrXNMn2GdM
	fWU5r2wMJH4QUYFPO6PQXZgvfukkrGtFrmV8o/hPT5ifWVCZZk7IQzHlu3w2WKiYzAmJnF2CS2lEJ
	Q5yBd51Lga59GYlr072oH0uXWTRefNrJaiaSNFU+vDj+IuCIYklcrveDbJ4BJexsqq9MO+MLOHnhV
	jxE7czrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB6AS-0000000FxCM-2wvS;
	Tue, 21 Oct 2025 06:48:24 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB6AQ-0000000FxBf-1jar;
	Tue, 21 Oct 2025 06:48:24 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L5s7Ln025686;
	Tue, 21 Oct 2025 06:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=iRfXu2QO7xv7UAVXNzAFO1Bv8Lgcl
	05baFC6HoYHlEU=; b=ChHmYlDqv7EQNVJY1/pNgATZgU023AronjmV6R+U+XlaP
	EUUsNj70dT1AMffCqy/V68WBF9VznhDJPyosRDw0RN7WKbEmyEi80nnMiB+Rpn4n
	8x3PZwXlsWIQelOMRXCcUCXF/+XkfUlWaMxW5+dD+CLT3WnSzoIml8p7r9wKcyaj
	jotsYGDvH/LGV9R56ErKp/5yy1bTyX1NWeO1cbCX+v/azI0hmGq3RjF9d3SigklW
	55FkfLwWBoCK/+HQM7cj9gSh9mYqcMkqHGPcYhmTPQcwTThYkBegcEs6TyA88Q4E
	dhgpziSUnedUPCnJkReCG6o4s5q85PW4kcPGb3ukA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49v2wav3ba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Oct 2025 06:48:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59L5NDHG032449;
	Tue, 21 Oct 2025 06:48:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bcj8tm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Oct 2025 06:48:15 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59L6mF4O027956;
	Tue, 21 Oct 2025 06:48:15 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 49v1bcj8t9-1;
	Tue, 21 Oct 2025 06:48:15 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: sean.wang@mediatek.com, nbd@nbd.name, lorenzo@kernel.org,
        ryder.lee@mediatek.com, shayne.chen@mediatek.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: alok.a.tiwari@oracle.com, linux-arm-kernel@lists.infradead.org
Subject: [PATCH next] wifi: mt76: mt7996: fix typos in comments
Date: Mon, 20 Oct 2025 23:48:09 -0700
Message-ID: <20251021064812.1778297-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510210052
X-Proofpoint-ORIG-GUID: pw4Ju7zReEZLduDqRzBrtA87ytdM1skJ
X-Authority-Analysis: v=2.4 cv=Pf3yRyhd c=1 sm=1 tr=0 ts=68f72cb0 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=gaQq3JutJcUdmgZVJE0A:9 cc=ntf awl=host:13624
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMiBTYWx0ZWRfX3vWivK0Td3SJ
 B/teuvlGdOp9qzX+pjD+OrpkkBlTngwvk936L8qfR+7T6b18qx7sgXhvWU+NSmey/NIWheS43IS
 LPNfz7xuR/YJDT5bwGpG6gBXveE7+EdLvgtpzj5sYAyN9VdYiB3dUpBLg0QR2cFIm0QyAb4aywM
 v0BfQ0yyNXjbEuUkO5ELzVay0bEOQh33NnamJ6I3eszl6T3+wJpP4fXo7+s11kxuobvamafyAnR
 a6EuS2wbawOHA6ZtUSNmceEindtKSsWhdnANAl8wM9nqlWHmMosorRFYU7y799r23FIXdIh2MSP
 /v7PFiZjiFe2yjQqKgC1BcIsM06FMJJIhyCrCbtIixcSvAXKNJc6OjE2tWM7LCWLrhaOiFvOrMo
 tS6pjOl4wBfZ62bWUMV9mtwc9/RCayf7LWEdZjTJ6R83m5D3aHE=
X-Proofpoint-GUID: pw4Ju7zReEZLduDqRzBrtA87ytdM1skJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_234822_572355_B8219314 
X-CRM114-Status: GOOD (  13.18  )
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

Fix two minor comment typos in the mt7996 driver:
- "Tx/Tx" -> "Rx/Tx"
- "tnterrupt" -> "interrupt"

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/pci.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 59744e5593b6..c87b03adda69 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2551,7 +2551,7 @@ void mt7996_mac_reset_work(struct work_struct *work)
 	mt76_wr(dev, MT_MCU_INT_EVENT, MT_MCU_INT_EVENT_RESET_DONE);
 	mt7996_wait_reset_state(dev, MT_MCU_CMD_NORMAL_STATE);
 
-	/* enable DMA Tx/Tx and interrupt */
+	/* enable DMA Rx/Tx and interrupt */
 	mt7996_dma_start(dev, false, false);
 
 	if (!is_mt7996(&dev->mt76) && dev->mt76.hwrro_mode == MT76_HWRRO_V3)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/pci.c b/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
index 3f49bbbba3b9..c3fdaa7550be 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
@@ -158,7 +158,7 @@ static int mt7996_pci_probe(struct pci_dev *pdev,
 		goto free_wed_or_irq_vector;
 
 	mt76_wr(dev, MT_INT_MASK_CSR, 0);
-	/* master switch of PCIe tnterrupt enable */
+	/* master switch of PCIe interrupt enable */
 	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
 
 	if (hif2) {
-- 
2.50.1


