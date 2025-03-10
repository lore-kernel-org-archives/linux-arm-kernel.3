Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE112C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 02:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vU0z+9J+rBNCxPQO8HZEdGSqw5gIcCbIf0D0nliP6Gw=; b=laaYKv5eE0kowoG53RkW7bIW3V
	fwrnnPsO2kT4DWTd8Z3CBGzzSuGLHzA30sB3EJee4KJRIwgaJ9GVEV/Q5NqYVxXYgO48pgV71NLWP
	5jQzjB/IOgDcN4ApGgTAKDQQvt4QOjAf+AJBkvsDdapdU7MEWi1knkq+jluW22jmW4+waPzIP9AKB
	tZtALFWCZsrPlvxss3dz+CyGZwc7td9CFMH70AUE5dkw+WuMjlRxysVq2heJH4i+PLbv0OPpnvllE
	+L7QZvFeHda5IqsejkPZ2t9MCE3mlBBig4mIav2Huy19sVVSjhrma/IGBAh8w4b0oVNtMiDqAtyzW
	vU9xy1vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trSrC-00000001Rfv-3BRC;
	Mon, 10 Mar 2025 02:27:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trSoR-00000001RNI-1djR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 02:24:16 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 529MquXU015437;
	Mon, 10 Mar 2025 02:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vU0z+9J+rBNCxPQO8HZEdG
	Sqw5gIcCbIf0D0nliP6Gw=; b=i37EexwFyOehAUk+puhOzMGRRVOvsYCXvbAdRs
	rUBxF3wrK1I9y4oF2eQ9eYcgr2RuBYnuccMqptkklmsEJIKM/6kGL8NhseYTjKbP
	PwUdVGzygbzjCcpGGyQ3NVpObKP9G9bpAGGCNluiN1kIjB1jNa91JBbss9MY5FhA
	L1pr65nCnb1hYN+OlVVYlIC5GnWjCsJjY0bamjYl/t+uFpYj948IR/I7j3c2XGrk
	7vdc+TqfieZMr6cnNULIJYtlGRwvhyq6nAzwkMNfA5lwaZ2idQzGcU0fRW0gzKtj
	EEAY90AYbJjpueWV9EA0hIVpD0gK/3WHddePvIBkqlz3winw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f0pu6js-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 02:24:09 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52A2O8eC007706
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 02:24:08 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 9 Mar 2025 19:24:05 -0700
From: Jie Gan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, Jie Gan <quic_jiegan@quicinc.com>
Subject: [PATCH] coresight: add verification process for coresight_etm_get_trace_id
Date: Mon, 10 Mar 2025 10:23:48 +0800
Message-ID: <20250310022348.1654501-1-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aL7Arnzvvk8P2yHfW7YG7OJa8mdh5HF3
X-Authority-Analysis: v=2.4 cv=KK2gDEFo c=1 sm=1 tr=0 ts=67ce4d49 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=sWKEhP36mHoA:10 a=COk6AnOGAAAA:8 a=cSwQvQB4SgJn8oxX0GsA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: aL7Arnzvvk8P2yHfW7YG7OJa8mdh5HF3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_01,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=972
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_192415_609330_72F2908A 
X-CRM114-Status: GOOD (  12.24  )
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

The coresight_etm_get_trace_id function is a global function. The
verification process for 'csdev' is required prior to its usage.

Fixes: c367a89dec26 ("Coresight: Add trace_id function to retrieving the trace ID")
Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index bd0a7edd38c9..5a7cd2376e2d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1616,9 +1616,12 @@ EXPORT_SYMBOL_GPL(coresight_remove_driver);
 int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
 			       struct coresight_device *sink)
 {
-	int trace_id;
-	int cpu = source_ops(csdev)->cpu_id(csdev);
+	int cpu, trace_id;
+
+	if (csdev->type != CORESIGHT_DEV_TYPE_SOURCE && !source_ops(csdev)->cpu_id)
+		return -EINVAL;
 
+	cpu = source_ops(csdev)->cpu_id(csdev);
 	switch (mode) {
 	case CS_MODE_SYSFS:
 		trace_id = coresight_trace_id_get_cpu_id(cpu);
-- 
2.34.1


