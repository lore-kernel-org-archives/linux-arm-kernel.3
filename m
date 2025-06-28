Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9670CC7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 10:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ae72umgiYtiNIqSIpFA7MtGiQ10aNaJ+Z7V+1qQL1rM=; b=ScPmTdGm7PdwECg3JrcyLnRMDr
	Cs9jEuPVtQ5WF5pj97VgQWewEVDS6ZkgvxlRUesae6gChoqbIP50nS05RYsVyOtWrSB1L8eNY8nB5
	lNpcxPUes8SVLApTUsJJ+FzP4CmKNJGrh4XMnA5GkhNcUoptBP8ugeV5fXLMOlI4w2AmdUVGHk3RJ
	A+mOOGB6BQTEmTYFJHfLElmor8mEuy+AsNz906ehHMVJlFJmCnWVcv0HtlbMwnpUzjChyowiMdYdg
	XfjKonmfhasRx//Z5hK77w+pNkcPhIWSBX+SkA/FLZOJAuQ9wbDpZPuHlmkX2fAzMayoa87fnQPJM
	kpCQBcbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVSM6-0000000Gffv-1spP;
	Sat, 28 Jun 2025 10:00:18 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVSF2-0000000Gf9a-3Utb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 09:53:02 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S5f6hg012201;
	Sat, 28 Jun 2025 09:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=Ae72umgiYtiNIqSIpFA7MtGiQ10aN
	aJ+Z7V+1qQL1rM=; b=cZwka4bpy0oVFlkVdr0I0snQlXojMCEJTqmskNX4np85u
	EP7uLfVXgCqslQsdWEOMERkZexWMPOO9eDUv0gD9pxkC0NCR16WafurL/bxWs9+Q
	yp4Y8phbqg5I5c0zTyhzkvZScUw7XJIjBXqhDsxSDzLIBVR6PpW6vNGRuE4usaj/
	ueaq2L7tV+wNPcGDiA83BwMVqLTz9OqyUZcX1aX08dECFJUt0d4iiflZZ8QVtOpu
	jozq8C2DHF9pGxtAOB26meYDQ3Zpc5khCjVzpcq2cmSGgZiAuiV7qiZZNHmqH+ww
	YfwHaHlZVAPhk2v7K8CgLP8lczJViJ/uvvBRNAFJg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j76687kc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 28 Jun 2025 09:52:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55S9LeYF014207;
	Sat, 28 Jun 2025 09:52:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u6r8f8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 28 Jun 2025 09:52:53 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55S9qqR2009214;
	Sat, 28 Jun 2025 09:52:52 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47j6u6r8er-1;
	Sat, 28 Jun 2025 09:52:52 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: sgoutham@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        horms@kernel.org, netdev@vger.kernel.org
Cc: alok.a.tiwari@oracle.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] net: thunderx: avoid direct MTU assignment after WRITE_ONCE()
Date: Sat, 28 Jun 2025 02:52:19 -0700
Message-ID: <20250628095221.461991-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506280080
X-Proofpoint-GUID: 28NGkk0EG0roxnsCG4rY-kj-ROsDwQTD
X-Proofpoint-ORIG-GUID: 28NGkk0EG0roxnsCG4rY-kj-ROsDwQTD
X-Authority-Analysis: v=2.4 cv=b82y4sGx c=1 sm=1 tr=0 ts=685fbb76 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=6GJOchzy3z8SWhoumhsA:9 cc=ntf awl=host:14723
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDA4MSBTYWx0ZWRfX7T9s0A92THvT DX3/F38hBL3wrkdQj1tm0eOzavSjF4r5NyyJKLZa80w+ITNTA159pJEtgZVOsuT/mBgyXuy5u92 h/Rk+1Z091eBZ8b+SbFdPkleE478Mrs4CxDXLTLxWRhrsFkOr+ceIUaQdlLZPao/UVaSZWwjQd1
 2qN9DFLlHJ5L9XoCHUo5xZs2hTuub29ak1kQoUdFAxu4F+R/LUIxtR2S4bNgZNSGH8OHtRJHKKZ f/+QmcEo9E7CrV+ueeQaalmwJa0yUcIDFJH2PU5r4EQ2xnsMFYW1JY+NeUCyilA8NS/umCi+CfT oHTqMUesPWoEFnNt5ZQ6rTLBrXr65yJ4ACkYKw9KDooEkHHiNYDvxPA+ASgmo+gkjDDjVHH0iFf
 /rwyrLZNb1wYeCNAf9b8j9OG4BiayVy6YI/3vZpJMPmNF1lldcNc9r1kbPz3kBRcM5Num4GT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_025301_351113_DD6BBB17 
X-CRM114-Status: GOOD (  15.35  )
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
directly.

This ensures that all writes to netdev->mtu are consistent with
WRITE_ONCE expectations and avoids unintended state corruption
on failure paths.

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
Note: This change is not tested due to hardware availability.
---
 drivers/net/ethernet/cavium/thunder/nicvf_main.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/cavium/thunder/nicvf_main.c b/drivers/net/ethernet/cavium/thunder/nicvf_main.c
index aebb9fef3f6eb..ba26ba31a28bf 100644
--- a/drivers/net/ethernet/cavium/thunder/nicvf_main.c
+++ b/drivers/net/ethernet/cavium/thunder/nicvf_main.c
@@ -1589,16 +1589,18 @@ static int nicvf_change_mtu(struct net_device *netdev, int new_mtu)
 		return -EINVAL;
 	}
 
-	WRITE_ONCE(netdev->mtu, new_mtu);
 
-	if (!netif_running(netdev))
+	if (!netif_running(netdev)) {
+		WRITE_ONCE(netdev->mtu, new_mtu);
 		return 0;
+	}
 
 	if (nicvf_update_hw_max_frs(nic, new_mtu)) {
-		netdev->mtu = orig_mtu;
 		return -EINVAL;
 	}
 
+	WRITE_ONCE(netdev->mtu, new_mtu);
+
 	return 0;
 }
 
-- 
2.46.0


