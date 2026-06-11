Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7778FCD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 11:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ce5IvPFnAqcEf6ab8GHoKaB5RLDO74q2dOCP/D1pjwk=; b=pyVTeflCvC/gU/cqhNxqsxJpIX
	pq/IKs4o8OuQKniMC7FF14Vgk9h5IPIZcLJRfm3TWmNH2AZnEzrxI/HK3G5/asmKUajKOJEbSuGhJ
	JW/PBLh0UAhEpY2zIeG2JhTb7DWdCCom9fe/NZTTKksNlLoq4FMcyVe9fSzh57go1ocCv+vrsj4uw
	7lDes7NZYk5ri2JBBzQRmmLOL9BynAxgqoOSegyfSC7ejFIZi9Gc+gIpTH4MzuyQvbYsBFEE3och4
	plHN2ouZGZOa7Rc762lcLl1MvIqd+OuguCm8e3Bq0CoxXs6NmmAt/0LH1xCUNJ2BBVQ+Y0HyxCISE
	9eLAY76g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXdEc-00000009HK1-3vbE;
	Thu, 11 Jun 2026 11:06:06 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXdEY-00000009HIa-2pcr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 11:06:05 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B8w8ED3839579;
	Thu, 11 Jun 2026 11:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=ce5IvPFnAqcEf6ab8GHoKaB5RLDO7
	4q2dOCP/D1pjwk=; b=VRKtSCk6C12WSiuZbgGWmCNAwX+4IK1267djygrBTz/xa
	3lGHxM27qh5Yw927mPN7M+nYyl7ouzudHgV0nB76hZUTs91IoChXkgvkgCPy6JGp
	rS1A+j0yrblcWTa/HJWKKbvRydpwLa0w8OtsQ/OFAkQ9skJWUwG7yfOm6wejgjNM
	MCdhNo8Zz2MSPfl1VtZebNfZzhZRI3TSF7CRH21AefFeVbHFWCvTLKO5TcM0Ij9r
	HqJ1RlSEdeRx/FORHhp7usn5l3dXGjYRWWM++g8/B0jLMFy5W7BAwOCg2Pf97wj2
	cnjPbtKmLp3N4SXPFQAQLczClHC10R3Mt8rc9ewbg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4eqe6us1ep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Jun 2026 11:05:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 65BB37dc014786;
	Thu, 11 Jun 2026 11:05:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4eqjtvjm09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Jun 2026 11:05:55 +0000 (GMT)
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65BB5sFn025703;
	Thu, 11 Jun 2026 11:05:55 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4eqjtvjkyr-1;
	Thu, 11 Jun 2026 11:05:54 +0000 (GMT)
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pankaj Gupta <pankaj.gupta@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com, sashiko-bot@kernel.org
Subject: [PATCH] firmware: imx: Fix device context UAF in close
Date: Thu, 11 Jun 2026 04:05:22 -0700
Message-ID: <20260611110534.573543-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606040000 definitions=main-2606110111
X-Proofpoint-GUID: WO9dpoTKbTX7adXHMUuvAeu75OZnJVTW
X-Proofpoint-ORIG-GUID: WO9dpoTKbTX7adXHMUuvAeu75OZnJVTW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExMSBTYWx0ZWRfX71uLciI0Cpsf
 8fTJbjGGPKIWQDDysOF2RBmxda/erywcpf/Y42KWgwk3I8zNN3dnWBU93CobeDubeil39Slcxvu
 v3KtQD/azA3RiuhxvZhLVjIynq0YO6H2SGhBju0xpmGfTh8NiNWR
X-Authority-Analysis: v=2.4 cv=edINubEH c=1 sm=1 tr=0 ts=6a2a9694 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8
 a=z1jSPYMi4rPRFrry188A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExMSBTYWx0ZWRfX+xSexBPtlxnL
 7L7StVmJ7+bf1SkQOvDdy7U0f2vvtIWOmxgrL+Gkp8fDH3/5LNztbEgvlMOt0FnSfpsI6s23L/Y
 xri1HeGPjgFED5IVHkreGvFmmDbPUFipRykxWb2g9QEw6ZhQCWpXwCwRYS3VBRSKe3ja0J5htaJ
 x9W47UtpUt4WhGPrTwxItLUTtPr7uJX0cbQLT/Fv/QK0EJ2Nw6obr8i2l8d6RISwdb5jC3kTIpJ
 UhC+CyKLs3st7oiT6XDJe25RJ3REcLRrU0FPMhjZjYJuDCKKbUt0jiIOJtgvF+netJYd2dRugbm
 JE6tY7RSHnGAP/4VRD6VgY/vwj9JoBsMZFsgWxCUCivL600ipE9D2xa4UFGAfs/2DLddNNxUk6U
 YsFl5Db9cybngJOtWP/myqX7aBRGtx5jV+t/hRS4pMYvXOg7jObX2547NS5tiBU7gIMxH5QlBMi
 vVOB8FZ/+UdXOAhJwqQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_040602_826304_4FA92474 
X-CRM114-Status: GOOD (  12.14  )
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

se_if_fops_close() frees dev_ctx while still inside a
scoped_cond_guard() that holds dev_ctx->fops_lock. During the cleanup
phase it would do a mutex_unlock(dev_ctx->fops_lock) leading to UAF.

Fix it by freeing dev_ctx only after leaving the guarded scope.

Fixes: 2768fdfd5585 ("firmware: drivers: imx: adds miscdev")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/all/20260528094337.9C1D41F00A3A@smtp.kernel.org/
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
Only compile tested.

 drivers/firmware/imx/se_ctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 8fab3b7767b7..fc3bbd1788bd 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -887,9 +887,10 @@ static int se_if_fops_close(struct inode *nd, struct file *fp)
 		list_del(&dev_ctx->link);
 
 		kfree(dev_ctx->devname);
-		kfree(dev_ctx);
 	}
 
+	kfree(dev_ctx);
+
 	return 0;
 }
 
-- 
2.50.1


