Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50016E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 11:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5idbvNyrHZyan+emBRP5C7lgPCobP/XRbc6txHnTLEA=; b=msDMsCkzT+Dd0G9tHNl51qFWHs
	F9u/bTxIZPLsj/cXXTjgKMpFfrijEYySPkVcaUbD8jHofiMfSidi+Y+YwaCWyQTAEVQP5j/hc0cRy
	ZxIdBkNX9r75JoY/t6eql436dHaQ39S2a5x6z/OXPHZKB3JsLxBHFAzwFNk7C8ATnNjLDp4QM+Cay
	8np202+OLrE/GU+p6b0HS6lKv0PhFVvXiVSbCRbSm7rTHA1oGEzyCzkYKLtG8kaKuEe3mY2Xthc8u
	eo9Oj91C7jdILu9j1EJ8hMw8//YQyjMOJZhw8kId47ZpAUeK1GUMQ+dJrIc520pt7aDCtKQE1CJPs
	qQ1LSXVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tInVG-0000000CNOG-1SMq;
	Wed, 04 Dec 2024 11:25:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tInU0-0000000CN6C-249Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 11:23:53 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B433V8p001110;
	Wed, 4 Dec 2024 11:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5idbvNyrHZyan+emBRP5C7
	lgPCobP/XRbc6txHnTLEA=; b=NDwOxvNBAUfsk3bEfVHrxExq2Id/7SZtn2eO3c
	4N6yPUpnB5VUyaUwGJ18Lw0rXbYfTp9F2plACvSnQfu45q/eJi47BkAacOaaj3DW
	ICyusTLTA9lm9IMD4Uw7ROy+JqPJnMMB9gndRciKEbxiV45LyM7H4lrOsy1FaXQ1
	VI28IPrVt/o6P2PJ1GL1LqT9RAuX9vf6HOI5ZmfnDWibXSlhwsTYKuRfPswMWOYI
	kU824B3pdLtgpeAL4BC21FpA4FdaIyq7mLcRYRDpxKOywOzpyh9mI/m5nY/L25Ww
	Aanuj2z7Q+0GHOvivRYZa6ODMR3NgADxP7+mjYVgrIp1XcWQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439trbmfat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 11:23:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4BNj3N029049
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 11:23:45 GMT
Received: from yuanfang4-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 03:23:43 -0800
From: yuanfang zhang <quic_yuanfang@quicinc.com>
To: <suzuki.poulose@arm.com>, <mike.leach@linaro.org>,
        <james.clark@linaro.org>, <alexander.shishkin@linux.intel.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] coresight-etm4x: add isb() before reading the TRCSTATR
Date: Wed, 4 Dec 2024 19:23:32 +0800
Message-ID: <20241204112332.3706137-1-quic_yuanfang@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tAWKaZHF7z1ZzZk6bCvBZS-GuwZIBb4N
X-Proofpoint-ORIG-GUID: tAWKaZHF7z1ZzZk6bCvBZS-GuwZIBb4N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=943 mlxscore=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412040089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_032352_537475_38A5966C 
X-CRM114-Status: GOOD (  12.65  )
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
Change in V2:
Added comments in the code.
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 66d44a404ad0..decb3a87e27e 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -906,6 +906,13 @@ static void etm4_disable_hw(void *info)
 	tsb_csync();
 	etm4x_relaxed_write32(csa, control, TRCPRGCTLR);
 
+	/*
+	 * As recommended by section 4.3.7 ("Synchronization when using system
+	 * instructions to progrom the trace unit") of ARM IHI 0064H.b, the
+	 * self-hosted trace analyzer must perform a Context synchronization
+	 * event between writing to the TRCPRGCTLR and reading the TRCSTATR.
+	 */
+	isb();
 	/* wait for TRCSTATR.PMSTABLE to go to '1' */
 	if (coresight_timeout(csa, TRCSTATR, TRCSTATR_PMSTABLE_BIT, 1))
 		dev_err(etm_dev,
-- 
2.34.1


