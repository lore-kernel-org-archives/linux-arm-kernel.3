Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F267CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 06:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RO8fIpOHfqmxM+0mgaFLjsUaSf8VFX1gHKMlkhde3Y=; b=fbtFk4d715w7FFsTAHQM4+tjdo
	BfjhGpiksUzZG70lvvqNxqcT4BiTeg9Ixe62fHcA1nqk+9vYBv+4Y/U2Ld04sz6GzjvelGkRTZqLE
	aqh87TYzqls6tI57ZG0Qlj1i2DBv9kEEtjDcz96Exp4uYRXPRG4sqdiv1V3TFCtOjWAfWrf52NHMQ
	k7htSU6EciU/9XJprWI+ep3ozmCyHwfZURNMYJ9ZKji9qtaT1d0dh6H/ucEPfJvvyfWj4OvXdNiCM
	iWRJ9Ads20sUmREz03a21MzytfVIIb8nE9w92hI6qrWwZyV2+NDFN1bOaluSDnn1LWpBp26gw7RTj
	UyOu2t3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGAkC-0000000BFTt-3jnJ;
	Tue, 04 Nov 2025 06:42:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGAk9-0000000BFRY-3jfL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 06:42:15 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A42dc253693721
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Nov 2025 06:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2RO8fIpOHfq
	mxM+0mgaFLjsUaSf8VFX1gHKMlkhde3Y=; b=MsTFuudgKWhkeEo2ZvbTQPqtRnY
	VM9MHxR2CJ0askIQnK59Slb0LrjMg2l/tyjEsNZm6FTFDTMkfgkQ2PHVjOc2Ex1m
	BQWLMU5YPgwHpXnvuVGH1IIjdXn6O/+pVfDg2RZeFntR53g04D/WAekH6qZ46wmQ
	WFyoxG9HVr4TMwHbRUZmapa9lA0HyzgoqntpqgPcycPokExACmm4sl7YJaU6PhFc
	457HxaPk6Oo7GpvamATy72Prb6bGY82di//AF7N4LiRci5xzTIxNNrcpUKSxvccT
	57ELM8sZQQI9a8L0i7nuWKoE1xL6RZBgdHdEbTi7hlQ0/3C/UH5ZR2lJyjA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6u8b2w12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 06:42:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32eb18b5659so4436110a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 22:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762238532; x=1762843332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RO8fIpOHfqmxM+0mgaFLjsUaSf8VFX1gHKMlkhde3Y=;
        b=APLq1m6pBYgaU06YU0B7SwDJbc6oEStYZFq1nnKfmtEINo29G3I9o5gyHmhSky/F+2
         qvL1F8ylmYy2nHqF5xlCPhBjzdQ2pqBef70V0ILd8Rdp0ckn1Tu98pyHMDhM6Tl7kgiK
         MuvaCWCR96ie7PwhgXgYhTnop5nQ/38Yc9B/EYibP8e7oaHkQPlOW4r+YcK7QJQ9KM9y
         ETT7pEV2mAc1JzejzCdTruzSsPqf9q9IZe9Qshs5Mwxhkn6IBWqPuTqTILn36YJyXYim
         hlWnwuuwfFBBAhaRqKOSEe9JqyHEbIB+s6951YrFBr+f+q7yVoqthtvK4LY2USqeRzy6
         0Opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762238532; x=1762843332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RO8fIpOHfqmxM+0mgaFLjsUaSf8VFX1gHKMlkhde3Y=;
        b=XBVGOftjV78jcVQoPIau3xx+8uYo67umdR3V4ExN/rXzkF51Lfvc2ITYZtoUOhJrQY
         K5kGXnbxk8F+rq9qDpOx02mdN57eNAxk5g7vs6NemEMVCOj2QMl+W5ugAV7qFdoK6/K4
         YvIGK8oBRnyfYo6J0kcl1tptOg0jecl1TsyFj4spKtA3GiHf6spiTETsHKiEsdmL3mwH
         RP8wQtVpEuZmr3/Qpj442diiDEQCSUGRslDNZwilrdEQjJ275GrB0daSZbtNGbGxyrNP
         jnSRwLi2SRZt9EeyyrkZelaP7fxedDNP/rz4wXcDclNKXLGhDCRnxJXJ6AbP+MW2ZFj3
         NF1w==
