Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22008CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 09:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aDdSxgXuG/KYYt4kVs0ZMvJZZGdyUy6t+twUF1JMoqo=; b=NL5Dpwkp+giARg/Udq7F1m3VIl
	RvpFwpP9JIfEfi2woOMEYj4fBK0diL/w9FUQXsdPJ4u7HvheaVj8lU8WvFs4C8lsKXShFboiwG7I/
	IDP3W4hwdwi+1Pd3vD69GmlBBDWfKJkK0RK+GG+7ziTGhLW8r1B9HWKWcbNFVe78bWRg6Nhc6ti6O
	tNOskzL+qAnY+v+LvOTVKtBOv8r8+cl3G8InWWXiv4TF3U8x1BOjAy3uexxSi1/pNLPiij0keVqGS
	088iKeBlZBO2a5+aCWCivLmBFgmxgLUHduFrn/T1gXEwiFJYQivLkMBP2mg9OduyhBtqCcjU8qcEf
	DqGSBE5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8EXx-0000000CgkK-0Qck;
	Mon, 13 Oct 2025 09:08:49 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8EXu-0000000Cgjc-2kaZ;
	Mon, 13 Oct 2025 09:08:47 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D7u8p1030844;
	Mon, 13 Oct 2025 09:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=aDdSxgXuG/KYYt4kVs0ZMvJZZGdyU
	y6t+twUF1JMoqo=; b=aeQpyleOjIuq0nBljQlNguz8bXCWfvqDIpGf1l6w5C78D
	D5hpmFDQUwG0O6ivbfwUNvbDPSVOs4G0JtABeGirrJalGQ/JISru4vth2zg9Ijm6
	jBQ+1rNep7YU19m9zshQSOtaJPv20HUTh78HpHQJaB2vbjtFwvJIVSRFHo/2NxDJ
	odKzHiINRopKZ1brJLbxMfOhve2k4vEc9LBPU5yJPEVpus82scg/uhhfOYvCmiAf
	dNe+e3OvfNJ7J+IOO3/0Ja7acp+c/p6Vkyls95lxHQzokN+uhXEI6GOZkANYyzI5
	yrEJvzH1diCTeEL8I/kHxbO4xExbdB0BRpjQpXwyQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qf47hudx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Oct 2025 09:08:42 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59D6njVn017202;
	Mon, 13 Oct 2025 09:08:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49qdp799ce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Oct 2025 09:08:42 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59D98euF033499;
	Mon, 13 Oct 2025 09:08:40 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 49qdp7993g-1;
	Mon, 13 Oct 2025 09:08:40 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: sean.wang@mediatek.com, chui-hao.chiu@mediatek.com, Bo.Jiao@mediatek.com,
        howard-yh.hsu@mediatek.com, meichia.chiu@mediatek.com,
        Money.Wang@mediatek.com, StanleyYP.Wang@mediatek.com, nbd@nbd.name,
        lorenzo@kernel.org, ryder.lee@mediatek.com, shayne.chen@mediatek.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: alok.a.tiwari@oracle.com, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] wifi: mt76: mt7996: fix FCS error flag check in RX descriptor
Date: Mon, 13 Oct 2025 02:08:24 -0700
Message-ID: <20251013090826.753992-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 mlxscore=0
 suspectscore=0 spamscore=0 mlxlogscore=870 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510130044
X-Authority-Analysis: v=2.4 cv=SK9PlevH c=1 sm=1 tr=0 ts=68ecc19a b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=x6icFKpwvdMA:10 a=yPCof4ZbAAAA:8 a=DCrMf5CXL9jqBmdGqfsA:9
X-Proofpoint-GUID: K1p-Oqcd0XEeZFZfYH1FfP-hQzFzUDcB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNiBTYWx0ZWRfX0HYwiB32KN9M
 otEXwPebu83zXI1XrjxQ5VA85uhc7+YtYnK/s7v0wlgF8cT5Y1s9AQ37npZPmrlHgB6u5PFJ0Md
 QsY8QbdHhjapDsutMBQMr7kS6FxXhOnN8zqJXlziFJvLRkPF7Qzz8gRj6A+g+VeJxcmn92+s9HM
 MFIzqncDZzZ2F3ey5vL+iO2fcMqNYRJVNCrbm3R6Iov4h35qm+R6yTsEkAQK9ygSqFy0aANw5CV
 pBdnKlhz54QhEqInP9Iw4xZo+PumUQ3I7wj1P0Xy/AxZ0LJ4JqanPtJW12G9bEx7H6hHHSBOVpt
 LBpuuXys3b+iL4wV7ZO/Dfx2UlLwsolJc14rwLjSeL5vQQ3b4rRL8JGLvHzqZoX9oXsCnDLaAQB
 R5QJT49QPMRi38YPaEhjGUODaqu6gA==
X-Proofpoint-ORIG-GUID: K1p-Oqcd0XEeZFZfYH1FfP-hQzFzUDcB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_020846_697538_700330D1 
X-CRM114-Status: GOOD (  13.09  )
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

The mt7996 driver currently checks the MT_RXD3_NORMAL_FCS_ERR bit in
rxd1 whereas other Connac3-based drivers(mt7925) correctly check this
bit in rxd3.

Since the MT_RXD3_NORMAL_FCS_ERR bit is defined in the fourth RX
descriptor word (rxd3), update mt7996 to use the proper descriptor
field. This change aligns mt7996 with mt7925 and the rest of the
Connac3 family.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 9501def3e0e3..59744e5593b6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -527,7 +527,7 @@ mt7996_mac_fill_rx(struct mt7996_dev *dev, enum mt76_rxq_id q,
 	    !(csum_status & (BIT(0) | BIT(2) | BIT(3))))
 		skb->ip_summed = CHECKSUM_UNNECESSARY;
 
-	if (rxd1 & MT_RXD3_NORMAL_FCS_ERR)
+	if (rxd3 & MT_RXD3_NORMAL_FCS_ERR)
 		status->flag |= RX_FLAG_FAILED_FCS_CRC;
 
 	if (rxd1 & MT_RXD1_NORMAL_TKIP_MIC_ERR)
-- 
2.50.1


