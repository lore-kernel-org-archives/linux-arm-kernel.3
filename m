Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1F1C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 09:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7KFSmYIDfO6DcDi77j5KfAefDghnxv/4Q2uQrNxlJs=; b=KPhGkV2wOuTmwX0f81uRWS0CFK
	Ra5iv8X0c5YBGooW1G9ZODFnLfwjfH1D/BoEZkV9FgNCtBYEleX2QHsNI/xi7Nj1/r0AINXrL77Ea
	dBccd2dev0YqRT6bpYE/Dqi5BvjRQKmQYmBCLBeeia3tDdemMB/0Lasf5nB6o6hMhLGDlW7BUbn/7
	mI+CwpPwjKOsXuqOlYmk3w5ikU0LmbvBTMiS37DRg/5xHMre+Bp5n4ijlGdcgj4MVhu07aG0escby
	Y4338NsnmO6uY3fJdk8fJdWIMROLgzqHoBlBdkEYklhvQEZ8O0r7ryG33LkAn3hGpj4qDbwQLhYip
	RWQDlBcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnaTF-00000006uOA-3dk0;
	Thu, 27 Feb 2025 09:46:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnaB1-00000006rJZ-3jZA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 09:27:33 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R8osxS000781;
	Thu, 27 Feb 2025 09:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E7KFSmYIDfO6DcDi77j5KfAefDghnxv/4Q2uQrNxlJs=; b=mLysC+ZiFC8qPofq
	xazza/srRWjEMoHlrIxiKO/fWJbRc+R2/jYLePEQ93VQSvXbVrweZUDSzy6BNjhj
	e1KbiWgIpw9RG8q9o74l7lZ7ikd59kV2hTwiHatXh2fXYrIyILIcVpzKwPkUEUOJ
	4d8rX5xEauVFCXKmyLeHDlOari+NnGGysLoZaIVI2fJ/vOxpuzmHUjH3wgnyR56Z
	i3QNFlkl3LxaYqTh/tnJXNBzkMiHa7Xd9umi4PtHTTxQi0N6pIhBNlqbLoD53XMF
	O5hao+oB0hqzPiDrEts0ZQ5Rf+oJYKxGQcUoVNFyfrRBbblyOMPYPPUobThlQjRx
	qf7i1g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451pu9d4cy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 09:27:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51R9RMhN016291
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 09:27:22 GMT
Received: from ap-cloud-sh02-lnx.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 27 Feb 2025 01:27:18 -0800
From: songchai <quic_songchai@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Songwei Chai <quic_songchai@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v3 5/7] coresight-tgu: add support to configure next action
Date: Thu, 27 Feb 2025 17:26:38 +0800
Message-ID: <20250227092640.2666894-6-quic_songchai@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227092640.2666894-1-quic_songchai@quicinc.com>
References: <20250227092640.2666894-1-quic_songchai@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0ZX-k2BUEgivwNyvVVqc_tVU6VIKosYK
X-Proofpoint-ORIG-GUID: 0ZX-k2BUEgivwNyvVVqc_tVU6VIKosYK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_012731_936650_912716BB 
X-CRM114-Status: GOOD (  21.66  )
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

From: Songwei Chai <quic_songchai@quicinc.com>

Add "select" node for each step to determine if another step is taken,
trigger(s) are generated, counters/timers incremented/decremented, etc.

Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
Signed-off-by: songchai <quic_songchai@quicinc.com>
---
 .../testing/sysfs-bus-coresight-devices-tgu   |  7 +++
 drivers/hwtracing/coresight/coresight-tgu.c   | 51 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tgu.h   | 30 +++++++++--
 3 files changed, 85 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
index dd6cc1184d52..bd41d872ab46 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -21,3 +21,10 @@ KernelVersion   6.15
 Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
 Description:
                 (RW) Set/Get the decode mode with specific step for TGU.
+
+What:           /sys/bus/coresight/devices/<tgu-name>/step[0:7]_condition_select/reg[0:3]
+Date:           February 2025
+KernelVersion   6.15
+Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
+Description:
+                (RW) Set/Get the next action with specific step for TGU.
diff --git a/drivers/hwtracing/coresight/coresight-tgu.c b/drivers/hwtracing/coresight/coresight-tgu.c
index 5eebf5eecbbb..4f41bd0fd5d7 100644
--- a/drivers/hwtracing/coresight/coresight-tgu.c
+++ b/drivers/hwtracing/coresight/coresight-tgu.c
@@ -34,6 +34,9 @@ static int calculate_array_location(struct tgu_drvdata *drvdata, int step_index,
 	case TGU_CONDITION_DECODE:
 		ret = step_index * (drvdata->max_condition_decode) + reg_index;
 		break;
+	case TGU_CONDITION_SELECT:
+		ret = step_index * (drvdata->max_condition_select) + reg_index;
+		break;
 	default:
 		break;
 	}
@@ -62,6 +65,11 @@ static ssize_t tgu_dataset_show(struct device *dev,
 				  drvdata->value_table->condition_decode[calculate_array_location(
 				  drvdata, tgu_attr->step_index, tgu_attr->operation_index,
 				  tgu_attr->reg_num)]);
+	case TGU_CONDITION_SELECT:
+		return sysfs_emit(buf, "0x%x\n",
+			drvdata->value_table->condition_select[calculate_array_location(
+				drvdata, tgu_attr->step_index, tgu_attr->operation_index,
+				tgu_attr->reg_num)]);
 
 	}
 	return -EINVAL;
@@ -99,6 +107,12 @@ static ssize_t tgu_dataset_store(struct device *dev,
 			tgu_attr->reg_num)] = val;
 		ret = size;
 		break;
