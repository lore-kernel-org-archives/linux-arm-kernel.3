Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FAAD232CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 02:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8ZUSHgXPwxI60cMjU2VQsRQlj6MWG27O1WOHBdsivk=; b=s0Gtn61d3127tmuqMe8+StQcZs
	yWahBSD/N1nppl8B7eMkVKvmaQGLP8uAF6E19vHid5siZoeQZQx6p3TEdZJtFTclU3LnQs8ZnZnFK
	Z6MnyLTN7FK5AMoQ2s9Vcv0UHZHyY+/fl5D0l3/K9KFo7fc2tO8wBkdUagLOVK6PBgtGdWu3xrS7K
	yLauuS7aIF60LHRcdkZ8eKvqEzHZkLUcpiaZN+ryGbft4jfBQwKUH1+25UVmC0BnYw4z4f7nMzt25
	rhrqsXiKqFuciIhPjs7g9fPGPLgf92jcTQVWy/nyu5yalIxy0EGVxu0ZazzbBoLTpp58YAQ56mbyY
	rt6o5sRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve1z6-000000016Xf-0RC1;
	Fri, 09 Jan 2026 02:12:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve1z2-000000016V9-3L2V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 02:12:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608Ir45t3142436
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Jan 2026 02:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=l8ZUSHgXPwx
	I60cMjU2VQsRQlj6MWG27O1WOHBdsivk=; b=D1n92uk4Xuz6NJo5ZjVbZwac/CL
	NDQZhMPTufFo+Sasuv4EKbMKGui54p5pPcuFDdZWuwW6dXdpjAydlrdoPYphU5FA
	KiCjrkzuJoRY+6558EG/XuSm5wdzWdTdpywYzsCEtqXMsuNKqvYbwSYlc1gyEiut
	Dk1ii7llcboGL1Lcj3RsODXD7BLv9WIeOSs003/HUlK4+56p9yqQD9FbVfMNJWL9
	zPXK3ZDrgKmG+862xglhG7EPVIjwKSQfpLbONKuhghBrRufefCK5fDKCtOLEhPYX
	S3QpDZUbQVmIlAIf0Y3rzjfRTeUQuHF+RJZhxGH0wxg7wYgy6YxNskVNfRg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j0yd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 02:12:11 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b0531e07e3so3222655eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 18:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767924730; x=1768529530; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8ZUSHgXPwxI60cMjU2VQsRQlj6MWG27O1WOHBdsivk=;
        b=L6M5kcMxDxgW+DsbkYMnoZ1DH3gjJD8tXzL6BNYGwFxN/TBoUkYCH72CIDUNKiYt5O
         2PJxFGzcGSruQMob2ETKHsNEp28iBedZm08b54W9rT/lZ5/znXIZpK5pWa6mTewEks1t
         nO6kIpCE40aHmuw3dvvxG5TYPODtiIJSvfB9dOAMHzaojfLYI+0s/E810NMsuYI/uNpy
         iWo2ZXfFg1fK+Gt3sjReaYxnWrOxKpxECN0CptUabOcHwPGVFthDtnlcFK2wFJYAHNlY
         5PPMSSluLmVCrObJNeBgUVbeg79fGqwOw9bDfKvkRAWGnFsBgJJ2jQ3xJr7707j9yXW0
         DEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767924730; x=1768529530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l8ZUSHgXPwxI60cMjU2VQsRQlj6MWG27O1WOHBdsivk=;
        b=XTLULsOS62TA6rCp78nLOfzd6p5dMc26KgLBWPWNPZgwk4FkfDfGPtyjSJsqQD5ndX
         rjj7Y+7khf4j80VyQ25DrA0YF9n28m2WO9ocBtS2UhJwxJXmBfhmdalhxWDxHV5ic9+X
         C0yTIFu4kvs4/BO5nYc4gKMyvjIXBdQWm4naz1st5xT1ucgOQddw68Cy46wxam+kW1/c
         wPM911A1CFIbaLK9fmGQFS83ZL2DecSjAZv1Ay6i8HgcxMfqpEE6gBxOPTZGcWtTIZi+
         ixGSXM+B9iDdMjW55Km4ooypMf3lOB0W9E8zgEx4EQj7yuWS/1mU+DMsC9NG9l+peS5U
         Dx3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVuDt4+387qtA57/SRVH4XYpsYtwTjt4KxQRYufqpL6C0ZRQFHEx/vblOERxI7bpHcg7TcYQbO7yKCCWNq3zbYN@lists.infradead.org
