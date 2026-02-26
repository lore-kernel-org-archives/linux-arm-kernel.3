Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC88FD4606
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 02:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VvTL9zl2E0pHgity+WyT1PQ3xlkZDTPwxS+Q/lW3HJc=; b=eWSvGX3zwZTWUp3uOXdQuslIC2
	Jktd2OCWfaTcY5lr+pCAOtLRg2eLwmlraHS+a71jNyDGb6c+LDw4yCDBUXo3STXjFAn8j1iufaPI8
	Bxd/WvGrvwPqm2QiO4FkbuslnoB46kJ16DqGipiADq4l+3do0KIrV8WQzMW0uGgCEEj6wQ5QXeku2
	eHTUHvJ5+PErOViKhvgoutayt+4s5OnmfVU8rgHoUU8LN20HcsjcWAvbFUlcnvps0/I8/U3ZL5g6h
	zchb5En4dcs3RB/CKEViLA65d1i5pKSgpt/jJYPd9AkuBiubqymnA9NT7yYqEPrybaw23zlOrw1tw
	eGnGYhgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvQko-00000005DJw-1JtR;
	Thu, 26 Feb 2026 02:05:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvQkj-00000005DIO-3n89
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 02:05:22 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PKfWsQ2523596
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 02:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VvTL9zl2E0p
	Hgity+WyT1PQ3xlkZDTPwxS+Q/lW3HJc=; b=XOTfWIdMZljAAo/HDoxK/333a+Y
	smiu3eK/IVjO+v9W+2LExb/3uoXEwyj/54P+J5mrRHomOoK3linEgvYH1Pm5SHcN
	8aCWPKg4yWigdcs61r9jlk2ObK8NfBpaTwM4VqEiyqt2LBGXI2Jt5afBCKDYpUkb
	iE2FDHY4IYHnNTVPJl3jaYJl6CPXydvx+StuwnVJOsWZGsS0Ente1BnERhaAmspi
	sUJw5rH3qvfzbB39n72fwA4Fat5d1yxE+m7/yema7DKI7uLVdfJlADSYx8X80Skt
	gTel+EpKgiM+uge2/bmCIaa118a9F3l54VzjTXCcctjTocQpF0I9DltvojQ==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj8bd8pdc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 02:05:21 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6799ac3a066so4155843eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 18:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772071520; x=1772676320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VvTL9zl2E0pHgity+WyT1PQ3xlkZDTPwxS+Q/lW3HJc=;
        b=hWuoB6VUhEWUqWvEXV2SLtNvBp29IkPuUgo7zaYlBWIBmTVfhOOSiM4BtaAvY7Xn3H
         QtE6R31OqvDDkqAPRQbwAKMH+5UOBxOt7K7ZAD+kyShjaBAaILRdUdyRrzt1+F3sDOs+
         mKVaGezM7m5CaZ/+BMyKhvtC2JkQ4W9kc49vrJcW9a4JTzUMbobS0f0FYLs5bxPj6/jH
         jtSxUlxe4y+k++WRsLcK5m6QBu1FdoYx2t7GfSCVpDg5Hk5npjmJkwLfj6av+E8sqoLe
         O52vdBO9EdD4v/aUy33RbIZc3zkLne9+Y5TIIDHNnyJq4pogNKSii5QuWtiG/ZuSSmMZ
         VKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772071520; x=1772676320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VvTL9zl2E0pHgity+WyT1PQ3xlkZDTPwxS+Q/lW3HJc=;
        b=CJGNmLQ1dfhTbT0AF49aU+01xQHlYL9ENZ8pXzHlyMWNni2bC+ZZ5pkb2nGqS857B1
         Rm9l4xfsaK9Rar0Ek4fQSV/AJNe+vfpPAp6D1JvKlFaJiSBhbTruzhgOe8sG4s7ECM03
         mSfGSgJShOtTiWIolsM0PB34ggI+3oaKwZMC7Yq4LYmCBpPBGQAoGjEYhdut09n04FZM
         ngag7DIjqHHHcCPOGKYppdVMc3Fxf3Vs+rHfP637FJOcm9Ev8xEHylGwIe2w4O6U7iV3
         0fw5ipaUP50UH/jayPTgmZ8CW+/iuOzoV0UdP1h9X+I4081FEhNGbL/BqRND+6OsXlKb
         nocQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgPMENf+ABUcDSgqJWrwroPdZdoGTmnHmHhBetOYDM+gH+SA2eRXTaUn/FfaG6WQzUdlRN9JYkjcrs5b9FUs0b@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1Z0SBIju5rllDykCIPfWJ7USeXK7xE/929GuE9b7+N1ms10uh
	eXVDC2LjnqlojhhiKKvuLS6cm0GoRq+nYqwNkxJQvRKXAx6VlLq5cg1V5ANYtcP0Frul91XgBrl
	TWG5v46sAHHreShxyIKb5AxhkyI19P2QD+9jj6dgBAj+b/3oVR68xZeVtzLUiG/Vj6Yq8LuwXA/
	M75ACencWfQw==