X-Forwarded-Encrypted: i=1; AJvYcCVI+5fVaoiQCSjo8Wy5u+0tG3VWbMjAmOVqZ+9+VeJKdfowKsDscDGPQkMvT3WMOQbrKSCAodL6P+aCgEjypptk@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg/mL5nBOcDP5oKA/Enj73b/DtporAtWBBoqFdo530isO6Z1Nw
	ShDJbzoVG8CkFpz6+igXX0ImB0gz4k0vA/plJHsWQeKaFuEUni5UEB9g/jfAHT760Gx1TgJtQXV
	jls0Xq6dh+FhYJUVGcFag2vnMvdxtd7KF+IJB7sixmq3kKzzWLpVcjCUiGX4x1gZS5RozD6iwZY
	dDnQ==
X-Gm-Gg: ASbGncuLOr6nJTIe1nOUjkHTsQYgKluMub7SuJtWIy515h782p10u9/WTw9Iq3ylY/B
	GPFoIMygf9JWMtXLvBC7YhyOXOyFoej0SXlF51b8SqeaN4VZIyaqPSOIvsr8LfXqxai5M0onQtq
	am4GgyRyIP9Gwdnmy4FcaxsGWeLavKd08uqA1jankjzpa/X5+6staxD6Wb+R2w0qFOWpvZBP2rx
	O5uWnV+uJ0uana8ebNEu9tX5YNrUPESLejWITPUhU328/VdSsG1l4Ud/FybkL66BjUkEnpl14gc
	orTs2R/en5o3uaprT6zGyJdDEkox+QwKy7f8rZAROELlTvO4TQLHkW9Am8VNnxOpV4CTg7MEpze
	QXlorJL5kI187R1yDGbl8oi/vRB+D2YgEuyQ8meliDOQgIS4AiIFKsA==
X-Received: by 2002:a17:90b:3fc6:b0:340:ca32:bcad with SMTP id 98e67ed59e1d1-340ca32bdadmr11870461a91.19.1762238531710;
        Mon, 03 Nov 2025 22:42:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGaDGJ5kHqXdsHNG3Ni7vTzkdk26k/VRa7ZAhaz4muWnIrhrMWUOVIJK8FEKySBHz5CIyXpYg==
X-Received: by 2002:a17:90b:3fc6:b0:340:ca32:bcad with SMTP id 98e67ed59e1d1-340ca32bdadmr11870429a91.19.1762238531103;
        Mon, 03 Nov 2025 22:42:11 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34159a0780dsm3294791a91.16.2025.11.03.22.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 22:42:10 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v7 3/7] qcom-tgu: Add signal priority support
Date: Mon,  3 Nov 2025 22:40:39 -0800
Message-Id: <20251104064043.88972-4-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104064043.88972-1-songwei.chai@oss.qualcomm.com>
References: <20251104064043.88972-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA1MyBTYWx0ZWRfX9UJISTmf3lnQ
 1lzdNKJbkC/To2aXfALu6Vxjn0b/eXp9/+zUEJXb8YAHOqqiuwc4ggGfBEfvRdjIt8KpqIaL8P2
 lRHLtS5v3UjsruLC2JUT4Pd62Y4UV4nI6TCXACLbQC7Ars+DmggIDkxAyCH7lgVyc20DZVYw7pK
 +htczc7oshaSbBCzERaJGw5p2NxbbQxCo4M6LYMU7BueQaMksL/y2X/SejBcfTRp7mzCigWJNPs
 7IP8vCJ6gJ1MO4LZs7m9hEXPy//VDvGsD1vDVgcRU1HD5EufeGzvfGtHmbPcqP52uujCbeV7efa
 +Hla875/sflS/+3cViyPxop7dQo8wahmq0dloVgvk+uPxCgFurRBumE6rlxvRjKqlUD6OeuB1Uz
 eKUDKNC9sgZ2om1wyKPVm6dSnuoSNw==
X-Proofpoint-GUID: F35U2-TF8kUrTVXMr3UighnqPlj10VEe
X-Authority-Analysis: v=2.4 cv=Ha8ZjyE8 c=1 sm=1 tr=0 ts=6909a044 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=HMmvC-cB1bDe2h_eLOYA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: F35U2-TF8kUrTVXMr3UighnqPlj10VEe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_224214_058684_24619D5E 
X-CRM114-Status: GOOD (  21.32  )
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
 .../testing/sysfs-bus-coresight-devices-tgu   |   7 +
 drivers/hwtracing/qcom/tgu.c                  | 155 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  | 111 +++++++++++++
 3 files changed, 273 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