+	case TGU_CONDITION_SELECT:
+		tgu_drvdata->value_table->condition_select[calculate_array_location(
+			tgu_drvdata, tgu_attr->step_index, tgu_attr->operation_index,
+			tgu_attr->reg_num)] = val;
+		ret = size;
+		break;
 	default:
 		break;
 	}
@@ -131,6 +145,14 @@ static umode_t tgu_node_visible(struct kobject *kobject, struct attribute *attr,
 					drvdata->max_condition_decode) ?
 						attr->mode : 0;
 			break;
+		case TGU_CONDITION_SELECT:
+			/* 'default' register is at the end of 'select' region */
+			if (tgu_attr->reg_num == drvdata->max_condition_select-1)
+				attr->name = "default";
+			ret = (tgu_attr->reg_num <
+					drvdata->max_condition_select) ?
+						attr->mode : 0;
+			break;
 		default:
 			break;
 		}
@@ -168,6 +190,16 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 		}
 	}
 
+	for (i = 0; i < drvdata->max_step; i++) {
+		for (j = 0; j < drvdata->max_condition_select; j++) {
+			tgu_writel(drvdata,
+				drvdata->value_table->condition_select
+					[calculate_array_location(drvdata, i,
+						TGU_CONDITION_SELECT, j)],
+				CONDITION_SELECT_STEP(i, j));
+		}
+	}
+
 	/* Enable TGU to program the triggers */
 	tgu_writel(drvdata, 1, TGU_CONTROL);
 	CS_LOCK(drvdata->base);
@@ -318,6 +350,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
 	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
 	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
 	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(0),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(1),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(2),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(3),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(4),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(5),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(6),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(7),
 	NULL,
 };
 
@@ -368,6 +408,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 		return -EINVAL;
 
 	drvdata->max_condition_decode = drvdata->max_condition;
+	/* select region has an additional 'default' register */
+	drvdata->max_condition_select = drvdata->max_condition + 1;
 
 	drvdata->value_table =
 		devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
@@ -392,6 +434,15 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 	if (!drvdata->value_table->condition_decode)
 		return -ENOMEM;
 
+	drvdata->value_table->condition_select = devm_kzalloc(
+		dev,
+		drvdata->max_condition_select * drvdata->max_step *
+			sizeof(*(drvdata->value_table->condition_select)),
+		GFP_KERNEL);
+
+	if (!drvdata->value_table->condition_select)
+		return -ENOMEM;
+
 	drvdata->enable = false;
 	desc.type = CORESIGHT_DEV_TYPE_HELPER;
 	desc.pdata = adev->dev.platform_data;
diff --git a/drivers/hwtracing/coresight/coresight-tgu.h b/drivers/hwtracing/coresight/coresight-tgu.h
index c2a9ce38b44f..f215bc01519c 100644
--- a/drivers/hwtracing/coresight/coresight-tgu.h
+++ b/drivers/hwtracing/coresight/coresight-tgu.h
@@ -49,6 +49,9 @@
 #define CONDITION_DECODE_STEP(step, decode) \
 	(0x0050 + 0x4 * decode + 0x1D8 * step)
 
+#define CONDITION_SELECT_STEP(step, select) \
+	(0x0060 + 0x4 * select + 0x1D8 * step)
+
 #define tgu_dataset_ro(name, step_index, type, reg_num)     \
 	(&((struct tgu_attribute[]){ {                      \
 		__ATTR(name, 0444, tgu_dataset_show, NULL), \
@@ -72,6 +75,9 @@
 #define STEP_DECODE(step_index, reg_num) \
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
 
+#define STEP_SELECT(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
+
 #define STEP_PRIORITY_LIST(step_index, priority)  \
 	{STEP_PRIORITY(step_index, 0, priority),  \
 	 STEP_PRIORITY(step_index, 1, priority),  \
@@ -102,6 +108,15 @@
 	 NULL           \
 	}
 
+#define STEP_SELECT_LIST(n) \
+	{STEP_SELECT(n, 0), \
+	 STEP_SELECT(n, 1), \
+	 STEP_SELECT(n, 2), \
+	 STEP_SELECT(n, 3), \
+	 STEP_SELECT(n, 4), \
+	 NULL           \
+	}
+
 #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
 	(&(const struct attribute_group){\
 		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
@@ -116,13 +131,20 @@
 		.name = "step" #step "_condition_decode" \
 	})
 
+#define CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_SELECT_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_condition_select" \
+	})
+
 enum operation_index {
 	TGU_PRIORITY0,
 	TGU_PRIORITY1,
 	TGU_PRIORITY2,
 	TGU_PRIORITY3,
-	TGU_CONDITION_DECODE
-
+	TGU_CONDITION_DECODE,
+	TGU_CONDITION_SELECT
 };
 
 /* Maximum priority that TGU supports */
@@ -138,6 +160,7 @@ struct tgu_attribute {
 struct value_table {
 	unsigned int *priority;
 	unsigned int *condition_decode;
+	unsigned int *condition_select;
 };
 
 /**
@@ -152,7 +175,7 @@ struct value_table {
  * @max_step: Maximum step size
  * @max_condition: Maximum number of condition
  * @max_condition_decode: Maximum number of condition_decode
- *
+ * @max_condition_select: Maximum number of condition_select
  * This structure defines the data associated with a TGU device, including its base
  * address, device pointers, clock, spinlock for synchronization, trigger data pointers,
  * maximum limits for various trigger-related parameters, and enable status.
@@ -168,6 +191,7 @@ struct tgu_drvdata {
 	int max_step;
 	int max_condition;
 	int max_condition_decode;
+	int max_condition_select;
 };
 
 #endif