X-Gm-Gg: ATEYQzyJMexWAANPKN4bl1O7y9ZdXco7mBiyMWJaIGfUcPUk4beIOd5xCAMNcpcOAqS
	0ETcy+RLjrIDO4FxOk/BjHy8ctgLNxRuZk6BRbX0XXdmTS04nH4Oz84r/4xvw98w2WF6PgDrxSU
	ZeVAfH5GTmbXWJch8Sdc7IXXT7YyacemFlveOnVMdcTVa2feyV+Aft9+6WFzUvQ2lK/s9KcMdk9
	tLFzGfNdAmTdr74vS6aX7BmZdKLcuLDqAMDlcer5bdtNUL1QHgHGCaaUNYxsNT0IwTpPJraLn8Q
	OO1vDp2oWOn3mgAi7IUTTxcQGV4KTF4LoicerreKuEE74zEVk1tnXSmaLMU0nOkQZ4fEVOuez8k
	fKpd+vmrbJStra9PmW7AF1uvKiXPAZrPcK18d4JQLPP1nzAle8IKNjFAiXv6nuTsaEf5MPP883W
	i7
X-Received: by 2002:a05:6820:4810:b0:679:ef92:75df with SMTP id 006d021491bc7-679ef92808amr1136161eaf.65.1772071520219;
        Wed, 25 Feb 2026 18:05:20 -0800 (PST)
X-Received: by 2002:a05:6820:4810:b0:679:ef92:75df with SMTP id 006d021491bc7-679ef92808amr1136144eaf.65.1772071519737;
        Wed, 25 Feb 2026 18:05:19 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2d9e8d6sm549939eaf.13.2026.02.25.18.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 18:05:19 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v11 3/7] qcom-tgu: Add signal priority support
Date: Wed, 25 Feb 2026 18:04:50 -0800
Message-Id: <20260226020454.3210149-4-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260226020454.3210149-1-songwei.chai@oss.qualcomm.com>
References: <20260226020454.3210149-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FKQWBuos c=1 sm=1 tr=0 ts=699faa61 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=aHbVEu0FunmFpxPyS6YA:9 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: LbPR0P-YpLWmloeWg5-2MpdO0fg7Nmjg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAxNiBTYWx0ZWRfX5z2ajvD2lMd6
 6TiAJCJv7hQ+OuH4OXcB6NxDXRNxq9y8GRWXZ7lF96AIb/8B9vNqP9w8WvDmP1sH43ZLVKUZSeU
 zU0ulZP+YeP4s1cacRnTnhOhFEHZ6a3U8lGQN4WvPishwd1vsm6HCKT96EqX6fDXFnfPEdTfzHA
 wJSK4GnCnfsXlZ5uYJ4f/YvIFSu5Xv6IwvapnNr2c4u30bKbBLdNguvHc25gPwT+3iaraiLBvUi
 X0s4/X9aMMZ7Ve0iO45EXXy+3d8XU+kGTphQ61KOmOdwbmWGWQXP+C+8i8AB1rpPDcH5EbzJwrT
 OtRcRlQhY2s7mp3aj963+jYCoJbMuq3uw0y94F+r5FS6p3oc+UjJb921xgPyiE9ehDkAkiRc4Uq
 st3CXZn/mDoJE9MVzHBn+UnzmQBIGE9d2w63t1IB/ANAdfRxTLNaPXStpfnsCD4IKn7tVf/4+Yc
 nS4a9UQmwMOPFcuumUg==
