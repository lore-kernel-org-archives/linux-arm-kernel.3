Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95192D637D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 02:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7Po/FwQThiBsQWRxYcauOHGQZjpnBIU7A93c7fpQdY=; b=CX5JSEoq1JQxz7yZTHVBilA8Ou
	xlHLSKMx5avmrf3JZobjnigNw2x+eH2EMDNvOCkVE5tTvIiBEAhf8MLEQDAwcjpznd5alZPO0U/2t
	UsLF16xg1JR/QZmYBMtVhUm7jwGYQfvZh+cyiDMTNo+BWpOmQ+qHVpIQKJH2vQsDNydKAeiXjkqpG
	C+sZgyQmxYfkctbpgIh4TKMU++YJTcaTw5fBIUDeKsd8Wvo6TQMUd+hSLY/IZixI2dKXCgf1Eg3As
	jtspUwP/OaNqgByiWk34Uk1TA6zHs+VbfvcTmEJLQfGp2AnXb8vOMOgbbzphq6gxXaSWQj9P4cjPn
	f/RsQTpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPfi-00000008Z44-0F0S;
	Thu, 14 Nov 2024 02:33:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPcA-00000008YiH-3TDy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 02:29:48 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADMkOPP025933;
	Thu, 14 Nov 2024 02:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r7Po/FwQThiBsQWRxYcauOHGQZjpnBIU7A93c7fpQdY=; b=VRqUb8rXcHkBS5XX
	MTOaF+PtySELj6nNPWDwbbXASdL+JO2wfONwTYHJa6LauTQ23mbLZO9BVe2vpiJ1
	LVAlRzvd9UixrQ0hoT6Qa1L4Jk6adrDGVmueCEwJ0vxcCglvorq1UN0OC3sV32TC
	e4OpKORpooGq+yQhBscGfhI5qiIKTc/Is/xoLnThcy8++gBeSHSuWph6Ii5vZto+
	V0qXNd4jo3IKko7nW83HYtBIjzwohzO94kcCeFbT+JSHDwLR2sfR4N7p5zJVvasp
	GtRDyA97V7z12LsWPhseOjXubw5Ka6D+DM5SyYd2o4nAZ19+0qS69z8YgsIAjtZK
	GbnyNw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vkvrb9kv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 02:29:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AE2TdNj026874
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 02:29:39 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 13 Nov 2024 18:29:35 -0800
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <rafael@kernel.org>,
        <viresh.kumar@linaro.org>, <morten.rasmussen@arm.com>,
        <dietmar.eggemann@arm.com>, <lukasz.luba@arm.com>,
        <pierre.gondois@arm.com>, <vincent.guittot@linaro.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_mdtipton@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>
Subject: [PATCH V8 1/1] cpufreq: scmi: Register for limit change notifications
Date: Thu, 14 Nov 2024 07:59:16 +0530
Message-ID: <20241114022916.644899-2-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114022916.644899-1-quic_sibis@quicinc.com>
References: <20241114022916.644899-1-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: l5ZyfhjEhTE5y1n7Shqs0WijiK8vafjL
X-Proofpoint-GUID: l5ZyfhjEhTE5y1n7Shqs0WijiK8vafjL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501
 bulkscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411140017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_182946_894203_13D56BB3 
X-CRM114-Status: GOOD (  19.00  )
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

v8:
* Drop patch 1 since it was picked up by Viresh
* Leave policy->max update to the cpufreq_qos notifier [Vincent]
* We sanitized the range_max from V3 since we dealt with
  policy->max, now we can drop the check and policy member
  from scmi_data.

 drivers/cpufreq/scmi-cpufreq.c | 45 ++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index 07d6f9a9b7c8..b8fe758aeb01 100644
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
@@ -26,6 +27,8 @@ struct scmi_data {
 	int nr_opp;
 	struct device *cpu_dev;
 	cpumask_var_t opp_shared_cpus;
+	struct notifier_block limit_notify_nb;
+	struct freq_qos_request	limits_freq_req;
 };
 
 static struct scmi_protocol_handle *ph;
@@ -174,6 +177,22 @@ static struct freq_attr *scmi_cpufreq_hw_attr[] = {
 	NULL,
 };
 
+static int scmi_limit_notify_cb(struct notifier_block *nb, unsigned long event, void *data)
+{
+	struct scmi_data *priv = container_of(nb, struct scmi_data, limit_notify_nb);
+	struct scmi_perf_limits_report *limit_notify = data;
+	unsigned int limit_freq_khz;
+	int ret;
+
+	limit_freq_khz = limit_notify->range_max_freq / HZ_PER_KHZ;
+
+	ret = freq_qos_update_request(&priv->limits_freq_req, limit_freq_khz);
+	if (ret < 0)
+		pr_warn("failed to update freq constraint: %d\n", ret);
+
+	return NOTIFY_OK;
+}
+
 static int scmi_cpufreq_init(struct cpufreq_policy *policy)
 {
 	int ret, nr_opp, domain;
@@ -181,6 +200,7 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
 	struct device *cpu_dev;
 	struct scmi_data *priv;
 	struct cpufreq_frequency_table *freq_table;
+	struct scmi_device *sdev = cpufreq_get_driver_data();
 
 	cpu_dev = get_cpu_device(policy->cpu);
 	if (!cpu_dev) {
@@ -294,6 +314,23 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
 		}
 	}
 
+	ret = freq_qos_add_request(&policy->constraints, &priv->limits_freq_req, FREQ_QOS_MAX,
+				   FREQ_QOS_MAX_DEFAULT_VALUE);
+	if (ret < 0) {
+		dev_err(cpu_dev, "failed to add qos limits request: %d\n", ret);
+		goto out_free_table;
+	}
+
+	priv->limit_notify_nb.notifier_call = scmi_limit_notify_cb;
+	ret = sdev->handle->notify_ops->event_notifier_register(sdev->handle, SCMI_PROTOCOL_PERF,
+							SCMI_EVENT_PERFORMANCE_LIMITS_CHANGED,
+							&priv->domain_id,
+							&priv->limit_notify_nb);
+	if (ret)
+		dev_warn(&sdev->dev,
+			 "failed to register for limits change notifier for domain %d\n",
+			 priv->domain_id);
+
 	return 0;
 
 out_free_table:
@@ -313,7 +350,13 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
 static void scmi_cpufreq_exit(struct cpufreq_policy *policy)
 {
 	struct scmi_data *priv = policy->driver_data;
+	struct scmi_device *sdev = cpufreq_get_driver_data();
 
+	sdev->handle->notify_ops->event_notifier_unregister(sdev->handle, SCMI_PROTOCOL_PERF,
+							    SCMI_EVENT_PERFORMANCE_LIMITS_CHANGED,
+							    &priv->domain_id,
+							    &priv->limit_notify_nb);
+	freq_qos_remove_request(&priv->limits_freq_req);
 	dev_pm_opp_free_cpufreq_table(priv->cpu_dev, &policy->freq_table);
 	dev_pm_opp_remove_all_dynamic(priv->cpu_dev);
 	free_cpumask_var(priv->opp_shared_cpus);
@@ -372,6 +415,8 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
 	if (!handle)
 		return -ENODEV;
 
+	scmi_cpufreq_driver.driver_data = sdev;
+
 	perf_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PERF, &ph);
 	if (IS_ERR(perf_ops))
 		return PTR_ERR(perf_ops);
-- 
2.34.1


