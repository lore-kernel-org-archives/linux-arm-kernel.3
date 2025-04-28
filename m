Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73099C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 16:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f2NMXreXM3PVotN+YOuIh9CVsLx7a/b/tTxSsV5l3oo=; b=1Gu4UMS2OiEAWNEMrJSpETZFZK
	uEbnPaWn/wFLU4r63o0heqRzoSYb2vcqlzix65zdlmqSZ/gG5oxOewWI5D382OR7WuONUpKQ147tE
	Q+Oo79X9WluH08JqCw5T2+Ny6n0Knn/ATDD3wD5oKYAHHdsOSUgPZZTAk2GXkul4wqNJ/8X/QPvmj
	HFsJiMwkngR5RtfZ9EnshfRiPidwkmCNA1oeYuz0BGEZQttAvPP8pxA4BmUOXfjFfk89lxBJHA7yU
	DlGd+BZtTEr8T6EGKcdA7T9yix5rqp0yQqZK7XIgYkZdNnxwM2vTwtf4D+9rbB/xdjn0WnWuCRpwV
	Wfj3EpBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9R9I-00000006stD-1KRS;
	Mon, 28 Apr 2025 16:16:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Ply-00000006gG5-2jLp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 14:47:56 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SADENS027055;
	Mon, 28 Apr 2025 14:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=f2NMXreXM3PVotN+YOuIh9
	CVsLx7a/b/tTxSsV5l3oo=; b=dwoN0zlaeO97k3/XunMckPwwB72EHzpLgz//7h
	DrOERivFPo4oiZPOXeEAWyhRG9hrhLlKV/H4gRPwhmN67fvgw0EP7OVe0jC53wbD
	4LuhpaEMN5fNqTIcHwByHI9bVZiregF1nNeHz8cGoF9q1IeF+zWc/JMz35WlDGxT
	+/PBdCxllZmPljXXbmVrUn8+zZW/9dPljhlt13mfptmk16oxDiL1Cd2lcKZHu3WY
	eOIJS5iJH2MRdyuM/L6kqb8xe42hzFJEzK1+0J5DLX7PjES5fEiVyhj9sROtD/aw
	wyjNPRopE2v3Z1m9HRtgeKN8E1DrKygIvkfDtahDU0KQFMJA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468q321gf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 14:47:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53SElkPT027712
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 14:47:46 GMT
Received: from hu-mdtipton-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Apr 2025 07:47:45 -0700
From: Mike Tipton <quic_mdtipton@quicinc.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi
	<cristian.marussi@arm.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        "Viresh
 Kumar" <viresh.kumar@linaro.org>
CC: <arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Peng Fan
	<peng.fan@oss.nxp.com>,
        Mike Tipton <quic_mdtipton@quicinc.com>, Peng Fan
	<peng.fan@nxp.com>
Subject: [PATCH v3] cpufreq: scmi: Skip SCMI devices that aren't used by the CPUs
Date: Mon, 28 Apr 2025 07:47:28 -0700
Message-ID: <20250428144728.871404-1-quic_mdtipton@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=680f9513 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=8AirrxEcAAAA:8 a=z2bt77sjNeVQpZcblNcA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: K3-w76dxuPNYILj9uBgxADKSN0N5mjIB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEyMSBTYWx0ZWRfX31ICRIqjwAzc uyDtbrNxPt3Uyl8GaFw3Pb76Plhj+IAMFgeA9U5Je51HQ59TTaa8esEoVz6PXR/TmHjx1GNTHqa X3i9QW6NbAphFyb3hebWw0l/cgzvu+saYWjM79GkaJkP9VK2zw+pHinonx/0WRgeGl9ebL9FuVC
 ktHa3epY1OHt0OR+Xwqi+mXqbtIZgvaa4i7xxUfPOok4ZpN8WtkVJXc84bhpPGA9CEutojZwCob nkLKVTd4oqWPbKcA2MaR3r/8Nwo8xhXKtkCGu7rg6RImX9TrPqEOzH5NuIaD0AxfT3Y44f6/Jh/ 0ijhETY3gdqlBhJE5ag3B+QAts7MI8FfMYFB5XXw86pXm+HNiHQCFg/vNrpzIpQdG9Pc9oLUl23
 giFdI/g+LZLH2OIRv/Fsr3nOuCJ7i5g72n8Xp3HGwR7BUe0xmJW6T9k8Eowl+25r3Hcahoz8
X-Proofpoint-ORIG-GUID: K3-w76dxuPNYILj9uBgxADKSN0N5mjIB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 clxscore=1011 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_074754_863303_5F5CF363 
X-CRM114-Status: GOOD (  17.31  )
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

Currently, all SCMI devices with performance domains attempt to register
a cpufreq driver, even if their performance domains aren't used to
control the CPUs. The cpufreq framework only supports registering a
single driver, so only the first device will succeed. And if that device
isn't used for the CPUs, then cpufreq will scale the wrong domains.

To avoid this, return early from scmi_cpufreq_probe() if the probing
SCMI device isn't referenced by the CPU device phandles.

This keeps the existing assumption that all CPUs are controlled by a
single SCMI device.

Signed-off-by: Mike Tipton <quic_mdtipton@quicinc.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v3:
- Use dev_of_node(dev) instead of dev->of_node.
- Sanity check scmi_np.
- Pick up Reviewed-by from Peng.
- Link to v2: https://lore.kernel.org/all/20250421195206.3736128-1-quic_mdtipton@quicinc.com/

Changes in v2:
- Return -ENODEV instead of 0 for irrelevant devices.
- Link to v1: https://lore.kernel.org/all/20250411212941.1275572-1-quic_mdtipton@quicinc.com/

 drivers/cpufreq/scmi-cpufreq.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index 944e899eb1be..b63992de9fc7 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -393,6 +393,35 @@ static struct cpufreq_driver scmi_cpufreq_driver = {
 	.set_boost	= cpufreq_boost_set_sw,
 };
 
+static bool scmi_dev_used_by_cpus(struct device *scmi_dev)
+{
+	struct device_node *scmi_np = dev_of_node(scmi_dev);
+	struct device_node *np;
+	struct device *cpu_dev;
+	int cpu, idx;
+
+	if (!scmi_np)
+		return false;
+
+	for_each_possible_cpu(cpu) {
+		cpu_dev = get_cpu_device(cpu);
+		if (!cpu_dev)
+			continue;
+
+		np = dev_of_node(cpu_dev);
+
+		if (of_parse_phandle(np, "clocks", 0) == scmi_np)
+			return true;
+
+		idx = of_property_match_string(np, "power-domain-names", "perf");
+
+		if (of_parse_phandle(np, "power-domains", idx) == scmi_np)
+			return true;
+	}
+
+	return false;
+}
+
 static int scmi_cpufreq_probe(struct scmi_device *sdev)
 {
 	int ret;
@@ -401,7 +430,7 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
 
 	handle = sdev->handle;
 
-	if (!handle)
+	if (!handle || !scmi_dev_used_by_cpus(dev))
 		return -ENODEV;
 
 	scmi_cpufreq_driver.driver_data = sdev;
-- 
2.34.1


