Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C2BC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 14:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQLVnRvv+YGw1jFayOnumqymNCBejpVtWN727o3J2xc=; b=fM96d4wmKyAl1oLkeS2R4Vz2Zd
	5nL0UXN+sVXNDo8oouGA2R8eMZc1zwToErx+EZfUZ87CJ1kU4H80tQPiswOUKiG8voQS+wV5TLUDV
	odCR3LVbXSQs/S3QTmO+64+QfoA4Y3lpy0yeamgBPpFvArq7latJq+7PpNsfpfvAcaOEzwTto8f6C
	cTUSK1mGNuHFV38vOpPRt1Z+Ir3H5w5zBO9tOL6Yrc85nlTpGhQnTUW5kMwwxA9JhiMZRIY/E2vIN
	6vlcElGntIS5YH9nSWcExC7gH1adPCqpA29NW3DHDG67oOuX6AVNE3lR746BH1dyepJBXotk3BcYF
	6XJiv3eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXL6S-0000000BhUB-3iqp;
	Thu, 03 Jul 2025 14:39:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJd1-0000000BQvF-2jVP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 13:05:29 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5637ZEWF028430;
	Thu, 3 Jul 2025 13:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OQLVnRvv+YGw1jFayOnumqym
	NCBejpVtWN727o3J2xc=; b=iJYARejfuOe+aaFoELolVcKyldstFRMkVnQLOaQF
	STCqg7cpv7NHR+h/oB+djgTm42M+7e9yVsH0dTanevfE3DuyAz2lrwuBm3bRLI6w
	+jskPcmPjwlqYWSC3yUc/BJ/+RkSRx8Exn7LDIMPgwVeeCcMcoax8lODXQYSPL+Y
	r5fYz7tRKyQ6x/Uuv3+NzQy70y50dqUxP5CSdWDwtR8CTi4Q5zdC/Mt//9nDe7XY
	RjU7nVMH3Uo/NPn7roYROiAphEJ9QXzbSZBbwVJnyWltaUj0v73lRHVlumdBoPuk
	LrBh/pSUngKfvHZ1fkEdn4EI+LRNPMs6QWtOcCXwqtaE4w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bw0nnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 13:05:21 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 563D5KHe000970
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Jul 2025 13:05:20 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 3 Jul 2025 06:05:16 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v8 2/2] coresight: Add label sysfs node support
Date: Thu, 3 Jul 2025 21:04:53 +0800
Message-ID: <20250703130453.4265-3-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250703130453.4265-1-quic_jinlmao@quicinc.com>
References: <20250703130453.4265-1-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yKGtCAjpT3fr4cKy89wmWtXVnIoNdt3N
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68668011 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=3OtES_ux56hhsM0WwqAA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: yKGtCAjpT3fr4cKy89wmWtXVnIoNdt3N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDExMCBTYWx0ZWRfXyZ+a5XOXdK1X
 ywTR60Xx8YDbpSqXbEnpP57s2OFkZV3RVcOP+EMW37e+xlVxrYfcmizK/TaOlNO6ta2yj/Atubh
 jxs5M9HCV9gso1W91FA82WzfngW4drALkbGpmWA9NBHeVkam5ew9qdHgEwPNdT4YzmDZ9Cmn/9s
 lfKOgcPdMGuE4Sze4gOgoHj5iFAyDZmVUSFKF3a5/H+50HHjAQteHp32jckXhZhlkhrsZN6QE+v
 ig7MjplqeMdwrt6mE28K2jRFxVz+OUStgTrBuU2eG3sit7y1n7BDm2pkBS0SiKV3NWwNGmBFj/M
 0oY5WUMAKA0SLDQ9VbKtaUJUVdM4xDeuhH/N7WlI7MG6NYdza9o6L0eg+f0Mo+GsW+5NbqcJZen
 y7+c1kWYYFn/0n7GcBTUK8te+q/m/vzap1iQs7WR41iQv96OMyr//I44Xay+T7sa5c4B/073
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_060527_698945_FEA1000E 
X-CRM114-Status: GOOD (  17.61  )
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

