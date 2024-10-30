Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5778D5CCB0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 13:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHQ+Gg6V2ei7AXCu6cKzXPNkuQvbXoSycYg1KOBw+f0=; b=lvprtu78QmYkv5O7aAn/X3PadM
	E6p1H0QYzmTxEA+10t88y6z9Vh/rBU+fJDZhUrE0A9+NLWXR8Y+D++in4PQ+xXN9wmQm1OYS5u7sN
	1nLSEK2nHLsFf84YOBmSLx0IYglOlfbzumEjlJxsxPH7cS5YpGsQOvRJwYNhZcfdd8GYkn/qofj9Q
	QFM3euuZVxY6+6R5zjO4V4iRwqXF5364TIuraMeOd/PaoxwUbywQjcJ/d/gyjBFb1zgLeVnk2xqp8
	QahHlma1rUK+glcFjESU6XZviwJaZhERKGDlhB3c7JfQ4teoqNgDX/lziGSSyT7Y2h33iM12bMWcy
	N9GNZJzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t68yp-00000000WCL-1P9z;
	Wed, 30 Oct 2024 13:43:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t68nz-00000000U58-2Ywj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 13:32:13 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U9x5OJ012773;
	Wed, 30 Oct 2024 13:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mHQ+Gg6V2ei7AXCu6cKzXPNkuQvbXoSycYg1KOBw+f0=; b=mKsRhVIHXPT4/6OL
	I7p0NBMHPbrMXFFGwBKseePx36kpeqLmlj1qDyEnpQAF15WBDGuJ9bZ5kXDhD9zB
	e5AdsHKZbTHS4ZFfkMmVlbb9UcNHWWNMCy8inKHOvAn2yVax/aUAr/WRSUn+3pU9
	CO2oD7+7s5iXWXMJAWdcmapuAeuHSNfWx/ziCHEY93K/KmcqGqE0GLOKsRzKfPFG
	SSo718CEl0DWcW/rQaRITAIHTzNmBYp2OoTNbQ9aRIvKhLcYvYzof49m2CzTlNN6
	oa2b8TSO/eZdKvz7uMmap6CQzNOAD+YgGMIR9fAfRdyqxMoAK03cFiJUWY9JgsJj
	797/vw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grgum6jq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 13:32:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UDW3A7024757
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 13:32:03 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Oct 2024 06:31:58 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <rafael@kernel.org>,
        <viresh.kumar@linaro.org>, <morten.rasmussen@arm.com>,
        <dietmar.eggemann@arm.com>, <lukasz.luba@arm.com>,
        <pierre.gondois@arm.com>, <vincent.guittot@linaro.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_mdtipton@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>
Subject: [PATCH V6 1/1] cpufreq: scmi: Register for limit change notifications
Date: Wed, 30 Oct 2024 19:01:33 +0530
Message-ID: <20241030133133.2932722-2-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241030133133.2932722-1-quic_sibis@quicinc.com>
References: <20241030133133.2932722-1-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SHu6vOOkDMECajIkn3n51HKE80Eadjy6
X-Proofpoint-GUID: SHu6vOOkDMECajIkn3n51HKE80Eadjy6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410300106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_063211_799442_BC3D9673 
X-CRM114-Status: GOOD (  16.39  )
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

Register for limit change notifications if supported and use the throttled
frequency from the notification to apply HW pressure.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
Tested-by: Mike Tipton <quic_mdtipton@quicinc.com>
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
---

v6:
* Unregister the notifier in the exit path to make sure
  the cpus work across suspend/resume cycles.

 drivers/cpufreq/scmi-cpufreq.c | 38 ++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index 5892c73e129d..fb3534eae722 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -16,6 +16,7 @@
 #include <linux/export.h>
 #include <linux/module.h>
 #include <linux/pm_opp.h>
+#include <linux/pm_qos.h>
 #include <linux/slab.h>
 #include <linux/scmi_protocol.h>
 #include <linux/types.h>
@@ -25,7 +26,9 @@ struct scmi_data {
 	int domain_id;
 	int nr_opp;
 	struct device *cpu_dev;
+	struct cpufreq_policy *policy;
 	cpumask_var_t opp_shared_cpus;
+	struct notifier_block limit_notify_nb;
 };
 
 static struct scmi_protocol_handle *ph;
@@ -174,6 +177,25 @@ static struct freq_attr *scmi_cpufreq_hw_attr[] = {
 	NULL,
 };
 
+static int scmi_limit_notify_cb(struct notifier_block *nb, unsigned long event, void *data)
+{
+	struct scmi_data *priv = container_of(nb, struct scmi_data, limit_notify_nb);
+	struct scmi_perf_limits_report *limit_notify = data;
+	struct cpufreq_policy *policy = priv->policy;
+	unsigned int limit_freq_khz;
+	int ret;
+
+	limit_freq_khz = limit_notify->range_max_freq / HZ_PER_KHZ;
+
+	policy->max = clamp(limit_freq_khz, policy->cpuinfo.min_freq, policy->cpuinfo.max_freq);
+
+	ret = freq_qos_update_request(policy->max_freq_req, policy->max);
+	if (ret < 0)
+		pr_warn("failed to update freq constraint: %d\n", ret);
+
+	return NOTIFY_OK;
+}
+
 static int scmi_cpufreq_init(struct cpufreq_policy *policy)
 {
 	int ret, nr_opp, domain;
@@ -181,6 +203,7 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
 	struct device *cpu_dev;
 	struct scmi_data *priv;
 	struct cpufreq_frequency_table *freq_table;
+	struct scmi_device *sdev = cpufreq_get_driver_data();
 
 	cpu_dev = get_cpu_device(policy->cpu);
 	if (!cpu_dev) {
@@ -294,6 +317,17 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
 		}
 	}
 
+	priv->limit_notify_nb.notifier_call = scmi_limit_notify_cb;
+	ret = sdev->handle->notify_ops->devm_event_notifier_register(sdev, SCMI_PROTOCOL_PERF,
+							SCMI_EVENT_PERFORMANCE_LIMITS_CHANGED,
+							&domain,
+							&priv->limit_notify_nb);
+	if (ret)
+		dev_warn(&sdev->dev,
+			 "failed to register for limits change notifier for domain %d\n", domain);
+
+	priv->policy = policy;
+
 	return 0;
 
 out_free_opp:
@@ -310,8 +344,10 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
 
 static void scmi_cpufreq_exit(struct cpufreq_policy *policy)
 {
+	struct scmi_device *sdev = cpufreq_get_driver_data();
 	struct scmi_data *priv = policy->driver_data;
 
+	sdev->handle->notify_ops->devm_event_notifier_unregister(sdev, &priv->limit_notify_nb);
 	dev_pm_opp_free_cpufreq_table(priv->cpu_dev, &policy->freq_table);
 	dev_pm_opp_remove_all_dynamic(priv->cpu_dev);
 	free_cpumask_var(priv->opp_shared_cpus);
@@ -370,6 +406,8 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
 	if (!handle)
 		return -ENODEV;
 
+	scmi_cpufreq_driver.driver_data = sdev;
+
 	perf_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PERF, &ph);
 	if (IS_ERR(perf_ops))
 		return PTR_ERR(perf_ops);
-- 
2.34.1


