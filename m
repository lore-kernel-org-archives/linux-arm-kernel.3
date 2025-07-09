Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976FBC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 12:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwCNXLW8daJ4Kd3BZQxeVEzwL/MPR/xGr8U78iFfPAU=; b=ZlMSA4n56FLCSzRA2jvqjx0182
	NJFNhhaSF579c8C6qx7l/AII1fMo7eMMmiDdUDNd6TrayEB3Yc9Qj5zvXN+lPfpHhVfr++hHoNVW1
	JPl/g+30lrst/UbCoJD0lPBt5O73/cD6Y4VDKZWnHdkdqzBmXjxuR9iyctW7tF2xhyM5027uaqEgg
	f3sfB8rEY9WHg1JTUbdM02Re+wiQURwcR1D28uhZSc4ipzWYEWIApjy70Py/1yxlQjRyrmJD4mG4E
	QxsdeNhMcL9uYb3Mah6Mb6j32ieyG8vJ0/biP9w8IwUKAY7JXSB/IC6OGtXA4sflbeWga7CQ/Prne
	PXgJoMXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZUBI-00000008g4I-0OLC;
	Wed, 09 Jul 2025 12:45:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSF0-00000008L70-1cEL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 10:41:31 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5697jLki009942;
	Wed, 9 Jul 2025 10:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=jwCNXLW8daJ4Kd3BZQxeVEzwL/MPR/xGr8U78iFfPAU=; b=oh
	mUem2FZHIB4GxPP0VIYw9Ae+5DSxByc25XDHfk8IOOYwzP90iFos2+RlGiX2qUFF
	O7hufe9rW9mTEfHl1MWk/ch6yO3IPzx/x0ecwIxzMHdBRtNSI3djzLC2CFJKxKcV
	1LHNF7zvgs0obWexrZsd72fA+GKo5vfT2W/gRG5hmLj91vky++qne29omvqHMINK
	5Dkx/y34LiTo6zCbSi1aIHB/TQA6u+vhUA/CwBwq7g8SILwS8/20304KLbDr3G+a
	61AcczuyHO/pzl4bUieSt/oYJh45V1t3/DJm5Pte1KjI7HJECLnENaPYd7CNmHID
	CQuI6V8ralXDqXJZkPKg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smafghtc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 10:41:22 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 569AXdlr025091;
	Wed, 9 Jul 2025 10:41:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 47s9h16uf2-1;
	Wed, 09 Jul 2025 10:41:21 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 569AfLCm006125;
	Wed, 9 Jul 2025 10:41:21 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-songchai-lv.qualcomm.com [10.81.24.255])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 569AfLjv006124;
	Wed, 09 Jul 2025 10:41:21 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 4201483)
	id 6F5C35010D0; Wed,  9 Jul 2025 03:41:21 -0700 (PDT)
From: songchai <songchai@qti.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, quic_songchai@quicinc.com
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v6 4/7] coresight-tgu: Add TGU decode support
Date: Wed,  9 Jul 2025 03:41:11 -0700
Message-Id: <20250709104114.22240-5-songchai@qti.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250709104114.22240-1-songchai@qti.qualcomm.com>
References: <20250709104114.22240-1-songchai@qti.qualcomm.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZJ/XmW7b c=1 sm=1 tr=0 ts=686e4753 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=tUVMKqKpm64dBOVCEmMA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: F_s19yh8rysjhfrsE-Cr93c4qgX4MIWP
X-Proofpoint-GUID: F_s19yh8rysjhfrsE-Cr93c4qgX4MIWP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA5NiBTYWx0ZWRfX8rr78C1X93K4
 nEYb9/DMg12zbrT0/iU49H2PYftygS0FI+fB1h6ELeAoLpmra5DhRkHiATHhxF/psK6VoegQ8+2
 25/GtFBWYdr9y1o8vmeyZbLiulLtvKIlu8Q3y+XaOX9Yjkq3d07C9EHm/YGdj2jHHdpA/0QaZqX
 rRO72pCL8SJtJTN5JwlOXz5Ay5FYFPPCu4lIrGNZe9lc3RdRQ+XJxna60YkntKKBETeZKW4rqZb
 ptX8YvVh0MAODhIAc6k2dhajcg76yeK5ufkXJ3QrpG78RwcNZv9ZqSUynkU+DJa2qDJUEnC1Tow
 jX/4cZ+xSuzotclKznkPfuqifFeC4ra3hWz8CIc4K6tl3VzRB563c70fTKwbcdL07orobx2NH04
 VpTt3EThW3kkVBi2OshIvj2zT4b+scel/Mle1sfk+5wqtvoej5lIspRTXW5x9gIZjnudyUyL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 impostorscore=0 spamscore=0 adultscore=0 clxscore=1011
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_034130_545921_FF2CE1DD 
X-CRM114-Status: GOOD (  22.22  )
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