index 17d8449599a1..082fddac9ff0 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -7,3 +7,10 @@ Description:
 		Accepts only one of the 2 values -  0 or 1.
 		0 : disable TGU.
 		1 : enable TGU.
+
+What:		/sys/bus/coresight/devices/<tgu-name>/step[0:7]_priority[0:3]/reg[0:17]
+Date:		November 2025
+KernelVersion	6.18
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the sensed signal with specific step and priority for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 368bb196b984..a1ad8d97e9d2 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -17,14 +17,120 @@
 
 DEFINE_CORESIGHT_DEVLIST(tgu_devs, "tgu");
 
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
+	int index;
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct tgu_attribute *tgu_attr =
+			container_of(attr, struct tgu_attribute, attr);
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
+	int index;
+	unsigned long val;
+
+	struct tgu_drvdata *tgu_drvdata = dev_get_drvdata(dev->parent);
+	struct tgu_attribute *tgu_attr =
+		container_of(attr, struct tgu_attribute, attr);
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
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
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	int ret = SYSFS_GROUP_INVISIBLE;
+
+	struct device_attribute *dev_attr =
+		container_of(attr, struct device_attribute, attr);
+	struct tgu_attribute *tgu_attr =
+		container_of(dev_attr, struct tgu_attribute, attr);
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
 	CS_UNLOCK(drvdata->base);
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
 	CS_LOCK(drvdata->base);
 }
 
+static void tgu_set_reg_number(struct tgu_drvdata *drvdata)
+{
+	int num_sense_input;
+	int num_reg;
+	u32 devid;
+
+	devid = readl(drvdata->base + CORESIGHT_DEVID);
+
+	num_sense_input = TGU_DEVID_SENSE_INPUT(devid);
+	if (((num_sense_input * NUMBER_BITS_EACH_SIGNAL) % LENGTH_REGISTER) == 0)
+		num_reg = (num_sense_input * NUMBER_BITS_EACH_SIGNAL) / LENGTH_REGISTER;
+	else
+		num_reg = ((num_sense_input * NUMBER_BITS_EACH_SIGNAL) / LENGTH_REGISTER) + 1;
+	drvdata->max_reg = num_reg;
+}
+
+static void tgu_set_steps(struct tgu_drvdata *drvdata)
+{
+	u32 devid;
+
+	devid = readl(drvdata->base + CORESIGHT_DEVID);
+
+	drvdata->max_step = TGU_DEVID_STEPS(devid);
+}
+
 static int tgu_enable(struct coresight_device *csdev, enum cs_mode mode,
 		      void *data)
 {
@@ -122,6 +228,38 @@ static const struct attribute_group tgu_common_grp = {
 
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
 
@@ -156,6 +294,23 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	spin_lock_init(&drvdata->lock);
 
+	tgu_set_reg_number(drvdata);
+	tgu_set_steps(drvdata);
+
+	drvdata->value_table =
+		devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
+	if (!drvdata->value_table)
+		return -ENOMEM;
+
+	drvdata->value_table->priority = devm_kzalloc(
+		dev,
+		MAX_PRIORITY * drvdata->max_reg * drvdata->max_step *
+			sizeof(*(drvdata->value_table->priority)),
+		GFP_KERNEL);
+
+	if (!drvdata->value_table->priority)
+		return -ENOMEM;
+
 	drvdata->enable = false;
 	desc.type = CORESIGHT_DEV_TYPE_HELPER;
 	desc.pdata = adev->dev.platform_data;
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index 1a55da90f521..444804e52337 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -9,6 +9,111 @@
 /* Register addresses */
 #define TGU_CONTROL 0x0000
 
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
+
 /**
  * struct tgu_drvdata - Data structure for a TGU (Trigger Generator Unit)
  * @base: Memory-mapped base address of the TGU device
@@ -16,6 +121,9 @@
  * @csdev: Pointer to the associated coresight device
  * @lock: Spinlock for handling concurrent access
  * @enable: Flag indicating whether the TGU device is enabled
+ * @value_table: Store given value based on relevant parameters.
+ * @max_reg: Maximum number of registers
+ * @max_step: Maximum step size
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -28,6 +136,9 @@ struct tgu_drvdata {
 	struct coresight_device *csdev;
 	spinlock_t lock;
 	bool enable;
+	struct value_table *value_table;
+	int max_reg;
+	int max_step;
 };
 
 #endif
-- 
2.34.1