X-Gm-Message-State: AOJu0YyPI12PcXISnqve6Ztw+erg63QYa37EldJAH0kdVj/Bpm4CJ4XY
	tVTq4o/t4KHs7YKoyEe7LUy3WXM+2NUYi3YBW/kh3jz81/CResg3Sudw6Kr4WpK8kietvu/mE4w
	VQpDuNnWK0G79HIjKoW9d4uNyNeGsV1P29FJZ50dZTd7DGgC6nccH7baYirA7Hnr+vBf7AafA2P
	+Cig==
X-Gm-Gg: AY/fxX6KQkVzNUKg2fzA/EpoiH+fByhgZIzA7+5bKK7d5WibwiWvplu4iymFmLqq4Xn
	inXaUm1XCJH9NAUaFdssz/JQkmkrJ56eAVPNICLykbHHt3Bg2dXUvU89aKopGOMhXRlzVoaS5Xv
	Hc1DCtavV+AlQOW5g9kJ0JOgzV+/tFBS1CW2s+PQ8FFbH0fSIvnj7eW27uTzj/cltFVIocmgRms
	+G0EMRqjUPtrAhsdzTIyMFLNvdPcy1rESYFB79ut1CjOrwp44MnJIUhNQrtHMEFvMvUPb7ZWfFP
	fvDa/5Xjm/oiZF8brxO99zxnAjNpGjbA9DK0KijAdH3SOHGpQAozT2bLsYu/jA93S2y/687lYmz
	22EBVm0NkFHnMKlhXUQd4gTbc8QUztI1sckoocfUD8V3DvWqw1Eyn1RPo0v7HcOxc
X-Received: by 2002:a05:7300:fb09:b0:2a4:3593:466d with SMTP id 5a478bee46e88-2b17d226c06mr5084522eec.9.1767924730256;
        Thu, 08 Jan 2026 18:12:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvY/KIw1x5A1D0EeHpkihkYg3QpZfby76yqehvPy8YBwjD2Fqm89ZI+vwkayOWry45JN4POg==
X-Received: by 2002:a05:7300:fb09:b0:2a4:3593:466d with SMTP id 5a478bee46e88-2b17d226c06mr5084502eec.9.1767924729642;
        Thu, 08 Jan 2026 18:12:09 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707d76aasm9459111eec.33.2026.01.08.18.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 18:12:09 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, suzuki.poulose@arm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v10 3/7] qcom-tgu: Add signal priority support
Date: Thu,  8 Jan 2026 18:11:37 -0800
Message-Id: <20260109021141.3778421-4-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAxMiBTYWx0ZWRfX77bduzQhsg0b
 coeA7cnxaxIwUsEZOLVTJyPT0utik8wVJXO7TW+IN1JrOeeVmIZpblCbuXSLI6sCDuHw+KSYIB9
 Ff0ddy1VwNdT1/5Yr3WmWhxPaod0VHWjX/iJFhfZVv4AGA1BN0FV9FNIK5wS9uXdv3GK56Ui3eO
 UZkQjkRf1m9waOsg/E/uazpg6whKV90v9tL0V3U3ggVwzQUbvc65G/j1vR+efAZoXBQiy0dFuhS
 ObatnVP9S7twY1AkKT+0f+DF42d4WaIvlMKN/mhC3VwGwy3g0WC7CowwJgLP+8aInP+6ddIs/qR
 K5jnLxUUfIeZDg5CFdDKrwj4gKYAY8IYBLFhbfaoGvWlHCBXxzat4mgSsavV0gkm37oqcx0bCUk
 Vuo0sKPnex33DLTD031Vm686pXIX7dis85t+X2FrjYJw0bc3jIRqE8VgfB9RTYPkkLk6yr55gkr
 7WY+Oq49A+63GLZqIXg==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=696063fb cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=aHbVEu0FunmFpxPyS6YA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: D9KBuwH-9lM7n3dpg2HmGbhOXj8Qff2o