Decoding is when all the potential pieces for creating a trigger
are brought together for a given step. Example - there may be a
counter keeping track of some occurrences and a priority-group that
is being used to detect a pattern on the sense inputs. These 2
inputs to condition_decode must be programmed, for a given step,
to establish the condition for the trigger, or movement to another
steps.

Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
---
 .../testing/sysfs-bus-coresight-devices-tgu   |   7 +
 drivers/hwtracing/coresight/coresight-tgu.c   | 186 +++++++++++++++---
 drivers/hwtracing/coresight/coresight-tgu.h   |  27 +++
 3 files changed, 195 insertions(+), 25 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
index 4132f5912308..7530fff3338b 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -14,3 +14,10 @@ KernelVersion	6.16
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Songwei Chai (QUIC) <quic_songchai@quicinc.com>
 Description:
 		(RW) Set/Get the sensed signal with specific step and priority for TGU.
+
+What:		/sys/bus/coresight/devices/<tgu-name>/step[0:7]_condition_decode/reg[0:3]
+Date:		July 2025
+KernelVersion	6.16
+Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Songwei Chai (QUIC) <quic_songchai@quicinc.com>
+Description:
+		(RW) Set/Get the decode mode with specific step for TGU.
diff --git a/drivers/hwtracing/coresight/coresight-tgu.c b/drivers/hwtracing/coresight/coresight-tgu.c
index 901409bef2c5..f123ae082555 100644
--- a/drivers/hwtracing/coresight/coresight-tgu.c
+++ b/drivers/hwtracing/coresight/coresight-tgu.c
@@ -21,13 +21,35 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 				    int step_index, int operation_index,
 				    int reg_index)
 {
-	int ret;
+	int ret = -EINVAL;
+
+	switch (operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		ret = operation_index * (drvdata->max_step) *
+			      (drvdata->max_reg) +
+		      step_index * (drvdata->max_reg) + reg_index;
+		break;
+	case TGU_CONDITION_DECODE:
+		ret = step_index * (drvdata->max_condition_decode) +
+		      reg_index;
+		break;
+	default:
+		break;
+	}
+	return ret;
+}
 
-	ret = operation_index * (drvdata->max_step) *
-		      (drvdata->max_reg) +
-	      step_index * (drvdata->max_reg) + reg_index;
+static int check_array_location(struct tgu_drvdata *drvdata, int step,
+				int ops, int reg)
+{
+	int result = calculate_array_location(drvdata, step, ops, reg);
 
-	return ret;
+	if (result == -EINVAL)
+		dev_err(&drvdata->csdev->dev, "%s - Fail\n", __func__);
+	return result;
 }
 
 static ssize_t tgu_dataset_show(struct device *dev,
@@ -36,13 +58,33 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	struct tgu_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct tgu_attribute *tgu_attr =
 		container_of(attr, struct tgu_attribute, attr);
+	int ret = 0;
+
+	ret = check_array_location(drvdata, tgu_attr->step_index,
+				tgu_attr->operation_index, tgu_attr->reg_num);
+	if (ret == -EINVAL)
+		return ret;
 
-	return sysfs_emit(buf, "0x%x\n",
-			  drvdata->value_table->priority[
-					calculate_array_location(
-					drvdata, tgu_attr->step_index,
-					tgu_attr->operation_index,
-					tgu_attr->reg_num)]);
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		return sysfs_emit(buf, "0x%x\n",
+				  drvdata->value_table->priority[calculate_array_location(
+					  drvdata, tgu_attr->step_index,
+					  tgu_attr->operation_index,
+					  tgu_attr->reg_num)]);
+	case TGU_CONDITION_DECODE:
+		return sysfs_emit(buf, "0x%x\n",
+				  drvdata->value_table->condition_decode[calculate_array_location(
+					  drvdata, tgu_attr->step_index,
+					  tgu_attr->operation_index,
+					  tgu_attr->reg_num)]);
+	default:
+		break;
+	}
+	return -EINVAL;
 }
 
 static ssize_t tgu_dataset_store(struct device *dev,
@@ -51,20 +93,44 @@ static ssize_t tgu_dataset_store(struct device *dev,
 				 size_t size)
 {
 	unsigned long val;
+	int ret = -EINVAL;
 
 	struct tgu_drvdata *tgu_drvdata = dev_get_drvdata(dev->parent);
 	struct tgu_attribute *tgu_attr =
 		container_of(attr, struct tgu_attribute, attr);
 
 	if (kstrtoul(buf, 0, &val))
-		return -EINVAL;
+		return ret;
 
-	guard(spinlock)(&tgu_drvdata->spinlock);
-	tgu_drvdata->value_table->priority[calculate_array_location(
-		tgu_drvdata, tgu_attr->step_index, tgu_attr->operation_index,
-		tgu_attr->reg_num)] = val;
+	ret = check_array_location(tgu_drvdata, tgu_attr->step_index,
+		tgu_attr->operation_index, tgu_attr->reg_num);
 
-	return size;
+	if (ret == -EINVAL)
+		return ret;
+
+	guard(spinlock)(&tgu_drvdata->spinlock);
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		tgu_drvdata->value_table->priority[calculate_array_location(
+			tgu_drvdata, tgu_attr->step_index,
+			tgu_attr->operation_index,
+			tgu_attr->reg_num)] = val;
+		ret = size;
+		break;
+	case TGU_CONDITION_DECODE:
+		tgu_drvdata->value_table->condition_decode[calculate_array_location(
+			tgu_drvdata, tgu_attr->step_index,
+			tgu_attr->operation_index,
+			tgu_attr->reg_num)] = val;
+		ret = size;
+		break;
+	default:
+		break;
+	}
+	return ret;
 }
 
 static umode_t tgu_node_visible(struct kobject *kobject,
@@ -81,34 +147,70 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 		container_of(dev_attr, struct tgu_attribute, attr);
 
 	if (tgu_attr->step_index < drvdata->max_step) {
-		ret = (tgu_attr->reg_num < drvdata->max_reg) ?
-			      attr->mode :
-			      0;
+		switch (tgu_attr->operation_index) {
+		case TGU_PRIORITY0:
+		case TGU_PRIORITY1:
+		case TGU_PRIORITY2:
+		case TGU_PRIORITY3:
+			ret = (tgu_attr->reg_num < drvdata->max_reg) ?
+				      attr->mode :
+				      0;
+			break;
+		case TGU_CONDITION_DECODE:
+			ret = (tgu_attr->reg_num <
+			       drvdata->max_condition_decode) ?
+				      attr->mode :
+				      0;
+			break;
+		default:
+			break;
+		}
 	}
 	return ret;
 }
 
