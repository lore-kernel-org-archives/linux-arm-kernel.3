Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E38D7495C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 13:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wokNxyM6Gy0OMdkl4cgjg1wawN2GOERfsU9/vs2RYxk=; b=Ow+8bFE+IP5wb2Sa45Mecy/zv3
	MAxX+8sgsD3NBqfyqr2FY+X7GRcAK020adopxAgsksvs6L8+cnYUI93yuadcqAt1jqQ3KCPf26pYA
	bNeviH+W65cnD70N8UTNo/+ko7JirDApKPrzRhoj6xsO8dOgRVyGqQgmNgJiu5fMHTBNeq/24hJHd
	kjJxUEB4slGqol4Id6BJ26MV4Yh8TnaQSsmZBwOzAZ5hHE/CXIFCHupKi+HgR37ox5m5UB8/i+bTp
	E4ezBY8JHSb2z4oavg1DxgC1q/QM2aMb6rTSOZSpqKDML0iCr+wz+9oMSII3otp9dGoEWRUHnXGOA
	fx1ReM5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6VI8-00000003geW-1VOt;
	Thu, 31 Oct 2024 13:32:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6VDm-00000003g6Y-1oMj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 13:28:19 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49V8AOrG030172;
	Thu, 31 Oct 2024 13:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wokNxyM6Gy0OMdkl4cgjg1wawN2GOERfsU9/vs2RYxk=; b=RhdAtFeGN6VfcyRn
	x+Fw/EbG5l2XVbLTm+AVYLA9lyG/KhhekTtCmi5Fq+UovtAXul9hNZxRHdpKHJFg
	5ScvJnvEUOwfyzA6tMREMSuPrqDOwU4P5iLFF4cqZhK9rDwOX6pun70HBhxlSFxh
	Shao6rtWrcb9Tt9tt0qaMNlmKpyX/iv7zYAU+75FJukB5oYFKI70eje+ZtY/lI5K
	1avRC+7SmQIJ8+ECzK879BTcT/wI019SSSvfZFksz7F600c3YlPZjqEskT92dpVm
	4SZSOW8FW+S4707O38D0hfFkmnIKveBDBs9gWkJuXfrvjrI7DSKiBfNNjFUB2NqD
	aKRGDQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grguqthg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 13:28:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49VDS7r4005444
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 13:28:07 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 31 Oct 2024 06:28:03 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <rafael@kernel.org>,
        <viresh.kumar@linaro.org>, <morten.rasmussen@arm.com>,
        <dietmar.eggemann@arm.com>, <lukasz.luba@arm.com>,
        <pierre.gondois@arm.com>, <vincent.guittot@linaro.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_mdtipton@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>,
        <stable@vger.kernel.org>
Subject: [PATCH V7 1/2] cpufreq: scmi: Fix cleanup path when boost enablement fails
Date: Thu, 31 Oct 2024 18:57:44 +0530
Message-ID: <20241031132745.3765612-2-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031132745.3765612-1-quic_sibis@quicinc.com>
References: <20241031132745.3765612-1-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wvDBv4j9u__dF9q_XhbqOgxoXw5p9R_N
X-Proofpoint-GUID: wvDBv4j9u__dF9q_XhbqOgxoXw5p9R_N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=926 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410310102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_062818_608435_6D5EB645 
X-CRM114-Status: GOOD (  11.28  )
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

Include free_cpufreq_table in the cleanup path when boost enablement fails.

cc: stable@vger.kernel.org
Fixes: a8e949d41c72 ("cpufreq: scmi: Enable boost support")
Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 drivers/cpufreq/scmi-cpufreq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index 5892c73e129d..07d6f9a9b7c8 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -287,7 +287,7 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
 		ret = cpufreq_enable_boost_support();
 		if (ret) {
 			dev_warn(cpu_dev, "failed to enable boost: %d\n", ret);
-			goto out_free_opp;
+			goto out_free_table;
 		} else {
 			scmi_cpufreq_hw_attr[1] = &cpufreq_freq_attr_scaling_boost_freqs;
 			scmi_cpufreq_driver.boost_enabled = true;
@@ -296,6 +296,8 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
 
 	return 0;
 
+out_free_table:
+	dev_pm_opp_free_cpufreq_table(cpu_dev, &freq_table);
 out_free_opp:
 	dev_pm_opp_remove_all_dynamic(cpu_dev);
 
-- 
2.34.1