X-Proofpoint-ORIG-GUID: LbPR0P-YpLWmloeWg5-2MpdO0fg7Nmjg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_180521_977007_B876B02A 
X-CRM114-Status: GOOD (  21.50  )
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
 drivers/hwtracing/qcom/tgu.c                  | 161 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  | 114 +++++++++++++
 3 files changed, 282 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 184430d88f1c..23ba73c4db0e 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -7,3 +7,10 @@ Description:
 		Accepts only one of the 2 values -  0 or 1.
 		0 : disable TGU.
 		1 : enable TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_priority[0:3]/reg[0:17]
+Date:		February 2026
+KernelVersion	6.20
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the sensed signal with specific step and priority for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 58c19f12f3d7..14d6ad410d89 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -14,14 +14,123 @@
 
 #include "tgu.h"
 
+static int calculate_array_location(struct tgu_drvdata *drvdata,
+				    int step_index, int operation_index,
+				    int reg_index)
+{
+	return operation_index * (drvdata->num_step) * (drvdata->num_reg) +
+		step_index * (drvdata->num_reg) + reg_index;
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
+	int ret;
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
+
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
+
+	if (tgu_attr->step_index >= drvdata->num_step)
+		return SYSFS_GROUP_INVISIBLE;
+
+	if (tgu_attr->reg_num >= drvdata->num_reg)
+		return 0;
+
+	return attr->mode;
+}
+
 static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 {
+	int i, j, k, index;
+
 	TGU_UNLOCK(drvdata->base);
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < MAX_PRIORITY; j++) {
+			for (k = 0; k < drvdata->num_reg; k++) {
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
+	num_reg = (num_sense_input * TGU_BITS_PER_SIGNAL) / LENGTH_REGISTER;
+
+	if ((num_sense_input * TGU_BITS_PER_SIGNAL) % LENGTH_REGISTER)
+		num_reg++;
+
+	drvdata->num_reg = num_reg;
+}
+
+static void tgu_set_steps(struct tgu_drvdata *drvdata)
+{
+	u32 devid;
+
+	devid = readl(drvdata->base + TGU_DEVID);
+
+	drvdata->num_step = TGU_DEVID_STEPS(devid);
+}
+
 static int tgu_enable(struct device *dev)
 {
 	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
@@ -111,6 +220,38 @@ static const struct attribute_group tgu_common_grp = {
 
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
 
@@ -118,6 +259,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
+	unsigned int *priority;
+	size_t priority_size;
 	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -133,12 +276,30 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
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
+	priority_size = MAX_PRIORITY * drvdata->num_reg * drvdata->num_step;
+
+	priority = devm_kcalloc(dev, priority_size,
+				sizeof(*drvdata->value_table->priority),
+				GFP_KERNEL);
+	if (!priority)
+		return -ENOMEM;
+
+	drvdata->value_table->priority = priority;
+
 	drvdata->enabled = false;
 
 	pm_runtime_put(&adev->dev);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index dd7533b9d735..970292f91b02 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -10,6 +10,114 @@
 #define TGU_CONTROL		0x0000
 #define TGU_LAR		0xfb0
 #define TGU_UNLOCK_OFFSET	0xc5acce55
+#define TGU_DEVID		0xfc8
+
+#define TGU_DEVID_SENSE_INPUT(devid_val) \
+	((int)FIELD_GET(GENMASK(17, 10), devid_val))
+#define TGU_DEVID_STEPS(devid_val) \
+	((int)FIELD_GET(GENMASK(6, 3), devid_val))
+#define TGU_BITS_PER_SIGNAL	4
+#define LENGTH_REGISTER	32
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
+#define STEP_OFFSET			0x1D8
+#define PRIORITY_START_OFFSET		0x0074
+#define PRIORITY_OFFSET		0x60
+#define REG_OFFSET			0x4
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
+#define STEP_PRIORITY_LIST(step_index, priority) \
+	{STEP_PRIORITY(step_index, 0, priority), \
+	 STEP_PRIORITY(step_index, 1, priority),  \
+	 STEP_PRIORITY(step_index, 2, priority),	 \
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
@@ -35,6 +143,9 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @dev: Pointer to the associated device structure
  * @lock: Spinlock for handling concurrent access to private data
  * @enabled: Flag indicating whether the TGU device is enabled
+ * @value_table: Store given value based on relevant parameters
+ * @num_reg: Maximum number of registers
+ * @num_step: Maximum step size
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -46,6 +157,9 @@ struct tgu_drvdata {
 	struct device *dev;
 	spinlock_t lock;
 	bool enabled;
+	struct value_table *value_table;
+	int num_reg;
+	int num_step;
 };
 
 #endif
-- 
2.34.1


