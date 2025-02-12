Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CF0C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 09:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3jEbAOIXwseuskCe2/0uhyXK88iKw0GjqWtoWGzO/G0=; b=FU+ttvDUiDNtkzhIau9XZLGfFS
	esNy0MhvP6RAK5UZuL7jqZ1IsZQfSad1LoW/jbC288bFESsuINVEXZKD3Fm9koFKy/ZA8K59SOv2G
	/8sEUxMUnTCodW1z0SCX01Z23Knvfykr62SKd9d+EfbTYBCtrKU0oLKuVDcrmerygT/rUJ5s8jE1A
	xU0ieZezpQFRKxaYHm2BnLXEc8F1FwSZnzD25a6GFzra2qqJ1L8/2uPWcBTLiy+a7JU9s3lxhqPXv
	3Z9guuChf6VBLmqyHz8npi9w+ifzdqRbLwFX5a6GKvVJAljkVOAcVp8Y9uJ2BqUHuvoi0LK9ieT7F
	dbyQH0+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti8ie-00000006jGX-2fPy;
	Wed, 12 Feb 2025 09:07:44 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti8al-00000006hR3-2nUI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 08:59:38 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C1BbX1002423;
	Wed, 12 Feb 2025 08:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2023-11-20; bh=3jEbAOIXwseuskCe2/0uhyXK88iKw
	0GjqWtoWGzO/G0=; b=dTDteLxwcdxQRB1WSy79NwbwFn/pPTXd90xVwhkqKh1Sg
	32wpI8qPd8061dcjfDZyVceSsdKiSEzyVm6rqyET2JwxDhy43/Dfax+MUn0SvWxl
	FYFy02posUzAfTjpdjC6SkjLgbq8302Y5nXl0XjTdoLmxWrdS6JeD7M5b8bIdZ8L
	pPeugtc1OAxqLCOQk6LkRHRsKptwk7J/ESpEVhSp5TX4eLKjjhozls4BkZ2fICZv
	oiZAGFf9cM43Y3GtO35ZOCKKTZbJcmyH0VvysvQW5joYmrSgMVqeNkVwr41mkIap
	PBuyaiesOieKaxWHSMGvsq8yMtlY2182n3viTSYdg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44p0tn6vku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Feb 2025 08:59:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51C82Lrs002313;
	Wed, 12 Feb 2025 08:59:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44nwqggfpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Feb 2025 08:59:21 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51C8xHoS035041;
	Wed, 12 Feb 2025 08:59:17 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 44nwqggfc1-1;
	Wed, 12 Feb 2025 08:59:17 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Janne Grunau <j@jannau.net>, Asahi Lina <lina@asahilina.net>,
        Jens Axboe <axboe@kernel.dk>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com, harshit.m.mogalapalli@oracle.com
Subject: [PATCH] soc: apple: rtkit: Fix use-after-free in apple_rtkit_crashlog_rx()
Date: Wed, 12 Feb 2025 00:58:53 -0800
Message-ID: <20250212085853.1357906-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_03,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502120069
X-Proofpoint-GUID: oXk8rO_FymSKpMyuwOW0i7zrRQoM96WV
X-Proofpoint-ORIG-GUID: oXk8rO_FymSKpMyuwOW0i7zrRQoM96WV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_005935_983762_8E2B3BC9 
X-CRM114-Status: GOOD (  13.64  )
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

This code calls kfree(bfr); and then passes "bfr" to rtk->ops->crashed()
which is a use after free.  The ->crashed function pointer is implemented
by apple_nvme_rtkit_crashed() and it doesn't use the "bfr" pointer so
this doesn't cause a problem.  But it still looks sketchy as can be.

Fix this by moving kfree() after the last usage of bfr.

Fixes: c559645f343a ("soc: apple: rtkit: Pass the crashlog to the crashed() callback")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
This is based on static analysis with smatch, only compile tested.
---
 drivers/soc/apple/rtkit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index 4b0783091a92..1ccec7ba640c 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -360,7 +360,6 @@ static void apple_rtkit_crashlog_rx(struct apple_rtkit *rtk, u64 msg)
 		apple_rtkit_memcpy(rtk, bfr, &rtk->crashlog_buffer, 0,
 				   rtk->crashlog_buffer.size);
 		apple_rtkit_crashlog_dump(rtk, bfr, rtk->crashlog_buffer.size);
-		kfree(bfr);
 	} else {
 		dev_err(rtk->dev,
 			"RTKit: Couldn't allocate crashlog shadow buffer\n");
@@ -369,6 +368,8 @@ static void apple_rtkit_crashlog_rx(struct apple_rtkit *rtk, u64 msg)
 	rtk->crashed = true;
 	if (rtk->ops->crashed)
 		rtk->ops->crashed(rtk->cookie, bfr, rtk->crashlog_buffer.size);
+
+	kfree(bfr);
 }
 
 static void apple_rtkit_ioreport_rx(struct apple_rtkit *rtk, u64 msg)
-- 
2.39.3


