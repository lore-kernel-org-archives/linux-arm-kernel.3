Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E7AC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 03:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ld1RKsEAsCuP+g+udkbXYbbm/MEVYhIXmCt3JvtkAJs=; b=oyHSNruQ3bQjGrJMnzUVEJepNB
	j8M7rZFKWjDYfFMKfkyRH3yrqT6DIYw0smGS9NO52VuS32463lJMQD86n+bHqG7p8WIbb3lcC2w5H
	w9U7idYzUexCzBxQzrp5bE0Ow/QkR8gh8C+TiPgJBf52PoCt9N6KiUf+pyKdLF4NL93qxVp5KR1fc
	6e1gUj8kWW8ywEaVBlLDJ0Q38ojm7QTl+qmj2kGt0ICXbWaJFSelxzAZ4aTlGw8lFaZkwPpfZuXhj
	gtec5imNLr9yh5zGWf6Vy8WTsAf3J5Wd+iCpTQ33A0vccN1w2cv8nt+U8d+vr5TALqvkrBvqkAHuJ
	7UJNXXOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFPh0-0000000GyPk-38EK;
	Thu, 15 May 2025 03:55:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFPey-0000000GyCg-0g8o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 03:53:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJShBo025487;
	Thu, 15 May 2025 03:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ld1RKsEAsCuP+g+udkbXYb
	bm/MEVYhIXmCt3JvtkAJs=; b=JTltlSE/m/GU8VubJQHNL5VpfbhZ9IItUEwPgZ
	j7btoHDx7/eaBElr0QHj8oLHgW615GBCAdCioXfbEoj5RDv4Cl9dw/l/gIsgbR5c
	BcTsh/3Uzc4nXtvrGDjH5vRKjSnjGa0KYt0ODv1vRE/KrmRfffTqKlhyL2tu2UFK
	UUuFr1hk9q5j1x5vV+ZZ+OMoJan1rg4WgIZyuqs4yxjlp3UurjKQ1+6S/girQh1J
	sYbPxG106AeewX6ntkRmhfHuNFZJYdaQys/i8MUKmD8wZu4HR4maPTGXAbBk/L2R
	Ff8rJwYDjwXMo+KjkA+lKABZ1WeX+rx9M9J4iuX/CuEJfzxA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew4r9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 03:53:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54F3rKhl022563
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 03:53:20 GMT
Received: from hu-mdtipton-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 14 May 2025 20:53:19 -0700
From: Mike Tipton <quic_mdtipton@quicinc.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi
	<cristian.marussi@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Viresh
 Kumar" <viresh.kumar@linaro.org>
CC: <arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Peng Fan
	<peng.fan@oss.nxp.com>,
        Mike Tipton <quic_mdtipton@quicinc.com>, Peng Fan
	<peng.fan@nxp.com>
Subject: [PATCH v4] cpufreq: scmi: Skip SCMI devices that aren't used by the CPUs
Date: Wed, 14 May 2025 20:53:12 -0700
Message-ID: <20250515035312.3119884-1-quic_mdtipton@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yjlb2BcRSXE2d12PWi3S-o4z144rqt9c
X-Proofpoint-ORIG-GUID: yjlb2BcRSXE2d12PWi3S-o4z144rqt9c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDAzNSBTYWx0ZWRfX3d+YX/SkQPtZ
 sDzIbmDn5ESYV09P5qjbSYRZqE0N+htiGom5mmCtjO8QB6Y6dhnBivS510pCHik8AyQU2m/aru9
 DaxTj7DUWUIGcmss76/u0vnLfFl90Vh1MKg7NHDiDCUIuRn6pWTE6xwRFsi0CVNT8Y7eQjNwXOU
 aVCdKpfTBCECZHCzHtRUkE//TTx5bZgsViefFutdK1NLM6P+3r6DH5vGCh+fFsE+ZWg+1Cbz1mh
 poVBt/ZCYOzDcBw7UpOv7mkxQvAuMUY44vrUhYB7Qmta0L5S8+1SPhAvvSom65Rt/NuXNNYQwZf
 lDQbnInaQ2CJl2469QghrUEYeuaM47ADFyoRjp1dhX1s8DuxJSZF1tIiHh/hdO3/roL46TUgCCh
 SCQYhFEl/IjkK0HqazBWHxwGFn/9dCLAynluwZo0TkQulWYajrtoZTe2/DUPalnj4Hv45YCS
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=68256531 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=3H110R4YSZwA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=8AirrxEcAAAA:8 a=7CQSdrXTAAAA:8 a=Yfdy9-sE--kubaARhR4A:9
 a=TjNXssC_j7lpFel5tvFf:22 a=ST-jHhOKWsTCqRlWije3:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_01,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_205328_322328_BBD08791 
X-CRM114-Status: GOOD (  16.94  )
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
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Tested-by: Cristian Marussi <cristian.marussi@arm.com>
---
Changes in v4:
- Call of_node_put() after of_parse_handle().
- Collect Reviewed-bys and Tested-bys.
- Link to v3: https://lore.kernel.org/all/20250428144728.871404-1-quic_mdtipton@quicinc.com/

Changes in v3:
- Use dev_of_node(dev) instead of dev->of_node.
- Sanity check scmi_np.
- Pick up Reviewed-by from Peng.
- Link to v2: https://lore.kernel.org/all/20250421195206.3736128-1-quic_mdtipton@quicinc.com/

Changes in v2:
- Return -ENODEV instead of 0 for irrelevant devices.
- Link to v1: https://lore.kernel.org/all/20250411212941.1275572-1-quic_mdtipton@quicinc.com/

 drivers/cpufreq/scmi-cpufreq.c | 36 +++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index 944e899eb1be..ef078426bfd5 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -393,6 +393,40 @@ static struct cpufreq_driver scmi_cpufreq_driver = {
 	.set_boost	= cpufreq_boost_set_sw,
 };
 
+static bool scmi_dev_used_by_cpus(struct device *scmi_dev)
+{
+	struct device_node *scmi_np = dev_of_node(scmi_dev);
+	struct device_node *cpu_np, *np;
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
+		cpu_np = dev_of_node(cpu_dev);
+
+		np = of_parse_phandle(cpu_np, "clocks", 0);
+		of_node_put(np);
+
+		if (np == scmi_np)
+			return true;
+
+		idx = of_property_match_string(cpu_np, "power-domain-names", "perf");
+		np = of_parse_phandle(cpu_np, "power-domains", idx);
+		of_node_put(np);
+
+		if (np == scmi_np)
+			return true;
+	}
+
+	return false;
+}
+
 static int scmi_cpufreq_probe(struct scmi_device *sdev)
 {
 	int ret;
@@ -401,7 +435,7 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
 
 	handle = sdev->handle;
 
-	if (!handle)
+	if (!handle || !scmi_dev_used_by_cpus(dev))
 		return -ENODEV;
 
 	scmi_cpufreq_driver.driver_data = sdev;
-- 
2.34.1


