Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEB1C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 19:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DyWUe8d1haw6m8Oy1cI30UgcAmbCjyeCPJKwX4Tb+kM=; b=iG0GiBpIVeSDCX7KhuTLC/eERh
	HVceZiJK0DSj6s202H3XQ1DGNMV3bISTZFpiiyffMgTU7Lf8DPWggCATZZGJ6BUju/9kQUgiO6Z72
	SIYGfGA5TE1PJSdNJzchINhd8CMEQT6c3GCTGlVPOv5wwBev/skutI8JJZXensvV2AyCn2SFYdhcv
	TvCZ009RfcWt1gVFRByKTzqm4MdORPaFEyjRtqLEUe1/YTin25UZqg+n/RWyJrz/f7HQHbDxwibKd
	Mdr4YH2mIMaB+ATIs6bkwYVYq7B1owlxWLDATzM0K6YraQFszNieED9tqkTmws1+tW4wf9U7jq9xr
	YlKzNniQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYVMm-00000000kcC-2jfK;
	Sun, 06 Jul 2025 19:49:36 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYVHS-00000000kC3-3Ljf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 19:44:09 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566702s7017602;
	Sun, 6 Jul 2025 19:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=DyWUe8d1haw6m8Oy1cI30UgcAmbCj
	yeCPJKwX4Tb+kM=; b=gIbM0PWfjM/yE0F3sOODWqKbRZ/XqzQBvHcJcuOrtTL37
	1hj5WU5pikqp4Q26+zt/0+pTCHBgEr9xZF5C6DdrgwxfYaeSloQApuemVKqLFLo+
	Eb+mAqEAkMeb0g90+HZThSECyBL+9nXaQpgv3ZZBNumy5PPoCd4rT8x8I8WB1Onh
	Z0vwzShmmQ2MzX56GtnAp+xkndKkjoh62rqD1bOKyJzu6f2N3lKK/32a4ohUHnmE
	nLcU1AfPyRsgbyBRKM6+wT6YAQ1JAwiK8K+xnK2EpENEN1lh2/Ossz3z7TKlOutv
	Mif/W3lznQMx4Tz3diWt8GUTsA0B0Klm4SO/VpD1g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47pvkxsfx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 06 Jul 2025 19:44:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 566GBoh2014173;
	Sun, 6 Jul 2025 19:43:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ptg7ggas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 06 Jul 2025 19:43:58 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 566Jhwv8007692;
	Sun, 6 Jul 2025 19:43:58 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47ptg7ggah-1;
	Sun, 06 Jul 2025 19:43:58 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: sgoutham@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        horms@kernel.org, netdev@vger.kernel.org
Cc: alok.a.tiwari@oracle.com, linux-arm-kernel@lists.infradead.org,
        darren.kenny@oracle.com, linux-kernel@vger.kernel.org
Subject: [PATCH net v3] net: thunderx: avoid direct MTU assignment after WRITE_ONCE()
Date: Sun,  6 Jul 2025 12:43:21 -0700
Message-ID: <20250706194327.1369390-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507060126
X-Proofpoint-GUID: vPShqCo2W3JHl8gIwplnonW7g9JumuOR
X-Authority-Analysis: v=2.4 cv=a5Uw9VSF c=1 sm=1 tr=0 ts=686ad200 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=Heg8zcIur3sJgoQ754cA:9 cc=ntf awl=host:12058
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDEyNiBTYWx0ZWRfX7762+z18io8I YHRqK58bq3ToBBffQqK0EroeY63XNgOsjdex53ntMFemr2FuNxoQIwnl3NmhO0VD9AhCrK5+m8y YOmYc+rMgUy1wgvAsF2Ou2af2PiDVx30rdnKm9Z8ICUyz8PwJUlUVqt2k7Hcpj12X12fReDj+oz
 fXnHlXhp94bG94Sn3SEXKqsTeBAGBXUKQmC+R3rEosmlbEA08qMVyIATkeV3n7WH3mzKIAB7qL2 zf2TvuSVXdiJ5expgj0xgTGXFhFRI2Dv+1HWVH6VtUGcMT2qK/mw/s9G4pE+ck02lYgt52lROEV nxux0ZNxaahOd76o82muTa2DhKl05ONrKJDuSCw/HaEu7RUGEd7UBsUyAVdi7PIFpoe4SMoONaE
 c7+1carHuUTcOjkNYn5OxF3LGVStgJVihm7z1pNvRNlYeTDGa2ZJmD3CMDRRK4dpHWWn5in3
X-Proofpoint-ORIG-GUID: vPShqCo2W3JHl8gIwplnonW7g9JumuOR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_124407_060512_7D7B305C 
X-CRM114-Status: GOOD (  14.79  )
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

The current logic in nicvf_change_mtu() writes the new MTU to
netdev->mtu using WRITE_ONCE() before verifying if the hardware
update succeeds. However on hardware update failure, it attempts
to revert to the original MTU using a direct assignment
(netdev->mtu = orig_mtu)
which violates the intended of WRITE_ONCE protection introduced in
commit 1eb2cded45b3 ("net: annotate writes on dev->mtu from
ndo_change_mtu()")

Additionally, WRITE_ONCE(netdev->mtu, new_mtu) is unnecessarily
performed even when the device is not running.

Fix this by:
  Only writing netdev->mtu after successfully updating the hardware.
  Skipping hardware update when the device is down, and setting MTU
  directly. Remove unused variable orig_mtu.

This ensures that all writes to netdev->mtu are consistent with
WRITE_ONCE expectations and avoids unintended state corruption
on failure paths.

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
v2 -> v3
https://lore.kernel.org/all/20250630111836.GE41770@horms.kernel.org/
Simplify code as suggested by Simon
---
 drivers/net/ethernet/cavium/thunder/nicvf_main.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/cavium/thunder/nicvf_main.c b/drivers/net/ethernet/cavium/thunder/nicvf_main.c
index aebb9fef3f6eb..1be2dc40a1a63 100644
--- a/drivers/net/ethernet/cavium/thunder/nicvf_main.c
+++ b/drivers/net/ethernet/cavium/thunder/nicvf_main.c
@@ -1578,7 +1578,6 @@ int nicvf_open(struct net_device *netdev)
 static int nicvf_change_mtu(struct net_device *netdev, int new_mtu)
 {
 	struct nicvf *nic = netdev_priv(netdev);
-	int orig_mtu = netdev->mtu;
 
 	/* For now just support only the usual MTU sized frames,
 	 * plus some headroom for VLAN, QinQ.
@@ -1589,15 +1588,10 @@ static int nicvf_change_mtu(struct net_device *netdev, int new_mtu)
 		return -EINVAL;
 	}
 
-	WRITE_ONCE(netdev->mtu, new_mtu);
-
-	if (!netif_running(netdev))
-		return 0;
-
-	if (nicvf_update_hw_max_frs(nic, new_mtu)) {
-		netdev->mtu = orig_mtu;
+	if (netif_running(netdev) && nicvf_update_hw_max_frs(nic, new_mtu))
 		return -EINVAL;
-	}
+
+	WRITE_ONCE(netdev->mtu, new_mtu);
 
 	return 0;
 }
-- 
2.46.0


