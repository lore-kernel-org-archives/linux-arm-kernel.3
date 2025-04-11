Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D23EC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 21:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jdhyv9hjm6QUrsT/wcxw2zTNKs20yDomAVmT1aUQSfE=; b=b/ktpRE9R/cE7qTZGzLxB/AfCV
	TQTLW2HvSlPd7vvXqA0aacoKo0AkL2ArOJ/6yFyEeUgOXqBb21BYPkp18OCaJhubByPZBivJg00Fu
	Acsj1HMArV3euxZeUF5n0jhL8B8MhuaOwCPiZIJCpnuPifYzXF6XwNH5QvEBOWB0ZS+Zmg7MhQ+Ll
	GtcY0/AckqE6H0dieQwb8HOxijKJrJsHxkocdJUgBb8FM1RXmQDiVlFDm0UBxs7hamvvDGFZfSsp7
	l53GVE99U1dvwjn7bNTQVPjzn0Z7ewTl460bBKVT/qkMOjDjOhRgQWrn25gLJEdnc3DPYWeK5NyCq
	BOqL8jZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Lz1-0000000EwDJ-0bdB;
	Fri, 11 Apr 2025 21:32:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3LxB-0000000Evx0-2vK1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 21:30:27 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BEhWbf019687;
	Fri, 11 Apr 2025 21:30:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jdhyv9hjm6QUrsT/wcxw2z
	TNKs20yDomAVmT1aUQSfE=; b=pwRp0W5ryybSH390VH0XdIRdKMmb/GsOq/cSGW
	Mwfj3t+XhIJVxZzgEGJ1J29qJMMpveZzDXcoM/wpceeDqYJFAc3GvwMPXDpUbmaF
	FgBbJylk1CkStlv8pWHixPBRpnQGyUg5klGw5EP5oW9ZZ0Aq6ISZNPsPe3WSdLTQ
	1U7fed5lKBCwbwLKtHiWvUyBYYYLTLZsEuRfocgcHcRBAH07CAylj+Oj3Gn/bqX4
	VMn+AWU3uMv8PuDTnumEv9CWRNW+haGUl1x/kjbCMnz5JnFpCTm5QZtwUDtaAka9
	EaUKFlpjm+TEU68t27UO6HZz8x6mbPheml/XQvKLwagulZ1Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrutbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 21:30:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53BLUEIE001413
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 21:30:14 GMT
Received: from hu-mdtipton-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 11 Apr 2025 14:30:14 -0700
From: Mike Tipton <quic_mdtipton@quicinc.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi
	<cristian.marussi@arm.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        "Viresh
 Kumar" <viresh.kumar@linaro.org>
CC: <arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Mike Tipton
	<quic_mdtipton@quicinc.com>
Subject: [PATCH] cpufreq: scmi: Skip SCMI devices that aren't used by the CPUs
Date: Fri, 11 Apr 2025 14:29:41 -0700
Message-ID: <20250411212941.1275572-1-quic_mdtipton@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2wjL0GughldwcNUypIhw6NcJCtHR9kIA
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f989e7 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=RUjNBLSMCPId_BJTEh8A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2wjL0GughldwcNUypIhw6NcJCtHR9kIA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1011 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_143025_865465_4F6749C0 
X-CRM114-Status: GOOD (  15.55  )
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
---
 drivers/cpufreq/scmi-cpufreq.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index 944e899eb1be..7981a879974b 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -393,6 +393,32 @@ static struct cpufreq_driver scmi_cpufreq_driver = {
 	.set_boost	= cpufreq_boost_set_sw,
 };
 
+static bool scmi_dev_used_by_cpus(struct device *scmi_dev)
+{
+	struct device_node *scmi_np = scmi_dev->of_node;
+	struct device_node *np;
+	struct device *cpu_dev;
+	int cpu, idx;
+
+	for_each_possible_cpu(cpu) {
+		cpu_dev = get_cpu_device(cpu);
+		if (!cpu_dev)
+			continue;
+
+		np = cpu_dev->of_node;
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
@@ -404,6 +430,9 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
 	if (!handle)
 		return -ENODEV;
 
+	if (!scmi_dev_used_by_cpus(dev))
+		return 0;
+
 	scmi_cpufreq_driver.driver_data = sdev;
 
 	perf_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PERF, &ph);
-- 
2.34.1