X-Proofpoint-ORIG-GUID: D9KBuwH-9lM7n3dpg2HmGbhOXj8Qff2o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_181213_031632_E1595DEC 
X-CRM114-Status: GOOD (  21.23  )
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

Like circuit of a Logic analyzer, in TGU, the requirement could be
configured in each step and the trigger will be created once the
requirements are met. Add priority functionality here to sort the
signals into different priorities. The signal which is wanted could
be configured in each step's priority node, the larger number means
the higher priority and the signal with higher priority will be sensed
more preferentially.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
 drivers/hwtracing/qcom/tgu.c                  | 160 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  | 113 +++++++++++++
 3 files changed, 280 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 56ec3f5ab5d6..ec630e6ff2ee 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -7,3 +7,10 @@ Description:
 		Accepts only one of the 2 values -  0 or 1.
 		0 : disable TGU.
 		1 : enable TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_priority[0:3]/reg[0:17]
+Date:		January 2026
+KernelVersion	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the sensed signal with specific step and priority for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index c5b2b384e6ae..f8870766d624 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -14,14 +14,120 @@
 
 #include "tgu.h"
 
+static int calculate_array_location(struct tgu_drvdata *drvdata,
+				   int step_index, int operation_index,
+				   int reg_index)
+{
+	return operation_index * (drvdata->max_step) * (drvdata->max_reg) +
+		step_index * (drvdata->max_reg) + reg_index;
+}
+
+static ssize_t tgu_dataset_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	struct tgu_attribute *tgu_attr =
+			container_of(attr, struct tgu_attribute, attr);
+	int index;
+
+	index = calculate_array_location(drvdata, tgu_attr->step_index,
+					 tgu_attr->operation_index,
+					 tgu_attr->reg_num);
+
+	return sysfs_emit(buf, "0x%x\n",
+			  drvdata->value_table->priority[index]);
+}
+
+static ssize_t tgu_dataset_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t size)
+{
+	struct tgu_drvdata *tgu_drvdata = dev_get_drvdata(dev);
+	struct tgu_attribute *tgu_attr =
+		container_of(attr, struct tgu_attribute, attr);
+	unsigned long val;
+	int index;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	guard(spinlock)(&tgu_drvdata->lock);
+	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
+					 tgu_attr->operation_index,
+					 tgu_attr->reg_num);
+
+	tgu_drvdata->value_table->priority[index] = val;
+	return size;
+}
+
+static umode_t tgu_node_visible(struct kobject *kobject,
+				struct attribute *attr,
+				int n)
+{
+	struct device *dev = kobj_to_dev(kobject);
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	struct device_attribute *dev_attr =
+		container_of(attr, struct device_attribute, attr);
+	struct tgu_attribute *tgu_attr =
+		container_of(dev_attr, struct tgu_attribute, attr);
+	int ret = SYSFS_GROUP_INVISIBLE;
+
+	if (tgu_attr->step_index < drvdata->max_step) {
+		ret = (tgu_attr->reg_num < drvdata->max_reg) ?
+			attr->mode : 0;
+	}
+	return ret;
+}
+
 static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 {
+	int i, j, k, index;
+
 	TGU_UNLOCK(drvdata->base);
+	for (i = 0; i < drvdata->max_step; i++) {
+		for (j = 0; j < MAX_PRIORITY; j++) {
+			for (k = 0; k < drvdata->max_reg; k++) {
+				index = calculate_array_location(
+							drvdata, i, j, k);
+
+				writel(drvdata->value_table->priority[index],
+					drvdata->base +
+					PRIORITY_REG_STEP(i, j, k));
+			}
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
 	TGU_LOCK(drvdata->base);
 }
 
+static void tgu_set_reg_number(struct tgu_drvdata *drvdata)
+{
+	int num_sense_input;
+	int num_reg;
+	u32 devid;
+
+	devid = readl(drvdata->base + TGU_DEVID);
+
+	num_sense_input = TGU_DEVID_SENSE_INPUT(devid);
+	if (((num_sense_input * NUMBER_BITS_EACH_SIGNAL) % LENGTH_REGISTER) == 0)
+		num_reg = (num_sense_input * NUMBER_BITS_EACH_SIGNAL) / LENGTH_REGISTER;
+	else
+		num_reg = ((num_sense_input * NUMBER_BITS_EACH_SIGNAL) / LENGTH_REGISTER) + 1;
+	drvdata->max_reg = num_reg;
+
+}
+
+static void tgu_set_steps(struct tgu_drvdata *drvdata)
+{
+	u32 devid;
+
+	devid = readl(drvdata->base + TGU_DEVID);
+
+	drvdata->max_step = TGU_DEVID_STEPS(devid);
+}
+
 static int tgu_enable(struct device *dev)
 {
 	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
@@ -105,6 +211,38 @@ static const struct attribute_group tgu_common_grp = {
 
 static const struct attribute_group *tgu_attr_groups[] = {
 	&tgu_common_grp,
+	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
 	NULL,
 };
 
@@ -112,6 +250,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
+	size_t priority_size;
+	unsigned int *priority;
 	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -127,12 +267,32 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	spin_lock_init(&drvdata->lock);
 
+	tgu_set_reg_number(drvdata);
+	tgu_set_steps(drvdata);
+
 	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
 	if (ret) {
 		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
 		return ret;
 	}
 
+	drvdata->value_table =
+		devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
+	if (!drvdata->value_table)
+		return -ENOMEM;
+
+	priority_size = MAX_PRIORITY * drvdata->max_reg *
+			drvdata->max_step *
+			sizeof(*(drvdata->value_table->priority));
+
+	priority = devm_kzalloc(dev, priority_size, GFP_KERNEL);
+
+	if (!priority)
+		return -ENOMEM;
+
+	drvdata->value_table->priority = priority;
+
+
 	drvdata->enable = false;
 
 	pm_runtime_put(&adev->dev);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index b11cfb28261d..f54cea01e427 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -10,6 +10,113 @@
 #define TGU_CONTROL 0x0000
 #define TGU_LAR		0xfb0
 #define TGU_UNLOCK_OFFSET	0xc5acce55
+#define TGU_DEVID	0xfc8
+
+#define BMVAL(val, lsb, msb)	((val & GENMASK(msb, lsb)) >> lsb)
+#define TGU_DEVID_SENSE_INPUT(devid_val) ((int) BMVAL(devid_val, 10, 17))
+#define TGU_DEVID_STEPS(devid_val) ((int)BMVAL(devid_val, 3, 6))
+#define NUMBER_BITS_EACH_SIGNAL 4
+#define LENGTH_REGISTER 32
+
+/*
+ *  TGU configuration space                              Step configuration
+ *  offset table                                         space layout
+ * x-------------------------x$                          x-------------x$
+ * |                         |$                          |             |$
+ * |                         |                           |   reserve   |$
+ * |                         |                           |             |$
+ * |coresight management     |                           |-------------|base+n*0x1D8+0x1F4$
+ * |     registe             |                     |---> |prioroty[3]  |$
+ * |                         |                     |     |-------------|base+n*0x1D8+0x194$
+ * |                         |                     |     |prioroty[2]  |$
+ * |-------------------------|                     |     |-------------|base+n*0x1D8+0x134$
+ * |                         |                     |     |prioroty[1]  |$
+ * |         step[7]         |                     |     |-------------|base+n*0x1D8+0xD4$
+ * |-------------------------|->base+0x40+7*0x1D8  |     |prioroty[0]  |$
+ * |                         |                     |     |-------------|base+n*0x1D8+0x74$
+ * |         ...             |                     |     |  condition  |$
+ * |                         |                     |     |   select    |$
+ * |-------------------------|->base+0x40+1*0x1D8  |     |-------------|base+n*0x1D8+0x60$
+ * |                         |                     |     |  condition  |$
+ * |         step[0]         |-------------------->      |   decode    |$
+ * |-------------------------|-> base+0x40               |-------------|base+n*0x1D8+0x50$
+ * |                         |                           |             |$
+ * | Control and status space|                           |Timer/Counter|$
+ * |        space            |                           |             |$
+ * x-------------------------x->base                     x-------------x base+n*0x1D8+0x40$
+ *
+ */
+#define STEP_OFFSET 0x1D8
+#define PRIORITY_START_OFFSET 0x0074
+#define PRIORITY_OFFSET 0x60
+#define REG_OFFSET 0x4
+
+/* Calculate compare step addresses */
+#define PRIORITY_REG_STEP(step, priority, reg)\
+	(PRIORITY_START_OFFSET + PRIORITY_OFFSET * priority +\
+	 REG_OFFSET * reg + STEP_OFFSET * step)
+
+#define tgu_dataset_rw(name, step_index, type, reg_num)                  \
+	(&((struct tgu_attribute[]){ {                                   \
+		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
+		step_index,                                              \
+		type,                                                    \
+		reg_num,                                                 \
+	} })[0].attr.attr)
+
+#define STEP_PRIORITY(step_index, reg_num, priority)                     \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
+			reg_num)
+
+#define STEP_PRIORITY_LIST(step_index, priority)  \
+	{STEP_PRIORITY(step_index, 0, priority),  \
+	 STEP_PRIORITY(step_index, 1, priority),  \
+	 STEP_PRIORITY(step_index, 2, priority),  \
+	 STEP_PRIORITY(step_index, 3, priority),  \
+	 STEP_PRIORITY(step_index, 4, priority),  \
+	 STEP_PRIORITY(step_index, 5, priority),  \
+	 STEP_PRIORITY(step_index, 6, priority),  \
+	 STEP_PRIORITY(step_index, 7, priority),  \
+	 STEP_PRIORITY(step_index, 8, priority),  \
+	 STEP_PRIORITY(step_index, 9, priority),  \
+	 STEP_PRIORITY(step_index, 10, priority), \
+	 STEP_PRIORITY(step_index, 11, priority), \
+	 STEP_PRIORITY(step_index, 12, priority), \
+	 STEP_PRIORITY(step_index, 13, priority), \
+	 STEP_PRIORITY(step_index, 14, priority), \
+	 STEP_PRIORITY(step_index, 15, priority), \
+	 STEP_PRIORITY(step_index, 16, priority), \
+	 STEP_PRIORITY(step_index, 17, priority), \
+	 NULL                   \
+	}
+
+#define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_priority" #priority \
+	})
+
+enum operation_index {
+	TGU_PRIORITY0,
+	TGU_PRIORITY1,
+	TGU_PRIORITY2,
+	TGU_PRIORITY3,
+};
+
+/* Maximum priority that TGU supports */
+#define MAX_PRIORITY 4
+
+struct tgu_attribute {
+	struct device_attribute attr;
+	u32 step_index;
+	enum operation_index operation_index;
+	u32 reg_num;
+};
+
+struct value_table {
+	unsigned int *priority;
+};
 
 static inline void TGU_LOCK(void __iomem *addr)
 {
@@ -35,6 +142,9 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @dev: Pointer to the associated device structure
  * @lock: Spinlock for handling concurrent access
  * @enable: Flag indicating whether the TGU device is enabled
+ * @value_table: Store given value based on relevant parameters.
+ * @max_reg: Maximum number of registers
+ * @max_step: Maximum step size
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -46,6 +156,9 @@ struct tgu_drvdata {
 	struct device *dev;
 	spinlock_t lock;
 	bool enable;
+	struct value_table *value_table;
+	int max_reg;
+	int max_step;
 };
 
 #endif
-- 
2.34.1


