Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E476E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 10:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mRUdBUrvOR5OMLLhJd0Blsd5j07lMOMnM9Fsmzdm5jQ=; b=SO217qbFM65oD9t2WdCL+PSW/W
	4VREfrEXn6BAt5rathHhdq0DYMk0rZRiy8QxB6mSG8a0L0LVj9GVi4iaToX5QFQ40bd3xeLGMmr9z
	dH1d6xgqTZGhuST8bwic6uffQWXbB9xdEl4DDGTjXkNNZ/5/fAxnI0I6bXyyVyxAU3lxsCZVHrjkI
	P8HdlTurQJn9ZUTbiDw289Ze6CzwfedPUiHOyBlbyD8vQEUzVffCjs343IaheacnOQduAXoj7DuIb
	jDZ5XstFPk8HNhWQCabm2+TT4PSM63ObsgkePK5jfVJFNIMZYJkMlwpTWPRPdUXRswSNbU9esl9F5
	aqzCB52Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImPB-0000000CB2c-2CRo;
	Wed, 04 Dec 2024 10:14:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tImOA-0000000CAsa-2R6p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 10:13:47 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B45ouxi027841;
	Wed, 4 Dec 2024 10:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mRUdBUrvOR5OMLLhJd0Bls
	d5j07lMOMnM9Fsmzdm5jQ=; b=Wj95f/NyHX6plyu4Tt2TtA0p8IbNBipW82gtwI
	H5Bu/j9x2Bfm4dK+NXATqNq8zNVwd1ZjfJsr9lBabO8JcqVgn7YN9CiM+v9qtprn
	6W/+1TPSAG36mBn3r7FJd6eeavSPW3+r3+9qgGt0jD8uLSFbW0Xpp1AFVOn/KDCG
	Lqh85pnv+OV0ogK6yhKUFCD/gk+of9nCCy6vNYhnAmzhwnZLAJjz7LI8sYWRJZyW
	4gx6vGRf6gH7Ii0I/wRkPjfQu7UGQuIIgpNrT/+2twukBillvW0Jyc3kczcSiXUM
	RrZcVxRV/UEVtn4PWsdAMdlVWqtA2tfwQSu7ATsaDpp5DcFQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439vcem0eq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 10:13:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4ADc1O018701
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 10:13:38 GMT
Received: from yuanfang4-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 02:13:36 -0800
From: yuanfang zhang <quic_yuanfang@quicinc.com>
To: <suzuki.poulose@arm.com>, <mike.leach@linaro.org>,
        <james.clark@linaro.org>, <alexander.shishkin@linux.intel.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] coresight-etm4x: add isb() before reading the TRCSTATR
Date: Wed, 4 Dec 2024 18:13:20 +0800
Message-ID: <20241204101320.3692167-1-quic_yuanfang@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: F0QmzLYZNmO_MEcX7yaJ7-GrgTerG-RR
X-Proofpoint-ORIG-GUID: F0QmzLYZNmO_MEcX7yaJ7-GrgTerG-RR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_021346_621400_CA9D7AB5 
X-CRM114-Status: GOOD (  11.51  )
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

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 66d44a404ad0..5da2c523c30a 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -906,6 +906,7 @@ static void etm4_disable_hw(void *info)
 	tsb_csync();
 	etm4x_relaxed_write32(csa, control, TRCPRGCTLR);
 
+	isb();
 	/* wait for TRCSTATR.PMSTABLE to go to '1' */
 	if (coresight_timeout(csa, TRCSTATR, TRCSTATR_PMSTABLE_BIT, 1))
 		dev_err(etm_dev,
-- 
2.34.1


