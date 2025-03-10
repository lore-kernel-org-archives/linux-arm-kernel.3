Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4585BC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 10:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ItFtQPh8goKqoORKLHsi1U1zPD9c0KetLhzZJcHV/4c=; b=2SE6swEQHQZcmp2Ie0WNG+6M43
	NuJOlG8/fQrbI5OU6m01oDVbaHJ9ZXCpey43KNjzlS57gdMZzUGts1nfg9SLCNOrZCnIsoQJiODo9
	dLYSlZmbzmfaNmQH4JRbaampY1/kPvxMkoSC1RNqg6YFEVOBNRAbghR9Lt5mQk16nOc64YJaPBY04
	t4UpZt7sEiU/XrNwdZ7tQ1b0YuUTNmNZApyjAbXUOP8HOKbpW27j+w7ygoILv5xW2H4wa7RK7aBgP
	XVF+D2C47WeP8eDNxZ/YKs6B/zMUm3DkqD5SHyDndTbjtq88Uo415hbkqLSXyPCDEkwUbPYBCUX+7
	7Mo6aGrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1traO5-00000002G3O-0sNQ;
	Mon, 10 Mar 2025 10:29:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1traMR-00000002FrM-49HG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 10:27:53 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A9tWgY008001;
	Mon, 10 Mar 2025 10:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ItFtQPh8goKqoORKLHsi1U
	1zPD9c0KetLhzZJcHV/4c=; b=HVCdFzsFINvLmz/2a0g8SiDBmPnuLlqOhJDm8W
	fN/R4ED6uGSqWmFXnkSMkeWIZu/XLPs8WzRcWZmbYJxqfra5ENcRX5JQ4+AmW5+V
	8Z/zSocXKEjuZlkH7u+w52AnXxHCCjdNqKzR6FgwDD67yeHPpZc6z4HtJQ6l+FUH
	AIPPC7h9SvsLpfhdM6RECxDvNtTZ0RehpHRb/dp9/FROEswAMdQpHOWlQfgW63sD
	vQ79D+hoHhCbMva3eOupWucwiwyELYjIHez9f++oZFjcLes1eVU7IlldbUhYBqlh
	wlcd95dte6CbK03tj2cLlppSGZkySaI3QORwjZ/wrtoGY95w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458eyt4e6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 10:27:46 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52AARhYk013263
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 10:27:43 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Mar 2025 03:27:40 -0700
From: Jie Gan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v2] coresight: add verification process for coresight_etm_get_trace_id
Date: Mon, 10 Mar 2025 18:27:24 +0800
Message-ID: <20250310102724.2112905-1-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uyGYAAlFAIJQ8ieapiLz5KH6Qrm30VJC
X-Authority-Analysis: v=2.4 cv=CupFcm4D c=1 sm=1 tr=0 ts=67cebea2 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=sWKEhP36mHoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=cSwQvQB4SgJn8oxX0GsA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: uyGYAAlFAIJQ8ieapiLz5KH6Qrm30VJC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_04,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 mlxlogscore=981 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_032752_146501_5C77D19B 
X-CRM114-Status: GOOD (  13.15  )
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
Changes in V2:
1. fix the logic error.
Link to V1 - https://lore.kernel.org/all/20250310022348.1654501-1-quic_jiegan@quicinc.com/
---
 drivers/hwtracing/coresight/coresight-core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index bd0a7edd38c9..c915a055534e 100644
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
+	if (csdev->type != CORESIGHT_DEV_TYPE_SOURCE || !source_ops(csdev)->cpu_id)
+		return -EINVAL;
 
+	cpu = source_ops(csdev)->cpu_id(csdev);
 	switch (mode) {
 	case CS_MODE_SYSFS:
 		trace_id = coresight_trace_id_get_cpu_id(cpu);
-- 
2.34.1


