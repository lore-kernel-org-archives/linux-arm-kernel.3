Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D30C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 16:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ldbJHSGD6BN1tNm6JoquLLyny5cpnWSKdxNIJd0j03I=; b=tBqHu+N1+AGLNGuHKfQppeOxxx
	R4FxotxlMzq57Ki5tT6jxHXzt12eSqrCwEoUzsCeJBWoSds9MjkmmrnfHU8IAbLppMnMlSX6lZUs2
	fB37ERAU9R/RPlSnXCud7LYeVgLNzANECmdWOBOZOEkGrh5cj8+zxaZMrw7BX0kkDOwqhkwVL9KYM
	FScXrUmi+0kcKsyfkj20uDHmz/S4vT2Bc4lhO0LxuIc2FfGiHjW6qS0RgtweQb1Ud0LdSG3AlOrGy
	nohlE8s7Hr7ZaprBYU97UX3kzvlZH2icQhHrt8BYsIaYhcALI60VPdfWp+NQwVk6gwvB0Ql4omTk1
	XXuVk8XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubiBe-00000005hPE-1LXZ;
	Tue, 15 Jul 2025 16:07:22 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgh6-00000005Nkc-0gv2;
	Tue, 15 Jul 2025 14:31:45 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FDZCCb003484;
	Tue, 15 Jul 2025 14:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=ldbJHSGD6BN1tNm6JoquLLyny5cpn
	WSKdxNIJd0j03I=; b=REd6qW+sb+kmKnx6614RWXCTVg0BPjgC6zke0szCjLoSg
	/UmTm7fKZ07+GKrj6qBW45uVxwxOb8AvS7Xub78zLu2Ux/GfSiDDfzT/bP/Qky2S
	Ate2pCo43c+GshO/pNbUdX28RKooljTAe8pEjant68ZdnsZMrDxeraKPZ1JvmzMk
	ijaMBCtEiEgXLoxhmnP8GuDyz5tXRkmAMZnu1/oLuXL6B6tc1rsdK5hVIAhMYL2g
	27WdCnts69IAE4eQzhs4S5K0cv5p57+cnsqpQ2aJPmxlsC6rKQWPlNIuE3hzfSTe
	KbHUYHFY6lQ+w6KQH77qD8Gsfu/w4daP8/gsM3v1A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uhx7y0sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Jul 2025 14:31:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56FDkV2B039729;
	Tue, 15 Jul 2025 14:31:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5a2mmg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Jul 2025 14:31:33 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56FEVXSX003538;
	Tue, 15 Jul 2025 14:31:33 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47ue5a2mjp-1;
	Tue, 15 Jul 2025 14:31:33 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: sayantan.nandy@airoha.com, lorenzo@kernel.org, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Cc: alok.a.tiwari@oracle.com, linux-arm-kernel@lists.infradead.org
Subject: [PATCH net v2] net: airoha: fix potential use-after-free in airoha_npu_get()
Date: Tue, 15 Jul 2025 07:30:58 -0700
Message-ID: <20250715143102.3458286-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_03,2025-07-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507150133
X-Authority-Analysis: v=2.4 cv=auKyCTZV c=1 sm=1 tr=0 ts=68766646 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=OuZqvr71sMSAxPmhYTsA:9 cc=ntf awl=host:13600
X-Proofpoint-ORIG-GUID: yq85vw0bhCZ9pqyw5f9UCXT-YXd9hfet
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDEzMyBTYWx0ZWRfX3lXcLIo5kx/O Q/PXuvI1OaA1ufqy8ECfGaZ6oarJI4vX77QsAgAx0s21XJVbIdN3wcN15n9xvDRILIG+RrcKJa+ J2Y14NXBdmOfmNJgbIR2YvGr3gvDKP4aDIRRj04iYpgNjj9+csBc7+ygOUEqdNyb9e8E+p141dR
 bWYu/LgItRg8HBYDHKmAxJsub4ypZ+YLXcbF815NZfuCeAunMmxBLOkVqYYbxO0jgQFbkYRWsKB Lp7L9Y3erWXH6+cUbawrIQg8syZSe1N8Oh9sZwloolD0pHO3NvIgPCdL0GbDLXbGUQocSBEbQsd 4E6u5QPvXdXU4ASSZSzB1yysIq3oW86xCbQAOn1idjRagGxeNChpjWPkcbHxcIwQWFMa2nsEZoK
 trdKqZLUC+DlSIKOzpv263BprOWBn2/fDjopK39l/J6GVB3mQNenJZlORcYJmScmP2LI0ryy
X-Proofpoint-GUID: yq85vw0bhCZ9pqyw5f9UCXT-YXd9hfet
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_073144_316648_EAEDF4C7 
X-CRM114-Status: GOOD (  13.38  )
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

np->name was being used after calling of_node_put(np), which
releases the node and can lead to a use-after-free bug.
Previously, of_node_put(np) was called unconditionally after
of_find_device_by_node(np), which could result in a use-after-free if
pdev is NULL.

This patch moves of_node_put(np) after the error check to ensure
the node is only released after both the error and success cases
are handled appropriately, preventing potential resource issues.

Fixes: 23290c7bc190 ("net: airoha: Introduce Airoha NPU support")
Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
v1->v2
call of_node_put(np) after printing np->name, as per Andrew's comment.
https://lore.kernel.org/all/555d7fb6-091e-4c10-bfea-85898e644481@lunn.ch
---
 drivers/net/ethernet/airoha/airoha_npu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 0e5b8c21b9aa8..1e58a4aeb9a0c 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -401,12 +401,13 @@ struct airoha_npu *airoha_npu_get(struct device *dev, dma_addr_t *stats_addr)
 		return ERR_PTR(-ENODEV);
 
 	pdev = of_find_device_by_node(np);
-	of_node_put(np);
 
 	if (!pdev) {
 		dev_err(dev, "cannot find device node %s\n", np->name);
+		of_node_put(np);
 		return ERR_PTR(-ENODEV);
 	}
+	of_node_put(np);
 
 	if (!try_module_get(THIS_MODULE)) {
 		dev_err(dev, "failed to get the device driver module\n");
-- 
2.46.0


