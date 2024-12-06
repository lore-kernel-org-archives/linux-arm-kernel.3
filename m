Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523DDE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 08:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ucGUMusYobOB8Yj3mJm+2vHXtWbXKoebvtXTj9fn+XI=; b=hoUG6G3eveCRMlvs7okuXm8Keb
	RywtJUhoASbiJKxGbw+zOYl/pvfupwrrxQqumWngtanzdLFTZbQuj77uyTu9kjEOf17HG6rP5JsIh
	ccMOAOJWam3ILykgVy+e0JIJC6GiJ5/Pj2ANT8ExNbeNkPifx2H4tRoP/A4HtAuPdrHGQSv0yFnvX
	VHlclybElqVj6X3zmVjcUiPEJHFeJou5XGcNi3rgd7nJTXNG/ELGxcsudoEULx+fGwDHeiFgLexRc
	u4Xftai6ow8Q9iVnt6EG+WLFSz0l8HCcn6RNRX9gbIbEbg6IUp6gqSZIpOXN91Q38dO3M58baTgbx
	tW/78/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJTJz-00000000sI5-110m;
	Fri, 06 Dec 2024 08:04:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJTIy-00000000rv0-1xGT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 08:03:18 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B67K6dR017344;
	Fri, 6 Dec 2024 08:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ucGUMusYobOB8Yj3mJm+2v
	HXtWbXKoebvtXTj9fn+XI=; b=e4inyVavW67KDdvlEswSCGT+6KfdCBDLpi3HBL
	17a10luqJuQ7Al2/2pnajxSVIda0cWhxClP0YNAk0wlHCo9h6zghAKAVD3CmxhtZ
	yICgoOUMwRowoMnymHJw4gAqRo317y1r6RcQ8oj4Hk3HtAZ1Q2078ZFwrsar5crw
	J4pgBKGpPetXsFwN1Aqjv/yRIE/iLEP6n7LrYQFmHDI4da1UPXBnjMG04l+m4ZeE
	XlCXqXBC8Pqa6durp9nrywYsBNf5jDrEvGpaTnZyq31VsCAYUqJhnnzX/1ZA2PVT
	qhhm4qTcbTgTq+3h3vHS36dSAho0ZWa8f1F5ozCh+V+lFy1w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbnj2ut7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 08:03:09 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B68389u029826
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 08:03:08 GMT
Received: from yuanfang4-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Dec 2024 00:03:05 -0800
From: yuanfang zhang <quic_yuanfang@quicinc.com>
To: <suzuki.poulose@arm.com>, <mike.leach@linaro.org>,
        <james.clark@linaro.org>, <alexander.shishkin@linux.intel.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] coresight-etm4x: add isb() before reading the TRCSTATR
Date: Fri, 6 Dec 2024 16:02:40 +0800
Message-ID: <20241206080240.59313-1-quic_yuanfang@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: M1qrAjJUvPAp_-U5nSwFYclPBDnClUmt
X-Proofpoint-ORIG-GUID: M1qrAjJUvPAp_-U5nSwFYclPBDnClUmt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=858 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412060057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_000316_672957_C493502B 
X-CRM114-Status: GOOD (  15.49  )
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

From: Yuanfang Zhang <quic_yuanfang@quicinc.com>

As recommended by section 4.3.7 ("Synchronization when using system
instructions to progrom the trace unit") of ARM IHI 0064H.b, the
self-hosted trace analyzer must perform a Context synchronization
event between writing to the TRCPRGCTLR and reading the TRCSTATR.

Fixes: ebddaad09e10 ("coresight: etm4x: Add missing single-shot control API to sysfs")
Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
Changes in V3:
1. Remove dsb(sy) after polling TRCSTATR.
2. Add isb() after polling TRCSTATR.
---
 .../hwtracing/coresight/coresight-etm4x-core.c   | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 66d44a404ad0..c6ea00bba0cc 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -531,7 +531,6 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 	 * As recommended by section 4.3.7 ("Synchronization when using the
 	 * memory-mapped interface") of ARM IHI 0064D
 	 */
-	dsb(sy);
 	isb();
 
 done:
@@ -906,10 +905,25 @@ static void etm4_disable_hw(void *info)
 	tsb_csync();
 	etm4x_relaxed_write32(csa, control, TRCPRGCTLR);
 
+	/*
+	 * As recommended by section 4.3.7 ("Synchronization when using system
+	 * instructions to progrom the trace unit") of ARM IHI 0064H.b, the
+	 * self-hosted trace analyzer must perform a Context synchronization
+	 * event between writing to the TRCPRGCTLR and reading the TRCSTATR.
+	 */
+	if (!csa->io_mem)
+		isb();
+
 	/* wait for TRCSTATR.PMSTABLE to go to '1' */
 	if (coresight_timeout(csa, TRCSTATR, TRCSTATR_PMSTABLE_BIT, 1))
 		dev_err(etm_dev,
 			"timeout while waiting for PM stable Trace Status\n");
+	/*
+	 * As recommended by section 4.3.7 (Synchronization of register updates)
+	 * of ARM IHI 0064H.b.
+	 */
+	isb();
+
 	/* read the status of the single shot comparators */
 	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
 		config->ss_status[i] =
-- 
2.34.1