For some coresight components like CTI and TPDM, there could be
numerous of them. From the node name, we can only get the type and
register address of the component. We can't identify the HW or the
system the component belongs to. Add label sysfs node support for
showing the intuitive name of the device.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
---
 .../testing/sysfs-bus-coresight-devices-cti   |  6 ++++
 .../sysfs-bus-coresight-devices-funnel        |  6 ++++
 .../testing/sysfs-bus-coresight-devices-tpdm  |  6 ++++
 drivers/hwtracing/coresight/coresight-sysfs.c | 32 +++++++++++++++++++
 4 files changed, 50 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
index a97b70f588da..55367bbc696f 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
@@ -239,3 +239,9 @@ Date:		March 2020
 KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Write) Clear all channel / trigger programming.
+
+What:           /sys/bus/coresight/devices/<cti-name>/label
+Date:           Jul 2025
+KernelVersion   6.17
+Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
+Description:    (Read) Show hardware context information of device.
diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel b/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
index d75acda5e1b3..5578fa5f6f02 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
@@ -10,3 +10,9 @@ Date:		November 2014
 KernelVersion:	3.19
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(RW) Defines input port priority order.
+
+What:           /sys/bus/coresight/devices/<memory_map>.funnel/label
+Date:           Jul 2025
+KernelVersion   6.17
+Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
+Description:    (Read) Show hardware context information of device.
diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
index a341b08ae70b..e6d935e83042 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
@@ -272,3 +272,9 @@ KernelVersion	6.15
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		(RW) Set/Get the enablement of the individual lane.
+
+What:           /sys/bus/coresight/devices/<tpdm-name>/label
+Date:           Jul 2025
+KernelVersion   6.17
+Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
+Description:    (Read) Show hardware context information of device.
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index feadaf065b53..e3d21c49814d 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -7,6 +7,7 @@
 #include <linux/device.h>
 #include <linux/idr.h>
 #include <linux/kernel.h>
+#include <linux/property.h>
 
 #include "coresight-priv.h"
 #include "coresight-trace-id.h"
@@ -371,18 +372,47 @@ static ssize_t enable_source_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(enable_source);
 
+static ssize_t label_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+
+	const char *str;
+	int ret = 0;
+
+	ret = fwnode_property_read_string(dev_fwnode(dev), "label", &str);
+	if (ret == 0)
+		return scnprintf(buf, PAGE_SIZE, "%s\n", str);
+	else
+		return ret;
+}
+static DEVICE_ATTR_RO(label);
+
 static struct attribute *coresight_sink_attrs[] = {
 	&dev_attr_enable_sink.attr,
+	&dev_attr_label.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(coresight_sink);
 
 static struct attribute *coresight_source_attrs[] = {
 	&dev_attr_enable_source.attr,
+	&dev_attr_label.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(coresight_source);
 
+static struct attribute *coresight_link_attrs[] = {
+	&dev_attr_label.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(coresight_link);
+
+static struct attribute *coresight_helper_attrs[] = {
+	&dev_attr_label.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(coresight_helper);
+
 const struct device_type coresight_dev_type[] = {
 	[CORESIGHT_DEV_TYPE_SINK] = {
 		.name = "sink",
@@ -390,6 +420,7 @@ const struct device_type coresight_dev_type[] = {
 	},
 	[CORESIGHT_DEV_TYPE_LINK] = {
 		.name = "link",
+		.groups = coresight_link_groups,
 	},
 	[CORESIGHT_DEV_TYPE_LINKSINK] = {
 		.name = "linksink",
@@ -401,6 +432,7 @@ const struct device_type coresight_dev_type[] = {
 	},
 	[CORESIGHT_DEV_TYPE_HELPER] = {
 		.name = "helper",
+		.groups = coresight_helper_groups,
 	}
 };
 /* Ensure the enum matches the names and groups */
-- 
2.17.1