-static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
+static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 {
-	int i, j, k;
+	int i, j, k, ret;
 
 	CS_UNLOCK(drvdata->base);
 
 	for (i = 0; i < drvdata->max_step; i++) {
 		for (j = 0; j < MAX_PRIORITY; j++) {
 			for (k = 0; k < drvdata->max_reg; k++) {
+
+				ret = check_array_location(drvdata, i, j, k);
+				if (ret == -EINVAL)
+					goto exit;
+
 				tgu_writel(drvdata,
 					   drvdata->value_table->priority
 						   [calculate_array_location(
-							drvdata, i, j, k)],
+							   drvdata, i, j, k)],
 					   PRIORITY_REG_STEP(i, j, k));
 			}
 		}
 	}
 
+	for (i = 0; i < drvdata->max_step; i++) {
+		for (j = 0; j < drvdata->max_condition_decode; j++) {
+			ret = check_array_location(drvdata, i, TGU_CONDITION_DECODE, j);
+			if (ret == -EINVAL)
+				goto exit;
+
+			tgu_writel(drvdata,
+				   drvdata->value_table->condition_decode
+					   [calculate_array_location(
+						   drvdata, i,
+						   TGU_CONDITION_DECODE, j)],
+				   CONDITION_DECODE_STEP(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	tgu_writel(drvdata, 1, TGU_CONTROL);
+exit:
 	CS_LOCK(drvdata->base);
+	return ret >= 0 ? 0 : ret;
 }
 
 static void tgu_set_reg_number(struct tgu_drvdata *drvdata)
@@ -139,19 +241,35 @@ static void tgu_set_steps(struct tgu_drvdata *drvdata)
 	drvdata->max_step = num_steps;
 }
 
+static void tgu_set_conditions(struct tgu_drvdata *drvdata)
+{
+	int num_conditions;
+	u32 devid;
+
+	devid = readl_relaxed(drvdata->base + CORESIGHT_DEVID);
+
+	num_conditions = TGU_DEVID_CONDITIONS(devid);
+	drvdata->max_condition_decode = num_conditions;
+}
+
 static int tgu_enable(struct coresight_device *csdev, enum cs_mode mode,
 		      void *data)
 {
+	int ret = 0;
 	struct tgu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
 	guard(spinlock)(&drvdata->spinlock);
 	if (drvdata->enable)
 		return -EBUSY;
 
-	tgu_write_all_hw_regs(drvdata);
+	ret = tgu_write_all_hw_regs(drvdata);
+
+	if (ret == -EINVAL)
+		goto exit;
 	drvdata->enable = true;
 
-	return 0;
+exit:
+	return ret;
 }
 
 static int tgu_disable(struct coresight_device *csdev, void *data)
@@ -267,6 +385,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
 	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
 	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
 	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(0),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(1),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(2),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(3),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(4),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
 	NULL,
 };
 
@@ -303,6 +429,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	tgu_set_reg_number(drvdata);
 	tgu_set_steps(drvdata);
+	tgu_set_conditions(drvdata);
 
 	drvdata->value_table =
 		devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
@@ -318,6 +445,15 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 	if (!drvdata->value_table->priority)
 		return -ENOMEM;
 
+	drvdata->value_table->condition_decode = devm_kzalloc(
+		dev,
+		drvdata->max_condition_decode * drvdata->max_step *
+			sizeof(*(drvdata->value_table->condition_decode)),
+		GFP_KERNEL);
+
+	if (!drvdata->value_table->condition_decode)
+		return -ENOMEM;
+
 	drvdata->enable = false;
 	desc.type = CORESIGHT_DEV_TYPE_HELPER;
 	desc.pdata = adev->dev.platform_data;
diff --git a/drivers/hwtracing/coresight/coresight-tgu.h b/drivers/hwtracing/coresight/coresight-tgu.h
index 9b79106c92ea..8d3c6ddc19ed 100644
--- a/drivers/hwtracing/coresight/coresight-tgu.h
+++ b/drivers/hwtracing/coresight/coresight-tgu.h
@@ -15,6 +15,7 @@
 
 #define TGU_DEVID_SENSE_INPUT(devid_val) ((int) BMVAL(devid_val, 10, 17))
 #define TGU_DEVID_STEPS(devid_val) ((int)BMVAL(devid_val, 3, 6))
+#define TGU_DEVID_CONDITIONS(devid_val) ((int)BMVAL(devid_val, 0, 2))
 #define NUMBER_BITS_EACH_SIGNAL 4
 #define LENGTH_REGISTER 32
 
@@ -48,6 +49,7 @@
  */
 #define STEP_OFFSET 0x1D8
 #define PRIORITY_START_OFFSET 0x0074
+#define CONDITION_DECODE_OFFSET 0x0050
 #define PRIORITY_OFFSET 0x60
 #define REG_OFFSET 0x4
 
@@ -56,6 +58,9 @@
 	(PRIORITY_START_OFFSET + PRIORITY_OFFSET * priority +\
 	REG_OFFSET * reg + STEP_OFFSET * step)
 
+#define CONDITION_DECODE_STEP(step, decode) \
+	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
+
 #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
 	(&((struct tgu_attribute[]){ {                                   \
 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
@@ -68,6 +73,9 @@
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
 		       reg_num)
 
+#define STEP_DECODE(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
+
 #define STEP_PRIORITY_LIST(step_index, priority)  \
 	{STEP_PRIORITY(step_index, 0, priority),  \
 	 STEP_PRIORITY(step_index, 1, priority),  \
@@ -90,6 +98,14 @@
 	 NULL			\
 	}
 
+#define STEP_DECODE_LIST(n) \
+	{STEP_DECODE(n, 0), \
+	 STEP_DECODE(n, 1), \
+	 STEP_DECODE(n, 2), \
+	 STEP_DECODE(n, 3), \
+	 NULL           \
+	}
+
 #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
 	(&(const struct attribute_group){\
 		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
@@ -97,11 +113,19 @@
 		.name = "step" #step "_priority" #priority \
 	})
 
+#define CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_DECODE_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_condition_decode" \
+	})
+
 enum operation_index {
 	TGU_PRIORITY0,
 	TGU_PRIORITY1,
 	TGU_PRIORITY2,
 	TGU_PRIORITY3,
+	TGU_CONDITION_DECODE,
 };
 
 /* Maximum priority that TGU supports */
@@ -116,6 +140,7 @@ struct tgu_attribute {
 
 struct value_table {
 	unsigned int *priority;
+	unsigned int *condition_decode;
 };
 
 /**
@@ -128,6 +153,7 @@ struct value_table {
  * @value_table: Store given value based on relevant parameters.
  * @max_reg: Maximum number of registers
  * @max_step: Maximum step size
+ * @max_condition_decode: Maximum number of condition_decode
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -143,6 +169,7 @@ struct tgu_drvdata {
 	struct value_table *value_table;
 	int max_reg;
 	int max_step;
+	int max_condition_decode;
 };
 
 #endif


